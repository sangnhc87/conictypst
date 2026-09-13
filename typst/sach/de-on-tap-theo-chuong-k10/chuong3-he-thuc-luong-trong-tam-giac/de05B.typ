#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.emerald

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 3",
  exam-title: "BÀI 5: GIÁ TRỊ LƯỢNG GIÁC CỦA MỘT GÓC TỪ 0° ĐẾN 180° (ĐỀ SỐ 2)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "102",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
// HÀM RENDER NỘI DUNG ĐỀ THI
// ═══════════════════════════════════════════════════════════════════
#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1: GTLG không xác định
#tn([Trong các khẳng định sau về các góc đặc biệt, khẳng định nào SAI?],
    (
        [$sin 90^circ = 1$],
        [$cos 90^circ = 0$],
        [$cos 180^circ = - 1$],
        True([$tan 90^circ = 1$])
    ),
    loigiai: [
        Tại $alpha = 90^circ$, điểm biểu diễn trên nửa đường tròn đơn vị là $(0; 1)$, tức là $x_0 = 0$ và $y_0 = 1$.
        Vì $x_0 = 0$ nên tỉ số $tan 90^circ = y_0 / x_0$ không xác định. Khẳng định $tan 90^circ = 1$ là sai.
    ]
)

// TN 2: Tính tan + cot góc 135 độ
#tn([Giá trị của biểu thức $P = tan 135^circ + cot 135^circ$ bằng bao nhiêu?],
    (
        [$0$],
        [$2$],
        True([$- 2$]),
        [$- 1$]
    ),
    loigiai: [
        Vì $135^circ + 45^circ = 180^circ$ nên:
        - $tan 135^circ = - tan 45^circ = - 1$.
        - $cot 135^circ = - cot 45^circ = - 1$.
        Do đó: $P = (- 1) + (- 1) = - 2$.
    ]
)

// TN 3: Công thức cos góc bù
#tn([Với góc $alpha$ bất kì ($0^circ <= alpha <= 180^circ$), đẳng thức nào sau đây luôn đúng?],
    (
        [$cos(180^circ - alpha) = cos alpha$],
        True([$cos(180^circ - alpha) = - cos alpha$]),
        [$sin(180^circ - alpha) = - sin alpha$],
        [$cos(90^circ - alpha) = - sin alpha$]
    ),
    loigiai: [
        Theo tính chất hai góc bù nhau ($alpha$ và $180^circ - alpha$):
        - Sin bù: $sin(180^circ - alpha) = sin alpha$.
        - Cos đối: $cos(180^circ - alpha) = - cos alpha$.
    ]
)

// TN 4: Quan hệ góc trong tam giác
#tn([Cho tam giác $A B C$. Mệnh đề nào sau đây đúng?],
    (
        [$cos(A + B) = cos C$],
        True([$sin(A + B) = sin C$]),
        [$tan(A + B) = tan C$],
        [$sin(A + B) = - sin C$]
    ),
    loigiai: [
        Trong tam giác $A B C$, ta có $A + B + C = 180^circ => A + B = 180^circ - C$.
        Áp dụng công thức hai góc bù nhau:
        $ sin(A + B) = sin(180^circ - C) = sin C $
    ]
)

// TN 5: Nhận biết tính chất góc tù
#tn([Cho góc $alpha$ thỏa mãn $cos alpha = - 1/3$ với $0^circ < alpha < 180^circ$. Khẳng định nào sau đây đúng về góc $alpha$?],
    (
        [$alpha$ là góc nhọn],
        [$alpha$ là góc vuông],
        True([$alpha$ là góc tù]),
        [$alpha = 0^circ$]
    ),
    loigiai: [
        Với $0^circ < alpha < 180^circ$:
        - Nếu $0^circ < alpha < 90^circ$ thì $cos alpha > 0$.
        - Nếu $alpha = 90^circ$ thì $cos alpha = 0$.
        - Nếu $90^circ < alpha < 180^circ$ thì $cos alpha < 0$.
        Vì $cos alpha = - 1/3 < 0$ nên $alpha$ là góc tù ($90^circ < alpha < 180^circ$).
    ]
)

