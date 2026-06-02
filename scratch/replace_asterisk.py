import os
import re

def process_file_content(text):
    # State machine to segment the text and replace '*' with ' dot ' only in math mode
    result = []
    i = 0
    n = len(text)
    
    in_code_block = False
    in_inline_code = False
    in_math = False
    
    segment = []
    replacements_count = 0
    
    while i < n:
        # Check code block (triple backticks)
        if text[i:i+3] == "```":
            if in_math:
                result.append(("".join(segment), True))
                segment = []
                in_math = False
            result.append(("".join(segment), False))
            segment = ["```"]
            in_code_block = not in_code_block
            i += 3
            continue
            
        if in_code_block:
            segment.append(text[i])
            i += 1
            continue
            
        # Check inline code (single backtick)
        if text[i] == "`":
            result.append(("".join(segment), in_math))
            segment = ["`"]
            in_inline_code = not in_inline_code
            i += 1
            continue
            
        if in_inline_code:
            segment.append(text[i])
            i += 1
            continue
            
        # Check escaped dollar
        if text[i:i+2] == "\\$":
            segment.append("\\$")
            i += 2
            continue
            
        # Check dollar (math mode toggle)
        if text[i] == "$":
            result.append(("".join(segment), in_math))
            segment = ["$"]
            in_math = not in_math
            i += 1
            continue
            
        segment.append(text[i])
        i += 1
        
    result.append(("".join(segment), in_math))
    
    final_parts = []
    for seg_str, is_math in result:
        if not seg_str:
            continue
        if is_math:
            # We are inside $ ... $
            # We strip the surrounding $'s to perform replacement, then restore them
            # Check if segment starts and ends with $
            has_start = seg_str.startswith("$")
            has_end = seg_str.endswith("$")
            
            content = seg_str
            start_ch = "$" if has_start else ""
            end_ch = "$" if has_end else ""
            
            if has_start:
                content = content[1:]
            if has_end:
                content = content[:-1]
                
            # Count asterisks to be replaced
            # Protect escaped \*
            parts = content.split("\\*")
            new_parts = []
            for part in parts:
                asterisk_count = part.count("*")
                replacements_count += asterisk_count
                # Replace '*' with ' dot '
                part_replaced = part.replace("*", " dot ")
                # Clean up double spaces around 'dot' if any
                part_replaced = re.sub(r'\s+dot\s+', ' dot ', part_replaced)
                new_parts.append(part_replaced)
                
            cleaned_content = "\\*".join(new_parts)
            final_parts.append(start_ch + cleaned_content + end_ch)
        else:
            final_parts.append(seg_str)
            
    return "".join(final_parts), replacements_count

def main():
    target_dir = "/Users/admin/conictypst/typst/sach/vecto-3d-chuong2"
    total_replaced = 0
    modified_files = []
    
    for root, dirs, files in os.walk(target_dir):
        for file in files:
            if file.endswith(".typ"):
                path = os.path.join(root, file)
                with open(path, "r", encoding="utf-8") as f:
                    content = f.read()
                    
                new_content, count = process_file_content(content)
                if count > 0:
                    with open(path, "w", encoding="utf-8") as f:
                        f.write(new_content)
                    print(f"Processed {file}: replaced {count} asterisks.")
                    total_replaced += count
                    modified_files.append(file)
                    
    print(f"\nDone! Replaced {total_replaced} asterisks across {len(modified_files)} files.")

if __name__ == "__main__":
    main()
