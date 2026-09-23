# ==============================================================================
# 📝 SỔ TAY SÁNG TÁC ĐỀ TOÁN THPT — v2.0
# Chạy trên Kaggle Notebook → tự tạo link https://xxxx.gradio.live
# ĐỀ MẪU LÀ TRUNG TÂM: Load .typ → AI sáng tác câu tương tự → dịch Typst luôn
# Cây chủ đề từ bank.json thực tế (27 chương, 1968 dạng bài)
# ==============================================================================

import sys, os, re, json, html as _html, base64, shutil, subprocess, traceback, importlib.util
from pathlib import Path
from datetime import datetime
from collections import OrderedDict

for _pkg in ["gradio", "openai"]:
    if importlib.util.find_spec(_pkg) is None:
        subprocess.run([sys.executable, "-m", "pip", "install", "-q", _pkg], check=True)

import gradio as gr
from openai import OpenAI

# ==============================================================================
# 1. THƯ MỤC
# ==============================================================================
AI_ROOT = Path("/kaggle/working/de_toan_studio")
UPLOAD_DIR = AI_ROOT / "uploads"
RESULT_DIR = AI_ROOT / "results"
RENDER_DIR = AI_ROOT / "renders"
for _d in [UPLOAD_DIR, RESULT_DIR, RENDER_DIR]:
    _d.mkdir(parents=True, exist_ok=True)

# ==============================================================================
# 2. CREDENTIALS
# ==============================================================================
def _load_creds():
    url = os.getenv("MODEL_PROXY_URL", "")
    key = os.getenv("MODEL_PROXY_API_KEY", "")
    if not key:
        try:
            from kaggle_secrets import UserSecretsClient
            s = UserSecretsClient()
            url = url or (s.get_secret("MODEL_PROXY_URL") or "")
            key = key or (s.get_secret("MODEL_PROXY_API_KEY") or "")
        except Exception:
            pass
    if not key:
        for ep in [Path.cwd() / ".env", Path.home() / ".env"]:
            if ep.exists():
                for ln in ep.read_text().splitlines():
                    if ln.startswith("MODEL_PROXY_URL="):
                        url = url or ln.split("=", 1)[1].strip().strip("\"'")
                    elif ln.startswith("MODEL_PROXY_API_KEY="):
                        key = key or ln.split("=", 1)[1].strip().strip("\"'")
    return url, key

_URL, _KEY = _load_creds()

# ==============================================================================
# 3. MODELS
# ==============================================================================
MODEL_CHOICES = [
    "openai/gpt-6-astra",
    "deepseek-ai/deepseek-r1-0528",
    "qwen/qwen3-coder-480b-a35b-instruct",
    "anthropic/claude-opus-5@default",
    "anthropic/claude-sonnet-5@default",
    "anthropic/claude-sonnet-4-6@default",
    "google/gemini-2.5-pro",
    "google/gemini-3.1-pro-preview",
    "xai/grok-4.6",
    "qwen/qwen3-235b-a22b-instruct-2507",
]

MODEL_LABELS = {
    "openai/gpt-6-astra": "⚡ GPT-6 Astra — Sáng tác đề xuất sắc",
    "deepseek-ai/deepseek-r1-0528": "🧠 DeepSeek-R1 — Suy luận toán mạnh",
    "qwen/qwen3-coder-480b-a35b-instruct": "💻 Qwen3 Coder — Viết Typst/CeTZ tốt",
    "anthropic/claude-opus-5@default": "👑 Claude Opus 5 — Đề chuẩn sư phạm",
    "anthropic/claude-sonnet-5@default": "🎯 Claude Sonnet 5 — Nhanh & chính xác",
    "anthropic/claude-sonnet-4-6@default": "🟠 Claude Sonnet 4.6 — Cân bằng tốt",
    "google/gemini-2.5-pro": "🔵 Gemini 2.5 Pro — Suy luận dài",
    "google/gemini-3.1-pro-preview": "👁️ Gemini 3.1 Pro — Đọc ảnh siêu nét",
    "xai/grok-4.6": "🚀 Grok 4.6 — Suy luận mạnh",
    "qwen/qwen3-235b-a22b-instruct-2507": "🟡 Qwen3 235B — Đa năng",
}

