#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 1",
  exam-title: "BÀI 1: MỆNH ĐỀ TOÁN HỌC (ĐỀ SỐ 2)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "103",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Trong các câu sau, câu nào là một mệnh đề?],
    (
        [Thời tiết hôm nay đẹp quá!],
        [Trời mưa hay nắng?],
        [Hãy làm bài tập về nhà đi!],
        True([Thủ đô của nước Việt Nam là Hà Nội.])
    ),
    loigiai: [
        - "Thời tiết hôm nay đẹp quá!" là câu cảm thán.
        - "Trời mưa hay nắng?" là câu hỏi.
        - "Hãy làm bài tập về nhà đi!" là câu cầu khiến.
        - "Thủ đô của nước Việt Nam là Hà Nội." là câu khẳng định có tính đúng/sai rõ ràng, do đó là một mệnh đề.
    ]
)

// TN 2
#tn([Tìm mệnh đề phủ định của mệnh đề: "$exists x in RR, x^2 + 1 = 0$".],
    (
        [$exists x in RR, x^2 + 1 != 0$],
        [$forall x in RR, x^2 + 1 = 0$],
        True([$forall x in RR, x^2 + 1 != 0$]),
        [$forall x notin RR, x^2 + 1 != 0$]
    ),
    loigiai: [
        Phủ định của ký hiệu tồn tại "$exists$" là mọi "$forall$".
        Phủ định của dấu "$=$" là dấu "$!=$".
        Vậy mệnh đề phủ định là: "$forall x in RR, x^2 + 1 != 0$".
    ]
)

// TN 3
#tn([Mệnh đề nào sau đây là một mệnh đề *sai*?],
    (
        [$forall n in NN, n >= 0$],
        [$exists x in QQ, x = 1/2$],
        True([$forall x in RR, x^2 > 0$]),
        [$exists n in ZZ, n^2 = n$]
    ),
    loigiai: [
        - $forall n in NN, n >= 0$: Đúng vì số tự nhiên luôn không âm.
        - $exists x in QQ, x = 1/2$: Đúng vì $1/2$ là số hữu tỉ.
        - $forall x in RR, x^2 > 0$: *Sai* vì tại $x = 0$ ta có $0^2 = 0$ (không lớn hơn 0).
        - $exists n in ZZ, n^2 = n$: Đúng vì có $n = 0$ hoặc $n = 1$ thỏa mãn.
    ]
)

// TN 4
#tn([Cho mệnh đề $P$: "Số tự nhiên $n$ chia hết cho 4" và mệnh đề $Q$: "Số tự nhiên $n$ chia hết cho 2". Khẳng định nào sau đây là phát biểu của mệnh đề kéo theo $P => Q$?],
    (
        [Nếu $n$ chia hết cho 2 thì $n$ chia hết cho 4.],
        True([Nếu $n$ chia hết cho 4 thì $n$ chia hết cho 2.]),
        [$n$ chia hết cho 4 khi và chỉ khi $n$ chia hết cho 2.],
        [Để $n$ chia hết cho 4, điều kiện cần là $n$ chia hết cho 2.]
    ),
    loigiai: [
        Mệnh đề $P => Q$ được phát biểu là: "Nếu số tự nhiên $n$ chia hết cho 4 thì số tự nhiên $n$ chia hết cho 2".
        Đây là một mệnh đề đúng vì $4$ là bội của $2$.
    ]
)

// TN 5
#tn([Khẳng định nào sau đây là *sai* khi nói về định lý toán học dạng $P => Q$?],
    (
        [$P$ là giả thiết, $Q$ là kết luận của định lý.],
        [$P$ là điều kiện đủ để có $Q$.],
        [$Q$ là điều kiện cần để có $P$.],
        True([$Q$ là điều kiện đủ để có $P$.])
    ),
    loigiai: [
        Trong cấu trúc định lý $P => Q$:
        - $P$ là điều kiện đủ để có $Q$.
        - $Q$ là điều kiện cần để có $P$.
        Do đó, khẳng định "$Q$ là điều kiện đủ để có $P$" là phát biểu sai.
    ]
)

