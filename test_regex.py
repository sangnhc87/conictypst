import re
text = "([$x^2 + y <= 1$], [$2x+y>0$]), correct: 2, num: 1"
m = re.search(r'correct\s*:\s*(\d+|\([^)]+\))', text)
if m:
    val = m.group(1)
    if val.startswith('('):
        nums = [int(x.strip()) for x in val[1:-1].split(',')]
    else:
        nums = [int(val)]
    print(nums)
