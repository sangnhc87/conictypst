#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Ứng Dụng Của Hệ Phương Trình Bậc Nhất Ba Ẩn],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 1],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#1d4ed8"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI HỌC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: CÂN BẰNG PHƯƠNG TRÌNH HÓA HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-hoa-hoc", "🧪", [I. Ứng Dụng Trong Hoá Học: Cân Bằng Phản Ứng])

#lt-slide-back(title: "🧪 Nguyên tắc chung trong cân bằng Hóa Học")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Định luật Bảo Toàn Nguyên Tố")[
        Trong một phản ứng hóa học, số nguyên tử của mỗi nguyên tố ở hai vế (trước và sau phản ứng) luôn luôn *bằng nhau*.
        $ sum text("Nguyên tử (Trái)") = sum text("Nguyên tử (Phải)") $
        - *Cách làm:*
          + Đặt các ẩn số $x, y, z, t, ...$ làm hệ số của các chất.
          + Lập phương trình cân bằng cho từng nguyên tố.
          + Thu được hệ phương trình bậc nhất nhiều ẩn (thường là hệ thuần nhất).
          + Chọn một ẩn tự do để các ẩn còn lại là *số nguyên dương nhỏ nhất*.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[Ví dụ: Đốt quặng Pyrit Sắt]\
        #v(0.15em)
        #text(size: 8.5pt)[
          $ x"FeS"_2 + y"O"_2 -> z"Fe"_2"O"_3 + t"SO"_2 $
          - Bảo toàn Fe: $x = 2z$
          - Bảo toàn S: $2x = t$
          - Bảo toàn O: $2y = 3z + 2t$
          Giải hệ này bằng cách chọn ẩn tự do $z = 2$ (để hệ số là số nguyên nhỏ nhất), ta được: $x=4, y=11, z=2, t=8$.
          $ => 4"FeS"_2 + 11"O"_2 -> 2"Fe"_2"O"_3 + 8"SO"_2 $
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ỨNG DỤNG TRONG VẬT LÝ
// ════════════════════════════════════════════════
#lt-section-link("sec-vat-ly", "⚙️", [II. Ứng Dụng Trong Vật Lý: Cân Bằng Lực & Mạch Điện])

#lt-slide-back(title: "⚙️ Phân Tích Lực Hệ Cơ Học")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Cân Bằng Chất Điểm")[
        Một vật ở trạng thái cân bằng (đứng yên hoặc chuyển động thẳng đều) khi tổng các lực tác dụng lên vật bằng 0.
        $ sum vec(F) = vec(F)_1 + vec(F)_2 + ... + vec(F)_n = vec(0) $
        - *Cách làm:*
          + Vẽ sơ đồ phân tích lực (trọng lực, phản lực, lực ma sát, lực căng dây).
          + Chọn hệ trục tọa độ $O x y$.
          + Chiếu phương trình vectơ lên các trục $O x$ và $O y$.
          + Thu được hệ phương trình bậc nhất hai hoặc ba ẩn.
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 9pt, radius: 7pt)[
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            line((-2, 1.5), (2, 1.5), stroke: 1.5pt)
            line((-1.2, 1.5), (0, 0), stroke: 1pt + rgb("1d4ed8"))
            line((1.2, 1.5), (0, 0), stroke: 1pt + rgb("1d4ed8"))
            line((0, 0), (0, -1.0), stroke: 1.2pt + rgb("dc2626"), mark: (end: "stealth"))
            circle((0, 0), radius: 4pt, fill: rgb("1e293b"))
            content((0.4, -0.6), text(size: 7.5pt)[$vec(P)$])
            content((-0.8, 0.7), text(size: 7.5pt, fill: rgb("1d4ed8"))[$vec(T)_1$])
            content((0.8, 0.7), text(size: 7.5pt, fill: rgb("1d4ed8"))[$vec(T)_2$])
          })
        ]
        #text(size: 8.5pt)[
          *Ví dụ:* Trọng lực $vec(P)$ được cân bằng bởi hai lực căng dây $vec(T)_1$ và $vec(T)_2$. Chiếu lên phương dọc và ngang tạo ra hệ phương trình.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Trắc nghiệm Ứng dụng])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 1 BÀI 3],
  questions: (
    ( type: "TN", desc: [Bảo toàn nguyên tố Fe trong đốt Pyrit]),
    ( type: "TN", desc: [Hệ phương trình bảo toàn S và O]),
    ( type: "TN", desc: [Hệ số tối giản phương trình Pyrit]),
    ( type: "TN", desc: [Cân bằng phương trình Đồng + HNO3]),
    ( type: "TN", desc: [Cân bằng lực trên mặt phẳng nghiêng]),
    ( type: "TN", desc: [Cân bằng phản ứng Oxi hóa - Khử KMnO4]),
    ( type: "TN", desc: [Lực căng sợi dây treo vật cầu]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Để cân bằng phản ứng hóa học đốt cháy quặng Pyrit sắt:
$ x"FeS"_2 + y"O"_2 -> z"Fe"_2"O"_3 + t"SO"_2 $
Phương trình đại số bảo toàn nguyên tố Sắt (Fe) theo các hệ số $x, y, z, t$ là],
    (
        [$x - 2z = 0$],
        [$x - z = 0$],
        [$2x - z = 0$],
        [$x + 2z = 0$]
    ),
    correct: 1,
    loigiai: [
        Bảo toàn nguyên tố Fe ở hai vế:
        - Vế trái: $x$ nguyên tử Fe trong $x"FeS"_2$.
        - Vế phải: $2z$ nguyên tử Fe trong $z"Fe"_2"O"_3$.
        $ x = 2z <=> x - 2z = 0 $
    ]
)