// TN 6
#tn([Cho định lý: "Nếu một tứ giác là hình thoi thì nó có hai đường chéo vuông góc với nhau". Mệnh đề đảo của định lý này là:],
    (
        True([Nếu một tứ giác có hai đường chéo vuông góc với nhau thì nó là hình thoi.]),
        [Nếu một tứ giác không là hình thoi thì nó không có hai đường chéo vuông góc.],
        [Tứ giác là hình thoi là điều kiện đủ để có hai đường chéo vuông góc.],
        [Một tứ giác có hai đường chéo vuông góc với nhau khi và chỉ khi nó là hình thoi.]
    ),
    loigiai: [
        Định lý có dạng $P => Q$. Mệnh đề đảo là $Q => P$.
        Nên mệnh đề đảo là: "Nếu một tứ giác có hai đường chéo vuông góc với nhau thì nó là hình thoi".
    ]
)

// TN 7
#tn([Biết mệnh đề $P$ là ĐÚNG và mệnh đề $Q$ là SAI. Mệnh đề nào sau đây là mệnh đề ĐÚNG?],
    (
        [$P => Q$],
        [$(P text(" và ") Q)$],
        True([$Q => P$]),
        [$P <=> Q$]
    ),
    loigiai: [
        - $P => Q$: Đúng $=>$ Sai, kết quả SAI.
        - $P text(" và ") Q$: Đúng và Sai, kết quả SAI.
        - $Q => P$: Sai $=>$ Đúng, kết quả ĐÚNG.
        - $P <=> Q$: Hai mệnh đề khác tính đúng/sai nên mệnh đề tương đương SAI.
    ]
)

// TN 8 (Kích thích tư duy)
#tn([Hai bạn Mai và Lan cùng giải một bài toán. 
Mai nói: "Bài toán này có nghiệm duy nhất".
Lan nói: "Mai nói sai rồi, bài toán này vô nghiệm".
Biết rằng trong hai bạn có đúng một bạn nói thật. Khẳng định nào sau đây là *sai*?],
    (
        [Nếu Mai nói thật thì bài toán có nghiệm duy nhất.],
        True([Nếu Mai nói dối thì bài toán chắc chắn vô nghiệm.]),
        [Mai và Lan không thể cùng nói thật.],
        [Có thể xảy ra trường hợp bài toán có vô số nghiệm.]
    ),
    loigiai: [
        Nếu Mai nói dối, nghĩa là mệnh đề "Bài toán có nghiệm duy nhất" là sai. Điều đó tương đương với "Bài toán vô nghiệm HOẶC có nhiều hơn 1 nghiệm". 
        Khi đó, Lan nói "Mai nói sai rồi" là sự thật, nhưng ý "bài toán này vô nghiệm" của Lan chưa chắc đã đúng (vì có thể có vô số nghiệm).
        Lưu ý đề bài cho biết "có đúng một bạn nói thật", điều này có nghĩa là câu nói của bạn còn lại phải sai hoàn toàn.
        - Phân tích kỹ: Câu "Mai nói dối thì bài toán CHẮC CHẮN vô nghiệm" là một khẳng định sai, vì bài toán có thể có vô số nghiệm. 
    ]
)

// TN 9
#tn([Mệnh đề nào sau đây là mệnh đề tương đương $P <=> Q$ đúng?],
    (
        [$x = 3 <=> x^2 = 9$ (với $x in RR$)],
        [$Delta A B C text(" vuông tại A") <=> A B^2 + B C^2 = A C^2$],
        True([$x text(" chia hết cho 3 ") <=> text("Tổng các chữ số của ") x text(" chia hết cho 3")$ (với $x in NN$)]),
        [$a > b <=> a^2 > b^2$ (với $a, b in RR$)]
    ),
    loigiai: [
        - $x = 3 <=> x^2 = 9$: Sai vì chiều $x^2 = 9 => x = 3$ không đúng (x có thể bằng -3).
        - Tam giác vuông tại A thì $A B^2 + A C^2 = B C^2$. Biểu thức trong đề bài sai.
        - $x$ chia hết cho 3 $text("<=>")$ Tổng các chữ số chia hết cho 3: Đây là dấu hiệu chia hết cho 3, là một mệnh đề tương đương ĐÚNG.
        - $a > b <=> a^2 > b^2$: Sai nếu $a, b$ là số âm (VD: $1 > -5$ nhưng $1^2 < (-5)^2$).
    ]
)

