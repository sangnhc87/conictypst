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
  school: "ÔN TẬP CHƯƠNG 3",
  exam-title: "BÀI 5: GIÁ TRỊ LƯỢNG GIÁC CỦA MỘT GÓC TỪ 0° ĐẾN 180° (ĐỀ SỐ 1)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "101",
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

// TN 1: Định nghĩa GTLG trên nửa đường tròn đơn vị
#tn([Trên mặt phẳng tọa độ $O x y$, lấy nửa đường tròn đơn vị nằm phía trên trục hoành. Cho góc $alpha$ ($0^circ <= alpha <= 180^circ$) và điểm $M(x_0; y_0)$ nằm trên nửa đường tròn đơn vị sao cho $hat(x O M) = alpha$. Khẳng định nào sau đây đúng?],
    (
        [$sin alpha = x_0$],
        True([$sin alpha = y_0$]),
        [$cos alpha = y_0$],
        [$tan alpha = x_0 / y_0$]
    ),
    loigiai: [
        Theo định nghĩa giá trị lượng giác của góc $alpha$ ($0^circ <= alpha <= 180^circ$) trên nửa đường tròn đơn vị:
        - Hoành độ $x_0$ của điểm $M$ là côsin của góc $alpha$: $cos alpha = x_0$.
        - Tung độ $y_0$ của điểm $M$ là sin của góc $alpha$: $sin alpha = y_0$.
        - Với $x_0 != 0$ ($alpha != 90^circ$): $tan alpha = y_0 / x_0$.
        - Với $y_0 != 0$ ($alpha != 0^circ, alpha != 180^circ$): $cot alpha = x_0 / y_0$.
    ]
)

// TN 2: Dấu của GTLG góc tù
#tn([Cho góc $alpha$ là góc tù ($90^circ < alpha < 180^circ$). Mệnh đề nào sau đây đúng?],
    (
        [$sin alpha < 0$],
        [$cos alpha > 0$],
        True([$tan alpha < 0$]),
        [$cot alpha > 0$]
    ),
    loigiai: [
        Khi $90^circ < alpha < 180^circ$, điểm biểu diễn $M(x_0; y_0)$ nằm ở góc phần tư thứ hai:
        - Tung độ $y_0 > 0 => sin alpha > 0$.
        - Hoành độ $x_0 < 0 => cos alpha < 0$.
        Do đó: $tan alpha = y_0 / x_0 < 0$ và $cot alpha = x_0 / y_0 < 0$.
    ]
)

// TN 3: GTLG góc đặc biệt 120 độ
#tn([Giá trị của $cos 120^circ$ bằng bao nhiêu?],
    (
        [$1/2$],
        True([$- 1/2$]),
        [$- sqrt(3)/2$],
        [$sqrt(3)/2$]
    ),
    loigiai: [
        Hai góc $120^circ$ và $60^circ$ bù nhau ($120^circ + 60^circ = 180^circ$), nên:
        $ cos 120^circ = - cos 60^circ = - 1/2 $
    ]
)

// TN 4: GTLG góc đặc biệt 135 độ
#tn([Giá trị của $sin 135^circ$ bằng bao nhiêu?],
    (
        True([$sqrt(2)/2$]),
        [$- sqrt(2)/2$],
        [$1/2$],
        [$- 1/2$]
    ),
    loigiai: [
        Áp dụng công thức hai góc bù nhau ($135^circ + 45^circ = 180^circ$):
        $ sin 135^circ = sin(180^circ - 45^circ) = sin 45^circ = sqrt(2)/2 $
    ]
)

// TN 5: Công thức hai góc bù nhau
#tn([Với mọi góc $alpha$ ($0^circ <= alpha <= 180^circ$), khẳng định nào sau đây SAI?],
    (
        [$sin(180^circ - alpha) = sin alpha$],
        True([$cos(180^circ - alpha) = cos alpha$]),
        [$tan(180^circ - alpha) = - tan alpha quad (alpha != 90^circ)$],
        [$cot(180^circ - alpha) = - cot alpha quad (alpha != 0^circ, alpha != 180^circ)$]
    ),
    loigiai: [
        Mối quan hệ giữa các giá trị lượng giác của hai góc bù nhau:
        - $sin(180^circ - alpha) = sin alpha$.
        - $cos(180^circ - alpha) = - cos alpha$ (do đó khẳng định $cos(180^circ - alpha) = cos alpha$ là sai).
        - $tan(180^circ - alpha) = - tan alpha$.
        - $cot(180^circ - alpha) = - cot alpha$.
    ]
)

