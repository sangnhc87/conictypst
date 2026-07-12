// HƯỚNG DẪN SỬ DỤNG TYPST CHO GIÁO VIÊN HÓA HỌC (BẢN CHI TIẾT)
// Tích hợp gói typsium và typed-smiles

#import "@preview/typsium:0.3.2": ce
#import "@preview/typed-smiles:0.6.0": smiles, smiles-inline, reaction, rxn-arrow, mol, arrow, lp, atom, cycle, step, mol-weight, bond, smiles-cetz, highlight
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import "@preview/cetz:0.5.2"

// --- CẤU HÌNH GIAO DIỆN CƠ BẢN ---
#set page(
  paper: "a4",
  margin: (top: 2.0cm, bottom: 2.0cm, left: 1.5cm, right: 1.5cm),
  header: context {
    grid(
      columns: (1fr, auto),
      align(left)[#text(fill: rgb("#0a063b"), weight: "bold", size: 9pt)[SANG MATH - HỖ TRỢ GIÁO VIÊN HÓA HỌC]],
      align(right)[#text(fill: rgb("#10868f"), weight: "bold", size: 9pt)[HƯỚNG DẪN SỬ DỤNG CHI TIẾT]]
    )
    v(-2pt)
    line(length: 100%, stroke: (paint: rgb("#cbd5e1"), thickness: 0.8pt, dash: "dashed"))
  },
  footer: context {
    line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
    align(center)[#text(size: 9pt)[Trang #counter(page).display("1")]]
  }
)

#set text(font: "New Computer Modern", size: 10.5pt, fill: rgb("#0a063b"))
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "I.1.")

// Các hộp sư phạm
#let c-dark = rgb("#0a063b")
#let c-teal = rgb("#10868f")
#let c-orange = rgb("#f26422")

#show heading.where(level: 1): it => {
  v(0.5cm)
  box(
    width: 100%,
    fill: c-teal,
    inset: 10pt,
    radius: 4pt,
  )[
    #text(fill: white, weight: "bold", size: 14pt)[#upper(it.body)]
  ]
  v(0.3cm)
}

#show heading.where(level: 2): it => {
  v(0.4cm)
  text(fill: c-orange, weight: "bold", size: 12pt)[#it]
  v(0.2cm)
}

#let ghichu(body) = {
  v(0.4em)
  box(
    width: 100%,
    fill: rgb("#fffde7"),
    stroke: (left: 3pt + c-orange, rest: 0.5pt + rgb("#fef08a")),
    inset: 8pt,
    radius: (right: 4pt)
  )[
    #text(fill: c-orange.darken(15%), weight: "bold", size: 10pt)[💡 LƯU Ý: ]
    #text(size: 10.5pt, style: "italic")[#body]
  ]
  v(0.4em)
}

#align(center)[
  #text(weight: "bold", size: 20pt, fill: c-dark)[HƯỚNG DẪN SOẠN THẢO HÓA HỌC CHUYÊN SÂU]
  
  #text(style: "italic", size: 12pt, fill: c-teal)[Tài liệu dành cho Giáo viên Hóa học (Sử dụng typsium & typed-smiles)]
]

#v(1cm)
#outline(title: "Mục lục")
#pagebreak()

= Gói lệnh Typsium (Phương trình & Ký hiệu)

Gói lệnh `typsium` dùng để định dạng cực nhanh các công thức, phương trình phản ứng.
Cú pháp cơ bản: `#ce("công_thức")` (sử dụng ngoặc kép) hoặc `#ce[công_thức]` (để nhúng mã Typst).

== 1. Viết công thức phân tử, Ion và Đồng vị
Typst tự động nhận diện chữ số để chuyển thành chỉ số dưới (subscript) và dấu `+`, `-` thành điện tích (superscript).

