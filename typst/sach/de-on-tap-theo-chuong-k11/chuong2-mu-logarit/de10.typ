#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.equation.where(block: true): it => math.display(it.body)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 10 - TỔNG HỢP TOÁN THỰC TẾ)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Định luật Moore trong ngành vi mạch điện tử cho rằng số lượng transistor trên một vi mạch tích hợp (IC) sẽ tăng gấp đôi sau mỗi $2$ năm. Nếu vào năm 1971, bộ vi xử lý Intel 4004 chứa $2300$ transistor, dự đoán theo Định luật Moore thì đến năm 2011 số lượng transistor trên một vi mạch tương tự sẽ xấp xỉ bằng bao nhiêu?],
    (
        [$1.8$ triệu.],
        [$2.4$ triệu.],
        True([$2.4$ tỉ.]),
        [$3.0$ tỉ.]
    ),
    loigiai: [
        Chu kì là $T = 2$ năm. Số năm từ 1971 đến 2011 là $t = 2011 - 1971 = 40$ năm.
        Số lượng transistor theo mô hình:
        $
          N(40) = N_0 dot 2^(t/T) = 2300 dot 2^(40/2) = 2300 dot 2^20
        $
        Ta có $2^10 = 1024 approx 10^3$, $2^20 approx 10^6$. Tính chính xác: $2^20 = 1 048 576$.
        $
          N(40) = 2300 dot 1 048 576 approx 2 411 724 800 approx 2.4 " (tỉ)"
        $
    ]
)

// TN 2
#tn([Trong một phòng thí nghiệm tâm lý, các nhà khoa học đã xây dựng một hàm biểu diễn "đường cong học tập" của một công nhân sản xuất: $P(t) = P_"max" (1 - e^(-c t))$, với $P(t)$ là số sản phẩm làm được trong một giờ sau $t$ tuần được đào tạo, $P_"max" = 100$ là mức năng suất tối đa, và $c$ là hệ số học tập. Biết sau $4$ tuần, công nhân làm được $60$ sản phẩm/giờ. Sau $12$ tuần, công nhân này sẽ làm được khoảng bao nhiêu sản phẩm/giờ?],
    (
        [$78$ sản phẩm.],
        [$84$ sản phẩm.],
        True([$93$ sản phẩm.]),
        [$98$ sản phẩm.]
    ),
    loigiai: [
        Ta có: $100(1 - e^(-4 c)) = 60 <=> 1 - e^(-4 c) = 0.6 <=> e^(-4 c) = 0.4$.
        Năng suất sau $12$ tuần:
        $
          P(12) = 100(1 - e^(-12 c)) = 100(1 - (e^(-4 c))^3)
        $
        Thay $e^(-4 c) = 0.4$ vào:
        $
          P(12) = 100(1 - 0.4^3) = 100(1 - 0.064) = 100 dot 0.936 = 93.6
        $
        Khoảng $93$ sản phẩm.
    ]
)

// TN 3
#tn([Nồng độ cồn $C$ (mg/100ml máu) trong cơ thể một người sau $t$ giờ (kể từ lúc ngừng uống rượu) giảm theo mô hình $C(t) = C_0 e^(-k t)$. Lúc 22h, người đó có nồng độ cồn là $80$ mg/100ml. Đến 24h cùng ngày, nồng độ cồn giảm còn $50$ mg/100ml. Cảnh sát giao thông quy định người lái xe phải có nồng độ cồn dưới $10$ mg/100ml. Hỏi sau ít nhất bao nhiêu giờ (tính từ 22h) người đó mới đủ điều kiện lái xe?],
    (
        [$6.2$ giờ.],
        True([$8.8$ giờ.]),
        [$10.5$ giờ.],
        [$12.0$ giờ.]
    ),
    loigiai: [
        Từ 22h đến 24h là $2$ giờ ($t=2$). Ta có:
        $
          80 e^(-2 k) = 50 <=> e^(-2 k) = 5/8
        $
        Cần tìm $t$ sao cho:
        $
          80 e^(-k t) < 10 <=> e^(-k t) < 1/8 <=> (e^(-2 k))^(t/2) < 1/8
        $
        $
          (5/8)^(t/2) < 1/8 <=> t/2 > log_(5/8) (1/8) = (ln(1/8)) / (ln(5/8)) approx (-2.079) / (-0.470) approx 4.42
        $
        $
          => t > 8.84 " (giờ)"
        $
        Vậy cần ít nhất khoảng $8.8$ giờ.
    ]
)

