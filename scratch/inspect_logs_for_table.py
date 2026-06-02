import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"

if not os.path.exists(log_path):
    print("Log path does not exist!")
    exit(1)

print("Reading logs...")
with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            content = data.get("content", "")
            # Check if it contains table or CD-XepGhe-KhongKe
            if "table(" in content or "CD-XepGhe-KhongKe" in content:
                print(f"--- Line {i} ({data.get('type')}) ---")
                print(content[:500]) # print first 500 chars
                if "table(" in content:
                    print("Found table( in content!")
            
            # Check tool_calls or outputs
            tool_calls = data.get("tool_calls", [])
            for tc in tool_calls:
                args = tc.get("args", {})
                if "CD-XepGhe-KhongKe" in str(args):
                    print(f"--- Line {i} tool_call {tc.get('name')} ---")
                    print(str(args)[:500])
            
            # Check output if it's a step
            output = data.get("output", "")
            if "table(" in output or "CD-XepGhe-KhongKe" in output:
                print(f"--- Line {i} output ---")
                print(output[:1000])
                if "table(" in output:
                    print("Found table( in output!")
        except Exception as e:
            pass
