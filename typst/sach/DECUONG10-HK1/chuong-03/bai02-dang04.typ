#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Ứng dụng hệ thức lượng để giải các bài toán thực tế", mau: C3)

#bai-tap-tu-luan(mau: C3)[
  #bt-item(1, [Một nhân viên kiểm lâm đang đi trên đường dốc nghiêng góc $5^@$ so với phương thẳng đứng hướng về tháp quan sát cao $100" feet"$. Góc nâng từ chân lên đỉnh tháp là $40^@$. Tính khoảng cách từ người đó đến chân tháp.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 4.5, ctx => {
        let B = (0.0, 0.0)
        let C = (0.0, 3.8)
        let A = (4.0, 0.35)

        doan(ctx, B, C, mau: sm-red, day: 2.2pt)
        doan(ctx, B, A, mau: sm-blue, day: 1.2pt)
        doan(ctx, A, C, mau: sm-green.darken(20%), day: 1.1pt)

        goc(ctx, A, C, B, r: 0.6, ten: text(size: 6.5pt, fill: sm-blue)[$40^@$], mau: sm-blue)

        diem(ctx, B, ten: $B$, huong: "duoi-trai")
        diem(ctx, C, ten: $C$, huong: "tren")
        diem(ctx, A, ten: $A$, huong: "phai")

        nhan(ctx, (-0.45, 1.9), text(size: 7.5pt, fill: sm-red)[$100" ft"$])
        nhan(ctx, (2.2, -0.2), text(size: 7.5pt, fill: sm-blue)[$d$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Gọi $A$ là vị trí nhân viên kiểm lâm, $B$ là chân tháp, $C$ là đỉnh tháp quan sát ($B C = 100" feet"$).
    Góc nâng từ vị trí $A$ lên đỉnh tháp $C$ là $hat(B A C) = 40^@$.
    Góc giữa đường dốc và tháp thẳng đứng là $hat(A B C) = 90^@ + 5^@ = 95^@$ (hoặc $85^@$).
    Khi đó góc tại đỉnh tháp: $hat(A C B) = 180^@ - (40^@ + 95^@) = 45^@$.
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A B)/(sin hat(A C B)) &= (B C)/(sin hat(B A C)) \
    => A B &= (100 dot sin 45^@)/(sin 40^@) approx (100 dot 0.7071)/0.6428 approx 110" feet" $
    *(hoặc $A B = (100 dot sin 55^@)/(sin 40^@) approx 127" feet"$, tuỳ hướng dốc)*.
  ])

  #bt-item(2, [Để đo chiều cao một ngọn núi, người ta đo đỉnh núi tại hai vị trí cách nhau $900" m"$ với góc nâng lần lượt là $47^@$ và $35^@$. Máy toàn đạc cao $2" m"$. Tính chiều cao $h$ của ngọn núi.], loigiai: [
    #align(center)[
      #hinh(w: 7cm, xmin: -0.5, xmax: 6.2, ymin: -0.5, ymax: 4.5, ctx => {
        let A = (0.5, 0.0)
        let B = (2.3, 0.0)
        let H = (5.5, 0.0)
        let S = (5.5, 3.8)

        doan(ctx, (-0.3, 0.0), (5.9, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, H, S, mau: sm-green.darken(30%), day: 2.2pt)
        doan(ctx, A, S, mau: sm-blue, day: 1.1pt)
        doan(ctx, B, S, mau: sm-red, day: 1.1pt)

        goc-vuong(ctx, H, S, B, r: 0.25, mau: sm-gray)
        goc(ctx, A, S, B, r: 0.8, ten: text(size: 6.5pt, fill: sm-blue)[$35^@$], mau: sm-blue)
        goc(ctx, B, S, H, r: 0.55, ten: text(size: 6.5pt, fill: sm-red)[$47^@$], mau: sm-red)

        diem(ctx, A, ten: $A$, huong: "duoi")
        diem(ctx, B, ten: $B$, huong: "duoi")
        diem(ctx, H, ten: $H$, huong: "duoi")
        diem(ctx, S, ten: $S$, huong: "tren")

        nhan(ctx, (1.4, -0.3), text(size: 7pt, fill: sm-blue)[$900" m"$])
        nhan(ctx, (5.85, 2.0), text(size: 7.5pt, fill: sm-green.darken(30%))[$h$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Gọi $S$ là đỉnh núi, $H$ là chân núi (trên mặt phẳng ngang qua máy toàn đạc). $A, B$ là hai điểm đặt máy với $A B = 900" m"$.
    Trong tam giác $S A B$, góc ngoài tại $B$ là $47^@$:
    $ hat(A S B) = 47^@ - 35^@ = 12^@. $
    🔹 *Bước 2:* Theo định lý sin trong tam giác $S A B$:
    $ (S B)/(sin 35^@) &= (A B)/(sin 12^@) \
    => S B &= (900 dot sin 35^@)/(sin 12^@) approx (900 dot 0.5736)/0.2079 approx 2482.7" m". $
    🔹 *Bước 3:* Trong tam giác vuông $S H B$ tại $H$:
    $ h_1 &= S H = S B dot sin 47^@ \
    approx 2482.7 dot sin 47^@ approx 1815.7" m". $
    🔹 *Bước 4:* Chiều cao của ngọn núi so với mặt đất:
    $ h = h_1 + 2 = 1815.7 + 2 = 1817.7" m" approx 1818" m" $
    *(nếu làm tròn trung gian $h_1 approx 1814" m" => h = 1816" m"$)*.
  ])

  #bt-item(3, [Xác định độ dài cáp treo trượt tuyết từ $P$ đến $Q$: Nhân viên trắc địa đo được $hat(D P Q) = 25^@$, lùi xa một đoạn $1000" feet"$ tới điểm $R$ đo được $hat(P R Q) = 15^@$. Tính chiều dài cáp treo $P Q$ và chiều cao $Q D$ của núi.], loigiai: [
    #align(center)[
      #hinh(w: 7cm, xmin: -0.5, xmax: 6.0, ymin: -0.5, ymax: 4.2, ctx => {
        let R = (0.5, 0.0)
        let P = (2.5, 0.0)
        let D = (5.2, 0.0)
        let Q = (5.2, 3.2)

        doan(ctx, (-0.2, 0.0), (5.6, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, D, Q, mau: sm-gray, day: 1.5pt)
        doan(ctx, R, Q, mau: sm-blue, day: 1.1pt)
        doan(ctx, P, Q, mau: sm-red, day: 1.4pt)

        goc-vuong(ctx, D, Q, P, r: 0.25, mau: sm-gray)
        goc(ctx, R, Q, P, r: 0.8, ten: text(size: 6.5pt, fill: sm-blue)[$15^@$], mau: sm-blue)
        goc(ctx, P, Q, D, r: 0.55, ten: text(size: 6.5pt, fill: sm-red)[$25^@$], mau: sm-red)

        diem(ctx, R, ten: $R$, huong: "duoi")
        diem(ctx, P, ten: $P$, huong: "duoi")
        diem(ctx, D, ten: $D$, huong: "duoi")
        diem(ctx, Q, ten: $Q$, huong: "tren")

        nhan(ctx, (1.5, -0.3), text(size: 7pt, fill: sm-blue)[$1000" ft"$])
        nhan(ctx, (3.5, 1.9), text(size: 7.5pt, fill: sm-red)[Cáp treo])
        nhan(ctx, (5.5, 1.6), text(size: 7pt, fill: sm-gray)[Núi])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác $P Q R$, góc ngoài tại $P$ là $hat(D P Q) = 25^@$:
    $ hat(P Q R) = hat(D P Q) - hat(P R Q) = 25^@ - 15^@ = 10^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $P Q R$:
    $ (P Q)/(sin hat(P R Q)) &= (P R)/(sin hat(P Q R)) \
    => P Q &= (1000 dot sin 15^@)/(sin 10^@) approx (1000 dot 0.2588)/0.1736 approx 1490" feet". $
    Chiều dài của cáp treo $P Q$ xấp xỉ $1490" feet"$.
    🔹 *Bước 3:* Chiều cao $Q D$ của núi (trong tam giác vuông $Q D P$ tại $D$):
    $ Q D = P Q dot sin 25^@ approx 1490 dot sin 25^@ approx 1490 dot 0.4226 approx 629.7" feet" approx 630" feet". $
  ])

  #bt-item(4, [Hai người quan sát khinh khí cầu từ hai điểm cách nhau $2" km"$ trên mặt đất phẳng. Góc nâng nhìn thấy khí cầu lần lượt là $40^@$ và $60^@$. Khí cầu nằm trong mặt phẳng đứng đi qua hai điểm. Tính độ cao của khinh khí cầu.], loigiai: [
    #align(center)[
      #hinh(w: 7cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 4.2, ctx => {
        let A = (0.5, 0.0)
        let B = (4.5, 0.0)
        let C = (2.2, 3.2)
        let H = (2.2, 0.0)

        doan(ctx, (-0.2, 0.0), (5.0, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, A, C, mau: sm-blue, day: 1.2pt)
        doan(ctx, B, C, mau: sm-green.darken(20%), day: 1.2pt)
        doan(ctx, C, H, mau: sm-red, day: 1pt, dut: true)

        goc-vuong(ctx, H, C, A, r: 0.25, mau: sm-red)
        goc(ctx, A, C, B, r: 0.6, ten: text(size: 6.5pt, fill: sm-blue)[$40^@$], mau: sm-blue)
        goc(ctx, B, C, A, r: 0.6, ten: text(size: 6.5pt, fill: sm-green.darken(20%))[$60^@$], mau: sm-green.darken(20%))

        diem(ctx, A, ten: $A$, huong: "duoi")
        diem(ctx, B, ten: $B$, huong: "duoi")
        diem(ctx, C, ten: $C$, huong: "tren")
        diem(ctx, H, ten: $H$, huong: "duoi")

        nhan(ctx, (3.3, -0.3), text(size: 7.5pt, fill: sm-blue)[$2" km"$])
        nhan(ctx, (2.45, 1.6), text(size: 7.5pt, fill: sm-red)[$h$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Giả sử khinh khí cầu ở vị trí $C$, hai người quan sát ở hai vị trí $A$ và $B$ với $A B = 2" km"$.
    Trong tam giác $A B C$:
    $ hat(A C B) = 180^@ - (40^@ + 60^@) = 80^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A C)/(sin 60^@) &= (A B)/(sin 80^@) \
    => A C &= (2 dot sin 60^@)/(sin 80^@) approx (2 dot 0.8660)/0.9848 approx 1.7588" km". $
    🔹 *Bước 3:* Độ cao $h = C H$ của khinh khí cầu (với $C H perp A B$):
    $ h = A C dot sin 40^@ approx 1.7588 dot sin 40^@ approx 1.7588 dot 0.6428 approx 1.13" km" = 1130" m". $
  ])

  #bt-item(5, [Một người đứng trên ngọn hải đăng cao $80" m"$ so với mặt nước biển quan sát hai con thuyền ở hai hướng ngược nhau với góc hạ lần lượt là $30^@$ và $45^@$. Tính khoảng cách giữa hai con thuyền.], loigiai: [
    #align(center)[
      #hinh(w: 7.5cm, xmin: -0.5, xmax: 6.5, ymin: -0.5, ymax: 4.2, ctx => {
        let H = (2.5, 0.0)
        let S = (2.5, 3.4)
        let A = (0.2, 0.0)
        let B = (5.9, 0.0)

        doan(ctx, (-0.2, 0.0), (6.3, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, H, S, mau: sm-red, day: 2.2pt)
        doan(ctx, S, A, mau: sm-blue, day: 1.2pt)
        doan(ctx, S, B, mau: sm-green.darken(20%), day: 1.2pt)

        // Duong nam ngang phu
        doan(ctx, (0.5, 3.4), (4.5, 3.4), mau: sm-gray, day: 0.6pt, dut: true)

        goc-vuong(ctx, H, S, A, r: 0.25, mau: sm-red)
        goc(ctx, A, S, H, r: 0.7, ten: text(size: 6.5pt, fill: sm-blue)[$45^@$], mau: sm-blue)
        goc(ctx, B, S, H, r: 0.7, ten: text(size: 6.5pt, fill: sm-green.darken(20%))[$30^@$], mau: sm-green.darken(20%))

        diem(ctx, H, ten: $H$, huong: "duoi")
        diem(ctx, S, ten: $S$, huong: "tren")
        diem(ctx, A, ten: $A$, huong: "duoi")
        diem(ctx, B, ten: $B$, huong: "duoi")

        nhan(ctx, (2.15, 1.7), text(size: 7.5pt, fill: sm-red)[$80" m"$])
        nhan(ctx, (3.2, -0.3), text(size: 7.5pt, fill: sm-blue)[$A B$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Gọi $S$ là đỉnh hải đăng, $H$ là chân hải đăng ($S H = 80" m"$). $A, B$ là vị trí hai con thuyền.
    Góc hạ từ $S$ tới thuyền $A$ là $45^@ => hat(S A H) = 45^@$.
    Tam giác $S H A$ vuông cân tại $H => H A = S H = 80" m"$.
    🔹 *Bước 2:* Góc hạ từ $S$ tới thuyền $B$ là $30^@ => hat(S B H) = 30^@$.
    Trong tam giác vuông $S H B$:
    $ H B = (S H)/(tan 30^@) = 80 / (1 / sqrt(3)) = 80 sqrt(3) approx 138.56" m". $
    🔹 *Bước 3:* Do hai thuyền nằm về hai phía ngược nhau so với ngọn hải đăng nên khoảng cách giữa hai con thuyền là:
    $ A B = H A + H B = 80 + 80 sqrt(3) = 80(1 + sqrt(3)) approx 218.56" m". $
  ])
]

