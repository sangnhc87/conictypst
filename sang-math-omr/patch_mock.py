import re

with open('generate_all_presets.cjs', 'r', encoding='utf-8') as f:
    content = f.read()

old_window = "window: {},"
new_window = "window: { addEventListener: () => {} },"
content = content.replace(old_window, new_window)

with open('generate_all_presets.cjs', 'w', encoding='utf-8') as f:
    f.write(content)
