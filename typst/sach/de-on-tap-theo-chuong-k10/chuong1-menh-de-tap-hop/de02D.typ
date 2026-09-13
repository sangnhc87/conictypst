#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1d4ed8") // Royal Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// HÀM VẼ BIỂU ĐỒ VENN CE-TZ
// ═══════════════════════════════════════════════════════════
#let venn2-box(
  title: "Khảo sát",
  name-a: "Tập A",
  name-b: "Tập B",
  only-a: "0",
  both: "0",
  only-b: "0",
  outside: none,
) = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 6pt,
    fill: rgb("f8fafc"),
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("1e293b"))[#title]
    #v(3pt)
    #cetz.canvas({
      import cetz.draw: *
      // Hình chữ nhật bao U
      rect((-3.0, -1.8), (3.0, 1.8), stroke: 0.8pt + rgb("94a3b8"), fill: rgb("ffffff"))
      content((2.6, 1.5), text(size: 8pt, weight: "bold", fill: rgb("64748b"))[$U$])
      
      // Vòng tròn A
      circle((-0.8, 0), radius: 1.3, fill: rgb("dbeafe"), stroke: 1.2pt + rgb("1d4ed8"))
      content((-1.5, 1.1), text(size: 8.5pt, weight: "bold", fill: rgb("1d4ed8"))[#name-a])
      content((-1.3, 0), text(size: 9pt, weight: "bold")[#only-a])
      
      // Vòng tròn B
      circle((0.8, 0), radius: 1.3, fill: rgb("fee2e2"), stroke: 1.2pt + rgb("b91c1c"))
      content((1.5, 1.1), text(size: 8.5pt, weight: "bold", fill: rgb("b91c1c"))[#name-b])
      content((1.3, 0), text(size: 9pt, weight: "bold")[#only-b])
      
      // Phần giao
      content((0, 0), text(size: 9pt, weight: "bold", fill: rgb("7c3aed"))[#both])
      
      // Bên ngoài
      if outside != none {
        content((-2.2, -1.4), text(size: 8pt, fill: rgb("64748b"))[Bên ngoài: #outside])
      }
    })
  ]
]

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ (ĐỀ D: MÔ HÌNH HÓA VENN, KHẢO SÁT THỊ TRƯỜNG & KINH TẾ SỐ - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "106D",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một sàn thương mại điện tử khảo sát thói quen mua sắm của $100$ khách hàng thân thiết. Kết quả ghi nhận: có $65$ người từng mua hàng trên ứng dụng di động (Tập $A$) và $45$ người từng mua hàng trên trang web máy tính (Tập $B$). Biết rằng có $25$ người sử dụng cả hai kênh mua sắm này. Số khách hàng đã từng mua sắm trên ít nhất một trong hai kênh là],
    (
        True([$85$ người]),
        [$110$ người],
        [$80$ người],
        [$75$ người]
    ),
    loigiai: [
        Áp dụng công thức lực lượng hợp của hai tập hợp:
        $ n(A union B) = n(A) + n(B) - n(A cap B) = 65 + 45 - 25 = 85 text(" người") $
    ]
)

// TN 2
#tn([Một công ty viễn thông cung cấp hai gói dịch vụ gia tăng: Gói Data 4G/5G (Tập $D$) và Gói Truyền hình số (Tập $T$). Khảo sát $120$ hộ gia đình cho kết quả: có $80$ hộ đăng ký Gói Data, $50$ hộ đăng ký Gói Truyền hình, và $20$ hộ không đăng ký bất kỳ gói dịch vụ nào. Số hộ gia đình đăng ký đồng thời cả hai gói dịch vụ là],
    (
        True([$30$ hộ]),
        [$20$ hộ],
        [$10$ hộ],
        [$40$ hộ]
    ),
    loigiai: [
        Số hộ gia đình đăng ký ít nhất một gói dịch vụ:
        $ n(D union T) = 120 - 20 = 100 text(" hộ") $
        Số hộ đăng ký đồng thời cả hai gói:
        $ n(D cap T) = n(D) + n(T) - n(D union T) = 80 + 50 - 100 = 30 text(" hộ") $
    ]
)

// TN 3
#tn([Biểu đồ Venn dưới đây mô tả kết quả khảo sát $60$ sinh viên về hai ứng dụng gọi xe công nghệ $G$ (Grab) và $B$ (Be):
#venn2-box(
  title: "Khảo sát ứng dụng gọi xe",
  name-a: "Ứng dụng G",
  name-b: "Ứng dụng B",
  only-a: "22",
  both: "18",
  only-b: "15",
  outside: "5",
)
Số sinh viên chỉ cài đặt và sử dụng duy nhất một ứng dụng gọi xe là],
    (
        True([$37$ sinh viên]),
        [$40$ sinh viên],
        [$18$ sinh viên],
        [$55$ sinh viên]
    ),
    loigiai: [
        Từ biểu đồ Venn:
        - Số sinh viên chỉ sử dụng ứng dụng G: $22$.
        - Số sinh viên chỉ sử dụng ứng dụng B: $15$.
        Số sinh viên chỉ dùng duy nhất một ứng dụng:
        $ 22 + 15 = 37 text(" sinh viên") $
    ]
)

// TN 4
#tn([Trong quản trị nhân sự của một tập đoàn công nghệ, gọi $E$ là tập hợp tất cả nhân viên biết lập trình, và $A$ là tập hợp tất cả các kỹ sư chuyên ngành Trí tuệ nhân tạo (AI). Mệnh đề nào sau đây diễn tả đúng thực tế "Tất cả các kỹ sư AI đều biết lập trình"?],
    (
        True([$A subset E$]),
        [$E subset A$],
        [$A cap E = emptyset$],
        [$A union E = emptyset$]
    ),
    loigiai: [
        Vì mọi phần tử thuộc tập $A$ đều là phần tử của tập $E$, nên theo định nghĩa tập con ta có $A subset E$.
    ]
)

// TN 5
#tn([Một chuỗi rạp chiếu phim phát hành phiếu khảo sát khán giả. Khảo sát $50$ người xem phim cuối tuần thu được: $30$ người thích thể loại Hành động, $25$ người thích thể loại Hoạt hình, và $10$ người thích cả hai thể loại. Số người không thích thể loại nào trong hai thể loại trên là],
    (
        True([$5$ người]),
        [$15$ người],
        [$10$ người],
        [$0$ người]
    ),
    loigiai: [
        Số người thích ít nhất một thể loại:
        $ n(A union B) = 30 + 25 - 10 = 45 text(" người") $
        Số người không thích thể loại nào:
        $ 50 - 45 = 5 text(" người") $
    ]
)

// TN 6
#tn([Cho tập hợp $U$ là toàn bộ $200$ khách hàng tiềm năng nhận được email tiếp thị. Gọi $A$ là tập hợp các khách hàng đã mở email đọc thông tin, biết rằng $n(A) = 75$. Số lượng khách hàng thuộc tập phần bù $C_U A$ (chưa từng mở email) bằng],
    (
        True([$125$ khách hàng]),
        [$75$ khách hàng],
        [$100$ khách hàng],
        [$150$ khách hàng]
    ),
    loigiai: [
        Phần bù $C_U A = U setminus A$.
        $ n(C_U A) = n(U) - n(A) = 200 - 75 = 125 text(" khách hàng") $
    ]
)

// TN 7
#tn([Một quán trà sữa thiết kế menu các gói combo gồm các loại thạch tự chọn (Topping) từ tập hợp gồm $4$ loại topping khác nhau: ${text("Trân châu đen, Trân châu trắng, Thạch nha đam, Thạch phô mai")}$. Số lượng các cách phối hợp combo topping khác nhau mà quán có thể tạo ra (kể cả trường hợp không chọn topping nào) bằng],
    (
        True([$16$ cách]),
        [$8$ cách],
        [$15$ cách],
        [$12$ cách]
    ),
    loigiai: [
        Số cách chọn tập hợp con của tập gồm $n = 4$ phần tử là:
        $ 2^n = 2^4 = 16 text(" tập con") $
    ]
)

