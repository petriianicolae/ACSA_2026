# python make_risk_figures.py --medini 1_.xlsx --llm 2_.xlsx --out figures/
import argparse
import os
from decimal import Decimal, ROUND_HALF_UP

import numpy as np
import pandas as pd
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import font_manager as fm
from matplotlib.patches import Rectangle

# --------------------------------------------------------------------------------------
# Style
# --------------------------------------------------------------------------------------
LEV = ["Critical", "High", "Medium", "Low"]
LCOL = {"Critical": "#E24B4A", "High": "#F5A55A", "Medium": "#FBDC72", "Low": "#A6D99A"}
LTXT = {"Critical": "white", "High": "#3a2a10", "Medium": "#3a3310", "Low": "#1d3a18"}
C_MED, C_LLM = "#17607F", "#E97132"
VABB = {"Local": "L", "Adjacent": "A", "Network": "N"}


def setup_fonts():
    """Use a Times-like font to match the paper; fall back gracefully."""
    gyre = "/usr/share/texmf/fonts/opentype/public/tex-gyre/"
    family = None
    if os.path.isdir(gyre):
        for f in ["texgyretermes-regular.otf", "texgyretermes-bold.otf",
                  "texgyretermes-italic.otf", "texgyretermes-bolditalic.otf"]:
            if os.path.exists(gyre + f):
                fm.fontManager.addfont(gyre + f)
                family = "TeX Gyre Termes"
    if family is None:
        installed = {f.name for f in fm.fontManager.ttflist}
        family = next((n for n in ["Times New Roman", "Liberation Serif", "Nimbus Roman"]
                       if n in installed), "serif")
    plt.rcParams.update({
        "font.family": family, "font.size": 9, "axes.linewidth": 0.6,
        "savefig.dpi": 300, "mathtext.fontset": "stix",
        "axes.edgecolor": "#444444", "xtick.color": "#333333", "ytick.color": "#333333",
    })


def f1(x):
    """Round half up to one decimal (60.25 -> 60.3), as in the tables."""
    return str(Decimal(str(float(x))).quantize(Decimal("0.1"), rounding=ROUND_HALF_UP))


def risk_level(r):
    return "Critical" if r >= 100 else "High" if r >= 49 else "Medium" if r >= 16 else "Low"


# --------------------------------------------------------------------------------------
# Data
# --------------------------------------------------------------------------------------
STRIDE = {"spoofing": "S", "tampering": "T", "repudiation": "R",
          "information disclosure": "I", "denial of service": "D",
          "elevation of privilege": "E"}

# medini component name -> architecture element
COMPONENTS = {
    "Mono + Stereo": "Cameras", "YOLOv5 fast path": "Edge detector",
    "Agent 1, MLLM call": "Agent 1", "Agent 2, Depth Pro": "Agent 2",
    "Agent 3, MLLM call": "Agent 3", "ASN.1 UPER payload": "DENM encoder",
    "Signs, PC5, HSM": "RSU", "PC5 + Uumodem": "OBU",
    "Verify, warning logic": "Vehicle computer", "Visual + audio alert": "Driver HMI",
    "Gemini API": "Cloud MLLM", "PKI, operator": "Central ITS-S",
}
# medini connection name -> link group
LINKS = {
    "image_out ↔ image_in": "Intra-station links",
    "detections_out ↔ detections_in": "Intra-station links",
    "hazard_out ↔ hazard_in": "Intra-station links",
    "distance_out ↔ distance_in": "Intra-station links",
    "content_out ↔ content_in": "Intra-station links",
    "denm_out ↔ denm_in": "Intra-station links",
    "mllm_request ↔ mllm_in": "5G Uu links",
    "uu_mllm_link ↔ mllm_link_1": "5G Uu links",
    "mllm_request ↔ mllm_in_2": "5G Uu links",
    "uu_mllm_link ↔ mllm_link_2": "5G Uu links",
    "uu_uplink ↔ uu_in": "5G Uu links",
    "uu_link ↔ uu_link_rsu": "5G Uu links",
    "uu_modem ↔ uu_in_2": "5G Uu links",
    "uu_modem_out ↔ uu_modem": "5G Uu links",
    "pc5_out ↔ pc5_in": "PC5 sidelink",
    "warning_out ↔ warning_in": "In-vehicle links",
    "alert_out ↔ alert_in": "In-vehicle links",
}