# ==============================================================================
# 4. CÂY CHỦ ĐỀ TỪ bank.json
# ==============================================================================
def load_bank_tree(bank_path=None):
    """
    Đọc bank.json → xây cây: Lớp > Phân môn > Chương > Bài > Dạng.
    Trả về:
      - tree: dict cấu trúc cây
      - flat_chapters: list các chuỗi "L10 > Đại Số > Ch1: ..."  để dropdown
    """
    candidates = [
        bank_path,
        Path("/kaggle/working/bank.json"),
        Path("/kaggle/input/bank.json"),
    ]
    bank = {}
    for p in candidates:
        if p and Path(p).exists():
            with open(p, encoding="utf-8") as f:
                bank = json.load(f)
            break

    # Xây cây
    tree = OrderedDict()  # key = "L10 > Đại Số > Ch1: ..."
    for code, desc in bank.items():
        parts = [p.strip() for p in desc.split("|")]
        if len(parts) < 3:
            continue
        lop, phanmon, chuong = parts[0], parts[1], parts[2]
        bai = parts[3] if len(parts) > 3 else ""
        dang = parts[4] if len(parts) > 4 else ""

        ch_key = f"{lop} | {phanmon} | {chuong}"
        if ch_key not in tree:
            tree[ch_key] = OrderedDict()
        if bai:
            if bai not in tree[ch_key]:
                tree[ch_key][bai] = []
            if dang and dang not in tree[ch_key][bai]:
                tree[ch_key][bai].append(dang)

    flat_chapters = list(tree.keys())
    return tree, flat_chapters, bank

# Thử load trên Kaggle hoặc local
_BANK_TREE, _FLAT_CHAPTERS, _BANK_RAW = load_bank_tree(Path("/kaggle/working/bank.json"))

# Fallback nếu ko tìm thấy bank.json → embed danh sách cứng
if not _FLAT_CHAPTERS:
    _FLAT_CHAPTERS = [
        "L10 | Đại Số | Ch1: Mệnh đề. Tập hợp",
        "L10 | Đại Số | Ch2: BPT và hệ BPT bậc nhất hai ẩn",
        "L10 | Đại Số | Ch3: Hàm số bậc hai và đồ thị",
        "L10 | Đại Số | Ch6: Thống kê",
        "L10 | Đại Số | Ch7: Bất phương trình bậc 2 một ẩn",
        "L10 | Đại Số | Ch8: Đại số tổ hợp",
        "L10 | Đại Số | Ch10: Xác suất",
        "L10 | Hình Học | Ch4: Hệ thức lượng trong tam giác",
        "L10 | Hình Học | Ch5: Véctơ (chưa xét tọa độ)",
        "L10 | Hình Học | Ch9: Phương pháp toạ độ trong mặt phắng (Oxy)",
        "L11 | Đại Số | Ch1: Hàm số lượng giác và phương trình lượng giác",
        "L11 | Đại Số | Ch2: Dãy số. Cấp số cộng. Cấp số nhân",
        "L11 | Đại Số | Ch3: Giới hạn. Hàm số liên tục",
        "L11 | Đại Số | Ch6: Hàm số mũ và hàm số lôgarít",
        "L11 | Đại Số | Ch7: Đạo hàm",
        "L11 | Đại Số | Ch9: Xác suất",
        "L11 | Hình Học | Ch4: Đường thẳng, mặt phẳng. Quan hệ song song trong không gian",
        "L11 | Hình Học | Ch8: Quan hệ vuông góc trong không gian",
        "L12 | Giải Tích | Ch1: Ứng dụng đạo hàm để khảo sát hàm số",
        "L12 | Giải Tích | Ch4: Nguyên hàm, tích phân và ứng dụng",
        "L12 | Giải Tích | Ch6: Một số yếu tố xác suất",
        "L12 | Hình Học | Ch2: Tọa độ của véc-tơ trong không gian",
        "L12 | Hình Học | Ch5: Phương trình mặt phẳng, đường thẳng, mặt cầu trong không gian Oxyz",
    ]

def get_chapter_detail(chapter_key):
    """Trả về mô tả chi tiết các bài + dạng của 1 chương."""
    if chapter_key not in _BANK_TREE:
        return "(Chương không có trong ngân hàng)"
    info = _BANK_TREE[chapter_key]
    lines = []
    for bai, dangs in info.items():
        lines.append(f"📘 {bai}")
        for d in dangs:
            lines.append(f"    • {d}")
    return "\n".join(lines) if lines else "(Chưa có bài/dạng chi tiết)"

