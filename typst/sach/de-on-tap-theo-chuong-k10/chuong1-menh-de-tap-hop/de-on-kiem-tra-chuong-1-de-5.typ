#import "@preview/sang-math:1.0.6": *

#let mode = "dethi"
#let accent = rgb("0f766e")
#let ma-de = "1234"
#let in-qr-dap-an = true
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG 1 - ĐỀ 5",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: ma-de,
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)



  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  #tn(
    [Trong một buổi ngoại khóa, An nói: "Nếu trời không mưa thì lớp ta sẽ đi cắm trại". Buổi chiều, lớp đi cắm trại. Có thể kết luận điều gì về thời tiết?],
    (
[Trời chắc chắn không mưa.],
    [Trời chắc chắn có mưa.],
    True([Không thể kết luận chắc chắn trời có mưa hay không.]),
    [Trời vừa mưa vừa không mưa.],    ),
    loigiai: [
      - Mệnh đề có dạng $P => Q$ với $P$: "Trời không mưa" và $Q$: "Lớp đi cắm trại".
      - Sự thật là $Q$ xảy ra (Lớp đi cắm trại). 
      - Trong logic, từ việc $Q$ đúng không thể suy ngược lại $P$ đúng hay sai (mệnh đề đảo $Q => P$ không chắc chắn đúng).
      - Do đó, không thể biết chính xác trời có mưa hay không (có thể trời mưa nhưng lớp vẫn đi cắm trại vì một lý do khác).
    ]
  )

  #tn(
    [Cho mệnh đề $A$: "$forall x in RR, x^2 + 1 > 0$". Mệnh đề phủ định $overline(A)$ là:],
    (
[$forall x in RR, x^2 + 1 <= 0$],
    True([$exists x in RR, x^2 + 1 <= 0$]),
    [$exists x in RR, x^2 + 1 < 0$],
    [$exists x in RR, x^2 + 1 > 0$],    ),
    loigiai: [
      - Phủ định của lượng từ "với mọi" ($forall$) là "tồn tại" ($exists$).
      - Phủ định của bất đẳng thức "$>$" là "$<=$".
      - Vậy phủ định của mệnh đề ban đầu là: "$exists x in RR, x^2 + 1 <= 0$".
    ]
  )

  #tn(
    [Ký hiệu $A = {x in RR | x^2 < 4}$ và $B = {x in RR | -2 <= x <= 3}$. Tập hợp $A cap B$ là:],
    (
[$[-2; 2)$],
    True([$(-2; 2)$]),
    [$(-2; 3]$],
    [$(-2; 2]$],    ),
    loigiai: [
      - Giải bất phương trình xác định tập $A$: $x^2 < 4 <=> -2 < x < 2$. Vậy $A = (-2; 2)$.
      - Tập $B$ là đoạn $[-2; 3]$.
      - Giao của $A$ và $B$ là $A cap B = (-2; 2) cap [-2; 3] = (-2; 2)$.
    ]
  )

  #tn(
    [Trong một lớp học có $45$ học sinh, $28$ bạn thích môn Toán, $20$ bạn thích môn Văn và $10$ bạn không thích môn nào trong hai môn này. Số bạn thích cả hai môn Toán và Văn là:],
    (
[$10$],
    True([$13$]),
    [$15$],
    [$18$],    ),
    loigiai: [
      - Số bạn thích ít nhất một môn (Toán hoặc Văn) là: $45 - 10 = 35$ (bạn).
      - Ta có công thức: $n(T union V) = n(T) + n(V) - n(T cap V)$.
      - Thay số: $35 = 28 + 20 - n(T cap V) <=> n(T cap V) = 48 - 35 = 13$.
      - Vậy có $13$ bạn thích cả hai môn.
    ]
  )

  #tn(
    [Cho hai tập hợp $A = (-oo; m)$ và $B = [3m-1; 3m+3]$. Điều kiện của tham số $m$ để $A cap B = emptyset$ là:],
    (
[$m <= 1/2$],
    True([$m >= 1/2$]),
    [$m >= -1/2$],
    [$m <= -1/2$],    ),
    loigiai: [
      - Để $A cap B = emptyset$, toàn bộ tập $B$ phải nằm bên phải tập $A$.
      - Điều này tương đương với: $m <= 3m - 1$.
      - Giải bất phương trình: $2m >= 1 <=> m >= 1/2$.
    ]
  )

  #tn(
    [Một nhóm nghiên cứu gồm $10$ thành viên cần chọn ra một tập con các thành viên để tham gia hội thảo. Biết rằng trưởng nhóm và phó nhóm không thể cùng tham gia do bận công việc khác, nhưng nhóm đại diện phải có ít nhất $1$ người. Có bao nhiêu cách chọn một nhóm đại diện như vậy?],
    (
[$768$],
    True([$767$]),
    [$512$],
    [$256$],    ),
    loigiai: [
      - Có tổng cộng $10$ thành viên, trong đó có $1$ trưởng nhóm, $1$ phó nhóm và $8$ thành viên bình thường.
      - Số tập con bất kỳ (không chứa đồng thời cả trưởng và phó nhóm):
      - Cách 1: Chọn $0$ người (trong nhóm 2 người kia) và bất kỳ ai trong 8 người còn lại: $1 times 2^8 = 256$ cách.
      - Cách 2: Chọn đúng $1$ người (trong nhóm 2 người kia) và bất kỳ ai trong 8 người còn lại: $2 times 2^8 = 512$ cách.
      - Tổng cộng có: $256 + 512 = 768$ tập con không chứa cả trưởng và phó nhóm.
      - Vì nhóm đại diện phải có ít nhất $1$ người nên ta loại đi tập rỗng (thuộc Cách 1).
      - Vậy số cách chọn nhóm đại diện là: $768 - 1 = 767$ cách.
    ]
  )

  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  #ds(
    [Cho hai tập hợp $A = {x in ZZ | -3 < x <= 2}$ và $B = {x in ZZ | (x-1)(x^2-4)=0}$. Xét tính Đúng/Sai của các phát biểu sau:],
    (
True([Tập hợp $A$ có 5 phần tử.]),
    True([Tập hợp $B$ là một tập con của $A$.]),
    False([Tập hợp $A setminus B = {-2, 0}$.]),
    False([Số tập con của tập $A union B$ bằng 64.]),    ),
    loigiai: [
      - Tập $A$ chứa các số nguyên $x$ thỏa $-3 < x <= 2$, suy ra $A = {-2; -1; 0; 1; 2}$. Do đó $A$ có 5 phần tử. Mệnh đề a đúng.
      - Giải phương trình tập $B$: $(x-1)(x^2-4)=0 <=> x=1$ hoặc $x=2$ hoặc $x=-2$. Suy ra $B = {-2; 1; 2}$.
      - Mọi phần tử của $B$ đều thuộc $A$, nên $B subset A$. Mệnh đề b đúng.
      - Tập hợp $A setminus B = {-1; 0}$. Do đó mệnh đề c sai.
      - Vì $B subset A$ nên $A union B = A$. Số tập con của $A$ là $2^5 = 32$. Mệnh đề d sai.
    ]
  )

  #ds(
    [Một cuộc điều tra $100$ gia đình về việc sử dụng các thiết bị điện tử cho thấy: $80$ gia đình có ti vi, $60$ gia đình có tủ lạnh và $50$ gia đình có máy giặt. Có $40$ gia đình có cả ti vi và tủ lạnh, $35$ gia đình có ti vi và máy giặt, $30$ gia đình có tủ lạnh và máy giặt. Biết rằng có $5$ gia đình không có thiết bị nào trong 3 loại trên. Khẳng định nào sau đây là Đúng/Sai?],
    (
False([Số gia đình có ít nhất một trong ba thiết bị trên là 100.]),
    False([Số gia đình sở hữu cả ba thiết bị là 5.]),
    False([Số gia đình chỉ có duy nhất ti vi là 10.]),
    False([Số gia đình có đúng hai trong ba loại thiết bị trên là 90.]),    ),
    loigiai: [
      - Có 100 gia đình, 5 gia đình không có thiết bị nào, suy ra số gia đình có ít nhất 1 thiết bị là $100 - 5 = 95$. Mệnh đề a sai.
      - Áp dụng nguyên lý bù trừ: $n(T union L union M) = n(T)+n(L)+n(M) - n(T cap L) - n(L cap M) - n(M cap T) + n(T cap L cap M)$.
      - Thay số: $95 = 80 + 60 + 50 - 40 - 30 - 35 + n(T cap L cap M) <=> 95 = 85 + n(...) <=> n(T cap L cap M) = 10$. Số gia đình có cả 3 thiết bị là 10. Mệnh đề b sai.
      - Số gia đình chỉ có duy nhất tivi là: $n(T) - n(T cap L) - n(T cap M) + n(T cap L cap M) = 80 - 40 - 35 + 10 = 15$. Mệnh đề c sai.
      - Số gia đình có đúng 2 thiết bị: $(n(T cap L)-10) + (n(L cap M)-10) + (n(M cap T)-10) = 30 + 20 + 25 = 75$. Mệnh đề d sai.
    ]
  )

  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  

  



  #tln(
    [Tìm mật mã 3 chữ số:
- 721: Một số đúng và đúng vị trí.
- 745: Một số đúng nhưng sai vị trí.
- 164: Hai số đúng nhưng sai vị trí.
- 893: Không số nào đúng.
- 326: Một số đúng nhưng sai vị trí.
Hỏi mật mã là bao nhiêu?],
    [651],
    loigiai: [
      - "893" sai hết => loại 8, 9, 3.
      - "326": 3 sai => 2 hoặc 6 đúng.
      - "721": Giả sử 2 đúng và đứng giữa. Ở 326, 2 đứng giữa bảo sai vị trí => Mâu thuẫn. Vậy 2 sai.
      - "326": 3, 2 sai => 6 đúng. 6 ở cuối sai vị trí => 6 đầu hoặc giữa.
      - "721": 2 sai => 7 hoặc 1 đúng và đúng vị trí.
      - Nếu 7 đúng => 7 đầu. Ở 745, 7 đầu bảo sai vị trí => Mâu thuẫn. Vậy 7 sai.
      - 721: 7, 2 sai => 1 đúng và đúng cuối. Mã: ? ? 1.
      - 164: có 2 số đúng. 1 đúng (sai vị trí - hợp lý). 6 đúng (sai vị trí - 6 đứng giữa sai => 6 đứng đầu). Vậy 4 sai. Mã: 6 ? 1.
      - 745: 7, 4 sai => 5 đúng. 5 ở cuối sai vị trí => 5 ở giữa.
      - Mã khóa là 651.
    ]
  )

  #tln(
    [Có 4 người thợ đứng theo thứ tự 1, 2, 3, 4. 
- Người thợ mộc đứng cạnh người thợ xây.
- Người thợ sơn không đứng ở bìa.
- Người thợ điện đứng ngay bên phải thợ sơn.
- Thợ mộc đứng ở vị trí số 1.
Hỏi thợ điện đứng ở vị trí số mấy?],
    [4],
    loigiai: [
      - Thợ mộc = 1.
      - Thợ mộc cạnh thợ xây => Thợ xây = 2.
      - Thợ sơn không đứng ở bìa (tức là không phải 1 và 4). Vậy thợ sơn = 3.
      - Thợ điện đứng ngay phải thợ sơn => Thợ điện = 4.
      - Đáp án: 4.
    ]
  )
