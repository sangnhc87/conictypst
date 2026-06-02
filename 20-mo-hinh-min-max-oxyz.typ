#import "typst/template.typ": *
#import "typst/sang-exam.typ": step, reset-step
#import "@preview/cetz:0.5.2": canvas, draw

#show: stexgv-doc.with(
  doc-type: "chuyende",
  title: "MÔ HÌNH HOÁ MIN – MAX OXYZ",
  subtitle: "20 mô hình thực tế theo GDPT 2018 — Toán 12",
  author: "Hệ thống STEXGV",
  institution: "Tổ Toán — Tài liệu mô hình hoá toán học",
  subject: "Toán", grade: "Lớp 12",
  series: "Ôn thi THPT — Vận dụng cao",
  academic-year: "2025-2026",
)

#gioithieu[
  Tài liệu *mô hình hoá toán học* 20 dạng min – max Oxyz gắn với bối cảnh thực tế.
  Mỗi mô hình có: bối cảnh → mô hình hoá → công thức → lời giải từng bước → hình vẽ CeTZ 3D.
]

#muctieuchung[
  - Mô hình hoá tình huống thực tế thành bài toán tối ưu trên mặt cầu.
  - Vận dụng công thức min–max và tư duy hạ bậc 3D→2D.
  - Chinh phục câu VDC trong đề thi THPT.
]

// ═══════════════════ CeTZ HELPERS ═══════════════════

#let _sx = -0.5; #let _sy = -0.3
#let proj(x, y, z) = (x + y * _sx, z + y * _sy)

#let _axes(len) = {
  import draw: *
  let O=proj(0,0,0); let X=proj(len,0,0); let Y=proj(0,len,0); let Z=proj(0,0,len)
  line(O,X,stroke:0.7pt+black,mark:(end:"stealth",scale:0.5))
  line(O,Y,stroke:0.7pt+black,mark:(end:"stealth",scale:0.5))
  line(O,Z,stroke:0.7pt+black,mark:(end:"stealth",scale:0.5))
  content((X.at(0)-0.15,X.at(1)-0.1),text(size:6pt)[$x$])
  content((Y.at(0)+0.12,Y.at(1)-0.05),text(size:6pt)[$y$])
  content((Z.at(0)-0.05,Z.at(1)+0.18),text(size:6pt)[$z$])
}

#let _sph(center, r, fc: rgb(210,230,255,100), sc: rgb(20,100,200)) = {
  import draw: *
  let c=center
  circle(c,radius:r,fill:fc,stroke:0.8pt+sc)
  circle(c,radius:(0.35*r,r),stroke:(dash:"dashed",paint:sc.lighten(50%),thickness:0.4pt))
  arc((c.at(0)+r,c.at(1)),start:0deg,stop:180deg,radius:(r,0.15*r),stroke:(dash:"dashed",paint:sc.lighten(30%),thickness:0.6pt))
  arc((c.at(0)-r,c.at(1)),start:180deg,stop:360deg,radius:(r,0.15*r),stroke:(paint:sc.lighten(30%),thickness:0.6pt))
}

