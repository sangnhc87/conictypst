const typstBank = {
  "GEN_BANK_ALL": [
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Bốc thăm/MC rút phiếu trúng thưởng",
      "content": "#tn([Một hộp có {G+} phiếu trúng thưởng và {H+} phiếu không trúng. Rút ngẫu nhiên $1$ phiếu. Xác suất rút được phiếu trúng là\n  \\], (True([\\ $\\\\dfrac{{G+]), [{G+], [H+], [$\\\\dfrac{{H+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Bốc bi/MC rút hai bi cùng màu",
      "content": "#tn([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $2$ bi không hoàn lại. Xác suất để hai bi rút ra cùng màu là\n  \\], (True([\\ $\\\\dfrac{C_{{G+]), [{H+], [C_{{G+], [H+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Bốc bi/TF rút hai lần có hoàn lại",
      "content": "#ds([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $1$ bi, ghi nhận màu rồi hoàn lại. Sau đó rút tiếp $1$ bi nữa. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Xác suất rút được bi đỏ ở mỗi lần đều bằng $\\\\dfrac{{G+]),\n    [{G+],\n    [H+],\n    True([\\ Hai lần rút là độc lập])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Bốc thăm/SA ít nhất một phiếu trúng",
      "content": "#tln([Một thùng phiếu có {G+} phiếu trúng và {H+} phiếu không trúng. Rút ngẫu nhiên $2$ phiếu không hoàn lại. Xác suất để có ít nhất một phiếu trúng là bao nhiêu?\n  \\], [$1-\\\\dfrac{C_{{H+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Bốc bi/MC đúng hai bi đỏ trong ba lần rút",
      "content": "#tn([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $3$ bi không hoàn lại. Xác suất để trong $3$ bi rút ra có đúng $2$ bi đỏ là\n  \\], ([$\\\\dfrac{C_{{G+], [C_{{G+], [H+], True([\\ $\\\\dfrac{C_{{G+])))"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Bốc bi/SA lần một đỏ lần hai xanh",
      "content": "#tln([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút liên tiếp $2$ bi không hoàn lại. Tính xác suất để lần thứ nhất rút được bi đỏ và lần thứ hai rút được bi xanh.\n  \\], [$\\\\dfrac{{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Bốc bi/TF chuyển bi giữa hai hộp",
      "content": "#ds([Hộp I có {G+} bi đỏ và {H+} bi xanh. Hộp II có {K+} bi đỏ và {L+} bi xanh. Lấy ngẫu nhiên $1$ bi từ hộp I chuyển sang hộp II, rồi rút ngẫu nhiên $1$ bi từ hộp II. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Xác suất chuyển sang hộp II một bi đỏ là $\\\\dfrac{{G+]),\n    [{G+],\n    [H+],\n    True([\\ Nếu bi chuyển sang là đỏ thì hộp II có $ {K+])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Truy nguồn gốc/MC xác suất nhận sản phẩm lỗi",
      "content": "#tn([Một cửa hàng nhập $60\\\\%$ hàng từ kho A và $40\\\\%$ hàng từ kho B. Tỉ lệ hàng lỗi của kho A là {A+}\\\\%, của kho B là {B+}\\\\%. Chọn ngẫu nhiên một sản phẩm. Xác suất để sản phẩm đó bị lỗi là\n  \\], ([$\\\\dfrac{60{A+], [B+], [100], True([\\ $\\\\dfrac{60{A+])))"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Truy nguồn gốc/SA truy vết kho B khi gặp hàng lỗi",
      "content": "#tln([Một cửa hàng nhập $60\\\\%$ hàng từ kho A và $40\\\\%$ hàng từ kho B. Tỉ lệ hàng lỗi của kho A là {A+}\\\\%, của kho B là {B+}\\\\%. Biết một sản phẩm chọn ngẫu nhiên bị lỗi. Xác suất để sản phẩm đó xuất phát từ kho B là bao nhiêu?\n  \\], [$\\\\dfrac{40{B+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Bốc bi/MC đúng một bi mỗi màu",
      "content": "#tn([Một hộp có {G+} bi đỏ, {H+} bi xanh và {K+} bi vàng. Rút ngẫu nhiên $3$ bi không hoàn lại. Xác suất để rút được đúng $1$ bi mỗi màu là\n  \\], (True([\\ $\\\\dfrac{{G+]), [H+], [K+], [C_{{G+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Bốc bi/MC có điều kiện theo lượt rút",
      "content": "#tn([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút liên tiếp $2$ bi không hoàn lại. Biết lần rút thứ nhất đã được bi đỏ. Xác suất để lần rút thứ hai cũng được bi đỏ là\n  \\], ([$\\\\dfrac{{G+], [{G+], [H+], True([\\ $\\\\dfrac{{G+])))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Bốc bi/MC ít nhất một bi đỏ trong hai lần rút",
      "content": "#tn([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $2$ bi không hoàn lại. Xác suất để có ít nhất một bi đỏ là\n  \\], ([$\\\\dfrac{C_{{G+], [C_{{G+], [H+], True([\\ $1-\\\\dfrac{C_{{H+])))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Bốc bi/SA đúng hai bi đỏ trong bốn lần rút",
      "content": "#tln([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $4$ bi không hoàn lại. Tính xác suất để trong $4$ bi rút ra có đúng $2$ bi đỏ.\n  \\], [$\\\\dfrac{C_{{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Truy nguồn gốc/TF chọn hộp rồi rút bi",
      "content": "#ds([Hộp I có {G+} bi đỏ và {H+} bi xanh. Hộp II có {K+} bi đỏ và {L+} bi xanh. Chọn ngẫu nhiên một trong hai hộp rồi rút ngẫu nhiên một bi. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Xác suất rút được bi đỏ là $\\\\dfrac{1]),\n    [2],\n    [{G+],\n    [{G+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Truy nguồn gốc/SA truy vết nhà máy B theo Bayes",
      "content": "#tln([Một siêu thị nhập $55\\\\%$ hàng từ nhà máy A và $45\\\\%$ hàng từ nhà máy B. Tỉ lệ sản phẩm lỗi của A là {A+}\\\\%, của B là {B+}\\\\%. Biết một sản phẩm lấy ngẫu nhiên bị lỗi. Xác suất để sản phẩm đó do nhà máy B sản xuất là bao nhiêu?\n  \\], [$\\\\dfrac{45{B+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Truy nguồn gốc/MC tổng xác suất lô lỗi từ ba nguồn",
      "content": "#tn([Một doanh nghiệp nhập hàng từ ba nguồn A, B, C theo tỉ lệ lần lượt là $50\\\\%$, $30\\\\%$, $20\\\\%$. Tỉ lệ hàng lỗi của ba nguồn tương ứng là {A+}\\\\%, {B+}\\\\%, {G+}\\\\%. Xác suất để một sản phẩm chọn ngẫu nhiên bị lỗi là\n  \\], ([$\\\\dfrac{50{A+], [B+], [G+], [100]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Truy nguồn gốc/SA truy vết nguồn C khi phát hiện lỗi",
      "content": "#tln([Một doanh nghiệp nhập hàng từ ba nguồn A, B, C theo tỉ lệ lần lượt là $50\\\\%$, $30\\\\%$, $20\\\\%$. Tỉ lệ hàng lỗi của ba nguồn tương ứng là {A+}\\\\%, {B+}\\\\%, {G+}\\\\%. Biết một sản phẩm được chọn ngẫu nhiên bị lỗi. Xác suất để sản phẩm đó đến từ nguồn C là bao nhiêu?\n  \\], [$\\\\dfrac{20{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Truy nguồn gốc/TL truy vết nông sản theo ba hợp tác xã",
      "content": "#tl([Một siêu thị nhập rau từ ba hợp tác xã A, B, C theo tỉ lệ lần lượt là $40\\\\%$, $35\\\\%$, $25\\\\%$. Tỉ lệ lô hàng không đạt chuẩn của ba hợp tác xã tương ứng là {A+}\\\\%, {B+}\\\\%, {H+}\\\\%.\n  \\\\begin{enumerate}\n    \\\\item Tính xác suất để một gói rau chọn ngẫu nhiên là hàng không đạt chuẩn.\n    \\\\item Biết một gói rau bị phát hiện không đạt chuẩn. Tính xác suất gói rau đó đến từ hợp tác xã C.\n    \\\\item Trong ba hợp tác xã, hợp tác xã nào nên được ưu tiên kiểm tra lại nếu chỉ căn cứ vào dữ liệu trên?\n  \\\\end{enumerate}\n  \\\\loigiai{\n    a) Theo công thức xác suất toàn phần:\n    $$P(K)=0.4\\\\cdot\\\\frac{{A+}}{100}+0.35\\\\cdot\\\\frac{{B+}}{100}+0.25\\\\cdot\\\\frac{{H+}}{100}=\\\\dfrac{40{A+}+35{B+}+25{H+}}{10000}. $$\n    b) Theo Bayes:\n    $$P(C|K)=\\\\dfrac{0.25\\\\cdot\\\\frac{{H+}}{100}}{P(K)}=\\\\dfrac{25{H+}}{40{A+}+35{B+}+25{H+}}. $$\n    c) Nếu chỉ căn cứ vào xác suất hậu nghiệm khi gặp một gói không đạt chuẩn thì nguồn có giá trị $P(\\\\text{nguồn}|K)$ lớn nhất là nguồn cần ưu tiên truy vết và kiểm tra lại.\n  }\n\\])"
    }
  ],
  "GEN_K12": [
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Đơn điệu/MC đơn điệu hàm bậc 3 (a>0)",
      "content": "#tn([Hàm số $y = x^3 - {G+}x^2 + {H+}x -{A+}$ đồng biến trên khoảng nào?\n  \\], ([$\\\\left(\\\\dfrac{{G+], [{G+], [H+], [3]))"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Cực trị/MC cực đại hàm bậc 3",
      "content": "#tn([Hàm số $y = -{A+}x^3 + {B+}x$ có giá trị cực đại bằng\n  \\], ([$\\\\dfrac{2{B+], [3{A+], [\\\\dfrac{{B+], [3{A+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Tiệm cận/MC số tiệm cận phân thức bậc nhất bậc nhất",
      "content": "#tn([Số đường tiệm cận của đồ thị hàm số $y = \\\\dfrac{{A+}x+{B}}{x-{G+}}$ là\n  \\], ([$0$], [$1$], True([\\ $2$]), [$3$]))"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Đồ thị/MC trùng phương số cực trị",
      "content": "#tn([Hàm số $y = x^4 - {B+}x^2 + {A}$ có bao nhiêu điểm cực trị?\n  \\], ([$1$], True([\\ $3$]), [$2$], [$0$]))"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Giá trị lớn nhất nhỏ nhất/MC GTLN đoạn bậc 3",
      "content": "\\\\begin{ex}\n  Giá trị lớn nhất của hàm số $f(x) = x^3 - {G+}x + {A}$ trên đoạn $[-2;2]$ bằng\n  \\\\choice\n  {${`{A}"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Đúng Sai/TF đơn điệu hàm số",
      "content": "\\\\begin{ex}\n  Cho hàm số $y = \\\\dfrac{{A+}x+{B}}{\\\\sqrt{x^2+{G+}}}$. Xét các mệnh đề sau:\n  \\\\choiceTF\n  {\\\\True Hàm số xác định trên $\\\\mathbb{R}$}\n  {\\\\True Đồ thị hàm số có hai đường tiệm cận ngang}\n  {Hàm số đồng biến trên $\\\\mathbb{R}$ khi ${`{A+}"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Tham số m/SA tìm m đồng biến trên R",
      "content": "#tln([Tìm giá trị của $m$ để hàm số $y = \\\\dfrac{1}{3}x^3 - mx^2 + ({A+})^2x$ đồng biến trên $\\\\mathbb{R}$.\n  \\], [$-{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Tiếp tuyến/SA tiếp tuyến song song trục hoành",
      "content": "#tln([Đường tiếp tuyến với đồ thị $y = x^3 - {G+}x^2 + {H+}x + {A}$ song song với trục hoành có bao nhiêu đường?\n  \\], [$2$], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Số/Khảo sát/TL khảo sát hàm bậc 3",
      "content": "#tl([Khảo sát sự biến thiên và vẽ đồ thị hàm số $y = x^3 - {G+}x^2 + {H+}x$.\n  \\\\loigiai{\n    \\\\textbf{Tập xác định:} $\\\\mathbb{R}$.\\\\\\\\\n    \\\\textbf{Sự biến thiên:} $y' = 3x^2 - 2{G+}x + {H+}$. Giải $y'=0$ tìm cực trị.\\\\\\\\\n    \\\\textbf{Bảng biến thiên:} (học sinh tự lập).\\\\\\\\\n    \\\\textbf{Đồ thị:} Qua gốc $O$, nhận diện dạng chữ S.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Mũ Logarit/Tính toán/MC rút gọn biểu thức lũy thừa",
      "content": "#tn([Giá trị của biểu thức $P = \\\\dfrac{a^{{A+}/3} \\\\cdot a^{{B+}/6}}{a^{1/2}}$ (với $a>0$) là\n  \\], ([$a^{({A+], [B+], True([\\ $a^{(2{A+]), [B+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Mũ Logarit/Phương trình/MC phương trình mũ",
      "content": "\\\\begin{ex}\n  Phương trình ${`{A+}"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Mũ Logarit/Phương trình/MC phương trình logarit cơ số 2",
      "content": "#tn([Nghiệm của phương trình $\\\\log_2(x+{A+}) = {G+}$ là\n  \\], ([$x = 2^{{G+], [A+], True([\\ $x = 2^{{G+]), [A+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Mũ Logarit/Bất phương trình/MC BPT logarit",
      "content": "#tn([Bất phương trình $\\\\log_{0.5}(x + {A+}) > -{G+}$ có tập nghiệm là\n  \\], ([$(-{A+], [{G+], [A+], True([\\ $(-{A+])))"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Mũ Logarit/Đúng Sai/TF hàm mũ tăng giảm",
      "content": "#ds([Cho hàm số $f(x) = {A+}^x$ và $g(x) = \\\\log_{{A+}} x$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $f$ đồng biến trên $\\\\mathbb{R]),\n    [A+],\n    True([\\ $g$ xác định với $x>0$]),\n    [$f(x)\\\\cdot g(x)=x$ với mọi $x$]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Hàm Mũ Logarit/Thực Tế/SA lãi kép",
      "content": "#tln([Anh Nam gửi tiết kiệm $200$ triệu đồng với lãi suất \\${A+}\\\\%$/năm, lãi kép. Sau $t$ năm số tiền là $A = 200 \\\\cdot \\\\left(1+\\\\dfrac{{A+}}{100}\\\\right)^t$ triệu đồng. Hỏi sau ít nhất bao nhiêu năm số tiền vượt $300$ triệu? (Cho $\\\\log_{1.0{A+}} 1.5 \\\\approx {G+}$)\n  \\], [Sau $\\\\lceil{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Nguyên hàm/MC nguyên hàm đa thức",
      "content": "#tn([Nguyên hàm của hàm số $f(x) = {A+}x^2 - {B+}x + {G+}$ là\n  \\], ([$\\\\dfrac{{A+], [3], [{B+], [2]))"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Nguyên hàm/MC nguyên hàm hàm mũ e",
      "content": "#tn([Tính $\\\\displaystyle\\\\int e^{{A+}x} \\\\cos({B+}x)\\\\,dx$ có dạng $e^{{A+}x}(p\\\\cos{B+}x + q\\\\sin{B+}x)+C$. Tổng $p+q$ bằng\n  \\], ([$\\\\dfrac{2{A+], [B+], [{A+], [B+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Tích phân/MC tích phân xác định đa thức",
      "content": "#tn([Tính $I = \\\\displaystyle\\\\int_0^{{A+}} ({G+}x^2 - {B+}x + 1)\\\\,dx$.\n  \\], ([$\\\\dfrac{{G+], [A+], [3], [{B+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Tích phân/MC tích phân hàm lượng giác",
      "content": "#tn([Giá trị $\\\\displaystyle\\\\int_0^{\\\\pi/{A+}} \\\\sin({A+}x)\\\\,dx$ bằng\n  \\], ([$0$], [$\\\\dfrac{1], [{A+], True([\\ $\\\\dfrac{2])))"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Ứng dụng/MC diện tích hình phẳng",
      "content": "#tn([Diện tích hình phẳng giới hạn bởi $y = x^2 - {A+}x$ và trục $Ox$ bằng\n  \\], ([$\\\\dfrac{{A+], [3], [$\\\\dfrac{{A+], [6]))"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Đúng Sai/TF tính chất tích phân",
      "content": "#ds([Cho $\\\\displaystyle\\\\int_0^{{A+}} f(x)\\\\,dx = {G+}$ và $\\\\displaystyle\\\\int_0^{{A+}} g(x)\\\\,dx = {B+}$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $\\\\displaystyle\\\\int_0^{{A+]),\n    [G+],\n    [B+],\n    True([\\ $\\\\displaystyle\\\\int_0^{{A+])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Thực Tế/TL bể nước chảy vào",
      "content": "#tl([Nước chảy vào bể với lưu lượng $Q(t) = {A+}t^2 + {B+}t + {G+}$ (lít/phút), $t$ là thời gian tính bằng phút.\n  \\\\begin{enumerate}\n    \\\\item Tính lượng nước chảy vào bể trong $3$ phút đầu.\n    \\\\item Biết bể hiện có $100$ lít nước, hỏi sau bao nhiêu phút bể đầy $500$ lít?\n  \\\\end{enumerate}\n  \\\\loigiai{\n    a) $V = \\\\int_0^3 ({A+}t^2+{B+}t+{G+})\\\\,dt = \\\\left[\\\\dfrac{{A+}t^3}{3}+\\\\dfrac{{B+}t^2}{2}+{G+}t\\\\right]_0^3 = 9{A+}+\\\\dfrac{9{B+}}{2}+3{G+}$ lít.\\\\\\\\\n    b) Giải $\\\\int_0^T Q(t)\\\\,dt = 400$. Từ đó tìm $T$.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 12/Nguyên Hàm Tích Phân/Ứng dụng/SA thể tích khối tròn xoay",
      "content": "#tln([Tính thể tích khối tròn xoay khi quay hình phẳng giới hạn bởi $y = \\\\sqrt{x}$, $y=0$, $x={A+}$ quanh trục $Ox$.\n  \\], [$\\\\pi{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/HH Oxyz/Vectơ/MC tích vô hướng",
      "content": "#tn([Cho $\\\\vec{a} = ({A},{B},{G+})$ và $\\\\vec{b} = ({B+},-{A+},{H+})$. Tích vô hướng $\\\\vec{a}\\\\cdot\\\\vec{b}$ bằng\n  \\], ([\\${A], [B+], [B], [A+]))"
    },
    {
      "path": "Kho Câu/Khối 12/HH Oxyz/Mặt phẳng/MC PTMP qua 3 điểm",
      "content": "#tn([Mặt phẳng đi qua $A({A},0,0)$, $B(0,{B+},0)$, $C(0,0,{G+})$ có phương trình dạng\n  \\], ([$\\\\dfrac{x], [{B+], [y], [{A]))"
    },
    {
      "path": "Kho Câu/Khối 12/HH Oxyz/Khoảng cách/MC khoảng cách điểm đến mặt phẳng",
      "content": "#tn([Khoảng cách từ điểm $M({A},{B},{G+})$ đến mặt phẳng $(P): 2x - y + 2z - 1 = 0$ bằng\n  \\], ([$\\\\dfrac{|2{A], [B], [G+], [3]))"
    },
    {
      "path": "Kho Câu/Khối 12/HH Oxyz/Đường thẳng/MC PTDT qua A vtcp",
      "content": "#tn([Đường thẳng qua $A({A+},{B},{G})$ và có vectơ chỉ phương $\\\\vec{u}=({B+},{H+},1)$ có phương trình tham số là\n  \\], ([$x={B+], [A+], [H+], [B]))"
    },
    {
      "path": "Kho Câu/Khối 12/HH Oxyz/Mặt cầu/MC PTMC tam bán kính",
      "content": "#tn([Mặt cầu tâm $I({A},{B+},{G})$ bán kính \\${H+}$ có phương trình là\n  \\], ([$(x+{A], [B+], [G], [H+]))"
    },
    {
      "path": "Kho Câu/Khối 12/HH Oxyz/Đúng Sai/TF hai đường thẳng song song vuông góc",
      "content": "#ds([Cho đường thẳng $d_1: \\\\dfrac{x-1}{{A+}} = \\\\dfrac{y+2}{{B+}} = \\\\dfrac{z}{{G+}}$ và $d_2: \\\\dfrac{x}{{A+}} = \\\\dfrac{y+1}{{B+}} = \\\\dfrac{z-3}{{G+}}$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Hai đường thẳng có cùng vectơ chỉ phương $\\\\vec{u]),\n    [A+],\n    [B+],\n    [G+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/HH Oxyz/Thực Tế/SA tọa độ điểm trong không gian thực",
      "content": "#tln([Trong hệ tọa độ $Oxyz$, một chiếc cần cẩu đứng tại điểm $A(0,0,0)$ và với tới điểm $B({A+},{B+},{G+})$ (đơn vị: mét). Tính khoảng cách từ $A$ đến $B$.\n  \\], [$\\\\sqrt{{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Xác suất cổ điển/MC rút bi ngẫu nhiên",
      "content": "\\\\begin{ex}\n  Một hộp có ${`{A+}"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Xác suất có điều kiện/MC xác suất Bayes",
      "content": "#tn([Nhà máy có hai dây chuyền $A$ (sản xuất $60\\\\%$ sản phẩm, tỉ lệ lỗi $2\\\\%$) và $B$ ($40\\\\%$, tỉ lệ lỗi $3\\\\%$). Chọn ngẫu nhiên một sản phẩm, xác suất nó không lỗi là\n  \\], ([$0.972$], True([\\ $0.976$]), [$0.024$], [$0.984$]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Phân phối nhị thức/MC Bernoulli bắn súng",
      "content": "#tn([Một xạ thủ bắn $n={A+}$ phát, mỗi phát trúng đích với xác suất $p=0.{G+}$. Xác suất bắn trúng đúng \\${B+}$ phát là\n  \\], ([$C_{{A+], [{B+], [G+], [{B+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Đúng Sai/TF xác suất sự kiện",
      "content": "#ds([Gieo ngẫu nhiên hai xúc xắc cân đối. Gọi $A$ là biến cố \"tổng hai mặt bằng \\${A+}$\". Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Không gian mẫu có $36$ phần tử]),\n    [Biến cố $A$ và biến cố bù $\\\\overline{A],\n    True([\\ $P(A) + P(\\\\overline{A]),\n    True([\\ Nếu $P(A)=\\\\dfrac{1])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất/Thực Tế/SA quyết định sản xuất",
      "content": "#tln([Một lô hàng \\${A+}$ sản phẩm có $3$ lỗi. Kiểm tra ngẫu nhiên $4$ sản phẩm. Xác suất phát hiện ít nhất $1$ sản phẩm lỗi bằng bao nhiêu? (Biểu diễn phân số tối giản)\n  \\], [$1-\\\\dfrac{C_{{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Thống Kê/Số trung bình/MC tính mean từ bảng tần số",
      "content": "#tn([Bảng tần số điểm của $20$ học sinh:\n  \\\\begin{center}\\\\begin{tabular}{|c|c|c|c|c|c|}\\\\hline\n  Điểm & 6 & 7 & 8 & 9 & 10 \\\\\\\\\\\\hline\n  Số HS & 2 & 5 & 7 & {A+} & {B+} \\\\\\\\\\\\hline\n  \\\\end{tabular}\\\\end{center}\n  Điểm trung bình của cả lớp là (biết \\${A+}+{B+}=6$)\n  \\], ([$7.5$], True([\\ $\\\\dfrac{6\\\\cdot2+7\\\\cdot5+8\\\\cdot7+9\\\\cdot{A+]), [B+], [20]))"
    },
    {
      "path": "Kho Câu/Khối 12/Thống Kê/Phương sai/MC phương sai mẫu nhỏ",
      "content": "#tn([Mẫu số liệu: $3, 5, {A+}, 7, {B+}$ có giá trị trung bình $\\\\bar{x} = \\\\dfrac{15+{A+}+{B+}}{5}$. Phương sai $s^2$ là\n  \\], ([$\\\\dfrac{(3-\\\\bar{x], [x], [A+], [x]))"
    },
    {
      "path": "Kho Câu/Khối 12/Thống Kê/Đúng Sai/TF phân tích bảng số liệu",
      "content": "#ds([Cho mẫu số liệu chiều cao (cm) của \\${A+} học sinh: $\\\\bar{x}=165$, số trung vị $Me=164$, $s=7$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Khoảng biến thiên cho biết chênh lệch giữa giá trị lớn nhất và nhỏ nhất]),\n    True([\\ Số trung bình chịu ảnh hưởng nhiều hơn bởi giá trị ngoại lệ so với số trung vị]),\n    [Phương sai bằng $7$],\n    True([\\ Độ lệch chuẩn $s=7$ mô tả mức độ phân tán quanh trung bình])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Thống Kê/Thực Tế/TL phân tích dữ liệu năng suất lúa",
      "content": "#tl([Năng suất lúa (tạ/ha) của \\${A+} thửa ruộng được cho trong bảng tần số ghép nhóm:\n  \\\\begin{center}\\\\begin{tabular}{|c|c|}\\\\hline\n  Nhóm & Tần số \\\\\\\\\\\\hline\n  $[40;50)$ & 3 \\\\\\\\\\\\hline\n  $[50;60)$ & {B+} \\\\\\\\\\\\hline\n  $[60;70)$ & 8 \\\\\\\\\\\\hline\n  $[70;80]$ & 2 \\\\\\\\\\\\hline\n  \\\\end{tabular}\\\\end{center}\n  Tính năng suất trung bình (gần đúng) và nhận xét.\n  \\\\loigiai{\n    Đại diện nhóm: $45, 55, 65, 75$. $\\\\bar{x} \\\\approx \\\\dfrac{3\\\\cdot45+{B+}\\\\cdot55+8\\\\cdot65+2\\\\cdot75}{{A+}}$. Nhận xét về phân bố.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 12/Biến Ngẫu Nhiên Rời Rạc/Bảng phân phối/MC kỳ vọng BNRR",
      "content": "#tn([Biến ngẫu nhiên $X$ có bảng phân phối xác suất:\n  \\\\begin{center}\\\\begin{tabular}{|c|c|c|c|c|}\\\\hline\n  $X$ & $0$ & $1$ & $2$ & $3$ \\\\\\\\\\\\hline\n  $P$ & $0.1$ & $0.{A+}$ & $0.3$ & $p$ \\\\\\\\\\\\hline\n  \\\\end{tabular}\\\\end{center}\n  Biết $\\\\sum P = 1$, kỳ vọng $E(X)$ bằng\n  \\], ([$1.5$], True([\\ $0+0.{A+]), [$0.{A+], [$1$]))"
    },
    {
      "path": "Kho Câu/Khối 12/Biến Ngẫu Nhiên Rời Rạc/Phương sai/SA phương sai BNRR",
      "content": "#tln([Biến ngẫu nhiên $X$ nhận giá trị $0, 1, 2$ với xác suất $0.3, 0.5, 0.2$.\n  Tính $E(X)$ và $V(X)$.\n  \\], [$E(X)=0.9$; $V(X)=0.49$], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Biến Ngẫu Nhiên Rời Rạc/Thực Tế/SA trò chơi kỳ vọng",
      "content": "#tln([Một trò chơi: tung đồng xu \\${A+} lần; nếu ra \\${B+} mặt sấp trở lên thắng \\${G+}0.000đ, ngược lại mất \\${H+}0.000đ. Tính kỳ vọng tiền thắng của người chơi.\n  \\], [$(\\\\text{tổng xác suất thắng], show-boxes: false)"
    }
  ],
  "GEN_K11": [
    {
      "path": "Kho Câu/Khối 11/Lượng Giác/Giá trị lượng giác/MC sin cos đặc biệt",
      "content": "#tn([Giá trị của $\\\\cos\\\\dfrac{5\\\\pi}{6}$ bằng\n  \\], ([$\\\\dfrac{\\\\sqrt{3], [2], True([\\ $-\\\\dfrac{\\\\sqrt{3]), [2]))"
    },
    {
      "path": "Kho Câu/Khối 11/Lượng Giác/Công thức lượng giác/MC cộng sin",
      "content": "#tn([Rút gọn $\\\\sin({A+}x+y) - \\\\sin({A+}x-y)$ bằng\n  \\], ([$2\\\\sin({A+], True([\\ $2\\\\cos({A+]), [$2\\\\sin(y)\\\\cos({A+], [$\\\\sin({A+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Lượng Giác/Phương trình lượng giác/MC PT sin",
      "content": "#tn([Phương trình $\\\\sin x = \\\\dfrac{\\\\sqrt{3}}{2}$ có nghiệm là\n  \\], ([$x = \\\\dfrac{\\\\pi], [3], [Z], True([\\ $x = \\\\dfrac{\\\\pi])))"
    },
    {
      "path": "Kho Câu/Khối 11/Lượng Giác/Phương trình lượng giác/MC PT cos thu gọn",
      "content": "#tn([Phương trình $\\\\cos({A+}x - \\\\pi/{B+}) = 0$ có họ nghiệm là\n  \\], ([$x = \\\\dfrac{\\\\pi], [2], True([\\ $x = \\\\dfrac{1]), [{A+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Lượng Giác/Đúng Sai/TF phương trình lượng giác",
      "content": "#ds([Xét phương trình $2\\\\sin^2x + {A+}\\\\sin x - {G+} = 0$, đặt $t = \\\\sin x$. Cho các mệnh đề:\n  \\],\n  (\n    True([\\ Điều kiện $-1\\\\leq t\\\\leq 1$]),\n    True([\\ Phương trình trở thành $2t^2+{A+]),\n    [G+],\n    [Phương trình có thể có vô số nghiệm]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Lượng Giác/Thực Tế/SA sóng điều hòa âm thanh",
      "content": "#tln([Một âm thanh được mô tả bởi dao động $y(t) = {A+}\\\\sin(2\\\\pi\\\\cdot440t)$ (cm), $t$ là thời gian (giây). Biên độ và tần số của âm thanh lần lượt là bao nhiêu?\n  \\], [Biên độ \\${A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Cấp Số Cộng Nhân/Cấp số cộng/MC số hạng CSC",
      "content": "#tn([Cấp số cộng $(u_n)$ có $u_1 = {A+}$ và công sai $d = {B+}$. Số hạng $u_{10}$ bằng\n  \\], ([\\${A+], [B+], True([\\ \\${A+]), [B+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Cấp Số Cộng Nhân/Cấp số cộng/SA tổng n số hạng đầu CSC",
      "content": "#tln([Cấp số cộng có $u_1 = {A+}$, $d = {B+}$. Tính tổng $S_n = u_1+u_2+\\\\cdots+u_n$.\n  \\], [$S_n = \\\\dfrac{n(2{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Cấp Số Cộng Nhân/Cấp số nhân/MC công bội CSN > 1",
      "content": "#tn([Cấp số nhân có $u_1 = {A+}$ và $u_4 = {A+}\\\\cdot{G+}^3$. Công bội $q$ bằng\n  \\], ([\\${G+], True([\\ \\${G+]), [$\\\\sqrt{{G+], [\\${A+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Cấp Số Cộng Nhân/Cấp số nhân/SA tổng CSN vô hạn",
      "content": "#tln([Tổng cấp số nhân vô hạn giảm dần có $u_1 = {A+}$ và công bội $q = \\\\dfrac{1}{{G+}}$ ($|q|<1$) bằng\n  \\], [$\\\\dfrac{{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Cấp Số Cộng Nhân/Đúng Sai/TF dãy số CSC hay CSN",
      "content": "#ds([Dãy số $u_n = {A+} + ({B+}-1)(n-1)$ ($n\\\\geq1$). Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Dãy là cấp số cộng với $u_1={A+]),\n    True([\\ Công sai $d = {B+]),\n    [Dãy là cấp số nhân],\n    True([\\ $u_{10])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Cấp Số Cộng Nhân/Thực Tế/TL tiết kiệm lãi kép CSN",
      "content": "#tl([Mỗi tháng bạn gửi \\${A+}00.000 đồng vào tài khoản tiết kiệm với lãi suất \\${B+}\\\\%$/tháng. Sau $12$ tháng, khoản tiết kiệm của bạn là bao nhiêu? Biết tổng cấp số nhân $S_{12} = {A+}00000\\\\cdot\\\\dfrac{(1+\\\\frac{{B+}}{100})^{12}-1}{\\\\frac{{B+}}{100}}$.\n  \\\\loigiai{\n    Đây là bài toán lãi kép với thanh toán định kỳ (annuity).\\\\\\\\\n    $S = {A+}00000\\\\cdot\\\\dfrac{(1.0{B+})^{12}-1}{0.0{B+}}$.\\\\\\\\\n    Tính số cụ thể bằng máy tính.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 11/Giới Hạn/Giới hạn hữu tỉ/MC giới hạn đa thức",
      "content": "#tn([Giới hạn $\\\\lim\\\\limits_{x\\\\to {A+}} ({B+}x^2 - {G+}x + 1)$ bằng\n  \\], ([\\${B+], [A+], [G+], [A+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Giới Hạn/Dạng vô định/MC giới hạn dạng 0/0 nhân tử",
      "content": "#tn([Giới hạn $\\\\lim\\\\limits_{x\\\\to {A+}} \\\\dfrac{x^2 - {A+}^2}{x-{A+}}$ bằng\n  \\], ([$0$], [$\\\\dfrac{1], [2], True([\\ $2{A+])))"
    },
    {
      "path": "Kho Câu/Khối 11/Giới Hạn/Giới hạn vô cực/MC giới hạn căn bậc 2",
      "content": "#tn([Giới hạn $\\\\lim\\\\limits_{x\\\\to+\\\\infty} \\\\dfrac{\\\\sqrt{{A+}x^2+{B+}}}{x+{G+}}$ bằng\n  \\], ([$+\\\\infty$], [$0$], [$1$], True([\\ $\\\\sqrt{{A+])))"
    },
    {
      "path": "Kho Câu/Khối 11/Giới Hạn/Hàm số liên tục/MC hàm liên tục tại điểm",
      "content": "#tn([Hàm số $f(x)=\\\\dfrac{x^2-{A+}^2}{x-{A+}}$ khi $x\\\\neq{A+}$ và $f({A+})=k$ liên tục tại $x={A+}$ khi $k$ bằng\n  \\], ([$0$], [\\${A+], True([\\ $2{A+]), [$-{A+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Giới Hạn/Đúng Sai/TF giới hạn dãy số",
      "content": "#ds([Cho dãy số $u_n = \\\\dfrac{{A+}n + {B+}}{{G+}n - 1}$ ($n\\\\geq 1$). Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $\\\\lim u_n = \\\\dfrac{{A+]),\n    [{G+],\n    True([\\ Dãy hội tụ về $\\\\dfrac{{A+]),\n    [{G+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Luỹ Thừa Mũ Logarit/Lũy thừa/MC lũy thừa phân số",
      "content": "\\\\begin{ex}\n  Giá trị của ${`{A+}"
    },
    {
      "path": "Kho Câu/Khối 11/Luỹ Thừa Mũ Logarit/Logarit/MC tính logarit",
      "content": "#tn([Giá trị của $\\\\log_{{A+}} {A+}^{{G+}}$ bằng\n  \\], ([\\${A+], [$1$], True([\\ \\${G+]), [\\${A+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Luỹ Thừa Mũ Logarit/Logarit/SA đổi cơ số logarit",
      "content": "#tln([Rút gọn $\\\\log_{{A+}} {B+}\\\\cdot\\\\log_{{B+}} {G+}$ bằng cách dùng công thức đổi cơ số.\n  \\], [$\\\\log_{{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Luỹ Thừa Mũ Logarit/Phương trình/MC PT mũ biến đổi",
      "content": "\\\\begin{ex}\n  Phương trình ${`{A+}"
    },
    {
      "path": "Kho Câu/Khối 11/Luỹ Thừa Mũ Logarit/Đúng Sai/TF đổi cơ số và so sánh",
      "content": "#ds([Cho $a > 1$ và $0 < b < 1$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $\\\\log_a x$ đồng biến trên $(0;+\\\\infty)$ vì $a>1$]),\n    True([\\ $\\\\log_b x$ nghịch biến vì $0<b<1$]),\n    [$\\\\log_a 1 = a$],\n    True([\\ $\\\\log_{a/b])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Luỹ Thừa Mũ Logarit/Thực Tế/SA dân số tăng trưởng mũ",
      "content": "#tln([Dân số một thành phố năm 2020 là \\${A+} triệu người, tăng \\${B+}\\\\%$/năm. Hỏi đến năm nào dân số lần đầu vượt \\${G+} triệu người? (Lấy $\\\\lg 2\\\\approx 0.301$, kết quả làm tròn lên)\n  \\], [Năm $2020 + \\\\left\\\\lceil\\\\log_{1.0{B+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Quy tắc đếm/MC hoán vị chỉnh hợp",
      "content": "#tn([Từ chữ số $1, 2, 3, 4, 5, 6$, lập số tự nhiên có \\${A+}$ chữ số khác nhau. Có bao nhiêu cách?\n  \\], ([$6^{{A+], [$C_6^{{A+], True([\\ $A_6^{{A+]), [6!]))"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Tổ hợp/MC chọn không thứ tự",
      "content": "\\\\begin{ex}\n  Một lớp có ${`{A+}"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Xác suất/MC xác suất rút bài",
      "content": "#tn([Từ bộ bài \\${A+} lá, rút ngẫu nhiên $2$ lá. Xác suất để cả hai lá đều là lá bích ($\\\\heartsuit$ chiếm $\\\\frac{1}{4}$ tổng) bằng\n  \\], ([$\\\\dfrac{1], [16], [$\\\\dfrac{1], [{A+]))"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Đúng Sai/TF xác suất cổ điển",
      "content": "#ds([Có \\${A+} bi đỏ và \\${B+} bi xanh (bi khác nhau). Rút ngẫu nhiên $3$ bi. Gọi $A$ = \"rút đúng 1 bi đỏ\". Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $|\\\\Omega| = C_{{A+]),\n    [B+],\n    True([\\ $|A| = C_{{A+]),\n    [{B+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Xác Suất Thực Tế/Thực Tế/TL sinh nhật trùng nhau",
      "content": "#tl([Trong một lớp \\${A+} học sinh, xác suất để ít nhất $2$ người sinh cùng ngày sinh nhật (giả sử năm có $365$ ngày, xác suất đều) được tính bởi công thức nào và xấp xỉ là bao nhiêu?\n  \\\\loigiai{\n    $P(\\\\text{ít nhất 2 trùng}) = 1-P(\\\\text{không ai trùng}) = 1-\\\\dfrac{365\\\\cdot364\\\\cdots(365-{A+}+1)}{365^{{A+}}}$.\\\\\\\\\n    Dùng xấp xỉ: với \\${A+}=23$, $P\\\\approx50\\\\%$.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 11/Hình Học Không Gian/Đường thẳng song song/MC đường thẳng song song mặt phẳng",
      "content": "#tn([Đường thẳng $a$ song song với mặt phẳng $(P)$ khi và chỉ khi\n  \\], ([$a$ nằm trong $(P)$], True([\\ $a$ và $(P)$ không có điểm chung]), [$a$ vuông góc với mọi đường trong $(P)$], [$a$ vuông góc với $(P)$]))"
    },
    {
      "path": "Kho Câu/Khối 11/Hình Học Không Gian/Vuông góc/MC hai mặt phẳng vuông góc",
      "content": "#tn([Hai mặt phẳng $(P)$ và $(Q)$ vuông góc nhau khi góc nhị diện tạo bởi chúng bằng\n  \\], ([$60^\\\\circ$], [$45^\\\\circ$], True([\\ $90^\\\\circ$]), [$180^\\\\circ$]))"
    },
    {
      "path": "Kho Câu/Khối 11/Hình Học Không Gian/Khoảng cách/SA khoảng cách hai đường thẳng chéo nhau",
      "content": "#tln([Trong hình lập phương $ABCD.A'B'C'D'$ cạnh \\${A+}$. Tính khoảng cách giữa hai đường thẳng $AB$ và $A'D'$.\n  \\], [\\${A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Hình Học Không Gian/Đúng Sai/TF hình học không gian định lý",
      "content": "#ds([Cho tứ diện $ABCD$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Hai cạnh $AB$ và $CD$ có thể chéo nhau]),\n    True([\\ Tổng $4$ góc mặt $=$ góc khối tứ diện (không đúng theo định lý)]),\n    [Hai mặt phẳng $(ABC)$ và $(ACD)$ luôn song song],\n    True([\\ Đường trung bình nối trung điểm hai cạnh chéo nhau song song với hai cạnh kia và bằng nửa tổng])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Toán Kinh Tế/Lãi suất/MC lãi đơn tháng",
      "content": "#tn([Vay \\${A+} triệu đồng trong \\${B+} năm với lãi suất đơn \\${G+}\\\\%$/năm. Số tiền lãi phải trả là\n  \\], ([\\${A+], [G+], [B+], True([\\ \\${A+])))"
    },
    {
      "path": "Kho Câu/Khối 11/Toán Kinh Tế/Tối ưu hóa/SA doanh thu tối đa",
      "content": "#tln([Một cửa hàng bán sản phẩm với giá $p = {A+}0 - {B+}q$ (nghìn đồng), trong đó $q$ là sản lượng ($q\\\\leq{A+}0/{B+}$). Doanh thu $R = p\\\\cdot q$. Tìm sản lượng $q^*$ để doanh thu cực đại.\n  \\], [$q^* = \\\\dfrac{{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 11/Toán Kinh Tế/Đúng Sai/TF chi phí doanh thu lợi nhuận",
      "content": "#ds([Công ty sản xuất $q$ đơn vị sản phẩm có chi phí $C(q)={A+}q+{B+}$ và giá bán $p={G+}-{H+}q$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Doanh thu $R(q) = pq = ({G+]),\n    [H+],\n    True([\\ Lợi nhuận $\\\\pi(q) = R(q)-C(q)$]),\n    [Lợi nhuận cực đại tại $q = \\\\dfrac{{G+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 11/Toán Kinh Tế/Thực Tế/TL hoạch toán nhà máy",
      "content": "#tl([Nhà máy sản xuất \\${A+}0 tấn xi-măng/ngày, chi phí cố định \\${B+}0 triệu, biến phí \\${G+} triệu/tấn. Giá bán \\${H+} triệu/tấn.\n  \\\\begin{enumerate}\n    \\\\item Viết hàm lợi nhuận $\\\\pi(q)$ theo sản lượng $q$.\n    \\\\item Tính sản lượng hòa vốn.\n    \\\\item Tính lợi nhuận khi sản xuất hết công suất.\n  \\\\end{enumerate}\n  \\\\loigiai{\n    a) $\\\\pi(q) = ({H+}-{G+})q - {B+}0$. \\\\\\\\\n    b) Hòa vốn: $\\\\pi=0 \\\\Rightarrow q = \\\\dfrac{{B+}0}{{H+}-{G+}}$ tấn. \\\\\\\\\n    c) $\\\\pi({A+}0) = ({H+}-{G+})\\\\cdot{A+}0-{B+}0$ triệu.\n  }\n\\])"
    }
  ],
  "GEN_K12_XSCDK": [
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bốc bi/MC hai bi cùng màu",
      "content": "#tn([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $2$ bi không hoàn lại. Xác suất để hai bi rút ra cùng màu là\n  \\], (True([\\ $\\\\dfrac{C_{{G+]), [{H+], [C_{{G+], [H+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bốc bi/MC lần hai đỏ biết lần một đỏ",
      "content": "#tn([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút liên tiếp $2$ bi không hoàn lại. Biết lần rút thứ nhất được bi đỏ. Xác suất để lần rút thứ hai cũng được bi đỏ là\n  \\], ([$\\\\dfrac{{G+], [{G+], [H+], True([\\ $\\\\dfrac{{G+])))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bốc bi/MC đúng một bi đỏ trong hai lần rút",
      "content": "#tn([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $2$ bi không hoàn lại. Xác suất để rút được đúng $1$ bi đỏ là\n  \\], ([$\\\\dfrac{C_{{G+], [C_{{G+], [H+], True([\\ $\\\\dfrac{C_{{G+])))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bốc bi/SA đúng hai bi đỏ trong bốn lần rút",
      "content": "#tln([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $4$ bi không hoàn lại. Tính xác suất để trong $4$ bi rút ra có đúng $2$ bi đỏ.\n  \\], [$\\\\dfrac{C_{{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bốc bi/SA đúng một bi đỏ biết có ít nhất một bi đỏ",
      "content": "#tln([Một hộp có {G+} bi đỏ và {H+} bi xanh. Rút ngẫu nhiên $2$ bi không hoàn lại. Biết rằng trong $2$ bi rút ra có ít nhất một bi đỏ. Tính xác suất để có đúng $1$ bi đỏ.\n  \\], [$\\\\dfrac{C_{{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bốc bi/MC đúng một bi mỗi màu",
      "content": "#tn([Một hộp có {G+} bi đỏ, {H+} bi xanh và {K+} bi vàng. Rút ngẫu nhiên $3$ bi không hoàn lại. Xác suất để rút được đúng $1$ bi mỗi màu là\n  \\], (True([\\ $\\\\dfrac{C_{{G+]), [{H+], [{K+], [C_{{G+]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Chọn hộp/TF chọn hộp rồi rút bi đỏ",
      "content": "#ds([Hộp I có {G+} bi đỏ và {H+} bi xanh. Hộp II có {K+} bi đỏ và {L+} bi xanh. Chọn ngẫu nhiên một trong hai hộp rồi rút ngẫu nhiên một bi. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $P(\\\\text{rút đỏ]),\n    [1],\n    [2],\n    [{G+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Chuyển bi/SA chuyển bi từ hộp I sang hộp II",
      "content": "#tln([Hộp I có {G+} bi đỏ và {H+} bi xanh. Hộp II có {K+} bi đỏ và {L+} bi xanh. Lấy ngẫu nhiên $1$ bi từ hộp I chuyển sang hộp II, sau đó rút ngẫu nhiên $1$ bi từ hộp II. Tính xác suất để bi rút ra từ hộp II là bi đỏ.\n  \\], [$\\\\dfrac{{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Đánh số bi/TF xác suất đỏ biết bi được đánh số",
      "content": "#ds([Một hộp có {G+} bi đỏ được đánh số, {H+} bi đỏ không đánh số, {K+} bi xanh được đánh số và {L+} bi xanh không đánh số. Lấy ngẫu nhiên một bi. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Xác suất lấy được bi được đánh số là $\\\\dfrac{{G+]),\n    [K+],\n    [{G+],\n    [H+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Chọn hộp/TL chọn một trong ba hộp rồi truy vết hộp II",
      "content": "#tl([Có ba hộp bi. Hộp I có {G+} bi đỏ và {H+} bi xanh; hộp II có {K+} bi đỏ và {L+} bi xanh; hộp III có {M+} bi đỏ và {N+} bi xanh. Chọn ngẫu nhiên một trong ba hộp, rồi rút ngẫu nhiên một bi từ hộp đã chọn.\n  \\\\begin{enumerate}\n    \\\\item Tính xác suất rút được bi đỏ.\n    \\\\item Biết bi rút ra là đỏ. Tính xác suất bi đó được lấy từ hộp II.\n  \\\\end{enumerate}\n  \\\\loigiai{\n    \\\\begin{itemize}\n      \\\\item Vì chọn đều ba hộp nên\n      $$P(\\\\text{đỏ})=\\\\dfrac{1}{3}\\\\left(\\\\dfrac{{G+}}{{G+}+{H+}}+\\\\dfrac{{K+}}{{K+}+{L+}}+\\\\dfrac{{M+}}{{M+}+{N+}}\\\\right).$$\n      \\\\item Theo Bayes,\n      $$P(\\\\text{hộp II | đỏ})=\\\\dfrac{\\\\frac{1}{3}\\\\cdot\\\\frac{{K+}}{{K+}+{L+}}}{P(\\\\text{đỏ})}.$$\n      \\\\item Thay biểu thức $P(\\\\text{đỏ})$ ở trên vào, ta được đáp án bài toán.\n    \\\\end{itemize}\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bayes truy nguồn/MC xác suất nhận sản phẩm lỗi từ hai nhà máy",
      "content": "#tn([Một cửa hàng nhập $60\\\\%$ sản phẩm từ nhà máy A và $40\\\\%$ sản phẩm từ nhà máy B. Tỉ lệ phế phẩm của A là {A+}\\\\%, của B là {B+}\\\\%. Chọn ngẫu nhiên một sản phẩm. Xác suất để sản phẩm đó là phế phẩm bằng\n  \\], ([$\\\\dfrac{6\\cdot {A+], [B+], [100], True([\\ $\\\\dfrac{6\\cdot {A+])))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bayes truy nguồn/SA truy vết nhà máy B khi gặp phế phẩm",
      "content": "#tln([Một cửa hàng nhập $60\\\\%$ sản phẩm từ nhà máy A và $40\\\\%$ sản phẩm từ nhà máy B. Tỉ lệ phế phẩm của A là {A+}\\\\%, của B là {B+}\\\\%. Biết một sản phẩm chọn ngẫu nhiên là phế phẩm. Tính xác suất để sản phẩm đó đến từ nhà máy B.\n  \\], [$\\\\dfrac{4\\cdot {B+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bayes truy nguồn/MC xác suất lỗi từ ba nguồn",
      "content": "#tn([Một doanh nghiệp nhập hàng từ ba nguồn A, B, C theo tỉ lệ lần lượt là $50\\\\%$, $30\\\\%$, $20\\\\%$. Tỉ lệ lỗi của ba nguồn tương ứng là {A+}\\\\%, {B+}\\\\%, {G+}\\\\%. Xác suất để một sản phẩm chọn ngẫu nhiên bị lỗi là\n  \\], ([$\\\\dfrac{5\\cdot {A+], [B+], [G+], [100]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bayes truy nguồn/SA truy vết nguồn C khi phát hiện hàng lỗi",
      "content": "#tln([Một doanh nghiệp nhập hàng từ ba nguồn A, B, C theo tỉ lệ lần lượt là $50\\\\%$, $30\\\\%$, $20\\\\%$. Tỉ lệ lỗi của ba nguồn tương ứng là {A+}\\\\%, {B+}\\\\%, {G+}\\\\%. Biết một sản phẩm được chọn ngẫu nhiên là hàng lỗi. Tính xác suất để sản phẩm đó đến từ nguồn C.\n  \\], [$\\\\dfrac{2\\cdot {G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bayes truy nguồn/TL truy vết nông sản theo ba hợp tác xã",
      "content": "#tl([Một siêu thị nhập rau từ ba hợp tác xã A, B, C theo tỉ lệ lần lượt là $40\\\\%$, $35\\\\%$, $25\\\\%$. Tỉ lệ lô hàng không đạt chuẩn của ba hợp tác xã tương ứng là {A+}\\\\%, {B+}\\\\%, {H+}\\\\%.\n  \\\\begin{enumerate}\n    \\\\item Tính xác suất để một gói rau chọn ngẫu nhiên là hàng không đạt chuẩn.\n    \\\\item Biết một gói rau bị phát hiện không đạt chuẩn. Tính xác suất gói rau đó đến từ hợp tác xã C.\n    \\\\item Dựa trên dữ kiện của bài toán, nguồn nào cần ưu tiên truy vết nếu phát hiện một gói rau không đạt chuẩn?\n  \\\\end{enumerate}\n  \\\\loigiai{\n    \\\\begin{itemize}\n      \\\\item Gọi $K$ là biến cố “gói rau không đạt chuẩn”. Khi đó\n      $$P(K)=0.4\\\\cdot\\\\dfrac{{A+}}{100}+0.35\\\\cdot\\\\dfrac{{B+}}{100}+0.25\\\\cdot\\\\dfrac{{H+}}{100}.$$\n      \\\\item Theo Bayes,\n      $$P(C|K)=\\\\dfrac{0.25\\\\cdot\\\\frac{{H+}}{100}}{P(K)}.$$\n      \\\\item Nguồn cần ưu tiên truy vết là nguồn có xác suất hậu nghiệm lớn nhất trong ba giá trị $P(A|K)$, $P(B|K)$, $P(C|K)$.\n    \\\\end{itemize}\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Xét nghiệm/MC xác suất cho kết quả dương tính",
      "content": "#tn([Một loại bệnh xuất hiện trong $2\\\\%$ dân số. Một xét nghiệm có độ nhạy $95\\\\%$ và độ đặc hiệu $96\\\\%$. Chọn ngẫu nhiên một người trong cộng đồng. Xác suất để người đó có kết quả xét nghiệm dương tính là\n  \\], ([$0.95$], [$0.02$], True([\\ $0.02\\cdot0.95+0.98\\cdot0.04$]), [$0.02\\cdot0.96+0.98\\cdot0.95$]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Xét nghiệm/SA xác suất mắc bệnh khi đã dương tính",
      "content": "#tln([Một loại bệnh xuất hiện trong $2\\\\%$ dân số. Một xét nghiệm có độ nhạy $95\\\\%$ và độ đặc hiệu $96\\\\%$. Biết một người có kết quả xét nghiệm dương tính. Tính xác suất để người đó thực sự mắc bệnh.\n  \\], [$\\\\dfrac{0.02\\cdot0.95], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Xét nghiệm/TF diễn giải Bayes trong xét nghiệm",
      "content": "#ds([Với cùng dữ kiện: bệnh chiếm $2\\\\%$ dân số, xét nghiệm có độ nhạy $95\\\\%$, độ đặc hiệu $96\\\\%$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Xác suất dương tính giả bằng $4\\\\%$]),\n    True([\\ Xác suất dương tính của cả cộng đồng không bằng $95\\\\%$]),\n    True([\\ Xác suất mắc bệnh khi đã dương tính phải tính bằng công thức Bayes]),\n    [$P(\\\\text{mắc bệnh | dương tính]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Kho vận/MC xác suất kiện hàng bị hỏng",
      "content": "#tn([Một công ty nhận hàng từ ba kho A, B, C theo tỉ lệ lần lượt là $50\\\\%$, $30\\\\%$, $20\\\\%$. Tỉ lệ kiện hàng bị hỏng ở ba kho tương ứng là {A+}\\\\%, {B+}\\\\%, {G+}\\\\%. Xác suất để một kiện hàng chọn ngẫu nhiên bị hỏng là\n  \\], ([$\\\\dfrac{5\\cdot {A+], [B+], [G+], [100]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Kho vận/SA truy vết kho C khi kiện hàng bị hỏng",
      "content": "#tln([Một công ty nhận hàng từ ba kho A, B, C theo tỉ lệ lần lượt là $50\\\\%$, $30\\\\%$, $20\\\\%$. Tỉ lệ kiện hàng bị hỏng ở ba kho tương ứng là {A+}\\\\%, {B+}\\\\%, {G+}\\\\%. Biết một kiện hàng chọn ngẫu nhiên bị hỏng. Tính xác suất kiện hàng đó đến từ kho C.\n  \\], [$\\\\dfrac{2\\cdot {G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/QR truy vết/MC xác suất hàng giả từ ba xưởng",
      "content": "#tn([Một sàn thương mại điện tử nhận hàng từ ba xưởng A, B, C theo tỉ lệ lần lượt là $40\\\\%$, $35\\\\%$, $25\\\\%$. Tỉ lệ hàng giả của ba xưởng tương ứng là {A+}\\\\%, {B+}\\\\%, {H+}\\\\%. Xác suất để một sản phẩm được chọn ngẫu nhiên là hàng giả bằng\n  \\], ([$\\\\dfrac{40\\cdot {A+], [B+], [H+], [100]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/QR truy vết/SA xác suất xưởng B khi phát hiện hàng giả",
      "content": "#tln([Một sàn thương mại điện tử nhận hàng từ ba xưởng A, B, C theo tỉ lệ lần lượt là $40\\\\%$, $35\\\\%$, $25\\\\%$. Tỉ lệ hàng giả của ba xưởng tương ứng là {A+}\\\\%, {B+}\\\\%, {H+}\\\\%. Biết một sản phẩm được chọn ngẫu nhiên là hàng giả. Tính xác suất sản phẩm đó đến từ xưởng B.\n  \\], [$\\\\dfrac{35\\cdot {B+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Công thức nhân/MC sản phẩm qua hai khâu kiểm định",
      "content": "#tn([Một sản phẩm qua hai khâu kiểm định liên tiếp. Xác suất qua khâu thứ nhất là $0.9$, xác suất qua khâu thứ hai với điều kiện đã qua khâu thứ nhất là $0.95$. Xác suất để sản phẩm qua được cả hai khâu là\n  \\], ([$0.95$], [$0.9+0.95$], True([\\ $0.9\\cdot0.95$]), [$0.05\\cdot0.1$]))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Công thức nhân/SA sản phẩm qua ba khâu kiểm định",
      "content": "#tln([Một linh kiện điện tử phải qua ba khâu kiểm định liên tiếp. Xác suất qua khâu thứ nhất là $0.92$, xác suất qua khâu thứ hai khi đã qua khâu thứ nhất là $0.95$, xác suất qua khâu thứ ba khi đã qua hai khâu trước là $0.96$. Tính xác suất để linh kiện đó qua được cả ba khâu.\n  \\], [$0.92\\cdot0.95\\cdot0.96$], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bốc bi/MC bi đỏ biết bi được đánh số",
      "content": "#tn([Một hộp có {G+} bi đỏ được đánh số, {H+} bi đỏ không đánh số, {K+} bi xanh được đánh số và {L+} bi xanh không đánh số. Chọn ngẫu nhiên một bi. Xác suất để bi được chọn là bi đỏ, biết rằng bi đó được đánh số, là\n  \\], ([$\\\\dfrac{{G+], [{G+], [H+], True([\\ $\\\\dfrac{{G+])))"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Bayes truy nguồn/SA xác suất hàng tốt đến từ nhà máy A",
      "content": "#tln([Một cửa hàng nhập $60\\\\%$ sản phẩm từ nhà máy A và $40\\\\%$ sản phẩm từ nhà máy B. Tỉ lệ phế phẩm của A là {A+}\\\\%, của B là {B+}\\\\%. Biết một sản phẩm được chọn ngẫu nhiên là hàng tốt. Tính xác suất để sản phẩm đó đến từ nhà máy A.\n  \\], [$\\\\dfrac{60\\cdot (100-{A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 12/Xác Suất Có Điều Kiện/Kho vận/TF truy vết kho hàng bằng xác suất hậu nghiệm",
      "content": "#ds([Một công ty nhận hàng từ ba kho A, B, C theo tỉ lệ lần lượt là $50\\\\%$, $30\\\\%$, $20\\\\%$. Tỉ lệ kiện hàng bị hỏng ở ba kho tương ứng là {A+}\\\\%, {B+}\\\\%, {G+}\\\\%. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Xác suất để một kiện hàng bất kỳ bị hỏng được tính bằng công thức xác suất toàn phần]),\n    True([\\ Nếu phát hiện một kiện hàng bị hỏng thì cần dùng Bayes để truy vết kho gốc]),\n    True([\\ Nếu kho C có tỉ lệ hỏng cao nhất thì chưa chắc $P(C|\\\\text{hỏng]),\n    [$P(C|\\\\text{hỏng]\n  )\n)"
    }
  ],
  "GEN_K10": [
    {
      "path": "Kho Câu/Khối 10/Mệnh Đề Tập Hợp/Mệnh đề/MC mệnh đề phủ định",
      "content": "#tn([Phủ định của mệnh đề \"Mọi số nguyên tố đều là số lẻ\" là\n  \\], ([Không có số nguyên tố nào là số lẻ], True([\\ Tồn tại một số nguyên tố là số chẵn]), [Mọi số lẻ đều là số nguyên tố], [Một số nguyên tố không là số lẻ]))"
    },
    {
      "path": "Kho Câu/Khối 10/Mệnh Đề Tập Hợp/Mệnh đề/MC điều kiện cần đủ",
      "content": "#tn([\"Nếu $n$ chia hết cho \\${A+}$ thì $n$ chia hết cho \\${G+}$\" (giả sử \\${G+}|{A+}$). Mệnh đề này có dạng\n  \\], ([Điều kiện cần], True([\\ Điều kiện đủ]), [Điều kiện cần và đủ], [Không phải điều kiện nào]))"
    },
    {
      "path": "Kho Câu/Khối 10/Mệnh Đề Tập Hợp/Tập hợp/MC giao hợp",
      "content": "#tn([Cho $A = \\\\{1,2,3,4,{A+}\\\\}$ và $B = \\\\{{A+},{B+},{G+}\\\\}$. Khi đó $A\\\\cap B$ bằng\n  \\], ([$\\\\{1,2,3,4,{A+], [B+], [G+], True([\\ $\\\\{{A+])))"
    },
    {
      "path": "Kho Câu/Khối 10/Mệnh Đề Tập Hợp/Tập hợp/TF phép toán tập hợp",
      "content": "#ds([Cho $A = [1;{A+}]$ và $B = [{B+};{G+}]$ trên $\\\\mathbb{R}$ (với $1<{B+}<{A+}<{G+}$). Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $A\\\\cup B = [1;{G+]),\n    True([\\ $A\\\\cap B = [{B+]),\n    [A+],\n    [$A\\\\setminus B = \\\\emptyset$]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 10/Hàm Số Bậc Hai/Tập xác định/MC hàm căn xác định",
      "content": "#tn([Tập xác định của hàm số $f(x) = \\\\sqrt{{A+}x - {B+}}$ là\n  \\], ([$\\\\mathbb{R], [$\\\\left(-\\\\infty; \\\\dfrac{{B+], [{A+], True([\\ $\\\\left[\\\\dfrac{{B+])))"
    },
    {
      "path": "Kho Câu/Khối 10/Hàm Số Bậc Hai/Đồ thị Parabol/MC đỉnh parabol",
      "content": "#tn([Đỉnh của parabol $y = {A+}x^2 - {B+}x + {G+}$ có tọa độ là\n  \\], ([$\\\\left(\\\\dfrac{{B+], [{A+], True([\\ $\\\\left(\\\\dfrac{{B+]), [2{A+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Hàm Số Bậc Hai/Đồ thị Parabol/SA GTLN GTNN hàm bậc hai",
      "content": "#tln([Tìm giá trị nhỏ nhất của hàm số $f(x) = {A+}x^2 - {B+}x + {G+}$ ($a = {A+} > 0$).\n  \\], [$y_{\\\\min], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 10/Hàm Số Bậc Hai/Đúng Sai/TF parabol và trục đối xứng",
      "content": "#ds([Xét parabol $y = -{A+}x^2 + {B+}x - {G+}$ ($a={-A+}<0$). Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Parabol mở xuống vì $a < 0$]),\n    True([\\ Trục đối xứng $x = \\\\dfrac{{B+]),\n    [2{A+],\n    [Hàm số đồng biến trên toàn $\\\\mathbb{R]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 10/Phương Trình/Phương trình bậc hai/MC delta và nghiệm",
      "content": "#tn([Phương trình \\${A+}$x^2 - {B+}x + {G+} = 0$ có\n  \\], ([Hai nghiệm phân biệt khi $\\\\Delta = {B+], [A+], [G+], [Nghiệm kép khi $\\\\Delta = 0$]))"
    },
    {
      "path": "Kho Câu/Khối 10/Phương Trình/Phương trình bậc hai/SA Vieta hai nghiệm",
      "content": "#tln([Phương trình $x^2 - {A+}x + {B+} = 0$ có hai nghiệm $x_1, x_2$. Tính $x_1^2 + x_2^2$.\n  \\], [\\${A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 10/Bất Phương Trình/BPT bậc hai/MC khoảng nghiệm BPT",
      "content": "#tn([Tập nghiệm của bất phương trình $x^2 - {A+}x - {B+} < 0$ là (giả sử $\\\\Delta > 0$, nghiệm $x_1 < x_2$)\n  \\], ([$(-\\\\infty; x_1)\\\\cup(x_2;+\\\\infty)$], True([\\ $(x_1; x_2)$]), [$(-\\\\infty; x_2)$], [$\\\\mathbb{R]))"
    },
    {
      "path": "Kho Câu/Khối 10/Bất Phương Trình/Hệ bất phương trình/SA giải hệ BPT bậc nhất",
      "content": "#tln([Giải hệ bất phương trình: $\\\\begin{cases} {A+}x - {B+} > 0 \\\\\\\\ x - {G+} < 0 \\\\end{cases}$\n  \\], [$\\\\dfrac{{B+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 10/Bất Phương Trình/Hệ bất phương trình/TF hai ẩn miền nghiệm",
      "content": "#ds([Hệ $\\\\begin{cases} x + y \\\\leq {A+} \\\\\\\\ x - y \\\\geq {B+} \\\\\\\\ x \\\\geq 0 \\\\end{cases}$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ Đây là hệ bất phương trình tuyến tính hai ẩn]),\n    True([\\ Miền nghiệm là giao của 3 nửa mặt phẳng]),\n    [Miền nghiệm luôn bị chặn],\n    True([\\ Điểm $(x;y)=$ ($\\\\dfrac{{A+])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 10/Bất Phương Trình/Thực Tế/TL quy hoạch tuyến tính bán hàng",
      "content": "#tl([Cửa hàng bán hai loại trái cây A và B. Mỗi kg A lãi \\${A+} nghìn, mỗi kg B lãi \\${B+} nghìn. Cửa hàng có \\${G+} kg tổng cộng, bán ít nhất \\${H+} kg mỗi loại. Tìm phân bổ A, B (kg) để lãi tối đa.\n  \\\\loigiai{\n    Đặt $x$ = kg A, $y$ = kg B. Hệ: $x+y\\\\leq{G+}$, $x\\\\geq{H+}$, $y\\\\geq{H+}$.\\\\\n    Hàm mục tiêu $f = {A+}x+{B+}y$. Xét các đỉnh miền nghiệm, tính $f$ tại từng đỉnh.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 10/Vec Tơ/Tính chất vec-tơ/MC cộng vec-tơ quy tắc hình bình hành",
      "content": "#tn([Cho hình bình hành $ABCD$. Khi đó $\\\\overrightarrow{AB} + \\\\overrightarrow{AD}$ bằng\n  \\], ([$\\\\overrightarrow{BD], [$\\\\overrightarrow{DB], True([\\ $\\\\overrightarrow{AC]), [$\\\\overrightarrow{CA]))"
    },
    {
      "path": "Kho Câu/Khối 10/Vec Tơ/Tọa độ vec-tơ/MC tọa độ điểm chia đoạn",
      "content": "#tn([Điểm $M$ là trung điểm $AB$ với $A({A+};{B+})$, $B({G+};{H+})$. Tọa độ $M$ là\n  \\], ([$({A+], [G+], [B+], [H+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Vec Tơ/Tích vô hướng/MC tích vô hướng",
      "content": "#tn([Cho $\\\\vec{a} = ({A+}; {B+})$ và $\\\\vec{b} = ({G+}; {H+})$. Tích vô hướng $\\\\vec{a}\\\\cdot\\\\vec{b}$ bằng\n  \\], ([$({A+], [G+], [B+], [H+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Vec Tơ/Đúng Sai/TF vec-tơ und tọa độ",
      "content": "#ds([Cho $A({A+};{B+})$, $B({G+};0)$. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $\\\\overrightarrow{AB]),\n    [G+],\n    [A+],\n    [B+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 10/Phép Đếm/Quy tắc đếm/MC quy tắc nhân",
      "content": "#tn([Từ $A$ đến $B$ có \\${A+}$ đường, từ $B$ đến $C$ có \\${B+}$ đường. Số hành trình từ $A$ đến $C$ qua $B$ là\n  \\], ([\\${A+], [B+], True([\\ \\${A+]), [B+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Phép Đếm/Hoán vị/MC sắp xếp n phần tử",
      "content": "#tn([Có bao nhiêu cách sắp \\${A+} học sinh theo hàng ngang?\n  \\], ([\\${A+], [$C_{{A+], True([\\ \\${A+]), [\\${A+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Phép Đếm/Chỉnh hợp/MC chỉnh hợp có thứ tự",
      "content": "#tn([Số mật khẩu gồm \\${A+} ký tự khác nhau chọn từ \\${G+} ký tự là\n  \\], ([$C_{{G+], [{A+], [\\${G+], True([\\ $A_{{G+])))"
    },
    {
      "path": "Kho Câu/Khối 10/Phép Đếm/Tổ hợp/MC công thức tổ hợp",
      "content": "#tn([Giá trị $C_{10}^{{A+}}$ (với $1\\\\leq {A+}\\\\leq 9$) bằng\n  \\], ([$10\\\\cdot9\\\\cdots(10-{A+], [$C_{10], [10-{A+], [A+]))"
    },
    {
      "path": "Kho Câu/Khối 10/Phép Đếm/Đúng Sai/TF đếm nâng cao chia trường hợp",
      "content": "#ds([Xếp \\${A+} nam và \\${B+} nữ thành hàng ngang, sao cho nam và nữ xen kẽ nhau. Xét các mệnh đề (giả sử \\${A+}={B+}$):\n  \\],\n  (\n    True([\\ Nếu \\${A+]),\n    [B+],\n    [{A+],\n    [{B+]\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 10/Phép Đếm/Tổ hợp/SA nhị thức Newton",
      "content": "#tln([Hệ số của $x^{{A+}}$ trong khai triển $(1+x)^{{G+}}$ bằng $C_{{G+}}^{{A+}}$. Tính giá trị này.\n  \\], [$C_{{G+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Không gian mẫu/MC xác suất đồng đều",
      "content": "#tn([Gieo một con xúc xắc cân đối. Xác suất xuất hiện mặt có số chấm chia hết cho \\${A+}$ (với \\${A+}=2$ hoặc $3$) là\n  \\], ([$\\\\dfrac{{A+], [6], True([\\ $\\\\dfrac{\\\\lfloor 6/{A+]), [6]))"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Sự kiện/MC xác suất hai sự kiện bù",
      "content": "#tn([Xác suất để một sản phẩm bị lỗi là \\${A+}\\\\%$. Xác suất để sản phẩm không bị lỗi là\n  \\], ([\\${A+], True([\\ $(100-{A+]), [$\\\\dfrac{{A+], [100]))"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Thực Tế/SA xác suất trúng giải thưởng",
      "content": "#tln([Một hộp có \\${A+}0 phiếu, trong đó \\${B+} phiếu trúng. Rút ngẫu nhiên $1$ phiếu. Xác suất trúng giải là bao nhiêu?\n  \\], [$\\\\dfrac{{B+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Đúng Sai/TF xác suất cộng nhân",
      "content": "#ds([Lần 1 rút bi từ hộp có \\${A+} bi đỏ và \\${B+} bi xanh (trả lại). Lần 2 rút tiếp. Gọi $R_1, R_2$ là sự kiện rút đỏ ở lần 1, lần 2. Xét các mệnh đề:\n  \\],\n  (\n    True([\\ $P(R_1) = \\\\dfrac{{A+]),\n    [{A+],\n    [B+],\n    True([\\ $P(R_2) = \\\\dfrac{{A+])\n  )\n)"
    },
    {
      "path": "Kho Câu/Khối 10/Xác Suất K10/Thực Tế/TL bảo hiểm và xác suất",
      "content": "#tl([Theo thống kê, xác suất một người trong độ tuổi \\${A+}0-\\${A+}5 gặp tai nạn giao thông trong năm là \\${B+}\\\\%$. Một công ty bảo hiểm có \\${G+}00 khách hàng trong nhóm tuổi này.\n  \\\\begin{enumerate}\n    \\\\item Xác suất có đúng $k$ người gặp tai nạn tuân theo phân phối nào?\n    \\\\item Tính kỳ vọng số người gặp tai nạn.\n  \\\\end{enumerate}\n  \\\\loigiai{\n    a) Phân phối nhị thức $B(n,p)$ với $n={G+}00$, $p=\\\\dfrac{{B+}}{100}$.\\\\\\\\\n    b) Kỳ vọng $E = np = {G+}00\\\\cdot\\\\dfrac{{B+}}{100} = {G+}\\\\cdot{B+}$ người.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 10/Hàm Số Bậc Hai/Thực Tế/TL quỹ đạo bóng ném",
      "content": "#tl([Một quả bóng được ném theo hướng ngang ở độ cao \\${A+} m. Cao độ của bóng theo thời gian là $h(t) = -{G+}t^2 + {B+}t + {A+}$ (m).\n  \\\\begin{enumerate}\n    \\\\item Tìm thời điểm bóng đạt độ cao cực đại.\n    \\\\item Tính độ cao cực đại.\n    \\\\item Khi nào bóng chạm đất ($h=0$)?\n  \\\\end{enumerate}\n  \\\\loigiai{\n    a) $t^* = \\\\dfrac{{B+}}{2{G+}}$ giây.\\\\\\\\\n    b) $h_{\\\\max} = h(t^*) = -{G+}\\\\left(\\\\dfrac{{B+}}{2{G+}}\\\\right)^2+{B+}\\\\cdot\\\\dfrac{{B+}}{2{G+}}+{A+}$.\\\\\\\\\n    c) Giải $-{G+}t^2+{B+}t+{A+}=0$.\n  }\n\\])"
    },
    {
      "path": "Kho Câu/Khối 10/Hàm Số Bậc Hai/Thực Tế/SA tối ưu diện tích hàng rào",
      "content": "#tln([Người ta dùng \\${A+}0 m hàng rào để quây một mảnh vườn hình chữ nhật, một cạnh là bờ tường (không cần hàng rào). Tìm kích thước để diện tích lớn nhất.\n  \\], [Chiều rộng \\${A+], show-boxes: false)"
    },
    {
      "path": "Kho Câu/Khối 10/Phương Trình/Thực Tế/TL phương trình bậc hai trong vật lý",
      "content": "#tln([Một vật rơi tự do từ độ cao $H = {A+}0$ m (lấy $g = 10$ m/s²). Phương trình: $s = \\\\dfrac{1}{2}gt^2$. Hỏi sau bao nhiêu giây vật chạm đất?\n  \\], [$t = \\\\sqrt{\\\\dfrac{2H], show-boxes: false)"
    }
  ]
};
if(typeof window !== 'undefined') window.typstBank = typstBank;