// TN 4
#tn([Một con ếch được thả vào nồi nước đang đun. Nhiệt độ của nước $T$ ($""^circ "C"$) theo thời gian $t$ (phút) tuân theo định luật $T(t) = 20 + 80(1 - e^(-0.05 t))$. Biết rằng ếch sẽ chết nếu nhiệt độ nước đạt tới $70""^circ "C"$. Mất bao lâu để con ếch trong nồi bị luộc chín? (Làm tròn đến một chữ số thập phân).],
    (
        [$15.5$ phút.],
        [$17.8$ phút.],
        True([$19.6$ phút.]),
        [$22.0$ phút.]
    ),
    loigiai: [
        Ta giải phương trình:
        $
          20 + 80(1 - e^(-0.05 t)) = 70 <=> 80(1 - e^(-0.05 t)) = 50
        $
        $
          <=> 1 - e^(-0.05 t) = 5/8 = 0.625 <=> e^(-0.05 t) = 0.375
        $
        $
          <=> -0.05 t = ln 0.375 <=> t = (ln 0.375) / (-0.05) approx (-0.9808) / (-0.05) approx 19.6 " (phút)"
        $
    ]
)

// TN 5
#tn([Một khách hàng mua thẻ thành viên tập Gym trị giá $10$ triệu đồng bằng thẻ tín dụng. Ngân hàng tính lãi suất $1.5\%$/tháng theo hình thức lãi kép đối với dư nợ tín dụng. Khách hàng dự định mỗi tháng sẽ trả đúng $1$ triệu đồng vào cuối tháng. Thời gian để khách hàng trả hết nợ (làm tròn lên thành số tháng nguyên) là bao nhiêu?],
    (
        [$10$ tháng.],
        True([$11$ tháng.]),
        [$12$ tháng.],
        [$13$ tháng.]
    ),
    loigiai: [
        Bài toán vay trả góp với $P=10, a=1, r=0.015$.
        $
          P(1+r)^n = a/r [(1+r)^n - 1] <=> 10(1.015)^n = 1/0.015 [(1.015)^n - 1]
        $
        $
          <=> 10(1.015)^n = 200/3 (1.015)^n - 200/3 <=> (200/3 - 10)(1.015)^n = 200/3
        $
        $
          <=> 170/3 (1.015)^n = 200/3 <=> (1.015)^n = 200/170 = 20/17
        $
        $
          <=> n = log_1.015 (20/17) = (ln(20/17)) / (ln 1.015) approx 0.1625 / 0.01489 approx 10.9
        $
        Vì phải đóng theo tháng nên cần $11$ tháng để trả dứt điểm (tháng cuối đóng ít hơn $1$ triệu).
    ]
)

// TN 6
#tn([Áp suất khí quyển ở độ cao $h$ km (so với mặt nước biển) là $P = 760 e^(-0.12 h)$ (mmHg). Nếu không có thiết bị hỗ trợ hô hấp, con người sẽ gặp nguy hiểm nếu áp suất không khí giảm xuống dưới $400$ mmHg. Độ cao an toàn tối đa mà con người có thể leo lên là khoảng bao nhiêu?],
    (
        [$4.5$ km.],
        True([$5.3$ km.]),
        [$6.0$ km.],
        [$6.8$ km.]
    ),
    loigiai: [
        Ta cần giải $P >= 400$:
        $
          760 e^(-0.12 h) >= 400 <=> e^(-0.12 h) >= 400 / 760 = 10 / 19
        $
        $
          <=> -0.12 h >= ln(10/19) <=> h <= (ln(10/19)) / (-0.12) approx (-0.6418) / (-0.12) = 5.348 " (km)"
        $
        Khoảng $5.3$ km.
    ]
)