// TN 8
#tn([Một đại lý vé máy bay ghi nhận khung giá vé khuyến mãi của hai hãng hàng không trong mùa du lịch:
- Hãng $V$: Khoảng giá $A = [1.2; 2.8]$ (triệu đồng).
- Hãng $B$: Khoảng giá $B = [1.8; 3.5]$ (triệu đồng).
Tập hợp các mức giá mà khách hàng có thể lựa chọn vé của cả hai hãng hàng không ($A cap B$) là],
    (
        True([$[1.8; 2.8]$ (triệu đồng)]),
        [$[1.2; 3.5]$ (triệu đồng)],
        [$[1.2; 1.8]$ (triệu đồng)],
        [$[2.8; 3.5]$ (triệu đồng)]
    ),
    loigiai: [
        Giao của hai đoạn:
        $ [1.2; 2.8] cap [1.8; 3.5] = [max(1.2, 1.8); min(2.8, 3.5)] = [1.8; 2.8] $
    ]
)

// TN 9
#tn([Thời gian hoạt động hàng ngày của hai trung tâm thương mại lân cận là:
- Trung tâm $X$: từ $8$ giờ đến $22$ giờ, biểu diễn bởi nửa khoảng $A = [8; 22)$.
- Trung tâm $Y$: từ $9$ giờ đến $23$ giờ, biểu diễn bởi nửa khoảng $B = [9; 23)$.
Tập hợp các mốc thời gian trong ngày mà ít nhất một trung tâm thương mại mở cửa đón khách ($A union B$) là],
    (
        True([$[8; 23)$]),
        [$[9; 22)$],
        [$[8; 22)$],
        [$[9; 23)$]
    ),
    loigiai: [
        Hợp của hai nửa khoảng:
        $ [8; 22) union [9; 23) = [min(8, 9); max(22, 23)) = [8; 23) $
    ]
)

