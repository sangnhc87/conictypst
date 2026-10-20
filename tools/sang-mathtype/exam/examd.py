#!/usr/bin/env python3
"""Cầu nối dòng lệnh tới bộ máy xử lý đề thi (trộn đề, làm đẹp) vốn viết cho Pyodide trong trình duyệt.
Chạy trực tiếp bằng Python trên máy: giả lập micropip và .to_py() rồi gọi lại đúng các hàm cũ.

  examd.py count    <de.docx>
  examd.py analyze  <de.docx>
  examd.py beautify <de.docx> <thu_muc_ra> [options.json]
  examd.py shuffle  <de.docx> <thu_muc_ra> [options.json]
In ra một dòng JSON ở cuối: {"ok": true, ...} hoặc {"ok": false, "error": "..."}.
"""
import asyncio, io, json, os, sys, types, zipfile

# --- giả lập môi trường Pyodide ---
micropip = types.ModuleType('micropip')
async def _install(*_a, **_k):  # openpyxl đã có trên máy
    return None
micropip.install = _install
sys.modules['micropip'] = micropip


# Bộ làm đẹp đăng ký lại toàn bộ tiền tố namespace của tệp; tệp do bộ trộn đề sinh ra dùng tiền tố tự đặt (ns0, ns1...)
# mà ElementTree cấm đăng ký. Bỏ qua các tiền tố đó thay vì báo lỗi: Word vẫn đọc đúng vì dựa vào URI chứ không vào tiền tố.
import xml.etree.ElementTree as _ET
_register = _ET.register_namespace
def _safe_register(prefix, uri):
    try:
        _register(prefix, uri)
    except ValueError:
        pass
_ET.register_namespace = _safe_register


class JsLike:
    """Bọc dữ liệu thành đối tượng có .to_py() như proxy JS của Pyodide."""
    def __init__(self, value): self.value = value
    def to_py(self): return self.value


HERE = os.path.dirname(os.path.abspath(__file__))
ENGINE = os.environ.get('SM_EXAM_ENGINE') or os.path.join(HERE, 'engine')
sys.path.insert(0, ENGINE)


def resolve(value):
    """Hàm cũ có hàm async (Pyodide chờ được), có hàm thường: chấp nhận cả hai."""
    return asyncio.run(value) if asyncio.iscoroutine(value) else value


def read_bytes(path):
    with open(path, 'rb') as f:
        return f.read()


def read_options(path):
    if not path: return {}
    with open(path, 'r', encoding='utf-8') as f:
        return json.load(f)


def extract_zip(data, out_dir):
    os.makedirs(out_dir, exist_ok=True)
    names = []
    with zipfile.ZipFile(io.BytesIO(data)) as z:
        for info in z.infolist():
            if info.is_dir(): continue
            # tên tệp có thể chứa ký tự lạ: giữ nguyên nhưng không cho thoát khỏi thư mục ra
            name = os.path.basename(info.filename)
            with open(os.path.join(out_dir, name), 'wb') as f:
                f.write(z.read(info))
            names.append(name)
    return names


def analyze_exam(data):
    import sm_analyze
    return asyncio.run(sm_analyze.analyze_exam(data))


def main(argv):
    if len(argv) < 3:
        raise SystemExit(__doc__)
    cmd, src = argv[1], argv[2]
    data = read_bytes(src)
    if cmd == 'count':
        import docx_shuffler
        return json.loads(resolve(docx_shuffler.count_questions(JsLike(data))))
    if cmd == 'analyze':
        return analyze_exam(data)
    if cmd == 'analyze-beautifier':
        import docx_beautifier
        return json.loads(resolve(docx_beautifier.analyze_docx(JsLike(data))))
    if cmd in ('beautify', 'shuffle'):
        out_dir = argv[3]
        options = read_options(argv[4] if len(argv) > 4 else None)
        if cmd == 'beautify':
            import docx_beautifier
            options.setdefault('source_name', os.path.basename(src))
            result = resolve(docx_beautifier.beautify_docx(JsLike(data), JsLike(options)))
        else:
            import docx_shuffler
            result = resolve(docx_shuffler.process_file(JsLike(data), JsLike(options)))
        files = extract_zip(bytes(result), out_dir)
        return {'files': files, 'out_dir': out_dir}
    raise SystemExit(f'Lệnh không biết: {cmd}')


def respond(out):
    if isinstance(out, dict) and 'files' in out: return {'ok': True, **out}
    if isinstance(out, dict) and 'error' in out: return {'ok': False, 'error': out['error']}
    return {'ok': True, 'result': out}


def serve():
    """Tiến trình chạy nền: mỗi dòng stdin là {"id":..,"argv":[..]}, trả lời một dòng JSON {"id":..,...}.
    Nạp trước openpyxl (mất ~3 giây) ở luồng phụ để lệnh trộn đầu tiên không phải chờ."""
    import threading
    def warm():
        try:
            import openpyxl  # noqa: F401
            import docx_shuffler, docx_beautifier  # noqa: F401
        except Exception:
            pass
    threading.Thread(target=warm, daemon=True).start()
    for line in sys.stdin:
        line = line.strip()
        if not line: continue
        req = json.loads(line)
        try:
            out = respond(main(['examd'] + req['argv']))
        except SystemExit as e:
            out = {'ok': False, 'error': str(e)}
        except Exception as e:
            out = {'ok': False, 'error': f'{type(e).__name__}: {e}'}
        print(json.dumps({'id': req.get('id'), **out}, ensure_ascii=False), flush=True)


if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1] == 'serve':
        serve()
        sys.exit(0)
    try:
        print(json.dumps(respond(main(sys.argv)), ensure_ascii=False))
    except SystemExit:
        raise
    except Exception as e:  # báo lỗi gọn cho giao diện
        print(json.dumps({'ok': False, 'error': f'{type(e).__name__}: {e}'}, ensure_ascii=False))
        sys.exit(1)
