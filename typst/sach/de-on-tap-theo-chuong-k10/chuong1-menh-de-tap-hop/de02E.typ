#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("059669") // Emerald Green

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// HÀM VẼ MẠCH ĐIỆN LOGIC CE-TZ
// ═══════════════════════════════════════════════════════════
#let circuit-parallel() = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 6pt,
    fill: rgb("f8fafc"),
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("1e293b"))[Mô hình mạch điện song song (Phép Tuyển $P or Q$)]
    #v(3pt)
    #cetz.canvas({
      import cetz.draw: *
      // Dây chính nguồn vào
      line((-3.0, 0), (-1.8, 0), stroke: 1.2pt + rgb("334155"))
      // Nhánh rẽ trên và dưới
      line((-1.8, 0), (-1.8, 0.8), stroke: 1.2pt + rgb("334155"))
      line((-1.8, 0), (-1.8, -0.8), stroke: 1.2pt + rgb("334155"))
      
      // Nhánh trên: Công tắc P
      line((-1.8, 0.8), (-0.8, 0.8), stroke: 1.2pt + rgb("334155"))
      circle((-0.8, 0.8), radius: 0.08, fill: rgb("059669"), stroke: none)
      line((-0.8, 0.8), (0.1, 1.2), stroke: 1.5pt + rgb("059669")) // cần gạt mở
      circle((0.2, 0.8), radius: 0.08, fill: rgb("059669"), stroke: none)
      line((0.2, 0.8), (1.8, 0.8), stroke: 1.2pt + rgb("334155"))
      content((-0.3, 1.5), text(weight: "bold", fill: rgb("059669"))[Khóa $P$])
      
      // Nhánh dưới: Công tắc Q
      line((-1.8, -0.8), (-0.8, -0.8), stroke: 1.2pt + rgb("334155"))
      circle((-0.8, -0.8), radius: 0.08, fill: rgb("059669"), stroke: none)
      line((-0.8, -0.8), (0.2, -0.8), stroke: 1.5pt + rgb("059669")) // đóng kín
      circle((0.2, -0.8), radius: 0.08, fill: rgb("059669"), stroke: none)
      line((0.2, -0.8), (1.8, -0.8), stroke: 1.2pt + rgb("334155"))
      content((-0.3, -1.2), text(weight: "bold", fill: rgb("059669"))[Khóa $Q$])
      
      // Gom nhánh và tải đèn
      line((1.8, 0.8), (1.8, 0), stroke: 1.2pt + rgb("334155"))
      line((1.8, -0.8), (1.8, 0), stroke: 1.2pt + rgb("334155"))
      line((1.8, 0), (2.3, 0), stroke: 1.2pt + rgb("334155"))
      
      // Bóng đèn Đ
      circle((2.6, 0), radius: 0.3, stroke: 1.2pt + rgb("eab308"), fill: rgb("fef08a"))
      line((2.4, -0.2), (2.8, 0.2), stroke: 1pt + rgb("ca8a04"))
      line((2.4, 0.2), (2.8, -0.2), stroke: 1pt + rgb("ca8a04"))
      line((2.9, 0), (3.3, 0), stroke: 1.2pt + rgb("334155"))
      content((2.6, 0.5), text(size: 8pt, weight: "bold", fill: rgb("a16207"))[Đèn $L$])
    })
  ]
]

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ (ĐỀ E: ĐẠI SỐ BOOLEAN, CỔNG LOGIC & TRUY VẤN CƠ SỞ DỮ LIỆU - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "106E",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong khoa học máy tính, một cổng logic AND nhận hai tín hiệu đầu vào $P$ và $Q$ (nhận giá trị $1$ là ĐÚNG, $0$ là SAI). Tín hiệu đầu ra của cổng AND chỉ nhận giá trị $1$ khi nào?],
    (
        True([Cả $P$ và $Q$ đều nhận giá trị $1$]),
        [Ít nhất một trong hai tín hiệu $P$ hoặc $Q$ nhận giá trị $1$],
        [Cả $P$ và $Q$ đều nhận giá trị $0$],
        [$P$ nhận giá trị $1$ và $Q$ nhận giá trị $0$]
    ),
    loigiai: [
        Cổng AND tương ứng với phép hội $P and Q$ trong logic mệnh đề. Mệnh đề $P and Q$ chỉ đúng khi cả hai mệnh đề thành phần $P$ và $Q$ cùng đúng ($1$).
    ]
)

