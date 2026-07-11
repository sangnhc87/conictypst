import re
html = open('index.html', 'r', encoding='utf-8').read()
scripts = re.findall(r'<script>([\s\S]*?)</script>', html)
for i, s in enumerate(scripts):
    open(f'temp_script_{i}.js', 'w', encoding='utf-8').write(s)
