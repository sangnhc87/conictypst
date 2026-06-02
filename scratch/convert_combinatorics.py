import re
import os

filepath = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Comment out local show rules for headings at the beginning of the file (lines 23 to 45)
# Let's find the exact text of heading show rules
heading_show_rules = """// ─── Kiểu tiêu đề chuyên đề ────────────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D2137"), rgb("1565C0"), rgb("00695C"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("1565C0")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("1565C0"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("00695C"), size: 11pt, weight: "bold", "⬧ " + it.body),
)"""

commented_show_rules = """// Tiêu đề đã được kế thừa đồng bộ từ file cấu hình chính (CD-DaiSo-ToHop.typ)"""
content = content.replace(heading_show_rules, commented_show_rules)

# 2. Replace skill-badge with Level 1 Heading and add == Lý Thuyết
# Format: #skill-badge("Chủ Đề X", "Title", color: ...) -> = Chủ Đề X — Title \n\n == Lý Thuyết
def replace_skill_badge(match):
    code = match.group(1)
    title = match.group(2)
    return f"= {code} — {title}\n\n== Lý Thuyết"

content = re.sub(r'#skill-badge\(\"Chủ Đề (\d+)\",\s*\"(.*?)\",\s*color:\s*\S+\)', replace_skill_badge, content)

# 3. Locate #theory-box[...] and insert == Bài Tập Minh Họa right after it
# A theory box starts with `#theory-box[` and ends with `]`
# We can find each theory box block and replace its ending with `]\n\n== Bài Tập Minh Họa`
# Since nested brackets might be complex, let's search specifically for the pattern of each chapter
# Let's inspect how the theory boxes look like. They are always followed by #example-box
# So we can search for `#theory-box[` ... `]\n\n#example-box` and replace the transition with `]\n\n== Bài Tập Minh Họa\n\n#example-box`
content = re.sub(r'(#theory-box\[.*?\])\s*\n\s*(#example-box)', r'\1\n\n== Bài Tập Minh Họa\n\n\2', content, flags=re.DOTALL)

# 4. Define our new exercises to add at the end of key topics
# We want to add these new exercises as Example 4 inside the corresponding Chủ đề.
# Let's search for the end of Example 3 of the target Chủ đề, and append Example 4.
# Let's write the examples in the new #tln format.

