#!/usr/bin/env python3
"""
Figure 2 -- Threat consensus matrix on the 5-run intersection.

Reads the run log exported from Google Docs (thread_senaryo_2.md: 5 iterations x 6 LLMs,
same prompt + same architecture image), extracts every STRIDE threat scenario, maps each
scenario to the 35 canonical threats of the original consensus matrix with deterministic
keyword rules, and draws the matrix:

  dark cell   = threat present in all 5 runs of that model (intersection)
  light cell  = present in k of 5 runs (k printed), i.e. not stable
  white cell  = never present
  n/7 column  = number of stable (dark) cells incl. the Medini column

Usage:
    python make_fig2_consensus_matrix.py thread_senaryo_2.md -o fig2_threat_consensus_matrix_intersection
Outputs <o>.png (300 dpi) and <o>.pdf (vector).
Requires: matplotlib (standard library otherwise).
"""
import re, argparse, collections
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle, Patch

# =====================================================================================
# 1. PARSING THE RUN LOG
# =====================================================================================
MODELS = ['ChatGPT', 'Gemini', 'Claude Sonnet 5', 'Claude Opus 5', 'Copilot', 'DeepSeek']
MODEL_MAP = {'chatgpt': 'ChatGPT', 'gemini': 'Gemini', 'copilot': 'Copilot', 'deepseek': 'DeepSeek'}
RUNS = range(1, 6)

def unesc(s):
    """Remove the markdown escapes Google Docs adds (\\[ \\] \\_ \\+ ...)."""
    return re.sub(r'\\([\\\[\]\-\+\.\_\<\>\*\#\(\)\!\{\}`~|&])', r'\1', s)

def read_runs(path):
    """Return [{'run', 'model', 'version', 'raw'}] -- one entry per model per iteration."""
    runs, it = [], None
    for ln in open(path, encoding='utf-8').read().split('\n'):
        m = re.match(r'^# (\d) iteration', ln)
        if m:
            it = int(m.group(1)); continue
        if it and ln.startswith('|'):
            cells = [c.strip() for c in ln.strip().strip('|').split(' | ')]
            if len(cells) < 3:
                continue
            name, ver, out = cells[0].replace('*', '').strip().lower(), cells[1], ' | '.join(cells[2:])
            if name == 'claude':
                model = 'Claude Sonnet 5' if 'sonnet' in ver.lower() else 'Claude Opus 5'
            elif name in MODEL_MAP:
                model = MODEL_MAP[name]
            else:
                continue
            runs.append(dict(run=it, model=model, version=ver, raw=unesc(out)))
    return runs

STRIDE_FULL = ['Spoofing', 'Tampering', 'Repudiation', 'Information Disclosure',
               'Denial of Service', 'Elevation of Privilege']

def norm_stride(s):
    s = s.strip().lower()
    short = {'s': 'Spoofing', 't': 'Tampering', 'r': 'Repudiation', 'i': 'Information Disclosure',
             'd': 'Denial of Service', 'e': 'Elevation of Privilege'}
    if s in short:
        return short[s]
    for f in STRIDE_FULL:
        if s.startswith(f.lower()):
            return f
    if s.startswith('information'): return 'Information Disclosure'
    if s.startswith('denial') or s.startswith('dos'): return 'Denial of Service'
    if s.startswith('elevation'): return 'Elevation of Privilege'
    return None

# The six models used different JSON shapes across runs; these patterns cover all of them:
#   {"STRIDE": "...", "Scenario": "..."}   "Spoofing: text"   "[Spoofing] text"   "[S] text"
#   and DeepSeek run 4's flat list {"STRIDE_Category", "Asset", "Threat_Scenario"}.
STR = r'"((?:[^"\\]|\\.)*)"'
CATS = r'(Spoofing|Tampering|Repudiation|Information Disclosure|Denial of Service|Elevation of Privilege)'
tok_asset  = re.compile(r'"(?:Asset|asset)"\s*:\s*' + STR)
tok_obj    = re.compile(r'"(?:STRIDE|stride|STRIDE_Category)"\s*:\s*"([^"]*)"\s*,\s*"(?:Scenario|scenario|Description)"\s*:\s*' + STR)
tok_prefix = re.compile(r'"' + CATS + r'[^":]{0,40}:\s*((?:[^"\\]|\\.)*)"')
tok_brack  = re.compile(r'"\[(Spoofing|Tampering|Repudiation|Information Disclosure|Denial of Service|Elevation of Privilege|S|T|R|I|D|E)\]\s*((?:[^"\\]|\\.)*)"')
tok_flat   = re.compile(r'"STRIDE_Category"\s*:\s*"([^"]*)"\s*,\s*"Asset"\s*:\s*' + STR + r'\s*,\s*"Threat_Scenario"\s*:\s*' + STR)

