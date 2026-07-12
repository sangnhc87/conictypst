#import "../lib.typ": *

#set page(
  width: 1920pt,
  height: 1080pt,
  fill: rgb("#111111"),
  margin: 40pt
)

#set text(size: 32pt, fill: white, font: "New Computer Modern")
#show math.equation: set text(fill: rgb("#f6e8c3"), size: 40pt)
#set align(center)

#let scene(title, code-str, render-func, ratio: (1fr, 1.2fr)) = {
  page(align(center + horizon)[
    #text(size: 56pt, fill: rgb("#ff9e64"), weight: "bold")[#title]
    #v(3em)
    
    #grid(
      columns: ratio,
      gutter: 4em,
      align(left)[
        #box(fill: rgb("#1a1b26"), stroke: 2pt + rgb("#3b4261"), inset: 2em, radius: 1em, width: 100%)[
          #text(size: 28pt, fill: rgb("#9ece6a"))[Mã nguồn Typst:]
          #v(1em)
          #text(size: 24pt, fill: rgb("#a9b1d6"))[#raw(code-str, block: true, lang: "typst")]
        ]
      ],
      align(left)[
        #box(fill: rgb("#ffffff"), inset: 40pt, radius: 1em, width: 100%, stroke: 4pt + rgb("#3b4261"), clip: true)[
          #set text(fill: black, size: 24pt)
          #show math.equation: set text(fill: black, size: 28pt)
          #render-func()
        ]
      ]
    )
  ])
}

// Cảnh 1: Giới thiệu trình chiếu
#page(align(center + horizon)[
  #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[SANG MATH: CHUẨN MỰC SOẠN SÁCH & CHUYÊN ĐỀ]
  #v(2em)
  #text(size: 40pt, fill: rgb("#7aa2f7"))[Trải nghiệm hệ thống hộp sư phạm chuyên nghiệp, tuyệt đẹp]
])

// Cảnh 2: Chương và Bài
#scene(
  "1. CẤU TRÚC CHƯƠNG VÀ BÀI",
  "// Khởi tạo Chương và Bài rất đơn giản\n#let theme = \"sgk-modern\"\n\n#book-chapter([ỨNG DỤNG ĐẠO HÀM], number: \"01\", theme: theme)\n\n#book-lesson([Tính đơn điệu của hàm số], number: \"1\", theme: theme)\n\n#book-section([Khái niệm cơ bản], number: \"1.1\", theme: theme)",
  () => {
    book-chapter([Ứng dụng đạo hàm], number: "01", theme: "sgk-modern")
    v(2em)
    book-lesson([Tính đơn điệu của hàm số], number: "1", theme: "sgk-modern")
    v(2em)
    book-section([Khái niệm cơ bản], number: "1.1", theme: "sgk-modern")
  }
)

// Cảnh 3: Định nghĩa và Định lý
#scene(
  "2. HỘP ĐỊNH NGHĨA VÀ ĐỊNH LÝ",
  "// Các hộp kiến thức cốt lõi\n\n#definition-box(theme: theme)[\n  Hàm số $f$ đồng biến trên khoảng $I$ nếu với mọi $x_1 < x_2$ thuộc $I$ thì $f(x_1) <= f(x_2)$.\n]\n\n#theorem-box(theme: theme)[\n  Nếu $f'(x)>0$ trên khoảng $I$ thì $f$ đồng biến trên $I$.\n  Nếu $f'(x)<0$ trên khoảng $I$ thì $f$ nghịch biến trên $I$.\n]",
  () => {
    definition-box(theme: "sgk-modern")[
      Hàm số $f$ đồng biến trên khoảng $I$ nếu với mọi $x_1 < x_2$ thuộc $I$ thì $f(x_1) <= f(x_2)$.
    ]
    v(2em)
    theorem-box(theme: "sgk-modern")[
      Nếu $f'(x)>0$ trên khoảng $I$ thì $f$ đồng biến trên $I$.\n
      Nếu $f'(x)<0$ trên khoảng $I$ thì $f$ nghịch biến trên $I$.
    ]
  }
)

