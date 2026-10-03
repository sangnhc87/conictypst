// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-10-BÀI 1: MỆNH ĐỀ TOÁN HỌC
// Toán 10 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))

#show: lecture-theme.with(
  title:       "Bài 1: Mệnh Đề Toán Học",
  subtitle:    "TOÁN 10 — Chương I: Mệnh đề và tập hợp",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

#lt-toc()

// ════════════════════════════════════════════════
// PHẦN 0: BỐI CẢNH LỊCH SỬ & KHỞI ĐỘNG TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-history", "🏛️", [Bối cảnh Lịch sử & Khởi động Tư duy])

#lt-slide-back(title: "🏛️ Aristotle & Cuộc chiến dẹp tan ngụy biện")[
  #lt-two-col(
    ratio: (58%, 42%),
    [
      #lt-history(title: "Quảng trường Athens thế kỷ IV TCN")[
        Các nhà ngụy biện (Sophists) dùng tài chơi chữ để bóp méo chân lý trước tòa án:
        - _“Con chó này có con $=>$ nó là cha.”_
        - _“Nó là chó của anh $=>$ nó là cha của anh!”_
        
        *Aristotle* (384 – 322 TCN) đã khai sinh ra *Logic học hình thức* với quy tắc *Tam đoạn luận* bất hủ:
        1. Tiền đề lớn: *Mọi con người đều phải chết.*
        2. Tiền đề nhỏ: *Socrates là con người.*
        3. Kết luận: *Socrates phải chết.*
      ]
    ],
    [
      #v(0.5em)
      #lt-note(title: "Chiếc khiên thép của Chân lý")[
        Logic toán học giúp phân biệt rạch ròi giữa *Ý kiến chủ quan* và *Chân lý khách quan*.
        
        Nếu không có Logic, toàn bộ lâu đài Toán học chỉ là cát lún!
      ]
    ]
  )
]

#lt-slide-back(title: "💻 George Boole & Cuộc cách mạng Kỹ thuật số")[
  #lt-timeline((
    ("1854", "George Boole", "Gán cho chân lý hai giá trị nhị phân: Đúng ($1$) và Sai ($0$). Phép toán logic: AND, OR, NOT."),
    ("1937", "Claude Shannon", "Nhận ra công tắc đóng/ngắt ($1/0$) trong vi mạch chính là hiện thân vật lý của Đại số Boole."),
    ("Hiện nay", "Chip AI & GPU", "Apple M3, NVIDIA H100 chứa hơn 90 tỷ transistors hoạt động theo đúng các phép toán mệnh đề Lớp 10!")
  ))
]

#lt-slide-back(title: "🧩 Câu đố tư duy: Người Thật Thà & Kẻ Nói Dối")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-example(title: "Hòn đảo kỳ bí")[
        Trước bạn là hai cánh cửa: *SỐNG* và *CHẾT*.
        Gác cửa là 2 người: một người *luôn nói thật ($+1$)*, một người *luôn nói dối ($-1$)*.
        
        Chỉ được hỏi *1 câu duy nhất* với *1 người*: Làm sao tìm ra cửa Sống?
      ]
    ],
    [
      #pause
      #lt-solution[
        *Hỏi người đó:* _“Nếu tôi hỏi người kia cửa nào dẫn tới sự sống, anh ta sẽ chỉ cửa nào?”_
        
        - Cả hai người đều sẽ chỉ vào *CỬA CHẾT*!
        - Nguyên do: $(+1) times (-1) = -1$ và $(-1) times (+1) = -1$.
        - $arrow$ Bạn chỉ cần bước vào *cửa còn lại*!
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN I: KHÁI NIỆM MỆNH ĐỀ & MỆNH ĐỀ CHỨA BIẾN
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia", "📐", [I. Mệnh đề Toán học & Mệnh đề Chứa biến])

#lt-slide-back(title: "1. Khái niệm Mệnh đề Toán học")[
  #lt-definition(title: "Mệnh đề")[
    *Mệnh đề toán học* (gọi tắt là _mệnh đề_) là một khẳng định hoặc *đúng* hoặc *sai*. Một khẳng định không thể vừa đúng vừa sai.
  ]
  #v(0.2em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 5pt)[
        *✅ MỆNH ĐỀ TOÁN HỌC*
        - "$2$ là số nguyên tố chẵn duy nhất." (Đúng)
        - "$pi > 4$." (Sai)
        - "Tổng 3 góc tam giác bằng $180^degree$." (Đúng)
      ]
    ],
    [
      #block(fill: rgb("#fff1f2"), stroke: 1.5pt + rgb("#e11d48"), inset: 8pt, radius: 5pt)[
        *❌ KHÔNG PHẢI MỆNH ĐỀ*
        - "Các em học bài chưa?" _(Câu hỏi)_
        - "Thời tiết hôm nay đẹp quá!" _(Cảm thán)_
        - "Hãy cố gắng lên nhé!" _(Cầu khiến)_
      ]
    ]
  )
]