// TN 6: Rút gọn biểu thức lượng giác
#tn([Giá trị của biểu thức $M = sin^2 42^circ + cos^2 42^circ + cos 180^circ$ bằng:],
    (
        True([$0$]),
        [$1$],
        [$2$],
        [$- 1$]
    ),
    loigiai: [
        Áp dụng hệ thức cơ bản $sin^2 42^circ + cos^2 42^circ = 1$ và $cos 180^circ = - 1$:
        $ M = 1 + (- 1) = 0 $
    ]
)

// TN 7: Tính tan khi biết cot
#tn([Cho góc $alpha$ thỏa mãn $cot alpha = - 3$. Giá trị của $tan alpha$ bằng:],
    (
        [$3$],
        True([$- 1/3$]),
        [$1/3$],
        [$- 3$]
    ),
    loigiai: [
        Với mọi góc $alpha$ làm cho $tan alpha$ và $cot alpha$ cùng xác định, ta luôn có:
        $ tan alpha dot cot alpha = 1 => tan alpha = 1 / (cot alpha) = 1 / (- 3) = - 1/3 $
    ]
)

// TN 8: Kết hợp phụ và bù
#tn([Rút gọn biểu thức $K = sin(90^circ - x) + cos(180^circ - x)$ với $0^circ < x < 90^circ$ ta được:],
    (
        [$2 cos x$],
        [$2 sin x$],
        True([$0$]),
        [$- 2 cos x$]
    ),
    loigiai: [
        Ta có:
        - $sin(90^circ - x) = cos x$ (hai góc phụ nhau).
        - $cos(180^circ - x) = - cos x$ (hai góc bù nhau).
        Do đó:
        $ K = cos x + (- cos x) = 0 $
    ]
)

// TN 9: Tính biểu thức theo sin
#tn([Cho biết $sin alpha = 2/3$. Giá trị của biểu thức $P = 1 - 2 sin^2 alpha$ bằng:],
    (
        [$5/9$],
        True([$1/9$]),
        [$- 1/9$],
        [$7/9$]
    ),
    loigiai: [
        Thay $sin alpha = 2/3$ vào biểu thức:
        $ P = 1 - 2(2/3)^2 = 1 - 2(4/9) = 1 - 8/9 = 1/9 $
    ]
)

// TN 10: Tọa độ điểm ứng với góc nhọn 60 độ
#tn([Trên nửa đường tròn đơn vị, điểm $M$ ứng với góc $alpha = 60^circ$ có tọa độ là:],
    (
        True([$(1/2; sqrt(3)/2)$]),
        [$(sqrt(3)/2; 1/2)$],
        [$(- 1/2; sqrt(3)/2)$],
        [$(sqrt(2)/2; sqrt(2)/2)$]
    ),
    loigiai: [
        Tọa độ của điểm $M$ là $(x_M; y_M) = (cos 60^circ; sin 60^circ) = (1/2; sqrt(3)/2)$.
    ]
)

// TN 11: Tam giác vuông
#tn([Cho tam giác $A B C$ vuông tại $A$ có cạnh $A B = 6$ và $B C = 10$. Cosin của góc $B$ bằng:],
    (
        [$4/5$],
        True([$3/5$]),
        [$3/4$],
        [$4/3$]
    ),
    loigiai: [
        Trong tam giác vuông $A B C$ vuông tại $A$:
        $ cos B = "cạnh kề" / "cạnh huyền" = (A B) / (B C) = 6/10 = 3/5 $
    ]
)