// TN 6: Tọa độ điểm trên nửa đường tròn đơn vị
#tn([Trên nửa đường tròn đơn vị, điểm $M$ ứng với góc $alpha = 150^circ$ có tọa độ là:],
    (
        [$(1/2; - sqrt(3)/2)$],
        [$(sqrt(3)/2; 1/2)$],
        True([$(- sqrt(3)/2; 1/2)$]),
        [$(- 1/2; sqrt(3)/2)$]
    ),
    loigiai: [
        Tọa độ của điểm $M$ ứng với góc $alpha = 150^circ$ là $(x_M; y_M) = (cos 150^circ; sin 150^circ)$.
        Ta có:
        $ cases(x_M = cos 150^circ = - cos 30^circ = - sqrt(3)/2, y_M = sin 150^circ = sin 30^circ = 1/2) $
        Vậy tọa độ của điểm $M$ là $(- sqrt(3)/2; 1/2)$.
    ]
)

// TN 7: Tính cos khi biết sin góc tù
#tn([Cho góc tù $alpha$ thỏa mãn $sin alpha = 3/5$. Giá trị của $cos alpha$ bằng:],
    (
        [$4/5$],
        True([$- 4/5$]),
        [$- 16/25$],
        [$2/5$]
    ),
    loigiai: [
        Áp dụng hệ thức cơ bản: $sin^2 alpha + cos^2 alpha = 1 => cos^2 alpha = 1 - (3/5)^2 = 16/25$.
        Vì $alpha$ là góc tù ($90^circ < alpha < 180^circ$) nên $cos alpha < 0$.
        Do đó: $cos alpha = - sqrt(16/25) = - 4/5$.
    ]
)

// TN 8: Hệ thức cơ bản
#tn([Đẳng thức nào sau đây đúng với mọi góc $alpha$ ($0^circ < alpha < 180^circ, alpha != 90^circ$)?],
    (
        [$sin^2 alpha - cos^2 alpha = 1$],
        True([$1 + tan^2 alpha = 1 / (cos^2 alpha)$]),
        [$tan alpha = cos alpha / sin alpha$],
        [$tan alpha dot cot alpha = - 1$]
    ),
    loigiai: [
        Các hệ thức lượng giác cơ bản:
        - $sin^2 alpha + cos^2 alpha = 1$.
        - $1 + tan^2 alpha = 1 / (cos^2 alpha)$ với $alpha != 90^circ$.
        - $tan alpha dot cot alpha = 1$ với $alpha != 0^circ, 90^circ, 180^circ$.
    ]
)

// TN 9: Tính giá trị biểu thức góc bù triệt tiêu
#tn([Giá trị của biểu thức $P = cos 25^circ + cos 155^circ + sin 30^circ$ bằng:],
    (
        [$0$],
        True([$1/2$]),
        [$1$],
        [$- 1/2$]
    ),
    loigiai: [
        Vì $25^circ + 155^circ = 180^circ$ nên $cos 155^circ = - cos 25^circ$.
        Khi đó:
        $ P = cos 25^circ + (- cos 25^circ) + sin 30^circ = 0 + 1/2 = 1/2 $
    ]
)

// TN 10: Tìm góc khi biết tan
#tn([Tìm số đo góc $alpha$ ($0^circ <= alpha <= 180^circ$) biết $tan alpha = - sqrt(3)$.],
    (
        [$alpha = 60^circ$],
        True([$alpha = 120^circ$]),
        [$alpha = 150^circ$],
        [$alpha = 135^circ$]
    ),
    loigiai: [
        Vì $tan alpha = - sqrt(3) < 0$ nên $alpha$ là góc tù.
        Ta có $tan 60^circ = sqrt(3) => tan(180^circ - 60^circ) = - tan 60^circ = - sqrt(3)$.
        Do đó $alpha = 180^circ - 60^circ = 120^circ$.
    ]
)

// TN 11: Tính tan khi biết sin và cos
#tn([Cho góc $alpha$ thỏa mãn $sin alpha = 5/13$ và $cos alpha = - 12/13$. Giá trị của $tan alpha$ là:],
    (
        [$5/12$],
        True([$- 5/12$]),
        [$- 12/5$],
        [$12/5$]
    ),
    loigiai: [
        Ta có:
        $ tan alpha = sin alpha / cos alpha = (5/13) / (- 12/13) = - 5/12 $
    ]
)

