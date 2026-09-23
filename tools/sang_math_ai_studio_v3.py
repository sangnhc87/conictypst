# ==============================================================================
# ⚡ SANG-MATH AI STUDIO v3.0 — WEB EDITION (Gradio .live)
# Chạy trên Kaggle Notebook → tự tạo link https://xxxx.gradio.live
# OpenAI SDK trực tiếp • Typst sang-math:1.0.5 • Vẽ hình CeTZ • Đa model
# NÂNG CẤP v3: Manim tự render video • Output siêu dài cho OCR nhiều trang
# ==============================================================================

import sys, os, re, html as _html, base64, shutil, subprocess, traceback, importlib.util
from pathlib import Path
from datetime import datetime

for _pkg in ["gradio", "openai"]:
    if importlib.util.find_spec(_pkg) is None:
        subprocess.run([sys.executable, "-m", "pip", "install", "-q", _pkg], check=True)

import gradio as gr
from openai import OpenAI

# ==============================================================================
# 1. THƯ MỤC
# ==============================================================================
AI_ROOT = Path("/kaggle/working/ai_math_web")
UPLOAD_DIR = AI_ROOT / "uploads"
RESULT_DIR = AI_ROOT / "results"
RENDER_DIR = AI_ROOT / "renders"
MANIM_DIR = AI_ROOT / "manim_renders"
for _d in [UPLOAD_DIR, RESULT_DIR, RENDER_DIR, MANIM_DIR]:
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
# 3. MODELS & OPTIONS
# ==============================================================================
MODEL_CHOICES = [
    "openai/gpt-6-astra",
    "deepseek-ai/deepseek-r1-0528",
    "qwen/qwen3-next-80b-a3b-thinking",
    "qwen/qwen3-coder-480b-a35b-instruct",
    "anthropic/claude-opus-5@default",
    "anthropic/claude-sonnet-5@default",
    "anthropic/claude-sonnet-4-6@default",
    "xai/grok-4.6",
    "xai/grok-4.20-0309-reasoning",
    "google/gemini-3.1-pro-preview",
    "google/gemini-3.8-flash",
    "google/gemini-2.5-pro",
    "qwen/qwen3-235b-a22b-instruct-2507",
    "zai/glm-5",
]

MODEL_LABELS = {
    "openai/gpt-6-astra": "⚡ GPT-6 Astra — Đỉnh cao toán học",
    "deepseek-ai/deepseek-r1-0528": "🧠 DeepSeek-R1 — Vua suy luận",
    "qwen/qwen3-next-80b-a3b-thinking": "🤔 Qwen3 Thinking — Tư duy hình học",
    "qwen/qwen3-coder-480b-a35b-instruct": "💻 Qwen3 Coder 480B — Viết mã CeTZ",
    "anthropic/claude-opus-5@default": "👑 Claude Opus 5 — Typst chuẩn sư phạm",
    "anthropic/claude-sonnet-5@default": "🎯 Claude Sonnet 5 — Nhanh & chính xác",
    "anthropic/claude-sonnet-4-6@default": "🟠 Claude Sonnet 4.6 — Cân bằng tốt",
    "xai/grok-4.6": "🚀 Grok 4.6 — Suy luận mạnh",
    "xai/grok-4.20-0309-reasoning": "🔬 Grok Reasoning — Chuyên sâu",
    "google/gemini-3.1-pro-preview": "👁️ Gemini 3.1 Pro — Đọc ảnh siêu nét",
    "google/gemini-3.8-flash": "⚡ Gemini 3.8 Flash — Siêu tốc",
    "google/gemini-2.5-pro": "🔵 Gemini 2.5 Pro — Suy luận dài",
    "qwen/qwen3-235b-a22b-instruct-2507": "🟡 Qwen3 235B — Đa năng",
    "zai/glm-5": "🔴 GLM-5 — Hỗ trợ Trung/Việt",
}

TASK_CHOICES = ["🧠 Giải Toán THPT", "📄 OCR Ảnh/PDF→Typst", "💻 Lập trình Manim/CeTZ", "📚 Phân tích đề thi"]
FORMAT_CHOICES = ["📐 Typst (sang-math:1.0.5)", "🎬 Manim (.py → .mp4)", "📝 Markdown+LaTeX (.md)"]

# ==============================================================================
# 4. TOOLS: TYPST, PDF, MANIM
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

def ensure_pdf_tools():
    miss = [t for t in ["pdftoppm", "pdfinfo", "pandoc"] if not shutil.which(t)]
    if miss:
        subprocess.run(["apt-get", "update", "-qq"], capture_output=True)
        subprocess.run(["apt-get", "install", "-y", "-qq", "poppler-utils", "pandoc"], capture_output=True)

