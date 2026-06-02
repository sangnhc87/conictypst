import json

with open('/Users/admin/.gemini/antigravity/brain/b3557b0c-65d9-45af-8469-5f6408579c27/.system_generated/logs/transcript.jsonl', 'r') as f:
    for line in f:
        data = json.loads(line)
        if data.get('type') == 'VIEW_FILE' or data.get('type') == 'READ_FILE':
            if 'content' in data:
                continue
        if data.get('type') == 'TOOL_CALL':
            try:
                for tc in data.get('tool_calls', []):
                    if tc.get('function', {}).get('name') == 'write_to_file':
                        args = json.loads(tc['function']['arguments'])
                        if 'generate_deep_2_circles_3D.py' in args.get('TargetFile', ''):
                            code = args.get('CodeContent', '')
                            if 'def draw_theory_cetz' in code:
                                with open('scratch/generate_deep_2_circles_3D_old.py', 'w') as out:
                                    out.write(code)
                                print("Wrote to scratch/generate_deep_2_circles_3D_old.py")
            except Exception as e:
                pass