// TN 12: Thực tế pin mặt trời
#tn([Một tấm pin năng lượng mặt trời phẳng có chiều dài $2" m"$ được lắp đặt nghiêng một góc $30^circ$ so với mặt phẳng mái nhà nằm ngang. Khoảng cách thẳng đứng từ mép trên cùng của tấm pin xuống mặt phẳng mái nhà bằng bao nhiêu?],
    (
        [$1.5" m"$],
        [$sqrt(3)" m"$],
        True([$1" m"$]),
        [$0.5" m"$]
    ),
    loigiai: [
        Gọi khoảng cách thẳng đứng cần tìm là $h$.
        Trong tam giác vuông với cạnh huyền là chiều dài tấm pin:
        $ h = 2 dot sin 30^circ = 2 dot (1/2) = 1" m" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Các góc trong tam giác ABC
#ds([Cho tam giác $A B C$ có hai góc $hat(A) = 60^circ$ và $hat(B) = 45^circ$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số đo góc $hat(C)$ bằng $75^circ$.]),
    True([$sin(A + B) = sin C$.]),
    False([$cos(A + B) = cos C$.]),
    True([$tan(A + B) + tan C = 0$.])
  ),
  loigiai: [
    #step([Tính số đo góc C])
    Tổng ba góc trong tam giác bằng $180^circ$, suy ra:
    $ hat(C) = 180^circ - (hat(A) + hat(B)) = 180^circ - (60^circ + 45^circ) = 75^circ $
    Vậy a) Đúng.
    
    #step([Kiểm tra các mối quan hệ bù nhau])
    Vì $(A + B) + C = 180^circ$ nên góc $(A + B)$ và góc $C$ là hai góc bù nhau. Do đó:
    - $sin(A + B) = sin C$. Vậy b) Đúng.
    - $cos(A + B) = - cos C != cos C$. Vậy c) Sai.
    - $tan(A + B) = - tan C => tan(A + B) + tan C = 0$. Vậy d) Đúng.
  ]
)

// DS 2: Khảo sát góc khi biết tan = -2
#ds([Cho góc $alpha$ thỏa mãn $90^circ < alpha < 180^circ$ và $tan alpha = - 2$. Xét tính đúng sai của các khẳng định sau:],
  (
    False([$cos alpha > 0$.]),
    True([$cos^2 alpha = 1/5$.]),
    True([$sin alpha = (2 sqrt(5))/5$.]),
    True([Giá trị của biểu thức $H = (2 sin alpha + cos alpha) / (sin alpha - 3 cos alpha)$ bằng $3/5$.])
  ),
  loigiai: [
    #step([Dấu của cos])
    Vì $alpha$ là góc tù ($90^circ < alpha < 180^circ$) nên $cos alpha < 0$. Do đó mệnh đề a) Sai.
    
    #step([Tính cos^2])
    Áp dụng hệ thức cơ bản: $1 + tan^2 alpha = 1 / (cos^2 alpha) => cos^2 alpha = 1 / (1 + (- 2)^2) = 1/5$. Vậy b) Đúng.
    
    #step([Tính sin của góc])
    $sin^2 alpha = 1 - cos^2 alpha = 1 - 1/5 = 4/5$.
    Vì $alpha$ là góc tù nên $sin alpha > 0 => sin alpha = sqrt(4/5) = 2/sqrt(5) = (2 sqrt(5))/5$. Vậy c) Đúng.
    
    #step([Tính giá trị biểu thức H])
    Chia cả tử và mẫu của $H$ cho $cos alpha != 0$:
    $ H = (2 (sin alpha / cos alpha) + 1) / ((sin alpha / cos alpha) - 3) = (2 tan alpha + 1) / (tan alpha - 3) = (2(- 2) + 1) / (- 2 - 3) = (- 3) / (- 5) = 3/5 $
    Vậy d) Đúng.
  ]
)

