# File 1: Chi Phí Ẩn - Vận Tốc Tối Ưu
html1 = r"""<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chuyên Đề: Chi Phí Ẩn - Vận Tốc Tối Ưu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        MathJax = {
            tex: {
                inlineMath: [['$', '$'], ['\\(', '\\)']],
                displayMath: [['$$', '$$'], ['\\[', '\\]']]
            },
            svg: { fontCache: 'global' }
        };
    </script>
    <script type="text/javascript" id="MathJax-script" async
      src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
    </script>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); }
        .glass-panel { background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(10px); }
        canvas { border-radius: 8px; border: 1px solid #e2e8f0; background: #fff; }
    </style>
</head>
<body class="text-gray-800 p-4 md:p-8 min-h-screen">

    <div class="max-w-6xl mx-auto space-y-6">
        <!-- Header -->
        <div class="text-center bg-gradient-to-r from-blue-600 to-indigo-700 text-white p-8 rounded-2xl shadow-xl">
            <h1 class="text-3xl md:text-4xl font-bold mb-3">🚗 Vận Tốc Tối Ưu: Chọn Nhanh Hiện Tại Hay Lợi Tương Lai?</h1>
            <p class="text-blue-100 text-lg">Bài toán cân bằng giữa "Tiền Đổ Xăng" và "Tiền Thuê Tài Xế"</p>
        </div>

        <!-- Khởi động nhẹ nhàng -->
        <div class="glass-panel p-8 rounded-2xl shadow-lg">
            <h2 class="text-xl font-bold mb-4 text-blue-800">1. Câu Chuyện Đời Thực (Khởi Động)</h2>
            <p class="mb-4">Hãy tưởng tượng bạn điều hành một đội xe tải giao hàng. Khi tài xế chạy trên cao tốc:</p>
            <ul class="list-disc pl-6 space-y-2 mb-6 text-gray-700">
                <li><b>Nếu chạy thật NHANH (ví dụ 100 km/h):</b> Hàng giao sớm, trả ít tiền giờ cho tài xế. <span class="text-red-600 font-bold">NHƯNG</span> xe "uống xăng như nước", chi phí nhiên liệu tăng vọt.</li>
                <li><b>Nếu chạy thật CHẬM (ví dụ 30 km/h):</b> Tiết kiệm tối đa xăng. <span class="text-red-600 font-bold">NHƯNG</span> chuyến đi kéo dài 10 tiếng, tiền lương trả tài xế theo giờ lại quá cao!</li>
            </ul>
            <p class="bg-blue-50 p-4 rounded-lg border-l-4 border-blue-500 font-semibold text-blue-900">
                👉 Nhiệm vụ của chúng ta: Tìm ra MỘT mức vận tốc "vừa đủ" để TỔNG HAI LOẠI TIỀN này gộp lại là NHỎ NHẤT! Đó chính là khái niệm "Vận tốc kinh tế".
            </p>
        </div>

        <!-- Khái quát thành toán học -->
        <div class="glass-panel p-8 rounded-2xl shadow-lg">
            <h2 class="text-xl font-bold mb-4 text-indigo-800">2. Mô Hình Hóa Bằng Toán Học</h2>
            
            <div class="grid md:grid-cols-2 gap-6 mb-6">
                <!-- Chi phí nhiên liệu -->
                <div class="bg-red-50 p-5 rounded-xl border-t-4 border-red-500 shadow-sm">
                    <h3 class="font-bold text-red-700 mb-2">🔥 Tiền Đổ Xăng (Tăng theo $v$)</h3>
                    <p class="text-sm mb-3">Năng lượng cản gió làm xe tiêu hao nhiên liệu tỷ lệ thuận với <b>bình phương vận tốc</b>.</p>
                    <div class="bg-white p-3 rounded text-center text-red-800 font-bold shadow-inner">
                        $C_1 = a \cdot v^2$
                    </div>
                </div>
                
                <!-- Chi phí thời gian -->
                <div class="bg-green-50 p-5 rounded-xl border-t-4 border-green-500 shadow-sm">
                    <h3 class="font-bold text-green-700 mb-2">⏱️ Tiền Thời Gian (Giảm theo $v$)</h3>
                    <p class="text-sm mb-3">Vận tốc càng lớn thì thời gian di chuyển càng ngắn (thời gian $t = S/v$).</p>
                    <div class="bg-white p-3 rounded text-center text-green-800 font-bold shadow-inner">
                        $C_2 = \frac{b}{v}$
                    </div>
                </div>
            </div>

            <div class="bg-indigo-50 p-6 rounded-xl border-l-4 border-indigo-600 text-center">
                <h3 class="font-bold text-indigo-900 mb-2">Tổng Chi Phí:</h3>
                <p class="text-xl mb-2">$C(v) = a \cdot v^2 + \frac{b}{v}$</p>
                <p class="text-sm text-gray-600">($a, b$ là các con số được tính gộp từ độ dài quãng đường, giá xăng, lương tài xế... của từng bài toán cụ thể)</p>
            </div>
            
            <div class="mt-6 flex flex-wrap gap-4 justify-center">
                <div class="bg-white p-4 rounded-lg shadow border border-gray-200 w-full md:w-5/12">
                    <h4 class="font-bold text-gray-800 border-b pb-2 mb-2">Cách 1: Dùng Đạo Hàm (Lớp 12)</h4>
                    <p class="text-sm mb-1">Tính đạo hàm $C'(v) = 2av - \frac{b}{v^2}$</p>
                    <p class="text-sm">Cho $C'(v) = 0 \Rightarrow v = \sqrt[3]{ \frac{b}{2a} }$</p>
                </div>
                <div class="bg-white p-4 rounded-lg shadow border border-gray-200 w-full md:w-5/12">
                    <h4 class="font-bold text-gray-800 border-b pb-2 mb-2">Cách 2: Dùng BĐT AM-GM (Lớp 10)</h4>
                    <p class="text-sm mb-1">Tách để khử mẫu: $av^2 + \frac{b}{2v} + \frac{b}{2v} \ge 3 \sqrt[3]{ av^2 \cdot \frac{b^2}{4v^2} }$</p>
                    <p class="text-sm">Dấu "=" khi: $av^2 = \frac{b}{2v} \Rightarrow v = \sqrt[3]{ \frac{b}{2a} }$</p>
                </div>
            </div>
        </div>

        <!-- Máy Tính & Đồ Thị -->
        <div class="glass-panel p-8 rounded-2xl shadow-lg">
            <h2 class="text-xl font-bold mb-6 text-blue-800">3. Trải Nghiệm Tương Tác & Đồ Thị</h2>
            <p class="mb-4 text-gray-700">Hãy thử tự điều chỉnh các hệ số để xem đồ thị sẽ biến đổi như thế nào và điểm cực tiểu "chạy" đi đâu nhé!</p>

            <div class="grid md:grid-cols-3 gap-6 mb-6">
                <div>
                    <label class="block text-sm font-bold mb-2 text-gray-700">Hệ số Xăng Xe ($a$)</label>
                    <input type="number" id="inputA" value="0.1" step="0.05" min="0.01" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500">
                    <p class="text-xs text-gray-500 mt-1">Lớn -> Tốn xăng nhanh</p>
                </div>
                <div>
                    <label class="block text-sm font-bold mb-2 text-gray-700">Hệ số Tiền Công ($b$)</label>
                    <input type="number" id="inputB" value="1000" step="100" min="1" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500">
                    <p class="text-xs text-gray-500 mt-1">Lớn -> Trả lương cao</p>
                </div>
                <div>
                    <label class="block text-sm font-bold mb-2 text-gray-700">Vận tốc tối đa cho phép (Giới hạn tốc độ)</label>
                    <input type="number" id="inputVmax" value="80" step="5" min="10" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-red-500">
                </div>
            </div>
            
            <button onclick="calculate()" class="w-full px-8 py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-lg transition-colors shadow">
                Vẽ Đồ Thị & Tính Toán
            </button>

            <!-- Results -->
            <div id="resultContainer" class="hidden mt-8">
                <div class="bg-indigo-50 p-6 rounded-xl border border-indigo-100 flex flex-col md:flex-row items-center gap-6 justify-between mb-8">
                    <div class="text-center w-full">
                        <p class="text-sm font-semibold text-gray-600 uppercase tracking-wider mb-1">Vận Tốc Tối Ưu</p>
                        <p id="vOptimal" class="text-3xl font-bold text-indigo-700"></p>
                    </div>
                    <div class="hidden md:block w-px h-16 bg-indigo-200"></div>
                    <div class="text-center w-full">
                        <p class="text-sm font-semibold text-gray-600 uppercase tracking-wider mb-1">Tổng Chi Phí Rẻ Nhất</p>
                        <p id="cMin" class="text-3xl font-bold text-green-600"></p>
                    </div>
                </div>

                <div class="mb-4">
                    <h3 class="font-bold text-gray-800 mb-2">Đồ Thị Chi Phí (Trực quan hóa sự đánh đổi 📉)</h3>
                    <div class="flex flex-wrap gap-4 text-sm mb-2 justify-center">
                        <span class="flex items-center"><span class="w-4 h-4 bg-red-500 rounded-full inline-block mr-2"></span> Xăng ($C_1$)</span>
                        <span class="flex items-center"><span class="w-4 h-4 bg-green-500 rounded-full inline-block mr-2"></span> Thời gian ($C_2$)</span>
                        <span class="flex items-center"><span class="w-4 h-4 bg-indigo-600 rounded-full inline-block mr-2"></span> Tổng Chi Phí ($C$)</span>
                    </div>
                    <canvas id="chartCanvas" width="800" height="400" class="w-full h-auto"></canvas>
                </div>
                
                <div id="warningBox" class="hidden bg-yellow-50 p-4 rounded-lg border-l-4 border-yellow-500 text-yellow-800">
                </div>
            </div>
        </div>

        <!-- Bài tập mẫu -->
        <div class="glass-panel p-8 rounded-2xl shadow-lg">
            <h2 class="text-xl font-bold mb-4 text-blue-800">4. Bài Tập Mẫu Làm Quen</h2>
            
            <div class="border border-gray-200 rounded-xl overflow-hidden hover:shadow-md transition-shadow">
                <div class="bg-gray-50 p-5 border-b border-gray-200">
                    <p class="font-bold text-gray-800">Đề bài:</p>
                    <p class="text-gray-700 mt-2">Một hãng chuyển phát giao hàng trên quãng đường 500 km. Tiền ứng với lượng nhiên liệu hao tốn là $0.02 v^2$ (nghìn đồng/km). Tiền trả tài xế là 100 (nghìn đồng/giờ). Vận tốc tối đa của xe là 80 km/h. Tìm vận tốc $v$ để chuyến đi tốn ít chi phí nhất.</p>
                </div>
                <div class="p-5">
                    <button onclick="toggleSol('sol1')" class="text-blue-600 font-bold hover:text-blue-800 text-sm flex items-center gap-1">
                        👉 Nhấn vào đây để xem lời giải từng bước
                    </button>
                    <div id="sol1" class="hidden mt-4 space-y-3 bg-blue-50 p-4 rounded-lg">
                        <p><b>Bước 1: Qui bài toán về một chuẩn thống nhất (Hàm Tổng)</b></p>
                        <p class="ml-4">Tiền xăng cho cả 500 km: $C_1 = 0.02 v^2 \times 500 = 10 v^2$</p>
                        <p class="ml-4">Thời gian đi: $t = \frac{500}{v}$ (giờ).</p>
                        <p class="ml-4">Tiền tài xế: $C_2 = 100 \times \frac{500}{v} = \frac{50000}{v}$</p>
                        <p class="ml-4 font-bold text-blue-800">Hàm tổng chi phí: $C(v) = 10 v^2 + \frac{50000}{v}$</p>
                        
                        <p class="mt-4"><b>Bước 2: Tìm "đáy" của hàm số (Cực tiểu)</b></p>
                        <p class="ml-4">Dùng đạo hàm $C'(v) = 20v - \frac{50000}{v^2} = 0 \Leftrightarrow 20v^3 = 50000 \Leftrightarrow v^3 = 2500$</p>
                        <p class="ml-4">$\Rightarrow v = \sqrt[3]{2500} \approx 13.57$ km/h</p>
                        
                        <p class="mt-4"><b>Bước 3: Tỉnh táo kiểm tra thực tế (Các cái bẫy)</b></p>
                        <p class="ml-4">Vận tốc $13.57$ có nhỏ hơn tốc độ tối đa 80km/h không? Có! Vậy ta chọn luôn vận tốc này.</p>
                        <p class="mt-2 text-sm italic text-gray-500">*Ghi chú: Xe tải giao hàng mà đi 13.5 km/h là đi như xe đạp điện! Trong thực tế người ta sẽ xét thêm chi phí cơ hội của việc giao trễ hàng (Mất khách), nên hàm chi phí $b$ sẽ lớn hơn rất nhiều.*</p>
                    </div>
                </div>
            </div>
            
        </div>
        
    </div>

    <script>
        function toggleSol(id) {
            const el = document.getElementById(id);
            el.classList.toggle('hidden');
        }

        function calculate() {
            const a = parseFloat(document.getElementById('inputA').value);
            const b = parseFloat(document.getElementById('inputB').value);
            const vmax = parseFloat(document.getElementById('inputVmax').value);

            if (a <= 0 || b <= 0 || vmax <= 0) return alert('Nhập số lớn hơn 0!');

            // v_0 = cuberoot(b / 2a)
            const v0_theory = Math.pow(b / (2 * a), 1/3);
            
            let v0 = v0_theory;
            let warning = '';
            
            if (v0_theory > vmax) {
                v0 = vmax;
                warning = `⚠️ <b>Chú ý:</b> Theo toán học, chạy với tốc độ <b>${v0_theory.toFixed(1)} km/h</b> mới rẻ nhất. Nhưng vì tốc độ giới hạn là <b>${vmax} km/h</b>, nên ta buộc phải chọn kịch bản cực trị biên: <b>Chạy tối đa ga ${vmax} km/h</b>!`;
                document.getElementById('warningBox').innerHTML = warning;
                document.getElementById('warningBox').classList.remove('hidden');
            } else {
                document.getElementById('warningBox').classList.add('hidden');
            }

            const cMin = a * v0 * v0 + b / v0;

            document.getElementById('vOptimal').textContent = v0.toFixed(2) + " km/h";
            document.getElementById('cMin').textContent = cMin.toFixed(2) + " (đơn vị tiền)";
            
            drawChart(a, b, v0, vmax);
            document.getElementById('resultContainer').classList.remove('hidden');
        }

        function drawChart(a, b, v0, vmax) {
            const canvas = document.getElementById('chartCanvas');
            const ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            
            const w = canvas.width, h = canvas.height;
            const padX = 60, padY = 40;
            
            // Tìm Max của V để vẽ
            const v_plot_max = Math.max(vmax * 1.2, v0 * 2);
            
            const step_v = v_plot_max / 100;
            let max_C = 0;
            let min_C = Infinity;
            
            for(let v = step_v; v <= v_plot_max; v += step_v) {
                let C = a*v*v + b/v;
                if(C < min_C) min_C = C;
                // Giới hạn max C để biểu đồ không thụt hẳn vì 1/v chót vót ở đầu
                if(v > v_plot_max * 0.1 && C > max_C) max_C = C;
            }
            max_C = Math.max(max_C, (a*v_plot_max*v_plot_max + b/v_plot_max));
            
            const scaleX = (w - 2*padX) / v_plot_max;
            const scaleY = (h - 2*padY) / (max_C * 1.1);
            
            const toX = (v) => padX + v * scaleX;
            const toY = (C) => h - padY - C * scaleY;
            
            // Vẽ lưới
            ctx.beginPath(); ctx.strokeStyle = '#e2e8f0'; ctx.lineWidth = 1;
            for(let i=1; i<=10; i++) {
                ctx.moveTo(padX, toY(max_C * 1.1 * i/10));
                ctx.lineTo(w - padX, toY(max_C * 1.1 * i/10));
                ctx.moveTo(toX(v_plot_max * i/10), h - padY);
                ctx.lineTo(toX(v_plot_max * i/10), padY);
            }
            ctx.stroke();

            // Vẽ Trục
            ctx.beginPath(); ctx.strokeStyle = '#333'; ctx.lineWidth = 2;
            ctx.moveTo(padX, padY); ctx.lineTo(padX, h - padY); ctx.lineTo(w - padX, h - padY);
            ctx.stroke();
            
            // Vẽ 3 đường
            ctx.lineWidth = 3;
            ctx.lineJoin = 'round';
            
            ctx.beginPath(); ctx.strokeStyle = '#ef4444'; // Xăng C1
            for(let v = step_v; v <= v_plot_max; v += step_v) ctx.lineTo(toX(v), toY(a*v*v));
            ctx.stroke();
            
            ctx.beginPath(); ctx.strokeStyle = '#22c55e'; // Thuê C2
            for(let v = step_v; v <= v_plot_max; v += step_v) ctx.lineTo(toX(v), toY(b/v));
            ctx.stroke();
            
            ctx.beginPath(); ctx.strokeStyle = '#4f46e5'; // Tổng C
            for(let v = step_v; v <= v_plot_max; v += step_v) {
                let C = a*v*v + b/v;
                if (C <= max_C * 1.2) ctx.lineTo(toX(v), toY(C));
            }
            ctx.stroke();
            
            // Highlight V tối ưu
            ctx.beginPath(); ctx.setLineDash([5, 5]); ctx.strokeStyle = '#64748b'; ctx.lineWidth = 2;
            ctx.moveTo(toX(v0), h - padY); ctx.lineTo(toX(v0), toY(a*v0*v0 + b/v0));
            ctx.stroke(); ctx.setLineDash([]);
            
            ctx.beginPath(); ctx.fillStyle = '#4f46e5';
            ctx.arc(toX(v0), toY(a*v0*v0 + b/v0), 6, 0, Math.PI*2);
            ctx.fill();
            
            ctx.fillStyle = '#333'; ctx.font = '14px Arial';
            ctx.fillText('v (km/h)', w - padX, h - padY + 20);
            ctx.fillText('Chi phí', padX - 45, padY - 10);
            ctx.fillText(v0.toFixed(1), toX(v0) - 10, h - padY + 20);
        }
        
        window.onload = () => calculate();
    </script>
</body>
</html>
"""