// TN 10
#tn([Cho mệnh đề chứa biến $P(x)$: "$3x - 1 > 5$". Tìm tất cả các giá trị của $x$ trong tập ${0; 1; 2; 3; 4}$ để $P(x)$ là mệnh đề đúng.],
    (
        [${1; 2; 3; 4}$],
        [${2; 3; 4}$],
        True([${3; 4}$]),
        [${0; 1; 2}$]
    ),
    loigiai: [
        Ta giải bất phương trình: $3x - 1 > 5 <=> 3x > 6 <=> x > 2$.
        Các giá trị $x$ thỏa mãn $x > 2$ trong tập ${0; 1; 2; 3; 4}$ là $3$ và $4$.
    ]
)

// TN 11
#tn([Phủ định của mệnh đề "Tất cả các học sinh lớp 10 đều thích môn Thể dục" là mệnh đề nào sau đây?],
    (
        [Tất cả các học sinh lớp 10 đều không thích môn Thể dục.],
        [Có ít nhất một học sinh lớp 10 thích môn Thể dục.],
        True([Có ít nhất một học sinh lớp 10 không thích môn Thể dục.]),
        [Không có học sinh lớp 10 nào thích môn Thể dục.]
    ),
    loigiai: [
        Mệnh đề gốc có dạng "Mọi $x$, $P(x)$".
        Phủ định của nó có dạng "Tồn tại ít nhất một $x$, không $P(x)$".
        Vậy phủ định là: "Có ít nhất một học sinh lớp 10 không thích môn Thể dục".
    ]
)

// TN 12 (Thực tế logic)
#tn([Một biển báo giao thông ghi: "Nếu xe chở hàng vượt quá 10 tấn thì không được đi qua cầu". Một xe tải chở 8 tấn hàng đi qua cây cầu này. Xét về mặt logic mệnh đề, hành động của chiếc xe tải đó có vi phạm quy định của biển báo không?],
    (
        [Có vi phạm, vì xe chở hàng không được qua cầu.],
        [Có vi phạm, vì biển báo áp dụng cho mọi loại xe tải.],
        True([Không vi phạm (hoặc không bị xét vi phạm bởi biển báo này), vì giả thiết của mệnh đề kéo theo không xảy ra.]),
        [Chắc chắn không vi phạm vì xe tải luôn được qua cầu.]
    ),
    loigiai: [
        Mệnh đề kéo theo $P => Q$ quy định luật lệ chỉ kích hoạt khi giả thiết $P$ ("xe vượt quá 10 tấn") xảy ra.
        Khi $P$ sai (xe chỉ chở 8 tấn), mệnh đề $P => Q$ luôn mang giá trị ĐÚNG về mặt logic bất chấp kết luận $Q$. Tức là luật pháp (biển báo) này không ngăn cấm xe dưới 10 tấn đi qua cầu.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Cho các phát biểu về tính đúng/sai của mệnh đề kéo theo và mệnh đề tương đương:],
  (
    [Mệnh đề $P => Q$ luôn sai nếu $Q$ sai.],
    True([Nếu $P$ sai thì mệnh đề $P => Q$ luôn luôn đúng, bất kể $Q$ đúng hay sai.]),
    True([Mệnh đề $P <=> Q$ đúng khi cả $P$ và $Q$ cùng sai.]),
    [Nếu mệnh đề $P => Q$ sai thì mệnh đề đảo $Q => P$ chắc chắn cũng sai.]
  ),
  loigiai: [
    a) Sai. Nếu $P$ sai và $Q$ sai thì $P => Q$ vẫn đúng. 
    b) Đúng. Trong logic, "Sai $=>$ Bất kỳ" luôn cho kết quả Đúng.
    c) Đúng. Mệnh đề tương đương chỉ yêu cầu $P, Q$ cùng giá trị chân lý.
    d) Sai. Nếu $P => Q$ sai $=> P$ ĐÚNG, $Q$ SAI. Khi đó $Q => P$ là Sai $=>$ Đúng, mệnh đề này là ĐÚNG.
  ]
)