def medini_element(asset):
    """Return (element type, architecture group) for a medini 'Assets' string."""
    a = asset.replace("•", "").strip()
    if "↔" in a:
        etype, key, table = "Connection", a, LINKS
    elif "::" in a:
        etype, key, table = "Port", a.split("::")[0], COMPONENTS
    else:
        etype, key, table = "Component", a, COMPONENTS
    if key not in table:
        raise KeyError(f"Unmapped medini element '{key}'. Add it to COMPONENTS or LINKS.")
    return etype, table[key]


def load(medini_path, llm_path, medini_sheet="Paper_1"):
    m = pd.read_excel(medini_path, sheet_name=medini_sheet)
    l = pd.read_excel(llm_path)

    m["st"] = m["Category"].str.strip().str.lower().map(STRIDE)
    l["st"] = l["STRIDE"].str.strip().str.lower().map(STRIDE)
    for name, d, col in [("medini", m, "Category"), ("LLM", l, "STRIDE")]:
        bad = d.loc[d["st"].isna(), col].unique()
        if len(bad):
            raise ValueError(f"Unknown STRIDE labels in {name} sheet: {list(bad)}")

    m[["etype", "group"]] = m["Assets"].apply(lambda a: pd.Series(medini_element(a)))

    m = m.rename(columns={"Risk score": "R", "Risk Value": "lev",
                          "Attack vector": "vec", "Severity Level": "sev"})
    l = l.rename(columns={"Risk Score": "R", "Risk Level": "lev",
                          "Attack Vector": "vec", "Severity Level": "sev"})
    for d in (m, l):
        for c in ("lev", "vec", "sev"):
            d[c] = d[c].astype(str).str.strip()
    return m, l


# --------------------------------------------------------------------------------------
# Figure 1: distribution of risk values
# --------------------------------------------------------------------------------------
def fig_distribution(m, l, path):
    fig, ax = plt.subplots(figsize=(3.5, 2.4))
    x, w = np.arange(4), 0.36
    ymax = 0
    for k, (d, c, lab) in enumerate([(m, C_MED, f"medini analyze ($n$ = {len(m)})"),
                                     (l, C_LLM, f"LLM scenarios ($n$ = {len(l)})")]):
        cnt = d["lev"].value_counts().reindex(LEV).fillna(0).astype(int)
        pct = cnt / len(d) * 100
        ymax = max(ymax, pct.max())
        ax.bar(x + (k - 0.5) * w, pct, w * 0.92, color=c, label=lab, zorder=3)
        for xi, p, n in zip(x + (k - 0.5) * w, pct, cnt):
            ax.text(xi, p + 0.8, f"{n}", ha="center", va="bottom", fontsize=7.5, color="#222")
    ax.set_xticks(x)
    ax.set_xticklabels(LEV)
    ax.set_ylabel("Share of the set (%)")
    ax.set_ylim(0, ymax + 4)
    ax.yaxis.grid(True, color="#dddddd", lw=0.5, zorder=0)
    ax.set_axisbelow(True)
    for s in ["top", "right"]:
        ax.spines[s].set_visible(False)
    ax.legend(frameon=False, fontsize=7.8, loc="lower center", bbox_to_anchor=(0.5, 1.0),
              ncol=2, handlelength=1.0, columnspacing=1.2)
    fig.tight_layout(pad=0.3)
    fig.savefig(path)
    plt.close(fig)