_MANIM_READY = False

def ensure_manim():
    """Cài đặt Manim Community và dependencies nếu chưa có."""
    global _MANIM_READY
    if _MANIM_READY:
        return True

    # Kiểm tra Manim đã cài chưa
    try:
        r = subprocess.run([sys.executable, "-c", "import manim; print(manim.__version__)"],
                           capture_output=True, text=True, timeout=15)
        if r.returncode == 0:
            _MANIM_READY = True
            return True
    except Exception:
        pass

    # Cài system dependencies
    sys_deps = [
        "build-essential", "libcairo2-dev", "libpango1.0-dev",
        "ffmpeg", "texlive", "texlive-latex-extra",
        "texlive-fonts-extra", "texlive-science",
    ]
    subprocess.run(["apt-get", "update", "-qq"], capture_output=True)
    subprocess.run(["apt-get", "install", "-y", "-qq"] + sys_deps, capture_output=True)

    # Cài Manim
    subprocess.run(
        [sys.executable, "-m", "pip", "install", "-q", "manim"],
        capture_output=True, check=False
    )

    # Verify
    try:
        r = subprocess.run([sys.executable, "-c", "import manim; print(manim.__version__)"],
                           capture_output=True, text=True, timeout=15)
        if r.returncode == 0:
            _MANIM_READY = True
            return True
    except Exception:
        pass

    return False

def render_pdf_pages(pdf_path, pages_str="all"):
    ensure_pdf_tools()
    r = subprocess.run(["pdfinfo", str(pdf_path)], capture_output=True, text=True)
    m = re.search(r"^Pages:\s+(\d+)", r.stdout, re.MULTILINE)
    total = int(m.group(1)) if m else 1
    sel = pages_str.strip().lower()
    if sel in {"", "all", "*", "tất cả"}:
        pages = list(range(1, total + 1))
    else:
        pages = set()
        for p in sel.split(","):
            p = p.strip()
            if "-" in p:
                try:
                    a, b = map(int, p.split("-", 1))
                    pages.update(range(min(a, b), max(a, b) + 1))
                except ValueError:
                    pass
            elif p.isdigit():
                pages.add(int(p))
        pages = sorted(pg for pg in pages if 1 <= pg <= total)
    out_dir = Path(pdf_path).parent / f"{Path(pdf_path).stem}_render"
    out_dir.mkdir(exist_ok=True)
    results = []
    for pg in pages:
        prefix = out_dir / f"page_{pg:04d}"
        png = Path(f"{prefix}.png")
        if not png.exists():
            subprocess.run(["pdftoppm", "-png", "-r", "200", "-f", str(pg), "-l", str(pg),
                            "-singlefile", str(pdf_path), str(prefix)], capture_output=True)
        if png.exists():
            results.append(png)
    return results

def run_manim(py_code, name):
    """Chạy Manim render và trả về (py_path, mp4_path, log)."""
    py_path = RESULT_DIR / f"{name}.py"
    py_path.write_text(py_code, encoding="utf-8")

    # Tìm tên Scene class trong code
    scene_names = re.findall(r"class\s+(\w+)\s*\(.*?Scene\s*\)", py_code)
    if not scene_names:
        return py_path, None, "❌ Không tìm thấy class Scene nào trong mã Manim!"

    # Render từng Scene
    rendered_videos = []
    all_logs = []

    for scene_name in scene_names:
        # Sử dụng media_dir riêng để dễ tìm output
        media_dir = MANIM_DIR / name
        media_dir.mkdir(parents=True, exist_ok=True)

        cmd = [
            sys.executable, "-m", "manim", "render",
            "-qm",  # Medium quality (720p) - cân bằng chất lượng/tốc độ
            "--media_dir", str(media_dir),
            "--disable_caching",
            str(py_path),
            scene_name,
        ]

        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=300,  # 5 phút timeout
                cwd=str(RESULT_DIR),
            )
            all_logs.append(f"=== {scene_name} ===\n{result.stdout}\n{result.stderr}")

            # Tìm file video output
            # Manim output thường ở: media_dir/videos/{filename}/720p30/{scene_name}.mp4
            video_patterns = [
                media_dir / "videos" / name / "720p30" / f"{scene_name}.mp4",
                media_dir / "videos" / name / "1080p60" / f"{scene_name}.mp4",
                media_dir / "videos" / name / "480p15" / f"{scene_name}.mp4",
            ]

            found = False
            for vp in video_patterns:
                if vp.exists():
                    # Copy ra thư mục kết quả với tên dễ hiểu
                    final_mp4 = RESULT_DIR / f"{name}_{scene_name}.mp4"
                    shutil.copy2(vp, final_mp4)
                    rendered_videos.append(final_mp4)
                    found = True
                    break

            if not found:
                # Tìm rộng hơn
                for mp4 in media_dir.rglob(f"{scene_name}.mp4"):
                    final_mp4 = RESULT_DIR / f"{name}_{scene_name}.mp4"
                    shutil.copy2(mp4, final_mp4)
                    rendered_videos.append(final_mp4)
                    break

        except subprocess.TimeoutExpired:
            all_logs.append(f"=== {scene_name} === ⏰ TIMEOUT sau 5 phút!")
        except Exception as e:
            all_logs.append(f"=== {scene_name} === ❌ Lỗi: {e}")

    log_text = "\n".join(all_logs)
    return py_path, rendered_videos, log_text

