import json

found = False
content = ""

with open('/Users/admin/.gemini/antigravity-ide/brain/5e1c6f67-47df-42f8-b394-887a3aabce3f/.system_generated/logs/transcript_full.jsonl', 'r') as f:
    for line in f:
        try:
            data = json.loads(line)
            if data.get('type') == 'CODE_ACTION':
                # The code action where I created omr_engine.js
                c = data.get('content', '')
                if 'gradeImage(imgEl, template, fullAnswers)' in c and 'js/omr_engine.js' in c:
                    print("Found it!")
                    with open('old_gradeImage.txt', 'w') as out:
                        out.write(c)
                    found = True
                    break
        except Exception as e:
            pass
if not found:
    print("Not found")