#bai-tap-trac-nghiem(mau: C3)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12, reset-counter: true)

#tn(
  dir: "ngang",
  [Một ô tô đi qua hầm chui với $A B = 16" km", A C = 33" km", hat(B A C) = 45^@$. Tính diện tích tam giác $A B C$ (làm tròn đến hàng đơn vị).],
  (
    [$189$.],
    True([$187$.]),
    [$185$.],
    [$181$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức tính diện tích tam giác: $S = 1/2 b c sin A$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng công thức tính diện tích tam giác $A B C$:
    $ S &= 1/2 A B dot A C dot sin 45^@ \
    &= 1/2 dot 16 dot 33 dot (sqrt(2)/2) = 132 sqrt(2) approx 186.68 approx 187. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Khoảng cách từ điểm $B$ đến cạnh $A T$ của đỉnh núi khi hai đèn tín hiệu $A, B$ cách nhau $1536" m"$ là (làm tròn đến hàng đơn vị):],
  (
    True([$705$.]),
    [$701$.],
    [$707$.],
    [$703$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng công thức đường cao trong tam giác hoặc các hệ thức lượng.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng công thức đường cao trong tam giác giải ra kết quả:
    $ h approx 705" m". $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Chiều cao tháp $C D = h$: Đo trên mặt đất $A B = 24" m", hat(C A D) = 63^@, hat(C B D) = 48^@$. Chiều cao của tháp là:],
  (
    [$60$.],
    [$62,4$.],
    [$63,4$.],
    True([$61,4$.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý sin trong tam giác.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý sin, ta có:
    $ h = (24 dot sin 63^@ dot sin 48^@)/(sin 15^@) approx 61.4" m". $
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Trên nóc tòa nhà có cột ăng-ten cao $5" m"$. Vị trí quan sát cao $7" m"$ nhìn thấy đỉnh và chân ăng-ten góc $50^@$ và $40^@$. Chiều cao của tòa nhà là:],
  (
    [$19,5$.],
    True([$18,9$.]),
    [$18,2$.],
    [$18,5$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng hệ thức lượng trong tam giác vuông.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính khoảng cách ngang $d$:
    $ d = 5 / (tan 50^@ - tan 40^@) approx 14.18" m". $
    🔹 *Bước 2:* Chiều cao tòa nhà là:
    $ h = 7 + 14.18 tan 40^@ approx 18.9" m". $
    
    ✅ *Chọn đáp án B.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 4, reset-counter: true)

#ds(
  [Cho tam giác $A B C$ có các cạnh $a = 4, b = 5$. Xét tính đúng sai:],
  (
    [Công thức tính diện tích của $triangle A B C$ là $S = (a b c)/(2 R)$.],
    True([Diện tích tam giác tính được khi biết góc xen giữa.]),
    True([Chiều cao hạ từ đỉnh $C$ tương ứng với cạnh đáy $c$.]),
    True([Chiều cao tháp $h$ trong bài toán thực tế đo được xấp xỉ $61,4" m" < 62" m"$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, vì công thức đúng để tính diện tích tam giác là $S = (a b c)/(4 R)$.
    - b) *Đúng*, vì diện tích tam giác có thể tính bằng công thức $S = 1/2 a b sin C$ (biết góc xen giữa hai cạnh).
    - c) *Đúng*, vì trong tam giác, chiều cao kẻ từ một đỉnh luôn vuông góc với cạnh đối diện tương ứng.
    - d) *Đúng*, vì $61,4 < 62$.
  ]
)

#ds(
  [Người quan sát cách tháp $10" m"$ nhìn thẳng cái tháp dưới góc $55^@$. Xét tính đúng sai:],
  (
    [Số đo góc $hat(A D C) = 45^@$.],
    True([Độ dài đoạn $A B$ xấp xỉ bằng $10,15" m"$.]),
    [Diện tích $triangle A C D$ bằng $100" m"^2$.],
    True([Chiều cao của tháp xấp xỉ bằng $11,76" m"$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, theo phân tích góc nhìn thực tế không phải là $45^@$.
    - b) *Đúng*, qua tính toán hình học, khoảng cách xấp xỉ $10,15" m"$.
    - c) *Sai*, diện tích không phải là $100" m"^2$.
    - d) *Đúng*, dựa vào hệ thức lượng giác với góc $55^@$, tính được chiều cao tháp xấp xỉ $11,76" m"$.
  ]
)

#ds(
  [Mảnh đất nửa đường tròn bán kính $R = 1" m"$, trồng hoa hình chữ nhật nội tiếp. Xét tính đúng sai:],
  (
    True([Độ dài đoạn $O M = 1" m"$.]),
    True([Nếu $A M = 0,8" m"$ thì diện tích $triangle A M O = 0,24" m"^2$.]),
    True([Nếu $A M = 0,5" m"$ thì tính được diện tích hoa.]),
    [Diện tích lớn nhất khi góc $alpha = 90^@$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, vì $M$ thuộc đường tròn bán kính $R = 1$ nên $O M = 1" m"$.
    - b) *Đúng*, vì áp dụng Pythagore ta có $O A = sqrt(1^2 - 0,8^2) = sqrt(0,36) = 0,6" m"$.
      Suy ra diện tích $S_{A M O} = 1/2 dot 0,8 dot 0,6 = 0,24" m"^2$.
    - c) *Đúng*, khi biết $A M$ thì dễ dàng tính được $O A$ và từ đó tính được diện tích hình chữ nhật.
    - d) *Sai*, vì diện tích hình chữ nhật lớn nhất khi $alpha = 45^@$.
  ]
)