// Cảnh 4: Phương pháp và Lưu ý
#scene(
  "3. HỘP PHƯƠNG PHÁP VÀ LƯU Ý",
  "#method-box(theme: theme)[\n  Quy trình xét đơn điệu:\n  1. Tìm tập xác định.\n  2. Tính $f'(x)$.\n  3. Lập bảng biến thiên.\n]\n\n#warning-box(theme: theme)[\n  Không được gộp hai khoảng đồng biến qua một điểm mà hàm số không xác định.\n]",
  () => {
    method-box(theme: "sgk-modern")[
      Quy trình xét đơn điệu:\n
      1. Tìm tập xác định.\n
      2. Tính $f'(x)$.\n
      3. Lập bảng biến thiên.
    ]
    v(2em)
    warning-box(theme: "sgk-modern")[
      Không được gộp hai khoảng đồng biến qua một điểm mà hàm số không xác định.
    ]
  }
)

// Cảnh 5: Ví dụ và Luyện tập
#scene(
  "4. VÍ DỤ VÀ LUYỆN TẬP",
  "#example-box(title: [Ví dụ 1], theme: theme)[\n  Xét tính đơn điệu của $y=x^3-3x+1$.\n  Ta có $y'=3x^2-3=3(x-1)(x+1)$.\n  // ...bảng biến thiên...\n]\n\n#practice-box(theme: theme)[\n  Xét tính đơn điệu của $y=(x+1)/(x-2)$.\n]",
  () => {
    example-box(title: [Ví dụ 1], theme: "sgk-modern")[
      Xét tính đơn điệu của $y=x^3-3x+1$.\n
      Ta có $y'=3x^2-3=3(x-1)(x+1)$.\n
      #bbbt(
        x-vals: ($-oo$, $-1$, $1$, $+oo$),
        d-signs: ("+", 0, "-", 0, "+"),
        v-vals: ($-oo$, $3$, $-1$, $+oo$),
      )
    ]
    v(1.5em)
    practice-box(theme: "sgk-modern")[
      Xét tính đơn điệu của $y=(x+1)/(x-2)$.
    ]
  }
)

// Đổi 4 Themes
#let themes = (
  ("sgk-modern", "SGK HIỆN ĐẠI", "Phong cách SGK hiện đại, sang trọng."),
  ("sgk-kntt", "SGK KẾT NỐI TRI THỨC", "Đồng bộ giao diện Kết Nối Tri Thức."),
  ("sgk-ctst", "SGK CHÂN TRỜI SÁNG TẠO", "Đồng bộ giao diện Chân Trời Sáng Tạo."),
  ("sgk-cd", "SGK CÁNH DIỀU", "Đồng bộ giao diện Cánh Diều."),
)

#page(align(center + horizon)[
  #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[SỨC MẠNH CỦA THEME]
  #v(2em)
  #text(size: 40pt, fill: rgb("#7aa2f7"))[Chỉ cần đổi tên Theme, mọi cấu trúc sẽ khoác áo mới]
])

#for (tid, tname, desc) in themes {
  scene(
    "THEME: " + tname,
    "// " + desc + "\n#let theme = \"" + tid + "\"\n\n#theorem-box(theme: theme)[\n  Nếu $f'(x)>0$ thì $f$ đồng biến...\n]\n\n#example-box(title: [Ví dụ 1], theme: theme)[\n  Xét tính đơn điệu...\n]",
    () => {
      theorem-box(theme: tid)[
        Nếu $f'(x)>0$ trên khoảng $I$ thì $f$ đồng biến trên $I$.\n
        Nếu $f'(x)<0$ trên khoảng $I$ thì $f$ nghịch biến trên $I$.
      ]
      v(2em)
      example-box(title: [Ví dụ 1], theme: tid)[
        Xét tính đơn điệu của $y=x^3-3x+1$.\n
        Ta có $y'=3x^2-3=3(x-1)(x+1)$.
      ]
    }
  )
}

// Cảnh cuối
#page(align(center + horizon)[
  #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[CẢM ƠN QUÝ THẦY CÔ]
  #v(2em)
  #text(size: 40pt, fill: rgb("#7aa2f7"))[Hãy thỏa sức sáng tạo cuốn sách của riêng mình!]
])