def extract(raw):
    """Return [{'asset', 'stride', 'text'}] for one model output (tolerates invalid JSON)."""
    flat = list(tok_flat.finditer(raw))
    if flat:
        return [dict(asset=m.group(2), stride=norm_stride(m.group(1)), text=m.group(3)) for m in flat]
    events = []
    for rx_, kind in [(tok_asset, 'A'), (tok_obj, 'O'), (tok_prefix, 'P'), (tok_brack, 'B')]:
        events += [(m.start(), kind, m) for m in rx_.finditer(raw)]
    events.sort(key=lambda e: e[0])
    asset, out, spans = None, [], []
    for pos, kind, m in events:
        if kind == 'A':
            asset = m.group(1); continue
        if any(a <= pos < b for a, b in spans):   # label found inside an already-captured scenario
            continue
        out.append(dict(asset=asset, stride=norm_stride(m.group(1)), text=m.group(2)))
        spans.append((m.start(), m.end()))
    return out

# =====================================================================================
# 2. ARCHITECTURE ELEMENTS (used by some classifier rules as context)
# =====================================================================================
ELEM_ORDER=['CAM','EDGE','AG1','MLLM','AG2','AG3','DENM','RSU','PKI','OBU','VC','HMI','UU','PC5','INT','XC']
ELEM_NAME={'CAM':'1 Cameras','EDGE':'2 Edge detector (YOLOv5)','AG1':'3 Situation-detection agent','MLLM':'4&7 Cloud MLLM (Gemini API)',
 'AG2':'5 Distance-estimate agent','AG3':'6 Message-generation agent','DENM':'8 DENM encoder','RSU':'9 RSU / HSM',
 'PKI':'0&10 Central ITS-S / PKI / credentials','OBU':'11 OBU','VC':'12 Vehicle computer','HMI':'13 Driver HMI',
 'UU':'5G Uu link','PC5':'PC5 sidelink','INT':'Internal links / roadside platform','XC':'Cross-cutting (E2E, AI config, logs, GNSS)'}
# asset-string patterns (checked in the asset name)
A_PAT={
 'CAM':r'camera(?! position)','EDGE':r'edge detector|yolo','AG1':r'situation detection|agent 1\b',
 'MLLM':r'cloud mllm|gemini api|api key and cloud|mllm service','AG2':r'distance estimat|depth pro|agent 2\b',
 'AG3':r'message generation|agent 3\b','DENM':r'denm encoder|asn\.1','RSU':r'\brsu\b|roadside unit',
 'PKI':r'central its|pki|certificat|cryptographic|\bkeys\b|credential|enrolment','OBU':r'\bobu\b|on-board unit|on board unit',
 'VC':r'vehicle computer','HMI':r'\bhmi\b','UU':r'5g|\buu\b|cellular','PC5':r'pc5|sidelink',
 'INT':r'internal|wired|agent-to-agent|inter-agent|interconnection|communication bus|platform|computing unit|video link'}