- Phân tử cơ bản: #ce("H2SO4"), #ce("Na2CO3")
- Ion đơn giản và đa nguyên tử: #ce("Cu^2+"), #ce("SO4^2-")
- Phức chất có dấu ngoặc vuông: #ce("[Cu(NH3)4]^2+")
- *Đồng vị (Cực kỳ quan trọng cho phần Hạt nhân):* Cần theo đúng thứ tự `^số_khối_số_hiệuTên`. Ví dụ: #ce("^227_90Th+")
- Số oxi hóa và gốc tự do: `#ce("Fe^^III")` $->$ #ce("Fe^^III"), Gốc tự do: `#ce("Cl^.")` $->$ #ce("Cl^.")
- Trạng thái tập hợp: `#ce("NaCl(aq) + He(g) + C(s)")` $->$ #ce("NaCl(aq) + He(g) + C(s)")

== 2. Các hạt cơ bản
Sử dụng các tên viết tắt, Typst tự động render ra ký hiệu chuẩn xác:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + c-teal,
  `#ce("electron")`, ce("electron"), `#ce("e-")`, ce("e-"),
  `#ce("proton")`, ce("proton"), `#ce("p+")`, ce("p+"),
  `#ce("neutron")`, ce("neutron"), `#ce("alpha")`, ce("alpha"),
  `#ce("beta-")`, ce("beta-"), `#ce("muon-")`, ce("muon-"),
)

== 3. Phương trình phản ứng và Mũi tên toàn tập
Gói lệnh cung cấp hệ thống mũi tên cực kỳ phong phú:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + c-teal,
  `#ce("A -> B")`, ce("A -> B"), `#ce("A <- B")`, ce("A <- B"),
  `#ce("A <=> B")`, ce("A <=> B"), `#ce("A => B")`, ce("A => B"),
  `#ce("A <= B")`, ce("A <= B"), `#ce("A -/> B")`, ce("A -/> B"),
  `#ce("A </- B")`, ce("A </- B"), `#ce("A <=>> B")`, ce("A <=>> B"),
)

*Thêm điều kiện phản ứng (Nhiệt độ, chất xúc tác):*
Dùng cú pháp ngoặc vuông `[trên][dưới]` ngay sau mũi tên:
- `#ce("CaCO3 ->[$Delta$ t^o] CaO + CO2")` $->$ #ce("CaCO3 ->[$Delta$ t^o] CaO + CO2")
- `#ce("A ->[LiAlH4][($Delta$ H, reflux)] B")` $->$ #ce("A ->[LiAlH4][($Delta$ H, reflux)] B")
- *Nhúng mã Typst vào phương trình (dùng `[]` thay vì `""`):* 
  `#ce[A ->[#text(fill: red)[Nhiệt độ cao]] B]` $->$ #ce[A ->[#text(fill: red)[Nhiệt độ cao]] B]

== 4. Hằng số cân bằng ($K_c, K_p$)
Chỉ cần kết hợp môi trường Toán học `$ $` của Typst:
$ K_c = ([N H_3]^2) / ([N_2] [H_2]^3) $
$ K_p = (P_{N H_3}^2) / (P_{N_2} P_{H_2}^3) $

#pagebreak()

= Gói lệnh Typed-Smiles (Vẽ cấu trúc phân tử)

Gói `typed-smiles` là công cụ tối thượng để vẽ sơ đồ 2D cho Hóa Hữu cơ thông qua chuỗi SMILES.
Cú pháp cơ bản: `#smiles("chuỗi_SMILES")`.

== 1. Vẽ cấu trúc cơ bản và Nội dòng (Inline)
- Hợp chất mạch hở: #smiles("CC(N)C(=O)O") (Alanine)
- Vòng thơm: #smiles("ClC1=CC=CC=C1") (Chlorobenzene)
- Dị vòng: #smiles("C1=CC=CO1") (Furan)

*Chèn phân tử ngay trong câu (Inline):*
Dùng lệnh `#smiles-inline()`. Ví dụ: Khi đun nóng Ethanol #smiles-inline("CCO") với $H_2 S O_4$ đặc ở $170^o C$, ta thu được Ethylene #smiles-inline("C=C"). Việc này không làm xô lệch dòng chữ.