// TN 7
#tn([Một vùng biển bị tràn dầu. Tốc độ loang của vệt dầu $A'(t)$ giảm dần theo thời gian và tuân theo $A'(t) = 200 e^(-0.1 t)$ ($"m"^2$/giờ). Nếu ban đầu ($t=0$) diện tích vệt dầu là $1000$" m"^2, tìm hàm số biểu diễn diện tích vệt dầu $A(t)$ sau $t$ giờ.],
    (
        [$A(t) = 1000 + 2000 e^(-0.1 t)$.],
        True([$A(t) = 3000 - 2000 e^(-0.1 t)$.]),
        [$A(t) = 1000 - 200(1 - e^(-0.1 t))$.],
        [$A(t) = 2000 - 1000 e^(-0.1 t)$.]
    ),
    loigiai: [
        $A(t)$ là một nguyên hàm của $A'(t)$:
        $
          A(t) = integral 200 e^(-0.1 t) "d"t = 200 / (-0.1) e^(-0.1 t) + C = -2000 e^(-0.1 t) + C
        $
        Tại $t = 0$: $A(0) = -2000 e^0 + C = 1000 => -2000 + C = 1000 => C = 3000$.
        Vậy $A(t) = 3000 - 2000 e^(-0.1 t)$.
    ]
)

// TN 8
#tn([Trong y học, lượng chất cản quang tồn đọng trong cơ thể sau một cuộc kiểm tra giảm theo mô hình phân rã lũy thừa. Sau $1$ ngày, lượng chất còn $80\%$. Hàm lượng chất sẽ giảm xuống dưới mức $5\%$ an toàn sau ít nhất bao nhiêu ngày?],
    (
        [$10$ ngày.],
        True([$14$ ngày.]),
        [$18$ ngày.],
        [$22$ ngày.]
    ),
    loigiai: [
        Lượng chất còn lại sau $t$ ngày là: $Q(t) = Q_0 (0.8)^t$.
        Ta cần:
        $
          Q_0 (0.8)^t < 0.05 Q_0 <=> (0.8)^t < 0.05
        $
        $
          <=> t > log_0.8 (0.05) = (ln 0.05) / (ln 0.8) approx (-2.9957) / (-0.2231) approx 13.43 " (ngày)"
        $
        Vậy cần ít nhất $14$ ngày.
    ]
)

// TN 9
#tn([Chi phí năng lượng $E$ (calo) để một loài chim di cư bay với vận tốc $v$ (km/h) được mô hình hóa bởi $E(v) = a v^2 e^(-b v)$. Biết rằng chim sẽ bay ở vận tốc làm cho chi phí năng lượng ít nhất. Vận tốc lý tưởng để tiết kiệm năng lượng của chim có mối liên hệ thế nào với các hệ số?],
    (
        [$v = a/b$.],
        [$v = b/a$.],
        True([$v = 2/b$.]),
        [$v = a dot b$.]
    ),
    loigiai: [
        Để $E(v)$ đạt nhỏ nhất (hoặc xét điểm cực trị của hàm này):
        Xét bài toán ngược của thực tế: chim thường tìm vận tốc $v$ để tối ưu năng lượng trên quãng đường, nhưng ở đây hỏi trực tiếp cực trị của hàm số $E(v)$.
        Đạo hàm:
        $
          E'(v) = a(2v e^(-b v) + v^2 (-b) e^(-b v)) = a v e^(-b v) (2 - b v)
        $
        $E'(v) = 0 <=> v = 0$ hoặc $v = 2/b$. Vì $v > 0$ nên vận tốc tới hạn là $v = 2/b$. (Lưu ý, nếu xét năng lượng tiêu tốn trên 1 đơn vị quãng đường thì bài toán sẽ là tối ưu $E(v)/v$, nhưng theo đề đang hỏi trực tiếp hàm $E(v)$).
    ]
)