// TN 2
#tn([Một mạch điện gồm hai công tắc $P$ và $Q$ được mắc song song với nhau như hình vẽ:
#circuit-parallel()
Đèn $L$ sẽ sáng khi có dòng điện chạy qua ít nhất một trong hai công tắc. Trong đại số logic Boolean, trạng thái sáng của đèn $L$ tương ứng với phép toán logic nào sau đây?],
    (
        True([Phép Tuyển $P or Q$]),
        [Phép Hội $P and Q$],
        [Phép Phủ định $not P$],
        [Phép Kéo theo $P => Q$]
    ),
    loigiai: [
        Mạch mắc song song cho phép dòng điện lưu thông khi khóa $P$ đóng HOẶC khóa $Q$ đóng. Do đó nó mô tả phép Tuyển (cổng OR): $P or Q$.
    ]
)

// TN 3
#tn([Trong ngôn ngữ truy vấn cơ sở dữ liệu quan hệ SQL, câu lệnh:
`SELECT * FROM KhachHang WHERE (Tuoi >= 18) AND (ThanhPho = 'HaNoi')`
Nếu gọi $A$ là tập hợp khách hàng từ $18$ tuổi trở lên và $B$ là tập hợp khách hàng ở Hà Nội, tập kết quả truy vấn trả về tương ứng với phép toán tập hợp nào?],
    (
        True([$A inter B$]),
        [$A union B$],
        [$A setminus B$],
        [$C_U A$]
    ),
    loigiai: [
        Từ khóa `AND` đòi hỏi cả hai điều kiện cùng phải thỏa mãn đồng thời, tương ứng với phép Giao của hai tập hợp $A inter B$.
    ]
)

// TN 4
#tn([Một hệ thống kiểm soát quyền truy cập tệp tin đặt quy tắc bảo mật: "Người dùng $X$ được phép xóa tệp tin ($D$) KHI VÀ CHỈ KHI $X$ là Quản trị viên hệ thống ($A$)". Mệnh đề nào sau đây diễn tả đúng quy tắc trên?],
    (
        True([$D <=> A$]),
        [$D => A$],
        [$A => D$],
        [$not D => A$]
    ),
    loigiai: [
        Cụm từ "khi và chỉ khi" diễn tả quan hệ tương đương logic hai chiều: $D <=> A$.
    ]
)

// TN 5
#tn([Trong lập trình, mệnh đề phủ định của điều kiện `if (x >= 5 and x <= 20)` là điều kiện nào sau đây theo luật De Morgan?],
    (
        True([`x < 5 or x > 20`]),
        [`x < 5 and x > 20`],
        [`x <= 5 or x >= 20`],
        [`5 < x < 20`]
    ),
    loigiai: [
        Theo luật De Morgan: $not (P and Q) <=> (not P) or (not Q)$.
        Do đó: $not (x >= 5 and x <= 20) <=> (x < 5) or (x > 20)$.
    ]
)

// TN 6
#tn([Cơ sở dữ liệu của một thư viện trường học lưu trữ:
- Bảng sách $S$ có $1200$ cuốn sách.
- Bảng sách được mượn trong tháng $M$ có $450$ cuốn sách ($M subset S$).
Số lượng cuốn sách trong thư viện CHƯA TỪNG được mượn trong tháng chính là lực lượng của tập hợp nào?],
    (
        True([$C_S M$]),
        [$S inter M$],
        [$S union M$],
        [$M setminus S$]
    ),
    loigiai: [
        Số sách chưa được mượn thuộc phần bù của $M$ trong $S$: $C_S M = S setminus M$, có số lượng $1200 - 450 = 750$ cuốn.
    ]
)