== 2. Tùy biến kiểu dáng (Style Presets) chuẩn tạp chí
Bạn có thể áp dụng phong cách vẽ của các tạp chí hóa học danh tiếng thông qua thuộc tính `style`:
- Mặc định: #smiles("CC(N)C(=O)O")
- Chuẩn ACS (Hội Hóa học Hoa Kỳ): #smiles("CC(N)C(=O)O", style: "acs")
- Chuẩn Nature: #smiles("CC(N)C(=O)O", style: "nature")
- Vòng Benzen vẽ dạng hình tròn (Aromatic Circle): #smiles("c1ccccc1", aromatic: "circle")

== 3. Ẩn/Hiện Hydrogen và Chú thích nguyên tử
Bạn có quyền kiểm soát hoàn toàn việc hiển thị nguyên tử H và các chú thích.
- Hiện tất cả H: `#smiles("CCO", show-h: "all")` $->$ #smiles("CCO", show-h: "all")
- Viết rõ nhóm H: `#smiles("[NH3]")` $->$ #smiles("[NH3]")
- *Chú thích (Đánh số nguyên tử C):*
  Sử dụng thuộc tính `atom-annotations`:
  #smiles("N[C@@H](C)C(=O)O", atom-annotations: ((1, [$alpha$], (-0.4, -0.05)), (2, [$beta$]), (3, [$gamma$])))

== 4. Hiện cặp electron chưa liên kết (Lone pairs)
Giúp giải thích cơ chế phản ứng cho học sinh, hiển thị các cặp electron tự do.
- Dạng chấm (dots): #smiles("CCO", lone-pairs: "dots")
- Dạng vạch (lines): #smiles("CCN", lone-pairs: "lines")

== 5. Tùy chỉnh Màu sắc và Độ mờ
Bạn có thể thiết lập màu CPK mặc định hoặc tự đổi màu cho từng nhóm chức.
- Bật màu CPK: `#smiles("CC(N)C(=O)O", color: true)` $->$ #smiles("CC(N)C(=O)O", color: true)
- Gán nhãn và đổi màu tùy ý: 
  `#smiles("{>PPh3}C({OEt})=O", atom-colors: (O: rgb("#8B4513"), "{PPh3}": rgb("#7B2D8B")))` 
  $->$ #smiles("{>PPh3}C({OEt})=O", atom-colors: (O: rgb("#8B4513"), "{PPh3}": rgb("#7B2D8B")))
- Đổi màu liên kết cụ thể (ví dụ nhấn mạnh liên kết bị bẻ gãy):
  `#smiles("CC(=O)OCC", bond-customizations: ((bond(1, 3), (color: red, stroke: 1.4pt)),))`
  $->$ #smiles("CC(=O)OCC", bond-customizations: ((bond(1, 3), (color: red, stroke: 1.4pt)),))

== 6. Tính Phân tử khối tự động
Hàm `#mol-weight()` tự động tính $M$ dựa trên chuỗi SMILES.
- Caffein (`CN1C=NC2=C1C(=O)N(C(=O)N2C)C`): Phân tử khối là #calc.round(mol-weight("CN1C=NC2=C1C(=O)N(C(=O)N2C)C"), digits: 2) g/mol.

#pagebreak()
== 7. Chuỗi phản ứng (Reaction Schemes)
Sử dụng hàm `#reaction()` để gom các chất và mũi tên thành một sơ đồ chuyên nghiệp. Có thể dùng `dir: "down"`, `"left"` để bẻ hướng mũi tên.

#align(center)[
  #reaction(
    mol(smiles("C1=CC=CC=C1"), label: text(size: 9pt)[Benzene]),
    rxn-arrow(above: ce("Br2"), below: ce("FeBr3")),
    mol(smiles("BrC1=CC=CC=C1"), label: text(size: 9pt)[Bromobenzene]),
    rxn-arrow(dir: "down", above: ce("HNO3"), below: ce("H2SO4")),
    mol(smiles("BrC1=CC(=CC=C1)[N+](=O)[O-]")),
  )
]