# whole-asset overrides (checked first, lower-case substring -> element or list)
OVR=[
 ('edge detector (yolov5 fast path) and ai agents',['EDGE','AG1','AG2','AG3']),
 ('data flow: denm encoder to rsu and rsu to obu',['INT','PC5']),
 ('5g uu cellular links[cite: 1] & certificates event reports',['UU','PKI']),
 ('link roadside computing unit -> rsu','INT'),('link rsu <-> central its-s','UU'),('link roadside computing unit <-> gemini','UU'),
 ('v2n link','UU'),('link obu -> vehicle computer','INT'),('video link camera','INT'),('data flow: edge detector to ai agents','INT'),
 ('data flow: ai agents to cloud mllm','UU'),('data flow: certificates and event reports','PKI'),('certificate and event-report channel','PKI'),
 ('certificates event reports (flow 0)','PKI'),('7. cloud mllm communication channel','UU'),('cryptographic material and api secrets','PKI'),
 ('roadside computing unit, nvidia','INT'),('roadside its station platform','INT'),('roadside its station internal network','INT'),
 ('ai models','XC'),('end-to-end','XC'),('accident-detection decision','XC'),('accident event reports','XC'),('accident/event reports','XC'),
 ('gnss','XC'),('distance estimate agent (depth pro) and stored camera','AG2'),('5g network and cloud: central its-s','PKI'),
 ('cameras (mono + stereo, edge)','CAM'),('uu 5g cellular links (agents','UU'),('5g uu link (rsu / agents','UU'),
 ('5g uu cellular links (edge','UU'),('ai agent communication bus','INT'),('inter-agent orchestration','INT'),
 ('ai-agent orchestration','INT'),('ai agent-to-agent','INT'),('ai agent interconnections','INT'),('internal data flow between ai agents','INT'),
 ('ai agents (3, 5, 6) and cloud mllm',['AG1','AG2','AG3','MLLM']),('ai agents (component 3, 5, 6)',['AG1','AG2','AG3']),
 ('ai agents (3. situation',['AG1','AG2','AG3']),('ai agents: situation detection (agent 1)','AG1'),
 ('roadside its station (cameras, edge detector, ai agents, denm encoder)',['CAM','EDGE','AG1','AG2','AG3','DENM']),
 ('vehicle its station (obu',['OBU','VC','HMI']),('vehicle its station (obu, vehicle computer',['OBU','VC','HMI']),
 ('0 / 10. central its-s','PKI'),('10. central its-s (pki, operator) and 0.','PKI'),('10. central its-s (pki, operator backend) and the certificate','PKI'),
]
T_PAT={'CAM':r'camera|lens|video|footage|blind|laser','EDGE':r'yolo|edge detector|detector','AG1':r'situation|agent 1\b|classif',
 'AG2':r'distance|depth','AG3':r'message generation|agent 3\b|generat','MLLM':r'mllm|gemini|cloud|\bapi\b',
 'DENM':r'encod|asn|uper|payload','RSU':r'\brsu\b|roadside unit|hsm|sign(s|ing)?\b','OBU':r'\bobu\b|modem|on-board',
 'VC':r'vehicle computer|verif|warning logic|threshold|can bus','HMI':r'\bhmi\b|display|driver|alert|audio|visual',
 'UU':r'5g|\buu\b|cellular|base station','PC5':r'pc5|sidelink|5\.9|its band|v2x radio','INT':r'internal|wired|\bbus\b|\blan\b|local network|ethernet',
 'PKI':r'pki|certificat|\bca\b|operator|revocation|enrol','XC':r'.'}
def candidates(asset):
    a=(asset or '').lower()
    for k,v in OVR:
        if k in a: return v if isinstance(v,list) else [v]
    if re.match(r'^(0\.|0 /|certificat|cryptographic|hsm and cryptographic|security credentials)',a): return ['PKI']
    hits=[]
    for e,p in A_PAT.items():
        m=re.search(p,a)
        if m: hits.append((m.start(),e))
    hits.sort()
    c=[e for _,e in hits]
    # de-dup, keep order
    seen=[]; [seen.append(x) for x in c if x not in seen]
    # an asset about the RSU that just mentions PC5/HSM in parentheses is RSU; same for OBU with modem
    if 'RSU' in seen and 'sidelink' not in a: seen=[x for x in seen if x not in ('PC5','PKI')]
    if seen and seen[0]=='OBU':
        seen=[x for x in seen if x!='UU' and (x!='PC5' or 'sidelink' in a)]
    if seen and seen[0] in ('PC5','UU','INT'): seen=[x for x in seen if x in ('PC5','UU','INT')]
    if seen and seen[0]=='MLLM' and not re.search(r'5g uu|cellular link|uu link|communication link',a): seen=[x for x in seen if x!='UU']
    if seen and seen[0]=='PKI': seen=['PKI']
    return seen or ['XC']
