import json
import re
import os

log_files = [
    "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl",
    "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"
]

all_problems = {}

# We look for "#prob(\n  \"<num>" or "#prob(\"<num>" in any content
# We will match pattern like `#prob(\s*"\s*(\d+)[^"]*"`
pattern = re.compile(r'#prob\(\s*"\s*(\d+)\s*([^"]*)"\s*,\s*\[(.*?)\]\s*,\s*\[(.*?)\]\s*,\s*loigiai:\s*\[(.*?)\]', re.DOTALL)

# Let's also just extract any block from "#prob(" to the closing paren, or do a broader search
# Let's find matches for `#prob(` and then balance parens, or extract blocks.

def find_probs(text):
    results = []
    # Find all occurrences of #prob(
    for match in re.finditer(r'#prob\(', text):
        start = match.start()
        # Find matching closing bracket/paren for this block
        # Typst blocks can have nested [], (), {}
        paren_count = 0
        bracket_count = 0
        brace_count = 0
        end = -1
        for i in range(start + 5, len(text)):
            c = text[i]
            if c == '(':
                paren_count += 1
            elif c == ')':
                if paren_count == 0:
                    end = i + 1
                    break
                else:
                    paren_count -= 1
            elif c == '[':
                bracket_count += 1
            elif c == ']':
                bracket_count -= 1
            elif c == '{':
                brace_count += 1
            elif c == '}':
                brace_count -= 1
        if end != -1:
            block = text[start:end]
            results.append(block)
    return results

for log_path in log_files:
    if not os.path.exists(log_path):
        continue
    print(f"Reading {log_path}...")
    with open(log_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            try:
                data = json.loads(line)
                
                # Check tool calls
                tool_calls = data.get("tool_calls", [])
                for tc in tool_calls:
                    args = tc.get("function", {}).get("arguments", {})
                    if not args:
                        continue
                    for k, v in args.items():
                        if isinstance(v, str) and "#prob" in v:
                            blocks = find_probs(v)
                            for b in blocks:
                                # Extract problem number
                                m = re.search(r'#prob\(\s*"\s*(\d+)', b)
                                if m:
                                    p_num = int(m.group(1))
                                    if p_num not in all_problems or len(b) > len(all_problems[p_num][1]):
                                        all_problems[p_num] = (log_path, b)
                
                # Check system/model output content
                content = data.get("content", "")
                if isinstance(content, str) and "#prob" in content:
                    blocks = find_probs(content)
                    for b in blocks:
                        m = re.search(r'#prob\(\s*"\s*(\d+)', b)
                        if m:
                            p_num = int(m.group(1))
                            if p_num not in all_problems or len(b) > len(all_problems[p_num][1]):
                                all_problems[p_num] = (log_path, b)
            except Exception as e:
                pass

print(f"Found problems: {sorted(all_problems.keys())}")
for p_num in sorted(all_problems.keys()):
    log_path, block = all_problems[p_num]
    print(f"Problem {p_num} (len {len(block)}):")
    # print first 150 chars
    print(block[:150].replace('\n', ' ') + "...")
    # write to a dedicated folder in scratch
    os.makedirs("/Users/admin/conictypst/scratch/reconstructed_probs", exist_ok=True)
    with open(f"/Users/admin/conictypst/scratch/reconstructed_probs/prob_{p_num}.typ", "w", encoding="utf-8") as out_f:
        out_f.write(block)