#lt-tn(num: 2, [Cũng trong phản ứng đốt quặng Pyrit sắt:
$ x"FeS"_2 + y"O"_2 -> z"Fe"_2"O"_3 + t"SO"_2 $
Hệ phương trình bảo toàn nguyên tố Lưu huỳnh S và Oxi O lần lượt là],
    (
        [$cases(2x - t = 0, 2y - 3z - 2t = 0)$],
        [$cases(x - 2t = 0, y - 3z - t = 0)$],
        [$cases(2x + t = 0, 2y + 3z + 2t = 0)$],
        [$cases(x - t = 0, 2y - 3z = 0)$]
    ),
    correct: 1,
    loigiai: [
        Bảo toàn từng nguyên tố:
        - Bảo toàn Lưu huỳnh (S): $2x = t <=> 2x - t = 0$.
        - Bảo toàn Oxi (O): $2y = 3z + 2t <=> 2y - 3z - 2t = 0$.
        Vậy hệ phương trình là $cases(2x - t = 0, 2y - 3z - 2t = 0)$.
    ]
)

#lt-tn(num: 3, [Bộ hệ số nguyên dương tối giản $(x; y; z; t)$ để cân bằng phản ứng đốt quặng Pyrit sắt ở Câu 1 và 2 là],
    (
        [$(2; 5; 1; 4)$],
        [$(4; 11; 2; 8)$],
        [$(4; 10; 2; 8)$],
        [$(8; 22; 4; 16)$]
    ),
    correct: 2,
    loigiai: [
        Từ các phương trình bảo toàn:
        - $x = 2z$.
        - $t = 2x = 2(2z) = 4z$.
        - $2y = 3z + 2t = 3z + 2(4z) = 11z => y = 11/2 z$.
        Để $y$ là số nguyên dương thì $z$ phải chia hết cho 2. Chọn $z = 2$ (nguyên dương nhỏ nhất):
        $x = 4, y = 11, t = 8$.
        Vậy bộ hệ số là $(4; 11; 2; 8)$.
    ]
)

