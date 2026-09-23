import re

def fix(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    def repl(m):
        question = m.group(1)
        options = m.group(2)
        return question + "(\n" + options + "    ),\n    loigiai:"

    # Match #tn( or #ds(
    # Then the question: `\[ ... \],` (might span multiple lines, let's use non-greedy)
    # Then options: everything up to `loigiai:`
    
    pattern = re.compile(r'(#[td][ns]\(\s*\[.*?\],\s*)(.*?)\s*loigiai:', re.DOTALL)
    content = pattern.sub(repl, content)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

fix('de-on-kiem-tra-chuong-1-de-4.typ')
fix('de-on-kiem-tra-chuong-1-de-5.typ')
