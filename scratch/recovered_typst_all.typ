Created At: 2026-05-29T13:21:41Z
Completed At: 2026-05-29T13:21:41Z
File Path: `file:///Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ`
Total Lines: 1322
Total Bytes: 64469
Showing lines 1 to 800
The following code has been modified to include a line number before every line, in the format: <line_number>: <original_line>. Please note that any changes targeting the original code should remove the line number, colon, and leading space.
1: // ═══════════════════════════════════════════════════════════
2: // CD-XepGhe-Nang-Cao.typ
3: // Chuyên đề: XẾP GHẾ NÂNG CAO — 3 DẠNG ĐẶC BIỆT
4: //   Dạng 1 — Hai dãy đối diện: cùng lớp không ngồi đối diện
5: //   Dạng 2 — Hàng thẳng: không quá k học sinh cùng lớp liên tiếp
6: //   Dạng 3 — Vòng tròn: xếp quanh bàn tròn có ràng buộc
7: // ═══════════════════════════════════════════════════════════
8:
9: #import "../sang-exam.typ": *
10: #import "../template.typ": *
11: #import "@preview/cetz:0.5.2"
12:
13: #set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
14: #set text(font: "New Computer Modern", size: 11pt, lang: "vi")
15: #set par(justify: true, leading: 0.85em)
16: // Display-mode fractions (như \dfrac trong LaTeX)
17: #show math.frac: it => { sh
    return False
                            continue
def parse_chunks(chunks_str):
    if not isinstance(chunks_str, str):
        return chunks_str
                            try:
    # Try standard json parse first
    try:
        return json.loads(chunks_str, strict=False)
    except:
        pass
                            except ValueError:
    # Regex fallback for truncated chunks
    parts = chunks_str.split('{"AllowMultiple":')
    chunks = []
    for part in parts[1:]:
        part = '{"AllowMultiple":' + part
        m_end = re.search(r'"EndLine":\s*(\d+)', part)
        m_start = re.search(r'"StartLine":\s*(\d+)', part)
        m_rep = re.search(r'"ReplacementContent
773:
774:   Số cách:
775:   $ N = 90 times 4! times 5! = 90 times 24 times 120 = bold(259200) $
776: ]
777:
778: == 2.5 — Trường Hợp Cả Hai Lớp Đều Bị Ràng Buộc
779:
780: Khi cả lớp A lẫn lớp B đều bị ràng buộc (không quá $k_A$ A liên tiếp và không quá $k_B$ B liên tiếp), bài toán khó hơn vì ta phải liệt kê cấu trúc xen kẽ của cả hai.
781:
782: #method-box[
783:   *Cách đếm khi 2 lớp cùng bị ràng buộc:*
784:
785:   Mọi dãy hợp lệ có dạng xen kẽ: $X_1 Y_1 X_2 Y_2 dots$ trong đó $X_i$ là đợt của một lớp, $Y_j$ là đợt của lớp kia. Cụ thể:
786:
787:   - Gọi $r_A$ = số đợt A và $r_B$ = số đợt B. Trong dãy xen kẽ: $|r_A - r_B| <= 1$.
788:   - Số cách cụ thể:
789:     - Nếu bắt đầu bằng A và kết thúc bằng A ($r_A = r_B + 1$): cấu trúc $A B A B dots A$.
790:     - Nếu bắt đầu bằng A và kết thúc bằng B ($r_A = r_B$): cấu trúc $A B A B dots B$.
791:     - Nếu bắt đầu bằng B và kết thúc bằng B ($r_B = r_A + 1$): cấu trúc $B A B A dots B$.
792:     - Nếu bắt đầu bằng B và kết thúc bằng A ($r_A = r_B$): cấu trúc $B A B A dots A$.
793:
794:   Với mỗi cặp $(r_A, r_B)$ hợp lệ và mỗi cấu trúc bắt đầu/kết thúc:
795:   $ "Đóng góp" = f(n_A, r_A, k_A) times f(n_B, r_B, k_B) $
796:
797:   Tổng $S$ = tổng đóng góp qua tất cả cặp $(r_A, r_B)$ và kiểu bắt đầu hợp lệ.
798: ]
799:
800: #eg-box(title: "🎯 Ví Dụ 2.3 — 3A, 4B, cả hai $k=2$")[
The above content does NOT show the entire file contents. If you need to view any lines of the file which were not shown to complete your task, call this tool again to view those lines.
// MISSING LINE 74
// MISSING LINE 75
    Hàm sinh cho từng biến số ứng với các điều kiện ràng buộc như sau:
// MISSING LINE 77
// MISSING LINE 78
// MISSING LINE 79
// MISSING LINE 80
// MISSING LINE 81
// MISSING LINE 82
// MISSING LINE 83
// MISSING LINE 84
// MISSING LINE 85
// MISSING LINE 86
// MISSING LINE 87
// MISSING LINE 88
// MISSING LINE 89
// MISSING LINE 90
// MISSING LINE 91
// MISSING LINE 92
// MISSING LINE 93
// MISSING LINE 94
// MISSING LINE 95
// MISSING LINE 96
// MISSING LINE 97
// MISSING LINE 98
// MISSING LINE 99
// MISSING LINE 100
            # Avoid views after step 4990 because they are for the reverted 15-problem version
            if line_num <= 4990:
                content = data.get("content", "")
                if "CD-DaiSo-ToHop-content.typ" in content and ("File Path" in content or "Showing lines" in content):
                    viewed_lines = {}
                    for l in content.splitlines():
                        m = re.match(r'^(\d+):\s(.*)', l)
                        if m:
                            l_num = int(m.group(1))
                            l_text = m.group(2)
                            viewed_lines[l_num] = l_text
                    if viewed_lines:
                        max_viewed = max(viewed_lines.keys())
                        if len(virtual_file) - 1 < max_viewed:
                            virtual_file += [""] * (max_viewed - (len(virtual_file) - 1))
                        updated = 0
                        for l_num, l_text in viewed_lines.items():
                            if virtual_file[l_num] != l_text:
                                virtual_file[l_num] = l_text
                                updated += 1
                        if updated > 0:
                            print(f"Line {line_num}: Updated {updated} lines from view_file response. New len={len(virtual_file)-1}")
        except Exception as e:
            print(f"Error parsing line {line_num}: {e}")
out_path = "/Users/admin/conictypst/scratch/reconstructed_virtual_v4.typ"
with open(out_path, "w", encoding="utf-8") as out_f:
    out_f.write("\n".join(virtual_file[1:]))