// TN 7
#tn([Cho hai tập địa chỉ IP mạng con được cấp phát cho hai phòng ban:
- Phòng Kỹ thuật: $A = [10; 45]$
- Phòng Kinh doanh: $B = [30; 80]$
Các địa chỉ IP bị xung đột (trùng lặp) giữa hai phòng ban này nằm trong tập hợp nào?],
    (
        True([$[30; 45]$]),
        [$[10; 80]$],
        [$[10; 30)$],
        [$(45; 80]$]
    ),
    loigiai: [
        Địa chỉ IP xung đột là phần giao của hai tập hợp:
        $ A inter B = [10; 45] inter [30; 80] = [30; 45] $
    ]
)

// TN 8
#tn([Một thuật toán tìm kiếm nhị phân chia không gian tìm kiếm thành các khoảng giá trị. Ban đầu khoảng tìm kiếm là $S = [0; 100]$. Sau bước thứ nhất loại bỏ nửa dưới $[0; 50)$, không gian tìm kiếm còn lại là tập hợp nào?],
    (
        True([$[50; 100]$]),
        [$(50; 100]$],
        [$[0; 50]$],
        [$(0; 50)$]
    ),
    loigiai: [
        Không gian còn lại là phép hiệu:
        $ [0; 100] setminus [0; 50) = [50; 100] $
    ]
)

// TN 9
#tn([Một hệ thống tường lửa (Firewall) lọc gói tin theo cổng dịch vụ (Port):
- Bộ lọc $F_1$ cho phép các cổng trong tập $A = {80, 443, 8080, 22}$.
- Bộ lọc $F_2$ cho phép các cổng trong tập $B = {21, 22, 80, 3306}$.
Tập hợp các cổng dịch vụ được cả hai bộ lọc đồng thời cho phép thông qua là],
    (
        True([${22, 80}$]),
        [${80, 443}$],
        [${21, 22}$],
        [${8080, 3306}$]
    ),
    loigiai: [
        $ A inter B = {80, 443, 8080, 22} inter {21, 22, 80, 3306} = {22, 80} $
    ]
)

// TN 10
#tn([Cho hàm kiểm tra tính chẵn lẻ của số nguyên $n$: "Nếu $n$ chia hết cho $4$ thì $n$ là số chẵn". Mệnh đề đảo của mệnh đề trên là:],
    (
        True([Nếu $n$ là số chẵn thì $n$ chia hết cho $4$]),
        [Nếu $n$ không chia hết cho $4$ thì $n$ không là số chẵn],
        [Nếu $n$ không là số chẵn thì $n$ không chia hết cho $4$],
        [$n$ chia hết cho $4$ khi và chỉ khi $n$ là số chẵn]
    ),
    loigiai: [
        Mệnh đề ban đầu có dạng $P => Q$. Mệnh đề đảo có dạng $Q => P$: "Nếu $n$ là số chẵn thì $n$ chia hết cho $4$".
    ]
)

// TN 11
#tn([Trong hệ thống lưu trữ phân tán, một tệp tin dữ liệu được sao lưu tại $k$ máy chủ độc lập. Gọi $S_i$ là sự kiện "Máy chủ thứ $i$ hoạt động bình thường". Hệ thống bị mất dữ liệu hoàn toàn khi TẤT CẢ các máy chủ đều bị hỏng. Sự kiện hệ thống KHÔNG bị mất dữ liệu tương ứng với biểu thức logic nào?],
    (
        True([$S_1 or S_2 or ... or S_k$]),
        [$S_1 and S_2 and ... and S_k$],
        [$not S_1 and not S_2 and ... and not S_k$],
        [$S_1 => S_2$]
    ),
    loigiai: [
        Chỉ cần có ít nhất một máy chủ hoạt động bình thường thì dữ liệu không bị mất, tức là $S_1 or S_2 or ... or S_k$.
    ]
)

