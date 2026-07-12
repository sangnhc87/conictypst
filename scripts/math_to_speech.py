import re
import sys
import argparse

def translate_math_to_speech(text):
    """
    Translates basic Typst math formulas into Vietnamese spoken text.
    """
    if not text: return ""

    # Replace specific symbols first
    replacements = {
        r'=': ' bằng ',
        r'\+': ' cộng ',
        r'-': ' trừ ',
        r'\*': ' nhân ',
        r'\cdot': ' nhân ',
        r'/': ' chia cho ',
        r'<': ' nhỏ hơn ',
        r'>': ' lớn hơn ',
        r'<=': ' nhỏ hơn hoặc bằng ',
        r'le': ' nhỏ hơn hoặc bằng ',
        r'>=': ' lớn hơn hoặc bằng ',
        r'ge': ' lớn hơn hoặc bằng ',
        r'!=': ' khác ',
        r'ne': ' khác ',
        r'\(': ' mở ngoặc ',
        r'\)': ' đóng ngoặc ',
        r'\[': ' mở ngoặc vuông ',
        r'\]': ' đóng ngoặc vuông ',
        r'\{': ' mở ngoặc nhọn ',
        r'\}': ' đóng ngoặc nhọn ',
        r'\|': ' trị tuyệt đối của ',
        r'abs': ' trị tuyệt đối của ',
        r'sqrt': ' căn bậc hai của ',
        r'root\(3': ' căn bậc ba của ',
        r'frac': ' phân số ',
        r'pi': ' pi ',
        r'sin': ' sin ',
        r'cos': ' cos ',
        r'tan': ' tan ',
        r'cot': ' cot ',
        r'log': ' loga ',
        r'ln': ' lốc nê pe của ',
        r'lim': ' lim ',
        r'->': ' tiến tới ',
        r'to': ' tiến tới ',
        r'oo': ' vô cực ',
        r'infty': ' vô cực ',
        r'\+oo': ' cộng vô cực ',
        r'-oo': ' trừ vô cực ',
        r'integral': ' tích phân ',
        r'sum': ' tổng ',
        r'in': ' thuộc ',
        r'notin': ' không thuộc ',
        r'subset': ' tập con của ',
        r'cup': ' hợp ',
        r'cap': ' giao ',
        r'RR': ' e rờ ',
        r'ZZ': ' zét ',
        r'NN': ' en nờ ',
        r'QQ': ' quy ',
        r'degree': ' độ ',
        r'perp': ' vuông góc với ',
        r'parallel': ' song song với ',
        r'Rightarrow': ' suy ra ',
        r'=>': ' suy ra ',
        r'<=>': ' tương đương ',
        r'Leftrightarrow': ' tương đương ',
    }

    # Extract all math blocks: $...$
    def process_math_block(match):
        math_content = match.group(1)
        
        # Power / exponent logic
        # e.g., x^2 -> x bình phương, x^3 -> x lập phương, x^n -> x mũ n
        math_content = re.sub(r'(\w+)\^2', r'\1 bình phương', math_content)
        math_content = re.sub(r'(\w+)\^3', r'\1 lập phương', math_content)
        math_content = re.sub(r'(\w+)\^([a-zA-Z0-9]+)', r'\1 mũ \2', math_content)
        math_content = re.sub(r'(\w+)\^\(([^)]+)\)', r'\1 mũ \2', math_content)
        
        # Subscript logic
        # e.g., x_1 -> x một, u_n -> u nờ
        math_content = re.sub(r'(\w+)_([a-zA-Z0-9]+)', r'\1 \2', math_content)
        math_content = re.sub(r'(\w+)_\(([^)]+)\)', r'\1 \2', math_content)
        
        # Functions like integral_0^1
        math_content = re.sub(r'integral_([a-zA-Z0-9]+)\^([a-zA-Z0-9]+)', r'tích phân từ \1 đến \2 của', math_content)
        math_content = re.sub(r'integral_\(([^)]+)\)\^\(([^)]+)\)', r'tích phân từ \1 đến \2 của', math_content)
        
        # Limits lim_{x -> 0}
        math_content = re.sub(r'lim_\(?([a-zA-Z0-9]+)\s*(?:->|to)\s*([^)]+)\)?', r'lim khi \1 tiến tới \2 của', math_content)

        # Replace dictionary terms
        for k, v in replacements.items():
            math_content = re.sub(rf'\b{k}\b' if k.isalpha() else k, v, math_content)

        # Clean up multiple spaces
        math_content = re.sub(r'\s+', ' ', math_content).strip()
        return f" {math_content} "

    # Process all $...$
    processed_text = re.sub(r'\$(.*?)\$', process_math_block, text)
    return processed_text

def extract_touying_script(typst_content):
    """
    Extracts content from `#video-step( [block1], [block2], ... )`
    and returns a list of phonetic strings.
    """
    match = re.search(r'#video-step\s*\((.*)\)', typst_content, re.DOTALL)
    if not match:
        return []
    
    inner = match.group(1)
    
    blocks = []
    depth = 0
    current_block = []
    in_block = False
    
    for char in inner:
        if char == '[':
            if depth == 0:
                in_block = True
                current_block = []
            else:
                current_block.append(char)
            depth += 1
        elif char == ']':
            depth -= 1
            if depth == 0 and in_block:
                in_block = False
                blocks.append(''.join(current_block))
            elif depth > 0:
                current_block.append(char)
        elif in_block:
            current_block.append(char)
            
    cleaned_blocks = []
    for block in blocks:
        # Remove typst comments
        block = re.sub(r'//.*', '', block)
        block = re.sub(r'/\*.*?\*/', '', block, flags=re.DOTALL)
        
        # Remove macro syntax but keep text
        block = re.sub(r'#[a-zA-Z-]+\([^)]*\)\[(.*?)\]', r'\1', block, flags=re.DOTALL)
        block = re.sub(r'#[a-zA-Z-]+\([^)]*\)', '', block)
        block = re.sub(r'#[a-zA-Z-]+\s*\[(.*?)\]', r'\1', block, flags=re.DOTALL)
        block = re.sub(r'#[a-zA-Z-]+', '', block)
        
        # Remove markdown bold/italic
        block = block.replace('*', '')
        block = block.replace('_', '')
        
        # Translate math
        block = translate_math_to_speech(block)
        
        # Clean up whitespace and newlines
        block = block.replace('\n', ' ')
        block = re.sub(r'\s+', ' ', block).strip()
        cleaned_blocks.append(block)
        
    return cleaned_blocks

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate phonetic script from Typst file.")
    parser.add_argument("input_typ", help="Input Typst file (.typ)")
    parser.add_argument("output_txt", help="Output text file (.txt)")
    
    args = parser.parse_args()
    
    with open(args.input_typ, 'r', encoding='utf-8') as f:
        content = f.read()
        
    script_lines = extract_touying_script(content)
    
    with open(args.output_txt, 'w', encoding='utf-8') as f:
        for line in script_lines:
            f.write(line + '\n')
            
    print(f"[+] Generated phonetic script with {len(script_lines)} lines to {args.output_txt}")
