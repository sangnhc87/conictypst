#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Lập luận logic (hiệp sĩ – kẻ nói dối – suy luận loại trừ)", mau: C1)

#phuong-phap(mau: C1)[
  - *Bước 1.* Viết rõ luật: ai luôn nói thật, ai luôn nói dối, có được nói cả hai không; có đúng $k$ câu đúng hay không.
  - *Bước 2.* Chọn một giả thiết then chốt (vai trò của một người, hoặc “ai là thủ phạm”).
  - *Bước 3.* Lập *bảng giả thiết*: mỗi hàng một khả năng, đánh *Đúng/Sai* từng lời nói, đếm số câu đúng, loại hàng mâu thuẫn.
  - *Bước 4.* Kiểm tra lại phương án còn lại với *toàn bộ* giả thiết của đề.
  - *Phân loại mức độ trong đề này:*
    #align(center)[
      #table(
        columns: (1.3fr, 2.2fr, 1.2fr),
        align: (center + horizon, left + horizon, center + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Nhóm*], [*Dạng lập luận*], [*Mức*],
        [Tự luận 1; TN 1–2; DS 1; TLN 1], [Mệnh đề kéo theo, 2 người thật/dối], [NB],
        [Tự luận 2; TN 3–4; DS 2; TLN 2–3], [Nhãn hộp, đúng $k$ câu, đếm hiệp sĩ], [TH],
        [Tự luận 3; TN 5–6; DS 3; TLN 4–5], [Ba khả năng loại trừ, gián điệp], [VD],
        [Tự luận 4; TN 7–8; DS 4; TLN 6], [Lồng vai trò hoặc 4 người / tự tham chiếu], [VDC],
      )
    ]
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(
    1,
    [*(NB)* Trên đảo, mỗi người hoặc là *hiệp sĩ* (luôn nói thật) hoặc là *kẻ bất lương* (luôn nói dối). $A$ nói: “Cả hai chúng tôi đều là kẻ bất lương.” $B$ không nói gì. Hỏi $A, B$ mỗi người thuộc loại nào?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      #align(center)[
        #table(
          columns: (1.6fr, 2.2fr, 2.2fr),
          align: (center + horizon, left + horizon, left + horizon),
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Giả thiết $A$*], [*Câu nói của $A$*], [*Kết luận*],
          [Hiệp sĩ], [Phải đúng $=>$ cả hai đều bất lương.], [Mâu thuẫn (hiệp sĩ không thể là kẻ bất lương)],
          [*Kẻ bất lương*], [Câu nói sai $=>$ không phải cả hai đều bất lương.], [*Vậy $B$ là hiệp sĩ. Thỏa mãn*],
        )
      ]
      Vậy *$A$ là kẻ bất lương*, *$B$ là hiệp sĩ*.
    ],
  )

  #bt-item(
    2,
    [*(TH)* Có ba hộp $A, B, C$; đúng một hộp có quà, hai hộp còn lại rỗng. Nhãn trên cả ba hộp *đều sai*:
      - Hộp $A$: “Quà ở hộp $B$.”
      - Hộp $B$: “Quà ở hộp $B$.”
      - Hộp $C$: “Quà ở hộp $A$.”
      Hỏi quà ở hộp nào?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      Vì mọi nhãn đều sai nên quà không ở $B$ (theo nhãn $A$ và $B$) và không ở $A$ (theo nhãn $C$). Do đó quà ở hộp $C$.
      #align(center)[
        #table(
          columns: (1.4fr, 1.3fr, 1.3fr, 1.3fr, 1.8fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Giả sử quà ở*], [*Nhãn $A$*], [*Nhãn $B$*], [*Nhãn $C$*], [*Cả ba nhãn sai?*],
          [Hộp $A$], [Sai], [Sai], [Đúng], [Không (loại)],
          [Hộp $B$], [Đúng], [Đúng], [Sai], [Không (loại)],
          [*Hộp $C$*], [*Sai*], [*Sai*], [*Sai*], [*Có (thỏa)*],
        )
      ]
      Vậy quà ở hộp *$C$*.
    ],
  )

  #bt-item(
    3,
    [*(VD)* Ba người $A, B, C$: một hiệp sĩ (luôn thật), một kẻ bất lương (luôn dối), một gián điệp (thật hoặc dối).
      - $A$: “Tôi không phải gián điệp.”
      - $B$: “$A$ là kẻ bất lương.”
      - $C$: “$B$ là gián điệp.”
      Hỏi ai là gián điệp?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      #align(center)[
        #table(
          columns: (1.3fr, 2.4fr, 2.3fr),
          align: (center + horizon, left + horizon, left + horizon),
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Vai trò $A$*], [*Hệ quả*], [*Đánh giá*],
          [Hiệp sĩ],
          [$A$ không phải gián điệp. $B$ nói “$A$ bất lương” là sai $=>$ $B$ không phải hiệp sĩ. Nếu $B$ bất lương thì $C$ là gián điệp; câu “$B$ là gián điệp” của $C$ sai, gián điệp được nói dối.],
          [*Thỏa: $A$ hiệp sĩ, $B$ bất lương, $C$ gián điệp*],

          [Kẻ bất lương], [Câu “Tôi không phải gián điệp” sai $=>$ $A$ vừa bất lương vừa gián điệp.], [Mâu thuẫn],
          [Gián điệp],
          [Câu của $A$ sai (hợp lệ). Khi đó $B, C$ là hiệp sĩ và bất lương. $B$ nói “$A$ bất lương” sai nên $B$ không phải hiệp sĩ $=>$ $B$ bất lương, $C$ hiệp sĩ. Nhưng $C$ nói “$B$ là gián điệp” sai, hiệp sĩ không được nói sai.],
          [Mâu thuẫn],
        )
      ]
      Vậy gián điệp là *$C$*.
    ],
  )

  #bt-item(
    4,
    [*(VDC)* Bốn bạn $A, B, C, D$; đúng một bạn lấy mất thước. Đúng *một* bạn nói dối, ba bạn kia nói thật.
      - $A$: “$B$ lấy thước.”
      - $B$: “$D$ lấy thước.”
      - $C$: “Tôi không lấy thước.”
      - $D$: “$B$ đang nói dối.”
      Hỏi ai lấy thước?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      #align(center)[
        #table(
          columns: (1.4fr, 2.6fr, 2fr),
          align: (center + horizon, left + horizon, left + horizon),
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Người nói dối*], [*Hệ quả nếu ba người kia thật*], [*Đánh giá*],
          [$A$ dối],
          [$B$ thật $=>$ $D$ lấy thước; $D$ thật $=>$ $B$ dối. Không thể vừa $B$ thật vừa $B$ dối.],
          [Mâu thuẫn],

          [*$B$ dối*],
          [$A$ thật $=>$ $B$ lấy thước; $C$ thật $=>$ $C$ không lấy; $D$ thật $=>$ $B$ dối (đúng giả thiết).],
          [*Thỏa mãn*],

          [$C$ dối],
          [Câu “Tôi không lấy” sai $=>$ $C$ lấy thước, đồng thời $A$ thật $=>$ $B$ lấy thước.],
          [Hai thủ phạm (mâu thuẫn)],

          [$D$ dối], [$A$ thật $=>$ $B$ lấy; $B$ thật $=>$ $D$ lấy.], [Hai thủ phạm (mâu thuẫn)],
        )
      ]
      Vậy người lấy thước là *$B$* (và $B$ là người duy nhất nói dối).
    ],
  )
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)],
  count: 8,
  reset-counter: true,
)

