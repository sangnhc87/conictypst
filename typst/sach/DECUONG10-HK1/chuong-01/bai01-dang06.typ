#import "../preamble-loigiai.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Bài toán lập luận logic nâng cao", mau: C1)

#phuong-phap(mau: C1)[
  Học sinh lớp 10 mới làm quen với logic thường thấy bối rối vì có quá nhiều thông tin "thật - giả" lẫn lộn. Bí quyết để giải quyết bài toán này là sự *ngăn nắp trong tư duy* thông qua kỹ thuật **Chia tình huống và Nhận - Loại**.

  Quy trình tư duy siêu tốc gồm 3 bước:
  
  *Bước 1. Xác định "Biến số" (Cái cần tìm)*
  - Đề bài đang giấu cái gì? (Ai làm vỡ đồ, hộp nào có quà, ai là gián điệp,...).
  - Tìm "Điều kiện khóa" của đề (Ví dụ: "Chỉ có đúng 1 người nói thật", "Cả 3 nhãn đều sai"). Đây là chiếc chìa khóa để lát nữa ta dùng để Nhận/Loại.

  *Bước 2. Chạy thử các tình huống (Lập bảng)*
  - Đừng đoán mò! Hãy *giả sử* từng khả năng xảy ra (Tình huống 1, Tình huống 2,...).
  - Với mỗi tình huống, ta đối chiếu xem các câu nói (hoặc nhãn dán) trong đề bài đang là ĐÚNG hay SAI. Ghi chú rõ ràng (Đúng/Sai) vào bảng.
  
  *Bước 3. Nhận - Loại (Chốt đáp án)*
  - Đếm số lượng câu "Đúng" ở mỗi tình huống.
  - Mang đi so sánh với "Điều kiện khóa" ở Bước 1. 
  - Tình huống nào bị mâu thuẫn $=>$ **LOẠI**.
  - Tình huống nào khớp hoàn toàn $=>$ **NHẬN** (Đây chính là đáp án duy nhất).
  
  #luuy[
    - *Với bài toán vai trò (Hiệp sĩ, Kẻ bất lương, Gián điệp):* 
      + Hiệp sĩ: Luôn nói ĐÚNG.
      + Kẻ bất lương: Luôn nói SAI.
      + Gián điệp: Lúc ĐÚNG lúc SAI. 
      $=>$ *Mẹo:* Luôn bám vào nhân vật nào có câu nói khẳng định vai trò của người khác trước.
    - *Với bài toán xếp vị trí:* Đừng lập bảng ngay. Hãy vẽ ra các ô trống, điền các vị trí "cố định" (ví dụ: đứng đầu hàng) và ghép các "cặp dính liền" vào trước để loại trừ dần.
  ]
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(
    1,
    [*(VD)* Bốn bạn An, Bình, Chi, Dũng; đúng một bạn làm vỡ bình hoa. Có đúng hai bạn nói thật:
      - An: “Bình làm vỡ bình.”
      - Bình: “Chi làm vỡ bình.”
      - Chi: “Dũng làm vỡ bình.”
      - Dũng: “Bình làm vỡ bình.”
      Hỏi ai làm vỡ bình hoa?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      Xét lần lượt bốn khả năng và đếm số lời nói đúng:
      #align(center)[
        #table(
          columns: (1.45fr, 1fr, 1fr, 1fr, 1fr, 1.65fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Người làm vỡ*], [*An*], [*Bình*], [*Chi*], [*Dũng*], [*Số lời đúng*],
          [An], [Sai], [Sai], [Sai], [Sai], [0 (loại)],
          [*Bình*], [*Đúng*], [*Sai*], [*Sai*], [*Đúng*], [*2 (thỏa)*],
          [Chi], [Sai], [Đúng], [Sai], [Sai], [1 (loại)],
          [Dũng], [Sai], [Sai], [Đúng], [Sai], [1 (loại)],
        )
      ]
      Chỉ hàng “Bình làm vỡ” có đúng hai lời nói đúng. Vậy *Bình làm vỡ bình hoa*.
    ],
  )

  #bt-item(
    2,
    [*(VD)* Có ba hộp $A, B, C$, đúng một hộp chứa chìa khóa. Trên mỗi hộp có một nhãn, và đúng một nhãn đúng:
      - Hộp $A$: “Chìa khóa ở hộp $B$.”
      - Hộp $B$: “Chìa khóa ở hộp $C$.”
      - Hộp $C$: “Chìa khóa ở hộp $C$.”
      Hỏi chìa khóa ở hộp nào?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      #align(center)[
        #table(
          columns: (1.45fr, 1.15fr, 1.15fr, 1.15fr, 1.7fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Chìa khóa ở*], [*Nhãn $A$*], [*Nhãn $B$*], [*Nhãn $C$*], [*Số nhãn đúng*],
          [Hộp $A$], [Sai], [Sai], [Sai], [0 (loại)],
          [*Hộp $B$*], [*Đúng*], [*Sai*], [*Sai*], [*1 (thỏa)*],
          [Hộp $C$], [Sai], [Đúng], [Đúng], [2 (loại)],
        )
      ]
      Chỉ hàng “chìa khóa ở hộp $B$” có đúng một nhãn đúng. Vậy chìa khóa ở hộp *$B$*.
    ],
  )

  #bt-item(
    3,
    [*(VDC)* Trên đảo có ba người $A, B, C$: một hiệp sĩ luôn nói thật, một kẻ bất lương luôn nói dối và một gián điệp có thể nói thật hoặc dối.
      - $A$: “$B$ là hiệp sĩ.”
      - $B$: “$C$ là kẻ bất lương.”
      - $C$: “$A$ là hiệp sĩ.”
      Xác định vai trò của mỗi người.],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      Ta thử vai trò của $A$:
      #align(center)[
        #table(
          columns: (1.35fr, 3.35fr, 1.9fr),
          align: (center + horizon, left + horizon, left + horizon),
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Vai trò $A$*], [*Suy luận từ các lời nói*], [*Đánh giá*],
          [Hiệp sĩ], [Lời $A$ đúng nên $B$ là hiệp sĩ. Có hai hiệp sĩ.], [Mâu thuẫn],
          [Kẻ bất lương],
          [Lời $A$ sai nên $B$ không là hiệp sĩ. Nếu $B$ là gián điệp thì $C$ là hiệp sĩ, nhưng lời $C$ “$A$ là hiệp sĩ” sai. Nếu $B$ là kẻ bất lương thì trùng vai trò với $A$.],
          [Mâu thuẫn],

          [*Gián điệp*],
          [Lời $A$ có thể đúng. Khi $B$ là hiệp sĩ thì $C$ là kẻ bất lương; lời $B$ đúng và lời $C$ sai đều phù hợp.],
          [*Thỏa mãn*],
        )
      ]
      Vậy $A$ là *gián điệp*, $B$ là *hiệp sĩ*, $C$ là *kẻ bất lương*.
    ],
  )

  #bt-item(
    4,
    [*(VDC)* Bốn đội $A, B, C, D$ thi chạy và xếp hạng từ nhất đến tư, không có hai đội đồng hạng. Có đúng hai phát biểu đúng:
      - Đội $A$: “Đội $B$ xếp nhất.”
      - Đội $B$: “Đội $D$ không xếp nhất.”
      - Đội $C$: “Đội $A$ xếp nhất.”
      - Đội $D$: “Đội $B$ đang nói thật.”
      Hỏi đội nào xếp nhất?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      Chỉ cần xét đội xếp nhất vì bốn lời nói chỉ phụ thuộc dữ kiện này:
      #align(center)[
        #table(
          columns: (1.45fr, 1fr, 1fr, 1fr, 1fr, 1.65fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
          [*Đội xếp nhất*], [*Lời $A$*], [*Lời $B$*], [*Lời $C$*], [*Lời $D$*], [*Số lời đúng*],
          [$A$], [Sai], [Đúng], [Đúng], [Đúng], [3 (loại)],
          [$B$], [Đúng], [Đúng], [Sai], [Đúng], [3 (loại)],
          [$C$], [Sai], [Đúng], [Sai], [Đúng], [2 (thỏa)],
          [$D$], [Sai], [Sai], [Sai], [Sai], [0 (loại)],
        )
      ]
      Vậy đội *$C$ xếp nhất*.
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
  [*(VD)* Ba bạn An, Bình, Cường; đúng một bạn lấy quyển truyện. Có đúng hai lời nói đúng:
    - An: “Bình lấy truyện.”
    - Bình: “Cường không lấy truyện.”
    - Cường: “An không lấy truyện.”
    Ai lấy truyện?],
  (
    True([An.]),
    [Bình.],
    [Cường.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người lấy*], [*An*], [*Bình*], [*Cường*], [*Số đúng*],
        [*An*], [*Sai*], [*Đúng*], [*Đúng*], [*2*],
        [Bình], [Đúng], [Đúng], [Đúng], [3],
        [Cường], [Sai], [Sai], [Đúng], [1],
      )
    ]
    ✅ *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Ba hộp $A, B, C$, đúng một hộp có vé thưởng. Đúng một nhãn đúng:
    - $A$: “Vé ở $B$.”
    - $B$: “Vé ở $A$.”
    - $C$: “Vé ở $A$.”
    Vé ở hộp nào?],
  (
    [Hộp $A$.],
    True([Hộp $B$.]),
    [Hộp $C$.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.35fr, 1.2fr, 1.2fr, 1.2fr, 1.7fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Vé ở*], [*$A$*], [*$B$*], [*$C$*], [*Số nhãn đúng*],
        [Hộp $A$], [Sai], [Đúng], [Đúng], [2],
        [*Hộp $B$*], [*Đúng*], [*Sai*], [*Sai*], [*1*],
        [Hộp $C$], [Sai], [Sai], [Sai], [0],
      )
    ]
    Chỉ hàng “vé ở hộp $B$” có đúng một nhãn đúng.

    ✅ *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Có ba phong bì $A, B, C$, đúng một phong bì chứa thư mời. Mọi nhãn đều sai:
    - $A$: “Thư mời ở $B$.”
    - $B$: “Thư mời ở $C$.”
    - $C$: “Thư mời ở $B$.”
    Thư mời ở đâu?],
  (
    True([Phong bì $A$.]),
    [Phong bì $B$.],
    [Phong bì $C$.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì nhãn $A$ và $C$ đều sai, thư không ở $B$; nhãn $B$ sai nên thư không ở $C$. Vậy thư ở $A$. \
    Bảng kiểm tra: \
    #align(center)[
      #table(
        columns: (1.3fr, 1.15fr, 1.15fr, 1.15fr, 1.75fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Thư ở*], [*Nhãn $A$*], [*Nhãn $B$*], [*Nhãn $C$*], [*Mọi nhãn sai?*],
        [*$A$*], [*Sai*], [*Sai*], [*Sai*], [*Có*],
        [$B$], [Đúng], [Sai], [Đúng], [Không],
        [$C$], [Sai], [Đúng], [Sai], [Không],
      )
    ]
    ✅ *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Trên đảo có $A, B, C$: một hiệp sĩ, một kẻ bất lương, một gián điệp.
    - $A$: “$B$ là gián điệp.”
    - $B$: “$C$ là hiệp sĩ.”
    - $C$: “$A$ là kẻ bất lương.”
    Ai là gián điệp?],
  (
    [$A$.],
    True([$B$.]),
    [$C$.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.3fr, 3.2fr, 1.8fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Gián điệp*], [*Kiểm tra hai vai trò còn lại*], [*Đánh giá*],
        [$A$],
        [$B, C$ là hiệp sĩ và kẻ bất lương. Nếu $B$ hiệp sĩ thì $C$ hiệp sĩ, mâu thuẫn; nếu $C$ hiệp sĩ thì $A$ bất lương, mâu thuẫn vì $A$ là gián điệp.],
        [Loại],

        [*$B$*], [$A$ hiệp sĩ nói đúng “$B$ gián điệp”; $C$ bất lương nói sai “$A$ bất lương”.], [*Thỏa*],
        [$C$],
        [$A, B$ là hiệp sĩ và kẻ bất lương. Nếu $A$ hiệp sĩ thì $B$ gián điệp, mâu thuẫn; nếu $B$ hiệp sĩ thì $C$ hiệp sĩ, mâu thuẫn.],
        [Loại],
      )
    ]
    ✅ *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Bốn bạn $A, B, C, D$ ngồi một hàng từ trái sang phải. Biết $A$ không ngồi đầu hàng, $B$ ngồi ngay bên phải $C$, $D$ ngồi ở một đầu hàng và $A$ ngồi bên trái $B$. Vị trí nào của $A$ là đúng?],
  (
    [Vị trí 1.],
    True([Vị trí 2.]),
    [Vị trí 3.],
    [Vị trí 4.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Cặp liền nhau $C B$ chỉ có thể là $(1,2)$, $(2,3)$ hoặc $(3,4)$:
    #align(center)[
      #table(
        columns: (1.4fr, 2.6fr, 1.8fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Cặp $C B$*], [*Sắp xếp còn lại*], [*Đánh giá*],
        [$(1,2)$], [$A$ phải bên trái $B$, không còn chỗ.], [Loại],
        [$(2,3)$], [$D$ ở đầu hàng nên $D$ ở vị trí 4; $A$ ở vị trí 1 nhưng $A$ không được ngồi đầu hàng.], [Loại],
        [*$(3,4)$*], [$D$ ở vị trí 1, $A$ ở vị trí 2; mọi điều kiện đều đúng.], [*Thỏa*],
      )
    ]
    ✅ *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Bốn phát biểu sau nói về chính chúng:
    - (1) “Đúng một phát biểu trong bốn phát biểu này đúng.”
    - (2) “Đúng hai phát biểu trong bốn phát biểu này đúng.”
    - (3) “Đúng ba phát biểu trong bốn phát biểu này đúng.”
    - (4) “Cả bốn phát biểu đều đúng.”
    Kết luận nào đúng?],
  (
    True([Chỉ phát biểu (1) đúng.]),
    [Chỉ phát biểu (2) đúng.],
    [Chỉ phát biểu (3) đúng.],
    [Cả bốn phát biểu sai.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.7fr, 3.3fr, 1.45fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Giả sử*], [*Kiểm tra*], [*Kết quả*],
        [(2) đúng],
        [Khi đó phải có 2 phát biểu đúng, nhưng các phát biểu còn lại đều khẳng định số lượng khác 2 nên sai. Thực tế chỉ có 1 phát biểu đúng.],
        [Mâu thuẫn],

        [(3) hoặc (4) đúng],
        [Lập luận tương tự: khi chỉ chính phát biểu đó đúng thì số phát biểu đúng là 1, khác 3 hoặc 4.],
        [Mâu thuẫn],

        [*(1) đúng*], [Ba phát biểu còn lại sai, nên có đúng 1 phát biểu đúng như (1) nói.], [*Thỏa*],
      )
    ]
    ✅ *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Một mã gồm ba chữ số khác nhau $A, B, C$. Biết $A < B < C$, $A + B = 9$, $B + C = 13$ và $C$ là số chẵn. Mã số $A B C$ là gì?],
  (
    [135],
    [246],
    [357],
    True([458]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.4fr, 1.6fr, 1.6fr, 1.8fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Mã*], [*$A+B=9$*], [*$B+C=13$*], [*$C$ chẵn?*],
        [135], [Sai], [Sai], [Sai],
        [246], [Sai], [Sai], [Đúng],
        [357], [Đúng], [Đúng], [Sai],
        [458], [Đúng], [Đúng], [Đúng],
      )
    ]
    Chỉ mã $458$ thỏa đồng thời toàn bộ điều kiện.

    ✅ *Chọn đáp án D.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Ba bạn An, Bình, Chi chọn một trong ba môn Cờ vua, Bơi, Cầu lông; mỗi bạn chọn đúng một môn và không bạn nào chọn trùng môn. Biết An không chọn Bơi; Bình không chọn Cờ vua; Chi chọn Cầu lông. An chọn môn nào?],
  (
    True([Cờ vua.]),
    [Bơi.],
    [Cầu lông.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.55fr, 2.55fr, 1.75fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Môn của An*], [*Suy ra*], [*Đánh giá*],
        [Bơi], [Trái với giả thiết An không chọn Bơi.], [Loại],
        [Cầu lông], [Trùng với môn của Chi.], [Loại],
        [*Cờ vua*], [Bình không chọn Cờ vua, không được trùng Chi nên Bình chọn Bơi.], [*Thỏa*],
      )
    ]
    ✅ *Chọn đáp án A.*
  ],
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)],
  count: 4,
  reset-counter: true,
)

