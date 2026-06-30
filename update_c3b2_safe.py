with open('typst/sach/day-so-chuong3/c3-b2-de1.typ', 'r', encoding='utf-8') as f:
    content = f.read()

replacements = {
    "Công thức tổng quát: $u_n = u_1 + (n-1)d = -3 + 1/2 (n-1) = -7/2 + 1/2 n$.":
    "#step[*Áp dụng công thức:* \\\n      Công thức tổng quát: $u_n = u_1 + (n-1)d = -3 + 1/2 (n-1) = -7/2 + 1/2 n$.]",

    "Ta có $u_14 = u_4 + 10d => 18 = -12 + 10d => 10d = 30 => d = 3$.":
    "#step[*Sử dụng tính chất:* \\\n      Ta có $u_14 = u_4 + 10d => 18 = -12 + 10d => 10d = 30 => d = 3$.]",

    "Dãy $1, 3, 5,...$ là CSC có $u_1 = 1, d = 2$. \\\n    $S_(100) = 100/2 [2(1) + 99(2)] = 50 [2 + 198] = 50 \\times 200 = 10000$.":
    "#step[*B1: Phân tích dãy số:* \\\n      Dãy $1, 3, 5,...$ là CSC có $u_1 = 1, d = 2$.]\n    #step[*B2: Tính tổng 100 số hạng:* \\\n      $S_(100) = 100/2 [2(1) + 99(2)] = 50 [2 + 198] = 50 \\times 200 = 10000$.]",

    "Lập CSC: $x + 2y = 10$. Lập CSN: $x \\cdot 2y = 16$. \\\n    $x$ và $2y$ là nghiệm của pt $X^2 - 10X + 16 = 0 <=> X=2$ hoặc $X=8$. \\\n    Tập nghiệm là ${2, 8}$. Khoảng cách $|x - 2y| = |2 - 8| = 6$.":
    "#step[*B1: Thiết lập hệ phương trình:* \\\n      Lập CSC: $x + 2y = 10$. Lập CSN: $x \\cdot 2y = 16$.]\n    #step[*B2: Giải hệ phương trình:* \\\n      Theo định lý Viète, $x$ và $2y$ là nghiệm của pt $X^2 - 10X + 16 = 0 <=> X=2$ hoặc $X=8$.]\n    #step[*B3: Kết luận:* \\\n      Tập nghiệm là ${2, 8}$. Khoảng cách $|x - 2y| = |2 - 8| = 6$.]",

    "Cấp số cộng có $u_1 = 120, d = 15$. Số tiền lương nhận được sau 10 năm chính là $S_10$. \\\n    $S_(10) = 10/2 [2(120) + 9(15)] = 5 [240 + 135] = 5 \\times 375 = 1875$.":
    "#step[*B1: Mô hình hóa bằng CSC:* \\\n      Cấp số cộng có $u_1 = 120, d = 15$. Số tiền lương nhận được sau 10 năm chính là $S_10$.]\n    #step[*B2: Tính tổng lương:* \\\n      $S_(10) = 10/2 [2(120) + 9(15)] = 5 [240 + 135] = 5 \\times 375 = 1875$.]",

    "Trong một chu kỳ 12 giờ (từ lúc sau 12h đến 12h): \\\n    - Số tiếng chuông đánh vào các giờ đúng là tổng cấp số cộng: $S = 1 + 2 + ... + 12 = (12 \\times 13)/2 = 78$ tiếng. \\\n    - Số tiếng chuông đánh vào các nửa giờ (từ 1h30 đến 12h30) gồm 12 lần, mỗi lần 1 tiếng, tổng cộng là 12 tiếng. \\\n    Tổng cộng chuông đánh trong 12 giờ là: $78 + 12 = 90$ tiếng. \\\n    Trong một ngày đêm (24 giờ, gồm hai chu kỳ 12 giờ), tổng số tiếng chuông là: $90 \\times 2 = 180$ tiếng.":
    "#step[*B1: Tính chuông đánh giờ đúng (chu kỳ 12h):* \\\n      Số tiếng chuông đánh vào các giờ đúng là tổng cấp số cộng: $S = 1 + 2 + ... + 12 = (12 \\times 13)/2 = 78$ tiếng.]\n    #step[*B2: Tính chuông đánh nửa giờ:* \\\n      Số tiếng chuông đánh vào các nửa giờ (từ 1h30 đến 12h30) gồm 12 lần, mỗi lần 1 tiếng, tổng cộng là 12 tiếng.]\n    #step[*B3: Tổng kết 1 ngày:* \\\n      Tổng cộng chuông đánh trong 12 giờ là: $78 + 12 = 90$ tiếng. \\\n      Trong một ngày đêm (24 giờ, gồm hai chu kỳ 12 giờ), tổng số tiếng chuông là: $90 \\times 2 = 180$ tiếng.]",

    "Số ghế ở các hàng lập thành CSC có $u_1 = 16, d = 2$. \\\n    Tổng số ghế ở 25 hàng là: $S_(25) = 25/2 [2 u_1 + 24d] = 25/2 [2(16) + 24(2)] = 25/2 [32 + 48] = 25 \\times 40 = 1000$ ghế.":
    "#step[*B1: Mô hình hóa:* \\\n      Số ghế ở các hàng lập thành CSC có $u_1 = 16, d = 2$.]\n    #step[*B2: Tính tổng:* \\\n      Tổng số ghế ở 25 hàng là: $S_(25) = 25/2 [2 u_1 + 24d] = 25/2 [2(16) + 24(2)] = 25/2 [32 + 48] = 25 \\times 40 = 1000$ ghế.]",

    "a) Đúng. Tính chất: $u_3 + u_(13) = u_1 + u_(15) = 2u_1 + 14d$. \\\n    b) Đúng. $u_3 + u_(13) = 2 u_8 => u_8 = 80/2 = 40$. \\\n    c) Đúng. $S_(15) = 15/2 (u_1 + u_(15)) = 15/2 \\times 80 = 600$. \\\n    d) Sai. Có thể cấp số cộng này giảm hoặc không đổi nếu $d <= 0$.":
    "#step[*Kiểm tra từng mệnh đề:* \\\n    - a) Đúng. Tính chất: $u_3 + u_(13) = u_1 + u_(15) = 2u_1 + 14d$. \\\n    - b) Đúng. $u_3 + u_(13) = 2 u_8 => u_8 = 80/2 = 40$. \\\n    - c) Đúng. $S_(15) = 15/2 (u_1 + u_(15)) = 15/2 \\times 80 = 600$. \\\n    - d) Sai. Có thể cấp số cộng này giảm hoặc không đổi nếu $d <= 0$.]",

    "a) Đúng. Mỗi năm giảm $3000 / 15 = 200$ triệu. \\\n    b) Sai. Giá trị giảm dần nên công sai phải là $d = -200$. \\\n    c) Đúng. Cuối năm 5 (tương đương đầu năm 6): $u_6 = u_1 + 5d = 3000 - 1000 = 2000$ (tức 2 tỷ). \\\n    d) Sai. 10 năm trích được $10 \\times 200 = 2000$ triệu = $2$ tỷ đồng.":
    "#step[*Kiểm tra từng mệnh đề:* \\\n    - a) Đúng. Mỗi năm giảm $3000 / 15 = 200$ triệu. \\\n    - b) Sai. Giá trị giảm dần nên công sai phải là $d = -200$. \\\n    - c) Đúng. Cuối năm 5 (tương đương đầu năm 6): $u_6 = u_1 + 5d = 3000 - 1000 = 2000$ (tức 2 tỷ). \\\n    - d) Sai. 10 năm trích được $10 \\times 200 = 2000$ triệu = $2$ tỷ đồng.]",

    "a) Đúng. Ta coi bậc dưới cùng là $u_1 = 80$, bậc trên cùng là $u_(10) = 50$. \\\n    Ta có: $u_(10) = u_1 + 9d <=> 50 = 80 + 9d => 9d = -30 => d = -10/3$ cm. \\\n    b) Đúng. Bậc thứ 5 từ dưới lên: $u_5 = u_1 + 4d = 80 + 4(-10/3) = 240/3 - 40/3 = 200/3$ cm. \\\n    c) Đúng. Tổng chiều dài các bậc thang là: $S_(10) = 10/2 (u_1 + u_(10)) = 5 \\times (80 + 50) = 650$ cm = $6.5$ m. \\\n    d) Sai. Bậc thứ 6 tính từ dưới lên là: $u_6 = u_1 + 5d = 80 + 5(-10/3) = 80 - 50/3 = 190/3 \\approx 63.33$ cm chứ không phải $65$ cm.":
    "#step[*Kiểm tra từng mệnh đề:* \\\n    - a) Đúng. Ta coi bậc dưới cùng là $u_1 = 80$, bậc trên cùng là $u_(10) = 50$. Ta có: $u_(10) = u_1 + 9d <=> 50 = 80 + 9d => 9d = -30 => d = -10/3$ cm. \\\n    - b) Đúng. Bậc thứ 5 từ dưới lên: $u_5 = u_1 + 4d = 80 + 4(-10/3) = 240/3 - 40/3 = 200/3$ cm. \\\n    - c) Đúng. Tổng chiều dài các bậc thang là: $S_(10) = 10/2 (u_1 + u_(10)) = 5 \\times (80 + 50) = 650$ cm = $6.5$ m. \\\n    - d) Sai. Bậc thứ 6 tính từ dưới lên là: $u_6 = u_1 + 5d = 80 + 5(-10/3) = 80 - 50/3 = 190/3 \\approx 63.33$ cm chứ không phải $65$ cm.]",

    "Ta có $u_1 + u_6 = u_2 + u_5 = 15$. Hai số $u_2, u_5$ có tổng bằng 15, tích bằng 54. \\\n    Giải phương trình $X^2 - 15X + 54 = 0$ được hai nghiệm 6 và 9. \\\n    Vì công sai $d > 0$ nên $u_2 < u_5$. Vậy $u_2 = 6, u_5 = 9$. \\\n    Khoảng cách $u_5 - u_2 = 3d => 3d = 3 => d=1$. \\\n    Khi đó $u_4 = u_5 - d = 9 - 1 = 8$.":
    "#step[*B1: Sử dụng tính chất đối xứng:* \\\n      Ta có $u_1 + u_6 = u_2 + u_5 = 15$. Hai số $u_2, u_5$ có tổng bằng 15, tích bằng 54.]\n    #step[*B2: Giải phương trình bậc hai:* \\\n      Giải phương trình $X^2 - 15X + 54 = 0$ được hai nghiệm 6 và 9. \\\n      Vì công sai $d > 0$ nên $u_2 < u_5$. Vậy $u_2 = 6, u_5 = 9$.]\n    #step[*B3: Tìm số hạng cần thiết:* \\\n      Khoảng cách $u_5 - u_2 = 3d => 3d = 3 => d=1$. \\\n      Khi đó $u_4 = u_5 - d = 9 - 1 = 8$.]",

    "Chi phí mỗi mét lập thành CSC với $u_1 = 100, d = 20$. Số mét $n = 50$. \\\n    Tổng chi phí: $S_(50) = 50/2 [2(100) + 49(20)] = 25 [200 + 980] = 25 \\times 1180 = 29500$ nghìn. \\\n    Đổi ra triệu đồng: $29.5$ triệu.":
    "#step[*B1: Phân tích mô hình chi phí:* \\\n      Chi phí mỗi mét lập thành CSC với $u_1 = 100, d = 20$. Số mét $n = 50$.]\n    #step[*B2: Tính tổng chi phí:* \\\n      Tổng chi phí: $S_(50) = 50/2 [2(100) + 49(20)] = 25 [200 + 980] = 25 \\times 1180 = 29500$ nghìn. \\\n      Đổi ra triệu đồng: $29.5$ triệu.]",

    "Số gạch tạo thành CSC: $1, 4, 7...$ có $u_1 = 1, d = 3$. \\\n    $S_(20) = 20/2 [2(1) + 19(3)] = 10 [2 + 57] = 590$ viên.":
    "#step[*B1: Xác định dãy số:* \\\n      Số gạch tạo thành CSC: $1, 4, 7...$ có $u_1 = 1, d = 3$.]\n    #step[*B2: Tính tổng 20 tầng:* \\\n      $S_(20) = 20/2 [2(1) + 19(3)] = 10 [2 + 57] = 590$ viên.]",

    "Số tiền tiết kiệm mỗi tháng lập thành CSC có $u_1 = 200$ nghìn đồng, $d = 30$ nghìn đồng. \\\n    Số tháng tiết kiệm $n = 24$. \\\n    Tổng số tiền tích lũy được: $S_(24) = 24/2 [2(200) + 23(30)] = 12 [400 + 690] = 13080$ nghìn đồng. \\\n    Đổi ra triệu đồng: $13.08$ triệu đồng.":
    "#step[*B1: Mô hình hóa dòng tiền:* \\\n      Số tiền tiết kiệm mỗi tháng lập thành CSC có $u_1 = 200$ nghìn đồng, $d = 30$ nghìn đồng. Số tháng tiết kiệm $n = 24$.]\n    #step[*B2: Tính tổng tiền tiết kiệm:* \\\n      Tổng số tiền tích lũy được: $S_(24) = 24/2 [2(200) + 23(30)] = 12 [400 + 690] = 13080$ nghìn đồng. \\\n      Đổi ra triệu đồng: $13.08$ triệu đồng.]",

    "Số tấm pin ở mỗi hàng lập thành CSC có $u_1 = 12, d = 3$. \\\n    Hàng cuối cùng có $u_n = 57$. Ta có: \\\n    $u_n = u_1 + (n-1)d <=> 57 = 12 + (n-1) \\times 3 => n = 16$ hàng. \\\n    Tổng số tấm pin lắp đặt: $S_(16) = 16/2 (u_1 + u_(16)) = 8 \\times (12 + 57) = 552$ tấm pin.":
    "#step[*B1: Tìm số hàng pin:* \\\n      Số tấm pin ở mỗi hàng lập thành CSC có $u_1 = 12, d = 3$. \\\n      Hàng cuối cùng có $u_n = 57$. Ta có: \\\n      $u_n = u_1 + (n-1)d <=> 57 = 12 + (n-1) \\times 3 => n = 16$ hàng.]\n    #step[*B2: Tính tổng số tấm pin:* \\\n      Tổng số tấm pin lắp đặt: $S_(16) = 16/2 (u_1 + u_(16)) = 8 \\times (12 + 57) = 552$ tấm pin.]",

    "Quãng đường chạy mỗi ngày lập thành một CSC với $u_1 = 5$ km, công sai $d = 800$ m = $0.8$ km. \\\n    Tổng quãng đường chạy được sau 30 ngày tập luyện là: \\\n    $S_(30) = 30/2 [2 u_1 + 29d] = 15 \\times [2(5) + 29(0.8)] = 15 \\times [10 + 23.2] = 15 \\times 33.2 = 498$ km.":
    "#step[*B1: Chuyển đổi đơn vị và lập mô hình:* \\\n      Quãng đường chạy mỗi ngày lập thành một CSC với $u_1 = 5$ km, công sai $d = 800$ m = $0.8$ km.]\n    #step[*B2: Tính tổng quãng đường:* \\\n      Tổng quãng đường chạy được sau 30 ngày tập luyện là: \\\n      $S_(30) = 30/2 [2 u_1 + 29d] = 15 \\times [2(5) + 29(0.8)] = 15 \\times [10 + 23.2] = 15 \\times 33.2 = 498$ km.]",

    "Sản lượng than khai thác mỗi năm lập thành một CSC với $u_1 = 5.2$, công sai $d = -0.15$. \\\n    Tổng sản lượng khai thác sau 12 năm là: \\\n    $S_(12) = 12/2 [2 u_1 + 11d] = 6 \\times [2(5.2) + 11(-0.15)] = 6 \\times [10.4 - 1.65] = 6 \\times 8.75 = 52.5$ triệu tấn.":
    "#step[*B1: Lập mô hình khai thác:* \\\n      Sản lượng than khai thác mỗi năm lập thành một CSC với $u_1 = 5.2$, công sai $d = -0.15$.]\n    #step[*B2: Tính tổng sản lượng 12 năm:* \\\n      Tổng sản lượng khai thác sau 12 năm là: \\\n      $S_(12) = 12/2 [2 u_1 + 11d] = 6 \\times [2(5.2) + 11(-0.15)] = 6 \\times [10.4 - 1.65] = 6 \\times 8.75 = 52.5$ triệu tấn.]",

    "Các số tự nhiên có hai chữ số chia hết cho 3 lập thành một cấp số cộng:\n    $12, 15, 18, ..., 99$\n    với số hạng đầu $u_1 = 12$, công sai $d = 3$ và số hạng cuối $u_n = 99$. \\\n    Số lượng các số hạng là:\n    $ n = (99 - 12) / 3 + 1 = 30. $\n    Tổng của cấp số cộng này là:\n    $ S_(30) = 30/2 (u_1 + u_n) = 15 \\times (12 + 99) = 1665. $":
    "#step[*B1: Xác định tập hợp số:* \\\n      Các số tự nhiên có hai chữ số chia hết cho 3 lập thành một cấp số cộng:\n      $12, 15, 18, ..., 99$\n      với số hạng đầu $u_1 = 12$, công sai $d = 3$ và số hạng cuối $u_n = 99$.]\n    #step[*B2: Tính số lượng phần tử:* \\\n      Số lượng các số hạng là:\n      $ n = (99 - 12) / 3 + 1 = 30. $]\n    #step[*B3: Tính tổng dãy số:* \\\n      Tổng của cấp số cộng này là:\n      $ S_(30) = 30/2 (u_1 + u_n) = 15 \\times (12 + 99) = 1665. $]",

    "Ta có:\n    - Với $n = 1$: $S_1 = u_1 = 3(1)^2 + 5(1) = 8$. \\\n    - Với $n = 2$: $S_2 = u_1 + u_2 = 3(2)^2 + 5(2) = 22$. \\\n    Từ đó suy ra số hạng thứ hai: $u_2 = S_2 - u_1 = 22 - 8 = 14$. \\\n    Công sai của cấp số cộng là: $d = u_2 - u_1 = 14 - 8 = 6$.":
    "#step[*B1: Tìm $u_1$ và $u_2$:* \\\n      Ta có:\n      - Với $n = 1$: $S_1 = u_1 = 3(1)^2 + 5(1) = 8$. \\\n      - Với $n = 2$: $S_2 = u_1 + u_2 = 3(2)^2 + 5(2) = 22$. \\\n      Từ đó suy ra số hạng thứ hai: $u_2 = S_2 - u_1 = 22 - 8 = 14$.]\n    #step[*B2: Tính công sai:* \\\n      Công sai của cấp số cộng là: $d = u_2 - u_1 = 14 - 8 = 6$.]"
}

for old, new in replacements.items():
    if old not in content:
        print(f"Failed to find: {old[:30]}...")
    else:
        content = content.replace(old, new)

with open('typst/sach/day-so-chuong3/c3-b2-de1.typ', 'w', encoding='utf-8') as f:
    f.write(content)
print("Done updating c3-b2-de1.typ")