== 8. Sơ đồ cơ chế di chuyển Electron (Electron-pushing)
Vẽ mũi tên cong di chuyển electron từ một cặp e (lone pair) đến một nguyên tử khác. (Rất phù hợp cho học sinh đội tuyển).

#align(center)[
  #reaction(
    mol("[OH-]", lone-pairs: "dots", offset: (1.5, 1)),
    mol("C(I)(C)C"),
    arrow(from: lp(0, 0, offset:(-0.3, -0.2)), to: atom(1, 0, offset : (0.1, -0.1)), bend: "right", color : blue),
  )
]

== 9. Chu trình xúc tác (Catalytic Cycles)
Hàm `#cycle()` giúp vẽ các chu trình khép kín, rất thích hợp khi giảng dạy cơ chế xúc tác phức tạp.

#align(center)[
  #cycle(
    radius: 3.5,
    reagent-bend: 0.06,
    mol(box(inset: 2pt, ce("RhCl(PPh3)3"))),
    step(label: ce("-PPh3 + S")),
    mol(box(inset: 2pt, ce("RhCl(PPh3)2S"))),
    step(label: [oxidative addition], into: ce("H2"), bend: 0.02),
    mol(box(inset: 2pt, ce("RhH2Cl(PPh3)2"))),
  )
]

#ghichu[
  *Tóm lại:* Gói lệnh `typsium` là công cụ bắt buộc phải có cho Hóa vô cơ, tính toán cơ bản và định dạng text hóa học. 
  Trong khi đó, `typed-smiles` là báu vật thực sự cho Hóa hữu cơ, giúp giáo viên vẽ mọi sơ đồ phân tử, cơ chế mũi tên cong và tính toán phân tử khối hoàn toàn tự động chỉ bằng một vài dòng code Typst!
]

#pagebreak()
= Phụ lục: Thư viện Mẫu chuẩn bám sát SGK Hóa học 10-11-12

Phần này cung cấp các đoạn code mẫu điển hình nhất trong chương trình phổ thông mới (CT GDPT 2018). Thầy/cô chỉ việc copy code và dán vào giáo án, đề thi của mình!

#let vidu(code, res) = {
  v(0.5em)
  rect(width: 100%, stroke: 0.5pt + c-teal, radius: 4pt, inset: 0pt)[
    #grid(
      columns: (1fr, 1fr),
      box(width: 100%, inset: 10pt, fill: rgb("#f8fafc"))[
        #text(weight: "bold", fill: c-dark)[Code Typst:]
        #v(0.3em)
        #code
      ],
      box(width: 100%, inset: 10pt, stroke: (left: 0.5pt + c-teal))[
        #text(weight: "bold", fill: c-dark)[Kết quả hiển thị:]
        #v(0.3em)
        #align(center + horizon)[#res]
      ]
    )
  ]
  v(0.5em)
}

== 1. Hóa học 10
Đặc trưng ở khối 10 là các phản ứng Hạt nhân, sơ đồ cấu tạo nguyên tử, tính biến thiên Enthalpy và phản ứng oxi hóa - khử.

#vidu(
  ```typst
  *Phân rã phóng xạ của Uranium:*
  #ce("^238_92U -> ^234_90Th + ^4_2He")
  
  *Tính biến thiên Enthalpy:*
  Cho phản ứng: 
  #ce("CH4(g) + 2O2(g) -> CO2(g) + 2H2O(l)") \
  Nhiệt đốt cháy chuẩn: $Delta_r H^o_{298} = -890.3 "kJ"$
  ```,
  [
    *Phân rã phóng xạ của Uranium:* \
    #ce("^238_92U -> ^234_90Th + ^4_2He")
    #v(0.5em)
    *Tính biến thiên Enthalpy:* \
    Cho phản ứng: 
    #ce("CH4(g) + 2O2(g) -> CO2(g) + 2H2O(l)") \
    Nhiệt đốt cháy chuẩn: $Delta_r H^o_{298} = -890.3 "kJ"$
  ]
)