// TN 10
#tn([Một hệ thống ngân hàng phân loại rủi ro tín dụng của các khoản vay dựa trên thang điểm từ $0$ đến $100$:
- Tập hợp các khoản vay có rủi ro thấp: $A = [0; 40]$.
- Tập hợp các khoản vay cần thẩm định lại: $B = (30; 70]$.
Tập hợp các khoản vay thuộc diện $B setminus A$ (cần thẩm định lại nhưng không thuộc nhóm rủi ro thấp) là],
    (
        True([$(40; 70]$]),
        [$[30; 40]$],
        [$(30; 40)$],
        [$[40; 70]$]
    ),
    loigiai: [
        $ B setminus A = (30; 70] setminus [0; 40] = (40; 70] $
    ]
)

// TN 11
#tn([Khảo sát $40$ chuyên viên phân tích dữ liệu, ghi nhận có $28$ người thành thạo ngôn ngữ Python và $20$ người thành thạo ngôn ngữ SQL. Biết rằng mỗi chuyên viên đều thành thạo ít nhất một trong hai ngôn ngữ này. Số người thành thạo cả hai ngôn ngữ Python và SQL là],
    (
        True([$8$ người]),
        [$10$ người],
        [$12$ người],
        [$6$ người]
    ),
    loigiai: [
        Vì mỗi người thành thạo ít nhất một ngôn ngữ nên $n(A union B) = 40$.
        $ n(A cap B) = n(A) + n(B) - n(A union B) = 28 + 20 - 40 = 8 text(" người") $
    ]
)