def element(asset,text):
    c=candidates(asset)
    if len(c)==1: return c[0]
    t=text.lower(); best=None;bs=-1
    for i,e in enumerate(c):
        s=len(re.findall(T_PAT[e],t))
        if s>bs: best,bs=e,s
    return best

# =====================================================================================
# 3. TAXONOMY CLASSIFIER -- maps one scenario to the canonical threats it describes
#    (validated against the team's manual run-1 matrix: see validate_run1)
# =====================================================================================
S,T_,R,I,D,E='Spoofing','Tampering','Repudiation','Information Disclosure','Denial of Service','Elevation of Privilege'
def rx(p,s): return re.search(p,s) is not None
def cls(asset,text,stride):
    a=(asset or '').lower(); t=text.lower(); el=element(asset,text); at=a+' || '+t
    cam = el=='CAM' or rx(r'\bcamera',t)
    out=set()
    # 1 forged DENM / fake warning
    if el!='HMI' and stride not in (D,R) and rx(r'(forg|fake|fabricat|fraudul|counterfeit|bogus|phantom|false|spoofed|arbitrary|malicious)\w*(?:(?!certificat|device)[^.;]){0,30}(denm|warning|alert|safety[- ]message|hazard (alert|warning|notification|report)|accident (warning|notification|report)|v2x message|safety event|messages?\b)',t) and not rx(r'false (distance|vehicle telemetry)',t):
        out.add('Forged DENM')
    # 2 rogue RSU
    RSUW=r'(\brsu\b|roadside unit|roadside (device|transmitter|node|warning source))'
    if (rx(r'(rogue|clon\w*|fake|malicious|compromised|spoofed)\s+(\w+\s+){0,2}'+RSUW,t) or rx(r'(impersonat\w*|spoof\w*|masquerad\w* as|claim\w* to be|pretend\w* to be)\s+(an?\s+|the\s+)?(legitimate\s+|trusted\s+|valid\s+)?'+RSUW,t) or rx(RSUW+r'[^.;]{0,25}(impersonat|clon)',t) or (el=='RSU' and stride==S)) and not rx(r'mllm|gemini|\bapi\b',t):
        out.add('Rogue RSU broadcast')
    # 3 camera feed injection
    if cam and rx(r'(inject|substitut|replac|synthetic|fabricat|forg|fake|rogue|emulat|impersonat|pre-recorded|recorded)\w*[^.;]{0,60}(video|camera|stream|feed|frame|image|scene|footage)|(video|stream|feed)[^.;]{0,20}inject',t):
        out.add('Camera feed injection')
    # 4/5 jamming
    jam = rx(r'jam|rf interference|radio interference|radio frequency|radio-frequency|\brf\b|interference|carrier',t)
    if jam and rx(r'pc5|sidelink|5\.9|its band|v2x|radio|dsrc',at) and not (el=='CAM' and not rx('pc5|sidelink',t)) and not (rx(r'5g|\buu\b|cellular',t) and not rx(r'pc5|sidelink|5\.9|its band|v2x|\brf\b|radio',t)):
        if rx(r'pc5|sidelink|5\.9|its band|v2x',at) or el in ('PC5','RSU','OBU'): out.add('RF jamming of PC5 links')
    if rx(r'jam|interference|disruption|coverage',t) and (rx(r'5g|\buu\b|cellular',t) or el=='UU') and el!='CAM':
        out.add('RF jamming of 5G links')
    # 6 adversarial
    if rx(r'adversarial|evasion|perturbation|patch(es)?\b|crafted (visual )?noise|visual noise|perspective illusion|depth-ambiguous',t): out.add('Adversarial examples vs. perception models')
    # 7 MitM on cloud MLLM link
    if rx(r'man-in-the-middle|\bmitm\b|in transit|in-transit|tls|traffic modification|intercept\w*[^.;]{0,40}modif|altered while travers|modif\w*[^.;]{0,40}(transit|traffic)|redirect',t) and (el in ('MLLM','AG1','AG3','UU','XC') or rx(r'mllm|cloud|\bapi\b|prompt|gemini|agent',t)):
        out.add('MitM on cloud MLLM link')
    # 8 privacy of imagery
    if stride==I and rx(r'plate|\bfaces?\b|personal|privacy|gdpr|imagery|images?\b|video|frames?\b|visual (data|information)|camera (stream|feed)|road users|occupant|scene',t): out.add('Privacy leakage of camera imagery')
    # 9 signing key theft
    if not rx(r'api keys?',t) and rx(r'(private|signing|hsm|cryptographic|ca)\s*(signing\s*)?keys?|key material|keys\b|key extraction',t) and rx(r'extract|theft|stol|steal|leak|expos|disclos|compromis|obtain|misuse|side-channel|cached outside',t):
        out.add('Signing-key theft (HSM, PKI)')
    # 10 credential theft
    cred=r'credential|certificat|pseudonym|authori[sz]ation ticket|enrol\w* credential|private key'
    thf=r'stol\w*|steal\w*|theft|extract\w*|leak\w*|expos\w*|disclos\w*|obtain\w*|clon\w*|exfiltrat\w*'
    if (rx(r'('+thf+r')[^.;]{0,40}('+cred+r')|('+cred+r')[^.;]{0,40}('+thf+r')',t) or rx(r'compromised (\w+ )?(credential|certificat)',t)) and not rx(r'api (key|credential)|weak|default credential|linkage|unlinkab|linking',t):
        out.add('Credential theft (HSM, PKI)')
    # 11 PKI/CA compromise
    if rx(r'(compromis\w*|breach|take\w* over|takeover|gains? (administrative )?control|control of|attack on)[^.;]{0,40}(\bca\b|certificate authority|\bpki\b|root|authoris\w* authority|authoriz\w* authority|enrol\w* (authority|service))',t) or rx(r'impersonat\w*\s+(the\s+)?(enrol\w*[ /]*(authori\w* )?authority|authori\w* authority|pki|\bca\b|certificate authority)',t) or rx(r'(\bca\b|\bpki\b|certificate authority|root ca)[^.;]{0,40}(compromis|breach)',t) or (el=='PKI' and stride in (E,) ):
        out.add('PKI (CA) compromise')
    # 12 rogue certificates
    if stride!=D and rx(r'(rogue|fraudulent|forged|fake|unauthori[sz]ed|malicious|misissu|stolen|cloned|trusted|valid|high-privilege)\w*[^.;]{0,25}certific|issu\w*[^.;]{0,40}certific|certific\w*[^.;]{0,20}(issuance|to rogue|to malicious|to attacker)',t):
        out.add('Rogue certificates')
    # 13 camera blinding
    if cam and (rx(r'blind|laser|obscur|cover(ed|ing|s)?\b|obstruct|paint\w* over|spray|paint(ed|s)? (on )?(the )?lens|intense light|high-intensity|strong light|\bir\b|illuminat|spray|mud',t) or (el=='CAM' and stride==D and rx(r'jam|disabl|flood|overload',t))):
        out.add('Camera blinding')
    # 14 physical camera sabotage
    if cam and rx(r'physical|destro|destruct|damag|vandal|\bcut|cable|power|disconnect|sabotag|unplug|re-?aim|misalign|mounting|lens|housing|pole',t):
        out.add('Physical camera sabotage')
    # 15 in-vehicle warning logic tampering
    if (el in ('VC','HMI','OBU') or rx(r'vehicle comput|warning logic|warning-logic',t)) and rx(r'warning logic|warning-logic|warning threshold|thresholds|warning algorithm|verification logic|verification algorithm|verification or warning|signature verification',t) and rx(r'modif|alter|tamper|malware|manipulat|suppress|bypass|chang|disabl',t):
        out.add('In-vehicle warning-logic tampering')
    # 16 camera replay
    if cam and rx(r'replay|pre-recorded|prerecorded|recorded (footage|video|road|accident|images?)|loop',t): out.add('Camera feed replay')
    # 17 in-vehicle verification tampering
    if rx(r'verif|signature check|trust (store|anchor)',t) and rx(r'bypass|disabl|modif|alter|tamper|weaken|skip|replac',t) and (el in ('VC','OBU','HMI') or rx(r'vehicle|obu',t)):
        out.add('In-vehicle verification tampering')
    # 18 cloud endpoint spoofing
    if stride not in (D,R,I) and (rx(r'(impersonat|spoof|rogue|fake|malicious|attacker-controlled|redirect)\w*(?:(?!station|roadside|\brsu\b|credential|key|cellular)[^.;]){0,35}(mllm|\bapi\b|cloud service|cloud model|gemini|cloud)',t) or rx(r'dns',t) and rx(r'mllm|api|cloud|endpoint',t)):
        out.add('Cloud MLLM endpoint spoofing')
    # 19 prompt injection
    if rx(r'prompt[- ]injection|prompt manipulation|prompt flooding|injected (instructions|text|content)|visual prompt|typographic|hidden instructions|as (an )?instruction|interprets as commands|ignore (previous|hazards)|prompt[^.;]{0,20}(inject|manipulat)',t): out.add('Prompt injection vs. MLLM agents')
    # 20 quota
    if rx(r'quota|rate[- ]limit|\bcost|billing|budget|financial|token budget|api flood|flood\w*[^.;]{0,25}(\bapi\b|mllm)|(\bapi\b|mllm)[^.;]{0,15}flood',t): out.add('Cloud API quota exhaustion')
    # 21 outage
    if stride==D and (rx(r'outage|unavailab|downtime|provider|throttl|unreachable|disrupt',t) and rx(r'cloud|\bapi\b|mllm|gemini',t) and el!='PKI') or (el=='MLLM' and stride==D) or (stride==D and rx(r'cloud mllm|gemini api',a) and not rx(r'jam',t)):
        out.add('Cloud API outage')
    # 22 missing audit trail AI
    if stride==R and (el in ('EDGE','AG1','AG2','AG3','MLLM') or rx(r'agent|mllm|model|\bai\b|prompt|inference|detector|detection',t)): out.add('Missing audit trail for AI decisions')
    # 23 privilege pivot into vehicle networks
    if stride not in (I,R) and rx(r'(pivot|lateral|escalat|access|move|gain|control|path|entry)[^.;]{0,90}(vehicle[- ]network|in-vehicle|can bus|\bcan\b|vehicle systems|vehicle functions|vehicle subsystem|safety functions|safety-relevant|other vehicle|vehicle-side|adas|\becu\b|vehicle computer|vehicle its|vehicle communication|head unit|privileged vehicle|infotainment)',t) or (stride==E and el in ('OBU','VC','HMI')):
        out.add('Privilege pivot into vehicle networks')
    # 24 ASN.1 parser exploitation
    if rx(r'parser|parsing|buffer overflow|memory[- ]safety|memory[- ]corruption|codec|decoder|malformed|fuzz|crash',t) and (rx(r'asn|uper|denm',at) or el=='DENM'):
        out.add('ASN.1 DENM parser exploitation')
    # 25 model weight tampering
    if rx(r'weight|checkpoint|model file|poison|backdoor|trojan|model (is )?(replaced|swapped)|swapped|model update|model or its|model parameters|\.pt\b',t) and not rx(r'model extraction|exfiltrat|theft|stealing|extract|stolen',t) and stride not in (I,R) or (rx(r'weight',t) and stride==T_):
        out.add('AI model weight tampering')
    # 26 API credential compromise
    if rx(r'(\bapi\b|cloud)[^.;]{0,20}(keys?|credential|token)|(keys?|credential|token)[^.;]{0,20}(\bapi\b|cloud)',t) or (el=='MLLM' and rx(r'credential|\bkey',t)):
        out.add('API credential (key) compromise')
    # 27/28 alert flooding / fatigue
    flood = rx(r'flood|spam|continuous(ly)? (false )?(alert|alarm|trigger)|constant (false )?alert|repeated (false )?alert|excessive (non-critical )?alert|storm|many rapid|alert flood',t) and rx(r'alert|alarm|hmi|driver',t)
    if flood and (el in ('HMI','VC') or rx(r'hmi|driver',t)): out.add('Driver alert flooding'); out.add('Driver alert fatigue')
    if rx(r'fatigue|habituat|desensiti',t): out.add('Driver alert fatigue')
    # 29 DENM replay
    if rx(r'replay|re-?transmit|stale|old valid|previously (captured|valid)',t) and rx(r'denm|message|pc5|sidelink|warning|v2x|signed',t) and not (el=='CAM' or rx(r'camera|video|footage',t)):
        out.add('DENM replay')
    if rx(r'gnss|\bgps\b',t) and rx(r'spoof',t): out.add('GNSS spoofing')
    if rx(r'gnss|\bgps\b',t) and rx(r'jam',t): out.add('GNSS jamming')
    if rx(r'sybil|multiple (forged|fake|pseudonym)|many pseudonym|multiple pseudonym|multiple fake',t): out.add('Sybil attack (multiple forged identities)')
    if rx(r'overshadow|stronger signal|stronger, modified|stronger copy',t): out.add('Signal overshadowing on PC5')
    if rx(r'(unsigned|malicious|downgrad\w*|compromised|poisoned)[^.;]{0,30}(update|\bota\b|package|dependenc)|supply[- ]chain|\bpip\b|pytorch|ultralytics',t): out.add('Unsigned software update (supply chain)')
    if cam and rx(r're-?aim|misalign|reposition|re-?orient|camera angle|mounting angle|moves? the camera|camera pose|alignment|field of view|shifts the field',t) and rx(r'location|position|distance|depth|geometry|region',t):
        out.add('Camera re-aiming shifts reported location')
    return out

