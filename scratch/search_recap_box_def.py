import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if "recap-box" in line or "ex-box" in line:
            if "let " in line:
                try:
                    data = json.loads(line)
                    # Print context of the match
                    print(f"Match at log line {line_num}")
                    # Recursively search for "let recap-box" or similar
                    def find_let(obj):
                        if isinstance(obj, str) and "let recap-box" in obj:
                            print("-" * 50)
                            print(obj)
                            print("-" * 50)
                        elif isinstance(obj, dict):
                            for v in obj.values():
                                find_let(v)
                        elif isinstance(obj, list):
                            for item in obj:
                                find_let(item)
                    find_let(data)
                except Exception:
                    pass