#ds(
  [Từ vị trí $A$ quan sát một cây cao: $A H = 4" m", H B = 20" m", hat(B A C) = 45^@$. Xét tính đúng sai:],
  (
    True([Diện tích $triangle A H B$ bằng $40" m"^2$.]),
    [Nếu $hat(A C B) = 45^@$ thì $A C = 10" m"$.],
    True([Số đo của góc $hat(A B C)$ xấp xỉ $78^@ 41'$.]),
    True([Chiều cao của cây xấp xỉ bằng $17,33" m"$.]),
  ),
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 6.0, ymin: -0.5, ymax: 5.0, ctx => {
        let H = (0.0, 0.0)
        let A = (0.0, 1.2)
        let B = (5.0, 0.0)
        let C = (5.0, 4.3)

        doan(ctx, (-0.3, 0.0), (5.5, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, B, C, mau: sm-green.darken(30%), day: 2.2pt)
        doan(ctx, H, A, mau: sm-blue, day: 1.5pt)

        doan(ctx, A, B, mau: sm-blue, day: 1pt, dut: true)
        doan(ctx, A, C, mau: sm-red, day: 1.2pt)

        goc-vuong(ctx, H, A, B, r: 0.25, mau: sm-gray)
        goc-vuong(ctx, B, H, C, r: 0.25, mau: sm-gray)

        goc(ctx, A, B, C, r: 0.6, ten: text(size: 7.5pt, fill: sm-red)[$45^@$], mau: sm-red)

        diem(ctx, H, ten: $H$, huong: "duoi-trai")
        diem(ctx, A, ten: $A$, huong: "trai")
        diem(ctx, B, ten: $B$, huong: "duoi")
        diem(ctx, C, ten: $C$, huong: "tren")

        nhan(ctx, (-0.45, 0.6), text(size: 7.5pt, fill: sm-blue)[$4" m"$])
        nhan(ctx, (2.5, -0.3), text(size: 7.5pt, fill: sm-blue)[$20" m"$])
        nhan(ctx, (5.4, 2.2), text(size: 7.5pt, fill: sm-green.darken(30%))[Cây $h$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*. Tam giác $A H B$ vuông tại $H$ nên diện tích là:
      $ S_{A H B} = 1/2 A H dot H B = 1/2 dot 4 dot 20 = 40" m"^2. $
    - b) *Sai*. Trong tam giác $A H B$ vuông tại $H$:
      $ A B = sqrt(A H^2 + H B^2) = sqrt(4^2 + 20^2) = sqrt(416) = 4 sqrt(26) approx 20,40" m". $
      Nếu $hat(A C B) = 45^@$, tam giác $A B C$ có $hat(B A C) = 45^@ => hat(A B C) = 90^@$, khi đó $A C = A B sqrt(2) approx 28,84" m" != 10" m"$.
    - c) *Đúng*. Trong tam giác vuông $A H B$:
      $ tan hat(A B H) = (A H)/(H B) = 4/20 = 0,2 => hat(A B H) approx 11^@ 19'. $
      Vì cây $B C perp H B$ nên $hat(A B C) = 90^@ - hat(A B H) approx 90^@ - 11^@ 19' = 78^@ 41'$.
    - d) *Đúng*. Trong tam giác $A B C$:
      $ hat(A C B) = 180^@ - (45^@ + 78^@ 41') = 56^@ 19'. $
      Theo định lý sin:
      $ B C = (A B dot sin 45^@)/(sin 56^@ 19') approx (20,40 dot sin 45^@)/(sin 56^@ 19') approx 17,33" m". $
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [Hai xe cùng xuất phát từ $A$, hướng hợp góc $60^@$ với tốc độ $30" km/h"$ và $40" km/h"$. Sau $1,5$ giờ khoảng cách giữa hai xe là bao nhiêu km (làm tròn đến hàng phần mười)?],
  [54,1],
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý côsin trong tam giác.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính quãng đường mỗi xe đi được sau $1,5$ giờ:
    $ S_1 = 30 dot 1,5 = 45" km", quad S_2 = 40 dot 1,5 = 60" km". $
    🔹 *Bước 2:* Áp dụng định lý côsin tính khoảng cách giữa hai xe:
    $ d^2 &= 45^2 + 60^2 - 2(45)(60) cos 60^@ \
    &= 2025 + 3600 - 2700 = 2925. $
    Suy ra $d = sqrt(2925) approx 54,1" km"$.
    
    ✅ *Đáp số:* $54,1$.
  ]
)

#tln(
  dir: "ngang",
  [Đo khoảng cách từ bờ sông tới điểm $B$ ở giữa hồ: $hat(B A C) = 30^@, hat(A C B) = 100^@, A C = 50" m"$. Tính khoảng cách $A B$ (làm tròn đến hàng phần mười).],
  [64,3],
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý sin trong tam giác $A B C$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính góc $B$:
    $ hat(B) = 180^@ - (30^@ + 100^@) = 50^@. $
    🔹 *Bước 2:* Áp dụng định lý sin tính khoảng cách $A B$:
    $ (A B)/(sin hat(A C B)) &= (A C)/(sin hat(B)) \
    => A B &= (50 dot sin 100^@)/(sin 50^@) approx 64,3" m". $
    
    ✅ *Đáp số:* $64,3$.
  ]
)