# ==============================================================================
# 5. TOOLS: TYPST
# ==============================================================================
def ensure_typst():
    need = True
    if shutil.which("typst"):
        try:
            v = subprocess.run(["typst", "--version"], capture_output=True, text=True)
            m = re.search(r"(\d+)\.(\d+)", v.stdout)
            if m and (int(m.group(1)) > 0 or int(m.group(2)) >= 14):
                need = False
        except Exception:
            pass
    if need:
        subprocess.run("rm -f /usr/local/bin/typst", shell=True)
        subprocess.run(
            "curl -fsSL https://github.com/typst/typst/releases/latest/download/"
            "typst-x86_64-unknown-linux-musl.tar.xz "
            "| tar -xJf - --strip-components=1 -C /usr/local/bin "
            "typst-x86_64-unknown-linux-musl/typst 2>/dev/null "
            "&& chmod +x /usr/local/bin/typst", shell=True)
    return shutil.which("typst") is not None

def compile_typst(code, name):
    ensure_typst()
    typ = RESULT_DIR / f"{name}.typ"
    pdf = RESULT_DIR / f"{name}.pdf"
    png_pre = RENDER_DIR / f"{name}_p"
    for f in RENDER_DIR.glob(f"{name}_p_*.png"):
        f.unlink(missing_ok=True)
    typ.write_text(code, encoding="utf-8")
    # Compile PDF
    r1 = subprocess.run(["typst", "compile", str(typ), str(pdf)], capture_output=True, text=True)
    # Compile PNG
    subprocess.run(["typst", "compile", "--format", "png", "--ppi", "200",
                    str(typ), f"{png_pre}_{{p}}.png"], capture_output=True, text=True)
    pngs = sorted(RENDER_DIR.glob(f"{name}_p_*.png"))
    err = r1.stderr if not pngs else ""
    return typ, (pdf if pdf.exists() else None), pngs, err

# ==============================================================================
# 6. HELPER
# ==============================================================================
def dl_btn(path, label, color="#4F46E5", mime="application/octet-stream"):
    if not path or not Path(path).exists():
        return ""
    b = base64.b64encode(Path(path).read_bytes()).decode()
    n = Path(path).name
    return (f'<a href="data:{mime};base64,{b}" download="{n}" style="display:inline-flex;align-items:center;gap:6px;'
            f'background:{color};color:#fff!important;text-decoration:none!important;padding:10px 16px;border-radius:8px;'
            f'font-weight:700;font-size:13px;margin:4px 6px 4px 0;box-shadow:0 2px 6px rgba(0,0,0,.12)">'
            f'{label} ({n})</a>')

# ==============================================================================
# 7. GỌI LLM — OUTPUT SIÊU DÀI
# ==============================================================================
def call_llm(model_id, prompt, max_tokens=65536, url=None, key=None):
    u = (url or _URL or "").strip() or "https://api.kaggle.com/v1"
    k = (key or _KEY or "").strip()
    if not k:
        raise ValueError("Chưa có API Key! Nhập ở mục ⚙️ API, hoặc thêm Kaggle Secret: MODEL_PROXY_API_KEY")
    client = OpenAI(base_url=u, api_key=k)

    messages = [{"role": "user", "content": prompt}]
    all_content = ""
    all_reasoning = ""
    MAX_CONTINUATIONS = 8

    for attempt in range(1 + MAX_CONTINUATIONS):
        last_err = None
        for tok_key in ["max_tokens", "max_completion_tokens"]:
            try:
                resp = client.chat.completions.create(
                    model=model_id, messages=messages, **{tok_key: max_tokens}
                )
                msg = resp.choices[0].message
                reasoning = (getattr(msg, "reasoning_content", None)
                             or getattr(msg, "thinking", None) or "")
                content = msg.content or ""
                finish = resp.choices[0].finish_reason

                all_content += content
                if reasoning:
                    all_reasoning += reasoning

                is_truncated = (finish == "length")
                has_ended = "#het" in all_content or not is_truncated

                if has_ended or attempt >= MAX_CONTINUATIONS:
                    return all_content, all_reasoning

                # Bị cắt → gọi tiếp
                messages = [
                    {"role": "user", "content": prompt},
                    {"role": "assistant", "content": all_content},
                    {"role": "user", "content": (
                        "Output bị cắt giữa chừng. VIẾT TIẾP CHÍNH XÁC từ chỗ dừng.\n"
                        "- KHÔNG lặp lại phần đã viết\n"
                        "- Tiếp tục viết các câu hỏi còn lại\n"
                        "- Mỗi câu phải có loigiai chi tiết\n"
                        "- Kết thúc bằng #het"
                    )},
                ]
                break
            except Exception as e:
                last_err = e
                if "unexpected" in str(e).lower() or "unrecognized" in str(e).lower():
                    continue
                raise
        else:
            if last_err:
                raise last_err

    return all_content, all_reasoning

