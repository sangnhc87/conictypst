import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/097aae0d-3fd0-4ff0-8665-546bd204d15d/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line in f:
        try:
            data = json.loads(line)
            if data.get("step_index") == 36:
                content = data.get("content", "")
                print(f"Content length: {len(content)}")
                
                # Check for the system-level truncation message in the JSON content
                if "<truncated" in content:
                    print("Content itself contains '<truncated' string!")
                    
                lines = content.splitlines()
                print(f"Total lines in content: {len(lines)}")
                
                matched = 0
                unmatched = []
                for i, l in enumerate(lines):
                    lm = re.match(r'^(\d+):\s(.*)', l)
                    if lm:
                        matched += 1
                    else:
                        unmatched.append((i, l))
                        
                print(f"Matched lines: {matched}")
                print(f"Unmatched lines count: {len(unmatched)}")
                print("First 10 unmatched lines:")
                for idx, l in unmatched[:10]:
                    print(f"  [{idx}]: {l[:100]}")
        except Exception as e:
            pass