# --------------------------------------------------------------------------------------
# Figure 2: risk matrices (cells with mixed risk values are split proportionally)
# --------------------------------------------------------------------------------------
def fig_matrix(m, l, path):
    SEV = ["Severe", "Major", "Moderate", "Negligible"]
    VEC = ["Physical", "Local", "Adjacent", "Network"]
    VV = [1, 4, 7, 10]
    ABBR = {"Critical": "C", "High": "H", "Medium": "M", "Low": "L"}

    fig, axs = plt.subplots(1, 2, figsize=(7.16, 2.75))
    panels = [(m, f"(a) medini analyze, {len(m)} threats"),
              (l, f"(b) LLM scenarios, {len(l)} scenarios")]
    for ax, (d, title) in zip(axs, panels):
        for i, s in enumerate(SEV):
            for j, v in enumerate(VEC):
                sub = d[(d["sev"] == s) & (d["vec"] == v)]
                y = len(SEV) - 1 - i
                if len(sub) == 0:
                    ax.add_patch(Rectangle((j, y), 1, 1, fc="white", ec="#c8c8c8", lw=0.6))
                    ax.text(j + .5, y + .5, "–", ha="center", va="center",
                            color="#aaaaaa", fontsize=9)
                    continue
                cnt = sub["lev"].value_counts().reindex(LEV).dropna().astype(int)
                x0 = j
                for lv, n in cnt.items():
                    wdt = n / len(sub)
                    ax.add_patch(Rectangle((x0, y), wdt, 1, fc=LCOL[lv], ec="none"))
                    x0 += wdt
                ax.add_patch(Rectangle((j, y), 1, 1, fc="none", ec="#222222", lw=0.9))
                dom = cnt.idxmax()
                ax.text(j + .5, y + .62, str(len(sub)), ha="center", va="center",
                        fontsize=11, fontweight="bold", color=LTXT[dom])
                lab = dom if len(cnt) == 1 else " / ".join(f"{n} {ABBR[k]}" for k, n in cnt.items())
                ax.text(j + .5, y + .28, lab, ha="center", va="center", fontsize=7.3, color=LTXT[dom])
        ax.set_xlim(0, 4)
        ax.set_ylim(0, 4)
        ax.set_xticks(np.arange(4) + .5)
        ax.set_xticklabels([f"{v}\n({n})" for v, n in zip(VEC, VV)], fontsize=8)
        ax.set_yticks(np.arange(4) + .5)
        ax.set_yticklabels(SEV[::-1], fontsize=8)
        ax.tick_params(length=0)
        for sp in ax.spines.values():
            sp.set_visible(False)
        ax.set_title(title, fontsize=9, pad=4)
        ax.set_xlabel("Attack feasibility (attack vector)", fontsize=8.5)
    axs[0].set_ylabel("Impact severity", fontsize=8.5)
    handles = [Rectangle((0, 0), 1, 1, fc=LCOL[k], ec="#555", lw=0.4) for k in LEV]
    fig.legend(handles, LEV, loc="lower center", ncol=4, frameon=False, fontsize=8,
               bbox_to_anchor=(0.5, -0.01), handlelength=1.1)
    fig.tight_layout(rect=(0, 0.06, 1, 1), w_pad=2.0)
    fig.savefig(path)
    plt.close(fig)


# --------------------------------------------------------------------------------------
# Figure 3: medini heatmap, element x STRIDE (highest score in the cell)
# --------------------------------------------------------------------------------------
HEATMAP_ROWS = [
    ("Roadside station", [("Cameras", "Cameras", "1"), ("Edge detector", "Edge detector", "2"),
                          ("Agent 1", "Agent 1, situation", "3"), ("Agent 2", "Agent 2, distance", "5"),
                          ("Agent 3", "Agent 3, message", "6"), ("DENM encoder", "DENM encoder", "8"),
                          ("RSU", "RSU", "9")]),
    ("Cloud and back end", [("Cloud MLLM", "Cloud MLLM", "4, 7"),
                            ("Central ITS-S", "Central ITS-S", "10")]),
    ("Vehicle", [("OBU", "OBU", "11"), ("Vehicle computer", "Vehicle computer", "12"),
                 ("Driver HMI", "Driver HMI", "13")]),
    ("Connections", [("Intra-station links", "Intra-station links", ""),
                     ("5G Uu links", "5G Uu links", ""), ("PC5 sidelink", "PC5 sidelink", ""),
                     ("In-vehicle links", "In-vehicle links", "")]),
]