# ==============================================================================
# 8. CLEAN TYPST
# ==============================================================================
def clean_typst(raw):
    m = re.search(r"```(?:typst|typ)\s*\n(.*?)```", raw, re.DOTALL)
    if m:
        code = m.group(1)
    else:
        m2 = re.search(r"(#import\s.*?#het)", raw, re.DOTALL)
        code = m2.group(1) if m2 else raw
    code = re.sub(r"^```\w*\s*", "", code.strip(), flags=re.MULTILINE)
    code = re.sub(r"```\s*$", "", code.strip(), flags=re.MULTILINE)
    code = re.sub(r"\*\*([^*]+)\*\*", r"*\1*", code)
    if '#import "@preview/sang-math' not in code and "#import" not in code:
        code = '#import "@preview/sang-math:1.0.6": *\n\n' + code
    if "#het" not in code:
        code = code.rstrip() + "\n\n#het\n"
    return code.strip()

# ==============================================================================
# 9. SYSTEM PROMPT — HỢP ĐỒNG TYPST
# ==============================================================================
TYPST_CONTRACT = r"""
Bạn là CHUYÊN GIA SÁNG TÁC ĐỀ TOÁN THPT, sinh mã Typst nối trực tiếp với trình biên dịch.
Package bắt buộc: @preview/sang-math:1.0.6.

NHIỆM VỤ: Nhận một ĐỀ MẪU (.typ) → sáng tác ĐỀ MỚI TƯƠNG TỰ.
"Tương tự" nghĩa là: CÙNG cấu trúc, CÙNG dạng toán, CÙNG mức độ khó,
nhưng KHÁC số liệu, KHÁC ngữ cảnh, KHÁC cách đặt câu hỏi.

Trả về ĐÚNG MỘT FILE TYPST HOÀN CHỈNH, KHÔNG giải thích Markdown bên ngoài.

KHUNG ĐẦU FILE BẮT BUỘC (copy y chang từ đề mẫu, chỉ đổi tiêu đề + mã đề):
```typst
#import "@preview/sang-math:1.0.6": *

#let True(body) = (body: body, correct: true)

#let mode = "loigiai"
#let accent = rgb("d97706")
#let ma-de = "XXXX"          ← đổi mã đề
#let in-qr-dap-an = true
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP XX",
  school: "CHƯƠNG X: TÊN CHƯƠNG",
  exam-title: "TÊN ĐỀ - ĐỀ N",  ← đổi tiêu đề
  subject: "TOÁN",
  duration: "XX phút",
  structure: auto,
  code: ma-de,
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)
```

CẤU TRÚC CÂU HỎI (giữ y hệt đề mẫu):
1) TN: #tn([Đề], ([$A$], True([$B$]), [$C$], [$D$]), loigiai: [...])
2) DS: #ds([Đề], (True([Ý]), [Ý], True([Ý]), [Ý]), loigiai: [...])
3) TLN: #tln([Đề], [$đáp số$], loigiai: [...])
4) TL: #tl([Đề], lines: 6, loigiai: [...])

CẤU TRÚC PHẦN (giữ y hệt đề mẫu):
```typst
#exam-part([PHẦN I. ...], count: N, reset-counter: true)
```

BẢNG BIẾN THIÊN:
```typst
#bbtv2(var: "x", der: "y'", func: "y",
  x-vals: ($-oo$, $1$, $3$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $4$, $0$, $+oo$))
```

VẼ HÌNH CETZ:
```typst
#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    ...
  })
]
```

QUY TẮC TYPST:
- Dấu thập phân: $1","2$ (KHÔNG $1,2$)
- frac(a,b), sqrt(x), pi, oo — CẤM \frac, \sqrt
- In đậm: *text* (KHÔNG **)
- Chữ trong toán: $"text"$
- True() cho đáp án đúng
- Mỗi câu PHẢI có loigiai chi tiết từng bước
- VẼ HÌNH nếu đề mẫu có hình

CUỐI FILE:
```typst
]
#make-questions()

#if in-qr-dap-an [
  #pagebreak()
  #align(center)[
    #text(weight: "bold", size: 15pt, fill: accent)[QR ĐÁP ÁN OMR - BẢN GIÁO VIÊN]
    #v(0.5em)
    #text(size: 10pt)[Mã đề #ma-de. Mở Sang Math OMR, chọn "Quét QR trực tiếp" để nạp key và chấm bài.]
    #v(1em)
    #sang-omr-qr(ma-de: ma-de, show-info: true, pts: (mcq: 0.25, tf: 0.1, tf-full: 0.5, sh: 0.5))
  ]
]
#print-answer-key()
```

NGUYÊN TẮC SÁNG TÁC:
1. Đọc kỹ đề mẫu → hiểu cấu trúc (bao nhiêu TN, DS, TLN, TL, exam-part nào)
2. Với MỖI câu trong đề mẫu → sáng tác câu MỚI cùng dạng, cùng mức độ
3. Thay đổi: hệ số, hàm số, bối cảnh thực tế, cách hỏi
4. Giữ nguyên: format câu, loigiai chi tiết, vẽ hình nếu có
5. Đáp án PHẢI CHÍNH XÁC, giải PHẢI ĐÚNG LOGIC
6. Nếu đề mẫu có #include "12-4-6ngang.typ" → bỏ dòng này, không include file ngoài

KẾT THÚC: #het
"""

