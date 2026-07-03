import re

with open('typst/hdsd-exam.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix TN
tn_bad = """#tn(
  [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
  ([$-1$], [$1$], [$0$], [$pi/2$]),
  correct: 2,
  loigiai:"""
tn_good = """#tn(
  [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
  ([$-1$], True([$1$]), [$0$], [$pi/2$]),
  loigiai:"""
text = text.replace(tn_bad, tn_good)

# Also fix the #demo-out for TN
tn_demo_bad = """#(em_tn_real.tn)(
    [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
    ([$-1$], [$1$], [$0$], [$pi/2$]),
    correct: 2,
    loigiai:"""
tn_demo_good = """#(em_tn_real.tn)(
    [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
    ([$-1$], True([$1$]), [$0$], [$pi/2$]),
    loigiai:"""
text = text.replace(tn_demo_bad, tn_demo_good)

# Fix DS
ds_bad = """  (
    ds-item([Tập xác định hàm số là $D = RR backslash {2}$.], correct: true),
    ds-item([$f'(x) = 2/(x-2)^2 quad forall x != 2$.], correct: true),
    ds-item([$f(4) = 2$.], correct: false),
    ds-item([Gọi $M, m$ là GTLN và GTNN của $f$ trên $[4; 6]$. Khi đó $M + m = 2$.], correct: false),
  ),"""
ds_good = """  (
    True([Tập xác định hàm số là $D = RR backslash {2}$.]),
    True([$f'(x) = 2/(x-2)^2 quad forall x != 2$.]),
    [$f(4) = 2$.],
    [Gọi $M, m$ là GTLN và GTNN của $f$ trên $[4; 6]$. Khi đó $M + m = 2$.],
  ),"""
text = text.replace(ds_bad, ds_good)

with open('typst/hdsd-exam.typ', 'w', encoding='utf-8') as f:
    f.write(text)

