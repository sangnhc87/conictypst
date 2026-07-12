import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

old_tf_block = """  #block(
    inset: (top: 8pt, bottom: 8pt, left: 10pt, right: 10pt),"""
new_tf_block = """  #if (isA5) { "#scale(x: 88%, y: 88%, origin: top)[" }
  #block(
    inset: (top: 8pt, bottom: 8pt, left: 10pt, right: 10pt),"""
content = content.replace(old_tf_block, new_tf_block)

old_tf_block_end = """    )
  )
])"""
new_tf_block_end = """    )
  )
  #if (isA5) { "]" }
])"""
content = content.replace(old_tf_block_end, new_tf_block_end)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