#let _pt(pos,label,clr:black,lp:"tr",sz:6pt) = {
  import draw: *
  circle(pos,radius:1pt,fill:clr,stroke:0.3pt+black)
  let x=pos.at(0); let y=pos.at(1); let d=0.16
  if lp=="tl" { content((x - d, y + d), text(size:sz, style:"italic")[#label]) }
  else if lp=="bl" { content((x - d, y - d), text(size:sz, style:"italic")[#label]) }
  else if lp=="br" { content((x + d, y - d), text(size:sz, style:"italic")[#label]) }
  else { content((x + d, y + d), text(size:sz, style:"italic")[#label]) }
}

// ═══════════════════ PART 1 ═══════════════════

#part([Tối ưu tín hiệu, độ cao và khoảng cách])

#chapter([Bài 1–4: Radar, địa hình, đường bay, vùng phủ])

#dang([Bài 1. Cường độ tín hiệu trong vùng phủ sóng])

#phuongphap[
  *Bối cảnh:* Trạm phát sóng tại $I(a,b,c)$, bán kính phủ $R$. Cường độ tín hiệu tại $M$ là $P=u x+v y+w z+d$.
  *Mô hình hoá:* Vùng phủ là mặt cầu $(S)$. Tìm $P_max$, $P_min$ trên $(S)$.
  *Công thức:* $P_max = P(I) + R|vec n|$, $P_min = P(I) - R|vec n|$ với $|vec n| = sqrt(u^2+v^2+w^2)$.
]

#canvas(length:1.3cm, {
  import draw: *
  _axes(3); let I=proj(1.2,1,1); _sph(I,1.8)
  _pt(I,$I$); _pt(proj(1.2+1.5,1+1.2,1+1.8),$M_max$,clr:rgb(200,50,50))
  _pt(proj(1.2-1.8,1-0.5,1-1.5),$M_min$,clr:rgb(50,50,200),lp:"bl")
})

#vd(
  [*Tối ưu vị trí thu sóng wifi.* Trạm phát wifi tại $I(1;-2;3)$ (km), bán kính $R=4$ km.
   Cường độ tín hiệu $P = 2x - y + 2z + 5$ (dBm). Tìm tín hiệu mạnh nhất và toạ độ tương ứng.],
  loigiai: [#reset-step()
    #step[Mô hình hoá.] Vùng phủ là mặt cầu $(S)$ tâm $I(1,-2,3)$, $R=4$. Cần tìm max của $P$ trên $(S)$.
    #step[Tính $P(I)$ — cường độ tại tâm trạm.] $P(I) = 2(1)-(-2)+2(3)+5 = 15$ (dBm).
    #step[Tính $|vec n|$ — hệ số thay đổi.] $vec n=(2;-1;2)$, $|vec n| = sqrt(4+1+4) = 3$.
    #step[$P_max$.] $P_max = 15 + 4 dot 3 = 27$ (dBm).
    #step[Toạ độ $M_max$.] $vec("IM") = 4 dot frac((2;-1;2),3) = (8/3;-4/3;8/3)$. $M_max = I + vec("IM") = (11/3; -10/3; 17/3)$.
  ],
)

#vd(
  [*Vùng phủ wifi nội bộ.* Bộ phát $(x-2)^2+(y-1)^2+z^2 <= 1$, chất lượng $Q=2x-y+2z$. Tìm $Q$ lớn nhất và nhỏ nhất.],
  loigiai: [#reset-step()
    #step[$I(2,1,0), R=1$.] $Q(I)=3$, $|vec n|=3$.
    #step[$Q_max = 3+3=6$, $Q_min=3-3=0$.]
  ],
)

#dang([Bài 2. Độ cao an toàn so với địa hình])

#phuongphap[
  *Bối cảnh:* Khinh khí cầu trong vùng cầu $(S)$, bên dưới là sườn núi dạng mặt phẳng $(P)$.
  *Công thức:* $h = d(I,(P))$. $d_max = h+R$, $d_min = max{0, h-R}$.
]

#canvas(length:1.3cm, {
  import draw: *
  _axes(2.8); let I=proj(1,0.8,1); _sph(I,1.6)
  _pt(I,$I$); _pt(proj(1+1.4,0.8-0.5,1+0.6),$M_max$,clr:rgb(200,50,50))
  _pt(proj(1-1.2,0.8,1-0.8),$M_min$,clr:rgb(50,50,200),lp:"bl")
  line(proj(-0.5,0.3,1.6),proj(2.5,1.2,0.2),stroke:0.6pt+rgb(120,120,120))
  content(proj(-0.2,0.15,1.8),text(size:6pt,style:"italic")[$(P)$])
})

#vd(
  [*Khinh khí cầu và sườn núi.* Khinh khí cầu bay trong mặt cầu $x^2+y^2+z^2=25$. Sườn núi $(P):3x+4z-12=0$.
   a) Tìm độ cao lớn nhất và nhỏ nhất so với sườn núi.
   b) Có nguy cơ va chạm không?],
  loigiai: [#reset-step()
    #step[Mô hình hoá.] Khinh khí cầu: $(S)$ tâm $O(0,0,0)$, $R=5$. Sườn núi: $(P)$.
    #step[$h = d(O,(P))$.] $h = frac(|-12|, sqrt(9+16)) = 2.4$.
    #step[An toàn?] $h=2.4 < R=5$ ⇒ $(P)$ cắt mặt cầu. Có nguy cơ va chạm ($d_min=0$).
    #step[$d_max = h+R = 7.4$ km.]
  ],
)