new_ex_chude6_7 = """
#tln(
  id: "DS-6-4",
  [
    Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 = 10$ thỏa mãn các điều kiện ràng buộc: $1 <= x_1 <= 5$, $2 <= x_2 <= 6$, và $0 <= x_3 <= 4$.
  ],
  [6],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm nghiệm nguyên của phương trình có cả cận dưới và cận trên. Ta có thể tiếp cận theo hai phương pháp mạnh mẽ: Sử dụng nguyên lý bù trừ kết hợp vách ngăn, hoặc sử dụng hàm sinh đại số.
    ]

    #cach1-box[
      *Cách 1: Sử dụng Nguyên lý Bù trừ kết hợp Vách ngăn*
      
      Trước hết, ta chuyển đổi điều kiện cận dưới về không âm bằng cách đổi biến:
      - Đặt $y_1 = x_1 - 1 >= 0 arrow.r.double x_1 = y_1 + 1$. Cận trên trở thành $y_1 <= 4$.
      - Đặt $y_2 = x_2 - 2 >= 0 arrow.r.double x_2 = y_2 + 2$. Cận trên trở thành $y_2 <= 4$.
      - Đặt $y_3 = x_3 >= 0 arrow.r.double x_3 = y_3$. Cận trên trở thành $y_3 <= 4$.

      Thay vào phương trình ta được:
      $ (y_1 + 1) + (y_2 + 2) + y_3 = 10 leftrightarrow y_1 + y_2 + y_3 = 7 $
      Với điều kiện: $0 <= y_i <= 4$ với mọi $i = 1, 2, 3$.

      Ta đếm số nghiệm của phương trình mới bằng bù trừ:
      - Số nghiệm không âm tự do (không giới hạn trên):
        $ N_(Omega) = C_(7+3-1)^(3-1) = C_9^2 = 36 $
      - Xét các trường hợp vi phạm điều kiện cận trên ($y_i >= 5$):
        - Gọi $A_i$ là tập hợp các nghiệm có $y_i >= 5$.
        - Giả sử $y_1 >= 5$, đặt $y_1' = y_1 - 5 >= 0$. Phương trình trở thành $y_1' + y_2 + y_3 = 2$.
          Số nghiệm là: $C_(2+3-1)^(3-1) = C_4^2 = 6$.
        - Tương tự cho $y_2 >= 5$ và $y_3 >= 5$. Do vai trò các biến đối xứng, số lượng cách vi phạm của từng biến là bằng nhau.
        - Vì tổng bằng 7, không thể có hai biến đồng thời $>= 5$ (do $5 + 5 = 10 > 7$).
        Do đó $|A_1 inter A_2| = |A_1 inter A_3| = |A_2 inter A_3| = 0$.
      
      Theo nguyên lý bù trừ, số nghiệm thỏa mãn là:
      $ N = N_(Omega) - (|A_1| + |A_2| + |A_3|) = 36 - 3 dot 6 = 18 " nghiệm." $
    ]

    #cach2-box[
      *Cách 2: Sử dụng Hàm sinh Đại số (Generating Functions)*
      
      Mỗi biến $x_i$ có miền giá trị tương ứng với các đa thức:
      - $x_1 in {1, 2, 3, 4, 5} arrow.r.double P_1(x) = x + x^2 + x^3 + x^4 + x^5$.
      - $x_2 in {2, 3, 4, 5, 6} arrow.r.double P_2(x) = x^2 + x^3 + x^4 + x^5 + x^6$.
      - $x_3 in {0, 1, 2, 3, 4} arrow.r.double P_3(x) = 1 + x + x^2 + x^3 + x^4$.

      Hàm sinh tổng quát của bài toán là tích của ba đa thức này:
      $ f(x) = P_1(x) dot P_2(x) dot P_3(x) = (x + x^2 + x^3 + x^4 + x^5)(x^2 + x^3 + x^4 + x^5 + x^6)(1 + x + x^2 + x^3 + x^4) $
      Ta cần tìm hệ số của số hạng $x^(10)$ trong khai triển của $f(x)$. 
      Ta rút gọn đa thức bằng cách đặt nhân tử chung:
      $
        f(x) &= x dot (1 + x + x^2 + x^3 + x^4) dot x^2 dot (1 + x + x^2 + x^3 + x^4) dot (1 + x + x^2 + x^3 + x^4) \
             &= x^3 (1 + x + x^2 + x^3 + x^4)^3
      $
      Hệ số của $x^(10)$ trong $f(x)$ chính là hệ số của $x^7$ trong $(1 + x + x^2 + x^3 + x^4)^3$.
      Sử dụng công thức cấp số nhân: $1 + x + x^2 + x^3 + x^4 = frac(1-x^5, 1-x)$.
      Ta viết biểu thức dưới dạng:
      $
        (frac(1-x^5, 1-x))^3 &= (1-x^5)^3 (1-x)^(-3) \
                             &= (1 - 3x^5 + 3x^(10) - x^(15)) sum_(k=0)^oo C_(k+2)^2 x^k
      $
      Ta tìm hệ số của $x^7$ từ khai triển trên:
      - Số hạng $1$ nhân với hệ số của $x^7$ trong $(1-x)^(-3)$, tương ứng $k=7$:
        $ 1 dot C_(7+2)^2 = C_9^2 = 36 $
      - Số hạng $-3x^5$ nhân với hệ số của $x^2$ trong $(1-x)^(-3)$, tương ứng $k=2$:
        $ -3 dot C_(2+2)^2 = -3 dot C_4^2 = -3 dot 6 = -18 $
      - Các số hạng có bậc cao hơn $x^7$ (như $3x^(10)$) không đóng góp vào hệ số của $x^7$.
      
      Tổng hệ số thu được là: $36 - 18 = 18$ cách. Kết quả hoàn toàn trùng khớp với Cách 1!
    ]
  ]
)
"""