== 2. Hóa học 11
Khối 11 tập trung vào cân bằng hóa học (Nitrogen, Sulfur) và bùng nổ các hợp chất Hữu cơ (Hydrocarbon, Alcohol, Carboxylic acid). Rất cần `typed-smiles`!

#vidu(
  ```typst
  *Cân bằng điện li yếu:*
  #ce("CH3COOH(aq) <=> CH3COO-(aq) + H+(aq)") \
  Hằng số điện li: $K_a = 1.75 times 10^{-5}$
  
  *Phản ứng Halogen hóa Benzene:*
  #reaction(
    mol(smiles("C1=CC=CC=C1")),
    rxn-arrow(above: ce("Br2"), below: ce("FeBr3, t^o")),
    mol(smiles("BrC1=CC=CC=C1"))
  )
  ```,
  [
    *Cân bằng điện li yếu:* \
    #ce("CH3COOH(aq) <=> CH3COO-(aq) + H+(aq)") \
    Hằng số điện li: $K_a = 1.75 times 10^{-5}$
    #v(0.5em)
    *Phản ứng Halogen hóa Benzene:* \
    #reaction(
      mol(smiles("C1=CC=CC=C1")),
      rxn-arrow(above: ce("Br2"), below: ce("FeBr3, t^o")),
      mol(smiles("BrC1=CC=CC=C1"))
    )
  ]
)

== 3. Hóa học 12
Khối 12 yêu cầu vẽ cấu trúc phân tử sinh học phức tạp (Ester, Carbohydrate, Polymer, Amino acid) và Hóa vô cơ nâng cao (Pin điện hóa, Phức chất).

#vidu(
  ```typst
  *Ester (Ethyl acetate) & Amine:*
  #smiles("CC(=O)OCC") \
  #smiles("CN(C)C", lone-pairs: "dots")
  
  *Pin điện hóa và Phức chất:*
  SĐĐ chuẩn: $E^o_"pin" = E^o_"cathode" - E^o_"anode"$ \
  Bán phản ứng Anode: #ce("Zn -> Zn^2+ + 2e-") \
  Ion phức Copper(II): #ce("[Cu(NH3)4]^2+")
  ```,
  [
    *Ester (Ethyl acetate) & Amine:* \
    #smiles("CC(=O)OCC") \
    #smiles("CN(C)C", lone-pairs: "dots")
    #v(0.5em)
    *Pin điện hóa và Phức chất:* \
    SĐĐ chuẩn: $E^o_"pin" = E^o_"cathode" - E^o_"anode"$ \
    Bán phản ứng Anode: #ce("Zn -> Zn^2+ + 2e-") \
    Ion phức Copper(II): #ce("[Cu(NH3)4]^2+")
  ]
)

== 4. Phương trình & Cân bằng Oxi hóa - khử
Viết phương trình hóa học cơ bản, có chất khí bay lên, kết tủa và cân bằng hệ số.

#vidu(
  ```typst
  *Phản ứng tạo khí và kết tủa:*
  #ce("Cu + 4HNO3(dac) -> Cu(NO3)2 + 2NO2^ + 2H2O") \
  #ce("BaCl2 + Na2SO4 -> BaSO4 v + 2NaCl")
  
  *Cân bằng Oxi hóa - khử:*
  Quá trình nhường/nhận electron:
  $ "Fe" -> "Fe"^(+3) + 3e^- $
  $ "O"_2 + 4e^- -> 2"O"^(-2) $
  ```,
  [
    *Phản ứng tạo khí và kết tủa:* \
    #ce("Cu + 4HNO3(dac) -> Cu(NO3)2 + 2NO2^ + 2H2O") \
    #ce("BaCl2 + Na2SO4 -> BaSO4 v + 2NaCl")
    #v(0.5em)
    *Cân bằng Oxi hóa - khử:* \
    Quá trình nhường/nhận electron:
    $ "Fe" -> "Fe"^(+3) + 3e^- $
    $ "O"_2 + 4e^- -> 2"O"^(-2) $
  ]
)