// TN 10
#tn([Sự mất giá của đồng nội tệ (lạm phát) ở một quốc gia lên tới mức siêu lạm phát, tỉ lệ lạm phát là $20\%$/tháng. Một món hàng hiện tại có giá $100$ nghìn đồng. Với tốc độ lạm phát này, sau một năm rưỡi (18 tháng) giá của nó xấp xỉ bằng bao nhiêu? (Lãi kép liên tục).],
    (
        [$1.8$ triệu đồng.],
        True([$3.6$ triệu đồng.]),
        [$7.2$ triệu đồng.],
        [$15.0$ triệu đồng.]
    ),
    loigiai: [
        Lạm phát tính theo tháng, với mô hình lãi kép liên tục $P = P_0 e^(r t)$.
        Ở đây $P_0 = 100$ (nghìn), $r = 0.2$ (mỗi tháng), $t = 18$ (tháng).
        $
          P(18) = 100 e^(0.2 dot 18) = 100 e^3.6
        $
        Bấm máy tính $e^3.6 approx 36.598$.
        $
          P(18) = 100 dot 36.598 = 3659.8 " (nghìn đồng)" approx 3.6 " (triệu đồng)"
        $
    ]
)

// TN 11
#tn([Một công ty điện lực phát hiện thấy chi phí sản xuất điện $C$ phụ thuộc vào sản lượng điện $x$ (MWh) theo hàm $C(x) = 500 + 20x - 10 ln(x+1)$ (triệu đồng). Chi phí biên $C'(x)$ (tốc độ thay đổi của chi phí) khi sản lượng là $49$ MWh bằng bao nhiêu?],
    (
        [$10.5$ triệu/MWh.],
        [$15.2$ triệu/MWh.],
        True([$19.8$ triệu/MWh.]),
        [$20.5$ triệu/MWh.]
    ),
    loigiai: [
        Chi phí biên:
        $
          C'(x) = 20 - 10/(x+1)
        $
        Tại $x = 49$:
        $
          C'(49) = 20 - 10/(49+1) = 20 - 10/50 = 20 - 0.2 = 19.8 " (triệu/MWh)"
        $
    ]
)

// TN 12
#tn([Định luật Gutenberg-Richter cho biết mối liên hệ giữa cường độ $M$ (độ Richter) và số trận động đất $N$ có cường độ lớn hơn hoặc bằng $M$ xảy ra trong một năm ở một khu vực nhất định: $log N = a - b M$. Nếu $a = 6.5$ và $b = 1.0$. Mỗi năm trung bình có bao nhiêu trận động đất từ $4.5$ độ Richter trở lên ở khu vực đó?],
    (
        [$10$ trận.],
        True([$100$ trận.]),
        [$250$ trận.],
        [$1000$ trận.]
    ),
    loigiai: [
        Thay $a = 6.5$, $b = 1.0$, $M = 4.5$ vào phương trình:
        $
          log N = 6.5 - 1.0 dot 4.5 = 6.5 - 4.5 = 2
        $
        $
          => N = 10^2 = 100 " (trận)"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cường độ của ánh sáng $I$ truyền qua một lớp vật liệu dày $x$ (cm) bị giảm dần theo công thức $I = I_0 e^(-mu x)$, trong đó $I_0$ là cường độ ban đầu, $mu$ là hệ số hấp thụ. Biết rằng một tấm kính dày $1$ cm hấp thụ $10\%$ ánh sáng chiếu vào. Các phát biểu sau đúng hay sai?], (
        True([Hệ số $mu$ của tấm kính là $-ln 0.9$.]),
        [Một tấm kính cùng loại dày $2$ cm sẽ hấp thụ $20\%$ ánh sáng.],
        [Để ánh sáng bị hấp thụ một nửa, cần độ dày kính là $x = (ln 2)/(ln 0.9)$ cm.],
        True([Tỉ lệ ánh sáng truyền qua tấm kính dày $5$ cm là $(0.9)^5$.])
    ), 
    loigiai: [
        - *a)* Đúng. Dày $1$ cm hấp thụ $10\%$, nghĩa là truyền qua $90\%$.
          $ I(1) = I_0 e^(-mu) = 0.9 I_0 <=> e^(-mu) = 0.9 <=> -mu = ln 0.9 <=> mu = -ln 0.9 $
        - *b)* Sai. Nếu dày $2$ cm: $I(2) = I_0 e^(-2 mu) = I_0 (e^(-mu))^2 = I_0 (0.9)^2 = 0.81 I_0$.
          Ánh sáng truyền qua là $81\%$, tức là kính hấp thụ $19\%$, không phải $20\%$.
        - *c)* Sai. Hấp thụ một nửa nghĩa là $I(x) = 0.5 I_0$.
          $ e^(-mu x) = 0.5 <=> (0.9)^x = 0.5 <=> x = log_0.9 (0.5) = (ln 0.5) / (ln 0.9) = (-ln 2) / (ln 0.9) $
          Phát biểu đưa ra là $(ln 2)/(ln 0.9)$ (bị thiếu dấu trừ), mà $ln 0.9 < 0$ nên giá trị bị âm, sai. (Đúng phải là $-ln 2 / ln 0.9$).
        - *d)* Đúng. $I(5) = I_0 e^(-5 mu) = I_0 (e^(-mu))^5 = I_0 (0.9)^5$.
    ]
)