#dang([Bài 3. Khoảng cách từ vệ tinh đến đường bay])

#phuongphap[
  *Công thức:* $h=d(I,Delta)$, $d_max=h+R$, $d_min=max{0,h-R}$.
]

#canvas(length:1.2cm, {
  import draw: *
  _axes(2.5); let I=proj(1.2,1.5,0.8); _sph(I,1.5)
  _pt(I,$I$); line(proj(0,0,2),proj(1.5,3,1),stroke:0.7pt+rgb(180,80,80),mark:(end:"stealth",scale:0.4))
  content(proj(1.6,2.8,1),text(size:6pt,style:"italic")[$Delta$])
})

#vd(
  [*Vệ tinh và máy bay.* Vệ tinh trên quỹ đạo $(S):(x-1)^2+(y-2)^2+(z-3)^2=25$. Máy bay $Delta$ qua $A(0,1,0)$, $vec u=(1,2,-1)$.
   Tìm khoảng cách gần nhất và xa nhất.],
  loigiai: [#reset-step()
    #step[$I(1,2,3), R=5$. $vec("AI")=(1,1,3)$. $|vec u|=sqrt(6)$.]
    #step[$vec("AI")times vec u = (-7,4,1)$. $|...|=sqrt(66)$. $h=frac(sqrt(66), sqrt(6))=sqrt(11) approx 3.32$.]
    #step[$d_min = 0$ (vì $h<R$, $Delta$ xuyên qua quỹ đạo). $d_max = sqrt(11)+5 approx 8.32$ km.]
  ],
)

#dang([Bài 4. Vùng phủ tam giác giữa các trạm])

#phuongphap[
  $S_(triangle "MAB") = frac(1,2) "AB" dot d(M,"AB")$. $S_max = frac(1,2) "AB"(h+R)$.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(2.8); let I=proj(1,0.8,0.8); _sph(I,1.8)
  let A=proj(0.5,0.2,0); let B=proj(2.5,1.2,0.5); let M=proj(0.5,1.5,1.8)
  _pt(A,$A$,lp:"bl"); _pt(B,$B$,lp:"br"); _pt(M,$M$,clr:rgb(200,50,50))
  line(A,B,stroke:0.5pt); line(A,M,stroke:0.5pt); line(B,M,stroke:0.5pt)
})

#vd(
  [*Định vị tam giác.* $A(3,0,0), B(0,4,0)$ (km). Thiết bị $M$ trong vùng cầu $x^2+y^2+z^2=25$.
   Tìm $S_max$ của $triangle "MAB"$.],
  loigiai: [#reset-step()
    #step[$"AB"=5$, $h=d(O,"AB")=frac(12,5)=2.4$.]
    #step[$S_max = frac(1,2)dot 5(2.4+5)=frac(37,2)=18.5$ km\"^2\$.]
  ],
)

// ═══════════════════ PART 2 ═══════════════════

#part([Thể tích, tổn hao, góc quan sát và tỉ số])

#chapter([Bài 5–9: Khoang chứa, cảm biến, vệ tinh, định vị])

#dang([Bài 5. Thể tích khoang chứa])