# ==============================================================================
# 10. PIPELINE CHÍNH
# ==============================================================================
def run_pipeline(de_mau_code, che_do, so_de, yeu_cau_them,
                 model, ma_de_moi, ten_de_moi,
                 max_tokens, api_url, api_key):
    """Pipeline: đề mẫu → AI sáng tác → compile Typst → preview."""
    yield "🔄 Đang khởi động...", "", "", ""

    try:
        if not de_mau_code or not de_mau_code.strip():
            yield "⚠️ **Chưa có đề mẫu!** Hãy paste mã Typst hoặc upload file .typ vào ô bên trái.", "", "", ""
            return

        # Phân tích đề mẫu
        n_tn = len(re.findall(r"#tn\(", de_mau_code))
        n_ds = len(re.findall(r"#ds\(", de_mau_code))
        n_tln = len(re.findall(r"#tln\(", de_mau_code))
        n_tl = len(re.findall(r"#tl\(", de_mau_code))
        total = n_tn + n_ds + n_tln + n_tl

        stat_msg = f"📊 Đề mẫu: {n_tn} TN + {n_ds} DS + {n_tln} TLN + {n_tl} TL = {total} câu"
        yield f"🔍 Phân tích đề mẫu... {stat_msg}", "", "", ""

        # Xây prompt
        user_prompt = f"""
{TYPST_CONTRACT}

═══════════════════════════════════════
ĐỀ MẪU GỐC (tham khảo cấu trúc, KHÔNG copy câu):
═══════════════════════════════════════
{de_mau_code}
═══════════════════════════════════════

NHIỆM VỤ: Sáng tác ĐỀ MỚI theo đề mẫu trên.
- Mã đề mới: {ma_de_moi or '2001'}
- Tiêu đề mới: {ten_de_moi or '(giữ nguyên tiêu đề, chỉ đổi số đề)'}
- Chế độ: {che_do}
"""

        if yeu_cau_them and yeu_cau_them.strip():
            user_prompt += f"\n🔧 YÊU CẦU THÊM TỪ GIÁO VIÊN:\n{yeu_cau_them.strip()}\n"

        user_prompt += f"""
⚠️ QUAN TRỌNG:
- Viết TOÀN BỘ {total} câu tương ứng 1-1 với đề mẫu
- Mỗi câu MỚI phải cùng dạng nhưng KHÁC số liệu, hàm số, bối cảnh
- loigiai chi tiết cho MỌI câu
- Kết thúc bằng #het
"""

        # Số đề cần tạo
        num_de = int(so_de)
        all_results = []

        for de_idx in range(1, num_de + 1):
            if num_de > 1:
                this_prompt = user_prompt + f"\nĐây là đề số {de_idx}/{num_de}. Mã đề: {int(ma_de_moi or 2001) + de_idx - 1}"
            else:
                this_prompt = user_prompt

            yield (f"🧠 **{model}** đang sáng tác đề {de_idx}/{num_de} "
                   f"({total} câu tương tự đề mẫu)...", "", "", "")

            result, reasoning = call_llm(
                model, this_prompt, int(max_tokens),
                api_url if api_url and api_url.strip() else None,
                api_key if api_key and api_key.strip() else None
            )
            all_results.append((result, reasoning, de_idx))

        # Compile tất cả
        all_html = ""
        all_codes = []
        all_reasoning = ""
        ts = datetime.now().strftime("%Y%m%d_%H%M%S")

        for result, reasoning, de_idx in all_results:
            suffix = f"_{de_idx}" if num_de > 1 else ""
            name = f"DeMoi_{ts}{suffix}"

            yield f"🎨 Biên dịch Typst đề {de_idx}...", "", "", ""
            code = clean_typst(result)
            typ_f, pdf_f, pngs, err = compile_typst(code, name)

            # Thống kê output
            out_tn = len(re.findall(r"#tn\(", code))
            out_ds = len(re.findall(r"#ds\(", code))
            out_tln = len(re.findall(r"#tln\(", code))
            out_tl = len(re.findall(r"#tl\(", code))

            # Header cho mỗi đề
            if num_de > 1:
                all_html += (f'<h3 style="color:#4F46E5;margin:16px 0 8px">📝 Đề {de_idx}</h3>')

            # Thống kê
            all_html += (
                f'<div style="background:linear-gradient(135deg,#f0fdf4,#ecfdf5);padding:10px 14px;'
                f'border-radius:8px;margin:6px 0;border-left:4px solid #22c55e;font-size:13px">'
                f'📊 <b>Đề mẫu:</b> {n_tn}TN+{n_ds}DS+{n_tln}TLN+{n_tl}TL '
                f'→ <b>Đề mới:</b> '
                f'<span style="color:#4338CA">{out_tn}TN</span>+'
                f'<span style="color:#7C3AED">{out_ds}DS</span>+'
                f'<span style="color:#0891B2">{out_tln}TLN</span>+'
                f'<span style="color:#DC2626">{out_tl}TL</span>'
                f'</div>'
            )

            # Download buttons
            all_html += '<div style="margin:8px 0;display:flex;flex-wrap:wrap;gap:4px">'
            all_html += dl_btn(typ_f, "📄 Typst", "#4F46E5", "text/plain")
            if pdf_f:
                all_html += dl_btn(pdf_f, "📕 PDF", "#DC2626", "application/pdf")
            all_html += '</div>'

            # Preview images
            if pngs:
                for pg in pngs:
                    b = base64.b64encode(pg.read_bytes()).decode()
                    all_html += (f'<div style="text-align:center;margin:8px 0;background:#f8fafc;'
                                f'padding:12px;border-radius:10px">'
                                f'<img src="data:image/png;base64,{b}" style="max-width:100%;'
                                f'border-radius:4px;box-shadow:0 4px 12px rgba(0,0,0,.1)"/></div>')
            elif err:
                safe_err = _html.escape(err[:500])
                all_html += (f'<div style="padding:10px;background:#fef3c7;border-radius:8px;'
                            f'margin:6px 0;border-left:4px solid #f59e0b;font-size:12px">'
                            f'⚠️ Typst warning:<br><pre>{safe_err}</pre></div>')

            all_codes.append(f"// ===== ĐỀ {de_idx} =====\n{code}")
            if reasoning:
                all_reasoning += f"\n--- Đề {de_idx} ---\n{reasoning}"

        status = f"✅ **Sáng tác thành công!** {num_de} đề mới từ đề mẫu ({total} câu/đề)."
        yield status, all_html, all_reasoning, "\n\n".join(all_codes)

    except Exception as ex:
        yield (f"❌ **Lỗi:** {_html.escape(str(ex))}\n\n"
               f"```\n{traceback.format_exc()[-800:]}\n```"), "", "", ""