#lt-slide-back(title: "2. Mệnh đề chứa biến")[
  #lt-definition(title: "Mệnh đề chứa biến")[
    Một câu khẳng định chứa một hay nhiều biến số, chưa xác định được tính đúng sai. Khi thay biến bằng một giá trị cụ thể trong tập xác định, câu đó trở thành một *mệnh đề*.
    
    Ký hiệu: $P(x)$, $Q(x, y), dots$
  ]
  #v(0.2em)
  #lt-example(title: "Xét khẳng định P(n)")[
    Cho câu khẳng định $P(n)$: "$n^2 - 4 = 0$" với $n in ZZ$.
    - Với $n = 2$: Ta có $2^2 - 4 = 0$ $arrow$ *Mệnh đề đúng*.
    - Với $n = 1$: Ta có $1^2 - 4 = -3 eq.not 0$ $arrow$ *Mệnh đề sai*.
    - Bản thân câu "$n^2 - 4 = 0$" chưa phải mệnh đề, mà là *mệnh đề chứa biến*.
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: MỆNH ĐỀ PHỦ ĐỊNH
// ════════════════════════════════════════════════
#lt-section-link("sec-phu-dinh", "🔄", [II. Mệnh đề Phủ định])

#lt-slide-back(title: "1. Định nghĩa Mệnh đề Phủ định")[
  #lt-definition(title: "Phủ định của mệnh đề P")[
    Cho mệnh đề $P$. Mệnh đề *"Không phải $P$"* gọi là *mệnh đề phủ định* của $P$ ($overline(P)$).
    $P$ đúng thì $overline(P)$ sai; $P$ sai thì $overline(P)$ đúng.
  ]
  #v(0.2em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(width: 100%, fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 5pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[Mệnh đề ban đầu $P$]
        #v(0.2em)
        - $P$: "$sqrt(2)$ là số vô tỉ" (Đúng)
        - $Q$: "$12$ chia hết cho $5$" (Sai)
        - $R$: "$pi > 3{,}14$" (Đúng)
      ]
    ],
    [
      #block(width: 100%, fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 5pt)[
        #text(weight: "bold", fill: rgb("#7c3aed"))[Mệnh đề phủ định $overline(P)$]
        #v(0.2em)
        - $overline(P)$: "$sqrt(2)$ không là số vô tỉ" (Sai)
        - $overline(Q)$: "$12$ không chia hết cho $5$" (Đúng)
        - $overline(R)$: "$pi <= 3{,}14$" (Sai)
      ]
    ]
  )
]

#lt-slide-back(title: "2. Cảnh báo sai lầm khi lấy phủ định")[
  #lt-note(title: "BẪY THƯỜNG GẶP KHI PHỦ ĐỊNH DẤU SO SÁNH")[
    Trong toán học, phủ định của quan hệ lớn hơn ($>$) là *nhỏ hơn hoặc bằng ($<=$)*, KHÔNG PHẢI chỉ là nhỏ hơn ($<$).
    
    #align(center)[
      #table(
        columns: (1fr, 1fr),
        align: center,
        stroke: 0.5pt + rgb("#cbd5e1"),
        fill: (_, row) => if row == 0 { rgb("#eff6ff") } else { none },
        [*Mệnh đề có chứa quan hệ*], [*Mệnh đề phủ định tương ứng*],
        [$a > b$], [$a <= b$ (Không phải $a < b$)],
        [$a < b$], [$a >= b$ (Không phải $a > b$)],
        [$a = b$], [$a eq.not b$],
        [$a >= b$], [$a < b$],
      )
    ]
  ]
]