// TN 12
#tn([Trong thiết kế giao diện ứng dụng, tập hợp $N$ gồm $5$ nút bấm chức năng cơ bản. Một lập trình viên muốn tạo thanh công cụ tùy biến gồm đúng $3$ nút bấm từ tập $N$. Số thanh công cụ khác nhau có thể thiết kế là],
    (
        True([$10$ thanh công cụ]),
        [$15$ thanh công cụ],
        [$20$ thanh công cụ],
        [$60$ thanh công cụ]
    ),
    loigiai: [
        Số tập con gồm $3$ phần tử chọn từ $5$ phần tử:
        $ (5 times 4 times 3) / (3 times 2 times 1) = 10 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đại số Boolean và cổng logic vi mạch số)
#ds([Trong thiết kế vi mạch kỹ thuật số, xét tín hiệu logic của ba biến $P, Q, R in {0, 1}$. Tín hiệu đầu ra của một mạch cảnh báo thông minh được xác định bởi hàm logic:
$ F = (P and Q) or (not R) $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu $R = 0$ thì tín hiệu đầu ra $F$ luôn luôn bằng $1$ bất kể giá trị của $P$ và $Q$.]),
    True([Nếu $P = 1, Q = 1, R = 1$ thì tín hiệu đầu ra $F$ nhận giá trị $1$.]),
    True([Tín hiệu đầu ra $F = 0$ khi và chỉ khi $R = 1$ đồng thời ít nhất một trong hai biến $P$ hoặc $Q$ nhận giá trị $0$.]),
    [Số bộ giá trị $(P, Q, R)$ làm cho hàm logic $F$ nhận giá trị $0$ là $5$ bộ.]
  ),
  loigiai: [
    #step([Xét khi R = 0])
    Khi $R = 0 => not R = 1$. Khi đó $F = (P and Q) or 1 = 1$ với mọi $P, Q$. Mệnh đề a ĐÚNG.

    #step([Xét khi P = 1, Q = 1, R = 1])
    Khi đó $P and Q = 1$ và $not R = 0 => F = 1 or 0 = 1$. Mệnh đề b ĐÚNG.

    #step([Điều kiện để F = 0])
    $F = 0 <=> (P and Q = 0)$ VÀ $(not R = 0) <=> (P = 0 text(" hoặc ") Q = 0)$ VÀ $(R = 1)$. Mệnh đề c ĐÚNG.

    #step([Đếm số bộ để F = 0])
    Có tất cả $2^3 = 8$ bộ $(P, Q, R)$.
    Để $F = 0$ thì $R = 1$ ($1$ cách), và $(P, Q) in {(0,0), (0,1), (1,0)}$ ($3$ cách).
    Vậy chỉ có đúng $1 times 3 = 3$ bộ làm cho $F = 0$ (chứ không phải $5$ bộ). Mệnh đề d SAI.
  ]
)