new_ex_chude8 = """
#tln(
  id: "DS-8-4",
  [
    Có 6 phần quà khác nhau đem chia cho 3 đứa trẻ sao cho đứa trẻ nào cũng nhận được ít nhất 1 phần quà. Hỏi có bao nhiêu cách chia quà?
  ],
  [540],
  loigiai: [
    #ppgiai[
      Đây là bài toán phân phối các phần tử phân biệt (6 phần quà) vào các hộp phân biệt (3 đứa trẻ) sao cho không có hộp nào rỗng. Ta giải bằng hai cách: sử dụng Số Stirling loại 2 kết hợp hoán vị, hoặc áp dụng trực tiếp Nguyên lý Bù trừ.
    ]

    #cach1-box[
      *Cách 1: Sử dụng Số Stirling loại 2 (Phân nhóm rồi phân vai)*
      
      Quy trình chia quà có thể chia làm hai bước:
      - Bước 1: Chia 6 phần quà phân biệt thành 3 nhóm không tên (không phân biệt) sao cho nhóm nào cũng có ít nhất 1 món quà. Số cách thực hiện chính là số Stirling loại 2 chập 3 của 6 phần tử: $S(6, 3)$.
      - Bước 2: Phân phối 3 nhóm quà này cho 3 đứa trẻ (phân biệt). Vì có 3 nhóm quà và 3 đứa trẻ nên số cách gán là $3! = 6$ cách.

      Tính số Stirling loại 2 $S(6, 3)$ bằng công thức truy hồi:
      $
        S(6, 3) &= 3 dot S(5, 3) + S(5, 2) \
        S(5, 3) &= 25 " (đã tính ở ví dụ trước)" \
        S(5, 2) &= frac(1, 2!) (2^5 - 2) = 15 \
        arrow.r.double S(6, 3) &= 3 dot 25 + 15 = 90 " nhóm."
      $
      Vậy tổng số cách chia quà cho 3 đứa trẻ là:
      $ N = 3! dot S(6, 3) = 6 dot 90 = 540 " cách." $
    ]

    #cach2-box[
      *Cách 2: Sử dụng Nguyên lý Bù trừ trực tiếp*
      
      Gọi $Omega$ là tập hợp tất cả các cách chia 6 phần quà cho 3 đứa trẻ một cách tùy ý (có thể có đứa không nhận được quà).
      Vì mỗi món quà có 3 cách chọn đứa trẻ để trao, nên:
      $ |Omega| = 3^6 = 729 " cách." $

      Gọi $A, B, C$ lần lượt là tập hợp các cách chia quà mà đứa trẻ thứ nhất, thứ hai, thứ ba tương ứng không nhận được món quà nào.
      Ta cần tính số lượng cách chia sao cho không có đứa trẻ nào bị rỗng quà, tức là:
      $ N = |Omega| - |A union B union C| $
      Áp dụng nguyên lý bù trừ:
      - $|A| = |B| = |C| = 2^6 = 64$ (chia 6 món quà cho 2 đứa trẻ còn lại).
      - $|A inter B| = |A inter C| = |B inter C| = 1^6 = 1$ (tất cả quà dồn cho đứa trẻ còn lại duy nhất).
      - $|A inter B inter C| = 0$ (không thể cả 3 đứa trẻ đều không có quà).

      Ta có:
      $ |A union B union C| = (64 + 64 + 64) - (1 + 1 + 1) + 0 = 192 - 3 = 189 $
      Vậy số cách chia quà hợp lệ là:
      $ N = 729 - 189 = 540 " cách." $
      Hai phương pháp cho cùng một kết quả tuyệt đẹp là 540!
    ]
  ]
)
"""