// ════════════════════════════════════════════════
// PHẦN III: MỆNH ĐỀ KÉO THEO & ĐIỀU KIỆN CẦN - ĐỦ
// ════════════════════════════════════════════════
#lt-section-link("sec-keo-theo", "⚡", [III. Mệnh đề Kéo theo & Điều kiện Cần — Đủ])

#lt-slide-back(title: "1. Mệnh đề Kéo theo P => Q")[
  #lt-definition(title: "Mệnh đề kéo theo")[
    Cho hai mệnh đề $P$ và $Q$. Mệnh đề *"Nếu $P$ thì $Q$"* gọi là *mệnh đề kéo theo*, ký hiệu $P => Q$.
    $P => Q$ *chỉ sai* khi $P$ đúng mà $Q$ sai; luôn đúng trong các trường hợp còn lại.
  ]
  #v(0.2em)
  #align(center)[
    #set text(size: 15pt)
    #table(
      columns: (1fr, 1fr, 1.8fr, 2.4fr),
      align: center,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: (_, row) => if row == 0 { rgb("#eff6ff") } else if row == 2 { rgb("#fee2e2") } else { rgb("#f0fdf4") },
      [*$P$*], [*$Q$*], [*$P => Q$*], [*Ý nghĩa logic*],
      [ĐÚNG], [ĐÚNG], [*ĐÚNG*], [Giả thiết đúng dẫn tới kết luận đúng],
      [ĐÚNG], [SAI], [*SAI (duy nhất)*], [Giả thiết đúng mà kết luận sai],
      [SAI], [ĐÚNG], [*ĐÚNG*], [Tiền đề sai: Luôn đúng (Vacuously True)],
      [SAI], [SAI], [*ĐÚNG*], [Tiền đề sai: Không vi phạm cam kết],
    )
  ]
]

#lt-slide-back(title: "💡 Giải mã bí mật: Tại sao Tiền đề Sai thì P => Q Đúng?")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-example(title: "Hợp đồng bảo hiểm")[
        Công ty bảo hiểm cam kết:
        
        _“Nếu nhà anh bị cháy ($P$), công ty sẽ bồi thường $1$ tỷ đồng ($Q$).”_
        
        - *Nhà cháy ($P$ đúng), đền $1$ tỷ ($Q$ đúng):* Giữ đúng lời hứa. ✅
        - *Nhà cháy ($P$ đúng), quỵt tiền ($Q$ sai):* Lừa đảo ($P => Q$ Sai). ❌
        - *Nhà không cháy ($P$ sai):* Công ty không đền tiền. Công ty có lừa dối bạn không? *Hoàn toàn KHÔNG!* Lời hứa vẫn giữ nguyên giá trị ($P => Q$ Đúng)! ✅
      ]
    ],
    [
      #v(0.5em)
      #lt-highlight[
        #text(size: 16pt)[
          $P => Q$ chỉ bị bác bỏ khi tìm được một phản ví dụ làm $P$ thỏa mãn nhưng $Q$ bị vi phạm!
        ]
      ]
      #v(0.5em)
      #lt-note(title: "Quy tắc cốt lõi")[
        Khi tiền đề $P$ sai, mệnh đề $P => Q$ luôn được coi là *ĐÚNG HIỂN NHIÊN* (Vacuously True)!
      ]
    ]
  )
]

#lt-slide-back(title: "2. Thuật ngữ: Điều kiện Cần và Điều kiện Đủ")[
  #lt-theorem(title: "Định lý toán học")[
    Khi mệnh đề $P => Q$ là một định lý toán học:
    - $P$ là *điều kiện đủ* để có $Q$.
    - $Q$ là *điều kiện cần* để có $P$.
  ]
  #v(0.4em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-step("ĐỦ", icon: "▶")[
        *Có $P$ là ĐỦ để suy ra $Q$*
        
        _Ví dụ:_ Một tứ giác là hình vuông ($P$) thì *đủ* để kết luận nó là hình chữ nhật ($Q$).
      ]
    ],
    [
      #lt-step("CẦN", icon: "◀")[
        *Muốn có $P$ thì BẮT BUỘC CẦN phải có $Q$*
        
        _Ví dụ:_ Một tứ giác muốn là hình vuông ($P$) thì *cần* phải có $4$ góc vuông ($Q$).
      ]
    ]
  )
]