// DS 2 (Truy vấn cơ sở dữ liệu quan hệ SQL và Tập hợp)
#ds([Cơ sở dữ liệu của một sàn giao dịch chứng khoán gồm $1000$ mã cổ phiếu niêm yết (Tập vũ trụ $U$):
- Tập $A$: Các cổ phiếu có chỉ số $P/E < 15$ (gồm $400$ mã).
- Tập $B$: Các cổ phiếu có tỷ suất cổ tức $D > 8%$ (gồm $300$ mã).
- Biết rằng có $120$ mã cổ phiếu thỏa mãn cả hai tiêu chí trên ($n(A inter B) = 120$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số mã cổ phiếu thỏa mãn ít nhất một trong hai tiêu chí (truy vấn dùng toán tử `OR`) là $580$ mã.]),
    True([Số mã cổ phiếu chỉ thỏa mãn tiêu chí $P/E < 15$ mà không thỏa mãn tỷ suất cổ tức $D > 8%$ là $280$ mã.]),
    True([Số mã cổ phiếu không thỏa mãn cả hai tiêu chí trên (truy vấn dùng `NOT (A OR B)`) là $420$ mã.]),
    [Tỷ lệ cổ phiếu thỏa mãn đồng thời cả hai tiêu chí trên tổng số cổ phiếu đạt ít nhất một tiêu chí là $30%$.]
  ),
  loigiai: [
    #step([Tính lực lượng hợp])
    $n(A union B) = n(A) + n(B) - n(A inter B) = 400 + 300 - 120 = 580$ mã. Mệnh đề a ĐÚNG.

    #step([Chỉ thỏa mãn tiêu chí A])
    $n(A setminus B) = n(A) - n(A inter B) = 400 - 120 = 280$ mã. Mệnh đề b ĐÚNG.

    #step([Không thỏa mãn tiêu chí nào])
    $n(C_U (A union B)) = 1000 - 580 = 420$ mã. Mệnh đề c ĐÚNG.

    #step([Tỷ lệ phần trăm])
    Tỷ lệ: $120 / 580 approx 20.69% != 30%$. Mệnh đề d SAI.
  ]
)

// DS 3 (Khoảng giá trị cảm biến IoT và cảnh báo an toàn)
#ds([Trong một nhà máy hóa chất, một cảm biến nhiệt độ giám sát bồn phản ứng gửi dữ liệu theo thang đo Celsius ($degree C$):
- Dải nhiệt độ an toàn: $A = [20; 80]$.
- Ngưỡng kích hoạt hệ thống làm mát khẩn cấp được lập trình bởi dải nhiệt độ: $B = [m; m + 50]$ (với $m$ là tham số cài đặt hệ thống).
Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Nếu kỹ sư cài đặt $m = 50$ thì dải nhiệt độ vừa thuộc vùng an toàn vừa kích hoạt làm mát là đoạn $[50; 80]$.]),
    True([Hệ thống làm mát không bao giờ bị kích hoạt khi bồn phản ứng ở nhiệt độ an toàn ($A inter B = emptyset$) khi và chỉ khi $m < -30$ hoặc $m > 80$.]),
    True([Để toàn bộ dải nhiệt độ kích hoạt làm mát nằm hoàn toàn trong ngưỡng an toàn ($B subset A$) thì điều kiện là $20 <= m <= 30$.]),
    [Nếu cài đặt $m = 60$ thì hợp của hai dải nhiệt độ $A union B$ có độ dài bằng $100$.]
  ),
  loigiai: [
    #step([Khi m = 50])
    $B = [50; 100]$. Khi đó $A inter B = [20; 80] inter [50; 100] = [50; 80]$. Mệnh đề a ĐÚNG.

    #step([Điều kiện giao bằng rỗng])
    $A inter B = emptyset <=> m + 50 < 20$ hoặc $m > 80 <=> m < -30$ hoặc $m > 80$. Mệnh đề b ĐÚNG.

    #step([Điều kiện B là con của A])
    $B subset A <=> 20 <= m$ và $m + 50 <= 80 <=> 20 <= m <= 30$. Mệnh đề c ĐÚNG.

    #step([Xét độ dài hợp khi m = 60])
    Khi $m = 60$: $B = [60; 110]$. Hợp $A union B = [20; 80] union [60; 110] = [20; 110]$.
    Độ dài đoạn này là $110 - 20 = 90 != 100$. Mệnh đề d SAI.
  ]
)