// DS 2
#ds([Mô hình tăng trưởng Gompertz $N(t) = K e^(-A e^(-k t))$ thường được sử dụng để mô tả kích thước khối u ung thư. Kích thước tối đa mà khối u có thể đạt tới được gọi là sức chứa môi trường $K$. Với khối u cụ thể có mô hình $V(t) = 100 e^(-5 e^(-0.2 t))$ ($"cm"^3$), trong đó $t$ đo bằng tháng. Các phát biểu sau đúng hay sai?], (
        True([Thể tích tối đa của khối u là $100$" cm"^3.]),
        [Lúc mới phát hiện ($t=0$), thể tích khối u là $1$" cm"^3.],
        True([Thể tích khối u tăng nhanh nhất tại thời điểm $t = (ln 5) / 0.2$.]),
        True([Hàm số $V(t)$ luôn luôn là một hàm đồng biến với mọi $t > 0$.])
    ), 
    loigiai: [
        - *a)* Đúng. Khi $t -> +oo$, $e^(-0.2 t) -> 0$, do đó $V(t) -> 100 e^0 = 100$. Kích thước tối đa là $K = 100$.
        - *b)* Sai. Tại $t = 0$: $V(0) = 100 e^(-5 e^0) = 100 e^(-5) approx 100 dot 0.0067 = 0.67$" cm"^3.
        - *c)* Đúng. Điểm uốn của mô hình Gompertz (tốc độ tăng lớn nhất) đạt được khi phần tử số trong hàm log của nó đạt $-1$, hoặc đơn giản là tại $t$ sao cho $A e^(-k t) = 1$.
          $ 5 e^(-0.2 t) = 1 <=> e^(-0.2 t) = 1/5 <=> -0.2 t = -ln 5 <=> t = (ln 5) / 0.2 $
        - *d)* Đúng. Đạo hàm $V'(t) = 100 e^(-5 e^(-0.2 t)) dot (-5 e^(-0.2 t) dot (-0.2)) > 0$.
    ]
)

// DS 3
#ds([Cơ thể phân giải caffeine theo chu kì bán rã. Thông thường, chu kì bán rã của caffeine ở một người trưởng thành là $5$ giờ. Một sinh viên uống một cốc cà phê chứa $120$ mg caffeine vào lúc 8h sáng. Các phát biểu sau đúng hay sai?], (
        True([Lúc 13h cùng ngày, lượng caffeine trong cơ thể sinh viên còn $60$ mg.]),
        [Lúc 23h cùng ngày (tức là sau $15$ giờ), cơ thể đã đào thải hết hoàn toàn caffeine.],
        True([Hàm lượng caffeine còn lại sau $t$ giờ được biểu diễn bởi $C(t) = 120 e^(-(ln 2)/5 t)$.]),
        True([Nếu uống thêm một cốc $120$ mg vào lúc 13h, tổng lượng caffeine trong cơ thể lúc 18h sẽ là $90$ mg.])
    ), 
    loigiai: [
        - *a)* Đúng. Từ 8h đến 13h là $5$ giờ (1 chu kì bán rã). Lượng còn lại là $120 / 2 = 60$ mg.
        - *b)* Sai. Sau $15$ giờ ($3$ chu kì), lượng còn lại là $120 / 2^3 = 15$ mg (không đào thải hết hoàn toàn).
        - *c)* Đúng. Công thức tổng quát $m(t) = m_0 e^(-k t)$ với $k = (ln 2)/T$.
          Ở đây $T = 5$, nên $k = (ln 2)/5$.
        - *d)* Đúng. 
          - Lượng của cốc 1 lúc 8h: đến 18h là $10$ giờ ($2$ chu kì) $=> 120 / 4 = 30$ mg.
          - Lượng của cốc 2 lúc 13h: đến 18h là $5$ giờ ($1$ chu kì) $=> 120 / 2 = 60$ mg.
          Tổng lượng lúc 18h: $30 + 60 = 90$ mg.
    ]
)