#lt-slide-back(title: "🏛️ Phương pháp Phản chứng & Cái chết của Hippasus")[
  #lt-history(title: "Chứng minh √2 là số vô tỉ")[
    Vào thế kỷ V TCN, phái Pythagoras tin rằng mọi số đều là hữu tỉ ($p/q$). *Hippasus* dùng *phản chứng*:
    1. Giả sử $sqrt(2) = p/q$ (phân số tối giản, $p, q$ không cùng chia hết cho số nào $> 1$).
    2. Bình phương: $2 = p^2 / q^2 arrow p^2 = 2q^2 arrow p$ chẵn $arrow p = 2k$.
    3. Thay vào: $(2k)^2 = 2q^2 arrow 4k^2 = 2q^2 arrow q^2 = 2k^2 arrow q$ chẵn.
    4. *MÂU THUẪN:* Cả $p$ và $q$ cùng là số chẵn $arrow$ Trái giả thiết tối giản!
    
    $arrow$ Buộc phải thừa nhận: *$sqrt(2)$ là số vô tỉ!*
  ]
  #v(0.2em)
  #lt-note(title: "Sức mạnh của Phản chứng")[
    Để chứng minh $P => Q$ đúng, ta giả sử $Q$ sai ($overline(Q)$ đúng) kết hợp với $P$ để suy ra mâu thuẫn!
  ]
]

// ════════════════════════════════════════════════
// PHẦN IV: MỆNH ĐỀ ĐẢO & MỆNH ĐỀ TƯƠNG ĐƯƠNG
// ════════════════════════════════════════════════
#lt-section-link("sec-dao-tuong-duong", "🔁", [IV. Mệnh đề Đảo & Mệnh đề Tương đương])

#lt-slide-back(title: "1. Mệnh đề Đảo & Cảnh báo ngộ nhận")[
  #lt-definition(title: "Mệnh đề đảo")[
    Cho mệnh đề kéo theo $P => Q$. Mệnh đề $Q => P$ được gọi là *mệnh đề đảo* của $P => Q$.
  ]
  #v(0.3em)
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-note(title: "CẢNH BÁO TỬ HUYỆT")[
        Mệnh đề thuận $P => Q$ đúng *KHÔNG CÓ NGHĨA* là mệnh đề đảo $Q => P$ cũng đúng!
        
        - Thuận: "Nếu $x = 2$ thì $x^2 = 4$." (ĐÚNG)
        - Đảo: "Nếu $x^2 = 4$ thì $x = 2$." (SAI, vì có thể $x = -2$)
      ]
    ],
    [
      #lt-example(title: "Đối thoại Socrates")[
        - _Socrates:_ "Nếu tứ giác là hình vuông thì có 4 góc vuông. Đúng hay sai?"
        - _Học trò:_ "Dạ, đúng ạ!"
        - _Socrates:_ "Thế nếu tứ giác có 4 góc vuông thì nó là hình vuông?"
        - _Học trò:_ "Sai ạ! Nó có thể là hình chữ nhật!"
      ]
    ]
  )
]

#lt-slide-back(title: "2. Mệnh đề Tương đương & Điều kiện Cần và Đủ")[
  #lt-definition(title: "Mệnh đề tương đương")[
    Cho hai mệnh đề $P$ và $Q$. Mệnh đề *"P khi và chỉ khi Q"* (hoặc *"P tương đương Q"*), ký hiệu là $P <=> Q$.
    
    - $P <=> Q$ đúng khi và chỉ khi cả hai mệnh đề $P => Q$ và $Q => P$ đều đúng.
    - Nghĩa là $P$ và $Q$ *cùng đúng* hoặc *cùng sai*.
  ]
  #v(0.3em)
  #lt-theorem(title: "Điều kiện Cần và Đủ")[
    Khi $P <=> Q$ là định lý, ta nói:
    - $P$ là *điều kiện cần và đủ* để có $Q$.
    - $Q$ là *điều kiện cần và đủ* để có $P$.
    
    _Ví dụ:_ "Tam giác $A B C$ đều $<=>$ Tam giác $A B C$ có 3 góc bằng $60^degree$."
  ]
]