# =====================================================================================
# 4. REFERENCE DATA
# =====================================================================================
TAXONOMY = ['Forged DENM', 'Rogue RSU broadcast', 'Camera feed injection', 'RF jamming of PC5 links',
    'RF jamming of 5G links', 'Adversarial examples vs. perception models', 'MitM on cloud MLLM link',
    'Privacy leakage of camera imagery', 'Signing-key theft (HSM, PKI)', 'Credential theft (HSM, PKI)',
    'PKI (CA) compromise', 'Rogue certificates', 'Camera blinding', 'Physical camera sabotage',
    'In-vehicle warning-logic tampering', 'Camera feed replay', 'In-vehicle verification tampering',
    'Cloud MLLM endpoint spoofing', 'Prompt injection vs. MLLM agents', 'Cloud API quota exhaustion',
    'Cloud API outage', 'Missing audit trail for AI decisions', 'Privilege pivot into vehicle networks',
    'ASN.1 DENM parser exploitation', 'AI model weight tampering', 'API credential (key) compromise',
    'Driver alert flooding', 'Driver alert fatigue', 'DENM replay', 'GNSS spoofing', 'GNSS jamming',
    'Sybil attack (multiple forged identities)', 'Signal overshadowing on PC5',
    'Unsigned software update (supply chain)', 'Camera re-aiming shifts reported location']