print(f"Saved reconstructed virtual file (v4) to {out_path}")
print(f"Final length: {len(virtual_file)-1}")
    radius: 10pt,
      [], [Trang #counter(page).display()],
    )
  },
)
// ═══════════════════════════════════════════════
// CHƯƠNG 1: HAI DÃY ĐỐI DIỆN
// ═══════════════════════════════════════════════
= Chương 1 — Hai Dãy Đối Diện: Nguyên Lý Cột Độc Lập
Bài toán "hai dãy đối diện" xuất hiện khi ta xếp học sinh vào hai hàng ghế song song nhau — như kiểu ngồi đối mặt trên toa tàu hay trong phòng hội thảo. Ràng buộc thường gặp nhất trong đề thi là: *hai học sinh cùng lớp không được ngồi đối diện nhau*. Lưu ý rằng *không có ràng buộc nào về ghế kế bên* — học sinh cùng lớp vẫn được ngồi liền nhau trong cùng một hàng.
Đây là dạng bài trông có vẻ phức tạp nhưng thực ra có cấu trúc đẹp nhất trong tổ hợp xếp ghế, bởi vì các *cột* (cặp ghế đối diện) hoàn toàn độc lập với nhau.
== 1.1 — Cấu Hình Bài Toán và Bước Đột Phá Then Chốt
#rev-box(title: "🔷 Cấu Hình Chuẩn")[
  Cho $m$ ghế ở *Hàng 1* và $m$ ghế ở *Hàng 2* xếp song song đối diện nhau. Đánh số cột $1, 2, dots, m$.
  Mỗi *cột* $c$ gồm 2 ghế:
  - Ghế $(1, c)$: Hàng 1, cột $c$.
    radius: 10pt,
  *Hệ quả:* Nếu chỉ có 2 lớp và $n_A != n_B$, số cách xếp thỏa mãn điều kiện đề bài chắc chắn bằng $bold(0)$ cách!
]
== 1.4 — Tổng Quát Nhiều Lớp: Nguyên Lý Phân Bổ Kiểu Cột
Khi có từ 3 lớp trở lên, một cột ghế không nhất thiết phải là $\{A, B\}$ nữa. Nó có thể là $\{A, C\}$, $\{B, C\}$, v.v. Nhiệm vụ của chúng ta là phân tích cấu trúc chưa đánh nhãn (Unlabeled) bằng cách tìm các cách ghép nhóm lớp hợp lệ cho mỗi cột.
#rev-box(title: "🔷 Khung Lý Thuyết Tổng Quát cho $s$ Lớp")[
  3. Chọn hàng cho mỗi cột: $2^3 = 8$ cách.
  Tổng số cách xếp thu được là:
  $ N = 6 times 8 times 8 = bold(384) " cách." $
]
#eg-box(title: "🎯 Ví Dụ 1.7 — 2A, 2B, 1C, 1D ngồi 2 hàng 3 ghế ($m=3$)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 3 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  *Lời giải chi tiết:*
  Ta có $m = 3$ cột. Ta phân tích các phương án dựa vào vị trí của C và D:
  - **Trường hợp 1: C và D ngồi đối diện nhau.**
    Có 1 cột kiểu $(C, D)$. Hai cột còn lại chứa 2A và 2B $arrow.r$ bắt buộc phải là 2 cột kiểu $(A, B)$.
    + Số cách gán kiểu cột vào vị trí: $M_1 = frac(3!, 1! times 2!) = 3$ cách.
    + Hoán vị học sinh cụ thể: $2!$ (lớp A) $times 2!$ (lớp B) $times 1!$ (lớp C) $times 1!$ (lớp D) $= 4$ cách.
    + Đảo hàng: $2^3 = 8$ cách.
    + Đóng góp TH1: $N_1 = 3 times 4 times 8 = 96$ cách.
  - **Trường hợp 2: C và D đối diện với học sinh lớp khác.**
    + **TH2a: C ghép với A, D ghép với B.**
      Kiểu cột gồm: 1 cột $(A, C)$, 1 cột $(B, D)$. Cột còn lại chứa 1A và 1B còn lại $arrow.r$ kiểu $(A, B)$.
      Số cách gán kiểu cột: $M_{2a} = frac(3!, 1! times 1! times 1!) = 6$ cách.
      Đóng góp TH2a: $N_{2a} = 6 times 4 times 8 = 192$ cách.
    + **TH2b: C ghép với B, D ghép với A.**
      Kiểu cột gồm: 1 cột $(B, C)$, 1 cột $(A, D)$ và 1 cột $(A, B)$.
      Tương tự TH2a, số cách gán kiểu cột: $M_{2b} = 6$ cách.
      Đóng góp TH2b: $N_{2b} = 6 times 4 times 8 = 192$ cách.
  Tổng số cách xếp là:
  $ N = N_1 + N_{2a} + N_{2b} = 96 + 192 + 192 = bold(480) " cách." $
]
== 1.5 — Bài Tập Luyện Chương 1
#recap-box[
  *Dạng 1 — 2 lớp bằng nhau:* $n_A = n_B = m$ $arrow.r$ Áp dụng trực tiếp $N = 2^m (m!)^2$.
]
#ex-box(title: "✏️ Bài C1")[
  Có 4 học sinh lớp A và 4 học sinh lớp B. Xếp tất cả vào 2 hàng 4 ghế đối diện nhau sao cho không có 2 học sinh cùng lớp ngồi đối diện. Hỏi có bao nhiêu cách?
]
#step-box[
#step-box[
  Tổng học sinh = 9, nhưng 2 hàng × $m$ ghế phải = 9. Vì 9 lẻ, không thể chia đều → *bài toán không có nghiệm* với ràng buộc "mỗi cột có đúng 2 học sinh khác lớp".
  *Sửa bài:* Nếu có 2 học sinh mỗi lớp ($n_A = n_B = n_C = 2$, tổng 6 = 2 hàng 3 ghế): đây là đúng Ví Dụ ở mục 1.4 trên, đáp án $N = 384$.
]
#recap-box[
  *Biến thể hàng 1/hàng 2:* Phân tích từng học sinh bị ràng buộc. Dùng quy tắc nhân độc lập theo từng bước ghép.
]
#ex-box(title: "✏️ Bài C3 — Phân Biệt Hai Hàng Ghế")[
  Xét lại Bài C1 (4A, 4B, 2 hàng 4 ghế). Bây giờ thêm điều kiện: 3 học sinh đặc biệt $A_1, B_1, B_2$ *không được ngồi Hàng 1*. Tính lại số cách.
]
#step-box[
  Bây giờ Hàng 1 chỉ có thể chứa $A_2, A_3, A_4$ (3 học sinh A) và không ai trong $B_1, B_2$ (chỉ có $B_3, B_4$ được ở Hàng 1).
  Cột nào được chia $A_i$ (Hàng 1) và $B_j$ (Hàng 2): không phải tất cả cột đều có thể như vậy nữa.
  *Phân tích cụ thể:*
  - $A_1$ phải ở Hàng 2. $B_1, B_2$ phải ở Hàng 2.
  - Trong 4 cột, mỗi cột có 1 A và 1 B, nhưng ai ở Hàng 1 bị hạn chế.
  - Cột chứa $A_1$: A ở Hàng 2 → B ở Hàng 1. B ở Hàng 1 phải là $B_3$ hoặc $B_4$.
  - Cột chứa $B_1$: B ở Hàng 2 → A ở Hàng 1. A ở Hàng 1 chỉ được là $A_2, A_3, A_4$.
  - Cột chứa $B_2$: tương tự, A ở Hàng 1 chỉ là $A_2, A_3, A_4$.
  *Phương pháp bước:*
  Bước 1: Ghép $A_1$ vào một cột với một B nào đó. Vì $A_1$ phải Hàng 2, B cùng cột phải Hàng 1, tức B phải là $B_3$ hoặc $B_4$ (vì $B_1, B_2$ không được Hàng 1): *2 cách* chọn B.
  Bước 2: Ghép $B_1$ với một A nào đó. $B_1$ Hàng 2, A cùng cột Hàng 1, A phải là $A_2, A_3, A_4$. Nhưng 1 trong số $A_2, A_3, A_4$ đã đi với cột trên: còn *3 cách* chọn A.
  Bước 3: Ghép $B_2$ tương tự: còn *2 cách*.
  Bước 4: Cột cuối (còn 1 A và 1 B): 1 cách, cả 2 có thể lên Hàng 1 hoặc không (kiểm tra: A còn lại là $A_?$ không cấm Hàng 1, B còn lại là $B_3$ hoặc $B_4$ không cấm Hàng 1). Hàng 1: *2 cách*.
  Bước 5: Gán 4 cột vào 4 vị trí cột (thứ tự từ trái qua phải): $4! = 24$ cách.
  $N = 2 times 3 times 2 times 2 times 24 = bold(576)$.
]
#recap-box[
  *Nhiều lớp — n_max = m:* Lớp chiếm đúng nửa → mỗi cột bắt buộc 1 người lớp đó → 1 phân bổ duy nhất.
]
#ex-box(title: "✏️ Bài C4 — Nhiều Lớp, Lớp Lớn Chiếm Nửa")[
  *Mở rộng:* Nếu bớt đi mỗi lớp 1 học sinh (còn 2A, 2B, 2C xếp vào 2 hàng 3 ghế):
  Áp dụng kết quả từ *Ví dụ 1.6*, ta có đáp án là $bold(384)$ cách.
]
#recap-box[
  *Biến thể hàng 1/hàng 2:* Phân tích từng học sinh bị ràng buộc. Dùng quy tắc nhân độc lập theo từng bước ghép.
]
#ex-box(title: "✏️ Bài C3 — Phân Biệt Hai Hàng Ghế")[
  Xét lại Bài C1 (4A, 4B, 2 hàng 4 ghế). Bây giờ thêm điều kiện: 3 học sinh đặc biệt $A_1, B_1, B_2$ *không được ngồi Hàng 1*. Tính lại số cách.
]
#step-box[
  Bây giờ Hàng 1 chỉ có thể chứa $A_2, A_3, A_4$ (3 học sinh A) và không ai trong $B_1, B_2$ (chỉ có $B_3, B_4$ được ở Hàng 1).
  Cột nào được chia $A_i$ (Hàng 1) và $B_j$ (Hàng 2): không phải tất cả cột đều có thể như vậy nữa.
  *Phân tích cụ thể:*
  - $A_1$ phải ở Hàng 2. $B_1, B_2$ phải ở Hàng 2.
  - Trong 4 cột, mỗi cột có 1 A và 1 B, nhưng ai ở Hàng 1 bị hạn chế.
  - Cột chứa $A_1$: A ở Hàng 2 → B ở Hàng 1. B ở Hàng 1 phải là $B_3$ hoặc $B_4$.