// ════════════════════════════════════════════════
// PHẦN V: KÝ HIỆU VỚI MỌI (∀) & TỒN TẠI (∃)
// ════════════════════════════════════════════════
#lt-section-link("sec-ky-hieu", "🌐", [V. Ký hiệu Với mọi (∀) & Tồn tại (∃)])

#lt-slide-back(title: "1. Ký hiệu Với mọi (∀) và Tồn tại (∃)")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Ký hiệu ∀ (For all)")[
        Ký hiệu $forall$ đọc là *"với mọi"*.
        
        Mệnh đề: "$forall x in X, P(x)$"
        - *Đúng:* Nếu với *mọi* phần tử $x_0 in X$, $P(x_0)$ đều đúng.
        - *Sai:* Chỉ cần chỉ ra *ít nhất 1* phần tử $x_0 in X$ làm $P(x_0)$ sai (phản ví dụ).
      ]
    ],
    [
      #lt-definition(title: "Ký hiệu ∃ (Exists)")[
        Ký hiệu $exists$ đọc là *"tồn tại"* (hoặc *"có ít nhất một"*).
        
        Mệnh đề: "$exists x in X, P(x)$"
        - *Đúng:* Chỉ cần tìm được *ít nhất 1* phần tử $x_0 in X$ làm $P(x_0)$ đúng.
        - *Sai:* Nếu với *mọi* phần tử $x in X$, $P(x)$ đều sai.
      ]
    ]
  )
]

#lt-slide-back(title: "⚡ 2. Quy tắc Vàng: Phủ định Mệnh đề chứa ∀ và ∃")[
  #lt-theorem(title: "Quy tắc phủ định lượng từ")[
    Phủ định của *"Với mọi"* là *"Tồn tại"*; phủ định của *"Tồn tại"* là *"Với mọi"*:
    
    #align(center)[
      #block(fill: rgb("#f5f3ff"), stroke: 2pt + rgb("#7c3aed"), inset: 12pt, radius: 8pt)[
        $overline("“" forall x in X\, P(x) "”") space equiv space exists x in X\, overline(P(x))$
        #v(0.4em)
        $overline("“" exists x in X\, P(x) "”") space equiv space forall x in X\, overline(P(x))$
      ]
    ]
  ]
  #v(0.3em)
  #lt-example(title: "Ví dụ phủ định")[
    - $P$: "$forall n in NN, n^2 + 1 text(" là số lẻ")$" $arrow$ $overline(P)$: "$exists n in NN, n^2 + 1 text(" không phải là số lẻ")$".
    - $Q$: "$exists x in RR, x^2 - x + 1 <= 0$" $arrow$ $overline(Q)$: "$forall x in RR, x^2 - x + 1 > 0$".
  ]
]