# ==============================================================================
# 5. PROMPT TEMPLATE
# ==============================================================================
SANG_MATH_CONTRACT = r"""
Bạn là bộ sinh mã nối trực tiếp với trình biên dịch Typst.
HỢP ĐỒNG BẮT BUỘC: sang-math-ai-contract/1.0.5-r1.
Package bắt buộc: @preview/sang-math:1.0.5
Chú ý: Dấu thập phân trong typst ko dùng 1,2 mà dùng 1","2 mới đúng.
Phải vẽ hình cho bài giải, sơ đồ cây, hình chuẩn đẹp.

MỤC TIÊU:
- Trả về ĐÚNG MỘT FILE TYPST HOÀN CHỈNH, không Markdown giải thích ngoài mã.
- File chạy ở profile=loigiai hiển thị đề + đáp án + lời giải chi tiết.

KHUNG ĐẦU FILE BẮT BUỘC:
#import "@preview/sang-math:1.0.5": *
#let profile = sys.inputs.at("profile", default: "loigiai")
#let preset = exam-preset(theme: "teal-pro", profile: profile)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#show: sang-setup.with(math-color: black)
#show: exam-theme.with(
  theme: preset.theme, school: "BỘ ĐỀ TOÁN THPT",
  exam-title: "BÀI TẬP VÀ LỜI GIẢI CHI TIẾT",
  subject: "TOÁN HỌC", duration: "90 phút", code: "101", ..preset.template,
)
#exam-part([CÂU HỎI VÀ LỜI GIẢI CHI TIẾT], count: 1)

CẤU TRÚC CÂU HỎI:
1) TN: #tn([Đề], ([$A$], True([$B$]), [$C$], [$D$]), id: "TN01", tags: ("chu-de","TH"), loigiai: [...])
2) ĐS: #ds([Đề], (True([Ý đúng]), [Ý sai], True([Ý đúng]), [Ý sai]), id: "DS01", tags: ("chu-de","TH"), loigiai: [...])
3) TLN: #tln([Đề], [$đáp số$], id: "TLN01", tags: ("chu-de","VD"), loigiai: [...])
4) TL: #tl([Đề], id: "TL01", tags: ("chu-de","VDC"), lines: 6, loigiai: [...])

BẢNG BIẾN THIÊN: #bbtv2(var: $x$, der: $y'$, func: $y$, x-vals: ($-oo$,$1$,$3$,$+oo$), d-signs: ($+$,$0$,$-$,$0$,$+$), v-vals: ($-oo$,$4$,$0$,$+oo$))

VẼ HÌNH CETZ:
1. `#align(center, cetz.canvas({ import cetz.draw: *; ... }))`
2. Nét đứt: `line(A, B, stroke: (dash: "dashed", thickness: 0.8pt))`
3. Nhãn: `content(A, [ $A$ ], anchor: "east")`

QUY TẮC: Dùng frac(a,b), sqrt(x), pi, oo. CẤM \frac, \sqrt, \begin. IN ĐẬM: *text* (ko **). CHỮ TRONG TOÁN: $"text"$.

QUAN TRỌNG: Khi đề bài dài (nhiều câu, nhiều trang), phải giải TOÀN BỘ tất cả các câu.
KHÔNG được bỏ sót câu nào. Viết đầy đủ lời giải cho MỌI câu hỏi trong đề.
Nếu output bị dài, cứ viết hết, hệ thống sẽ tự nối các phần.

KẾT THÚC: #het
"""