# Medini Analyze column, taken from the original (run-1) consensus matrix; same row order as TAXONOMY.
MEDINI = '11111111111111111111111111111' + '001101'

# Team's manual coding of run 1 (rows = TAXONOMY, columns = MODELS). Used only to validate the rules.
MANUAL_RUN1 = ('111111 111111 111111 111111 111111 111111 111111 111111 111111 111111 111111 111111 '
               '111111 111111 111111 110111 101110 101111 101111 101111 101111 101111 101111 111110 '
               '100111 101110 111100 111100 101100 001100 000100 010000 000100 000100 000100').split()

LABELS = ['ChatGPT\n(GPT-5.6)', 'Gemini\n(3.1 Pro)', 'Claude\nSonnet 5', 'Claude\nOpus 5*',
          'Copilot\n(free)', 'DeepSeek\n(4.1 Flash)', 'Medini\n2025 R1.01']

# =====================================================================================
# 5. BUILD THE PER-RUN THREAT SETS
# =====================================================================================
def build_found(md_path):
    """found[(model, run)] = set of taxonomy threats present in that run."""
    found = collections.defaultdict(set)
    n_scen = collections.Counter()
    for r in read_runs(md_path):
        for x in extract(r['raw']):
            n_scen[(r['model'], r['run'])] += 1
            found[(r['model'], r['run'])] |= cls(x['asset'], x['text'], x['stride'])
    return found, n_scen

