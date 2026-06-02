import json
import base64

with open('/Users/admin/.gemini/antigravity/brain/b3557b0c-65d9-45af-8469-5f6408579c27/.system_generated/logs/transcript.jsonl', 'r') as f:
    for line in f:
        data = json.loads(line)
        if data.get('type') == 'VIEW_FILE' or data.get('type') == 'READ_FILE':
            continue
        if data.get('type') == 'TOOL_CALL':
            try:
                for tc in data.get('tool_calls', []):
                    if tc.get('function', {}).get('name') == 'write_to_file':
                        args = json.loads(tc['function']['arguments'])
                        if 'CD-min-2-DuongTron-ChuyenSau.typ' in args.get('TargetFile', ''):
                            code = args.get('CodeContent', '')
                            with open('scratch/CD-min-old.typ', 'w') as out:
                                out.write(code)
                            print("Wrote CD-min-old.typ")
            except Exception as e:
                pass
        if data.get('type') == 'USER_INPUT':
            content = data.get('content', '')
            if 'CD-min-2-DuongTron-ChuyenSau.typ' in content:
                # it might be in the user's initial prompt attached as a file
                pass