def build_prompt(task, text, fmt):
    if "Typst" in fmt:
        extra = f"\n\n[ĐỀ BÀI]:\n{text}" if text.strip() else ""
        return SANG_MATH_CONTRACT + extra
    elif "Manim" in fmt:
        return (
            "Viết mã Python Manim Community Edition hoàn chỉnh.\n"
            "QUY TẮC BẮT BUỘC:\n"
            "1. Import: `from manim import *`\n"
            "2. Tạo class kế thừa Scene (VD: `class MathSolution(Scene):`)\n"
            "3. Implement method `construct(self)`\n"
            "4. Dùng MathTex cho công thức LaTeX, Text cho chữ thường\n"
            "5. Hoạt họa từng bước: Write, FadeIn, Transform, Create...\n"
            "6. Dùng self.play() cho animation, self.wait() cho pause\n"
            "7. Code phải chạy TRỰC TIẾP được với `manim render -qm file.py`\n"
            "8. KHÔNG dùng thư viện ngoài ngoài manim\n"
            "9. Trả về ĐÚNG MỘT FILE PYTHON, không giải thích Markdown bên ngoài\n\n"
            f"Yêu cầu: {text}"
        )
    else:
        return (
            "Viết Markdown kèm LaTeX ($ $ và $$ $$), trình bày rõ từng bước.\n"
            "Giải TOÀN BỘ các câu hỏi, không bỏ sót câu nào.\n\n"
            f"Yêu cầu: {text}"
        )

# ==============================================================================
# 6. GỌI LLM — HỖ TRỢ OUTPUT SIÊU DÀI
# ==============================================================================
def call_llm(model_id, prompt, image_paths=None, max_tokens=32768, url=None, key=None):
    u = (url or _URL or "").strip() or "https://api.kaggle.com/v1"
    k = (key or _KEY or "").strip()
    if not k:
        raise ValueError("Chưa có API Key! Nhập ở mục ⚙️ API bên trái, hoặc thêm Kaggle Secret: MODEL_PROXY_API_KEY")
    client = OpenAI(base_url=u, api_key=k)

    parts = [{"type": "text", "text": prompt}]
    if image_paths:
        for ip in image_paths:
            ip = Path(ip)
            if not ip.exists():
                continue
            b64 = base64.b64encode(ip.read_bytes()).decode()
            mime = {".png": "image/png", ".jpg": "image/jpeg", ".jpeg": "image/jpeg",
                    ".webp": "image/webp"}.get(ip.suffix.lower(), "image/png")
            parts.append({"type": "image_url", "image_url": {"url": f"data:{mime};base64,{b64}"}})

    messages = [{"role": "user", "content": parts if len(parts) > 1 else prompt}]

    all_content = ""
    all_reasoning = ""
    MAX_CONTINUATIONS = 6  # ↑ Tăng từ 3 → 6 cho OCR nhiều trang

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

                # Kiểm tra có bị cắt giữa chừng không
                is_truncated = (finish == "length")

                # Kiểm tra kết thúc hợp lệ theo loại format
                has_typst_end = "#het" in all_content
                has_manim_end = bool(re.search(
                    r"(class\s+\w+\s*\(.*?Scene\s*\).*?def\s+construct)",
                    all_content, re.DOTALL
                )) and not is_truncated
                has_ended = has_typst_end or has_manim_end or not is_truncated

                if has_ended or attempt >= MAX_CONTINUATIONS:
                    return all_content, all_reasoning

                # Bị cắt → gọi tiếp
                cont_prompt = (
                    "Output bị cắt giữa chừng. Hãy VIẾT TIẾP CHÍNH XÁC từ chỗ dừng.\n"
                    "QUY TẮC:\n"
                    "- KHÔNG lặp lại bất kỳ phần nào đã viết\n"
                    "- Bắt đầu ngay từ dòng tiếp theo sau chỗ bị cắt\n"
                    "- Tiếp tục giải các câu còn lại\n"
                    "- Kết thúc bằng #het (nếu Typst) hoặc hoàn thành method construct (nếu Manim)"
                )

                messages = [
                    {"role": "user", "content": parts if len(parts) > 1 else prompt},
                    {"role": "assistant", "content": all_content},
                    {"role": "user", "content": cont_prompt},
                ]
                break  # Thoát vòng tok_key, tiếp vòng attempt

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
# 7. XỬ LÝ TYPST
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
        code = '#import "@preview/sang-math:1.0.5": *\n\n' + code
    if "#het" not in code:
        code = code.rstrip() + "\n\n#het\n"
    return code.strip()

def clean_manim(raw):
    """Trích mã Manim Python từ output AI."""
    # Tìm code block python
    m = re.search(r"```(?:python|py)\s*\n(.*?)```", raw, re.DOTALL)
    if m:
        code = m.group(1)
    else:
        # Tìm từ "from manim import" đến hết
        m2 = re.search(r"(from manim import.*)", raw, re.DOTALL)
        code = m2.group(1) if m2 else raw

    code = re.sub(r"^```\w*\s*", "", code.strip(), flags=re.MULTILINE)
    code = re.sub(r"```\s*$", "", code.strip(), flags=re.MULTILINE)

    # Đảm bảo có import
    if "from manim import" not in code and "import manim" not in code:
        code = "from manim import *\n\n" + code

    return code.strip()