== 2.4 — Trường Hợp Ràng Buộc $k = 2$ (Không quá 2 bạn cùng lớp liên tiếp)
Đây là trường hợp phổ biến nhất trong các đề thi nâng cao. Khi $k = 2$, mỗi đợt chỉ có thể có độ dài là 1 hoặc 2.
#method-box[
  *Tư duy Hệ
  *Lỗi:* $sum n_i = 3 + 2 + 2 = 7 != 2 times 3 = 6$. *Tổng lẻ*, bài toán không có nghiệm!
  - $n_A = 3 = m$ → phân bổ duy nhất ${"\1", "\2", "\3"}$: $M = frac(3!, 2!) = 3$.
  *Kết luận:* Cần điều chỉnh đề bài. Với 7 học sinh, không thể xếp vào 2 hàng mỗi hàng đúng số ghế bằng nhau và đủ chỗ.
]
  *Phiên bản đúng:* 3A, 2B, 1C (tổng 6 = 2×3):
  - $n_A = 3 = m$ → phân bổ duy nhất ${"\1", "\2", "\3"}$: $M = frac(3!, 2!) = 3$.
  - $N = 3 times 3! times 2! times 1! times 2^3 = 3 times 6 times 2 times 8 = bold(288)$.
]
// CHƯƠNG 2: KHÔNG QUÁ k LIÊN TIẾP
#pagebreak()
= Chương 2 — Không Quá _k_ Học Sinh Cùng Lớp Liên Tiếp
// ═══════════════════════════════════════════════
// CHƯƠNG 2: KHÔNG QUÁ k LIÊN TIẾP
// ═══════════════════════════════════════════════
= Chương 2 — Không Quá _k_ Học Sinh Cùng Lớp Liên Tiếp
Đây là dạng bài *tổng quát hóa trực tiếp* của bài "không ai cùng lớp ngồi kề nhau" (tức $k=1$). Thay vì cấm hoàn toàn, đề bài chỉ giới hạn: *trong cùng một hàng, không được có quá $k$ học sinh cùng lớp ngồi liên tiếp nhau*. Dạng $k=1$ đã được xử lý bởi phương pháp Vách Ngăn và PIE trong file "Bản Chất & Tổng Quát Hóa". File này giải quyết $k >= 2$.
Công cụ chính: *phân tích cấu trúc đợt* (run-length decomposition) kết hợp *sao và thanh chắn* (Stars & Bars).
== 2.1 — Khái Niệm "Đợt" (Run)
#rev-box(title: "📖 Định Nghĩa Đợt")[
  Trong một dãy xếp chỗ, một *đợt* (hay *khối chạy*, tiếng Anh: _run_) của lớp A là một đoạn *dài nhất liên tiếp* gồm toàn học sinh lớp A.
]
  *Ví dụ:* Dãy xếp chỗ $A B B A A A B A$ có 4 đợt của lớp A:
#recap-box[
  *Nhiều lớp — n_max < m:* Liệt kê tất cả phân bổ kiểu cột, bắt đầu từ lớp nhỏ nhất. Cộng đóng góp từng phân bổ.
]
#ex-box(title: "✏️ Bài C5 — Nhiều Lớp, Nhiều Phân Bổ")[
  Có 3 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C ngồi vào 2 hàng 3 ghế. Không cặp đối diện nào cùng lớp. Tính số cách.
  *Ràng buộc "không quá $k$ liên tiếp":* mỗi đợt của lớp A có độ dài $<= k$.
  _(Gợi ý: $n_A = 3 = m$, xem lớp A chiếm nửa không?)_
]
]
#step-box[
  $n_A = 3 = m = 3$ → mỗi cột đúng 1 học sinh A. Các học sinh không phải A: $B_1, B_2, C_1, C_2$ phân vào 3 cột. Phân bổ bắt buộc:
  $ {(A,B), (A,B), (A,C), (A,C)} quad arrow.r quad t_("AB")=2, t_("AC")=2 $
  *Kiểm tra:* A dùng $2+2=4$... nhưng $n_A = 3$ ≠ 4! Điều này sai!
  *Nhận xét lại:* 3 cột, mỗi cột 1A, vậy tổng A dùng = 3 ✓. Nhưng non-A: $B_1, B_2, C_1, C_2$ = 4 người cho 3 slot non-A → không khớp!
  *Lỗi:* $sum n_i = 3 + 2 + 2 = 7 != 2 times 3 = 6$. *Tổng lẻ*, bài toán không có nghiệm!
  *Kết luận:* Cần điều chỉnh đề bài. Với 7 học sinh, không thể xếp vào 2 hàng mỗi hàng đúng số ghế bằng nhau và đủ chỗ.
  *Phiên bản đúng:* 3A, 2B, 1C (tổng 6 = 2×3):
  - $n_A = 3 = m$ → phân bổ duy nhất ${"\1", "\2", "\3"}$: $M = frac(3!, 2!) = 3$.
  - $N = 3 times 3! times 2! times 1! times 2^3 = 3 times 6 times 2 times 8 = bold(28
  2. **Bước 2 — Đếm số phân hoạch đợt của A (ký hiệu là $f(n_A, r, k)$):**
     Đây là số cách chia $n_A$ phần tử giống nhau thành $r$ nhóm, mỗi nhóm có kích thước từ $1$ đến $k$. Công thức tổng quát dùng bao hàm loại trừ là:
     $ f(n_A, r, k) = sum_(j=0)^(\lfloor (n_A - r)/k \rfloor) (-1)^j \binom(r, j) \binom(n_A - j k - 1, r - 1) $
== 2.1 — Khái Niệm "Đợt" (Run)
  3. **Bước 3 — Tạo vách ngăn và đặt các đợt A vào:**
#rev-box(title: "📖 Định Nghĩa Đợt (Nhóm chạy liên tiếp)")[
  Trong một hàng ghế, một *đợt* của lớp A là một đoạn gồm các học sinh lớp A ngồi kề nhau liên tiếp, sao cho đoạn đó *dài nhất có thể* (tức là hai đầu của đoạn đó phải là học sinh lớp khác hoặc là đầu hàng).
     Ta chọn ra $r$ khe hở từ $n_B + 1$ khe hở này để đặt $r$ đợt của lớp A vào. Vì giữa hai đợt A bắt buộc phải có ít nhất một học sinh B ngăn cách (để chúng không bị dính vào nhau thành đợt lớn hơn), nên mỗi khe hở chỉ chứa tối đa 1 đợt A.
  *Ví dụ trực quan:* Xếp dãy 8 người có cấu trúc: `A B B A A A B A`
  Ta thấy lớp A chia thành 3 đợt tách biệt:
  - Đợt 1: `A` (độ dài 1).
  - Đợt 2: `A A A` (độ dài 3).
  - Đợt 3: `A` (độ dài 1).
  5. **Bước 5 — Nhân hoán vị học sinh phân biệt:**
  (Còn lớp B có 2 đợt: `B B` dài 2 và `B` dài 1).
  *Ý nghĩa:* Ràng buộc "không quá $k$ học sinh A liên tiếp" thực chất có nghĩa là *mỗi đợt của lớp A chỉ được có độ dài từ $1$ đến $k$*.
]
== 2.2 — Phương Pháp Giải Quyết Hệ Thống
Để giải quyết bài toán xếp $n_A$ học sinh A và $n_B$ học sinh B sao cho lớp A không quá $k$ bạn liên tiếp (chưa xét ràng buộc của B):
#method-box[
  *Quy trình 5 bước tư duy:*
  1. *Bước 1 — Xác định số đợt $r$ của lớp A:*
     Gọi $r$ là số đợt của A. Vì mỗi đợt chứa tối đa $k$ học sinh nên số đợt $r$ tối thiểu phải là $\lceil n_A / k \rceil$. Số đợt tối đa là $n_A$ (mỗi đợt đúng 1 học sinh).
     Vậy: $ \lceil n_A / k \rceil <= r <= n_A $
  - *TH $r = 3$ (3 đợt A gồm 1+1+1):*
    $S_3 = f(3, 3, 2) times binom{5}{3} = binom{3}{0} times 10 = 10$ cấu trúc.
     Đây là số cách chia $n_A$ phần tử giống nhau thành $r$ nhóm, mỗi nhóm có kích thước từ $1$ đến $k$. Công thức tổng quát dùng bao hàm loại trừ là:
  Tổng số cấu trúc Unlabeled: $S = 20 + 10 = 30$.
  Tổng số cách xếp học sinh phân biệt:
  $ N = 30 times 3! times 4! = 30 times 6 times 24 = bold(4320) " cách." $
]
     $n_B$ học sinh B sẽ tạo ra đúng $n_B + 1$ khe hở (kể cả 2 đầu).
== 2.5 — Trường Hợp Cả Hai Lớp Đều Bị Ràng Buộc
<truncated 80 bytes>
Khi cả hai lớp A và B đều bị giới hạn số lượng người kề nhau (ví dụ: không quá $k_A$ bạn A kề nhau và không quá $k_B$ bạn B kề nhau), ta không dùng khe hở nữa mà đếm trực tiếp số cấu trúc đợt xen kẽ của cả hai.
#example-box(n: "2 (Trung bình)")[
  Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 = 10$ thỏa mãn điều kiện $0 <= x_i <= 4$ với mọi $i = 1, 2, 3$.
  *Nguyên lý xen kẽ đợt:*
  *Cách 1 (Nguyên lý bù trừ kết hợp vách ngăn):*
  $
    f(x) = x^6 (1 + x + x^2 + x^3)^3 = x^6 (frac(1 - x^4, 1 - x))^3 \
    = x^6 (1 - x^4)^3 (1 - x)^(-3) \
    = x^6 (1 - 3x^4 + 3x^8 - x^(12)) (1 - x)^(-3)
  $
  Cần tìm hệ số của $x^(12)$ trong $f(x)$, tương đương hệ số của $x^6$ trong:
  $ h(x) = (1 - 3x^4) (1 - x)^(-3) $
  (Bỏ các số mũ $x^k$ với $k > 6$ vì không đóng góp vào hệ số $x^6$).
  Biết rằng $(1-x)^(-3) = sum_(k=0)^( infinity ) C_(k+2)
  - Số cách chọn khe hở: $ binom(n_B + 1, n_A) $.
---
]
#eg-box(title: \
  Xếp 3 học sinh lớp A và 4 học sinh lớp B vào hàng 7 ghế sao cho không có quá 2 bạn cùng lớp nào ngồi kề nhau.
  *Lời giải chi tiết:*
  Khi $k = 1$ (không có 2 bạn A nào kề nhau):
và ta coi đó là một cách xếp duy nhất).
Bí quyết để giải quyết triệt để mọi bài toán vòng tròn là Chốt (cố định) 1 người.
Khi ta cố định 1 người bất kỳ tại một ghế, ta đã phá vỡ hoàn toàn tính đối xứng xoay của vòng tròn. Kể
từ giây phút đó, vòng tròn biến thành một hàng thẳng đặc biệt có điểm neo bắt đầu và kết thúc, giúp ta
áp dụng được tất cả các phương pháp đã học ở Chương 1 và Chương 2.
3.1 — Cơ Sở: Số Cách Xếp Vòng Tròn Không Ràng Buộc
📖 Nguyên Lý Cố Định Triệt Tiêu Đối Xứng Quay
Khi xếp 𝑛 người phân biệt quanh một bàn tròn đồng nhất (chỉ tính thứ tự tương đối):
• Tổng số cách xếp là:
(𝑛−1)!
• Tại sao? Ta cố định 1 người bất kỳ ngồi vào 1 vị trí để làm mốc. 𝑛−1 người còn lại sẽ xếp vào
𝑛−1 ghế còn lại theo thứ tự tuyến tính (hàng thẳng), tạo ra (𝑛−1)! cách.
Lưu ý phân biệt:
• Nếu ghế có đánh số (hoặc bàn tròn có điểm chuẩn như quay mặt ra cửa): tổng cách là 𝑛! (giống
hàng thẳng).
• Nếu ghế không đánh số (chỉ tính thứ tự tương đối): tổng cách là (𝑛−1)!.
(Đề thi Việt Nam nếu nói “ngồi quanh bàn tròn” thì mặc định là thứ tự tương đối).
3.2 — Khe Hở Trong Vòng Tròn: Điểm Khác Biệt Quyết Định
Đây là điểm khác biệt cốt lõi giữa hàng thẳng và vòng tròn, và là nơi học sinh rất dễ làm sai công thức:
📐 Quy Tắc Khe Hở Vòng Tròn
// MISSING LINE 772
  - Số hạng $3x^(10)$ nhân với hệ số của $x^0$ trong $(1-x)^(-3)$ ($k=0$): $3 dot C_2^2 = 3$.
  Tổng các hệ số trên là:
  $ N = 66 - 63 + 3 = 6 " nghiệm." $
]
_
#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Có bao nhiêu cách chia 12 quyển sách giống nhau cho 3 học sinh sao cho mỗi học sinh nhận được ít nhất 2 quyển và không quá 5 quyển?
𝐵𝑛𝐵
  *Cách 1 (Nguyên lý bù trừ kết hợp vách ngăn):*
  Phương trình đại diện: $x_1 + x_2 + x_3 = 12$ với $2 <= x_i <= 5$.
  Thực hiện đổi biến đưa về biến không âm: đặt $y_i = x_i - 2  ->  0 <= y_i <= 3$.
  Phương trình trở thành:
  $ y_1 + y_2 + y_3 = 12 - 6 = 6 $
  Ta cần tìm số nghiệm nguyên của phương trình trên thỏa mãn $0 <= y_i <= 3$.
  - Số nghiệm không âm tự do: $C_(6+2)^2 = C_8^2 = 28$.
  - Xét các trường hợp vi phạm có biến $y_i >= 4$:
    - Giả sử $y_1 >= 4  ->  y_1' + y_2 + y_3 = 2$.
      Số nghiệm là $C_4^2 = 6$. Số cách chọn 1 biến vi phạm: $C_3^1 = 3  ->  3 dot 6 = 18$ cách.
    - Không thể có 2 biến $y_i >= 4$ vì tổng bằng 6.
  Số nghiệm thỏa mãn yêu cầu là: $28 - 18 = 10$ cách.