# ==============================================================================
# 11. XỬ LÝ SỰ KIỆN
# ==============================================================================
def load_sample_file(file_input):
    if file_input is None:
        return ""
    path = file_input if isinstance(file_input, str) else getattr(file_input, "name", "")
    if path and Path(path).exists():
        return Path(path).read_text(encoding="utf-8", errors="replace")
    return ""

def on_chapter_select(chapter_key):
    """Khi chọn chương → hiện chi tiết bài + dạng."""
    detail = get_chapter_detail(chapter_key)
    return detail

def analyze_de_mau(de_mau_code):
    """Phân tích đề mẫu → hiện thống kê."""
    if not de_mau_code or not de_mau_code.strip():
        return "📊 *Chưa có đề mẫu*"
    n_tn = len(re.findall(r"#tn\(", de_mau_code))
    n_ds = len(re.findall(r"#ds\(", de_mau_code))
    n_tln = len(re.findall(r"#tln\(", de_mau_code))
    n_tl = len(re.findall(r"#tl\(", de_mau_code))
    total = n_tn + n_ds + n_tln + n_tl

    # Tìm tiêu đề
    m = re.search(r'exam-title:\s*"([^"]+)"', de_mau_code)
    title = m.group(1) if m else "?"
    m2 = re.search(r'school:\s*"([^"]+)"', de_mau_code)
    school = m2.group(1) if m2 else ""
    m3 = re.search(r'department:\s*"([^"]+)"', de_mau_code)
    dept = m3.group(1) if m3 else ""

    return (
        f"### 📊 Phân tích đề mẫu\n"
        f"- **Tiêu đề:** {title}\n"
        f"- **Lớp/Chương:** {dept} — {school}\n"
        f"- **Trắc nghiệm (TN):** {n_tn} câu\n"
        f"- **Đúng sai (DS):** {n_ds} câu\n"
        f"- **Trả lời ngắn (TLN):** {n_tln} câu\n"
        f"- **Tự luận (TL):** {n_tl} câu\n"
        f"- **Tổng:** {total} câu\n\n"
        f"*AI sẽ sáng tác đề mới bám sát {total} câu này, từng câu tương ứng 1-1.*"
    )