def validate_run1(found):
    agree = sum((MANUAL_RUN1[i][j] == '1') == (t in found[(m, 1)])
                for i, t in enumerate(TAXONOMY) for j, m in enumerate(MODELS))
    return agree, len(TAXONOMY) * len(MODELS)

# =====================================================================================
# 6. PLOT
# =====================================================================================
def plot_matrix(found, out_prefix):
    plt.rcParams.update({'font.family': 'serif', 'font.serif': ['DejaVu Serif'],
                         'pdf.fonttype': 42, 'ps.fonttype': 42})
    DARK, LIGHT = '#1f56a3', '#c9d9ef'
    part = {t: [sum(t in found[(m, k)] for k in RUNS) for m in MODELS] for t in TAXONOMY}  # k of 5
    med = dict(zip(TAXONOMY, [c == '1' for c in MEDINI]))
    cons = {t: sum(k == 5 for k in part[t]) + med[t] for t in TAXONOMY}                    # n of 7
    order = sorted(TAXONOMY, key=lambda t: (-cons[t], -sum(part[t]), TAXONOMY.index(t)))

    n, ncol = len(order), len(LABELS)
    fig = plt.figure(figsize=(7.6, 6.7), dpi=300)
    ax = fig.add_axes([0.385, 0.075, 0.595, 0.845])
    for i, t in enumerate(order):
        y = n - 1 - i
        for j in range(ncol):
            if j < len(MODELS):
                k = part[t][j]
                fc, txt = (DARK, '') if k == 5 else (LIGHT, str(k)) if k > 0 else ('white', '')
            else:
                fc, txt = (DARK if med[t] else 'white'), ''
            ax.add_patch(Rectangle((j, y), 1, 1, fc=fc, ec='#8c8c8c', lw=0.5))
            if txt:
                ax.text(j + 0.5, y + 0.5, txt, ha='center', va='center', fontsize=6.5, color='#1f3f73')
        ax.text(ncol + 0.55, y + 0.5, f'{cons[t]}/7', ha='center', va='center', fontsize=9)

    ax.add_patch(Rectangle((0, 0), ncol + 1.1, n, fill=False, ec='black', lw=1.0, clip_on=False))
    k7 = sum(cons[t] == 7 for t in order)                  # dashed line under the full-consensus block
    ax.plot([0, ncol + 1.1], [n - k7, n - k7], ls='--', color='black', lw=1.2, clip_on=False)
    ax.set_xlim(0, ncol + 1.1); ax.set_ylim(0, n)
    ax.set_yticks([n - 1 - i + 0.5 for i in range(n)]); ax.set_yticklabels(order, fontsize=8.5)
    ax.xaxis.tick_top(); ax.set_xticks([j + 0.5 for j in range(ncol)]); ax.set_xticklabels(LABELS, fontsize=6.9)
    for s in ax.spines.values():
        s.set_visible(False)
    ax.tick_params(length=3)
    fig.legend(handles=[Patch(fc=DARK, ec='#8c8c8c', label='Present in all 5 runs (intersection)'),
                        Patch(fc=LIGHT, ec='#8c8c8c', label='Present in k of 5 runs (k shown), not stable'),
                        Patch(fc='white', ec='#8c8c8c', label='Never present')],
               loc='lower center', ncol=3, frameon=False, fontsize=7.5, bbox_to_anchor=(0.5, 0.0))
    fig.savefig(out_prefix + '.png', dpi=300)
    fig.savefig(out_prefix + '.pdf')
    plt.close(fig)
    return order, cons

# =====================================================================================
if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('md', help='run log exported as markdown (thread_senaryo_2.md)')
    ap.add_argument('-o', '--out', default='fig2_threat_consensus_matrix_intersection')
    a = ap.parse_args()

    found, n_scen = build_found(a.md)
    print('Scenarios per run:')
    for m in MODELS:
        print(f'  {m:16s}', [n_scen[(m, r)] for r in RUNS])
    ok, tot = validate_run1(found)
    print(f'Rule check vs. manual run-1 coding: {ok}/{tot} cells agree')
    order, cons = plot_matrix(found, a.out)
    print(f'Threats at 7/7 consensus: {sum(v == 7 for v in cons.values())}')
    print(f'Saved {a.out}.png and {a.out}.pdf')