# File 2: Tối Ưu Kinh Tế Đa Điều Kiện
html2 = r"""<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chuyên Đề: Hàm Phân Đoạn & Thuế Lũy Tiến</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        MathJax = {
            tex: {
                inlineMath: [['$', '$'], ['\\(', '\\)']],
                displayMath: [['$$', '$$'], ['\\[', '\\]']]
            },
            svg: { fontCache: 'global' }
        };
    </script>
    <script type="text/javascript" id="MathJax-script" async
      src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
    </script>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f0fdfa; }
        .glass { background: white; border-radius: 1rem; box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1); }
    </style>
</head>
<body class="text-gray-800 p-4 md:p-8 min-h-screen">
    <div class="max-w-6xl mx-auto space-y-6">
        
        <div class="bg-teal-700 text-white rounded-2xl p-8 shadow-lg text-center">
            <h1 class="text-3xl font-bold mb-2">💸 Tiền Thuê Nhà Bậc Thang & Thuế Lũy Tiến</h1>
            <p class="text-teal-100">Hiểu tường tận sự "Biến Hình" của các quy luật kinh tế tại những Điểm Gãy</p>
        </div>

        <div class="glass p-8">
            <h2 class="text-2xl font-bold mb-4 text-teal-800">1. Đời Không Như Là Đường Thẳng (Mở Màn)</h2>
            <p class="mb-4 text-lg">Hồi học THCS, bạn mua 1 cây bút giá 5k, 10 cây giá 50k. Đời trôi chảy trên một đường thẳng $y = 5000x$. Nhẹ nhàng và êm ả.</p>
            <p class="font-bold text-red-600 mb-2">Nhưng Kinh Tế Xã Hội thì "Khó Ở" hơn thế:</p>
            <ul class="list-disc pl-6 space-y-2 mb-6">
                <li>Đi taxi nghìn mét đầu 20k, các mét sau 15k... đi quá 15km lại giảm 10% để khuyến khích. Giả sử đi 14.9 km có khi ĐẮT HƠN đi 15.1 km!</li>
                <li>Quán lẩu buffet: Nhóm 2 người giá 200k/người. Đi 5 người thì chỉ còn 160k/người! Khách càng đông, tiền cưa đầu người càng rẻ.</li>
                <li>Bạn làm lương 10 triệu không sao. Lương 20 triệu nhà nước bắt đầu thu Thuế thu nhập cá nhân!</li>
            </ul>
            <p class="bg-yellow-50 p-4 rounded border-l-4 border-yellow-500">Người ta gọi những kiểu "Đổi luật giữa dòng" như vậy là <b>Hàm Số Phân Đoạn</b>. Đồ thị của chúng thường có những góc <b>cạnh sắc nhọn (điểm gãy)</b>.</p>
        </div>

        <div class="glass p-8">
            <h2 class="text-2xl font-bold mb-4 text-teal-800">2. Thuế Lũy Tiến: Bí quyết không bị "Lừa"</h2>
            <p class="mb-2">Một sai lầm "chí mạng" của 90% học sinh khi làm bài toán THUẾ LŨY TIẾN:</p>
            <div class="flex flex-col md:flex-row gap-6 mb-6">
                <div class="flex-1 bg-red-50 p-4 rounded-lg border-2 border-red-200">
                    <p class="text-red-700 font-bold mb-2">❌ Hiểu Sai:</p>
                    <p class="text-sm">"Lương dưới 10tr không tính thuế. Lương > 10tr đóng thuế 10%."<br><br> Bạn kiếm <b>9tr900k</b> -> Bạn ẵm trọn <b>9tr900k</b>.<br>Tháng sau bạn được sếp tăng lương lên <b>10tr100k</b> -> Bị đánh thuế 10% -> Lấy $10.1 \times 10\% = 1.01$ triệu. Mất đứt 1 triệu, đem về nhà có <b>9tr090k</b>!! 😱<br><br><i>Trời ơi! Làm nhiều tiền hơn lại mang về ít đi! Đâu ai chịu!</i></p>
                </div>
                <div class="flex-1 bg-green-50 p-4 rounded-lg border-2 border-green-200">
                    <p class="text-green-700 font-bold mb-2">✅ Sự Thật (Hiểu Đúng):</p>
                    <p class="text-sm">Để ngăn cản sự bất công trên, Thuế Lũy Tiến chỉ đánh vào <b>PHẦN VƯỢT QUÁ</b>.<br><br>Lương <b>10tr100k</b>. Phân ra: 10tr nằm trong mốc an toàn. Chỉ đóng thuế cho 100k vượt múc kia!<br> Thuế = $100\text{k} \times 10\% = 10\text{k}$.<br>Đem về <b>10,090,000</b> (vẫn cao hơn ban đầu nha). Trái đất vẫn hòa bình.</p>
                </div>
            </div>
            
            <p class="font-bold mt-4 mb-2">Biểu diễn mô hình toán:</p>
            <div class="bg-gray-100 p-4 rounded-lg overflow-x-auto text-center font-mono">
                $$T(x) = \begin{cases} 0 & \text{nếu } x \le 10 \\ 0.1 \times (x - 10) & \text{nếu } x > 10 \end{cases}$$
            </div>
        </div>

        <div class="glass p-8">
            <h2 class="text-2xl font-bold mb-4 text-teal-800">3. Áp dụng: Bài Toán Doanh Thu "Bẫy Quy Mô"</h2>
            <div class="bg-gray-50 border border-gray-200 p-6 rounded-lg mb-6">
                <p class="font-bold mb-2">Câu Hỏi Mẫu:</p>
                <p>Công ty cho thuê xe du lịch 30 chỗ. Nếu đi 15 khách, giá 400k/người. Thêm 1 khách, giá vé CỦA CẢ ĐOÀN sẽ giảm 10k/người (kích cầu). Nên từ chối nhận thêm khách từ mốc nào để công ty không bị lỗ, biết càng đông tiền thu về càng cao TRƯỚC khi chạm "đỉnh" rồi lại tụt xuống?</p>
                
                <h4 class="font-bold mt-4 mb-2 text-indigo-700">Tư Duy Giải Tuyệt Đỉnh:</h4>
                <ol class="list-decimal pl-5 space-y-2 text-gray-800">
                    <li>Gọi $x$ là số khách tăng thêm. Tổng số khách: $15 + x$. Tiền mỗi người: $(400 - 10x)$.</li>
                    <li>
                        Doanh thu $R(x) = (15 + x)(400 - 10x) = 6000 + 250x - 10x^2$.<br>
                        Nhìn vào hàm bậc hai $-10x^2$, đây là đồ thị "Úp Mâm". Lên hương rạng rỡ rồi lao dốc!
                    </li>
                    <li>
                        Điểm cực đại của Parabol (học từ cấp 2) là ở $-\frac{b}{2a} = \frac{-250}{-20} = 12.5$.
                        Nghĩa là ở mức tăng khoảng 12 hoặc 13 người (tổng 27, 28 khách), công ty sẽ hốt nhiều tiền nhất. Nhận thêm khách thứ 30 sẽ mệt thân mà số tiền cuối ngày gom lại còn BỊ ÍT ĐI!
                    </li>
                </ol>
            </div>
        </div>
        
    </div>
</body>
</html>
"""