// ════════════════════════════════════════════════
// PHẦN VI: HỆ THỐNG BÀI TẬP THỰC CHIẾN
// ════════════════════════════════════════════════
#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG I BÀI 1],
  questions: (
    (num: 1, type: "TN", desc: [Nhận dạng mệnh đề toán học]),
    (num: 2, type: "TN", desc: [Phủ định mệnh đề lượng từ]),
    (num: 3, type: "TN", desc: [Mệnh đề kéo theo P => Q]),
    (num: 4, type: "TN", desc: [Điều kiện cần và điều kiện đủ]),
    (num: 5, type: "TN", desc: [Phủ định tam thức bậc hai]),
    (num: 6, type: "TN", desc: [Câu đố logic Hiệp sĩ và Kẻ gian]),
    (num: 7, type: "DS", desc: [Đúng/Sai toàn diện logic mệnh đề]),
    (num: 8, type: "TLN", desc: [Số giá trị n để mệnh đề đúng]),
    (num: 9, type: "TLN", desc: [Số nghiệm nguyên của BPT]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Trong các câu sau, câu nào *không phải* là mệnh đề toán học?],
  (
    [$pi$ là một số vô tỉ.],
    [Số 2 là số nguyên tố chẵn duy nhất.],
    [Các em hãy cố gắng học tập thật tốt nhé!],
    [Phương trình $x^2 + 1 = 0$ có nghiệm thực.],
  ),
  correct: 3,
  num: 1,
  de: "Đề 01A — Câu 1",
  loigiai: [
    - Câu C là câu cầu khiến, biểu thị mong muốn, không có tính khẳng định đúng hoặc sai nên không phải là mệnh đề.
    - Câu A, B là mệnh đề đúng; câu D là mệnh đề sai (phương trình vô nghiệm trên $RR$).
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phủ định của mệnh đề: *"Mọi số nguyên đều là số hữu tỉ"* là mệnh đề nào sau đây?],
  (
    [Mọi số nguyên đều không phải là số hữu tỉ.],
    [Tồn tại một số nguyên không phải là số hữu tỉ.],
    [Tồn tại một số hữu tỉ không phải là số nguyên.],
    [Có ít nhất một số nguyên là số vô tỉ.],
  ),
  correct: 2,
  num: 2,
  de: "Đề 01A — Câu 2",
  loigiai: [
    - Mệnh đề ban đầu: "$forall x in ZZ, x in QQ$".\
    - Áp dụng quy tắc phủ định lượng từ: $overline(forall) equiv exists$ và $overline(in) equiv in.not$.\
    - Do đó phủ định là: "$exists x in ZZ, x in.not QQ$" (Tồn tại một số nguyên không phải là số hữu tỉ).
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Cho hai mệnh đề $P$: "Số tự nhiên $a$ chia hết cho 3" và $Q$: "Số tự nhiên $a$ chia hết cho 9". Phát biểu mệnh đề $P => Q$ và xét tính đúng sai của nó.],
  (
    [Nếu số $a$ chia hết cho 9 thì số $a$ chia hết cho 3. (Đúng)],
    [Nếu số $a$ chia hết cho 3 thì số $a$ chia hết cho 9. (Sai)],
    [Nếu số $a$ chia hết cho 3 thì số $a$ chia hết cho 9. (Đúng)],
    [Số $a$ chia hết cho 3 khi và chỉ khi số $a$ chia hết cho 9. (Sai)],
  ),
  correct: 2,
  num: 3,
  de: "Đề 01A — Câu 3",
  loigiai: [
    - Mệnh đề $P => Q$: "Nếu số tự nhiên $a$ chia hết cho 3 thì $a$ chia hết cho 9".\
    - Đây là một khẳng định *sai*. Phản ví dụ: Chọn $a = 6$, ta thấy $6$ chia hết cho 3 nhưng $6$ không chia hết cho 9.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Xét định lý: *"Nếu hai tam giác bằng nhau thì diện tích của chúng bằng nhau"*. Khẳng định nào sau đây là đúng?],
  (
    [Hai tam giác bằng nhau là điều kiện cần để diện tích của chúng bằng nhau.],
    [Hai tam giác bằng nhau là điều kiện đủ để diện tích của chúng bằng nhau.],
    [Diện tích của hai tam giác bằng nhau là điều kiện đủ để chúng bằng nhau.],
    [Hai tam giác bằng nhau là điều kiện cần và đủ để diện tích của chúng bằng nhau.],
  ),
  correct: 2,
  num: 4,
  de: "Đề 01A — Câu 5",
  loigiai: [
    - Cấu trúc định lý $P => Q$: "$P$" là điều kiện đủ để có "$Q$"; và "$Q$" là điều kiện cần để có "$P$".\
    - Ở đây $P$: "Hai tam giác bằng nhau", $Q$: "Diện tích của chúng bằng nhau".\
    - Vậy "Hai tam giác bằng nhau" là *điều kiện đủ* để diện tích bằng nhau.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phủ định của mệnh đề: "$forall x in RR, x^2 - x + 1 > 0$" là mệnh đề nào sau đây?],
  (
    [$forall x in RR, x^2 - x + 1 <= 0$],
    [$exists x in RR, x^2 - x + 1 < 0$],
    [$exists x in RR, x^2 - x + 1 = 0$],
    [$exists x in RR, x^2 - x + 1 <= 0$],
  ),
  correct: 4,
  num: 5,
  de: "Đề 01A — Câu 9",
  loigiai: [
    - Phủ định của lượng từ $forall$ là lượng từ $exists$.\
    - Phủ định của quan hệ lớn hơn ($>$) là quan hệ nhỏ hơn hoặc bằng ($<=$).\
    - Vậy mệnh đề phủ định chính xác là: "$exists x in RR, x^2 - x + 1 <= 0$".
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Trong vương quốc có 2 loại người: Hiệp sĩ (luôn nói thật) và Kẻ gian (luôn nói dối). Bạn gặp A và B. A nói: *"Ít nhất một trong hai chúng tôi là kẻ gian"*. Kết luận nào đúng?],
  (
    [A là kẻ gian và B là hiệp sĩ.],
    [A là hiệp sĩ và B là kẻ gian.],
    [Cả hai đều là hiệp sĩ.],
    [Cả hai đều là kẻ gian.],
  ),
  correct: 2,
  num: 6,
  de: "Đề 01A — Câu 8 (Tư duy)",
  loigiai: [
    - Nếu A là kẻ gian: Câu nói đúng $arrow$ Mâu thuẫn vì kẻ gian luôn nói dối!\
    - Vậy A là Hiệp sĩ (nói thật) $arrow$ Cần 1 kẻ gian, nên B là kẻ gian.\
    $arrow$ *Đáp án B: A là hiệp sĩ và B là kẻ gian.*
  ],
  back-to: "sec-exercise-hub"
)