#ds(
  [*(VD)* Đúng một bạn lấy cúp. Có đúng hai lời nói đúng:
    - An: “Bình lấy cúp.”
    - Bình: “Chi không lấy cúp.”
    - Chi: “An không lấy cúp.”
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([An lấy cúp.]),
    [Bình lấy cúp.],
    True([Lời của Bình đúng.]),
    True([Lời của Chi đúng.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.35fr, 1.2fr, 1.2fr, 1.2fr, 1.65fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người lấy cúp*], [*An*], [*Bình*], [*Chi*], [*Số đúng*],
        [*An*], [*Sai*], [*Đúng*], [*Đúng*], [*2*],
        [Bình], [Đúng], [Đúng], [Đúng], [3],
        [Chi], [Sai], [Sai], [Đúng], [1],
      )
    ]
    - a) *Đúng*, b) *Sai*, c) *Đúng*, d) *Đúng*.
  ],
)

#ds(
  [*(VD)* Có ba hộp $A, B, C$, đúng một hộp có quà. Mọi nhãn đều sai:
    - $A$: “Quà ở $B$.”
    - $B$: “Quà ở $C$.”
    - $C$: “Quà ở $B$.”
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Quà ở hộp $A$.]),
    [Quà ở hộp $B$.],
    True([Nhãn trên hộp $B$ là sai.]),
    True([Nếu quà ở hộp $C$ thì nhãn trên hộp $B$ đúng.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Nhãn $A$ và $C$ sai nên quà không ở $B$; nhãn $B$ sai nên quà không ở $C$. Do đó quà ở $A$. \
    #align(center)[
      #table(
        columns: (1.4fr, 2.9fr, 1.6fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Khẳng định*], [*Lí do*], [*Đúng/Sai*],
        [a)], [Quà chỉ có thể ở $A$.], [Đúng],
        [b)], [Trái với nhãn $A$, $C$ đều sai.], [Sai],
        [c)], [Mọi nhãn đều sai theo giả thiết.], [Đúng],
        [d)], [Nếu quà ở $C$ thì nhãn $B$ “quà ở $C$” đúng.], [Đúng],
      )
    ]
  ],
)