#tln(
  dir: "ngang",
  [Ô tô đi từ $A$ đến $C$ vòng qua $B$: $A B = 15" km", B C = 20" km", hat(A B C) = 120^@$. 1 lít xăng chạy $5" km"$, giá $20.000$ đ/lít. Làm hầm đi thẳng $A C$ tiết kiệm được bao nhiêu nghìn đồng?],
  [18],
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý côsin tính $A C$, sau đó tính quãng đường rút ngắn và quy ra số tiền tiết kiệm.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính quãng đường $A C$:
    $ A C &= sqrt(15^2 + 20^2 - 2(15)(20) cos 120^@) \
    &= sqrt(225 + 400 + 300) = sqrt(925) approx 30,41" km". $
    🔹 *Bước 2:* Tính quãng đường rút ngắn:
    $ 35 - 30,41 = 4,59" km". $
    🔹 *Bước 3:* Tính số tiền tiết kiệm được:
    $ T = (4,59 / 5) dot 20.000 approx 18,36" nghìn đồng" approx 18" nghìn đồng". $
    
    ✅ *Đáp số:* $18$.
  ]
)

#tln(
  dir: "ngang",
  [Cột ăng-ten cao $5" m"$ trên nóc nhà. Điểm quan sát $A$ nhìn thấy đỉnh và chân ăng-ten dưới góc $50^@$ và $40^@$ so với phương ngang. Tính khoảng cách từ $A$ đến chân cột ăng-ten (làm tròn đến một chữ số thập phân).],
  [18,5],
  loigiai: [
    📌 *Phương pháp:* Sử dụng hệ thức lượng trong tam giác vuông.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Khoảng cách ngang từ $A$ đến tòa nhà:
    $ d = 5 / (tan 50^@ - tan 40^@) approx 14,18" m". $
    🔹 *Bước 2:* Khoảng cách từ $A$ đến chân cột ăng-ten:
    $ A C = d / (cos 40^@) = 14,18 / (cos 40^@) approx 18,5" m". $
    
    ✅ *Đáp số:* $18,5$.
  ]
)