// DS 2
#ds([Xét tính đúng sai của các mệnh đề chứa biến sau đây trên các tập hợp số:],
  (
    [Mệnh đề "$forall x in RR, x^2 - 4x + 4 > 0$" là mệnh đề đúng.],
    True([Mệnh đề "$exists n in NN, n^2 = 2n$" là mệnh đề đúng.]),
    True([Phủ định của mệnh đề "$forall x in QQ, x != sqrt(2)$" là mệnh đề "$exists x in QQ, x = sqrt(2)$".]),
    [Mệnh đề "$exists x in RR, 2x - 1 = 0$" là điều kiện cần để "$exists x in ZZ, 2x - 1 = 0$" đúng.]
  ),
  loigiai: [
    #step([Đánh giá tính đúng sai của từng mệnh đề])
    - a) Sai. Ta có $x^2 - 4x + 4 = (x-2)^2$. Tại $x = 2$, giá trị bằng 0 nên không thể $>0$ với mọi $x$.
    - b) Đúng. Phương trình $n^2 = 2n <=> n = 0$ hoặc $n = 2$. Cả hai nghiệm đều thuộc $NN$.
    - c) Đúng. Phủ định của $forall$ là $exists$, phủ định của $!=$ là $=$.
    - d) Sai. Việc phát biểu sai lệch bản chất. Thực tế "$exists x in ZZ, 2x - 1 = 0$" là mệnh đề SAI (vì $x = 1/2 notin ZZ$). "$exists x in RR, 2x - 1 = 0$" là mệnh đề ĐÚNG. Mệnh đề ĐÚNG không thể là điều kiện cần cho mệnh đề SAI theo cách phát biểu ở đây (dù Logic hình thức cho phép $False => True$).
  ]
)

// DS 3
#ds([Trong một vụ án, thám tử điều tra ba nghi phạm là Hùng, Dũng, và Mạnh. Biết rằng chỉ có đúng một người là thủ phạm và thủ phạm luôn nói dối, còn người vô tội luôn nói thật. Các nghi phạm khai như sau:
- Hùng: "Dũng là thủ phạm".
- Dũng: "Mạnh là thủ phạm".
- Mạnh: "Tôi không phải là thủ phạm".
Xét các suy luận sau:],
  (
    [Dũng và Mạnh có thể cùng nói thật.],
    True([Nếu Hùng là thủ phạm, lời khai của Hùng sẽ là một mệnh đề sai.]),
    [Mạnh là thủ phạm của vụ án.],
    True([Dũng chính là thủ phạm của vụ án.])
  ),
  loigiai: [
    #step([Phân tích logic từng lời khai])
    Ta lập bảng giả định thủ phạm:
    #align(center)[
        #table(
            columns: (auto, auto, auto, auto),
            align: center,
            stroke: 0.5pt + luma(200),
            fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
            [*Giả sử Thủ phạm là*], [*Hùng nói*], [*Dũng nói*], [*Mạnh nói*],
            [Hùng], [Sai (Dũng k phải)], [Sai (Mạnh k phải)], [Đúng],
            [Dũng], [Đúng], [Sai (Mạnh k phải)], [Đúng],
            [Mạnh], [Sai (Dũng k phải)], [Đúng], [Sai (Mạnh đúng là thủ phạm)],
        )
    ]
    #step([So sánh với điều kiện bài toán])
    Bài toán yêu cầu: Thủ phạm nói dối (Sai), người vô tội nói thật (Đúng).
    - Dòng 1 (Hùng là thủ phạm): Hùng nói sai (Khớp), Dũng nói sai (Không khớp, Dũng vô tội phải nói đúng).
    - Dòng 2 (Dũng là thủ phạm): Hùng nói đúng (Khớp), Dũng nói sai (Khớp), Mạnh nói đúng (Khớp).
    - Dòng 3 (Mạnh là thủ phạm): Hùng nói sai (Không khớp, Hùng vô tội phải nói đúng).
    Vậy *Dũng là thủ phạm*.
    
    #step([Kiểm tra các phát biểu])
    a) Sai. Dũng là thủ phạm (nói dối), Mạnh vô tội (nói thật). Không thể cùng nói thật.
    b) Đúng. Thủ phạm luôn nói dối.
    c) Sai.
    d) Đúng.
  ]
)

// DS 4
#ds([Cho tứ giác ABCD. Đặt mệnh đề $P$: "Tứ giác ABCD là hình chữ nhật" và mệnh đề $Q$: "Tứ giác ABCD có hai đường chéo bằng nhau". Xét các mệnh đề sau:],
  (
    [Mệnh đề $P => Q$ là: "Tứ giác ABCD có hai đường chéo bằng nhau là điều kiện đủ để ABCD là hình chữ nhật".],
    True([Mệnh đề đảo $Q => P$ là một mệnh đề sai.]),
    True([Mệnh đề $P => Q$ là một mệnh đề đúng.]),
    [Tứ giác ABCD có hai đường chéo bằng nhau là điều kiện cần và đủ để nó là hình chữ nhật.]
  ),
  loigiai: [
    - a) Sai. Định lý $P => Q$ có nghĩa $P$ là điều kiện đủ để có $Q$. Phát biểu đúng phải là: "ABCD là hình chữ nhật là điều kiện đủ để có hai đường chéo bằng nhau".
    - b) Đúng. Mệnh đề đảo $Q => P$: "Nếu ABCD có hai đường chéo bằng nhau thì nó là hình chữ nhật". Mệnh đề này sai vì hình thang cân cũng có 2 đường chéo bằng nhau.
    - c) Đúng. Thuộc tính của hình chữ nhật.
    - d) Sai. Vì mệnh đề đảo bị sai nên chúng không tương đương (không phải điều kiện cần và đủ).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1