#tn(
  dir: "ngang",
  [*(NB)* Cho mệnh đề $P$ sai và mệnh đề $Q$ đúng. Khẳng định nào sau đây đúng?],
  (
    [Mệnh đề $P => Q$ sai.],
    [Mệnh đề $Q => P$ đúng.],
    True([Mệnh đề $P => Q$ đúng.]),
    [Mệnh đề $P <=> Q$ đúng.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    $P => Q$ chỉ sai khi $P$ đúng và $Q$ sai. Ở đây $P$ sai nên $P => Q$ đúng. Còn $Q => P$ là đúng $=>$ sai nên sai; $P <=> Q$ cũng sai.

    ✅ *Chọn đáp án C.*
  ],
)

#tn(
  dir: "ngang",
  [*(NB)* Mỗi người là hiệp sĩ (luôn thật) hoặc kẻ bất lương (luôn dối). $A$ nói: “$B$ là hiệp sĩ.” $B$ nói: “$A$ và tôi khác loại.” Kết luận nào đúng?],
  (
    [$A$ là hiệp sĩ, $B$ là kẻ bất lương.],
    [$A$ là kẻ bất lương, $B$ là hiệp sĩ.],
    [Cả hai đều là hiệp sĩ.],
    True([Cả hai đều là kẻ bất lương.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.6fr, 2.2fr, 2.2fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Giả thiết $A$*], [*Hệ quả*], [*Đánh giá*],
        [Hiệp sĩ],
        [$B$ là hiệp sĩ. Khi đó hai người cùng loại nên câu của $B$ sai, hiệp sĩ không được nói sai.],
        [Mâu thuẫn],

        [*Kẻ bất lương*],
        [Câu “$B$ là hiệp sĩ” sai $=>$ $B$ cũng bất lương. Hai người cùng loại nên “khác loại” là sai, kẻ bất lương nói dối hợp lệ.],
        [*Thỏa mãn*],
      )
    ]

    ✅ *Chọn đáp án D.*
  ],
)