#phuongphap[
  $V_(MABC) = frac(1,3) S_(ABC) dot d(M,(ABC))$. $V_max = frac(1,3) S_(ABC)(h+R)$.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(2.5); let A=proj(0,0,0); let B=proj(2,0.5,0); let C=proj(0.5,1.8,0); let M=proj(0.8,0.8,2.2)
  _pt(A,$A$,lp:"bl"); _pt(B,$B$,lp:"br"); _pt(C,$C$,lp:"tl"); _pt(M,$M$,clr:rgb(200,50,50))
  line(A,B,stroke:0.5pt); line(A,C,stroke:0.5pt); line(B,C,stroke:0.5pt)
  line(A,M,stroke:0.5pt); line(B,M,stroke:0.5pt); line(C,M,stroke:0.5pt)
})

#vd(
  [*Khoang chứa tàu vũ trụ.* Ba neo $A(3,0,0),B(0,3,0),C(0,0,0)$ (m). $M$ trên $x^2+y^2+z^2=9$. Tìm $V_max$ của $MABC$.],
  loigiai: [#reset-step()
    #step[$(ABC): z=0$. $h=0$. $S_(ABC)=frac(9,2)=4.5$ m\"^2\$.]
    #step[$V_max = frac(1,3) dot 4.5 dot 3 = 4.5$ $"m"^3$.]
  ],
)

#dang([Bài 6. Tổn hao tín hiệu từ hai trạm])

#phuongphap[
  $G$ trung điểm $"AB"$: $"MA"^2+"MB"^2 = 2 "MG"^2 + frac("AB"^2,2)$.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(2.8); let I=proj(1,0.8,1); _sph(I,1.6)
  let A=proj(0.2,0.3,0); let B=proj(2.5,1.8,0); let G=proj(1.35,1.05,0); let M=proj(1.5,0.5,1.8)
  _pt(A,$A$,lp:"bl"); _pt(B,$B$,lp:"br"); _pt(G,$G$,clr:rgb(50,150,50),lp:"b"); _pt(M,$M$,clr:rgb(200,50,50))
  line(A,G,stroke:(dash:"dotted",thickness:0.4pt)); line(G,B,stroke:(dash:"dotted",thickness:0.4pt))
  line(M,G,stroke:(dash:"dashed",paint:gray,thickness:0.4pt))
  line(M,A,stroke:0.4pt); line(M,B,stroke:0.4pt)
})

#vd(
  [*Tổn hao mạng cảm biến.* $A(5,0,0), B(-5,0,0)$. $M$ trong $x^2+y^2+z^2 <= 25$. $L="MA"^2+"MB"^2$. Tìm $L$ lớn nhất, nhỏ nhất.],
  loigiai: [#reset-step()
    #step[$G(0,0,0)=I$, $"IG"=0$. $"MG"_max=5$, $"MG"_min=0$. $"AB"^2=100$.]
    #step[$L_max=2dot 25+50=100$, $L_min=0+50=50$.]
  ],
)

#dang([Bài 7. Góc quan sát hai vệ tinh])

#phuongphap[
  $vec("MA") dot vec("MB") = "MG"^2 - frac("AB"^2,4)$. $cos angle "AMB" = frac(vec("MA")dot vec("MB"), MAdot "MB")$.
]

#vd(
  [*Góc quan sát.* $A(2,0,0), B(-2,0,0)$. Trạm $M$ trên $x^2+y^2+z^2=4$. Tìm $M$ để góc $"AMB"$ lớn nhất.],
  loigiai: [#reset-step()
    #step[$G(0,0,0)=I$. $"MG"_min=0$. $vec("MA")dot vec("MB")_min = 0-frac(16,4)=-4$.]
    #step[Tích vô hướng âm ⇒ $angle "AMB" > 90°$. Lớn nhất $180°$ khi $M$ ở $I$.]
  ],
)

#dang([Bài 8. Khoảng cách giữa hai vật thể hình cầu])