# ==============================================================================
# 12. GIAO DIỆN GRADIO
# ==============================================================================
CSS = """
.gradio-container{max-width:1500px!important}
#header h1{background:linear-gradient(135deg,#7C3AED,#4F46E5,#0EA5E9);
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.6em;margin:0}
#run-btn{min-height:52px;font-size:1.1em;
  background:linear-gradient(135deg,#4F46E5,#7C3AED)!important;border:none!important}
"""

with gr.Blocks(title="Sổ tay Sáng tác Đề Toán THPT v2") as demo:
    gr.Markdown(
        "# 📝 SỔ TAY SÁNG TÁC ĐỀ TOÁN THPT v2\n"
        "**Đề mẫu là trung tâm** — Load đề .typ gốc → AI sáng tác đề mới tương tự từng câu → "
        "biên dịch Typst sang-math:1.0.6 → preview & download",
        elem_id="header",
    )

    with gr.Row():
        # ═══════════════ CỘT TRÁI: ĐỀ MẪU ═══════════════
        with gr.Column(scale=2, min_width=400):

            gr.Markdown("### 📄 ĐỀ MẪU GỐC — *Trung tâm sáng tác*")

            with gr.Tab("📁 Upload file .typ"):
                file_de_mau = gr.File(label="Chọn file .typ đề mẫu", file_types=[".typ"])
                btn_load = gr.Button("📥 Đọc file → Load vào", variant="secondary", size="sm")

            with gr.Tab("📋 Paste mã Typst"):
                pass  # ô paste ở bên dưới

            txt_de_mau = gr.Textbox(
                label="Mã Typst đề mẫu gốc",
                placeholder=(
                    "Paste toàn bộ nội dung file .typ đề mẫu vào đây...\n"
                    "Hoặc upload file .typ ở tab trên.\n\n"
                    "VD: #import \"@preview/sang-math:1.0.6\": *\n..."
                ),
                lines=12, max_lines=50,
            )

            # Thống kê đề mẫu (tự động cập nhật)
            out_analysis = gr.Markdown("📊 *Chưa có đề mẫu — paste hoặc upload ở trên*")

            # Cây chủ đề (tham khảo)
            with gr.Accordion("🗂️ Ngân hàng chủ đề (bank.json — tham khảo)", open=False):
                drp_chapter = gr.Dropdown(
                    choices=_FLAT_CHAPTERS,
                    label="Chọn chương để xem chi tiết bài/dạng",
                    interactive=True,
                )
                out_chapter_detail = gr.Textbox(
                    label="Chi tiết bài + dạng", lines=8, max_lines=20,
                    interactive=False, placeholder="Chọn 1 chương ở trên để xem..."
                )

        # ═══════════════ CỘT PHẢI: CẤU HÌNH + KẾT QUẢ ═══════════════
        with gr.Column(scale=3):

            # --- Cấu hình sáng tác ---
            gr.Markdown("### ⚙️ Cấu hình sáng tác")
            with gr.Row():
                drp_chedo = gr.Dropdown(
                    choices=[
                        "📝 Sáng tác tương tự (cùng dạng, khác số liệu)",
                        "🔄 Biến thể khó hơn (tăng 1 mức độ)",
                        "🔽 Biến thể dễ hơn (giảm 1 mức độ)",
                        "🎯 Giữ nguyên cấu trúc, đổi hoàn toàn ngữ cảnh thực tế",
                        "🔀 Xáo trộn dạng (giữ chủ đề nhưng đổi dạng câu hỏi)",
                    ],
                    value="📝 Sáng tác tương tự (cùng dạng, khác số liệu)",
                    label="Chế độ sáng tác",
                    interactive=True,
                )
                num_de = gr.Number(label="Số đề cần tạo", value=1, minimum=1, maximum=5)

            with gr.Row():
                txt_ma_de = gr.Textbox(label="Mã đề mới", value="2001", max_lines=1)
                txt_ten_de = gr.Textbox(
                    label="Tiêu đề đề mới (bỏ trống = tự đổi số)",
                    placeholder="VD: ĐỀ KIỂM TRA - ĐỀ 11", max_lines=1
                )

            txt_yeu_cau = gr.Textbox(
                label="✏️ Yêu cầu thêm cho AI (tuỳ ý)",
                placeholder=(
                    "VD:\n"
                    "- Câu 3 đổi thành bài thực tế về kinh tế\n"
                    "- Thêm hình vẽ CeTZ cho câu về đồ thị\n"
                    "- Tăng độ khó câu TLN cuối cùng\n"
                    "- accent = rgb(\"0f766e\") thay vì amber"
                ),
                lines=3, max_lines=8,
            )

            with gr.Row():
                drp_model = gr.Dropdown(
                    choices=MODEL_CHOICES,
                    value="anthropic/claude-opus-5@default",
                    label="Mô hình AI",
                    interactive=True,
                )
                sld_tokens = gr.Slider(
                    minimum=8192, maximum=131072,
                    value=65536, step=4096,
                    label="Max Tokens",
                    info="Đề 22+ câu: đặt 65536–131072",
                )

            model_hint = gr.Markdown(
                f"💡 {MODEL_LABELS.get('anthropic/claude-opus-5@default', '')}"
            )

            with gr.Accordion("⚙️ API (tự phát hiện)", open=False):
                inp_url = gr.Textbox(label="Base URL", value=_URL)
                inp_key = gr.Textbox(label="API Key", value=_KEY, type="password")

            # --- NÚT CHẠY ---
            btn_run = gr.Button(
                "📝 SÁNG TÁC ĐỀ MỚI TỪ ĐỀ MẪU → BIÊN DỊCH TYPST",
                variant="primary", elem_id="run-btn",
            )

            # --- KẾT QUẢ ---
            gr.Markdown("### 📊 Kết quả")
            out_status = gr.Markdown("*Chưa chạy — load đề mẫu rồi bấm 📝*")
            out_preview = gr.HTML(label="Preview & Download")

            with gr.Accordion("💭 Quá trình suy luận (Reasoning)", open=False):
                out_reasoning = gr.Textbox(label="Reasoning", lines=12,
                                           max_lines=40, interactive=False)

            with gr.Accordion("💻 Mã Typst đề mới", open=True):
                out_code = gr.Textbox(label="Typst Source", lines=20,
                                      max_lines=60, interactive=False)

    # ═══ SỰ KIỆN ═══
    btn_load.click(fn=load_sample_file, inputs=[file_de_mau], outputs=[txt_de_mau])

    # Tự phân tích khi đề mẫu thay đổi
    txt_de_mau.change(fn=analyze_de_mau, inputs=[txt_de_mau], outputs=[out_analysis])

    # Cây chủ đề
    drp_chapter.change(fn=on_chapter_select, inputs=[drp_chapter], outputs=[out_chapter_detail])

    # Model hint
    drp_model.change(
        fn=lambda m: f"💡 {MODEL_LABELS.get(m, m)}",
        inputs=[drp_model], outputs=[model_hint],
    )

    # Chạy sáng tác
    btn_run.click(
        fn=run_pipeline,
        inputs=[
            txt_de_mau, drp_chedo, num_de, txt_yeu_cau,
            drp_model, txt_ma_de, txt_ten_de,
            sld_tokens, inp_url, inp_key,
        ],
        outputs=[out_status, out_preview, out_reasoning, out_code],
    )