== 5. Chuỗi phản ứng hóa học (Sơ đồ điều chế)
Giáo viên thường xuyên ra các câu hỏi hoàn thành chuỗi phản ứng. Có thể dùng `typsium` cho chuỗi vô cơ và `reaction()` cho chuỗi hữu cơ nhiều nhánh.

#vidu(
  ```typst
  *Chuỗi phản ứng Vô cơ (viết liên tiếp):*
  #ce("FeS2 ->[+O_2][t^o] SO2 ->[+O_2][V_2O_5, t^o] SO3 ->[+H_2O] H2SO4")
  
  *Chuỗi phản ứng Hữu cơ (rẽ nhánh):*
  #reaction(
    mol(smiles("CCO"), label: [Ethanol]),
    rxn-arrow(above: ce("CuO"), below: ce("t^o")),
    mol(smiles("CC=O"), label: [Acetaldehyde]),
    rxn-arrow(dir: "down", above: ce("O2"), below: ce("Mn^(2+)")),
    mol(smiles("CC(=O)O"), label: [Acetic acid])
  )
  ```,
  [
    *Chuỗi phản ứng Vô cơ (viết liên tiếp):* \
    #ce("FeS2 ->[+O_2][t^o] SO2 ->[+O_2][V_2O_5, t^o] SO3 ->[+H_2O] H2SO4")
    #v(0.5em)
    *Chuỗi phản ứng Hữu cơ (rẽ nhánh):* \
    #reaction(
      mol(smiles("CCO"), label: [Ethanol]),
      rxn-arrow(above: ce("CuO"), below: ce("t^o")),
      mol(smiles("CC=O"), label: [Acetaldehyde]),
      rxn-arrow(dir: "down", above: ce("O2"), below: ce("Mn^(2+)")),
      mol(smiles("CC(=O)O"), label: [Acetic acid])
    )
  ]
)

== 6. Trình bày Lời giải Bài toán Hóa học
Kết hợp `ce` và môi trường Toán `$ $` của Typst để giải bài toán định lượng (tính khối lượng, số mol, lập hệ phương trình).

#vidu(
  ```typst
  *Bài toán:* Hòa tan 5,6g Fe vào dung dịch HCl dư. Tính thể tích khí thoát ra (đkc).

  *Lời giải:* \
  Phương trình hóa học: 
  #ce("Fe + 2HCl -> FeCl2 + H2^")
  
  Số mol Sắt ban đầu: 
  $ n_("Fe") = m / M = 5.6 / 56 = 0.1 " (mol)" $
  
  Theo PTHH, ta có: $n_("H"_2) = n_("Fe") = 0.1 " (mol)"$
  Thể tích khí Hydrogen thoát ra:
  $ V_("H"_2) = n times 24.79 = 0.1 times 24.79 = 2.479 " (L)" $
  
  *Hệ phương trình (nếu giải hỗn hợp kim loại):*
  $ cases(
    64x + 56y = 12.0,
    2x + 2y = 0.4
  ) => cases(
    x = 0.1 "mol",
    y = 0.1 "mol"
  ) $
  ```,
  [
    *Bài toán:* Hòa tan 5,6g Fe vào dung dịch HCl dư. Tính thể tích khí thoát ra (đkc).

    *Lời giải:* \
    Phương trình hóa học: \
    #ce("Fe + 2HCl -> FeCl2 + H2^")
    
    Số mol Sắt ban đầu: 
    $ n_("Fe") = m / M = 5.6 / 56 = 0.1 " (mol)" $
    
    Theo PTHH, ta có: $n_("H"_2) = n_("Fe") = 0.1 " (mol)"$ \
    Thể tích khí Hydrogen thoát ra:
    $ V_("H"_2) = n times 24.79 = 0.1 times 24.79 = 2.479 " (L)" $
    
    *Hệ phương trình (nếu giải hỗn hợp kim loại):*
    $ cases(
      64x + 56y = 12.0,
      2x + 2y = 0.4
    ) => cases(
      x = 0.1 "mol",
      y = 0.1 "mol"
    ) $
  ]
)

