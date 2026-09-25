# Draw figures for the LLM and Medini threat scenario analysis.
import re, json, csv, sys, statistics as st
from collections import Counter
from pathlib import Path
import numpy as np, matplotlib; matplotlib.use('Agg'); import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parent.parent
DATA, FIG = ROOT/'data', ROOT/'figures'; FIG.mkdir(exist_ok=True)
M = ['ChatGPT','Gemini','Sonnet','Opus','Copilot','DeepSeek','Medini']
LBL = ['ChatGPT\n(GPT-5.6)','Gemini\n(3.1 Pro)','Claude\nSonnet 5','Claude\nOpus 5*','Copilot\n(free)','DeepSeek\n(4.1 Flash)','Medini\n2025 R1.01']
S, SN = 'STRIDE', ['Spoofing','Tampering','Repudiation','Info. Disclosure','Denial of Service','Elev. of Privilege']
LETTER = dict(zip(['spoofing','tampering','repudiation','information disclosure','denial of service','elevation of privilege'], S))
CODE = json.load(open(Path(__file__).parent/'manual_coding.json'))
plt.rcParams.update({'font.family':'DejaVu Serif','font.size':9})

def parse(md):
    out = {}
    for line, m in zip(md.read_text().split('\n')[16:22], M[:6]):
        name, ver, raw = line.split(' | ', 2)
        raw = raw.strip().rstrip('|').replace('&nbsp;', ' ').replace('<br>', ' ')
        raw = re.sub(r'\\([\[\]\+\-_\.\*#&!\(\)`~<>])', r'\1', raw)   # markdown escapes
        raw = re.sub(r'\[cite:[^\]]*\]', '', raw)                      # Gemini citation artefacts
        out[m] = (f"{name.strip('| *')} {ver.replace('&nbsp;','').strip()}", json.loads(raw))
    return out

def flatten(parsed):
    rows = []
    for m, (full, assets) in parsed.items():
        for a in assets:
            for t in next(v for k, v in a.items() if 'hreat' in k):
                if isinstance(t, str):                                  # "Spoofing: text" format
                    lab, _, sc = t.partition(':'); sid = ''
                else:
                    lab, sc, sid = t['STRIDE'], t['Scenario'], t.get('ID', '')
                lab = lab.strip()
                rows.append(dict(m=m, model=full, asset=a['Asset'], stride=lab,
                                 s=LETTER[lab.lower()], scenario=sc.strip(), id=sid))
    return rows

def load_medini(path):
    with open(path, newline='', encoding='utf-8') as f:
        return [dict(m='Medini', model=r['model_full'], asset=r['asset'],
                     stride=r['stride_label'], s=r['stride_letter'],
                     scenario=r['scenario'], id=r['scenario_id'])
                for r in csv.DictReader(f)]

def save(name):
    for ext in ('png', 'pdf'): plt.savefig(FIG/f'{name}.{ext}', dpi=300, bbox_inches='tight')
    plt.close()

def write_csv(path, header, rows):
    with open(path, 'w', newline='', encoding='utf-8') as f: csv.writer(f).writerows([header, *rows])

parsed = parse(DATA/'processing_of_the_LLM_JSON_Threads_analysis.md')
rows = flatten(parsed)
rows.extend(load_medini(ROOT/'files'/'medini_scenarios.csv'))
json.dump({v[0]: v[1] for v in parsed.values()}, open(DATA/'all.json', 'w'), indent=1)
json.dump(rows, open(DATA/'rows.json', 'w'), indent=1)
write_csv(DATA/'all_scenarios.csv', ['model_short','model_full','asset','stride_letter','stride_label','scenario','scenario_id'],
          [[r['m'], r['model'], r['asset'], r['s'], r['stride'], r['scenario'], r['id']] for r in rows])
cnt = np.array([[Counter(r['s'] for r in rows if r['m'] == m)[s] for s in S] for m in M])
tot = cnt.sum(1)
print('Scenarios per model:', dict(zip(M, tot.tolist())), '| total', tot.sum())

# Fig 1: stacked STRIDE counts
colors = ['#4C78A8', '#F58518', '#54A24B', '#E45756', '#72B7B2', '#B279A2']

fig, ax = plt.subplots(figsize=(6.5, 4.6)); bottom = np.zeros(len(M))
for i, (col) in enumerate(zip(colors)):
    ax.bar(range(len(M)), cnt[:, i], bottom=bottom, color=colors[i], edgecolor='black', lw=.5, label=SN[i]); bottom += cnt[:, i]
for i, b in enumerate(bottom): ax.text(i, b + 1.5, int(b), ha='center', fontsize=8)
ax.set_xlim(-.5, len(M) - .5); ax.set_xticks([]); ax.set_ylabel('Number of threat scenarios'); ax.set_ylim(0, bottom.max() * 1.12)
ax.spines[['top', 'right']].set_visible(False)
tbl = ax.table(cellText=cnt.T.astype(str), rowLabels=SN, rowColours=colors, colLabels=LBL, cellLoc='center', loc='bottom')
tbl.auto_set_font_size(False); tbl.set_fontsize(7)
for (r, c), cell in tbl.get_celld().items():
    cell.set_linewidth(.4)
    if r == 0: cell.set_height(cell.get_height() * 2.2); cell.visible_edges = 'B'
    if c == -1: cell.get_text().set_color('white')
plt.tight_layout(); save('fig1_stride_distribution')
# Figure 1 end.

# Fig 2: Theme consensus matrix (Uses manual_coding.json)
T = list(CODE['themes']); A = np.array([[int(c) for c in CODE['themes'][t]] for t in T])
fig, ax = plt.subplots(figsize=(7.4, 6.2))
ax.imshow(A, cmap=matplotlib.colors.ListedColormap(['white', "#1C54A2"]), aspect='auto')
for i in range(len(T)):
    for j in range(len(M)): ax.add_patch(plt.Rectangle((j - .5, i - .5), 1, 1, fill=False, lw=.4, ec='grey'))
    ax.text(len(M), i, f'{A[i].sum()}/{len(M)}', va='center', fontsize=8)
ax.set_xticks(range(len(M)), LBL, fontsize=7); ax.xaxis.tick_top(); ax.set_yticks(range(len(T)), T, fontsize=8); ax.set_xlim(-.5, len(M) + .6)
ax.axhline((A.sum(1) == len(M)).sum() - .5, color='black', lw=1.2, ls='--')  # line separating fully covered themes
plt.tight_layout(); save('fig2_threat_consensus_matrix')

# Tables
write_csv(FIG/'threat_theme_coding.csv', ['Threat theme', *M, f'Models (n/{len(M)})'], [[t, *a, a.sum()] for t, a in zip(T, A)])
write_csv(FIG/'stride_label_inconsistency.csv', ['Attack', *M], [[k, *v] for k, v in CODE['label_inconsistency'].items()])
write_csv(FIG/'model_summary.csv', ['Model','Assets','Scenarios','Coverage % of assets x 6','Mean words/scenario','Themes covered (of 24)'],
                    [[m, CODE['assets'][m], tot[j], round(100 * tot[j] / (CODE['assets'][m] * 6)) if CODE['assets'][m] else 0,
                        round(st.mean(len(r['scenario'].split()) for r in rows if r['m'] == m), 1) if tot[j] else 0, A[:, j].sum()] for j, m in enumerate(M)])