new_ex_chude13 = """
#tln(
  id: "DS-13-4",
  [
    Một đường đi kích thước $1 times n$ được lát bằng các viên gạch kích thước $1 times 1$ (có hai màu đỏ và xanh lá cây) và các viên gạch kích thước $1 times 2$ (chỉ có màu vàng). Gọi $a_n$ là số cách lát đường đi có chiều dài $n$.
    a) Thiết lập hệ thức truy hồi cho dãy $a_n$.
    b) Sử dụng hàm sinh hoặc phương trình đặc trưng để tìm công thức tổng quát của $a_n$.
  ],
  [frac((1+sqrt(2))^(n+1) + (1-sqrt(2))^(n+1), 2(1+sqrt(2)))],
  loigiai: [
    #ppgiai[
      Đây là bài toán lát gạch kết hợp màu sắc, được mô hình hóa hoàn hảo dưới dạng hệ thức truy hồi tuyến tính cấp hai hệ số hằng. Ta sẽ lập hệ thức truy hồi bằng Nguyên lý Trạng thái Cuối cùng, sau đó giải bằng cả phương pháp phương trình đặc trưng và phương pháp hàm sinh.
    ]

    #cach1-box[
      *Cách 1: Thiết lập truy hồi và giải bằng Phương trình đặc trưng*
      
      Xét viên gạch cuối cùng được đặt ở biên bên phải của đường đi dài $n$:
      - *Khả năng 1:* Viên gạch cuối là gạch $1 times 1$. Vì có 2 màu (đỏ hoặc xanh) nên có 2 cách chọn gạch cuối. Phần còn lại dài $n-1$ có $a_(n-1)$ cách lát.
        Số cách lát trong trường hợp này là $2 a_(n-1)$.
      - *Khả năng 2:* Viên gạch cuối là gạch $1 times 2$ màu vàng. Chỉ có 1 cách đặt. Phần còn lại dài $n-2$ có $a_(n-2)$ cách lát.
        Số cách lát trong trường hợp này là $a_(n-2)$.

      Cộng hai khả năng độc lập này lại, ta thu được hệ thức truy hồi:
      $ a_n = 2 a_(n-1) + a_(n-2) quad (forall n >= 2) $
      Với các điều kiện đầu dễ thấy:
      - $a_0 = 1$ (đường đi rỗng có đúng 1 cách lát: không làm gì).
      - $a_1 = 2$ (đường đi dài 1 chỉ dùng được 1 gạch $1 times 1$, có 2 lựa chọn màu: đỏ hoặc xanh).

      Phương trình đặc trưng của hệ thức là:
      $ r^2 - 2r - 1 = 0 leftrightarrow r = 1 + sqrt(2) " hoặc " r = 1 - sqrt(2) $
      Công thức tổng quát của dãy số có dạng:
      $ a_n = A dot (1 + sqrt(2))^n + B dot (1 - sqrt(2))^n $
      Thay $n=0, n=1$ để tìm các hằng số $A, B$:
      $
        A + B &= 1 \
        A(1+sqrt(2)) + B(1-sqrt(2)) &= 2
      $
      Giải hệ phương trình này ta được:
      $ A = frac(1 + sqrt(2), 2 sqrt(2)), quad B = frac(sqrt(2) - 1, 2 sqrt(2)) $
      Thay ngược lại, ta được công thức tổng quát tuyệt đẹp:
      $ a_n = frac(1+sqrt(2), 2sqrt(2)) (1+sqrt(2))^n + frac(sqrt(2)-1, 2sqrt(2)) (1-sqrt(2))^n = frac((1+sqrt(2))^(n+1) - (1-sqrt(2))^(n+1), 2sqrt(2)) $
    ]

    #cach2-box[
      *Cách 2: Giải bằng Hàm sinh (Generating Functions)*
      
      Gọi $A(x) = sum_(n=0)^oo a_n x^n$ là hàm sinh của dãy số.
      Từ hệ thức truy hồi $a_n - 2a_(n-1) - a_(n-2) = 0$ với mọi $n >= 2$:
      $
        A(x)    &= a_0 + a_1 x + a_2 x^2 + a_3 x^3 + dots \
        -2x A(x) &= - 2a_0 x - 2a_1 x^2 - 2a_2 x^3 - dots \
        -x^2 A(x) &= - a_0 x^2 - a_1 x^3 - dots
      $
      Cộng ba dòng này lại:
      $
        A(x)(1 - 2x - x^2) &= a_0 + (a_1 - 2a_0)x + sum_(n=2)^oo underbrace((a_n - 2a_(n-1) - a_(n-2)), =0) x^n \
                           &= a_0 + (a_1 - 2a_0)x
      $
      Thay điều kiện đầu $a_0 = 1, a_1 = 2$ vào ta được:
      $ A(x)(1 - 2x - x^2) = 1 + (2 - 2)x = 1 arrow.r.double A(x) = frac(1, 1 - 2x - x^2) $
      Để khai triển $A(x)$ thành chuỗi lũy thừa, ta phân tích mẫu số: $1 - 2x - x^2 = (1 - (1+sqrt(2))x)(1 - (1-sqrt(2))x)$.
      Dùng phương pháp hệ số bất định tách phân thức:
      $
        A(x) &= frac(1, (1 - (1+sqrt(2))x)(1 - (1-sqrt(2))x)) \
             &= frac(frac(1+sqrt(2), 2sqrt(2)), 1 - (1+sqrt(2))x) + frac(frac(sqrt(2)-1, 2sqrt(2)), 1 - (1-sqrt(2))x)
      $
      Áp dụng khai triển chuỗi hình học $frac(1, 1-y) = sum y^n$, ta có:
      $ A(x) = frac(1+sqrt(2), 2sqrt(2)) sum_(n=0)^oo (1+sqrt(2))^n x^n + frac(sqrt(2)-1, 2sqrt(2)) sum_(n=0)^oo (1-sqrt(2))^n x^n $
      Hệ số $a_n$ của $x^n$ chính là công thức tổng quát đã tìm được ở Cách 1!
    ]
  ]
)
"""