def compile_typst(code, name):
    ensure_typst()
    typ = RESULT_DIR / f"{name}.typ"
    pdf = RESULT_DIR / f"{name}.pdf"
    png_pre = RENDER_DIR / f"{name}_p"
    for f in RENDER_DIR.glob(f"{name}_p_*.png"):
        f.unlink(missing_ok=True)
    typ.write_text(code, encoding="utf-8")
    subprocess.run(["typst", "compile", str(typ), str(pdf)], capture_output=True, text=True)
    subprocess.run(["typst", "compile", "--format", "png", "--ppi", "200", str(typ), f"{png_pre}_{{p}}.png"],
                   capture_output=True, text=True)
    pngs = sorted(RENDER_DIR.glob(f"{name}_p_*.png"))
    err = ""
    if not pngs:
        r = subprocess.run(["typst", "compile", str(typ), str(pdf)], capture_output=True, text=True)
        err = r.stderr
    return typ, (pdf if pdf.exists() else None), pngs, err

# ==============================================================================
# 8. HELPER: base64 download button & video embed
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

def video_embed(path, title=""):
    """Tạo HTML video player nhúng base64."""
    if not path or not Path(path).exists():
        return ""
    b = base64.b64encode(Path(path).read_bytes()).decode()
    n = Path(path).name
    title_html = f'<h4 style="color:#7c3aed;margin:8px 0 4px">🎬 {_html.escape(title or n)}</h4>' if title else ""
    return (
        f'{title_html}'
        f'<div style="text-align:center;margin:12px 0;background:#0f0f23;'
        f'padding:16px;border-radius:12px;box-shadow:0 8px 24px rgba(0,0,0,.2)">'
        f'<video controls playsinline style="max-width:100%;border-radius:8px;'
        f'box-shadow:0 4px 12px rgba(0,0,0,.3)" preload="metadata">'
        f'<source src="data:video/mp4;base64,{b}" type="video/mp4">'
        f'Trình duyệt không hỗ trợ video.'
        f'</video></div>'
    )

# ==============================================================================
# 9. XỬ LÝ ẢNH TỪ GRADIO
# ==============================================================================
def resolve_image(img_input):
    if img_input is None:
        return None
    if isinstance(img_input, str):
        return img_input if Path(img_input).exists() else None
    if isinstance(img_input, dict):
        return img_input.get("path") or img_input.get("url") or img_input.get("name")
    try:
        import numpy as np
        from PIL import Image
        if isinstance(img_input, np.ndarray):
            p = UPLOAD_DIR / f"img_{datetime.now():%H%M%S%f}.png"
            Image.fromarray(img_input).save(str(p))
            return str(p)
    except Exception:
        pass
    return None

def resolve_file(file_input):
    if file_input is None:
        return None
    if isinstance(file_input, str):
        return file_input
    if hasattr(file_input, "name"):
        return file_input.name
    return None

