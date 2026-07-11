import re
js = open('js/omr_engine.js', 'r', encoding='utf-8').read()
# change readBubbleCol(..., radius = 7) to readBubbleCol(..., radius = 9) in all calls
js = re.sub(r'readBubbleCol\((.*?),\s*7\)', r'readBubbleCol(\1, 9)', js)
open('js/omr_engine.js', 'w', encoding='utf-8').write(js)