#phuongphap[
  $d="IJ"$. $"MN"_max = d+R_1+R_2$. $"MN"_min$ phụ thuộc vị trí tương đối.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(3.5); let I=proj(0.5,0.5,0.5); let J=proj(3.2,0.8,0.5)
  _sph(I,1,fc:rgb(200,230,255,90)); _sph(J,1.2,fc:rgb(255,210,210,90))
  _pt(I,$I$,lp:"bl"); _pt(J,$J$,lp:"br")
  line(I,J,stroke:(dash:"dashed",paint:gray,thickness:0.4pt))
})

#vd(
  [*Bong bóng xà phòng.* $(S_1):x^2+y^2+z^2=1$, $(S_2):(x-8)^2+y^2+z^2=4$. Tìm $"MN"_min$.],
  loigiai: [#reset-step()
    #step[$I(0,0,0),R_1=1$; $J(8,0,0),R_2=2$. $d=8>3=R_1+R_2$.]
    #step[$"MN"_min = 8-1-2=5$.]
  ],
)

#dang([Bài 9. Định vị tỉ số khoảng cách (RSSI)])

#phuongphap[
  $k="MA"/"MB"$. Dùng đối xứng hoặc mặt cầu Apollonius.
]

#vd(
  [*Định vị RSSI.* $A(3,0,0),B(-3,0,0)$. $M$ trên $x^2+y^2+z^2=1$. Tìm $k="MA"/"MB"$ lớn nhất.],
  loigiai: [#reset-step()
    #step[Đối xứng qua $"Ox"$. $M(x,0,0)$. $k(x)=frac(3-x,x+3)$ giảm.]
    #step[$k_max = k(-1)=2$, tại $M(-1,0,0)$.]
  ],
)

// ═══════════════════ PART 3 ═══════════════════

#part([Tối ưu đường đi, năng lượng và an toàn robot])

#chapter([Bài 10–14: Robot, cảm biến, tiếp xúc])

#dang([Bài 10. Quãng đường robot $"MA"+"MB"$])

#phuongphap[
  Cực trị trong mp $(A,B,I)$. Hạ 3D→2D.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(2.8); let I=proj(1,0.8,1); _sph(I,1.5)
  let A=proj(0,0.3,0.2); let B=proj(2.8,1.2,0.8); let M=proj(1.5,0.6,2.0)
  _pt(A,$A$,lp:"bl"); _pt(B,$B$,lp:"tr"); _pt(M,$M$,clr:rgb(200,50,50),lp:"t")
  line(A,M,stroke:0.5pt+rgb(50,50,200)); line(B,M,stroke:0.5pt+rgb(200,50,50))
})

#vd(
  [*Robot thám hiểm sao Hoả.* Robot đi từ $A(2,0,0)$ đến $B(-2,0,0)$ qua điểm $M$ trên hồ nước đóng băng $x^2+y^2+z^2=1$.
   Tìm quãng đường ngắn nhất và dài nhất.],
  loigiai: [#reset-step()
    #step[GTNN: $M(plus.minus 1,0,0)$ ⇒ $"MA"+"MB"=1+3=4$ km.]
    #step[GTLN: $M(0,plus.minus 1,0)$ ⇒ $"MA"="MB"=sqrt(5)$, $max=2sqrt(5)approx 4.47$ km.]
  ],
)

#dang([Bài 11. Chênh lệch tín hiệu $|"MA"-"MB"|$])

#vd(
  [*GPS chênh lệch.* $A(2,0,0),B(-2,0,0)$, $M$ trên $x^2+y^2+z^2=1$. $Delta=|"MA"-"MB"|$ lớn nhất?],
  loigiai: [#reset-step()
    #step[$M(1,0,0)$: $|1-3|=2$. $M(-1,0,0)$: $|3-1|=2$. $Delta_max=2$.]
  ],
)

#dang([Bài 12. Năng lượng tương tác $"MA" dot "MB"$])