// DS 3: Tổng các cặp góc bù và phụ
#ds([Xét tính đúng sai của các đẳng thức lượng giác sau:],
  (
    True([$cos 10^circ + cos 170^circ = 0$.]),
    True([$sin 20^circ - sin 160^circ = 0$.]),
    True([Biểu thức $T = cos 0^circ + cos 20^circ + cos 40^circ + dots + cos 180^circ$ có giá trị bằng $0$.]),
    True([$tan 15^circ dot tan 75^circ = 1$.])
  ),
  loigiai: [
    #step([Kiểm tra từng cặp bù nhau])
    - $10^circ + 170^circ = 180^circ => cos 170^circ = - cos 10^circ => cos 10^circ + cos 170^circ = 0$. Vậy a) Đúng.
    - $20^circ + 160^circ = 180^circ => sin 160^circ = sin 20^circ => sin 20^circ - sin 160^circ = 0$. Vậy b) Đúng.
    
    #step([Tính tổng T])
    Tổng $T$ gồm 10 số hạng với bước nhảy $20^circ$:
    $ T = (cos 0^circ + cos 180^circ) + (cos 20^circ + cos 160^circ) + (cos 40^circ + cos 140^circ) + (cos 60^circ + cos 120^circ) + (cos 80^circ + cos 100^circ) $
    Mỗi cặp bù nhau đều có tổng bằng $0$. Do đó $T = 0$. Vậy c) Đúng.
    
    #step([Kiểm tra tích tan])
    Vì $15^circ + 75^circ = 90^circ => tan 75^circ = cot 15^circ$, nên $tan 15^circ dot tan 75^circ = tan 15^circ dot cot 15^circ = 1$. Vậy d) Đúng.
  ]
)

// DS 4: Bài toán thực tế tay cẩu
#ds([Một cần cẩu có tay nâng dạng đoạn thẳng dài $12" m"$, quay quanh một khớp quay cố định đặt sát mặt đất. Gọi $theta$ là góc nâng của tay cần so với mặt đất nằm ngang ($0^circ <= theta <= 90^circ$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi góc nâng $theta = 30^circ$, độ cao của đầu cần cẩu so với mặt đất là $6" m"$.]),
    True([Tầm vươn xa theo phương ngang của đầu cần cẩu đạt giá trị lớn nhất khi $theta = 0^circ$ và bằng $12" m"$.]),
    False([Khi góc nâng $theta = 60^circ$, tầm vươn xa theo phương ngang của đầu cần cẩu bằng $6 sqrt(3)" m"$.]),
    True([Để đưa đầu cần cẩu lên độ cao tối thiểu là $10" m"$ so với mặt đất thì góc nâng $theta$ phải thỏa mãn $theta >= 56.44^circ$.])
  ),
  loigiai: [
    #step([Công thức độ cao và tầm vươn xa])
    Gọi độ cao đầu cần cẩu là $y$ và tầm vươn xa theo phương ngang là $x$:
    - Độ cao: $y = 12 dot sin theta$.
    - Tầm vươn xa: $x = 12 dot cos theta$.
    
    #step([Kiểm tra từng ý])
    - Khi $theta = 30^circ: y = 12 dot sin 30^circ = 12(0.5) = 6" m"$. Vậy a) Đúng.
    - Hàm $cos theta$ đạt giá trị lớn nhất bằng $1$ khi $theta = 0^circ$, khi đó $x = 12 dot 1 = 12" m"$. Vậy b) Đúng.
    - Khi $theta = 60^circ: x = 12 dot cos 60^circ = 12(0.5) = 6" m"$ (không phải $6 sqrt(3)" m"$). Vậy c) Sai.
    - Để $y >= 10 <=> 12 dot sin theta >= 10 <=> sin theta >= 10/12 = 5/6 approx 0.8333$.
      Vì $sin 56.44^circ approx 0.8333$ nên $theta >= 56.44^circ$. Vậy d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Phân thức theo cot
#tln([Cho góc $alpha$ thỏa mãn $cot alpha = 2$. Tính giá trị của biểu thức $B = (2 sin alpha + 5 cos alpha) / (4 sin alpha + cos alpha)$.],
    [2],
    loigiai: [
        #step([Biến đổi biểu thức theo cot])
        Vì $cot alpha = 2$ nên $sin alpha != 0$. Chia cả tử và mẫu của $B$ cho $sin alpha$:
        $ B = (2 + 5 (cos alpha / sin alpha)) / (4 + (cos alpha / sin alpha)) = (2 + 5 cot alpha) / (4 + cot alpha) $
        
        #step([Thay số tính giá trị])
        $ B = (2 + 5(2)) / (4 + 2) = (2 + 10) / 6 = 12 / 6 = 2 $
    ]
)