new_ex_chude14 = """
#tln(
  id: "DS-14-4",
  [
    Tính tổng sau bằng hai phương pháp khác nhau (sử dụng đạo hàm và sử dụng lập luận tổ hợp):
    $ S = sum_(k=1)^n k^2 C_n^k = 1^2 C_n^1 + 2^2 C_n^2 + dots + n^2 C_n^n $
  ],
  [n(n+1) 2^(n-2)],
  loigiai: [
    #ppgiai[
      Đây là bài toán tính tổng hệ số nhị thức Newton dạng trọng số bình phương. Ta giải bằng hai phương pháp cực kỳ đẹp mắt: Giải tích (đạo hàm hai lần) và Tổ hợp (đếm hai cách - Double Counting).
    ]

    #cach1-box[
      *Cách 1: Sử dụng Giải tích (Đạo hàm nhị thức)*
      
      Xuất phát từ khai triển nhị thức Newton quen thuộc:
      $ (1+x)^n = sum_(k=0)^n C_n^k x^k $
      Đạo hàm cả hai vế theo biến $x$, ta được:
      $ n(1+x)^(n-1) = sum_(k=1)^n k C_n^k x^(k-1) $
      Nhân cả hai vế với $x$ để khôi phục lại bậc của $x$:
      $ n x (1+x)^(n-1) = sum_(k=1)^n k C_n^k x^k $
      Đạo hàm hai vế một lần nữa theo $x$:
      $ n (1+x)^(n-1) + n(n-1) x (1+x)^(n-2) = sum_(k=1)^n k^2 C_n^k x^(k-1) $
      Bây giờ, thế $x = 1$ vào cả hai vế của phương trình:
      $
        S &= sum_(k=1)^n k^2 C_n^k \
          &= n (1+1)^(n-1) + n(n-1) (1) (1+1)^(n-2) \
          &= n 2^(n-1) + n(n-1) 2^(n-2) \
          &= n 2^(n-2) (2 + n - 1) = n(n+1) 2^(n-2)
      $
      Vậy tổng cần tìm là $S = n(n+1) 2^(n-2)$.
    ]

    #cach2-box[
      *Cách 2: Sử dụng Lập luận Tổ hợp (Đếm bằng hai cách - Double Counting)*
      
      Xét bài toán thực tế sau: Cho một nhóm gồm $n$ người. Ta muốn chọn ra một ủy ban gồm $k$ người ($k$ tùy ý từ 1 đến $n$), trong đó ủy ban này bầu ra $1$ người làm trưởng ban và $1$ người làm phó ban (trưởng ban và phó ban có thể trùng nhau). Hỏi có bao nhiêu cách thực hiện?

      - *Cách đếm 1 (Chọn ủy ban trước):*
        - Bước 1: Chọn ra nhóm ủy ban gồm $k$ người: có $C_n^k$ cách chọn.
        - Bước 2: Trong $k$ người này, chọn 1 trưởng ban ($k$ cách) và 1 phó ban ($k$ cách). Do hai vị trí có thể trùng nhau nên số cách chọn là $k dot k = k^2$ cách.
        Tổng số cách thực hiện với mọi quy mô ủy ban $k$ là:
        $ T = sum_(k=1)^n k^2 C_n^k $

      - *Cách đếm 2 (Chọn các chức danh trước):*
        Ta chia làm hai trường hợp dựa trên việc trưởng ban và phó ban có trùng nhau hay không:
        - *Trường hợp 1 (Trưởng ban và phó ban là hai người khác nhau):*
          - Chọn trưởng ban từ $n$ người: có $n$ cách.
          - Chọn phó ban từ $n-1$ người còn lại: có $n-1$ cách.
          - Với $n-2$ người còn lại, mỗi người có thể được chọn vào ủy ban hoặc không: có $2^(n-2)$ cách chọn các thành viên khác.
          Số cách trong trường hợp này là: $n(n-1) 2^(n-2)$.
        - *Trường hợp 2 (Trưởng ban và phó ban là cùng một người):*
          - Chọn người này giữ cả hai chức vụ từ $n$ người: có $n$ cách.
          - Với $n-1$ người còn lại, mỗi người có thể được chọn vào ủy ban hoặc không: có $2^(n-1)$ cách chọn.
          Số cách trong trường hợp này là: $n 2^(n-1) = 2 n 2^(n-2)$.

        Cộng hai trường hợp lại, ta được tổng số cách:
        $
          T &= n(n-1) 2^(n-2) + 2 n 2^(n-2) \
            &= n 2^(n-2) (n - 1 + 2) = n(n+1) 2^(n-2)
        $
      Do hai cách đếm cùng đếm một đối tượng duy nhất, kết quả của chúng phải bằng nhau. Ta suy ra công thức tổng cần tìm là: $S = n(n+1) 2^(n-2)$.
    ]
  ]
)
"""