#tn(
  dir: "ngang",
  [*(TH)* Ba hộp $A, B, C$; đúng một hộp có quà. Đúng *một* nhãn đúng, hai nhãn kia sai.
    - $A$: “Quà ở hộp $A$.”
    - $B$: “Quà ở hộp $A$.”
    - $C$: “Quà ở hộp $C$.”
    Quà ở hộp nào?],
  (
    [Hộp $A$.],
    [Hộp $B$.],
    True([Hộp $C$.]),
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.3fr, 1.2fr, 1.2fr, 1.2fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Quà ở*], [*Nhãn $A$*], [*Nhãn $B$*], [*Nhãn $C$*], [*Số nhãn đúng*],
        [Hộp $A$], [Đúng], [Đúng], [Sai], [2 (loại)],
        [Hộp $B$], [Sai], [Sai], [Sai], [0 (loại)],
        [*Hộp $C$*], [*Sai*], [*Sai*], [*Đúng*], [*1 (thỏa)*],
      )
    ]

    ✅ *Chọn đáp án C.*
  ],
)

#tn(
  dir: "ngang",
  [*(TH)* Ba bạn An, Bình, Chi có tuổi khác nhau. Đúng *hai* câu nói đúng.
    - An: “Tôi lớn tuổi nhất.”
    - Bình: “Chi lớn tuổi nhất.”
    - Chi: “An lớn tuổi nhất.”
    Ai lớn tuổi nhất?],
  (
    True([An.]),
    [Bình.],
    [Chi.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.5fr, 1.3fr, 1.3fr, 1.3fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Lớn nhất*], [*Lời An*], [*Lời Bình*], [*Lời Chi*], [*Số câu đúng*],
        [*An*], [*Đúng*], [*Sai*], [*Đúng*], [*2 (thỏa)*],
        [Bình], [Sai], [Sai], [Sai], [0 (loại)],
        [Chi], [Sai], [Đúng], [Sai], [1 (loại)],
      )
    ]

    ✅ *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Ba người $A, B, C$: một hiệp sĩ, một kẻ bất lương, một gián điệp (thật hoặc dối).
    - $A$: “$C$ là hiệp sĩ.”
    - $B$: “$A$ là gián điệp.”
    - $C$: “$B$ là kẻ bất lương.”
    Ai là gián điệp?],
  (
    True([$A$.]),
    [$B$.],
    [$C$.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Nếu $A$ là hiệp sĩ thì $C$ cũng là hiệp sĩ: mâu thuẫn (chỉ một hiệp sĩ). \
    Nếu $A$ là kẻ bất lương thì câu “$C$ là hiệp sĩ” sai, nên $C$ không phải hiệp sĩ. Suy ra $B$ là hiệp sĩ và $C$ là gián điệp. Hiệp sĩ $B$ nói “$A$ là gián điệp” nhưng $A$ đang là kẻ bất lương: mâu thuẫn. \
    Vậy $A$ là gián điệp. Khi đó $B$ là hiệp sĩ (câu “$A$ là gián điệp” đúng) và $C$ là kẻ bất lương (câu “$B$ là kẻ bất lương” sai).

    ✅ *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Đúng một bạn lấy bánh. Đúng *một* câu nói đúng.
    - An: “Tôi không lấy bánh.”
    - Bình: “An lấy bánh.”
    - Cường: “Bình không lấy bánh.”
    Ai lấy bánh?],
  (
    [An.],
    True([Bình.]),
    [Cường.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.5fr, 1.3fr, 1.3fr, 1.3fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người lấy bánh*], [*An*], [*Bình*], [*Cường*], [*Số câu đúng*],
        [An], [Sai], [Đúng], [Đúng], [2 (loại)],
        [*Bình*], [*Đúng*], [*Sai*], [*Sai*], [*1 (thỏa)*],
        [Cường], [Đúng], [Sai], [Đúng], [2 (loại)],
      )
    ]

    ✅ *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Mỗi người là hiệp sĩ hoặc kẻ bất lương (không biết số lượng mỗi loại).
    - $A$: “$B$ là kẻ bất lương.”
    - $B$: “$A$ và $C$ cùng loại.”
    - $C$: “$A$ là kẻ bất lương.”
    Có bao nhiêu kẻ bất lương?],
  (
    [0],
    [1],
    True([2]),
    [3],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Nếu $A$ là kẻ bất lương thì $B$ là hiệp sĩ, suy ra $A$ và $C$ cùng loại nên $C$ cũng bất lương. Khi đó câu của $C$ (“$A$ là kẻ bất lương”) lại đúng: kẻ bất lương không được nói thật. Mâu thuẫn. \
    Vậy $A$ là hiệp sĩ, nên $B$ là kẻ bất lương. Câu của $B$ sai nên $A$ và $C$ khác loại, tức $C$ là kẻ bất lương. Câu của $C$ sai (vì $A$ là hiệp sĩ), đúng với kẻ bất lương. \
    Có đúng $2$ kẻ bất lương ($B$ và $C$).

    ✅ *Chọn đáp án C.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Bốn phát biểu:
    - (1) “Trong bốn phát biểu này, đúng một phát biểu đúng.”
    - (2) “Trong bốn phát biểu này, đúng hai phát biểu đúng.”
    - (3) “Trong bốn phát biểu này, đúng ba phát biểu đúng.”
    - (4) “Trong bốn phát biểu này, cả bốn phát biểu đều đúng.”
    Khẳng định nào sau đây đúng?],
  (
    True([Chỉ phát biểu (1) đúng.]),
    [Chỉ phát biểu (2) đúng.],
    [Chỉ phát biểu (3) đúng.],
    [Cả bốn phát biểu đều sai.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Bốn phát biểu loại trừ lẫn nhau: không thể có hai phát biểu cùng đúng. \
    Nếu (2) đúng thì số phát biểu đúng phải bằng $2$, nhưng khi đó chỉ có đúng một phát biểu (chính là (2)) được chọn: mâu thuẫn. Tương tự (3) và (4) đều mâu thuẫn. \
    Nếu (1) đúng và (2), (3), (4) sai thì đúng một phát biểu đúng: thỏa mãn.

    ✅ *Chọn đáp án A.*
  ],
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)],
  count: 4,
  reset-counter: true,
)