// TN 12
#tn([Một phòng trưng bày sản phẩm thông minh trưng bày $n$ sản phẩm. Biết rằng số tập con gồm đúng $2$ sản phẩm mà khách hàng có thể chọn dùng thử là $6$. Số lượng sản phẩm $n$ đang trưng bày bằng],
    (
        True([$n = 4$]),
        [$n = 3$],
        [$n = 5$],
        [$n = 6$]
    ),
    loigiai: [
        Số tập con gồm 2 phần tử chọn từ $n$ phần tử là:
        $ (n(n-1)) / 2 = 6 <=> n(n-1) = 12 <=> n^2 - n - 12 = 0 <=> n = 4 $ (vì $n in NN^*$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích thị trường 3 nền tảng thương mại điện tử)
#ds([Một viện nghiên cứu kinh tế số khảo sát hành vi tiêu dùng của $100$ hộ gia đình về việc mua sắm trên ba nền tảng thương mại điện tử: Shopee ($S$), Lazada ($L$) và TikTok Shop ($T$).
Kết quả tổng hợp chi tiết như sau:
- Có $55$ hộ mua trên Shopee; $45$ hộ mua trên Lazada; $40$ hộ mua trên TikTok Shop.
- Có $25$ hộ mua trên cả Shopee và Lazada; $20$ hộ mua trên cả Shopee và TikTok Shop; $15$ hộ mua trên cả Lazada và TikTok Shop.
- Có $10$ hộ gia đình mua sắm trên cả ba nền tảng trên.
Xét tính đúng sai của các nhận định thống kê sau:],
  (
    True([Số hộ gia đình đã từng mua sắm trên ít nhất một trong ba nền tảng trên là $90$ hộ.]),
    True([Có đúng $10$ hộ gia đình trong nhóm khảo sát chưa từng mua sắm trên bất kỳ nền tảng nào trong ba nền tảng này.]),
    True([Số hộ gia đình chỉ mua sắm duy nhất trên nền tảng Shopee là $20$ hộ.]),
    [Số hộ gia đình mua sắm trên đúng hai nền tảng bất kỳ là $60$ hộ.]
  ),
  loigiai: [
    #step([Lực lượng hợp của 3 tập hợp])
    $n(S union L union T) = n(S) + n(L) + n(T) - [n(S cap L) + n(S cap T) + n(L cap T)] + n(S cap L cap T)$
    $= 55 + 45 + 40 - (25 + 20 + 15) + 10 = 140 - 60 + 10 = 90$ hộ. Mệnh đề a ĐÚNG.

    #step([Số hộ không mua trên nền tảng nào])
    $100 - n(S union L union T) = 100 - 90 = 10$ hộ. Mệnh đề b ĐÚNG.

    #step([Số hộ chỉ mua trên Shopee])
    - Chỉ mua Shopee và Lazada (không mua TikTok): $25 - 10 = 15$ hộ.
    - Chỉ mua Shopee và TikTok (không mua Lazada): $20 - 10 = 10$ hộ.
    - Mua cả ba: $10$ hộ.
    Số hộ chỉ mua duy nhất Shopee:
    $55 - (15 + 10 + 10) = 55 - 35 = 20$ hộ. Mệnh đề c ĐÚNG.

    #step([Số hộ mua trên đúng hai nền tảng])
    Gồm: (chỉ S và L) + (chỉ S và T) + (chỉ L và T)
    $= (25 - 10) + (20 - 10) + (15 - 10) = 15 + 10 + 5 = 30$ hộ.
    Khẳng định $60$ hộ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Tối ưu hóa tệp đối tượng khách hàng mục tiêu Target Audience)