# Let's insert the new examples right before the end of their respective topics or append them properly.
# To do this safely, let's write a python parser that parses the example-box calls.
# Let's read and convert the whole file using regular expressions for all example-boxes!

# Let's define the conversion function for example-box to tln
example_counter = {}

def replace_example_box(match):
    n_attr = match.group(1) # e.g. '1 (Dễ)' or '3 (Khó - Giải bằng 2 cách)'
    body = match.group(2).strip()
    
    # Generate a unique ID like DS-topic-example
    # Let's estimate which topic we are in. We can count skill badges or headings.
    # To keep it simple, we can assign a random or sequential ID, or just use the number in n_attr
    num_match = re.match(r'(\d+)', n_attr)
    num_str = num_match.group(1) if num_match else "1"
    
    # We can split the body into Question and Solutions.
    # Look for the first occurrence of:
    # `*Giải:*` or `*Cách 1 (...):*` or `*Cách 2 (...):*` or `*Cách 1:*` or `*Giải chi tiết:*`
    sol_markers = [
        r'\n\s*\*Giải:\*',
        r'\n\s*\*Cách 1.*?\*:',
        r'\n\s*\*Cách 1\*:',
        r'\n\s*\*Cách 1\*',
        r'\n\s*\*Giải chi tiết:\*'
    ]
    
    split_pos = -1
    marker_used = ""
    for marker in sol_markers:
        m = re.search(marker, body)
        if m:
            if split_pos == -1 or m.start() < split_pos:
                split_pos = m.start()
                marker_used = m.group(0)
                
    if split_pos != -1:
        question = body[:split_pos].strip()
        sol_part = body[split_pos:].strip()
    else:
        question = body
        sol_part = ""
        
    # Now parse the solution part.
    # If it has Cách 1 and Cách 2, let's extract them
    c1_match = re.search(r'\*Cách 1.*?\*(.*?)(?=\*Cách 2|$)', sol_part, re.DOTALL)
    c2_match = re.search(r'\*Cách 2.*?\*(.*)', sol_part, re.DOTALL)
    
    loigiai_content = ""
    if c1_match and c2_match:
        c1_text = c1_match.group(1).strip()
        # Clean leading colon if present
        if c1_text.startswith(':'): c1_text = c1_text[1:].strip()
        c2_text = c2_match.group(1).strip()
        if c2_text.startswith(':'): c2_text = c2_text[1:].strip()
        
        # We can write a ppgiai block if we want, or just leave it
        loigiai_content = f"""
    #ppgiai[
      Bài toán có thể giải quyết theo nhiều hướng tiếp cận khác nhau. Dưới đây là hai phương pháp chi tiết giúp học sinh hiểu rõ bản chất.
    ]

    #cach1-box[
      {c1_text}
    ]

    #cach2-box[
      {c2_text}
    ]
"""
    elif sol_part:
        # Standard solution
        sol_text = sol_part
        # Remove *Giải:* prefix
        sol_text = re.sub(r'^\*Giải:\*\s*', '', sol_text)
        sol_text = re.sub(r'^\*Giải chi tiết:\*\s*', '', sol_text)
        if sol_text.startswith(':'): sol_text = sol_text[1:].strip()
        
        loigiai_content = f"""
    #ppgiai[
      Xem hướng dẫn giải chi tiết dưới đây để nắm được phương pháp thực hiện.
    ]

    #cach1-box[
      {sol_text}
    ]
"""

    # We also want to extract the answer if there is one (like "Đáp số: 12 cách")
    # Let's check if there is an answer in the text. Usually the original solution ends with the answer.
    # We can search for the last equation or a sentence with "số cách là" or similar.
    # For now, let's leave the answer argument empty or look for a value.
    # We can try to extract from the last line: e.g. "Là 120 số" -> "120"
    ans_str = ""
    ans_match = re.search(r'(?:số cách|kết quả|là:)\s*(\$?\d+\.?\d*\$?|\$?[a-zA-Z0-9_\^\\(\\)\{\}\/,\.\-\+ ]+\$?)\s*(?:cách|số|đường)?\s*\.?\s*$', body, re.IGNORECASE)
    if ans_match:
        ans_str = ans_match.group(1).strip()
        # Remove trailing period if any
        if ans_str.endswith('.'): ans_str = ans_str[:-1]

    # Assemble the tln block
    return f"""#tln(
  id: "DS-EX-{num_str}",
  [
    {question}
  ],
  [{ans_str}],
  loigiai: [{loigiai_content}  ]
)"""