// DS 4 (Thuật toán định tuyến và phân phối tải mạng Server)
#ds([Một trung tâm dữ liệu điều phối lưu lượng truy cập giữa hai cụm máy chủ (Cluster $1$ và Cluster $2$):
- Cụm $1$ chịu tải tốt khi số kết nối đồng thời $x$ (nghìn kết nối) thuộc khoảng $A = (10; 50]$.
- Cụm $2$ chịu tải tốt khi số kết nối đồng thời $x$ thuộc khoảng $B = [m; 90)$ (với $m < 90$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 30$, nếu lượng kết nối đạt $40$ nghìn thì cả hai cụm máy chủ đều vận hành tốt.]),
    True([Điều kiện cần và đủ để hai cụm máy chủ không có bất kỳ mức tải chung nào ($A inter B = emptyset$) là $m > 50$.]),
    True([Nếu $m = 5$ thì mọi mức tải cụm $1$ chịu được thì cụm $2$ cũng đều chịu được ($A subset B$).]),
    [Khi $m = 50$, giao của hai tập hợp $A inter B$ là một đoạn có độ dài bằng $1$.]
  ),
  loigiai: [
    #step([Khi m = 30])
    Khi $m = 30 => B = [30; 90)$. Mức tải $x = 40 in (10; 50]$ và $40 in [30; 90)$. Mệnh đề a ĐÚNG.

    #step([Điều kiện giao bằng rỗng])
    Vì $m < 90$, $A inter B = emptyset <=> m > 50$. Mệnh đề b ĐÚNG.

    #step([Điều kiện A là con của B])
    Khi $m = 5 => B = [5; 90)$. Rõ ràng $(10; 50] subset [5; 90)$, do đó $A subset B$. Mệnh đề c ĐÚNG.

    #step([Khi m = 50])
    $A inter B = (10; 50] inter [50; 90) = {50}$. Đây là tập hợp gồm đúng $1$ điểm duy nhất, có độ dài bằng $0$ (chứ không phải đoạn có độ dài $1$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Đếm số dòng thỏa mãn truy vấn SQL kết hợp)
#tln([Một bảng cơ sở dữ liệu chứa thông tin của $1500$ đơn hàng thương mại điện tử.
Qua truy vấn ghi nhận:
- Có $950$ đơn hàng đã thanh toán trực tuyến qua thẻ hoặc ví điện tử.
- Có $720$ đơn hàng được giao thành công trong vòng $24$ giờ.
- Có $130$ đơn hàng vừa chưa thanh toán trực tuyến vừa không được giao trong $24$ giờ.
Hỏi có bao nhiêu đơn hàng thỏa mãn đồng thời cả hai tiêu chuẩn: vừa thanh toán trực tuyến vừa được giao thành công trong $24$ giờ?],
    [300],
    loigiai: [
        #step([Tính số đơn hàng thỏa mãn ít nhất một tiêu chuẩn])
        $ n(A union B) = 1500 - 130 = 1370 text(" đơn hàng") $
        
        #step([Tính số đơn hàng thỏa mãn cả hai tiêu chuẩn])
        $ n(A inter B) = n(A) + n(B) - n(A union B) = 950 + 720 - 1370 = 300 text(" đơn hàng") $
    ]
)

// TLN 2 (Khảo sát 3 kỹ năng lập trình AI, Backend, Frontend)
#tln([Một công ty công nghệ khảo sát $120$ ứng viên lập trình viên về ba kỹ năng: Backend ($B$), Frontend ($F$) và Trí tuệ nhân tạo ($A$).
Kết quả tổng hợp:
- $65$ người biết $B$; $55$ người biết $F$; $40$ người biết $A$.
- $25$ người biết cả $B$ và $F$; $20$ người biết cả $B$ và $A$; $15$ người biết cả $F$ và $A$.
- $8$ người thành thạo cả ba kỹ năng trên.
Hỏi có bao nhiêu ứng viên không thành thạo bất kỳ kỹ năng nào trong ba kỹ năng trên?],
    [12],
    loigiai: [
        #step([Tính số ứng viên biết ít nhất một kỹ năng])
        $ n(B union F union A) = 65 + 55 + 40 - (25 + 20 + 15) + 8 = 160 - 60 + 8 = 108 text(" người") $
        
        #step([Tính số người không biết kỹ năng nào])
        $ 120 - 108 = 12 text(" người") $
    ]
)