# ==============================================================================
# 10. PIPELINE CHÍNH
# ==============================================================================
def run_pipeline(task, model, fmt, text, image, pdf_file, pdf_pages, max_tokens, api_url, api_key):
    """Xử lý chính: nhận input → gọi AI → compile/render → trả kết quả."""
    yield "🔄 Đang khởi động...", "", "", ""

    try:
        # Thu thập ảnh
        img_paths = []
        img_p = resolve_image(image)
        if img_p:
            img_paths.append(img_p)

        pdf_p = resolve_file(pdf_file)
        if pdf_p and Path(pdf_p).suffix.lower() == ".pdf":
            yield "📄 Đang render PDF...", "", "", ""
            for pg_img in render_pdf_pages(pdf_p, pdf_pages or "all"):
                img_paths.append(str(pg_img))

        if not text.strip() and not img_paths:
            yield "⚠️ Vui lòng nhập đề bài hoặc upload ảnh/PDF!", "", "", ""
            return

        prompt = build_prompt(task, text, fmt)
        token_count = int(max_tokens)

        # Thông báo nếu OCR nhiều ảnh
        n_imgs = len(img_paths)
        if n_imgs > 3:
            yield (f"📸 Phát hiện {n_imgs} ảnh/trang — sử dụng chế độ output dài "
                   f"(max {token_count:,} tokens × {1 + 6} lần nối)...", "", "", "")

        # Gọi AI
        yield f"🧠 **{model}** đang suy luận...", "", "", ""

        if img_paths:
            all_content = []
            reasoning_text = ""

            # Gom ảnh thành batch nếu nhiều (mỗi batch 4 ảnh)
            BATCH_SIZE = 4
            batches = [img_paths[i:i+BATCH_SIZE] for i in range(0, len(img_paths), BATCH_SIZE)]

            for bi, batch in enumerate(batches, 1):
                if len(batches) > 1:
                    batch_prompt = (
                        f"{prompt}\n\n"
                        f"[BATCH {bi}/{len(batches)}] Đây là ảnh trang {(bi-1)*BATCH_SIZE+1}"
                        f"-{min(bi*BATCH_SIZE, n_imgs)} trong tổng {n_imgs} trang.\n"
                        f"Giải TOÀN BỘ các câu hỏi thấy trong các ảnh này."
                    )
                else:
                    batch_prompt = prompt

                yield f"🧠 Xử lý batch ảnh {bi}/{len(batches)} ({len(batch)} ảnh)...", "", "", ""
                c, r = call_llm(model, batch_prompt, batch, token_count,
                                api_url if api_url and api_url.strip() else None,
                                api_key if api_key and api_key.strip() else None)
                all_content.append(c)
                if r:
                    reasoning_text += f"\n--- Batch {bi} ---\n{r}"

            result = "\n\n".join(all_content)
        else:
            result, reasoning_text = call_llm(
                model, prompt, None, token_count,
                api_url if api_url and api_url.strip() else None,
                api_key if api_key and api_key.strip() else None)

        ts = datetime.now().strftime("%Y%m%d_%H%M%S")

        # ─────────────────────────────────────────────
        # XỬ LÝ OUTPUT THEO FORMAT
        # ─────────────────────────────────────────────

        if "Typst" in fmt:
            # === TYPST ===
            yield "🎨 Biên dịch Typst...", "", "", ""
            code = clean_typst(result)
            typ_f, pdf_f, pngs, err = compile_typst(code, f"Sol_{ts}")

            preview = ""
            if pngs:
                for pg in pngs:
                    b = base64.b64encode(pg.read_bytes()).decode()
                    preview += (f'<div style="text-align:center;margin:12px 0;background:#f1f5f9;'
                                f'padding:16px;border-radius:10px">'
                                f'<img src="data:image/png;base64,{b}" style="max-width:100%;'
                                f'border-radius:4px;box-shadow:0 6px 16px rgba(0,0,0,.1)"/></div>')

            dl_html = '<div style="margin:10px 0">'
            dl_html += dl_btn(typ_f, "📄 Typst", "#4F46E5", "text/plain")
            if pdf_f:
                dl_html += dl_btn(pdf_f, "📕 PDF", "#DC2626", "application/pdf")
            dl_html += '</div>'

            if pngs:
                status = "✅ **Biên dịch thành công!** Xem preview và tải file bên dưới."
            elif err:
                status = f"⚠️ **Typst cảnh báo:**\n```\n{err[:500]}\n```"
            else:
                status = "⚠️ Typst tạo file nhưng không render được PNG"

            yield status, dl_html + preview, reasoning_text, code

        elif "Manim" in fmt:
            # === MANIM — TỰ RENDER VIDEO ===
            yield "🎬 Đang cài đặt Manim...", "", "", ""

            manim_ok = ensure_manim()
            if not manim_ok:
                # Manim không cài được → chỉ trả code
                code = clean_manim(result)
                src = RESULT_DIR / f"Sol_{ts}.py"
                src.write_text(code, encoding="utf-8")
                dl_html = '<div style="margin:10px 0">'
                dl_html += dl_btn(src, "🐍 Python", "#4F46E5", "text/plain")
                dl_html += '</div>'
                dl_html += ('<div style="padding:12px;background:#fef3c7;border-radius:8px;'
                            'margin:8px 0;border-left:4px solid #f59e0b">'
                            '⚠️ Không cài được Manim trên môi trường này. '
                            'Tải file .py về máy và chạy: <code>manim render -qm file.py</code>'
                            '</div>')
                yield "⚠️ Manim chưa cài được — đã xuất file .py", dl_html, reasoning_text, code
                return

            yield "🎬 Đang render video Manim...", "", "", ""
            code = clean_manim(result)
            py_path, videos, render_log = run_manim(code, f"Manim_{ts}")

            # Tạo HTML output
            dl_html = '<div style="margin:10px 0">'
            dl_html += dl_btn(py_path, "🐍 Python Source", "#4F46E5", "text/plain")

            if videos:
                for vp in videos:
                    dl_html += dl_btn(vp, f"🎬 {vp.stem}", "#7C3AED", "video/mp4")
            dl_html += '</div>'

            # Nhúng video player
            video_html = ""
            if videos:
                for vp in videos:
                    video_html += video_embed(vp, vp.stem)
            else:
                # Không render được → hiện log lỗi
                safe_log = _html.escape(render_log[-800:]) if render_log else "Không có log"
                video_html = (
                    f'<div style="padding:12px;background:#fee2e2;border-radius:8px;'
                    f'margin:8px 0;border-left:4px solid #ef4444">'
                    f'<strong>❌ Render thất bại</strong><br>'
                    f'<pre style="font-size:11px;white-space:pre-wrap;margin-top:8px">{safe_log}</pre>'
                    f'<br>💡 Thử tải .py và chạy local: <code>manim render -qm file.py</code>'
                    f'</div>'
                )

            if videos:
                status = f"✅ **Render thành công!** {len(videos)} video đã tạo."
            else:
                status = "⚠️ **Render Manim thất bại** — xem log bên dưới. File .py vẫn có thể tải."

            yield status, dl_html + video_html, reasoning_text, code

        else:
            # === MARKDOWN ===
            ext = ".md"
            src = RESULT_DIR / f"Sol_{ts}{ext}"
            src.write_text(result, encoding="utf-8")

            dl_html = '<div style="margin:10px 0">'
            dl_html += dl_btn(src, "📄 Markdown", "#4F46E5", "text/plain")

            ensure_pdf_tools()
            docx = RESULT_DIR / f"Sol_{ts}.docx"
            try:
                subprocess.run(["pandoc", str(src), "-o", str(docx)], check=True, capture_output=True)
                dl_html += dl_btn(docx, "📘 Word DOCX", "#0284C7",
                                  "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
            except Exception:
                pass
            dl_html += '</div>'

            yield "✅ **Xử lý hoàn tất!**", dl_html, reasoning_text, result

    except Exception as ex:
        yield (f"❌ **Lỗi:** {_html.escape(str(ex))}\n\n"
               f"```\n{traceback.format_exc()[-800:]}\n```"), "", "", ""

# ==============================================================================
# 11. GIAO DIỆN GRADIO
# ==============================================================================
CSS = """
.gradio-container{max-width:1400px!important}
#header h1{background:linear-gradient(135deg,#4338CA,#6366F1,#EC4899);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.7em;margin:0}
#header p{color:#6b7280;margin:2px 0 0;font-size:.92em}
#run-btn{min-height:50px;font-size:1.1em}
.video-container video{border-radius:8px;box-shadow:0 4px 12px rgba(0,0,0,.2)}
"""

with gr.Blocks(title="Sang-Math AI Studio v3.0") as demo:
    gr.Markdown(
        "# ⚡ SANG-MATH AI STUDIO v3.0\n"
        "Giải Toán THPT • Typst sang-math:1.0.5 • Vẽ hình CeTZ • Manim render video • "
        "14 model AI • Output siêu dài cho OCR",
        elem_id="header",
    )

    with gr.Row():
        # ═══ SIDEBAR ═══
        with gr.Column(scale=1, min_width=300):
            gr.Markdown("### ⚙️ Cấu hình")
            drp_task = gr.Dropdown(choices=TASK_CHOICES, value=TASK_CHOICES[0],
                                   label="Nhu cầu", interactive=True)
            drp_model = gr.Dropdown(choices=MODEL_CHOICES, value="openai/gpt-6-astra",
                                    label="Mô hình AI", interactive=True)
            model_hint = gr.Markdown(f"💡 {MODEL_LABELS.get('openai/gpt-6-astra', '')}")
            drp_fmt = gr.Dropdown(choices=FORMAT_CHOICES, value=FORMAT_CHOICES[0],
                                  label="Định dạng xuất", interactive=True)
            sld_tokens = gr.Slider(
                minimum=4096, maximum=131072,
                value=32768, step=2048,
                label="Max Tokens (đầu ra)",
                info="OCR nhiều trang: đặt 65536–131072",
            )

            with gr.Accordion("⚙️ API (tự động phát hiện)", open=False):
                inp_url = gr.Textbox(label="Base URL", value=_URL,
                                     placeholder="https://api.kaggle.com/v1")
                inp_key = gr.Textbox(label="API Key", value=_KEY, type="password",
                                     placeholder="MODEL_PROXY_API_KEY")

            with gr.Accordion("📌 Hướng dẫn", open=False):
                gr.Markdown(
                    "- **Giải Toán**: nhập đề → chọn model → bấm Chạy\n"
                    "- **OCR**: upload ảnh/PDF đề bài → AI chuyển sang Typst\n"
                    "- **Manim**: chọn format \"Manim\" → AI viết code + render video .mp4\n"
                    "- **OCR dài**: tăng Max Tokens lên 65536–131072\n"
                    "- **Reasoning**: DeepSeek-R1, Qwen Thinking, Grok sẽ hiện quá trình suy luận\n"
                    "- **Download**: bấm nút download trong kết quả\n"
                    "- **Model tốt nhất cho Toán**: GPT-6 Astra, DeepSeek-R1\n"
                    "- **Model tốt nhất cho CeTZ**: Qwen3 Coder, Claude Opus 5\n"
                    "- **Model tốt nhất cho Manim**: GPT-6, Claude, Qwen3 Coder"
                )

        # ═══ MAIN ═══
        with gr.Column(scale=3):
            gr.Markdown("### 📁 Dữ liệu đầu vào")
            txt_input = gr.Textbox(
                label="Đề bài / Yêu cầu",
                placeholder="Nhập đề bài Toán, mô tả yêu cầu, hoặc paste đoạn code cần xử lý...",
                lines=5, max_lines=16,
            )
            with gr.Row():
                img_input = gr.Image(label="📷 Ảnh đề bài (upload / paste)")
                with gr.Column():
                    pdf_input = gr.File(label="📄 PDF đề bài")
                    txt_pages = gr.Textbox(label="Trang PDF", value="all",
                                           placeholder="all / 1,2-5")

            btn_run = gr.Button("⚡ CHẠY AI & BIÊN DỊCH SANG-MATH",
                                variant="primary", elem_id="run-btn")

            # Output
            gr.Markdown("### 📊 Kết quả")
            out_status = gr.Markdown("*Chưa chạy — bấm nút ⚡ để bắt đầu*")
            out_preview = gr.HTML(label="Preview / Video / Download")

            with gr.Accordion("💭 Quá trình suy luận (Reasoning)", open=False):
                out_reasoning = gr.Textbox(label="Reasoning", lines=12, max_lines=40,
                                           interactive=False)

            with gr.Accordion("💻 Mã nguồn", open=True):
                out_code = gr.Textbox(label="Source Code", lines=18, max_lines=50,
                                      interactive=False)

            gr.Examples(
                examples=[
                    ["Giải phương trình $x^2 - 5x + 6 = 0$. Vẽ đồ thị hàm số $y = x^2 - 5x + 6$ kèm bảng biến thiên."],
                    ["Cho hình chóp S.ABCD có đáy ABCD là hình vuông cạnh a, SA vuông góc mặt phẳng đáy, SA=a√2. Tính thể tích khối chóp và khoảng cách từ A đến (SBC)."],
                    ["Tìm GTLN, GTNN của hàm số $f(x) = x^3 - 3x + 2$ trên đoạn $[-2; 2]$. Lập bảng biến thiên đầy đủ."],
                    ["Trong không gian Oxyz, cho mặt cầu $(S): x^2+y^2+z^2-2x+4y-6z-11=0$. Tìm tâm, bán kính và viết phương trình mặt phẳng tiếp xúc tại M(3,-1,2)."],
                ],
                inputs=txt_input,
                label="💡 Đề mẫu — bấm để thử",
            )

    # ═══ SỰ KIỆN ═══
    drp_model.change(
        fn=lambda m: f"💡 {MODEL_LABELS.get(m, m)}",
        inputs=[drp_model], outputs=[model_hint],
    )

    btn_run.click(
        fn=run_pipeline,
        inputs=[drp_task, drp_model, drp_fmt, txt_input, img_input,
                pdf_input, txt_pages, sld_tokens, inp_url, inp_key],
        outputs=[out_status, out_preview, out_reasoning, out_code],
    )

# ==============================================================================
# 🚀 KHỞI CHẠY
# ==============================================================================
if __name__ == "__main__":
    print("🚀 Khởi động Sang-Math AI Studio v3.0 Web Edition...")
    print("   ✨ Tính năng mới: Manim auto-render • Output siêu dài cho OCR")

    # Giải phóng port — thử nhiều cách vì môi trường Kaggle có thể thiếu lsof
    for _kill_cmd in [
        "fuser -k 7860/tcp 2>/dev/null",
        "kill -9 $(lsof -t -i:7860) 2>/dev/null",
        "ss -tlnp 'sport = :7860' 2>/dev/null | awk 'NR>1{split($NF,a,\",\"); split(a[1],b,\"=\"); system(\"kill -9 \" b[2])}' 2>/dev/null",
    ]:
        subprocess.run(_kill_cmd, shell=True, capture_output=True)

    import time; time.sleep(0.5)  # Chờ port release

    # Thử launch với nhiều port
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
        print("❌ Không tìm được port trống! Thử launch không chỉ định port...")
        demo.queue().launch(share=True, server_name="0.0.0.0", show_error=True)