#ds(
  [*(VDC)* Ba người $A, B, C$: một hiệp sĩ, một kẻ bất lương, một gián điệp. Họ nói:
    - $A$: “$B$ là gián điệp.”
    - $B$: “$C$ là hiệp sĩ.”
    - $C$: “$A$ là kẻ bất lương.”
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([A là hiệp sĩ.]),
    True([B là gián điệp.]),
    True([C là kẻ bất lương.]),
    True([Có đúng một lời nói đúng.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Nghiệm duy nhất là: $A$ hiệp sĩ, $B$ gián điệp, $C$ kẻ bất lương. Khi đó lời $A$ đúng, lời $B$ sai và lời $C$ sai. \
    #align(center)[
      #table(
        columns: (1.5fr, 2.8fr, 1.7fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Khẳng định*], [*Đối chiếu nghiệm*], [*Đúng/Sai*],
        [a)], [$A$ là hiệp sĩ.], [Đúng],
        [b)], [$B$ là gián điệp.], [Đúng],
        [c)], [$C$ là kẻ bất lương.], [Đúng],
        [d)], [Chỉ lời của $A$ đúng.], [Đúng],
      )
    ]
    Các phương án a–d đều đúng.
  ],
)

#ds(
  [*(VDC)* Bốn bạn $A, B, C, D$ xếp hàng. Biết $B$ đứng ngay sau $C$, $D$ đứng ở đầu hàng, $A$ đứng bên trái $B$ và $A$ không đứng đầu hàng. Xét tính đúng sai của các khẳng định sau:],
  (
    [A đứng vị trí 1.],
    True([A đứng vị trí 2.]),
    True([C đứng vị trí 3.]),
    True([D đứng vị trí 1.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Cặp $C B$ phải là $(3,4)$, vì $(1,2)$ không còn chỗ cho $A$ ở bên trái $B$ và $(2,3)$ buộc $A$ ở vị trí 1. \
    Do $D$ đứng đầu hàng, cách xếp duy nhất là $D, A, C, B$. \
    #align(center)[
      #table(
        columns: (1.4fr, 2.8fr, 1.6fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Khẳng định*], [*Theo thứ tự $D, A, C, B$*], [*Đúng/Sai*],
        [a)], [$A$ ở vị trí 2.], [Sai],
        [b)], [$A$ ở vị trí 2.], [Đúng],
        [c)], [$C$ ở vị trí 3.], [Đúng],
        [d)], [$D$ ở vị trí 1.], [Đúng],
      )
    ]
  ],
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [*(VD)* Đúng một bạn làm mất chìa khóa. Có đúng hai câu nói đúng:
    - Mai: “Lan làm mất.”
    - Lan: “Tôi làm mất.”
    - Nam: “Mai làm mất.”
    Hỏi ai làm mất chìa khóa?],
  [Lan],
  loigiai: [
    📌 *Phương pháp:* Lập bảng theo từng người có thể làm mất.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.4fr, 1.2fr, 1.2fr, 1.2fr, 1.7fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người làm mất*], [*Mai*], [*Lan*], [*Nam*], [*Số đúng*],
        [Mai], [Sai], [Sai], [Đúng], [1],
        [*Lan*], [*Đúng*], [*Đúng*], [*Sai*], [*2*],
        [Nam], [Sai], [Sai], [Sai], [0],
      )
    ]
    Chỉ trường hợp Lan làm mất chìa khóa có đúng hai câu nói đúng. \
    ✅ *Đáp số:* Lan.
  ],
)

