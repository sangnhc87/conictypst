import re
import sys

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all loigiai blocks
    pattern = re.compile(r'(loigiai:\s*\[\n)(.*?)(\n\s*\])', re.DOTALL)
    
    def replacer(match):
        prefix = match.group(1)
        body = match.group(2)
        suffix = match.group(3)
        
        if '#step' in body:
            return match.group(0)
            
        # Split body by '\n' and process
        lines = body.split('\n')
        out_lines = []
        step_count = 1
        
        # We group lines if they don't seem like separate steps
        # Actually, let's just make the whole body ONE step if it's very short,
        # or split by lines if there are multiple lines.
        # Wait, if a line ends with '\', it usually means a new step or equation.
        # Let's just wrap the entire body in a single step for simplicity, 
        # but change the title if it contains "a) Đúng".
        
        is_tf = "a) Đúng" in body or "a) Sai" in body or "- a)" in body
        
        if is_tf:
            title = "*Kiểm tra từng mệnh đề:*"
        else:
            title = "*Lời giải chi tiết:*"
            
        # Remove trailing \ from the very last line of body if any
        body_stripped = body.strip()
        if body_stripped.endswith('\\'):
            body_stripped = body_stripped[:-1].strip()
            
        new_body = f"    #step[{title} \\\n      {body_stripped}]"
        
        return prefix + new_body + suffix

    new_content = pattern.sub(replacer, content)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Updated {filepath}")

process_file('typst/sach/day-so-chuong3/c3-b2-de1.typ')
process_file('typst/sach/day-so-chuong3/c3-b3-de1.typ')