#lt-tn(num: 4, [Cân bằng phản ứng oxi hóa - khử giữa Đồng kim loại và Axit nitric đặc nóng:
$ x"Cu" + y"HNO"_3 -> z"Cu"("NO"_3)_2 + t"NO"_2 + u"H"_2"O" $
Hệ số tối giản của $y$ trước phân tử $"HNO"_3$ bằng],
    (
        [$2$],
        [$6$],
        [$4$],
        [$8$]
    ),
    correct: 3,
    loigiai: [
        Lập các phương trình bảo toàn nguyên tố:
        - Cu: $x = z$.
        - H: $y = 2u => u = y/2$.
        - N: $y = 2z + t => t = y - 2z$.
        - O: $3y = 6z + 2t + u$.
        Thay $t$ và $u$ vào PT (O):
        $ 3y = 6z + 2(y - 2z) + y/2 => 3y = 2z + 5/2 y => 1/2 y = 2z => y = 4z $
        Chọn $z = 1 => y = 4$. Vậy phương trình là $"Cu" + 4"HNO"_3 -> "Cu"("NO"_3)_2 + 2"NO"_2 + 2"H"_2"O"$.
    ]
)

#lt-tn(num: 5, [Một vật có khối lượng $m = 10" kg"$ được giữ cân bằng trên mặt phẳng nghiêng góc $alpha = 30^degree$ nhờ một lực kéo $vec(F)$ song song với mặt phẳng nghiêng. Lấy gia tốc trọng trường $g = 9.8" m/s"^2$, bỏ qua ma sát. Độ lớn của lực kéo $vec(F)$ là],
    (
        [$98" N"$],
        [$84.87" N"$],
        [$49" N"$],
        [$24.5" N"$]
    ),
    correct: 3,
    loigiai: [
        Chiếu phương trình định luật II Newton ($vec(F) + vec(P) + vec(N) = vec(0)$) lên phương song song với mặt phẳng nghiêng:
        $ F - P sin alpha = 0 => F = m g sin(30^degree) $
        Thay số: $F = 10 times 9.8 times 1/2 = 49" N"$.
    ]
)

#lt-tn(num: 6, [Cân bằng phản ứng oxi hóa - khử nổi tiếng của thuốc tím $"KMnO"_4$ trong môi trường axit:
$ x"KMnO"_4 + y"FeSO"_4 + z"H"_2"SO"_4 -> t"K"_2"SO"_4 + u"MnSO"_4 + v"Fe"_2("SO"_4)_3 + w"H"_2"O" $
Tỉ lệ giữa hệ số của $"FeSO"_4$ và $"KMnO"_4$ trong phương trình cân bằng là],
    (
        [$y/x = 2$],
        [$y/x = 3$],
        [$y/x = 10$],
        [$y/x = 5$]
    ),
    correct: 4,
    loigiai: [
        Bảo toàn electron:
        - Quá trình khử: $"Mn"^(+7) + 5e -> "Mn"^(+2)$ (nhận 5e).
        - Quá trình oxi hóa: $"Fe"^(+2) -> "Fe"^(+3) + 1e$ (nhường 1e).
        Để tổng số e nhường bằng tổng số e nhận:
        $ 1 times y = 5 times x => y/x = 5 $
        Phương trình hoàn chỉnh:
        $ 2"KMnO"_4 + 10"FeSO"_4 + 8"H"_2"SO"_4 -> "K"_2"SO"_4 + 2"MnSO"_4 + 5"Fe"_2("SO"_4)_3 + 8"H"_2"O" $.
    ]
)

#lt-tn(num: 7, [Một quả cầu kim loại có khối lượng $m = 2" kg"$ được treo vào trần nhà bằng hai sợi dây nhẹ không dãn hợp với phương thẳng đứng các góc $alpha = 45^degree$ và $beta = 45^degree$. Lấy $g = 9.8" m/s"^2$. Lực căng của mỗi sợi dây bằng],
    (
        [$9.8 sqrt(2)" N"$],
        [$19.6" N"$],
        [$9.8" N"$],
        [$19.6 sqrt(2)" N"$]
    ),
    correct: 1,
    loigiai: [
        Do tính chất đối xứng, lực căng của hai sợi dây bằng nhau: $T_1 = T_2 = T$.
        Chiếu hệ lực $vec(P) + vec(T)_1 + vec(T)_2 = vec(0)$ lên phương thẳng đứng:
        $ 2 T cos(45^degree) = P = m g $
        $ => 2 T times (sqrt(2))/2 = 2 times 9.8 => T sqrt(2) = 19.6 => T = 19.6 / sqrt(2) = 9.8 sqrt(2)" N" $
    ]
)
