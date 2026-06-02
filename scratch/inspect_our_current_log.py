import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/097aae0d-3fd0-4ff0-8665-546bd204d15d/.system_generated/logs/transcript.jsonl"

if os.path.exists(log_path):
    print("Reading current log file...")
    with open(log_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            try:
                data = json.loads(line)
                step_idx = data.get("step_index")
                source = data.get("source")
                t_type = data.get("type")
                
                # If there are tool calls in this step
                tcs = data.get("tool_calls", [])
                if tcs:
                    for tc in tcs:
                        func_name = tc.get("name")
                        args = tc.get("args", {})
                        if "lich-su" in str(args) or func_name in ["write_to_file", "replace_file_content", "multi_replace_file_content"]:
                            print(f"Step {step_idx} (Line {line_num}): Model tool call {func_name}")
                            for k, v in args.items():
                                if isinstance(v, str) and len(v) > 200:
                                    v = v[:200] + f"... (len={len(v)})"
                                print(f"  {k}: {v}")
                
                # If this is a system step or something that returns tool output
                if t_type == "TOOL_OUTPUT" or source == "SYSTEM":
                    content = data.get("content", "")
                    if "Showing lines" in content or "compiled successfully" in content:
                        print(f"Step {step_idx} (Line {line_num}): Tool Output/System")
                        lines = content.splitlines()
                        for l in lines[:5]:
                            print(f"  {l}")
                        if len(lines) > 5:
                            print(f"  ... ({len(lines) - 5} more lines)")
            except Exception as e:
                pass
else:
    print(f"Log path {log_path} does not exist.")