== 7. Chuỗi chuyển hóa vô cơ dạng lưới (Sử dụng Fletcher)
Gói lệnh `fletcher` rất mạnh mẽ để vẽ các sơ đồ chuyển hóa vô cơ phức tạp (đặc biệt là sơ đồ hình sao, đa nhánh).

#vidu(
  ```typst
  #align(center)[
    #diagram(
      node-stroke: 1pt, node-fill: rgb("#f1f5f9"), node-corner-radius: 5pt,
      node((0,0), ce("NaCl"), name: <nacl>),
      node((1,0), ce("NaOH"), name: <naoh>),
      node((1,1), ce("NaHCO3"), name: <nahco3>),
      node((0,1), ce("Na2CO3"), name: <na2co3>),
      edge(<nacl>, <naoh>, "->", label: ce("+ H2O (dpmn)")),
      edge(<naoh>, <nahco3>, "->", label: ce("+ CO2")),
      edge(<nahco3>, <na2co3>, "->", label: ce("t^o")),
      edge(<na2co3>, <nacl>, "->", label: ce("+ HCl")),
      edge(<naoh>, <na2co3>, "->", bend: 20deg)
    )
  ]
  ```,
  [
    #align(center)[
      #diagram(
        node-stroke: 1pt, node-fill: rgb("#f1f5f9"), node-corner-radius: 5pt,
        node((0,0), ce("NaCl"), name: <nacl>),
        node((1,0), ce("NaOH"), name: <naoh>),
        node((1,1), ce("NaHCO3"), name: <nahco3>),
        node((0,1), ce("Na2CO3"), name: <na2co3>),
        edge(<nacl>, <naoh>, "->", label: ce("+ H2O (dpmn)")),
        edge(<naoh>, <nahco3>, "->", label: ce("+ CO2")),
        edge(<nahco3>, <na2co3>, "->", label: ce("t^o")),
        edge(<na2co3>, <nacl>, "->", label: ce("+ HCl")),
        edge(<naoh>, <na2co3>, "->", bend: 20deg)
      )
    ]
  ]
)

== 8. Đồ thị Chuẩn độ Acid - Base (Hóa 11)
Biểu diễn đường cong chuẩn độ (Titration curve), một nội dung thực hành rất quan trọng trong SGK Hóa học 11 mới.

#vidu(
  ```typst
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Trục tọa độ
      line((0,0), (6,0), name: "x", mark: (end: ">", fill: black))
      line((0,0), (0,4), name: "y", mark: (end: ">", fill: black))
      content((6.2, -0.2), text(size: 9pt)[V (mL)])
      content((-0.2, 4.2), text(size: 9pt)[pH])
      
      // Đường cong chuẩn độ chữ S
      bezier((0, 0.5), (5, 3.5), (2.5, 0.5), (2.5, 3.5), stroke: 1.5pt + red)
      
      // Điểm tương đương
      circle((2.5, 2), radius: 0.08, fill: blue)
      content((1.0, 2), text(size: 8pt, fill: blue)[Điểm tương đương])
      line((2.5, 2), (2.5, 0), stroke: (dash: "dashed", paint: blue))
    })
  ]
  ```,
  [
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((0,0), (6,0), name: "x", mark: (end: ">", fill: black))
        line((0,0), (0,4), name: "y", mark: (end: ">", fill: black))
        content((6.2, -0.2), text(size: 9pt)[V (mL)])
        content((-0.2, 4.2), text(size: 9pt)[pH])
        bezier((0, 0.5), (5, 3.5), (2.5, 0.5), (2.5, 3.5), stroke: 1.5pt + red)
        circle((2.5, 2), radius: 0.08, fill: blue)
        content((1.0, 2), text(size: 8pt, fill: blue)[Điểm tương đương])
        line((2.5, 2), (2.5, 0), stroke: (dash: "dashed", paint: blue))
      })
    ]
  ]
)