// Câu hỏi Đúng/Sai toàn diện
#lt-ds(
  [Xét tính Đúng / Sai của các khẳng định sau về logic mệnh đề:],
  (
    (body: [Mệnh đề kéo theo $P => Q$ chỉ sai khi tiền đề $P$ đúng mà kết luận $Q$ sai.], "true": true),
    (body: [Nếu mệnh đề thuận $P => Q$ đúng thì mệnh đề đảo $Q => P$ chắc chắn cũng đúng.], "true": false),
    (body: [Phủ định của mệnh đề "$exists x in RR, x^2 = 2$" là "$forall x in RR, x^2 eq.not 2$".], "true": true),
    (body: [Khẳng định: "$P$ là điều kiện cần để có $Q$" tương đương với mệnh đề kéo theo $P => Q$.], "true": false),
  ),
  num: 7,
  de: "Đề 01A — Đúng/Sai Tổng Hợp",
  loigiai: [
    - a) *Đúng:* Theo đúng định nghĩa bảng chân trị mệnh đề kéo theo.
    - b) *Sai:* Mệnh đề đảo có thể sai, ví dụ: $x = 1 => x^2 = 1$ (đúng) nhưng $x^2 = 1 => x = 1$ (sai).
    - c) *Đúng:* Phủ định của $exists$ là $forall$, phủ định của $=$ là $eq.not$.
    - d) *Sai:* "$P$ là điều kiện cần để có $Q$" nghĩa là $Q => P$, không phải $P => Q$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho mệnh đề chứa biến $P(n)$: "$n^2 + 1$ chia hết cho $5$" với $n in NN, 1 <= n <= 20$. Có bao nhiêu giá trị của $n$ để $P(n)$ là mệnh đề đúng?],
  "8",
  num: 8,
  de: "Đề 01A — Số Giá Trị Của Biến Để Mệnh Đề Đúng",
  loigiai: [
    1. $n^2 + 1$ chia hết cho $5$ khi $n^2$ có chữ số tận cùng là $4$ hoặc $9$.\
    2. Điều này xảy ra khi chữ số tận cùng của $n$ là $2, 3, 7$ hoặc $8$.\
    3. Trong tập ${1, 2, ..., 20}$, các số có tận cùng là $2, 3, 7, 8$ gồm $4$ nhóm, mỗi nhóm có $2$ số.\
    4. Tổng số giá trị của $n$ thỏa mãn: $2 times 4 = 8$.\
    5. Đáp số: *$8$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Có bao nhiêu số nguyên $x in [-10; 10]$ thỏa mãn mệnh đề "$x^2 - 5x + 6 <= 0$"?],
  "2",
  num: 9,
  de: "Đề 01A — Đếm Nghiệm Nguyên Thỏa Mãn Mệnh Đề Chứa Biến",
  loigiai: [
    1. Xét bất phương trình: $x^2 - 5x + 6 <= 0 <=> (x - 2)(x - 3) <= 0$.\
    2. Tập nghiệm của bất phương trình là đoạn $[2; 3]$.\
    3. Các số nguyên thuộc đoạn $[2; 3]$ và nằm trong $[-10; 10]$ là: $x in {2; 3}$.\
    4. Do đó có đúng $2$ giá trị nguyên thỏa mãn.\
    5. Đáp số: *$2$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN VII: TỔNG KẾT & THÔNG ĐIỆP SƯ PHẠM
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🗺️", [VII. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ 6 Trụ Cột Cốt Lõi — Bài 1: Mệnh Đề")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 14pt)[1. KHÁI NIỆM]
        #v(0.2em)
        #text(size: 11.5pt)[
          - Đúng hoặc Sai dứt khoát.
          - Không mập mờ, cảm tính.
          - Chứa biến $P(x)$ cần gán giá trị.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 14pt)[2. PHỦ ĐỊNH ($overline(P)$)]
        #v(0.2em)
        #text(size: 11.5pt)[
          - Ngược hoàn toàn chân trị.
          - $overline(>)$ là $<=$ (không chỉ $<$).
          - $overline(=)$ là $eq.not$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#ea580c"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#ea580c"), size: 14pt)[3. KÉO THEO ($P => Q$)]
        #v(0.2em)
        #text(size: 11.5pt)[
          - *Chỉ sai* khi $P$ Đúng, $Q$ Sai.
          - Tiền đề sai $arrow$ Luôn đúng!
          - Mệnh đề đảo $Q => P$ chưa chắc đúng.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 14pt)[4. CẦN & ĐỦ]
        #v(0.2em)
        #text(size: 11.5pt)[
          - $P => Q$: $P$ là ĐK Đủ, $Q$ là ĐK Cần.
          - $P <=> Q$: $P$ và $Q$ cùng đúng hoặc cùng sai. ĐK Cần và Đủ.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fdf4ff"), stroke: 1.5pt + rgb("#c026d3"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#c026d3"), size: 14pt)[5. LƯỢNG TỪ $forall$ & $exists$]
        #v(0.2em)
        #text(size: 11.5pt)[
          - $overline(forall x\, P(x)) equiv exists x\, overline(P(x))$.
          - $overline(exists x\, P(x)) equiv forall x\, overline(P(x))$.
          - 1 phản ví dụ là đủ bác bỏ $forall$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 14pt)[6. ỨNG DỤNG THỰC TẾ]
        #v(0.2em)
        #text(size: 11.5pt)[
          - Chứng minh phản chứng.
          - Đại số Boole $1/0$.
          - Logic chip bán dẫn, GPU & AI.
        ]
      ]
    ],
  )
]