// TN 12: Bài toán thực tế độ cao xe lên dốc
#tn([Một con đường dốc có góc nghiêng $alpha = 12^circ$ so với mặt phẳng nằm ngang. Một chiếc ô tô di chuyển từ chân dốc lên đỉnh dốc một quãng đường dài $250" m"$. Độ cao của đỉnh dốc so với chân dốc gần nhất với giá trị nào sau đây?],
    (
        [$48" m"$],
        True([$52" m"$]),
        [$60" m"$],
        [$244" m"$]
    ),
    loigiai: [
        Gọi độ cao của đỉnh dốc là $h$.
        Trong tam giác vuông tạo bởi mặt đường dốc, chiều cao và mặt phẳng ngang:
        $ h = 250 dot sin 12^circ approx 250 dot 0.2079 = 51.98" m" approx 52" m" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát điểm M trên nửa đường tròn đơn vị
#ds([Trên mặt phẳng tọa độ $O x y$, nửa đường tròn đơn vị tâm $O$ bán kính $R = 1$ nằm phía trên trục hoành. Điểm $M$ nằm trên nửa đường tròn đơn vị sao cho $hat(x O M) = 150^circ$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tung độ của điểm $M$ bằng $1/2$.]),
    False([Hoành độ của điểm $M$ bằng $sqrt(3)/2$.]),
    True([$tan 150^circ = - sqrt(3)/3$.]),
    True([Điểm $M'$ đối xứng với $M$ qua trục tung $O y$ ứng với góc $30^circ$ và có tọa độ $(sqrt(3)/2; 1/2)$.])
  ),
  loigiai: [
    #step([Xác định tọa độ điểm M])
    Tọa độ điểm $M(x_0; y_0)$ ứng với góc $150^circ$ là:
    - $y_0 = sin 150^circ = sin(180^circ - 30^circ) = sin 30^circ = 1/2$. Vậy a) Đúng.
    - $x_0 = cos 150^circ = - cos 30^circ = - sqrt(3)/2$. Vậy b) Sai (hoành độ phải mang dấu âm).
    
    #step([Tính tan của góc])
    $tan 150^circ = sin 150^circ / cos 150^circ = (1/2) / (- sqrt(3)/2) = - 1/sqrt(3) = - sqrt(3)/3$. Vậy c) Đúng.
    
    #step([Tọa độ điểm đối xứng M'])
    Điểm $M'$ đối xứng với $M(- sqrt(3)/2; 1/2)$ qua trục $O y$ có hoành độ đổi dấu và tung độ giữ nguyên:
    $M'(sqrt(3)/2; 1/2)$. Góc tạo bởi tia $O M'$ và tia $O x$ là $180^circ - 150^circ = 30^circ$. Vậy d) Đúng.
  ]
)

// DS 2: Khảo sát góc tù khi biết cos
#ds([Cho góc $alpha$ thỏa mãn $90^circ < alpha < 180^circ$ và $cos alpha = - 5/13$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Điểm biểu diễn góc $alpha$ trên nửa đường tròn đơn vị nằm ở góc phần tư thứ hai.]),
    False([$sin alpha = - 12/13$.]),
    True([$tan alpha = - 12/5$.]),
    True([Giá trị của biểu thức $E = (2 sin alpha - 3 cos alpha) / (sin alpha + cos alpha)$ bằng $39/7$.])
  ),
  loigiai: [
    #step([Xác định vị trí góc phần tư])
    Vì $90^circ < alpha < 180^circ$ nên điểm biểu diễn thuộc góc phần tư thứ hai. Vậy a) Đúng.
    
    #step([Tính sin của góc])
    Áp dụng hệ thức: $sin^2 alpha = 1 - cos^2 alpha = 1 - (- 5/13)^2 = 144/169$.
    Vì $alpha$ là góc tù nên $sin alpha > 0$, suy ra $sin alpha = sqrt(144/169) = 12/13$. Vậy b) Sai.
    
    #step([Tính tan của góc])
    $tan alpha = sin alpha / cos alpha = (12/13) / (- 5/13) = - 12/5$. Vậy c) Đúng.
    
    #step([Tính giá trị biểu thức E])
    Thay $sin alpha = 12/13$ và $cos alpha = - 5/13$ vào $E$:
    $ E = (2(12/13) - 3(- 5/13)) / (12/13 + (- 5/13)) = (24/13 + 15/13) / (7/13) = (39/13) / (7/13) = 39/7 $
    Vậy d) Đúng.
  ]
)