# Apply the regex substitution for example-box
content = re.sub(r'#example-box\(n:\s*\"(.*?)\"\)\[(.*?)\]', replace_example_box, content, flags=re.DOTALL)

# 5. Insert the new Example 4 problems at the end of key topics!
# Let's find:
# - End of Topic 6 (Vách ngăn cơ bản) -> before badge of Topic 7
# - End of Topic 8 (Phân hoạch tập hợp) -> before badge of Topic 9
# - End of Topic 13 (Hệ thức truy hồi) -> before badge of Topic 14
# - End of Topic 14 (Nhị thức Newton) -> before badge of Topic 15

# Let's insert `new_ex_chude6_7` right before `= Chủ Đề 7`
content = content.replace("= Chủ Đề 7 — Chia Kẹo Euler Mở Rộng — Hàm Sinh", new_ex_chude6_7 + "\n\n= Chủ Đề 7 — Chia Kẹo Euler Mở Rộng — Hàm Sinh")

# Let's insert `new_ex_chude8` right before `= Chủ Đề 9`
content = content.replace("= Chủ Đề 9 — Đếm Trong Hình Học Phẳng Và Lưới", new_ex_chude8 + "\n\n= Chủ Đề 9 — Đếm Trong Hình Học Phẳng Và Lưới")

# Let's insert `new_ex_chude13` right before `= Chủ Đề 14`
content = content.replace("= Chủ Đề 14 — Nhị thức Newton Và Biến Đổi Hệ Số", new_ex_chude13 + "\n\n= Chủ Đề 14 — Nhị thức Newton Và Biến Đổi Hệ Số")

# Let's insert `new_ex_chude14` right before `= Chủ Đề 15`
content = content.replace("= Chủ Đề 15 — Ứng Dụng Tổ Hợp Và Xác Suất Trò Chơi", new_ex_chude14 + "\n\n= Chủ Đề 15 — Ứng Dụng Tổ Hợp Và Xác Suất Trò Chơi")

# 6. Save the modified file
with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Restructuring script complete. Modified file saved.")