#ds(
  [*(NB)* Cho $P$ đúng và $Q$ sai. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Mệnh đề $P => Q$ sai.]),
    True([Mệnh đề $Q => P$ đúng.]),
    [Mệnh đề $P <=> Q$ đúng.],
    True([Mệnh đề đảo của $P => Q$ là $Q => P$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*: $P$ đúng, $Q$ sai là trường hợp duy nhất làm $P => Q$ sai.
    - b) *Đúng*: tiền đề $Q$ sai thì $Q => P$ đúng.
    - c) *Sai*: một đúng một sai thì không tương đương.
    - d) *Đúng*: theo định nghĩa mệnh đề đảo.
  ],
)

#ds(
  [*(TH)* An luôn nói thật, Bình luôn nói dối. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Câu “An nói dối” là câu sai.]),
    True([Bình có thể nói: “An nói dối.”]),
    [An có thể nói: “Bình nói thật.”],
    True([Mệnh đề “An nói thật và Bình nói dối” là mệnh đề đúng.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*: An luôn nói thật nên “An nói dối” sai.
    - b) *Đúng*: “An nói dối” là câu sai, Bình luôn nói dối nên có thể nói câu đó.
    - c) *Sai*: “Bình nói thật” là câu sai, An không nói sai.
    - d) *Đúng*: đúng theo giả thiết.
  ],
)