// DS 3: Góc bù và góc phụ
#ds([Xét các biểu thức lượng giác sau, với $alpha$ là góc nhọn bất kì ($0^circ < alpha < 90^circ$). Xét tính đúng sai của các khẳng định sau:],
  (
    True([$sin(180^circ - alpha) - sin alpha = 0$.]),
    True([$cos(180^circ - alpha) + cos alpha = 0$.]),
    True([Biểu thức $P = sin^2 35^circ + sin^2 55^circ + cos^2 125^circ + cos^2 145^circ$ có giá trị bằng $2$.]),
    True([Biểu thức $Q = tan 20^circ dot tan 70^circ + cot 40^circ dot cot 50^circ$ có giá trị bằng $2$.])
  ),
  loigiai: [
    #step([Kiểm tra công thức góc bù])
    - Ta có $sin(180^circ - alpha) = sin alpha => sin(180^circ - alpha) - sin alpha = 0$. Vậy a) Đúng.
    - Ta có $cos(180^circ - alpha) = - cos alpha => cos(180^circ - alpha) + cos alpha = 0$. Vậy b) Đúng.
    
    #step([Rút gọn biểu thức P])
    Áp dụng tính chất góc phụ nhau ($35^circ + 55^circ = 90^circ => sin 55^circ = cos 35^circ$) và góc bù nhau ($cos 125^circ = - cos 55^circ = - sin 35^circ$, $cos 145^circ = - cos 35^circ$):
    $ P = sin^2 35^circ + cos^2 35^circ + (- sin 35^circ)^2 + (- cos 35^circ)^2 = 1 + (sin^2 35^circ + cos^2 35^circ) = 1 + 1 = 2 $
    Vậy c) Đúng.
    
    #step([Rút gọn biểu thức Q])
    Vì $20^circ + 70^circ = 90^circ => tan 70^circ = cot 20^circ$ nên $tan 20^circ dot tan 70^circ = tan 20^circ dot cot 20^circ = 1$.
    Tương tự $cot 40^circ dot cot 50^circ = cot 40^circ dot tan 40^circ = 1$.
    Do đó $Q = 1 + 1 = 2$. Vậy d) Đúng.
  ]
)

// DS 4: Bài toán thực tế an toàn thang tựa tường
#ds([Một chiếc thang dài $4" m"$ được tựa vào một bức tường thẳng đứng trên mặt sàn nằm ngang. Gọi $alpha$ là góc nghiêng giữa chiếc thang và mặt sàn ($0^circ < alpha < 90^circ$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Chiều cao $h$ từ đỉnh thang chạm tường đến mặt sàn được tính bởi công thức $h = 4 dot sin alpha" (m)"$.]),
    False([Khoảng cách $d$ từ chân thang đến chân tường được tính bởi công thức $d = 4 dot tan alpha" (m)"$.]),
    True([Khi góc nghiêng $alpha = 65^circ$, chiều cao $h$ làm tròn đến chữ số thập phân thứ nhất bằng $3.6" m"$.]),
    True([Theo tiêu chuẩn an toàn lao động, thang tựa cần có góc nghiêng trong khoảng $70^circ <= alpha <= 75^circ$. Khi đó, khoảng cách $d$ từ chân thang đến chân tường nằm trong khoảng từ $1.04" m"$ đến $1.37" m"$.])
  ),
  loigiai: [
    #step([Công thức hình học])
    Tam giác tạo bởi thang, tường và mặt đất là tam giác vuông tại chân tường với cạnh huyền dài $4" m"$:
    - Cạnh đối diện góc $alpha$ là chiều cao $h => h = 4 dot sin alpha$. Vậy a) Đúng.
    - Cạnh kề góc $alpha$ là khoảng cách chân thang $d => d = 4 dot cos alpha$ (không phải $4 dot tan alpha$). Vậy b) Sai.
    
    #step([Tính chiều cao khi $alpha = 65^circ$])
    $h = 4 dot sin 65^circ approx 4 dot 0.9063 = 3.625" m" approx 3.6" m"$. Vậy c) Đúng.
    
    #step([Kiểm tra khoảng an toàn])
    Hàm số $cos alpha$ nghịch biến khi $alpha in [70^circ; 75^circ]$:
    - Khi $alpha = 75^circ: d = 4 dot cos 75^circ approx 4 dot 0.2588 = 1.035" m" approx 1.04" m"$.
    - Khi $alpha = 70^circ: d = 4 dot cos 70^circ approx 4 dot 0.3420 = 1.368" m" approx 1.37" m"$.
    Vậy khoảng an toàn của khoảng cách $d$ là $[1.04" m"; 1.37" m"]$. Mệnh đề d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Tính giá trị biểu thức góc đặc biệt
