import json
import re
import os

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

virtual_file = [""]

def apply_replace(start, end, target, replacement):
    global virtual_file
    content = "\n".join(virtual_file[1:])
    if target and target in content:
        new_content = content.replace(target, replacement, 1)
        virtual_file = [""] + new_content.splitlines()
        return True
    else:
        # Fallback to line range replacement
        if start <= len(virtual_file) - 1:
            actual_end = min(end, len(virtual_file) - 1)
            before = virtual_file[1:start]
            after = virtual_file[actual_end+1:]
            middle = replacement.splitlines()
            virtual_file = [""] + before + middle + after
            return True
    return False

def parse_chunks(chunks_str):
    if not isinstance(chunks_str, str):
        return chunks_str
    
    # Try standard json parse first
    try:
        return json.loads(chunks_str, strict=False)
    except:
        pass
        
    # Regex fallback for truncated chunks
    parts = chunks_str.split('{"AllowMultiple":')
    chunks = []
    for part in parts[1:]:
        part = '{"AllowMultiple":' + part
        m_end = re.search(r'"EndLine":\s*(\d+)', part)
        m_start = re.search(r'"StartLine":\s*(\d+)', part)
        m_rep = re.search(r'"ReplacementContent":\s*"([^"\\]*(?:\\.[^"\\]*)*)"', part)
        
        if m_end and m_start and m_rep:
            start = int(m_start.group(1))
            end = int(m_end.group(1))
            try:
                rep = json.loads(f'"{m_rep.group(1)}"')
                chunks.append({
                    "StartLine": start,
                    "EndLine": end,
                    "ReplacementContent": rep,
                    "TargetContent": None
                })
            except Exception as e:
                print(f"Error decoding chunk string in regex fallback: {e}")
    return chunks

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line, strict=False)
            
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                func_name = tc.get("name")
                args = tc.get("args", {})
                if not args:
                    continue
                
                target_file = args.get("TargetFile", "")
                if "CD-DaiSo-ToHop-content.typ" in target_file:
                    if func_name == "write_to_file":
                        code = args.get("CodeContent", "")
                        overwrite = args.get("Overwrite", False)
                        if overwrite or len(virtual_file) <= 1:
                            virtual_file = [""] + code.splitlines()
                            print(f"Line {line_num}: write_to_file (overwrite), new len={len(virtual_file)-1}")
                        else:
                            virtual_file += code.splitlines()
                            print(f"Line {line_num}: write_to_file (append), new len={len(virtual_file)-1}")
                            
                    elif func_name == "replace_file_content":
                        start = int(args.get("StartLine", 1))
                        end = int(args.get("EndLine", 1))
                        target = args.get("TargetContent", "")
                        replacement = args.get("ReplacementContent", "")
                        success = apply_replace(start, end, target, replacement)
                        print(f"Line {line_num}: replace_file_content lines {start}-{end}, success={success}, new len={len(virtual_file)-1}")
                        
                    elif func_name == "multi_replace_file_content":
                        chunks_str = args.get("ReplacementChunks", "")
                        chunks = parse_chunks(chunks_str)
                        
                        if chunks:
                            chunks_sorted = sorted(chunks, key=lambda x: int(x.get("StartLine", 0)), reverse=True)
                            success_count = 0
                            for chunk in chunks_sorted:
                                c_start = int(chunk.get("StartLine", 1))
                                c_end = int(chunk.get("EndLine", 1))
                                c_target = chunk.get("TargetContent", "")
                                c_rep = chunk.get("ReplacementContent", "")
                                if apply_replace(c_start, c_end, c_target, c_rep):
                                    success_count += 1
                            print(f"Line {line_num}: multi_replace_file_content, applied {success_count}/{len(chunks)} chunks, new len={len(virtual_file)-1}")
            
            # Avoid views after step 4990 because they are for the reverted 15-problem version
            if line_num <= 4990:
                content = data.get("content", "")
                if "CD-DaiSo-ToHop-content.typ" in content and ("File Path" in content or "Showing lines" in content):
                    viewed_lines = {}
                    for l in content.splitlines():
                        m = re.match(r'^(\d+):\s(.*)', l)
                        if m:
                            l_num = int(m.group(1))
                            l_text = m.group(2)
                            viewed_lines[l_num] = l_text
                    
                    if viewed_lines:
                        max_viewed = max(viewed_lines.keys())
                        if len(virtual_file) - 1 < max_viewed:
                            virtual_file += [""] * (max_viewed - (len(virtual_file) - 1))
                        
                        updated = 0
                        for l_num, l_text in viewed_lines.items():
                            if virtual_file[l_num] != l_text:
                                virtual_file[l_num] = l_text
                                updated += 1
                        if updated > 0:
                            print(f"Line {line_num}: Updated {updated} lines from view_file response. New len={len(virtual_file)-1}")
        except Exception as e:
            print(f"Error parsing line {line_num}: {e}")

out_path = "/Users/admin/conictypst/scratch/reconstructed_virtual_v4.typ"
with open(out_path, "w", encoding="utf-8") as out_f:
    out_f.write("\n".join(virtual_file[1:]))
print(f"Saved reconstructed virtual file (v4) to {out_path}")
print(f"Final length: {len(virtual_file)-1}")