== 9. Sơ đồ Công nghiệp sản xuất $H_2"SO"_4$ (Hóa 11)
Sử dụng gói `fletcher` để vẽ Sơ đồ khối (Flowchart) mô tả các công đoạn sản xuất trong công nghiệp - dạng hình đặc trưng nhất của SGK Hóa học phổ thông.

#vidu(
  ```typst
  #align(center)[
    #diagram(
      node-stroke: 1pt, node-fill: rgb("#e2e8f0"), node-corner-radius: 2pt,
      node((0,0), ce("S / FeS2"), width: 1.8cm, name: <n1>),
      node((2,0), ce("SO2"), width: 1.5cm, name: <n2>),
      node((4,0), ce("SO3"), width: 1.5cm, name: <n3>),
      node((6,0), ce("H2SO4"), width: 1.5cm, name: <n4>),
      
      edge(<n1>, <n2>, "->", label: text(size: 8pt, ce("+ O2, t^o"))),
      edge(<n2>, <n3>, "->", label: text(size: 8pt, ce("+ O2, V2O5, t^o"))),
      edge(<n3>, <n4>, "->", label: text(size: 8pt, ce("+ H2O")))
    )
  ]
  ```,
  [
    #align(center)[
      #diagram(
        node-stroke: 1pt, node-fill: rgb("#e2e8f0"), node-corner-radius: 2pt,
        node((0,0), ce("S / FeS2"), width: 1.8cm, name: <n1>),
        node((2,0), ce("SO2"), width: 1.5cm, name: <n2>),
        node((4,0), ce("SO3"), width: 1.5cm, name: <n3>),
        node((6,0), ce("H2SO4"), width: 1.5cm, name: <n4>),
        
        edge(<n1>, <n2>, "->", label: text(size: 8pt, ce("+ O2, t^o"))),
        edge(<n2>, <n3>, "->", label: text(size: 8pt, ce("+ O2, V2O5, t^o"))),
        edge(<n3>, <n4>, "->", label: text(size: 8pt, ce("+ H2O")))
      )
    ]
  ]
)

== 10. Cấu trúc mạch vòng Carbohydrate & Peptide (Hóa 12)
Sử dụng `typed-smiles` để vẽ công thức mạch vòng Haworth của $alpha$-Glucose, Fructose hoặc các chuỗi Peptide - những hình ảnh kinh điển trong Hóa 12.

#vidu(
  ```typst
  *Cấu tạo dạng vòng của $alpha$-Glucose:*
  #align(center)[
    #smiles("OC[C@H]1OC(O)[C@H](O)[C@@H](O)[C@@H]1O", scale: 1.2)
  ]
  
  *Chuỗi Peptide (Gly-Ala) với liên kết peptide được highlight:*
  #align(center)[
    #smiles("NCC(=O)N[C@@H](C)C(=O)O", 
      highlight((bond(3, 4),), fill: rgb(255, 0, 0, 100)), 
      scale: 1.0
    )
  ]
  ```,
  [
    *Cấu tạo dạng vòng của $alpha$-Glucose:* \
    #align(center)[
      #smiles("OC[C@H]1OC(O)[C@H](O)[C@@H](O)[C@@H]1O", scale: 1.2)
    ]
    #v(0.5em)
    *Chuỗi Peptide (Gly-Ala) với liên kết peptide được highlight:* \
    #align(center)[
      #smiles("NCC(=O)N[C@@H](C)C(=O)O", 
        highlight((bond(3, 4),), fill: rgb(255, 0, 0, 100)), 
        scale: 1.0
      )
    ]
  ]
)