Giải thích trực quan: Trong hàng thẳng, khe “trước 𝐵1” và khe “sau 𝐵𝑛𝐵” là hai khe hoàn toàn
  *Cách 2 (Phương pháp hàm sinh đại số):*
  Mỗi biến nhận giá trị từ 2 đến 5 tương ứng với đa thức đại diện là $P(x) = x^2 + x^3 + x^4 + x^5$.
  Số cách chọn chính là hệ số của $x^(12)$ trong đa thức tích $f(x) = (x^2 + x^3 + x^4 + x^5)^3$.
  Ta biến đổi đại số rút gọn $f(x)$:
  $
    f(x) = x^6 (1 + x + x^2 + x^3)^3 = x^6 (frac(1 - x^4, 1 - x))^3 \
    = x^6 (1 - x^4)^3 (1 - x)^(-3) \
Các bước thực hiện:
1. Bước 1: Xếp 𝑛𝐵 học sinh B quanh bàn tròn trước: có (𝑛𝐵−1)! cách.
2. Bước 2: Chọn 𝑛𝐴 khe hở trong số 𝑛𝐵 khe hở của B để đặt A vào: có (𝑛𝐵
𝑛𝐴) cách.
3. Bước 3: Xếp 𝑛𝐴 học sinh A vào các k
  *Lời giải chi tiết:*
  Ta có $n_A = 3$, $n_B = 4$, $k = 2$.
  Số đợt $r$ chạy từ $2$ đến $3$. 4 bạn B tạo ra 5 khe hở.
  - $r_B=2$: $C(2,2)=1$. $r_B=3$: $C(3,1)=3$. $r_B=4$: $C(4,0)=1$.
  - *TH $r = 2$ (2 đợt A gồm 2+1):*
  *Cặp $(r_A, r_B)$ hợp lệ (|r_A - r_B| ≤ 1) và đóng góp:*
  - *TH $r = 3$ (3 đợt A gồm 1+1+1):*
  #align(center)[
    #table(
      columns: (0.6fr, 0.6fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 1.0fr),
  Tổng số cách xếp học sinh phân biệt:
      align: center + horizon,
]
      stroke: 0.4pt + col-pink,
== 2.5 — Trường Hợp Cả Hai Lớp Đều Bị Ràng Buộc
]
Khi cả hai lớp A và B đều bị giới hạn số lượng người kề nhau (ví dụ: không quá $k_A$ bạn A kề nhau và không quá $k_B$ bạn B kề nhau), ta không dùng khe hở nữa mà đếm trực tiếp số cấu trúc đợt xen kẽ của cả hai.
---
#method-box[
#eg-box(title: \
  Mọi cấu trúc hợp lệ đều là chuỗi đợt xen kẽ: $X_1 Y_1 X_2 Y_2 dots$
  ]
  Tổng unlabeled: $S = 4 + 6 + 1 + 6 + 1 = 18$.
  Số cách:
  $ N = 18 times 3! times 4! = 18 times 6 times 24 = bold(25
     Số cấu trúc chuỗi = 2 (ABAB hoặc BABA).
     $S_(2,2) = 2 (f_A) times 1 (f_B) times 2 = 4$ cấu trúc.
  2. **Cặp $(r_A=2, r_B=3)$:**
     B nhiều đợt hơn nên B phải ở hai đầu: B A B A B (1 cấu trúc chuỗi).
     $S_(2,3) = 2 (f_A) times 3 (f_B) times 1 = 6$ cấu trúc.
  3. **Cặp $(r_A=3, r_B=2)$:**
     A nhiều đợt hơn nên A phải ở hai đầu: A B A B A (1 cấu trúc chuỗi).
     $S_(3,2) = 1 (f_A) times 1 (f_B) times 1 = 1$ cấu trúc.
  4. **Cặp $(r_A=3, r_B=3)$:**
     Số cấu trúc chuỗi = 2 (ABABAB hoặc BABABA).
     $S_(3,3) = 1 (f_A) times 3 (f_B) times 2 = 6$ cấu trúc.
  5. **Cặp $(r_A=3, r_B=4)$:**
     B nhiều đợt hơn: B A B A B A B (1 cấu trúc chuỗi).
     $S_(3,4) = 1 (f_A) times 1 (f_B) times 1 = 1$ cấu trúc.
  Tổng số cấu trúc Unlabeled: $S = 4 + 6 + 1 + 6 + 1 = 18$.
  Tổng số cách xếp học sinh phân biệt:
  $ N = 18 times 3! times 4! = 18 times 6 times 24 = bold(2592) " cách." $
]
  *Phân tích đợt k=3:* Dùng $f(n_A, r, k) = sum_{j=0}^(floor((n_A-r k)/k)) (-1)^j binom(r, j) binom(n_A - j k - 1, r - 1)$ cho số phân hoạch đợt A; gaps B: $C(n_B+1, r)$.
#eg-box(title: "🎯 Ví Dụ 2.6 — Bài toán đối xứng: 3A, 3B, cả hai lớp $k=2$")[
#method-box[
  *Nguyên Lý Tuyến Tính Hóa Vòng Tròn:*
]
  - Nếu $r_A = r_B + 1$: chỉ có 1 cấu trúc chuỗi (bắt đầu và kết thúc bằng A).
  - Nếu $r_B = r_A + 1$: chỉ có 1 cấu trúc chuỗi (bắt đầu và kết thúc bằng B).
  $r$ từ $ceil(5/3) = 2$ đến $5$.
  Với mỗi cặp $(r_A, r_B)$ hợp lệ, số cấu trúc Unlabeled là:
  $ S_(r_A, r_B) = f(n_A, r_A, k_A) times f(n_B, r_B, k_B) times ("Số cấu trúc chuỗi") $
]
  - $r=2$: $C(2,0)C(4,1) - C(2,1)C(1,1) = 8 - 2 = 6$. B-gaps: $C(5,2)=10$. Đóng góp: 60.
---
  - $r=4$: $C(4,0)C(4,3)=4$. B-gaps: $C(5,4)=5$. Đóng góp: 20.