// DS 4
#ds([Để đánh giá lợi ích của việc tiêm vaccine, Sở Y tế xây dựng mô hình dự báo số ca nhiễm bệnh $N(t)$ sau $t$ tuần nếu không tiêm và $V(t)$ nếu có chiến dịch tiêm chủng diện rộng: $N(t) = 500 e^(0.4 t)$ và $V(t) = 500 e^(0.1 t)$. Các phát biểu sau đúng hay sai?], (
        True([Ban đầu ($t=0$), số ca nhiễm ở cả hai mô hình là như nhau và bằng $500$.]),
        True([Số ca nhiễm nếu không tiêm sẽ tăng gấp đôi chỉ sau chưa đầy $2$ tuần.]),
        True([Sau $10$ tuần, chiến dịch tiêm chủng giúp giảm được $500(e^4 - e)$ ca nhiễm.]),
        [Tỉ lệ ca nhiễm giữa hai kịch bản $N(t) / V(t)$ là một hằng số.]
    ), 
    loigiai: [
        - *a)* Đúng. $N(0) = V(0) = 500$.
        - *b)* Đúng. $500 e^(0.4 t) = 1000 <=> e^(0.4 t) = 2 <=> 0.4 t = ln 2 <=> t = (ln 2)/0.4 approx 0.693/0.4 = 1.73$ (tuần), nhỏ hơn $2$.
        - *c)* Đúng. Số ca cứu được là chênh lệch: $N(10) - V(10) = 500 e^4 - 500 e^1 = 500(e^4 - e)$.
        - *d)* Sai. Lập tỉ lệ: $N(t) / V(t) = (e^(0.4 t)) / (e^(0.1 t)) = e^(0.3 t)$, đây là hàm số mũ theo $t$, không phải hằng số.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Số lượng tế bào trong một khối u ác tính được tính bằng $N(t) = 100 e^(0.15 t)$, với $t$ là số ngày. Sau bao nhiêu ngày thì kích thước khối u tăng gấp ba lần so với kích thước ban đầu lúc $t=0$? (Làm tròn đến một chữ số thập phân).],
    [7.3],
    loigiai: [
        Cần giải:
        $
          N(t) = 3 N(0) <=> 100 e^(0.15 t) = 300 <=> e^(0.15 t) = 3
        $
        $
          <=> 0.15 t = ln 3 <=> t = (ln 3) / 0.15 approx 1.0986 / 0.15 approx 7.324
        $
        Làm tròn đến một chữ số thập phân, ta được $7.3$ ngày.
    ]
)

// TL 2
#tln([Quãng đường một vật rơi tự do trong môi trường có sức cản của không khí được cho bởi phương trình vận tốc $v(t) = 50(1 - e^(-0.2 t))$ (m/s). Tại thời điểm $t=10$ giây, gia tốc rơi của vật (đạo hàm của vận tốc $a(t) = v'(t)$) là bao nhiêu $"m/s"^2$? (Làm tròn đến hai chữ số thập phân).],
    [1.35],
    loigiai: [
        Tính gia tốc (đạo hàm của $v(t)$):
        $
          a(t) = v'(t) = 50 dot (0 - (-0.2) e^(-0.2 t)) = 50 dot 0.2 e^(-0.2 t) = 10 e^(-0.2 t)
        $
        Tại $t=10$:
        $
          a(10) = 10 e^(-0.2 dot 10) = 10 e^(-2) = 10 / e^2 approx 10 / 7.389 approx 1.353 " (m/s"^2")"
        $
        Làm tròn đến hai chữ số thập phân là $1.35$.
    ]
)

