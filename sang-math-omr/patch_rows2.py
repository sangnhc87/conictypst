import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

old_order = """                let rows = Math.ceil(tf / cols);
                let cols = (isA5 && tf === 20) ? 4 : Math.min(5, tf);"""
new_order = """                let cols = (isA5 && tf === 20) ? 4 : Math.min(5, tf);
                let rows = Math.ceil(tf / cols);"""
content = content.replace(old_order, new_order)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