#eg-box(title: "🎯 Ví Dụ 2.5 — 3A, 4B, cả hai lớp $k=2$")[
  Xếp 3 học sinh lớp A và 4 học sinh lớp B vào hàng 7 ghế sao cho không có quá 2 bạn cùng lớp nào ngồi kề nhau.
  $S = 60+60+20+1 = 141$.
  *Lời giải chi tiết:*
  Ta có $n_A = 3, k_A = 2$ và $n_B = 4, k_B = 2$.
  - Phân hoạch A: $r_A \in \{2, 3\}$. Ta có $f(3, 2, 2) = 2$ và $f(3, 3, 2) = 1$.
  - Phân hoạch B: $r_B \in \{2, 3, 4\}$. Ta có $f(4, 2, 2) = 1$, $f(4, 3, 2) = 3$, $f(4, 4, 2) = 1$.
#recap-box[
  Liệt kê các cặp đợt hợp lệ thỏa mãn $|r_A - r_B| <= 1$:
  1. *Cặp $(r_A=2, r_B=2)$:*
     Số cấu trúc chuỗi = 2 (ABAB hoặc BABA).
     $S_(2,2) = 2 (f_A) times 1 (f_B) times 2 = 4$ cấu trúc.
  2. *Cặp $(r_A=2, r_B=3)$:*
     B nhiều đợt hơn nên B phải ở hai đầu: B A B A B (1 cấu trúc chuỗi).
     $S_(2,3) = 2 (f_A) times 3 (f_B) times 1 = 6$ cấu trúc.
  3. *Cặp $(r_A=3, r_B=2)$:*
     A nhiều đợt hơn nên A phải ở hai đầu: A B A B A (1 cấu trúc chuỗi).
     $S_(3,2) = 1 (f_A) times 1 (f_B) times 1 = 1$ cấu trúc.
  4. *Cặp $(r_A=3, r_B=3)$:*
     Số cấu trúc chuỗi = 2 (ABABAB hoặc BABABA).
     $S_(3,3) = 1 (f_A) times 3 (f_B) times 2 = 6$ cấu trúc.
  5. *Cặp $(r_A=3, r_B=4)$:*
     B nhiều đợt hơn: B A B A B A B (1 cấu trúc chuỗi).
     $S_(3,4) = 1 (f_A) times 1 (f_B) times 1 = 1$ cấu trúc.
  Kết quả: *36 ngàn cách*.
  Tổng số cấu trúc Unlabeled: $S = 4 + 6 + 1 + 6 + 1 = 18$.
  Tổng số cách xếp học sinh phân biệt:
  $ N = 18 times 3! times 4! = 18 times 6 times 24 = bold(2592) " cách." $
]
// ═══════════════════════════════════════════════
#eg-box(title: "🎯 Ví Dụ 2.6 — Bài toán đối xứng: 3A, 3B, cả hai lớp $k=2$")[
  Xếp 3 học sinh lớp A và 3 học sinh lớp B vào hàng 6 ghế sao cho không có quá 2 bạn cùng lớp nào ngồi kề nhau.
= Chương 3 — Vòng Tròn: Sức Mạnh Của Việc Chốt Một Người
  *Lời giải chi tiết:*
  Ta có $n_A = 3, k_A = 2$ và $n_B = 3, k_B = 2$.
  - Phân hoạch A: $r_A \in \{2, 3\}$. Ta có $f(3, 2, 2) = 2$ và $f(3, 3, 2) = 1$.
  - Phân hoạch B: $r_B \in \{2, 3\}$. Ta có $f(3, 2, 2) = 2$ và $f(3, 3, 2) = 1$.
  - $r=4$: $C(4,0)C(4,3)=4$. B-gaps: $C(5,4)=5$. Đóng góp: 20.
  Liệt kê các cặp đợt hợp lệ ($|r_A - r_B| <= 1$):
  1. *Cặp $(r_A=2, r_B=2)$:*
     Số cấu trúc chuỗi = 2 (ABAB hoặc BABA).
     $S_(2,2) = 2 (f_A) times 2 (f_B) times 2 = 8$ cấu trúc.
  2. *Cặp $(r_A=2, r_B=3)$:*
     Chuỗi B A B A B (1 cấu trúc chuỗi).
     $S_(2,3) = 2 (f_A) times 1 (f_B) times 1 = 2$ cấu trúc.
  3. *Cặp $(r_A=3, r_B=2)$:*
     Chuỗi A B A B A (1 cấu trúc chuỗi).
  Liệt kê các cặp đợt hợp lệ ($|r_A - r_B| <= 1$):
  1. *Cặp $(r_A=2, r_B=2)$:*
     Số cấu trúc chuỗi = 2 (ABAB hoặc BABA).
     $S_(2,2) = 2 (f_A) times 2 (f_B) times 2 = 8$ cấu trúc.
  2. *Cặp $(r_A=2, r_B=3)$:*
     Chuỗi B A B A B (1 cấu trúc chuỗi).
     $S_(2,3) = 2 (f_A) times 1 (f_B) times 1 = 2$ cấu trúc.
  3. *Cặp $(r_A=3, r_B=2)$:*
     Chuỗi A B A B A (1 cấu trúc chuỗi).
     $S_(3,2) = 1 (f_A) times 2 (f_B) times 1 = 2$ cấu trúc.
  4. *Cặp $(r_A=3, r_B=3)$:*
     Số cấu trúc chuỗi = 2 (ABABAB hoặc BABABA).
     $S_(3,3) = 1 (f_A) times 1 (f_B) times 2 = 2$ cấu trúc.
  $ n_A <= k_A times (r_B) <= k_A times (n_B + 1) $
  Tổng số cấu trúc Unlabeled: $S = 8 + 2 + 2 + 2 = 14$.
  Tổng số cách xếp học sinh phân biệt:
  $ N = 14 times 3! times 3! = 14 times 6 times 6 = bold(504) " cách." $
]
#pagebreak()
#warn-box[
  *Cảnh báo lỗi kiểm tra điều kiện khả thi:*
  Khi cả hai lớp bị ràng buộc, bắt buộc phải kiểm tra điều kiện tồn tại trước:
  $ n_A <= k_A times (r_B) <= k_A times (n_B + 1) $
  Nếu số học sinh một lớp vượt quá khả năng chứa tối đa của các vách ngăn của lớp kia, số cách xếp sẽ lập tức bằng 0.
]
== 2.6 — Bài Tập Luyện Chương 2
#recap-box[
  *Phân tích đợt k=3:* Dùng $f(n_A, r, k) = sum_{j=0}^(floor((n_A-r k)/k)) (-1)^j binom(r, j) binom(n_A - j k - 1, r - 1)$ cho số phân hoạch đợt A; gaps B: $C(n_B+1, r)$.
  *Lời giải chi tiết:*
  Vì $n_A = n_B = 4$ nên để không ai cùng lớp kề nhau, bắt buộc học sinh phải ngồi xen kẽ lớp: `A B A B A B A B`.
  1. Cố định bạn $A_1$ tại một vị trí để làm mốc.
  2. Xếp 3 bạn lớp A còn lại vào 3 ghế dành cho lớp A: có $3! = 6$ cách.
  3. Xếp 4 bạn lớp B vào 4 ghế xen kẽ dành cho lớp B: có $4! = 24$ cách.
  Vậy số cách xếp là:
  $ N = 3! times 4! = 6 times 24 = bold(144) " cách." $
  (Kiểm tra lại bằng công thức Slot Method: $N = (4-1)! times \binom(4, 4) times 4! = 6 times 1 times 24 = 144$ cách. ✓)
]
#eg-box(title: "🎯 Ví Dụ 3.4 — Quy mô nhỏ hơn: 3A và 3B quanh bàn tròn")[
  Có 3 học sinh lớp A và 3 học sinh lớp B. Xếp quanh bàn tròn sao cho không có 2 bạn cùng lớp ngồi kề nhau.
  *Lời giải chi tiết:*
  Học sinh phải ngồi xen kẽ dạng `A B A B A B`.
  1. Cố định bạn $A_1$ làm mốc.
  2. Xếp 2 bạn lớp A còn lại: có $2! = 2$ cách.
  3. Xếp 3 bạn lớp B vào các ghế xen kẽ: có $3! = 6$ cách.
  Tổng số cách xếp là:
  $ N = 2! times 3! = 2 times 6 = bold(12) " cách." $
  (Kiểm tra lại bằng công thức Slot Method: $N = (3-1)! times \binom(3, 3) times 3! = 2 times 1 times 6 = 12$ cách. ✓)
]
== 3.4 — PIE Cho Vòng Tròn: Chốt Một B Rồi Áp Dụng PIE Tuyến Tính
  *Giải thích trực quan:* Để 5 A không kề nhau trong vòng 8, cần ít nhất 5 "người ngăn cách" (mỗi A cần 1 người khác ở 1 trong 2 phía). Nhưng với 5 khe cần ngăn và chỉ 3 B, *không đủ B để phân tách 5 A*. Số cách = $bold(0)$.
]
#pagebreak()
]
// ═══════════════════════════════════════════════
// TỔNG KẾT 3 CHƯƠNG
// ═══════════════════════════════════════════════
= Tổng Kết — Bản Đồ Ba Dạng Và Mẹo Nhận Dạng Nhanh
  Chốt $B_1$. Còn $3A, 1B, 2C$ trong hàng 6 vị trí.