#ds(
  [*(VD)* Một bình hoa bị vỡ, đúng một bạn làm vỡ. Đúng *hai* câu nói đúng.
    - An: “Bình làm vỡ.”
    - Bình: “Cường làm vỡ.”
    - Cường: “Bình nói dối.”
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Bình là người làm vỡ bình hoa.]),
    True([An nói đúng.]),
    True([Cường nói đúng.]),
    [An là người làm vỡ bình hoa.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người làm vỡ*], [*An*], [*Bình*], [*Cường*], [*Số câu đúng*],
        [An], [Sai], [Sai], [Đúng], [1 (loại)],
        [*Bình*], [*Đúng*], [*Sai*], [*Đúng*], [*2 (thỏa)*],
        [Cường], [Sai], [Đúng], [Sai], [1 (loại)],
      )
    ]
    - a) *Đúng*, b) *Đúng*, c) *Đúng*, d) *Sai*.
  ],
)

#ds(
  [*(VDC)* Ba đội $X, Y, Z$ xếp hạng nhất, nhì, ba (không hòa). Đúng *một* câu nói đúng.
    - $X$: “$Y$ nhất.”
    - $Y$: “$Z$ nhất.”
    - $Z$: “$Y$ nhất.”
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([$Z$ là đội nhất.]),
    [$X$ là đội nhất.],
    True([$Y$ nói đúng.]),
    [$X$ và $Z$ cùng nói đúng.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.3fr, 1.3fr, 1.3fr, 1.3fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Đội nhất*], [*Lời $X$*], [*Lời $Y$*], [*Lời $Z$*], [*Số câu đúng*],
        [$X$], [Sai], [Sai], [Sai], [0 (loại)],
        [$Y$], [Đúng], [Sai], [Đúng], [2 (loại)],
        [*$Z$*], [*Sai*], [*Đúng*], [*Sai*], [*1 (thỏa)*],
      )
    ]
    - a) *Đúng*, b) *Sai*, c) *Đúng*, d) *Sai*.
  ],
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [*(NB)* Mỗi người là hiệp sĩ hoặc kẻ bất lương. $A$ nói: “Cả hai chúng tôi đều là kẻ bất lương.” $B$ không nói gì. Hỏi ai là hiệp sĩ? (Trả lời $A$ hoặc $B$)],
  [B],
  loigiai: [
    📌 *Phương pháp:* Giả sử vai trò của $A$, tìm mâu thuẫn.

    ✍️ *Lời giải chi tiết:* \
    Hiệp sĩ không thể nói “cả hai đều bất lương”. Vậy $A$ là kẻ bất lương, câu nói sai, nên $B$ không phải kẻ bất lương. Do đó $B$ là hiệp sĩ.

    ✅ *Đáp số:* $B$.
  ],
)

#tln(
  dir: "ngang",
  [*(TH)* Đúng một bạn lấy bút. Đúng *hai* câu nói đúng.
    - An: “Cường lấy bút.”
    - Bình: “Tôi không lấy bút.”
    - Cường: “Bình lấy bút.”
    Hỏi ai lấy bút?],
  [Cường],
  loigiai: [
    📌 *Phương pháp:* Lập bảng theo từng thủ phạm.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.5fr, 1.3fr, 1.3fr, 1.3fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người lấy bút*], [*An*], [*Bình*], [*Cường*], [*Số câu đúng*],
        [An], [Sai], [Đúng], [Sai], [1 (loại)],
        [Bình], [Sai], [Sai], [Đúng], [1 (loại)],
        [*Cường*], [*Đúng*], [*Đúng*], [*Sai*], [*2 (thỏa)*],
      )
    ]

    ✅ *Đáp số:* Cường.
  ],
)