#vd(
  [*Tương tác từ trường.* $A(2,0,0),B(-2,0,0)$, $M$ trên $x^2+y^2+z^2=1$. $E="MA" dot "MB"$ dao động trong?],
  loigiai: [#reset-step()
    #step[$"MA"^2=5-4x$, $"MB"^2=5+4x$. $("MA" dot "MB")^2=25-16x^2$.]
    #step[$-1 <= x <= 1$ ⇒ $3 <= "MA" dot "MB" <= 5$.]
  ],
)

#dang([Bài 13. An toàn robot — hai đường chéo nhau])

#phuongphap[
  $d(Delta_M,d) = frac(|vec("AM") dot (vec u times vec v)|,|vec u times vec v|)$.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(3); let I=proj(1,0.8,0.8); _sph(I,1.5)
  let A=proj(0.2,0.3,0); let M=proj(1.5,0.5,1.8)
  _pt(A,$A$,lp:"bl"); _pt(M,$M$,clr:rgb(200,50,50))
  line(proj(0.5,0,0.5),proj(2.5,2,0.5),stroke:0.5pt+rgb(180,80,80),mark:(end:"stealth",scale:0.4))
  content(proj(2.6,1.8,0.5),text(size:6pt)[$d$])
})

#vd(
  [*Robot và băng tải.* Robot trên mặt cầu $x^2+y^2+z^2=9$, tay robot $vec u=(0,0,1)$. Băng tải $d$ qua $A(1,0,0)$, $vec v=(0,1,0)$.
   Khoảng cách an toàn tối thiểu $3$ m. Có đảm bảo không?],
  loigiai: [#reset-step()
    #step[$vec n=vec u times vec v = (-1,0,0)$, $|vec n|=1$. $d=|1-x|$.]
    #step[$-3 <= x <= 3$. $d_max=4$ (tại $x=-3$), $d_min=0$ (tại $x=1$).]
    #step[$d_min=0 < 3$ ⇒ KHÔNG an toàn. Cần giới hạn $x notin [1,1]$ trong vùng nguy hiểm.]
  ],
)

#dang([Bài 14. Liên lạc vệ tinh địa tĩnh — Tiếp điểm])

#phuongphap[
  $vec("IM") dot vec("IA") = R^2$. Tập tiếp điểm là đường tròn.
]

#canvas(length:1.2cm, {
  import draw: *
  _axes(3); let O=proj(0,0,0); _sph(O,1.5)
  let A=proj(0,0,3.2); let M=proj(1,0.5,0.8); let N=proj(-0.5,1.2,0.6)
  _pt(O,$O$,lp:"bl"); _pt(A,$A$,lp:"t"); _pt(M,$M$,clr:rgb(200,50,50)); _pt(N,$N$,clr:rgb(200,50,50),lp:"tl")
  line(A,M,stroke:0.5pt+rgb(180,80,80)); line(A,N,stroke:0.5pt+rgb(180,80,80))
  line(O,A,stroke:(dash:"dashed",paint:gray,thickness:0.4pt))
})

#vd(
  [*Vệ tinh địa tĩnh.* Trái đất $x^2+y^2+z^2=9$. Vệ tinh $A(0,0,5)$. Tìm độ cao $z$ của điểm tiếp xúc và bán kính đường tròn tiếp điểm.],
  loigiai: [#reset-step()
    #step[Điều kiện tiếp xúc: $vec("OM")dot vec("OA")=R^2$ ⇒ $(x,y,z)dot(0,0,5)=9$ ⇒ $5z=9$ ⇒ $z=9/5=1.8$.]
    #step[Nghìn km. Thay vào $x^2+y^2+3.24=9$ ⇒ $x^2+y^2=5.76$ ⇒ $r=2.4$ nghìn km.]
  ],
)

// ═══════════════════ PART 4 ═══════════════════

#part([Giao tuyến, chỏm cầu và ứng dụng])