#align(center)[
  #block(
    width: 98%,
    fill: gradient.linear(rgb("F5F0FF"), rgb("E8F5E9"), angle: 90deg),
    stroke: 1pt + col-violet,
    radius: 10pt,
    inset: (x: 16pt, y: 14pt),
  )[
    #text(fill: col-purple, size: 12pt, weight: "bold")[🗺️ Bản Đồ Nhận Dạng 3 Dạng Xếp Ghế Nâng Cao]
    #v(0.8em)
    #table(
      columns: (1.4fr, 1.8fr, 2.0fr, 2.2fr),
      inset: 10pt,
      align: left + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("4A148C") } else if row == 1 { rgb("F3E5F5") } else if row == 2 { rgb("E8F5E9") } else if (
          row == 3
        ) { rgb("E0F7FA") } else { none }
      },
      stroke: 0.5pt + col-violet,
      [#text(fill: white, weight: "bold")[Dạng]],
      [#text(fill: white, weight: "bold")[Nhận Dạng Đề Bài]],
      [#text(fill: white, weight: "bold")[Công Cụ Chính]],
      [#text(fill: white, weight: "bold")[Công Thức Ghi Nhớ]],
      [*1 — Hai Dãy Đối Diện*],
      [Hai hàng song song đối mặt; cấm cùng lớp ngồi đối diện (cùng cột)],
      [Nguyên lý cột độc lập: đếm từng cột rồi nhân],
      [$N = 2^m (m!)^2$ khi $n_A = n_B = m$],
== 3.6 — Trường Hợp Đặc Biệt: Vòng Tròn Có Đối Xứng Gương (Vòng Chuỗi Hạt)
      [*2 — Không Quá $k$ Liên Tiếp*],
      [Hàng thẳng; giới hạn số người cùng lớp liên tiếp $<= k$],
      [Phân tích đợt + Sao & Thanh Chắn; $k=1$ → Slot Method cũ],
      [$S = sum C(r, n_A - r) dot C(n_B+1, r)$ (k=2)],
  - *Chuỗi hạt / Vòng nhẫn (necklace):* Triệt tiêu CẢ đối xứng quay LẪN đối xứng lật (phản chiếu). Hai cách xếp tính là 1 nếu bằng nhau sau khi quay *hoặc* lật.
      [*3 — Vòng Tròn*],
      [Bàn tròn; cấm cùng lớp ngồi kề; kiểm tra $max n_i <= n/2$],
      [Chốt 1 người (ưu tiên lớp không ràng buộc) → Linear PIE/Slot],
      [$N = (n_B-1)! dot C(n_B, n_A) dot n_A!$ (Slot Method)],
    )
  ]
]
== 3.7 — Điều Kiện Tồn Tại: Khi Nào Bài Toán Vòng Tròn Có Nghiệm?
#v(1.2em)
#rev-box(title: "⚙️ Điều Kiện Cần Đủ Cho Bài Toán Không Kề Cùng Lớp")[
#rev-box(title: "🏁 Quy Trình Giải Mọi Bài Xếp Ghế Nâng Cao")[
  Khi nhận một bài toán xếp ghế, hãy hỏi 4 câu theo thứ tự:
  $ max_i{n_i} <= floor(n
  *Câu 1 — Cấu hình ghế là gì?*
  - "2 dãy song song" → Chương 1.
  - "Một hàng thẳng" → Chương 2 (hoặc Slot/PIE thông thường nếu $k=1$).
  - "Vòng tròn / bàn tròn" → Chương 3.
  *Câu 2 — Ràng buộc là ràng buộc "kề" hay "đối diện" hay cả hai?*
  - "Đối diện" → Chương 1 (cột độc lập).
  - "Kề (hà
  )[
    #text(fill: white, weight: "bold", size: 13pt)[📋 Bảng Đáp Số Bài Tập]
    #v(0.8em)
    #table(
      columns: (1.2fr, 1.8fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("1A237E") } else if calc.rem(row, 2) == 1 { rgb("0D1B4B") } else {
        rgb("0F244A")
      },
      stroke: 0.5pt + rgb("3F51B5"),
      [#text(fill: rgb("90CAF9"), weight: "bold")[Bài]],
      [#text(fill: rgb("90CAF9"), weight: "bold")[Nội Dung]],
      [#text(fill: rgb("90CAF9"), weight: "bold")[Đáp Số]],
#recap-box[
      [C1], [4A, 4B, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[9216]],
      [C2], [2A, 2B, 2C, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[384]],
      [C3], [4A, 4B, hạn chế Hàng 1], [#text(fill: rgb("FFD54F"), weight: "bold")[576]],
      [C4], [4A, 2B, 1C, 1D, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[9216]],
      [C5], [3A, 2B, 1C (tổng 6), nhiều lớp], [#text(fill: rgb("FFD54F"), weight: "bold")[288]],
      [D1], [5A, 4B, không quá $k=3$ A], [#text(fill: rgb("FFD54F"), weight: "bold")[405720]],
      [D2], [3A, 5B, không quá $k=2$ A], [#text(fill: rgb("FFD54F"), weight: "bold")[36000]],
      [E1], [4A, 6B, vòng tròn, không kề A-A], [#text(fill: rgb("FFD54F"), weight: "bold")[43200]],
      [E2], [5A, 5B, vòng tròn, xen kẽ], [#text(fill: rgb("FFD54F"), weight: "bold")[2880]],
      [E3], [4A, 2B, 2C, vòng tròn], [#text(fill: rgb("FFD54F"), weight: "bold")[144]],
      [E4], [5A, 3B, vòng tròn kiểm tra], [#text(fill: rgb("FFD54F"), weight: "bold")[0]],
    )
  ]
]
  PIE với $(i, j, k)$: B chỉ 1 người → $j = 0$ luôn. $i = 0,1,2,3$, $k=0,1$.
  #align(center)[
    #table(
      columns: (1.2fr, 1.0fr, 1.2fr, 0.6fr, 1.4fr, 0.6fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E0F7FA") } else if calc.rem(row, 2) == 1 { rgb("F0FFFE") } else { white },
      stroke: 0.3pt + col-teal,
      [*$(i,k)$*], [*Chọn cặp*], [*Thực thể*], [*T*], [*Hoán vị*], [*Dấu*], [*Đóng góp*],
      [$(0,0)$], [1], [(4,1,2)], [7], [$frac(7!, 4!1!2!)=105$], [$+$], [$bold(+105)$],
      [$(1,0)$], [$3$], [(3,1,2)], [6], [$frac(6!, 3!1!2!)=60$], [$-$], [$bold(-180)$],
      [$(2,0)$], [$3$], [(2,1,2)], [5], [$frac(5!, 2!1!2!)=30$], [$+$], [$bold(+90)$],
      [$(3,0)$], [$1$], [(1,1,2)], [4], [$frac(4!, 1!1!2!)=12$], [$-$], [$bold(-12)$],
      [$(0,1)$], [$1$], [(4,1,1)], [6], [$frac(6!, 4!1!1!)=30$], [$-$], [$bold(-30)$],
      [$(1,1)$], [$3$], [(3,1,1)], [5], [$frac(5!, 3!1!1!)=20$], [$+$], [$bold(+60)$],
      [$(2,1)$], [$3$], [(2,1,1)], [4], [$frac(4!, 2!1!1!)=12$], [$-$], [$bold(-36)$],
      [$(3,1)$], [$1$], [(1,1,1)], [3], [$3!=6$], [$+$], [$bold(+6)$],
    )
  ]
  Tổng cấu trúc:
  $ 105 - 180 + 90 - 12 - 30 + 60 - 36 + 6 = 3 $
  Số cách:
  $ N = 3 times 4! times 1! times 2! = 3 times 24 times 1 times 2 = bold(144) $
]
#recap-box[
  *Kiểm tra điều kiện trước tiên:* $max_i n_i <= floor(n/2)$. Nếu vi phạm → đáp án $= 0$, không cần tính thêm.
]
#ex-box(title: "✏️ Bài E4 — Nhận Biết Điều Kiện Không Tồn Tại")[
  Có 5 học sinh lớp A và 3 học sinh lớp B. Có thể xếp tất cả ngồi quanh bàn tròn 8 ghế sao cho không ai cùng lớp kề nhau không? Giải thích.
      [$(1,0)$], [$3$], [(3,1,2)], [6], [$frac(6!, 3!1!2!)=60$], [$-$], [$bold(-180)$],
Trang 27
Chuyên Đề Xếp Ghế Nâng Cao — 3 Dạng Đặc Biệt
GV Nguyễn Văn Sang · 0389.821.115
📌 Dự Đoán Xu Hướng Đề Thi
Dựa trên phân tích đề thi đại học và thi thử những năm gần đây:
• Dạng 1 (Đối Diện): Mới nổi, xuất hiện trong đề thi thử cụm trường chuyên từ 2022. Thường kết
hợp với bài toán chia 2 nhóm để học sinh dễ nhầm lẫn với bài toán phân nhóm thông thường.
• Dạng 2 (Không Quá k): Phổ biến ở mức 𝑘= 2, thường đặt 𝑛𝐴= 3 hoặc 4 để bảng đợt vừa tầm
tính tay. Dạng 𝑘= 3 ít gặp hơn.
• Dạng 3 (Vòng Tròn): Kinh điển, hầu như có mặt trong mỗi kỳ thi đại học. Năm gần đây xu
hướng kết hợp điều kiện trên vòng tròn và điều kiện thứ tự tương đối giữa một số người đặc biệt
(ví dụ “A ngồi bên trái B”), đòi hỏi chia trường hợp.
📋 Bảng Đáp Số Bài Tập
Bài
Nội Dung
Đáp Số
C1
4A, 4B, 2 dãy đối diện
9216
C2
2A, 2B, 2C, 2 dãy đối diện
384
C3
4A, 4B, hạn chế Hàng 1
576
C4
4A, 2B, 1C, 1D, 2 dãy đối diện
9216
C5
3A, 2B, 1C (tổng 6), nhiều lớp
288
D1
5A, 4B, không quá 𝑘= 3 A
405720
D2
3A, 5B, không quá 𝑘= 2 A
36000
E1
4A, 6B, vòng tròn, không kề A-A
43200
E2
5A, 5B, vòng tròn, xen kẽ
2880
E3
4A, 2B, 2C, vòng tròn
144
E4
5A, 3B, vòng tròn kiểm tra
0
Trang 28
  )[
    #text(fill: white, weight: "bold", size: 13pt)[📋 Bảng Đáp Số Bài Tập]
    #v(0.8em)
    #table(
      columns: (1.2fr, 1.8fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("1A237E") } else if calc.rem(row, 2) == 1 { rgb("0D1B4B") } else {
        rgb("0F244A")
      },
      stroke: 0.5pt + rgb("3F51B5"),
      [#text(fill: rgb("90CAF9"), weight: "bold")[Bài]],
      [#text(fill: rgb("90CAF9"), weight: "bold")[Nội Dung]],
      [#text(fill: rgb("90CAF9"), weight: "bold")[Đáp Số]],
      [C1], [4A, 4B, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[9216]],
      [C2], [2A, 2B, 2C, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[384]],
      [C3], [4A, 4B, hạn chế Hàng 1], [#text(fill: rgb("FFD54F"), weight: "bold")[576]],
      [C4], [4A, 2B, 1C, 1D, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[9216]],
      [C5], [3A, 2B, 1C (tổng 6), nhiều lớp], [#text(fill: rgb("FFD54F"), weight: "bold")[288]],
      [D1], [5A, 4B, không quá $k=3$ A], [#text(fill: rgb(\
      [D2], [3A, 5B, không quá $k=2$ A], [#text(fill: rgb(\
      [E1], [4A, 6B, vòng tròn, không kề A-A], [#text(fill: rgb(\
      [E2], [5A, 5B, vòng tròn, xen kẽ], [#text(fill: rgb(\
      [E3], [4A, 2B, 2C, vòng tròn], [#text(fill: rgb(\
      [E4], [5A, 3B, vòng tròn kiểm tra], [#text(fill: rgb(\
    )
  ]
]
  )[
    #text(fill: white, weight: \
    #v(0.8em)
    #table(
      columns: (1.2fr, 1.8fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("1A237E") } else if calc.rem(row, 2) == 1 { rgb("0D1B4B") } else {
        rgb(\
      },
      stroke: 0.5pt + rgb("3F51B5"),
      [#text(fill: rgb(\
      [#text(fill: rgb(\
      [#text(fill: rgb(\
      [C1], [4A, 4B, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[9216]],
      [C2], [2A, 2B, 2C, 2 dãy đối diện], [#text(fill: rgb(\
      [C3], [4A, 4B, hạn chế Hàng 1], [#text(fill: rgb(\
      [C4], [4A, 2B, 1C, 1D, 2 dãy đối diện], [#text(fill: rgb(\
      [C5], [3A, 2B, 1C (tổng 6), nhiều lớp], [#text(fill: rgb(\
      [D1], [5A, 4B, không quá $k=3$ A], [#text(fill: rgb(\
      [D2], [3A, 5B, không quá $k=2$ A], [#text(fill: rgb(\
      [E1], [4A, 6B, vòng tròn, không kề A-A], [#text(fill: rgb(\
      [E2], [5A, 5B, vòng tròn, xen kẽ], [#text(fill: rgb(\
      [E3], [4A, 2B, 2C, vòng tròn], [#text(fill: rgb(\
      [E4], [5A, 3B, vòng tròn kiểm tra], [#text(fill: rgb(\
    )
  ]
]