#ds([Một chuyên gia tiếp thị số (Digital Marketing) cấu hình tệp khách hàng quảng cáo trên mạng xã hội theo độ tuổi (tính theo năm):
- Nhóm đối tượng $A$: Người dùng từ $18$ đến $35$ tuổi, biểu diễn bởi đoạn $A = [18; 35]$.
- Nhóm đối tượng $B$: Người dùng có hành vi mua sắm online thường xuyên có độ tuổi từ $m$ đến $m+15$, biểu diễn bởi đoạn $B = [m; m+15]$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu chọn $m = 20$ thì tệp đối tượng chung của cả hai nhóm $A cap B$ là đoạn $[20; 35]$.]),
    True([Hai nhóm đối tượng $A$ và $B$ không có người dùng chung ($A cap B = emptyset$) khi và chỉ khi $m < 3$ hoặc $m > 35$.]),
    True([Để nhóm khách hàng $B$ nằm hoàn toàn trong nhóm khách hàng $A$ ($B subset A$) thì điều kiện của tham số là $18 <= m <= 20$.]),
    [Với mọi giá trị $m in RR$, hợp của hai nhóm đối tượng $A union B$ luôn là một đoạn duy nhất có độ dài bằng $32$.]
  ),
  loigiai: [
    #step([Trường hợp m = 20])
    Khi $m = 20 => B = [20; 35]$.
    $A cap B = [18; 35] cap [20; 35] = [20; 35]$. Mệnh đề a ĐÚNG.

    #step([Điều kiện để A giao B bằng rỗng])
    $A cap B = emptyset <=> m + 15 < 18$ hoặc $m > 35 <=> m < 3$ hoặc $m > 35$. Mệnh đề b ĐÚNG.

    #step([Điều kiện B là con của A])
    $B subset A <=> 18 <= m$ và $m + 15 <= 35 <=> 18 <= m <= 20$. Mệnh đề c ĐÚNG.

    #step([Nhận định về hợp hai tập])
    Khi $m < 3$ hoặc $m > 35$, $A$ và $B$ là hai đoạn rời nhau nên $A union B$ không thể là một đoạn duy nhất. Mệnh đề d SAI.
  ]
)

// DS 3 (Tiêu chuẩn chất lượng xuất khẩu hàng hóa)
#ds([Một công ty nông sản xuất khẩu kiểm định chất lượng $100$ tấn sầu riêng theo hai tiêu chuẩn:
- Tiêu chuẩn $V$ (VietGAP): Có $70$ tấn đạt chuẩn.
- Tiêu chuẩn $G$ (GlobalGAP): Có $60$ tấn đạt chuẩn.
Biết rằng tất cả $100$ tấn sầu riêng đều đạt ít nhất một trong hai tiêu chuẩn trên.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số tấn sầu riêng đạt đồng thời cả hai tiêu chuẩn VietGAP và GlobalGAP là $30$ tấn.]),
    True([Số tấn sầu riêng chỉ đạt duy nhất chuẩn VietGAP mà không đạt GlobalGAP là $40$ tấn.]),
    True([Số tấn sầu riêng chỉ đạt duy nhất chuẩn GlobalGAP mà không đạt VietGAP là $30$ tấn.]),
    [Số tấn sầu riêng chỉ đạt một tiêu chuẩn bất kỳ chiếm $60%$ tổng sản lượng xuất khẩu.]
  ),
  loigiai: [
    #step([Lực lượng giao của hai tập])
    Vì toàn bộ $100$ tấn đều đạt ít nhất một chuẩn nên $n(V union G) = 100$.
    $n(V cap G) = n(V) + n(G) - n(V union G) = 70 + 60 - 100 = 30$ tấn. Mệnh đề a ĐÚNG.

    #step([Chỉ đạt VietGAP])
    $n(V setminus G) = n(V) - n(V cap G) = 70 - 30 = 40$ tấn. Mệnh đề b ĐÚNG.

    #step([Chỉ đạt GlobalGAP])
    $n(G setminus V) = n(G) - n(V cap G) = 60 - 30 = 30$ tấn. Mệnh đề c ĐÚNG.

    #step([Tỷ lệ chỉ đạt một chuẩn])
    Tổng sản lượng chỉ đạt 1 chuẩn: $40 + 30 = 70$ tấn, chiếm $70% != 60%$. Mệnh đề d SAI.
  ]
)