// TLN 2: Tổng bình phương cos các góc phụ nhau
#tln([Tính giá trị của biểu thức $S = cos^2 10^circ + cos^2 20^circ + cos^2 70^circ + cos^2 80^circ$.],
    [2],
    loigiai: [
        #step([Áp dụng tính chất góc phụ nhau])
        - $10^circ + 80^circ = 90^circ => cos 80^circ = sin 10^circ => cos^2 80^circ = sin^2 10^circ$.
        - $20^circ + 70^circ = 90^circ => cos 70^circ = sin 20^circ => cos^2 70^circ = sin^2 20^circ$.
        
        #step([Ghép cặp tính tổng])
        $ S &= (cos^2 10^circ + cos^2 80^circ) + (cos^2 20^circ + cos^2 70^circ) \
            &= (cos^2 10^circ + sin^2 10^circ) + (cos^2 20^circ + sin^2 20^circ) \
            &= 1 + 1 = 2 $
    ]
)

// TLN 3: Cho sin - cos tính tích sin * cos
#tln([Cho góc $alpha$ thỏa mãn $sin alpha - cos alpha = sqrt(7)/3$. Tính giá trị của biểu thức $M = 18 dot sin alpha dot cos alpha$.],
    [2],
    loigiai: [
        #step([Bình phương hai vế])
        $ (sin alpha - cos alpha)^2 = (sqrt(7)/3)^2 <=> sin^2 alpha - 2 sin alpha cos alpha + cos^2 alpha = 7/9 $
        
        #step([Tính tích $sin alpha dot cos alpha$])
        Vì $sin^2 alpha + cos^2 alpha = 1$:
        $ 1 - 2 sin alpha cos alpha = 7/9 <=> 2 sin alpha cos alpha = 1 - 7/9 = 2/9 $
        $ => sin alpha cos alpha = 1/9 $
        
        #step([Tính giá trị M])
        $ M = 18 dot (1/9) = 2 $
    ]
)

// TLN 4: Biểu thức đẳng cấp bậc hai theo tan
#tln([Cho góc $alpha$ thỏa mãn $tan alpha = sqrt(2)$. Tính giá trị của biểu thức $E = (5 sin^2 alpha + 4 cos^2 alpha) / (2 sin^2 alpha + 3 cos^2 alpha)$.],
    [2],
    loigiai: [
        #step([Chia tử và mẫu cho cos^2])
        Vì $tan alpha = sqrt(2)$ nên $cos alpha != 0$. Chia cả tử và mẫu của $E$ cho $cos^2 alpha$:
        $ E = (5 (sin^2 alpha / cos^2 alpha) + 4) / (2 (sin^2 alpha / cos^2 alpha) + 3) = (5 tan^2 alpha + 4) / (2 tan^2 alpha + 3) $
        
        #step([Thay số tính giá trị])
        Vì $tan^2 alpha = (sqrt(2))^2 = 2$:
        $ E = (5(2) + 4) / (2(2) + 3) = (10 + 4) / (4 + 3) = 14 / 7 = 2 $
    ]
)

// TLN 5: Bài toán góc hạ ngọn hải đăng
#tln([Từ đỉnh một ngọn hải đăng cao $65" m"$ so với mực nước biển, người quan sát nhìn thấy một chiếc tàu cứu hộ đang gặp nạn dưới một góc hạ là $14^circ$. Tính khoảng cách từ chân ngọn hải đăng đến chiếc tàu cứu hộ (làm tròn kết quả đến hàng mét).],
    [261],
    loigiai: [
        #step([Mô hình hóa hình học])
        Gọi đỉnh ngọn hải đăng là $A$, chân ngọn hải đăng là $B$ ($A B = 65" m"$), vị trí chiếc tàu là $C$.
        Đường nằm ngang qua đỉnh ngọn hải đăng là $A x$.
        Góc hạ là góc giữa tia $A x$ và tia ngắm $A C$, tức $hat(x A C) = 14^circ$.
        Do $A x$ song song với mặt nước biển $B C$ nên góc so le trong $hat(A C B) = hat(x A C) = 14^circ$.
        
        #step([Tính khoảng cách BC])
        Trong tam giác vuông $A B C$ vuông tại $B$:
        $ B C = (A B) / (tan hat(A C B)) = 65 / (tan 14^circ) approx 65 / 0.2493 approx 260.7" m" approx 261" m" $
    ]
)