#tln([Có bao nhiêu câu trong đoạn hội thoại dưới đây là mệnh đề toán học?
- Lan: Cậu có biết số 0 có phải là số tự nhiên không?
- Mai: Có chứ, số 0 là số tự nhiên.
- Lan: Thật tuyệt! Thế còn số -5?
- Mai: Số -5 không phải là số tự nhiên, nó là số nguyên âm.
- Lan: Tổng của hai số nguyên âm luôn là một số nguyên âm.],
    [3],
    loigiai: [
        #step([Phân tích từng câu trong đoạn hội thoại])
        1. "Cậu có biết số 0 có phải là số tự nhiên không?" $=>$ Câu hỏi (không phải mệnh đề).
        2. "Số 0 là số tự nhiên." $=>$ Câu khẳng định có tính đúng/sai (Là mệnh đề).
        3. "Thật tuyệt! Thế còn số -5?" $=>$ Câu cảm thán + câu hỏi (không phải mệnh đề).
        4. "Số -5 không phải là số tự nhiên, nó là số nguyên âm." $=>$ Câu khẳng định (Là mệnh đề).
        5. "Tổng của hai số nguyên âm luôn là một số nguyên âm." $=>$ Câu khẳng định Toán học (Là mệnh đề).
        
        #step([Đếm số mệnh đề])
        Vậy có tổng cộng $3$ câu là mệnh đề.
    ]
)

// TLN 2
#tln([Cho mệnh đề chứa biến $P(x)$: "$2x + 1 < 7$". Có bao nhiêu giá trị nguyên dương của $x$ thỏa mãn mệnh đề $P(x)$ là mệnh đề đúng?],
    [2],
    loigiai: [
        #step([Giải bất phương trình chứa biến])
        Ta có: $2x + 1 < 7 <=> 2x < 6 <=> x < 3$.
        
        #step([Tìm các giá trị nguyên dương])
        Vì $x$ nguyên dương ($x in ZZ^+$) nên $x >= 1$.
        Kết hợp điều kiện $x < 3$, ta có các giá trị thỏa mãn là: $x = 1, x = 2$.
        Vậy có $2$ giá trị nguyên dương của $x$ làm cho mệnh đề đúng.
    ]
)

// TLN 3
#tln([Biết mệnh đề $P => Q$ là một mệnh đề SAI. 
Hãy tính số mệnh đề ĐÚNG trong các mệnh đề sau:
(1) $P text(" và ") Q$
(2) $overline(P) => Q$
(3) $P => overline(Q)$
(4) $overline(Q) => overline(P)$
(5) $Q => P$],
    [3],
    loigiai: [
        #step([Xác định chân trị của P và Q])
        Vì $P => Q$ SAI, nên bắt buộc $P$ phải ĐÚNG (True) và $Q$ phải SAI (False).
        Từ đó suy ra $overline(P)$ là Sai, $overline(Q)$ là Đúng.
        
        #step([Đánh giá các mệnh đề phụ])
        - (1) $P text(" và ") Q$: Đúng và Sai $=>$ SAI.
        - (2) $overline(P) => Q$: Sai $=>$ Sai $=>$ ĐÚNG.
        - (3) $P => overline(Q)$: Đúng $=>$ Đúng $=>$ ĐÚNG.
        - (4) $overline(Q) => overline(P)$: Đúng $=>$ Sai $=>$ SAI.
        - (5) $Q => P$: Sai $=>$ Đúng $=>$ ĐÚNG.
        
        #step([Tổng kết])
        Có $3$ mệnh đề đúng là (2), (3) và (5).
    ]
)