#tln([Tính giá trị của biểu thức $P = 4 sin 30^circ + 2 sqrt(3) cos 30^circ - 3 tan 135^circ$.],
    [8],
    loigiai: [
        #step([Thay các giá trị lượng giác đặc biệt])
        - $sin 30^circ = 1/2$.
        - $cos 30^circ = sqrt(3)/2$.
        - $tan 135^circ = - tan 45^circ = - 1$.
        
        #step([Tính toán giá trị])
        $ P = 4(1/2) + 2 sqrt(3) (sqrt(3)/2) - 3(- 1) = 2 + 3 + 3 = 8 $
    ]
)

// TLN 2: Biểu thức phân thức bậc nhất theo tan
#tln([Cho góc $alpha$ thỏa mãn $tan alpha = 2$. Tính giá trị của biểu thức $A = (4 sin alpha + 5 cos alpha) / (2 sin alpha - 3 cos alpha)$.],
    [13],
    loigiai: [
        #step([Biến đổi biểu thức theo tan])
        Vì $tan alpha = 2$ nên $cos alpha != 0$. Chia cả tử và mẫu của $A$ cho $cos alpha$:
        $ A = (4 (sin alpha / cos alpha) + 5) / (2 (sin alpha / cos alpha) - 3) = (4 tan alpha + 5) / (2 tan alpha - 3) $
        
        #step([Thay số tính giá trị])
        $ A = (4(2) + 5) / (2(2) - 3) = (8 + 5) / (4 - 3) = 13 / 1 = 13 $
    ]
)

// TLN 3: Tổng bình phương các góc phụ nhau
#tln([Tính giá trị của biểu thức $S = sin^2 15^circ + sin^2 35^circ + sin^2 55^circ + sin^2 75^circ$.],
    [2],
    loigiai: [
        #step([Áp dụng công thức hai góc phụ nhau])
        - Vì $15^circ + 75^circ = 90^circ => sin 75^circ = cos 15^circ => sin^2 75^circ = cos^2 15^circ$.
        - Vì $35^circ + 55^circ = 90^circ => sin 55^circ = cos 35^circ => sin^2 55^circ = cos^2 35^circ$.
        
        #step([Nhóm các cặp có tổng bằng 1])
        $ S &= (sin^2 15^circ + sin^2 75^circ) + (sin^2 35^circ + sin^2 55^circ) \
            &= (sin^2 15^circ + cos^2 15^circ) + (sin^2 35^circ + cos^2 35^circ) \
            &= 1 + 1 = 2 $
    ]
)

// TLN 4: Cho sin + cos tính tích sin * cos
#tln([Cho góc tù $alpha$ thỏa mãn $sin alpha + cos alpha = 1/5$. Tính giá trị của biểu thức $T = 100 dot sin alpha dot cos alpha$.],
    [-48],
    loigiai: [
        #step([Bình phương hai vế])
        Bình phương hai vế của đẳng thức $sin alpha + cos alpha = 1/5$:
        $ (sin alpha + cos alpha)^2 = (1/5)^2 <=> sin^2 alpha + 2 sin alpha cos alpha + cos^2 alpha = 1/25 $
        
        #step([Rút ra tích $sin alpha dot cos alpha$])
        Vì $sin^2 alpha + cos^2 alpha = 1$ nên:
        $ 1 + 2 sin alpha cos alpha = 1/25 <=> 2 sin alpha cos alpha = 1/25 - 1 = - 24/25 $
        $ => sin alpha cos alpha = - 12/25 $
        
        #step([Tính giá trị T])
        $ T = 100 dot (- 12/25) = - 48 $
    ]
)

// TLN 5: Thực tế chiều cao tháp truyền hình
#tln([Một người đứng ở vị trí $A$ trên mặt đất bằng phẳng, cách chân một tháp truyền hình một khoảng $80" m"$. Người đó nhìn lên đỉnh tháp dưới góc nâng $32^circ$. Biết khoảng cách từ mắt người quan sát đến mặt đất là $1.6" m"$. Tính chiều cao của ngọn tháp (làm tròn kết quả đến hàng đơn vị mét).],
    [52],
    loigiai: [
        #step([Mô hình hóa bài toán])
        Gọi chiều cao ngọn tháp là $h = C D$ (với $C$ là chân tháp, $D$ là đỉnh tháp).
        Mắt người ở điểm $M$, cách chân người $A$ khoảng $M A = 1.6" m"$.
        Kẻ $M H perp C D$ tại $H$, ta có:
        - $M H = A C = 80" m"$.
        - $C H = M A = 1.6" m"$.
        - Góc nâng $hat(H M D) = 32^circ$.
        
        #step([Tính độ dài đoạn HD])
        Trong tam giác vuông $M H D$:
        $ H D = M H dot tan 32^circ = 80 dot tan 32^circ approx 80 dot 0.6249 = 49.99" m" $
        
        #step([Tính tổng chiều cao tháp])
        $ h = C H + H D = 1.6 + 49.99 = 51.59" m" approx 52" m" $
    ]
)