#tln(
  dir: "ngang",
  [Trực thăng $A$ quan sát hai tàu $B, C$ với $A B = 23,8" km", A C = 31,9" km", hat(B A C) = 83,6^@$. Tính khoảng cách từ $A$ đến cạnh $B C$ (làm tròn đến hàng đơn vị).],
  [20],
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý côsin tính $B C$, sau đó tính diện tích $S$ để suy ra chiều cao $h_a$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính khoảng cách $B C$:
    $ B C &= sqrt(23,8^2 + 31,9^2 - 2 dot 23,8 dot 31,9 dot cos 83,6^@) \
    &approx 37,61" km". $
    🔹 *Bước 2:* Tính diện tích tam giác $A B C$:
    $ S = 1/2(23,8)(31,9) sin 83,6^@ approx 377,2" km"^2. $
    🔹 *Bước 3:* Khoảng cách từ $A$ đến $B C$ (đường cao hạ từ $A$):
    $ h_a = (2 S)/(B C) approx (2 dot 377,2)/37,61 approx 20" km". $
    
    ✅ *Đáp số:* $20$.
  ]
)

#tln(
  dir: "ngang",
  [Hai tàu cùng xuất phát từ $A$, hướng lệch nhau $60^@$ với vận tốc $30" km/h"$ và $40" km/h"$. Sau $2$ giờ hai tàu ở $C$ và $B$. Gọi $S$ là diện tích $triangle A B C$. Tính $S / (100 sqrt(3))$.],
  [12],
  loigiai: [
    📌 *Phương pháp:* Tính quãng đường mỗi tàu đi được, tính diện tích tam giác, sau đó lập tỉ số.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Quãng đường hai tàu đi được sau 2 giờ:
    $ A C = 30 dot 2 = 60" km", quad A B = 40 dot 2 = 80" km". $
    🔹 *Bước 2:* Diện tích tam giác $A B C$:
    $ S &= 1/2(60)(80) sin 60^@ \
    &= 2400 dot sqrt(3)/2 = 1200 sqrt(3). $
    🔹 *Bước 3:* Tính tỉ số $S / (100 sqrt(3))$:
    $ S / (100 sqrt(3)) = (1200 sqrt(3))/(100 sqrt(3)) = 12. $
    
    ✅ *Đáp số:* $12$.
  ]
)