#chapter([Bài 15–20: Chồng lấn, cảm biến, nhiệt độ, tham số])

#dang([Bài 15. Vùng phủ chồng lấn hai trạm])

#phuongphap[
  Trừ hai phương trình mặt cầu ⇒ mặt phẳng. Giao là đường tròn.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(3.5); let I=proj(0.5,0.8,0.5); let J=proj(2.8,0.8,0.5)
  _sph(I,1.5,fc:rgb(200,230,255,80)); _sph(J,1.5,fc:rgb(255,210,210,80))
})

#vd(
  [*Chồng lấn sóng.* $(S_1):x^2+y^2+z^2=25$, $(S_2):(x-6)^2+y^2+z^2=25$. $M$ trong vùng chồng lấn. Tìm $y_max$.],
  loigiai: [#reset-step()
    #step[Trừ: $x^2-(x-6)^2=0$ ⇒ $x=3$. $y^2+z^2=16$ ⇒ $y_max=4$.]
  ],
)

#dang([Bài 16. Bay trong tầm kiểm soát — nửa không gian])

#phuongphap[
  Chỏm cầu. Xét cực trị tự do và trên biên $z=c$.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(2.8); let I=proj(0,0,0); _sph(I,1.8)
  line(proj(-1.8,-1,0.3),proj(1.8,1,0.3),stroke:0.7pt+rgb(50,100,200))
  content(proj(1.4,0.5,0.8),text(size:6pt,fill:rgb(50,100,200))[$z=c$])
})

#vd(
  [*Không lưu.* Máy bay trong $x^2+y^2+z^2=1$, $z >= 0$. $P=x+y+z$ lớn nhất và nhỏ nhất?],
  loigiai: [#reset-step()
    #step[Tự do: $P_max=sqrt(3)$ (thoả), $P_min=-sqrt(3)$ (loại vì $z<0$).]
    #step[Biên $z=0$: $x^2+y^2=1$, $P=x+y$. $P_min=-sqrt(2)$.]
    #step[$P_max=sqrt(3) approx 1.732$, $P_min=-sqrt(2) approx -1.414$.]
  ],
)

#dang([Bài 17. Cảm biến hai chiều — tích hai khoảng cách])

#vd(
  [*Cảm biến nhà máy.* $M$ trên $x^2+y^2+z^2=1$. $S=|x|dot|y|$. Tìm $S_max$.],
  loigiai: [#reset-step()
    #step[$2|x y| <= x^2+y^2 <= 1$ ⇒ $S_max=1/2$ tại $x^2=y^2=1/2,z=0$.]
  ],
)

#dang([Bài 18. Phân bố nhiệt độ bề mặt hành tinh])

#vd(
  [*Nhiệt độ.* $T=x y+y z+z x$ trên $x^2+y^2+z^2=4$. Tìm $T_max$.],
  loigiai: [#reset-step()
    #step[$(x+y+z)^2=4+2T$ ⇒ $T=frac((x+y+z)^2-4,2)$.]
    #step[Cauchy: $(x+y+z)^2 <= 12$ ⇒ $T_max = frac(12-4,2)=4°C$ tại $x=y=z=2/sqrt(3)$.]
  ],
)

#dang([Bài 19. Tối ưu thiết diện radar])

#phuongphap[
  $r(m) = sqrt(R^2 - h^2(m))$. $h(m)=d(I,(P_m))$.
]

#canvas(length:1.1cm, {
  import draw: *
  _axes(3); let I=proj(0,0,0); _sph(I,2)
  let c1=proj(0,0,1.2)
  circle(c1,radius:(1.6,0.5),stroke:0.7pt+rgb(50,100,200))
  content(proj(1.5,1.2,1.2),text(size:6pt,fill:rgb(50,100,200))[thiết diện])
})