#lt-slide-back(title: "🎓 Lời khuyên Sư phạm của Thầy Sang")[
  #lt-bullets(
    icon: "💎",
    [*Rèn luyện tư duy phản biện:* Không bao giờ chấp nhận một kết luận khi chưa kiểm tra tính vững chắc của tiền đề.],
    [*Cảnh giác với mệnh đề đảo:* Trong cuộc sống cũng như trong toán, "$A$ suy ra $B$" không đồng nghĩa với việc "$B$ suy ra $A$".],
    [*Làm chủ phương pháp phản chứng:* Khi một bài toán quá khó để đi đường thẳng, hãy can đảm giả sử điều ngược lại để tìm mâu thuẫn.],
    [*Hiểu cội nguồn công nghệ:* Mỗi dòng code Python, mỗi mạch logic trong smartphone đều bắt đầu từ 2 giá trị $0$ và $1$ của bài học này!],
  )
  #v(0.6em)
  #align(center)[
    #text(size: 16pt, fill: rgb("#1e3a8a"), weight: "bold")[
      CHÚC CÁC EM HỌC TỐT & LÀM CHỦ TƯ DUY LOGIC TOÁN HỌC!
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 1!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 18pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 1!]\
      #v(0.4em)
      #text(size: 10.5pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn các nền tảng logic toán học:\
        *Khái niệm mệnh đề, Phủ định, Kéo theo, Cần & Đủ, Lượng từ $forall, exists$.*
      ]
      #v(0.7em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