# File 3: Tăng Giảm Liên Tục & Cấp Số Nhân
html3 = r"""<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chuyên Đề: Tăng Giảm Cấp Số Nhân</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        MathJax = { tex: { inlineMath: [['$', '$'], ['\\(', '\\)']], displayMath: [['$$', '$$']] } };
    </script>
    <script type="text/javascript" id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
    <style>
        body { background-color: #fdf4ff; font-family: 'Segoe UI', sans-serif; }
        .card { background: white; border-radius: 12px; box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1); padding: 2rem; margin-bottom: 2rem;}
    </style>
</head>
<body class="p-4 md:p-8 text-gray-800 min-h-screen">
    <div class="max-w-4xl mx-auto">
        
        <div class="bg-gradient-to-r from-pink-500 to-purple-600 text-white rounded-2xl p-8 mb-8 text-center shadow-lg transform transition hover:scale-[1.01]">
            <h1 class="text-3xl font-extrabold mb-2">💘 Chuyện Tình Yêu & Sự Lừa Dối Của Phần Trăm</h1>
            <p class="text-pink-100">Bí mật sau những pha tăng giảm "kép" tạo thành Cấp Số Nhân</p>
        </div>

        <div class="card border-t-8 border-pink-500">
            <h2 class="text-2xl font-bold mb-4 text-pink-700">1. Cú Lừa Kinh Điển (Bài Toán "Ngây Thơ")</h2>
            
            <p class="mb-4">Bạn vừa lấy được điểm 10 toán. Mẹ thưởng cho bạn. Mẹ bảo: <br>
            "Hôm nay lương bổng kinh tế khó khăn, tiền túi mẹ GIẢM ĐI 20%. NHƯNG vì con học giỏi, trong số tiền còn lại, mẹ TĂNG THÊM khoản dự Phòng Lên 25% cho con. Con thấy mẹ hào phóng chưa?".</p>
            
            <div class="bg-gray-100 p-4 rounded mb-4">
                <p class="font-bold text-red-600">Con vội nhẩm trong đầu: $-20\% + 25\% = +5\%$ (Ố ồ! Mình lời 5%).</p>
            </div>
            
            <p class="text-lg font-bold">Thực tế phũ phàng:</p>
            <ul class="list-disc pl-5 mb-4 space-y-2">
                <li>Giả sử quỹ ban đầu là 100k.</li>
                <li>Qũy Giảm 20% $\Rightarrow$ Mẹ lột đi 20k. Quỹ chỉ còn 80k.</li>
                <li>Bây giờ lấy 80k đó TĂNG 25%. $80 \times 25\% = 20k$ sinh sôi nảy nở.</li>
                <li>Tổng kết: Lấy 80k gốc + 20k đẻ thêm = <b>Tròn trĩnh 100k</b>.</li>
            </ul>
            <p class="bg-pink-100 font-bold p-3 rounded text-pink-900 border-l-4 border-pink-500">
                HUỀ VỐN! Bạn chẳng lời được đồng nào! $ (-20\%) $ đứng cạnh $ (+25\%) $ lại bằng KHÔNG (0%). 
                Không được tin vào việc cộng trừ phần trăm theo phản xạ!
            </p>
        </div>

        <div class="card border-t-8 border-purple-500">
            <h2 class="text-2xl font-bold mb-4 text-purple-700">2. Phương Pháp "Công Bội" Sinh Tồn</h2>
            <p class="mb-4">Khi đại lượng chạy qua liên tiếp 2 đợt nhồi nhét, ta PHẢI dùng phép NHÂN (hệ số), thay vì Lũy Kế phép cộng.</p>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-center">
                <div class="border p-4 rounded-lg">
                    <p class="text-sm text-gray-500 uppercase">Hệ Số Giảm 20%</p>
                    <p class="text-xl font-bold text-red-600">$(100\% - 20\%) = 0.8$</p>
                </div>
                <div class="border p-4 rounded-lg">
                    <p class="text-sm text-gray-500 uppercase">Hệ Số Tăng 25%</p>
                    <p class="text-xl font-bold text-green-600">$(100\% + 25\%) = 1.25$</p>
                </div>
            </div>
            
            <div class="mt-4 bg-purple-50 p-4 rounded text-center shadow-inner">
                <p class="text-gray-600">Sức sát thương tổng hợp qua $1$ chu kỳ:</p>
                <p class="text-2xl font-black text-purple-800">$q = 0.8 \times 1.25 = 1.0$ (Tức là 100% nguyên si)</p>
            </div>
        </div>

        <div class="card border-t-8 border-indigo-500">
            <h2 class="text-2xl font-bold mb-4 text-indigo-700">3. Áp Dụng: Chuyện Nam & Thư 💔</h2>
            
            <div class="mb-4 text-gray-800 leading-relaxed italic border-l-4 p-4 bg-indigo-50 border-indigo-400">
                Lúc mới chia tay, Nam dành 100 điểm tình cảm cho Thư. Mỗi ngày trôi qua quên đi 30%. Nhưng vì xạo sự vẫn tò mò soi Story fb Thư vào cuối ngày, tình cảm lại bị "thổi lên" 12% dựa trên số điểm ít ỏi còn lại. Dưới 10 điểm thì dứt tình. Chừng nào thoát ải?
            </div>
            
            <p class="font-bold mb-2">Bước 1: Quy luật rụng rớt qua 1 ngày đêm (1 chu kỳ)</p>
            <p class="mb-2">Hệ số tàn lụi: $q = (1 - 0.30) \times (1 + 0.12) = 0.7 \times 1.12 = 0.784$</p>
            <p class="mb-4">Mỗi ngày tình cảm bị co rút còn đúng $78.4\%$ so với hôm qua.</p>
            
            <p class="font-bold mb-2">Bước 2: Sử dụng vũ khí Cấp Số Nhân</p>
            <p class="mb-2">Sau $n$ ngày, điểm tình cảm còn lại: $u_n = 100 \times (0.784)^n$</p>
            <p class="mb-4">Bắt buộc Tịt Mù $(< 10)$: $100 \times (0.784)^n < 10 \Rightarrow (0.784)^n < 0.1$.</p>
            
            <p class="font-bold text-red-600">⚠️ Bẫy Logarit: Cẩn Thận "Quay Xe"</p>
            <div class="bg-gray-100 p-4 rounded-lg font-mono text-sm mb-4">
                Khi cơ số q = 0.784 (Nhỏ hơn 1), hành động bớt hàm Logarit MANG TÍNH LẬT ÚP sự việc. Dấu phải quay ngược lại!<br><br>
                n > log_{0.784}(0.1) 
            </div>
            
            <p>Bấm máy tính ra $n > 9.47$. Vì chọn ngày nguyên dương tròn trịa, n = 10.</p>
            <p class="mt-4 font-bold text-center text-xl text-indigo-800">Đúng 10 ngày sau, Nam sẽ bắt đầu cuộc đời mới! 🎉</p>
        </div>

    </div>
</body>
</html>
"""

with open("1-chiphi-vantoc.html", "w", encoding="utf-8") as f:
    f.write(html1)
with open("2-toiuu-kinhte.html", "w", encoding="utf-8") as f:
    f.write(html2)
with open("3-tanggiam-lientuc.html", "w", encoding="utf-8") as f:
    f.write(html3)