// TL 3
#tln([Bạn An lập kế hoạch mua một chiếc laptop giá $30$ triệu đồng vào cuối năm. Đầu mỗi tháng, An gửi tiết kiệm một khoản tiền không đổi $x$ triệu đồng với lãi suất $0.6\%$/tháng. Sau đúng $12$ tháng, An nhận được số tiền vừa đủ $30$ triệu đồng. Tìm số tiền $x$ (Làm tròn đến hai chữ số thập phân).],
    [2.40],
    loigiai: [
        Đây là bài toán gửi tiền định kì đầu kỳ:
        $
          A = x/r (1+r) [(1+r)^n - 1] <=> 30 = x/0.006 (1.006) [1.006^12 - 1]
        $
        Bấm máy tính:
        $
          x = (30 dot 0.006) / (1.006 (1.006^12 - 1)) approx 0.18 / (1.006 dot 0.074424) approx 0.18 / 0.07487 approx 2.404
        $
        Làm tròn đến hai chữ số thập phân, mỗi tháng An phải gửi $2.40$ triệu đồng.
    ]
)

// TL 4
#tln([Một nhà máy xả thải ra dòng sông làm nồng độ ô nhiễm $P(t)$ tăng theo mô hình $P(t) = 150 - 50 e^(-0.2 t)$ (ppm), với $t$ là số năm kể từ khi nhà máy hoạt động. Nồng độ ô nhiễm tối đa mà dòng sông sẽ phải chịu nếu nhà máy cứ tiếp tục hoạt động vĩnh viễn (khi $t -> +oo$) là bao nhiêu ppm?],
    [150],
    loigiai: [
        Khi $t -> +oo$, thành phần $e^(-0.2 t) -> 0$.
        Do đó:
        $
          lim_(t -> +oo) P(t) = lim_(t -> +oo) (150 - 50 e^(-0.2 t)) = 150 - 0 = 150 " (ppm)"
        $
        Vậy nồng độ ô nhiễm tối đa tiến tới mức $150$ ppm.
    ]
)

// TL 5
#tln([Trong một hồ nuôi tôm, lượng oxy hòa tan $O(t)$ (mg/L) vào ban đêm thay đổi theo hàm $O(t) = 8 e^(-0.15 t)$, với $t$ là số giờ sau khi mặt trời lặn ($t=0$). Tôm sẽ bắt đầu ngạt thở nếu lượng oxy hòa tan nhỏ hơn $3$ mg/L. Sau bao nhiêu giờ (làm tròn đến một chữ số thập phân) kể từ lúc mặt trời lặn thì chủ hồ cần phải bật máy sục khí?],
    [6.5],
    loigiai: [
        Cần giải:
        $
          8 e^(-0.15 t) = 3 <=> e^(-0.15 t) = 3/8 = 0.375
        $
        $
          <=> -0.15 t = ln 0.375 <=> t = (ln 0.375) / (-0.15) approx (-0.9808) / (-0.15) = 6.538 " (giờ)"
        $
        Làm tròn đến một chữ số thập phân, thời gian cần bật sục khí là $6.5$ giờ.
    ]
)


// TL 6
#tln([Sự suy giảm dân số của một quần xã sinh vật theo mô hình $P(t) = P_0 e^(-k t)$. Biết rằng cứ sau $10$ năm thì dân số giảm đi $20\%$. Hỏi sau bao nhiêu năm thì dân số chỉ còn bằng một nửa dân số ban đầu? (Làm tròn đến một chữ số thập phân).],
    [31.1],
    loigiai: [
        Sau $10$ năm dân số giảm $20\%$, tức là còn lại $80\%$:
        $
          P(10) = P_0 e^(-10 k) = 0.8 P_0 <=> e^(-10 k) = 0.8 <=> e^(-k) = (0.8)^(1/10)
        $
        Cần tìm $t$ để:
        $
          P(t) = 0.5 P_0 <=> e^(-k t) = 0.5 <=> (e^(-k))^t = 0.5 <=> ((0.8)^(1/10))^t = 0.5
        $
        $
          <=> (0.8)^(t/10) = 0.5 <=> t/10 = log_0.8 0.5 = (ln 0.5) / (ln 0.8) approx 3.106
        $
        $
          => t = 31.06 " (năm)"
        $
        Làm tròn đến một chữ số thập phân là $31.1$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