#vd(
  [*Radar.* $x^2+y^2+z^2=25$, $(P_m):x+2y+2z-m=0$. Tìm $m$ để thiết diện lớn nhất.],
  loigiai: [#reset-step()
    #step[$h=|m|/3$. $S=pi(25-m^2/9)$ max khi $h=0$ ⇒ $m=0$. Thiết diện là đường tròn lớn $R=5$.]
  ],
)

#dang([Bài 20. Kiểm tra tầm phủ — tham số $m$])

#vd(
  [*Trạm di động.* $(S):(x-1)^2+(y+2)^2+(z-3)^2=4$. Mặt phẳng $x-2y+2z=m$. Tìm $m$ để cắt mặt cầu.],
  loigiai: [#reset-step()
    #step[$I(1,-2,3),R=2$. $P(I)=11$, $|vec n|=3$. $P_min=5,P_max=17$.]
    #step[$5 <= m <= 17$: có tín hiệu. $m=5$ hoặc $m=17$: tiếp xúc (yếu nhất).]
  ],
)

#vd(
  [*Đèn pha.* $x^2+y^2+z^2=1$, $P=2x-y+2z=m$. Tìm khoảng $m$ để tồn tại $M$.],
  loigiai: [#reset-step()
    #step[$I(0,0,0),R=1$, $|vec n|=3$. $P_min=-3,P_max=3$ ⇒ $-3 <= m <= 3$.]
  ],
)

// ═══════════════════ PHỤ LỤC ═══════════════════

#phuluc("Bảng tổng hợp 20 mô hình")

#table(
  columns: (auto, auto, auto),
  stroke: 0.4pt,
  [*STT*], [*Bối cảnh thực tế*], [*Dạng toán*],
  [1],[Trạm phát wifi],[$P=u x+v y+w z+d$],
  [2],[Khinh khí cầu – sườn núi],[$d(M,(P))$],
  [3],[Vệ tinh – đường bay],[$d(M,Delta)$],
  [4],[Vùng phủ tam giác],[$S_("MAB")$],
  [5],[Khoang chứa tàu vũ trụ],[$V_("MABC")$],
  [6],[Tổn hao mạng cảm biến],[$"MA"^2+"MB"^2$],
  [7],[Góc quan sát vệ tinh],[$vec("MA")dot vec("MB")$],
  [8],[Bong bóng xà phòng],[$"MN"$ hai cầu],
  [9],[Định vị RSSI],[$"MA"/"MB"$],
  [10],[Robot thám hiểm sao Hoả],[$"MA"+"MB"$],
  [11],[Đo lệch pha GPS],[$|"MA"-"MB"|$],
  [12],[Tương tác từ trường],[$MAdot "MB"$],
  [13],[Robot công nghiệp + băng tải],[$d(Delta_M,d)$],
  [14],[Vệ tinh địa tĩnh],[Tiếp điểm],
  [15],[Chồng lấn vùng phủ],[Giao 2 cầu],
  [16],[Bay trong tầm kiểm soát],[Nửa không gian],
  [17],[Cảm biến hai chiều],[$|x|dot |y|$],
  [18],[Phân bố nhiệt độ],[$x y+y z+z x$],
  [19],[Tối ưu thiết diện],[$r(m)$],
  [20],[Kiểm tra tầm phủ],[Tồn tại $m$],
)

#phuluc("5 bước mô hình hoá")

#table(
  columns: (auto, 1fr), stroke: 0.4pt,
  [*Bước*], [*Nội dung*],
  [1],[Xác định *vùng không gian* (mặt cầu, chỏm cầu)],
  [2],[Xác định *đại lượng cần tối ưu*],
  [3],[Biểu diễn thành *hàm toạ độ* $M(x,y,z)$],
  [4],[Chọn *công thức nhanh* hoặc hạ 3D→2D],
  [5],[Tìm min–max và *đối chiếu điều kiện thực tế*],
)

#nhanxet[
  Biên soạn bởi hệ thống STEXGV — CT2018. CeTZ 3D + lời giải từng bước.
]