# --------------------------------------------------------------------------------------
# Figure 4: STRIDE composition, stacked by risk value
# --------------------------------------------------------------------------------------
def fig_stride(m, l, path):
    ST = ["S", "T", "R", "I", "D", "E"]
    NAMES = {"S": "Spoofing", "T": "Tampering", "R": "Repudiation",
             "I": "Info. disclosure", "D": "Denial of service", "E": "Elev. of privilege"}
    tabs = [pd.crosstab(d["st"], d["lev"]).reindex(index=ST, columns=LEV).fillna(0).astype(int)
            for d in (m, l)]
    xmax = [int(t.sum(axis=1).max()) + 7 for t in tabs]  # room for the total labels

    fig, axs = plt.subplots(1, 2, figsize=(3.5, 2.2), sharey=True,
                            gridspec_kw={"width_ratios": xmax})
    for ax, ct, title, xm in zip(axs, tabs, ["medini analyze", "LLM scenarios"], xmax):
        y = np.arange(len(ST))[::-1]
        left = np.zeros(len(ST))
        for lv in LEV:
            v = ct[lv].values
            ax.barh(y, v, left=left, color=LCOL[lv], height=0.72,
                    edgecolor="white", lw=0.5, zorder=3)
            for yi, li, vi in zip(y, left, v):
                if vi >= 4:
                    ax.text(li + vi / 2, yi, str(vi), ha="center", va="center",
                            fontsize=6.6, color=LTXT[lv])
            left += v
        for yi, t in zip(y, left):
            ax.text(t + 1, yi, str(int(t)), ha="left", va="center", fontsize=6.8, color="#333")
        ax.set_xlim(0, xm)
        ax.set_xticks(range(0, xm + 1, 20))
        ax.set_title(title, fontsize=8.5, pad=3)
        ax.xaxis.grid(True, color="#e2e2e2", lw=0.5, zorder=0)
        for s in ["top", "right"]:
            ax.spines[s].set_visible(False)
        ax.tick_params(labelsize=7.5, length=2)
    axs[0].set_yticks(np.arange(len(ST))[::-1])
    axs[0].set_yticklabels([NAMES[s] for s in ST], fontsize=7.8)
    handles = [Rectangle((0, 0), 1, 1, fc=LCOL[k]) for k in LEV]
    fig.legend(handles, LEV, loc="lower center", ncol=4, frameon=False, fontsize=7.5,
               bbox_to_anchor=(0.6, -0.025), handlelength=1.0, columnspacing=1.0)
    fig.tight_layout(rect=(0, 0.07, 1, 1), w_pad=0.6)
    fig.savefig(path)
    plt.close(fig)


# --------------------------------------------------------------------------------------
def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--medini", default="1_.xlsx", help="medini risk assessment export")
    p.add_argument("--llm", default="2_.xlsx", help="LLM scenario worksheet")
    p.add_argument("--sheet", default="Paper_1", help="sheet name in the medini workbook")
    p.add_argument("--out", default=".", help="output directory")
    args = p.parse_args()

    setup_fonts()
    os.makedirs(args.out, exist_ok=True)
    m, l = load(args.medini, args.llm, args.sheet)

    fig_distribution(m, l, os.path.join(args.out, "fig_risk_distribution.png"))
    fig_matrix(m, l, os.path.join(args.out, "fig_risk_matrix.png"))
    fig_stride(m, l, os.path.join(args.out, "fig_risk_stride.png"))
    print(f"medini: {len(m)} threats, LLM: {len(l)} scenarios -> figures written to {args.out}")


if __name__ == "__main__":
    main()