#pagebreak()

// TLN 6: GTNN của tổng tan + cot kèm hình vẽ CeTZ
#tln([Cho góc nhọn $alpha$ ($0^circ < alpha < 90^circ$). Tìm giá trị nhỏ nhất của biểu thức $S = tan alpha + cot alpha$.],
    [2],
    loigiai: [
        #step([Áp dụng bất đẳng thức Cauchy])
        Vì $0^circ < alpha < 90^circ$ nên $tan alpha > 0$ và $cot alpha > 0$.
        Áp dụng bất đẳng thức Cauchy (AM-GM) cho hai số dương $tan alpha$ và $cot alpha$:
        $ S = tan alpha + cot alpha >= 2 sqrt(tan alpha dot cot alpha) $
        
        #step([Rút gọn và xác định giá trị nhỏ nhất])
        Vì $tan alpha dot cot alpha = 1$ với mọi $alpha != 0^circ, 90^circ$, ta có:
        $ S >= 2 sqrt(1) = 2 $
        Đẳng thức xảy ra khi và chỉ khi:
        $ tan alpha = cot alpha <=> tan^2 alpha = 1 <=> tan alpha = 1 <=> alpha = 45^circ $
        Do đó, giá trị nhỏ nhất của biểu thức $S$ bằng $2$ khi $alpha = 45^circ$.

        #step([Minh họa hình học trên nửa đường tròn đơn vị])
        Tại $alpha = 45^circ$, điểm $M$ trên đường tròn đơn vị có hoành độ bằng tung độ ($x_M = y_M = sqrt(2)/2$).
        
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
                content((-0.15 * sc, -0.12 * sc), [$O$])
                
                // Nửa đường tròn đơn vị
                arc((sc, 0), start: 0deg, stop: 180deg, radius: sc, stroke: 1.2pt + rgb("2563eb"))
                
                // Điểm 1 và -1 trên trục Ox, 1 trên Oy
                circle((sc, 0), radius: 1.5pt, fill: black)
                content((sc + 0.12 * sc, -0.12 * sc), [$1$])
                circle((-sc, 0), radius: 1.5pt, fill: black)
                content((-sc - 0.15 * sc, -0.12 * sc), [$-1$])
                circle((0, sc), radius: 1.5pt, fill: black)
                content((-0.12 * sc, sc + 0.12 * sc), [$1$])
                
                // Bán kính OM ứng với alpha = 45 độ
                let xM = 0.7071 * sc
                let yM = 0.7071 * sc
                line((0, 0), (xM, yM), stroke: 1.2pt + rgb("dc2626"))
                circle((xM, yM), radius: 2.2pt, fill: rgb("dc2626"), stroke: black)
                content((xM + 0.28 * sc, yM + 0.1 * sc), text(fill: rgb("dc2626"), weight: "bold")[$M(sqrt(2)/2; sqrt(2)/2)$])
                
                // Gióng tọa độ
                line((xM, 0), (xM, yM), stroke: (paint: luma(120), thickness: 0.5pt, dash: "densely-dashed"))
                line((0, yM), (xM, yM), stroke: (paint: luma(120), thickness: 0.5pt, dash: "densely-dashed"))
                content((xM, -0.14 * sc), box(fill: white, inset: 1pt)[#text(size: 8.5pt)[$sqrt(2)/2$]])
                content((-0.22 * sc, yM), box(fill: white, inset: 1pt)[#text(size: 8.5pt)[$sqrt(2)/2$]])
                
                // Cung góc 45 độ
                arc((0.35 * sc, 0), start: 0deg, stop: 45deg, radius: 0.35 * sc, stroke: 0.9pt + rgb("7c3aed"))
                content((0.45 * sc, 0.18 * sc), text(fill: rgb("7c3aed"), size: 8.5pt)[$45^circ$])
            })
        ]
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