#tln(
  dir: "ngang",
  [*(VD)* Có ba tủ $A, B, C$, đúng một tủ chứa hồ sơ. Cả ba nhãn đều sai:
    - Tủ $A$: “Hồ sơ ở tủ $B$.”
    - Tủ $B$: “Hồ sơ ở tủ $A$.”
    - Tủ $C$: “Hồ sơ ở tủ $B$.”
    Hỏi hồ sơ ở tủ nào?],
  [C],
  loigiai: [
    📌 *Phương pháp:* Lập bảng ba khả năng.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.35fr, 1.15fr, 1.15fr, 1.15fr, 1.7fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Hồ sơ ở*], [*Nhãn $A$*], [*Nhãn $B$*], [*Nhãn $C$*], [*Cả ba sai?*],
        [$A$], [Sai], [Đúng], [Sai], [Không],
        [$B$], [Đúng], [Sai], [Đúng], [Không],
        [*$C$*], [*Sai*], [*Sai*], [*Sai*], [*Có*],
      )
    ]
    ✅ *Đáp số:* $C$.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Ba người $A, B, C$: một hiệp sĩ, một kẻ bất lương, một gián điệp.
    - $A$: “$B$ là hiệp sĩ.”
    - $B$: “$C$ là kẻ bất lương.”
    - $C$: “$A$ là hiệp sĩ.”
    Hỏi ai là gián điệp?],
  [A],
  loigiai: [
    📌 *Phương pháp:* Xét lần lượt ba khả năng về gián điệp.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.35fr, 3.1fr, 1.8fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Gián điệp*], [*Kiểm tra*], [*Đánh giá*],
        [*$A$*], [$B$ hiệp sĩ, $C$ bất lương: lời $B$ đúng và lời $C$ sai. Lời $A$ được phép đúng.], [*Thỏa*],
        [$B$], [$A, C$ là hiệp sĩ và bất lương. Lời $A$ đúng buộc $B$ là hiệp sĩ, mâu thuẫn.], [Loại],
        [$C$], [$A, B$ là hiệp sĩ và bất lương. Lời $B$ đúng buộc $C$ là kẻ bất lương, mâu thuẫn.], [Loại],
      )
    ]
    ✅ *Đáp số:* $A$.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Bốn đội $A, B, C, D$ có một đội vô địch. Có đúng hai phát biểu đúng:
    - $A$: “$B$ vô địch.”
    - $B$: “$D$ không vô địch.”
    - $C$: “$A$ vô địch.”
    - $D$: “$B$ nói đúng.”
    Hỏi đội vô địch?],
  [C],
  loigiai: [
    📌 *Phương pháp:* Lập bảng theo đội vô địch.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.3fr, 1fr, 1fr, 1fr, 1fr, 1.55fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Vô địch*], [*$A$*], [*$B$*], [*$C$*], [*$D$*], [*Số đúng*],
        [$A$], [Sai], [Đúng], [Đúng], [Đúng], [3],
        [$B$], [Đúng], [Đúng], [Sai], [Đúng], [3],
        [*$C$*], [*Sai*], [*Đúng*], [*Sai*], [*Đúng*], [*2*],
        [$D$], [Sai], [Sai], [Sai], [Sai], [0],
      )
    ]
    ✅ *Đáp số:* $C$.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Bốn bạn $A, B, C, D$ xếp hàng. $D$ đứng đầu hàng; $B$ đứng ngay sau $C$; $A$ đứng bên trái $B$ và không đứng đầu hàng. Hỏi bạn đứng thứ hai là ai?],
  [A],
  loigiai: [
    📌 *Phương pháp:* Xét các vị trí có thể của cặp liền nhau $C B$.

    ✍️ *Lời giải chi tiết:* \
    #align(center)[
      #table(
        columns: (1.4fr, 2.8fr, 1.7fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Vị trí $C B$*], [*Hệ quả*], [*Đánh giá*],
        [$(1,2)$], [$D$ phải ở vị trí 1 nên trùng chỗ với $C$.], [Loại],
        [$(2,3)$], [$D$ ở vị trí 1, $A$ phải bên trái $B$ nên $A$ ở vị trí 1, trùng $D$.], [Loại],
        [*$(3,4)$*], [$D, A, C, B$ là thứ tự duy nhất.], [*Thỏa*],
      )
    ]
    ✅ *Đáp số:* $A$.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Có bốn thẻ mang số $1, 2, 3, 4$. An, Bình, Chi mỗi người lấy một thẻ khác nhau; thẻ còn lại để trên bàn. Biết An lấy số lẻ, An lấy số nhỏ hơn Bình, Bình không lấy $2$, Bình lấy số nhỏ hơn Chi và tổng ba thẻ đã lấy bằng $8$. Hỏi Chi lấy thẻ số mấy?],
  [4],
  loigiai: [
    📌 *Phương pháp:* Lập bảng theo thẻ của An và dùng điều kiện tổng.

    ✍️ *Lời giải chi tiết:* \
    An chỉ có thể lấy $1$ hoặc $3$:
    #align(center)[
      #table(
        columns: (1.25fr, 2.2fr, 2fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Thẻ của An*], [*Dùng tổng bằng $8$*], [*Đánh giá*],
        [$3$], [Bình phải lớn hơn $3$ và nhỏ hơn Chi, nhưng chỉ còn thẻ $4$ lớn hơn $3$.], [Loại],
        [*$1$*], [Bình + Chi bằng $7$; Bình không lấy $2$ và nhỏ hơn Chi nên Bình lấy $3$, Chi lấy $4$.], [*Thỏa*],
      )
    ]
    Vậy Chi lấy thẻ số $4$. \
    ✅ *Đáp số:* $4$.
  ],
)