#pagebreak()

// TLN 6: Cho tan + cot tính tan^2 + cot^2 kèm hình vẽ CeTZ
#tln([Cho góc tù $alpha$ ($90^circ < alpha < 180^circ$) thỏa mãn $tan alpha + cot alpha = - 4$. Tính giá trị của biểu thức $K = tan^2 alpha + cot^2 alpha$.],
    [14],
    loigiai: [
        #step([Bình phương hai vế])
        Bình phương hai vế của giả thiết $tan alpha + cot alpha = - 4$:
        $ (tan alpha + cot alpha)^2 = (- 4)^2 <=> tan^2 alpha + 2 tan alpha dot cot alpha + cot^2 alpha = 16 $
        
        #step([Áp dụng tính chất $tan alpha dot cot alpha = 1$])
        Vì $tan alpha dot cot alpha = 1$ với mọi $alpha != 0^circ, 90^circ, 180^circ$, ta có:
        $ tan^2 alpha + 2(1) + cot^2 alpha = 16 <=> tan^2 alpha + cot^2 alpha = 16 - 2 = 14 $
        Do đó: $K = 14$.

        #step([Minh họa hình học góc tù trên nửa đường tròn đơn vị])
        Góc $alpha$ là góc tù nằm ở góc phần tư thứ hai, có hoành độ âm ($cos alpha < 0$) và tung độ dương ($sin alpha > 0$), do đó $tan alpha < 0$ và $cot alpha < 0$.
        
        #align(center)[
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 2.4
                
                // Trục tọa độ Oxy
                line((-1.3 * sc, 0), (1.4 * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
                content((1.45 * sc, 0), [$x$])
                line((0, -0.2 * sc), (0, 1.35 * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
                content((0, 1.4 * sc), [$y$])
                content((0.12 * sc, -0.12 * sc), [$O$])
                
                // Nửa đường tròn đơn vị
                arc((sc, 0), start: 0deg, stop: 180deg, radius: sc, stroke: 1.2pt + rgb("0d9488"))
                
                // Điểm 1 và -1 trên trục Ox, 1 trên Oy
                circle((sc, 0), radius: 1.5pt, fill: black)
                content((sc + 0.12 * sc, -0.12 * sc), [$1$])
                circle((-sc, 0), radius: 1.5pt, fill: black)
                content((-sc - 0.12 * sc, 0.12 * sc), [$-1$])
                circle((0, sc), radius: 1.5pt, fill: black)
                content((-0.12 * sc, sc + 0.12 * sc), [$1$])
                
                // Góc tù alpha = 150 độ minh họa trực quan
                let xM = -0.866 * sc
                let yM = 0.5 * sc
                
                line((0, 0), (xM, yM), stroke: 1.2pt + rgb("dc2626"))
                circle((xM, yM), radius: 2.5pt, fill: rgb("dc2626"), stroke: black)
                content((xM - 0.32 * sc, yM + 0.12 * sc), text(fill: rgb("dc2626"), weight: "bold")[$M(x_0; y_0)$])
                
                // Gióng tọa độ
                line((xM, 0), (xM, yM), stroke: (paint: luma(120), thickness: 0.5pt, dash: "densely-dashed"))
                line((0, yM), (xM, yM), stroke: (paint: luma(120), thickness: 0.5pt, dash: "densely-dashed"))
                content((xM, -0.16 * sc), box(fill: white, inset: 1pt)[#text(size: 8.5pt)[$x_0 < 0$]])
                content((0.28 * sc, yM), box(fill: white, inset: 1pt)[#text(size: 8.5pt)[$y_0 > 0$]])
                
                // Cung góc alpha
                arc((0.35 * sc, 0), start: 0deg, stop: 150deg, radius: 0.35 * sc, stroke: 0.9pt + rgb("7c3aed"))
                content((-0.18 * sc, 0.28 * sc), text(fill: rgb("7c3aed"), size: 8.5pt)[$alpha$])
            })
        ]
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