// TLN 4
#tln([Một số nguyên dương $n$ được gọi là "số hoàn hảo" nếu mệnh đề sau đúng: "Tổng tất cả các ước số thực sự của $n$ (không kể chính nó) bằng $n$". 
Hỏi trong tập hợp ${4, 6, 8, 10, 12, 28}$, có bao nhiêu số làm cho mệnh đề trên là mệnh đề đúng?],
    [2],
    loigiai: [
        #step([Liệt kê ước số thực sự và tính tổng cho từng số])
        - Với $n=4$: Các ước là 1, 2. Tổng = 3 $!= 4$ (Sai).
        - Với $n=6$: Các ước là 1, 2, 3. Tổng = $1+2+3 = 6$ (Đúng).
        - Với $n=8$: Các ước là 1, 2, 4. Tổng = $7 != 8$ (Sai).
        - Với $n=10$: Các ước là 1, 2, 5. Tổng = $8 != 10$ (Sai).
        - Với $n=12$: Các ước là 1, 2, 3, 4, 6. Tổng = $16 != 12$ (Sai).
        - Với $n=28$: Các ước là 1, 2, 4, 7, 14. Tổng = $1+2+4+7+14 = 28$ (Đúng).
        
        #step([Kết luận])
        Có $2$ số hoàn hảo trong danh sách trên là $6$ và $28$.
    ]
)

// TLN 5
#tln([Cho mệnh đề $P(m)$: "$forall x in RR, 3x - m != 0$". Có bao nhiêu giá trị thực của tham số $m$ để mệnh đề $P(m)$ là ĐÚNG?],
    [0],
    loigiai: [
        #step([Phân tích yêu cầu bài toán])
        Mệnh đề yêu cầu biểu thức $3x - m != 0$ với MỌI số thực $x$.
        Điều này tương đương với phương trình bậc nhất $3x - m = 0$ phải VÔ NGHIỆM trên $RR$.
        
        #step([Kiểm tra nghiệm của phương trình])
        Ta có $3x - m = 0 <=> x = m/3$.
        Vì với bất kỳ giá trị $m$ thực nào, ta cũng luôn tìm được duy nhất một nghiệm thực $x = m/3$ làm cho $3x - m = 0$.
        Do đó, không bao giờ tồn tại giá trị $m$ nào làm cho phương trình vô nghiệm.
        
        #step([Kết luận])
        Vậy có $0$ giá trị của $m$ để mệnh đề ĐÚNG.
    ]
)

// TLN 6 (Tư duy)
#tln([Trong một phòng học có 4 bạn A, B, C, D tham gia giải một bài toán khó. Cuối giờ, giáo viên hỏi ai là người đã giải được bài toán. Các bạn trả lời như sau:
- A nói: "Chỉ một mình B giải được."
- B nói: "Chính D là người giải được."
- C nói: "Em không giải được bài này."
- D nói: "B nói dối."
Biết rằng chỉ có *ĐÚNG MỘT* học sinh nói sự thật, và cũng chỉ có đúng một người giải được bài toán. Hỏi ai là người đã giải được bài toán? (Quy ước: Điền 1 cho A, 2 cho B, 3 cho C, 4 cho D).],
    [3],
    loigiai: [
        #step([Nhận diện cặp mệnh đề mâu thuẫn])
        Câu nói của B ("Chính D giải được") và D ("B nói dối", tức là D không giải được) mâu thuẫn trực tiếp với nhau. 
        Do đó, trong hai người B và D, *chắc chắn có một người nói THẬT và một người nói DỐI*.
        
        #step([Suy luận từ giả thiết "Chỉ có 1 người nói thật"])
        Vì sự thật (có 1 người) đã nằm trọn trong cặp (B, D), suy ra lời của các bạn còn lại (A và C) *BẮT BUỘC PHẢI SAI*.
        
        #step([Phân tích câu nói của C])
        C nói: "Em không giải được bài này."
        Nhưng lời của C là SAI. 
        Phủ định lại $=>$ *C chính là người đã giải được bài toán.*
        
        #align(center)[
            #table(
                columns: 2,
                align: left,
                stroke: 0.5pt + luma(200),
                fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
                [*Học sinh*], [*Người giải được bài tương ứng*],
                [A (Quy ước 1)], [Không],
                [B (Quy ước 2)], [Không],
                [C (Quy ước 3)], [C],
                [D (Quy ước 4)], [Không],
            )
        ]
        (Kiểm tra lại: C giải được $=>$ A dối (vì B k giải), B dối (vì D k giải), C dối (tự nhận k giải), D thật (vì B nói dối). Có đúng 1 người nói thật là D. Hợp lý!).
        Quy ước C tương ứng với số 3. Điền 3.
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