// DS 4 (Tập hợp khách hàng VIP và phân khúc doanh thu)
#ds([Một hệ thống bán lẻ phân loại khách hàng VIP theo doanh số mua hàng hàng năm $x$ (triệu đồng):
- Hạng Bạc (Tập $A$): Khách hàng có $x in (20; 60]$.
- Hạng Vàng (Tập $B$): Khách hàng có $x in [m; 100]$ (với $m$ là ngưỡng doanh số xét hạng Vàng).
Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Nếu quy định ngưỡng $m = 40$ triệu đồng thì tập khách hàng vừa đủ chuẩn Hạng Bạc vừa đủ chuẩn Hạng Vàng là nửa khoảng $(40; 60]$. Khoan: $x in [40; 100]$ và $(20; 60] => [40; 60]$. Sửa lại: Nếu quy định ngưỡng $m = 40$ triệu đồng thì tập khách hàng vừa đủ chuẩn Hạng Bạc vừa đủ chuẩn Hạng Vàng là đoạn $[40; 60]$.]),
    True([Để không có bất kỳ khách hàng nào bị trùng lặp giữa hai hạng Bạc và Vàng ($A cap B = emptyset$) thì điều kiện là $m > 60$.]),
    True([Nếu $m = 10$ thì toàn bộ khách hàng Hạng Bạc đều mặc nhiên thỏa mãn chuẩn Hạng Vàng ($A subset B$).]),
    [Với mọi giá trị $m > 0$, hiệu hai tập hợp $B setminus A$ luôn luôn là một khoảng rỗng.]
  ),
  loigiai: [
    #step([Khi m = 40])
    $A cap B = (20; 60] cap [40; 100] = [40; 60]$. Mệnh đề a ĐÚNG.

    #step([Điều kiện giao bằng rỗng])
    $A cap B = emptyset <=> m > 60$. Mệnh đề b ĐÚNG.

    #step([Điều kiện A là con của B])
    Khi $m = 10$: $B = [10; 100]$. Vì $(20; 60] subset [10; 100]$ nên $A subset B$. Mệnh đề c ĐÚNG.

    #step([Xét hiệu B trừ A])
    Khi $m = 40$: $B setminus A = [40; 100] setminus (20; 60] = (60; 100] != emptyset$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tính số khách hàng mua cả 2 loại vé)
#tln([Một khu vui chơi giải trí bán được $500$ vé trong ngày khai trương: có $320$ khách mua vé vào Công viên nước, $260$ khách mua vé vào Khu vui chơi cảm giác mạnh.
Biết rằng mỗi khách mua vé đều tham gia ít nhất một trong hai khu.
Hỏi có bao nhiêu khách hàng mua vé trọn gói cả hai khu vui chơi?],
    [80],
    loigiai: [
        #step([Lực lượng giao hai tập hợp])
        $ n(A cap B) = n(A) + n(B) - n(A union B) = 320 + 260 - 500 = 80 text(" khách hàng") $
    ]
)

// TLN 2 (Khảo sát 3 sản phẩm gia dụng thông minh)
#tln([Một cuộc khảo sát $100$ người tiêu dùng về việc sở hữu ba thiết bị gia đình: Robot hút bụi ($R$), Nồi chiên không dầu ($N$) và Máy rửa bát ($M$).
Kết quả cho thấy:
- Có $50$ người sở hữu $R$; $45$ người sở hữu $N$; $40$ người sở hữu $M$.
- Có $20$ người sở hữu cả $R$ và $N$; $15$ người sở hữu cả $R$ và $M$; $15$ người sở hữu cả $N$ và $M$.
- Có $5$ người sở hữu cả ba thiết bị.
Hỏi có bao nhiêu người không sở hữu bất kỳ thiết bị nào trong ba thiết bị trên?],
    [10],
    loigiai: [
        #step([Tính số người sở hữu ít nhất một thiết bị])
        $ n(R union N union M) = 50 + 45 + 40 - (20 + 15 + 15) + 5 = 135 - 50 + 5 = 90 text(" người") $
        
        #step([Tính số người không sở hữu thiết bị nào])
        $ 100 - 90 = 10 text(" người") $
    ]
)