# ==============================================================================
# 🚀 KHỞI CHẠY
# ==============================================================================
if __name__ == "__main__":
    print("📝 Khởi động Sổ tay Sáng tác Đề Toán THPT v2.0...")
    print("   📄 Đề mẫu → AI sáng tác tương tự → Typst → Preview")
    print(f"   🗂️ Ngân hàng: {len(_FLAT_CHAPTERS)} chương, {len(_BANK_RAW)} dạng bài")

    for _kill_cmd in [
        "fuser -k 7860/tcp 2>/dev/null",
        "kill -9 $(lsof -t -i:7860) 2>/dev/null",
    ]:
        subprocess.run(_kill_cmd, shell=True, capture_output=True)

    import time; time.sleep(0.5)

    _launched = False
    for _port in [7860, 7861, 7862, 7863, 7870, 7880]:
        kw = dict(share=True, server_name="0.0.0.0", server_port=_port, show_error=True)
        try:
            demo.queue().launch(css=CSS, theme=gr.themes.Soft(), **kw)
            _launched = True
            break
        except OSError:
            print(f"⚠️ Port {_port} bận, thử port khác...")
            continue
        except TypeError:
            try:
                demo.queue().launch(css=CSS, **kw)
                _launched = True
                break
            except (TypeError, OSError):
                try:
                    demo.queue().launch(**kw)
                    _launched = True
                    break
                except OSError:
                    continue

    if not _launched:
        demo.queue().launch(share=True, server_name="0.0.0.0", show_error=True)