#tln(
  dir: "ngang",
  [*(TH)* Mỗi người là hiệp sĩ hoặc kẻ bất lương.
    - $A$: “$B$ là kẻ bất lương.”
    - $B$: “$C$ là kẻ bất lương.”
    - $C$: “$A$ và $B$ đều là kẻ bất lương.”
    Hỏi có bao nhiêu hiệp sĩ?],
  [1],
  loigiai: [
    📌 *Phương pháp:* Loại trường hợp $C$ là hiệp sĩ, rồi suy ra vai trò còn lại.

    ✍️ *Lời giải chi tiết:* \
    Nếu $C$ là hiệp sĩ thì $A, B$ đều bất lương. Khi đó câu của $A$ (“$B$ bất lương”) đúng: mâu thuẫn. \
    Vậy $C$ bất lương, nên không phải cả $A$ và $B$ đều bất lương. \
    Nếu $A$ là hiệp sĩ thì $B$ bất lương, suy ra câu của $B$ sai nên $C$ là hiệp sĩ: mâu thuẫn với $C$ bất lương. \
    Do đó $A$ bất lương và $B$ là hiệp sĩ. Chỉ có $1$ hiệp sĩ.

    ✅ *Đáp số:* $1$.
  ],
)

#tln(
  dir: "ngang",
  [*(VD)* Đúng một bạn làm bài. Đúng *hai* câu nói đúng.
    - Nam: “Minh làm bài.”
    - Minh: “Tôi không làm bài.”
    - Long: “Minh làm bài.”
    Hỏi ai làm bài?],
  [Minh],
  loigiai: [
    📌 *Phương pháp:* Lập bảng ba khả năng.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.5fr, 1.3fr, 1.3fr, 1.3fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người làm bài*], [*Nam*], [*Minh*], [*Long*], [*Số câu đúng*],
        [Nam], [Sai], [Đúng], [Sai], [1 (loại)],
        [*Minh*], [*Đúng*], [*Sai*], [*Đúng*], [*2 (thỏa)*],
        [Long], [Sai], [Đúng], [Sai], [1 (loại)],
      )
    ]

    ✅ *Đáp số:* Minh.
  ],
)

#tln(
  dir: "ngang",
  [*(VD)* Ba bạn tranh giải nhất. Đúng *hai* câu nói đúng.
    - An: “Tôi không nhất.”
    - Bình: “An không nhất.”
    - Cường: “Tôi nhất.”
    Hỏi ai nhất?],
  [Bình],
  loigiai: [
    📌 *Phương pháp:* Lập bảng theo người nhất.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.4fr, 1.3fr, 1.3fr, 1.3fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người nhất*], [*An*], [*Bình*], [*Cường*], [*Số câu đúng*],
        [An], [Sai], [Sai], [Sai], [0 (loại)],
        [*Bình*], [*Đúng*], [*Đúng*], [*Sai*], [*2 (thỏa)*],
        [Cường], [Đúng], [Đúng], [Đúng], [3 (loại)],
      )
    ]
    Chỉ trường hợp *Bình nhất* có đúng $2$ câu đúng.

    ✅ *Đáp số:* Bình.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Bốn bạn $A, B, C, D$; đúng một bạn làm vỡ cửa kính. Đúng *hai* bạn nói thật, hai bạn nói dối.
    - $A$: “$C$ làm vỡ.”
    - $B$: “Tôi không làm vỡ.”
    - $C$: “$D$ làm vỡ.”
    - $D$: “$C$ đang nói thật.”
    Hỏi ai làm vỡ cửa kính? (Trả lời $A$, $B$, $C$ hoặc $D$)],
  [C],
  loigiai: [
    📌 *Phương pháp:* Giả sử lần lượt từng bạn làm vỡ, đếm số câu đúng.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.4fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người làm vỡ*], [*Lời $A$*], [*Lời $B$*], [*Lời $C$*], [*Lời $D$*], [*Số câu đúng*],
        [$A$], [Sai], [Đúng], [Sai], [Sai], [1 (loại)],
        [$B$], [Sai], [Sai], [Sai], [Sai], [0 (loại)],
        [*$C$*], [*Đúng*], [*Đúng*], [*Sai*], [*Sai*], [*2 (thỏa)*],
        [$D$], [Sai], [Đúng], [Đúng], [Đúng], [3 (loại)],
      )
    ]
    Chỉ trường hợp *$C$ làm vỡ* có đúng $2$ câu đúng.

    ✅ *Đáp số:* $C$.
  ],
)