// TLN 3 (Số khách hàng chỉ sở hữu đúng 1 thiết bị)
#tln([Từ số liệu của câu hỏi trên, hãy tính số người tiêu dùng chỉ sở hữu duy nhất đúng một thiết bị thông minh trong ba thiết bị $R, N, M$.],
    [50],
    loigiai: [
        #step([Tính số người sở hữu đúng hai thiết bị])
        $ (20 - 5) + (15 - 5) + (15 - 5) = 15 + 10 + 10 = 35 text(" người") $
        
        #step([Tính số người chỉ sở hữu đúng một thiết bị])
        Lấy tổng số người có thiết bị trừ đi số người có 2 thiết bị và số người có cả 3 thiết bị:
        $ 90 - 35 - 5 = 50 text(" người") $
    ]
)

// TLN 4 (Tìm tham số m để hai khoảng thời gian không trùng nhau)
#tln([Hai ca làm việc của nhà máy được bố trí theo các khoảng thời gian (giờ):
Ca $1$: $A = [7; 15]$.
Ca $2$: $B = [m; 22]$ (với $m < 22$).
Tìm giá trị nguyên nhỏ nhất của $m$ để hai ca làm việc không có bất kỳ khoảng thời gian giao thoa nào ($A cap B = emptyset$).],
    [16],
    loigiai: [
        #step([Điều kiện giao bằng rỗng])
        Để $[7; 15] cap [m; 22] = emptyset$ với $m < 22$, ta phải có:
        $ m > 15 $
        
        #step([Tìm số nguyên m nhỏ nhất])
        Vì $m in ZZ$ và $m > 15$ nên giá trị nguyên nhỏ nhất của $m$ là $m = 16$.
    ]
)

// TLN 5 (Số cách tạo combo món ăn)
#tln([Một nhà hàng tiệc cưới cho phép khách hàng chọn các món tráng miệng từ một danh sách gồm $5$ món khác nhau.
Khách hàng bắt buộc phải chọn một combo có ít nhất $1$ món tráng miệng.
Hỏi có bao nhiêu cách chọn combo món tráng miệng khác nhau?],
    [31],
    loigiai: [
        #step([Tính số tập con khác rỗng])
        Tổng số tập con của tập hợp có $5$ phần tử là $2^5 = 32$.
        Trừ đi tập rỗng (không chọn món nào):
        $ 2^5 - 1 = 32 - 1 = 31 text(" cách") $
    ]
)

// TLN 6 (Khảo sát ngoại ngữ nhân viên công ty đa quốc gia)
#tln([Một công ty đa quốc gia có $60$ nhân viên: có $42$ nhân viên biết Tiếng Anh và $30$ nhân viên biết Tiếng Trung.
Biết rằng có $5$ nhân viên không biết cả hai ngoại ngữ này.
Hỏi có bao nhiêu nhân viên thành thạo cả hai thứ tiếng Anh và Trung?],
    [17],
    loigiai: [
        #step([Tính số nhân viên biết ít nhất một thứ tiếng])
        $ n(E union C) = 60 - 5 = 55 text(" nhân viên") $
        
        #step([Tính số nhân viên biết cả hai ngoại ngữ])
        $ n(E cap C) = n(E) + n(C) - n(E union C) = 42 + 30 - 55 = 17 text(" nhân viên") $
    ]
)

] // end make-questions

#make-questions()