// TLN 3 (Số ứng viên chỉ thành thạo duy nhất một kỹ năng)
#tln([Từ số liệu của bài toán tuyển dụng trên, hãy tính số lượng ứng viên chỉ thành thạo duy nhất đúng một kỹ năng chuyên môn trong ba kỹ năng $B, F, A$.],
    [64],
    loigiai: [
        #step([Tính số người thành thạo đúng hai kỹ năng])
        $ (25 - 8) + (20 - 8) + (15 - 8) = 17 + 12 + 7 = 36 text(" người") $
        
        #step([Tính số người chỉ thành thạo đúng một kỹ năng])
        $ 108 - 36 - 8 = 64 text(" người") $
    ]
)

// TLN 4 (Tìm giá trị nguyên m để hệ thống tường lửa hoạt động)
#tln([Hệ thống lọc cổng dữ liệu mạng quy định:
Dải cổng cho phép $1$: $A = [20; 80]$.
Dải cổng cho phép $2$: $B = [m; 150]$ (với $m <= 150$).
Để tránh xung đột tài nguyên mạng, quản trị viên yêu cầu hai dải cổng này phải hoàn toàn tách rời nhau ($A inter B = emptyset$).
Tìm giá trị nguyên nhỏ nhất của tham số $m$.],
    [81],
    loigiai: [
        #step([Điều kiện giao bằng rỗng])
        Để $[20; 80] inter [m; 150] = emptyset$ với $m <= 150$, ta phải có:
        $ m > 80 $
        
        #step([Tìm m nguyên nhỏ nhất])
        Vì $m in ZZ$ và $m > 80$ nên giá trị nguyên nhỏ nhất là $m = 81$.
    ]
)

// TLN 5 (Số cách cấp phát quyền hạn người dùng Role-Based Access Control)
#tln([Một hệ thống quản trị phân quyền người dùng (RBAC) có $6$ quyền hạn cơ bản độc lập: ${text("Xem, Thêm, Sửa, Xóa, Phê duyệt, Xuất báo cáo")}$.
Một nhóm người dùng (Role) được định nghĩa bởi một tập hợp con chứa ít nhất $2$ quyền hạn.
Hỏi có thể tạo ra tối đa bao nhiêu nhóm người dùng có các quyền hạn khác nhau?],
    [57],
    loigiai: [
        #step([Tính tổng số tập con])
        Tập hợp có $6$ phần tử có tổng số tập con là $2^6 = 64$.
        
        #step([Trừ các tập con có dưới 2 phần tử])
        - Tập con $0$ phần tử (tập rỗng): $1$ tập.
        - Tập con $1$ phần tử: $6$ tập.
        Số nhóm người dùng có ít nhất $2$ quyền:
        $ 64 - 1 - 6 = 57 text(" nhóm") $
    ]
)

// TLN 6 (Đếm số khách hàng nhận thông báo đẩy Push Notification)
#tln([Một ứng dụng tài chính gửi thông báo đẩy đến $200$ người dùng:
- Có $135$ người mở đọc thông báo về biến động số dư.
- Có $90$ người mở đọc thông báo về chương trình ưu đãi lãi suất tiết kiệm.
- Có $15$ người không mở đọc bất kỳ thông báo nào.
Hỏi có bao nhiêu người dùng đã mở đọc cả hai thông báo trên?],
    [40],
    loigiai: [
        #step([Tính số người mở ít nhất một thông báo])
        $ n(A union B) = 200 - 15 = 185 text(" người") $
        
        #step([Tính số người mở cả hai thông báo])
        $ n(A inter B) = n(A) + n(B) - n(A union B) = 135 + 90 - 185 = 40 text(" người") $
    ]
)

] // end make-questions

#make-questions()
