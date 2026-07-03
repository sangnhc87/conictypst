import re

with open('typst/hdsd-exam.typ', 'r', encoding='utf-8') as f:
    content = f.read()

# Insert real TN
tn_real = """
== Ví dụ 4 — Tích phân (Trích ngân hàng Giải tích 12)

```typst
#tn(
  [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
  ([$-1$], [$1$], [$0$], [$pi/2$]),
  correct: 2,
  loigiai: [
    Áp dụng Newton--Leibniz:
    $ I = integral_0^(pi/2) cos x dif x = sin x |_0^(pi/2) = sin(pi/2) - sin(0) = 1 - 0 = 1. $
  ],
)
```

#demo-out[
  #let em_tn_real = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_tn_real.tn)(
    [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
    ([$-1$], [$1$], [$0$], [$pi/2$]),
    correct: 2,
    loigiai: [
      Áp dụng Newton--Leibniz:
      $ I = integral_0^(pi/2) cos x dif x = sin x |_0^(pi/2) = sin(pi/2) - sin(0) = 1 - 0 = 1. $
    ],
  )
]
"""
content = re.sub(
    r'(#tip\[Dùng `fig-pos: "center"` khi hình to.*?\n)',
    r'\1' + tn_real + '\n',
    content
)

# Insert real DS
ds_real = """
== Ví dụ 2 — Khảo sát hàm số (Trích ngân hàng Giải tích 12)

```typst
#ds(
  [Cho hàm số $f(x) = (x-4)/(x-2)$ có đồ thị $(C)$.],
  (
    ds-item([Tập xác định hàm số là $D = RR backslash {2}$.], correct: true),
    ds-item([$f'(x) = 2/(x-2)^2 quad forall x != 2$.], correct: true),
    ds-item([$f(4) = 2$.], correct: false),
    ds-item([Gọi $M, m$ là GTLN và GTNN của $f$ trên $[4; 6]$. Khi đó $M + m = 2$.], correct: false),
  ),
  loigiai: [
    - *Ý a) Đúng:* mẫu $x - 2 = 0$ khi $x = 2$, nên $D = RR backslash {2}$.
    - *Ý b) Đúng:* $f'(x) = (1 dot (-2) - 1 dot (-4))/(x-2)^2 = 2/(x-2)^2$.
    - *Ý c) Sai:* $f(4) = 0/2 = 0$.
    - *Ý d) Sai:* $f$ đồng biến trên $[4;6]$ nên $m = f(4) = 0$, $M = f(6) = 1/2$, suy ra $M + m = 1/2$.
  ],
)
```

#demo-out[
  #let em_ds_real = exam-mode(mode: "loigiai", accent: classic.emerald)
  #(em_ds_real.ds)(
    [Cho hàm số $f(x) = (x-4)/(x-2)$ có đồ thị $(C)$.],
    (
      ds-item([Tập xác định hàm số là $D = RR backslash {2}$.], correct: true),
      ds-item([$f'(x) = 2/(x-2)^2 quad forall x != 2$.], correct: true),
      ds-item([$f(4) = 2$.], correct: false),
      ds-item([Gọi $M, m$ là GTLN và GTNN của $f$ trên $[4; 6]$. Khi đó $M + m = 2$.], correct: false),
    ),
    loigiai: [
      - *Ý a) Đúng:* mẫu $x - 2 = 0$ khi $x = 2$, nên $D = RR backslash {2}$.
      - *Ý b) Đúng:* $f'(x) = (1 dot (-2) - 1 dot (-4))/(x-2)^2 = 2/(x-2)^2$.
      - *Ý c) Sai:* $f(4) = 0/2 = 0$.
      - *Ý d) Sai:* $f$ đồng biến trên $[4;6]$ nên $m = f(4) = 0$, $M = f(6) = 1/2$, suy ra $M + m = 1/2$.
    ],
  )
]
"""
content = re.sub(
    r'(      - \*Ý d\) Đúng.\* \$f\(0\) = 3\$ → \$x=0\$ là nghiệm trên \[-1;3\].\n    \],\n  \)\n\]\n)',
    r'\1\n' + ds_real + '\n',
    content
)

# Insert real TLN
tln_real = """
== Ví dụ 4 — Bài toán thực tế (Trích ngân hàng Giải tích 12)

```typst
#tln(
  [Một nghệ nhân chế tác đôn đồng dạng khối tròn xoay, cao $40 \\" cm\\"$, đường kính trên-dưới $30 \\" cm\\"$, eo nhỏ nhất $24 \\" cm\\"$, mặt cắt qua trục là hai parabol đối xứng. Khối lượng riêng đồng $8960 \\" kg/m\\"^3$, giá $220 \\" nghìn đồng/kg\\"$, gia công $10 \\" triệu\\"$. Tổng chi phí (triệu đồng, làm tròn đến hàng phần mười)?],
  [$52,1$],
  loigiai: [
    Đường sinh parabol: $x = 3/400 y^2 + 12$, $y in [-20; 20]$.
    $V = 2pi integral_0^20 (3/400 y^2 + 12)^2 dif y = 6792pi \\" cm\\"^3$.
    $m = 8960 times 6792pi times 10^(-6) approx 191.45 \\" kg\\"$.
    Chi phí = $191.45 times 220 times 10^(-3) + 10 approx 52.1 \\" triệu\\"$.
  ],
)
```

#demo-out[
  #let em_tln_real = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_tln_real.tln)(
    [Một nghệ nhân chế tác đôn đồng dạng khối tròn xoay, cao $40 \\" cm\\"$, đường kính trên-dưới $30 \\" cm\\"$, eo nhỏ nhất $24 \\" cm\\"$, mặt cắt qua trục là hai parabol đối xứng. Khối lượng riêng đồng $8960 \\" kg/m\\"^3$, giá $220 \\" nghìn đồng/kg\\"$, gia công $10 \\" triệu\\"$. Tổng chi phí (triệu đồng, làm tròn đến hàng phần mười)?],
    [$52,1$],
    loigiai: [
      Đường sinh parabol: $x = 3/400 y^2 + 12$, $y in [-20; 20]$.
      $V = 2pi integral_0^20 (3/400 y^2 + 12)^2 dif y = 6792pi \\" cm\\"^3$.
      $m = 8960 times 6792pi times 10^(-6) approx 191.45 \\" kg\\"$.
      Chi phí = $191.45 times 220 times 10^(-3) + 10 approx 52.1 \\" triệu\\"$.
    ],
  )
]
"""
content = re.sub(
    r'(    \$S = integral_\(-1\)\^2 \(x\+2-x\^2\) dif x = 9/2\$.\n  \],\n\)\n```\n)',
    r'\1\n' + tln_real + '\n',
    content
)

with open('typst/hdsd-exam.typ', 'w', encoding='utf-8') as f:
    f.write(content)

print("Patched successfully")
