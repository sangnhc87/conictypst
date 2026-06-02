import React, { useEffect, useMemo, useState } from 'react'
import { BlockMath, InlineMath } from 'react-katex'
import 'katex/dist/katex.min.css'

const TAB_META = [
    { id: 'tree136', label: 'Sơ đồ cây 1-3-6', short: '1-3-6', accent: 'emerald' },
    { id: 'tree248', label: 'Sơ đồ cây 2-4-8', short: '2-4-8', accent: 'violet' },
    { id: 'duel', label: 'Xác suất đối kháng', short: 'Đối kháng', accent: 'amber' },
]

const TREE136_PRESETS = [
    {
        id: 'customer-buy',
        title: 'Khách hàng: sẽ mua / cân nhắc / không mua',
        note: 'Một gốc tách 3 nhánh, rồi mỗi nhánh lại tách thành mua hoặc không mua. Đây là đúng lõi 1-3-6 của xác suất toàn phần và Bayes.',
        problem: 'Một công ty phỏng vấn 200 khách hàng trước khi ra sản phẩm mới. Kết quả: 88 người trả lời "sẽ mua" (nhóm A), 60 người "sẽ cân nhắc" (nhóm B), 52 người "không mua" (nhóm C). Theo dõi thực tế: 80% nhóm A thực sự mua, 30% nhóm C thực sự mua. Biết 65% tổng số người phỏng vấn đã thực sự mua.',
        question: 'Tìm tỉ lệ thực sự mua của nhóm B. Sau đó, biết một khách hàng đã thực sự mua, xác suất để khách đó trước đây trả lời "sẽ cân nhắc" là bao nhiêu?',
        successLabel: 'Thực sự mua',
        failureLabel: 'Không mua',
        knownLeaf: 'success',
        targetId: 'B',
        sources: [
            { id: 'A', label: 'Sẽ mua', weight: 44, successRate: 80 },
            { id: 'B', label: 'Cân nhắc', weight: 30, successRate: 73 },
            { id: 'C', label: 'Không mua', weight: 26, successRate: 30 },
        ],
    },
    {
        id: 'factory-defect',
        title: 'Bóng đèn: 3 phân xưởng A/B/C, tỉ lệ phế phẩm',
        note: 'Một trong những mẫu đẹp nhất của cây 1-3-6: 3 nguồn gốc A, B, C rồi mỗi nguồn tách thành phế phẩm hoặc đạt chuẩn.',
        problem: 'Một nhà máy sản xuất bóng đèn gồm 3 phân xưởng A, B, C với tỉ lệ sản lượng lần lượt là 50%, 30%, 20%. Tỉ lệ phế phẩm (bóng hỏng) của mỗi phân xưởng: A là 2%, B là 3%, C là 4%.',
        question: 'Lấy ngẫu nhiên một bóng đèn từ lô sản xuất và phát hiện bóng đó bị hỏng. Tính xác suất để bóng đèn hỏng đó do phân xưởng B sản xuất.',
        successLabel: 'Phế phẩm (hỏng)',
        failureLabel: 'Đạt chuẩn',
        knownLeaf: 'success',
        targetId: 'B',
        sources: [
            { id: 'A', label: 'Phân xưởng A', weight: 50, successRate: 2 },
            { id: 'B', label: 'Phân xưởng B', weight: 30, successRate: 3 },
            { id: 'C', label: 'Phân xưởng C', weight: 20, successRate: 4 },
        ],
    },
    {
        id: 'factory-unknown',
        title: 'Tìm x từ tỉ lệ phế phẩm chung rồi dùng Bayes',
        note: 'Bài 2 bước: dùng xác suất toàn phần để tìm P(D|PX2) = x%, rồi mới truy ngược bằng Bayes.',
        problem: 'Nhà máy có 3 phân xưởng I, II, III sản xuất lần lượt 50%, 30%, 20% tổng sản phẩm. Tỉ lệ phế phẩm của phân xưởng I là 2%, của phân xưởng III là 3%. Biết tỉ lệ phế phẩm chung của nhà máy là 3,1%.',
        question: 'Tìm tỉ lệ phế phẩm của phân xưởng II. Sau đó, chọn ngẫu nhiên 1 sản phẩm bị phế phẩm, tính xác suất sản phẩm đó do phân xưởng II sản xuất.',
        successLabel: 'Phế phẩm',
        failureLabel: 'Đạt chuẩn',
        knownLeaf: 'success',
        targetId: 'PX2',
        sources: [
            { id: 'PX1', label: 'Phân xưởng I', weight: 50, successRate: 2 },
            { id: 'PX2', label: 'Phân xưởng II', weight: 30, successRate: 5 },
            { id: 'PX3', label: 'Phân xưởng III', weight: 20, successRate: 3 },
        ],
    },
    {
        id: 'urn-bayes',
        title: '3 hộp bi: bốc được 2 bi cùng màu, truy ngược hộp nào',
        note: 'Vẫn là cây 1-3-6, chỉ khác ý nghĩa tầng 2: thay vì hỏng/đạt, dùng cùng màu/không cùng màu.',
        problem: 'Có 3 hộp bi (mỗi hộp chứa bi đỏ và bi xanh). Chọn ngẫu nhiên một hộp theo tỉ lệ 5:3:2 (Hộp I : Hộp II : Hộp III). Từ hộp được chọn, bốc ngẫu nhiên 2 bi cùng lúc. Xác suất bốc được 2 bi cùng màu: Hộp I ≈ 43%, Hộp II ≈ 52%, Hộp III ≈ 18%.',
        question: 'Biết rằng 2 bi bốc được cùng màu, tính xác suất chúng đến từ Hộp II.',
        successLabel: 'Bốc được cùng màu',
        failureLabel: 'Không cùng màu',
        knownLeaf: 'success',
        targetId: 'H2',
        sources: [
            { id: 'H1', label: 'Hộp I', weight: 5, successRate: 43 },
            { id: 'H2', label: 'Hộp II', weight: 3, successRate: 52 },
            { id: 'H3', label: 'Hộp III', weight: 2, successRate: 18 },
        ],
    },
    {
        id: 'transfer-bi',
        title: 'Chuyển 2 bi từ Hộp I sang Hộp II rồi rút, truy ngược',
        note: 'Dạng bài 2 giai đoạn: chuyển ngẫu nhiên 2 bi (3 trường hợp) rồi rút 1 bi từ hộp nhận. Trọng số tính qua tổ hợp C(n,k).',
        problem: 'Hộp I có 5 bi trắng, 7 bi đỏ. Hộp II có 10 bi trắng, 15 bi đỏ. Lấy ngẫu nhiên 2 bi từ Hộp I chuyển sang Hộp II. Sau đó rút ngẫu nhiên 1 bi từ Hộp II và quan sát được bi trắng. Số cách chuyển: 2 trắng = C(5,2)=10 cách, khác màu = C(5,1)·C(7,1)=35 cách, 2 đỏ = C(7,2)=21 cách.',
        question: 'Biết rằng bi rút từ Hộp II là bi trắng, tính xác suất để 2 bi đã chuyển từ Hộp I sang là khác màu (1 trắng + 1 đỏ).',
        successLabel: 'Rút được bi trắng',
        failureLabel: 'Rút được bi đỏ',
        knownLeaf: 'success',
        targetId: 'KM',
        sources: [
            { id: 'TT', label: '2 bi trắng', weight: 10, successRate: 44 },
            { id: 'KM', label: 'Khác màu', weight: 35, successRate: 41 },
            { id: 'DD', label: '2 bi đỏ', weight: 21, successRate: 37 },
        ],
    },
]

const TREE248_PRESETS = [
    {
        id: 'insurance-people',
        title: 'Bảo hiểm 20.000 KH: giới tính, tuổi, hôn nhân',
        note: 'Đúng tinh thần cây 2-4-8: 3 tiêu chí nhị phân xếp chồng, tạo ra 8 lá. Số liệu từ bài toán thống kê điển hình SGK.',
        problem: 'Công ty bảo hiểm thống kê 20.000 khách hàng theo 3 tiêu chí: Giới tính (Nam/Nữ), Độ tuổi (Trẻ/Già), Hôn nhân (Đã lập GĐ/Độc thân). Biết: có 9.600 nam; 6.300 người trẻ; 13.800 đã lập GĐ; 2.700 nam trẻ; 6.400 nam đã lập GĐ; 2.900 người trẻ đã lập GĐ; và 1.100 nam trẻ đã lập GĐ.',
        question: 'Chọn ngẫu nhiên 1 khách hàng. Tính xác suất để khách đó là nam, biết khách đó trẻ và đã lập gia đình.',
        stages: [
            { title: 'Giới tính', left: 'Nam', right: 'Nữ' },
            { title: 'Độ tuổi', left: 'Trẻ', right: 'Già' },
            { title: 'Hôn nhân', left: 'Đã lập GĐ', right: 'Độc thân' },
        ],
        leaves: {
            LLL: 1100,
            LLR: 1600,
            LRL: 5300,
            LRR: 1600,
            RLL: 1800,
            RLR: 500,
            RRL: 7400,
            RRR: 700,
        },
        eventFilter: { s1: 'L', s2: '*', s3: '*' },
        conditionFilter: { s1: '*', s2: 'L', s3: 'L' },
    },
    {
        id: 'school-survey',
        title: 'Khảo sát học sinh: khối, giới tính, kết quả học tập',
        note: 'Cây 2-4-8 không chỉ cho xác suất Bayes mà còn rất mạnh cho thống kê nhiều tiêu chí song song.',
        problem: 'Khảo sát 206 học sinh của một trường THPT theo 3 tiêu chí: Khối (12/11), Giới tính (Nam/Nữ), Kết quả (Đạt chuẩn/Chưa đạt). Số liệu được ghi vào sơ đồ cây (nhập trong bảng bên trái).',
        question: 'Chọn ngẫu nhiên 1 học sinh. Tính xác suất để học sinh đó đạt chuẩn, biết học sinh đó là khối 12.',
        stages: [
            { title: 'Khối', left: 'Khối 12', right: 'Khối 11' },
            { title: 'Giới tính', left: 'Nam', right: 'Nữ' },
            { title: 'Kết quả', left: 'Đạt chuẩn', right: 'Chưa đạt' },
        ],
        leaves: {
            LLL: 42,
            LLR: 10,
            LRL: 36,
            LRR: 12,
            RLL: 35,
            RLR: 13,
            RRL: 40,
            RRR: 18,
        },
        eventFilter: { s1: '*', s2: '*', s3: 'L' },
        conditionFilter: { s1: 'L', s2: '*', s3: '*' },
    },
    {
        id: 'hospital-patients',
        title: 'Bệnh viện: giới tính, độ tuổi, mức độ bệnh',
        note: 'Preset nhẹ nhàng để tập đọc cây 2-4-8 theo ngữ cảnh y tế. Tất cả 8 lá đều có ý nghĩa thực tế.',
        problem: 'Bệnh viện thống kê 500 bệnh nhân nhập viện trong tháng theo: Giới tính (Nam/Nữ), Độ tuổi (Dưới 40/Từ 40 trở lên), Bệnh (Nặng/Nhẹ). Số liệu theo 8 nhóm: Nam-Trẻ-Nặng:24, Nam-Trẻ-Nhẹ:60, Nam-Già-Nặng:55, Nam-Già-Nhẹ:101, Nữ-Trẻ-Nặng:18, Nữ-Trẻ-Nhẹ:72, Nữ-Già-Nặng:48, Nữ-Già-Nhẹ:122.',
        question: 'Chọn ngẫu nhiên 1 bệnh nhân. Tính xác suất để bệnh nhân đó bệnh nặng, biết bệnh nhân đó từ 40 tuổi trở lên.',
        stages: [
            { title: 'Giới tính', left: 'Nam', right: 'Nữ' },
            { title: 'Độ tuổi', left: 'Dưới 40', right: 'Từ 40 tuổi' },
            { title: 'Bệnh', left: 'Nặng', right: 'Nhẹ' },
        ],
        leaves: {
            LLL: 24,
            LLR: 60,
            LRL: 55,
            LRR: 101,
            RLL: 18,
            RLR: 72,
            RRL: 48,
            RRR: 122,
        },
        eventFilter: { s1: '*', s2: '*', s3: 'L' },
        conditionFilter: { s1: '*', s2: 'R', s3: '*' },
    },
    {
        id: 'bank-customers',
        title: 'Khách ngân hàng: kỳ hạn, số dư, thẻ tín dụng',
        note: 'Ngữ cảnh tài chính quen thuộc giúp học sinh tự đặt câu hỏi. Có thể dùng để giải thích P(A|B) trong phân tích kinh doanh.',
        problem: 'Ngân hàng phân tích 1.200 khách theo: Kỳ hạn (Ngắn/Dài), Số dư (Cao/Thấp), Thẻ tín dụng (Có/Không). Dữ liệu 8 nhóm: Ngắn-Cao-Có:95, Ngắn-Cao-Không:45, Ngắn-Thấp-Có:120, Ngắn-Thấp-Không:340, Dài-Cao-Có:110, Dài-Cao-Không:90, Dài-Thấp-Có:180, Dài-Thấp-Không:220.',
        question: 'Chọn ngẫu nhiên 1 khách. Tính xác suất khách đó có thẻ tín dụng, biết số dư tài khoản của khách đó ở mức cao.',
        stages: [
            { title: 'Kỳ hạn', left: 'Ngắn hạn', right: 'Dài hạn' },
            { title: 'Số dư', left: 'Cao', right: 'Thấp' },
            { title: 'Thẻ TC', left: 'Có thẻ', right: 'Không thẻ' },
        ],
        leaves: {
            LLL: 95,
            LLR: 45,
            LRL: 120,
            LRR: 340,
            RLL: 110,
            RLR: 90,
            RRL: 180,
            RRR: 220,
        },
        eventFilter: { s1: '*', s2: '*', s3: 'L' },
        conditionFilter: { s1: '*', s2: 'L', s3: '*' },
    },
]

const DUEL_PRESETS = [
    {
        id: 'dice-sum',
        title: '2 xúc xắc 6 mặt: so tổng điểm',
        note: 'Bài đối kháng kinh điển: tính cửa hòa rồi chia đôi phần còn lại nhờ đối xứng.',
        problem: 'Hai bạn A và B mỗi người tung 2 xúc xắc 6 mặt, tính tổng điểm hai xúc xắc. Người có tổng điểm lớn hơn thắng; nếu bằng nhau thì hòa và tung lại. Phân bố tổng (số cách): 2→1, 3→2, 4→3, 5→4, 6→5, 7→6, 8→5, 9→4, 10→3, 11→2, 12→1.',
        question: 'Tính xác suất để bạn A thắng ngay trong lượt đầu tiên (không hòa).',
        scoreLabel: 'Tổng điểm',
        playerA: 'Bạn A',
        playerB: 'Bạn B',
        outcomes: [
            { label: '2', weight: 1 },
            { label: '3', weight: 2 },
            { label: '4', weight: 3 },
            { label: '5', weight: 4 },
            { label: '6', weight: 5 },
            { label: '7', weight: 6 },
            { label: '8', weight: 5 },
            { label: '9', weight: 4 },
            { label: '10', weight: 3 },
            { label: '11', weight: 2 },
            { label: '12', weight: 1 },
        ],
    },
    {
        id: 'cards-diff',
        title: '5 thẻ đánh số 1–5: so hiệu tuyệt đối',
        note: 'Dữ liệu không đối xứng đẹp như xúc xắc, nhưng công thức đối kháng vẫn giữ nguyên.',
        problem: 'Có 5 tấm thẻ đánh số 1, 2, 3, 4, 5. Hoàng Nam và Khánh Huyền mỗi người bốc ngẫu nhiên 1 thẻ (bốc lại sau khi ghi số). Người có số lớn hơn thắng. Tính hiệu tuyệt đối của 2 số và xếp theo: |a–b| = 1 (4 cách), 2 (3 cách), 3 (2 cách), 4 (1 cách).',
        question: 'Tính xác suất để Hoàng Nam thắng ngay lượt đầu. Kết quả có thể làm tròn đến 2 chữ số thập phân.',
        scoreLabel: 'Số thẻ',
        playerA: 'Hoàng Nam',
        playerB: 'Khánh Huyền',
        outcomes: [
            { label: '1', weight: 1 },
            { label: '2', weight: 1 },
            { label: '3', weight: 1 },
            { label: '4', weight: 1 },
            { label: '5', weight: 1 },
        ],
    },
    {
        id: 'coins-tail',
        title: '3 đồng xu: so số mặt sấp',
        note: 'Phân bố nhị thức B(3, 1/2) cho một người chơi. Rất hợp để chuyển sang mô hình đối kháng.',
        problem: 'Gia Huy và Bảo Ngọc mỗi người tung 3 đồng xu, đếm số mặt sấp. Người có nhiều mặt sấp hơn thắng, bằng nhau thì hòa và tung lại. Phân bố số mặt sấp (số cách): 0→1, 1→3, 2→3, 3→1 (theo phân bố nhị thức B(3, 1/2)).',
        question: 'Tính xác suất để Gia Huy thắng ngay lượt tung đầu tiên.',
        scoreLabel: 'Số mặt sấp',
        playerA: 'Gia Huy',
        playerB: 'Bảo Ngọc',
        outcomes: [
            { label: '0', weight: 1 },
            { label: '1', weight: 3 },
            { label: '2', weight: 3 },
            { label: '3', weight: 1 },
        ],
    },
    {
        id: 'd4-max',
        title: '2 xúc xắc 4 mặt: so giá trị lớn nhất',
        note: 'Biến đổi đại lượng ngẫu nhiên: max của 2 biến đều, kết quả không đều. Rất tốt để luyện đọc phân bố.',
        problem: 'Bảo Long và Nhã Kỳ mỗi người tung 2 xúc xắc 4 mặt (mặt 1, 2, 3, 4) và lấy giá trị lớn nhất. Người có giá trị max lớn hơn thắng. Số cách ra max = k: max=1 → 1 cách, max=2 → 3 cách, max=3 → 5 cách, max=4 → 7 cách (tổng 16 cách).',
        question: 'Tính xác suất để Bảo Long thắng ngay lượt đầu.',
        scoreLabel: 'Giá trị max',
        playerA: 'Bảo Long',
        playerB: 'Nhã Kỳ',
        outcomes: [
            { label: '1', weight: 1 },
            { label: '2', weight: 3 },
            { label: '3', weight: 5 },
            { label: '4', weight: 7 },
        ],
    },
    {
        id: 'balls5-sum',
        title: '5 bi số 1–5: bốc 2 bi, so tổng',
        note: 'Bốc có hoàn lại. Tổng từ 2 đến 10, phân bố đối xứng quanh tổng = 6.',
        problem: 'Có 5 bi đánh số 1, 2, 3, 4, 5 (hoàn lại sau mỗi lần bốc). Minh Anh và Tuấn Kiệt mỗi người bốc ngẫu nhiên 2 bi (có hoàn lại), tính tổng 2 số. Người có tổng lớn hơn thắng. Số cách ra tổng = k: 2→1, 3→2, 4→3, 5→4, 6→5, 7→4, 8→3, 9→2, 10→1.',
        question: 'Tính xác suất để Minh Anh thắng ngay lượt đầu.',
        scoreLabel: 'Tổng 2 bi',
        playerA: 'Minh Anh',
        playerB: 'Tuấn Kiệt',
        outcomes: [
            { label: '2', weight: 1 },
            { label: '3', weight: 2 },
            { label: '4', weight: 3 },
            { label: '5', weight: 4 },
            { label: '6', weight: 5 },
            { label: '7', weight: 4 },
            { label: '8', weight: 3 },
            { label: '9', weight: 2 },
            { label: '10', weight: 1 },
        ],
    },
    {
        id: 'spin-product',
        title: 'Vòng quay 1–4: so tích điểm 2 lần quay',
        note: 'Spin 2 lần, nhân 2 kết quả → biến đổi ngẫu nhiên thú vị. Tích từ 1 đến 16 không đều nhau.',
        problem: 'Vòng quay chia đều 4 ô: 1, 2, 3, 4 (mỗi ô xác suất 1/4). Lan Anh và Đức Minh mỗi người quay 2 lần, lấy tích 2 số. Người có tích lớn hơn thắng. Số cách ra tích = k: 1→1, 2→2, 3→2, 4→3, 6→2, 8→2, 9→1, 12→2, 16→1.',
        question: 'Tính xác suất để Lan Anh thắng ngay lượt đầu.',
        scoreLabel: 'Tích điểm',
        playerA: 'Lan Anh',
        playerB: 'Đức Minh',
        outcomes: [
            { label: '1', weight: 1 },
            { label: '2', weight: 2 },
            { label: '3', weight: 2 },
            { label: '4', weight: 3 },
            { label: '6', weight: 2 },
            { label: '8', weight: 2 },
            { label: '9', weight: 1 },
            { label: '12', weight: 2 },
            { label: '16', weight: 1 },
        ],
    },
]

const LEAF_CODES = ['LLL', 'LLR', 'LRL', 'LRR', 'RLL', 'RLR', 'RRL', 'RRR']

function gcd(a, b) {
    let x = Math.abs(a)
    let y = Math.abs(b)
    while (y !== 0) {
        const t = x % y
        x = y
        y = t
    }
    return x || 1
}

function frac(n, d = 1) {
    if (d === 0) return { n: 0, d: 1 }
    if (n === 0) return { n: 0, d: 1 }
    const sign = d < 0 ? -1 : 1
    const g = gcd(n, d)
    return { n: sign * n / g, d: Math.abs(d) / g }
}

function addFrac(a, b) {
    return frac(a.n * b.d + b.n * a.d, a.d * b.d)
}

function mulFrac(a, b) {
    return frac(a.n * b.n, a.d * b.d)
}

function divFrac(a, b) {
    if (b.n === 0) return { n: 0, d: 1 }
    return frac(a.n * b.d, a.d * b.n)
}

function subFrac(a, b) {
    return frac(a.n * b.d - b.n * a.d, a.d * b.d)
}

function fracToText(value) {
    return value.d === 1 ? `${value.n}` : `${value.n}/${value.d}`
}

function fracToLatex(value) {
    return value.d === 1 ? `${value.n}` : `\\dfrac{${value.n}}{${value.d}}`
}

function fracToDecimal(value, digits = 4) {
    return (value.n / value.d).toFixed(digits)
}

function fracToPercent(value, digits = 2) {
    return `${((100 * value.n) / value.d).toFixed(digits)}%`
}

function clampInt(value, min = 0, max = 99999) {
    const next = Number.isFinite(value) ? value : min
    return Math.max(min, Math.min(max, Math.round(next)))
}

function clampPercent(value) {
    return clampInt(value, 0, 100)
}

function percentFrac(value) {
    return frac(clampPercent(value), 100)
}

function sumBy(items, picker) {
    return items.reduce((sum, item) => sum + picker(item), 0)
}

function formatCount(value) {
    return new Intl.NumberFormat('vi-VN').format(value)
}

function sectionAccent(accent) {
    if (accent === 'emerald') return 'from-emerald-600 to-teal-700'
    if (accent === 'violet') return 'from-violet-600 to-indigo-700'
    if (accent === 'amber') return 'from-amber-500 to-orange-600'
    return 'from-slate-700 to-slate-900'
}

function eventFilterText(filter, stages) {
    const parts = []
        ;[
            ['s1', stages[0]],
            ['s2', stages[1]],
            ['s3', stages[2]],
        ].forEach(([key, stage]) => {
            if (filter[key] === 'L') parts.push(stage.left)
            if (filter[key] === 'R') parts.push(stage.right)
        })
    return parts.length ? parts.join(' • ') : 'Toàn bộ mẫu'
}

function leafLabel(code, stages) {
    return [
        code[0] === 'L' ? stages[0].left : stages[0].right,
        code[1] === 'L' ? stages[1].left : stages[1].right,
        code[2] === 'L' ? stages[2].left : stages[2].right,
    ].join(' / ')
}

function matchesFilter(code, filter) {
    return (
        (filter.s1 === '*' || filter.s1 === code[0]) &&
        (filter.s2 === '*' || filter.s2 === code[1]) &&
        (filter.s3 === '*' || filter.s3 === code[2])
    )
}

function nodeLeafCodes(prefix) {
    return LEAF_CODES.filter(code => code.startsWith(prefix))
}

function SectionCard({ children, className = '' }) {
    return <div className={`rounded-2xl border border-slate-200 bg-white shadow-sm p-5 ${className}`}>{children}</div>
}

function StepBadge({ n, className = '' }) {
    return <span className={`inline-flex items-center justify-center w-5 h-5 rounded-full bg-slate-800 text-white text-xs font-bold shrink-0 ${className}`}>{n}</span>
}

function TinyStat({ label, value, accent = 'text-slate-800' }) {
    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 px-4 py-3">
            <div className="text-xs uppercase tracking-wide text-slate-400 mb-1">{label}</div>
            <div className={`font-black text-lg ${accent}`}>{value}</div>
        </div>
    )
}

function NumberInput({ label, value, onChange, min = 0, max = 1000, accent = 'focus:ring-emerald-400' }) {
    return (
        <label className="flex items-center justify-between gap-3 text-sm">
            <span className="text-slate-600 font-medium">{label}</span>
            <input
                type="number"
                min={min}
                max={max}
                value={value}
                onChange={event => onChange(clampInt(parseInt(event.target.value, 10), min, max))}
                className={`w-20 rounded-lg border border-slate-300 px-2.5 py-1.5 text-center font-bold text-slate-800 focus:outline-none focus:ring-2 ${accent}`}
            />
        </label>
    )
}

function TextInput({ label, value, onChange, accent = 'focus:ring-emerald-400' }) {
    return (
        <label className="block text-sm space-y-1.5">
            <span className="text-slate-600 font-medium">{label}</span>
            <input
                type="text"
                value={value}
                onChange={event => onChange(event.target.value)}
                className={`w-full rounded-lg border border-slate-300 px-3 py-2 font-medium text-slate-800 focus:outline-none focus:ring-2 ${accent}`}
            />
        </label>
    )
}

function SvgNode({ x, y, w, h, title, subtitle, fill = '#ffffff', stroke = '#cbd5e1', titleFill = '#0f172a', subtitleFill = '#475569', titleSize = 12, subtitleSize = 11 }) {
    return (
        <g transform={`translate(${x}, ${y})`}>
            <rect width={w} height={h} rx="14" fill={fill} stroke={stroke} strokeWidth="1.3" />
            <text x={w / 2} y={titleSize + 10} textAnchor="middle" fontSize={titleSize} fontWeight="700" fill={titleFill}>
                {title}
            </text>
            <text x={w / 2} y={titleSize + subtitleSize + 18} textAnchor="middle" fontSize={subtitleSize} fill={subtitleFill}>
                {subtitle}
            </text>
        </g>
    )
}

function SvgEdge({ x1, y1, x2, y2, label, color = '#94a3b8', labelFill = '#64748b', offsetY = -6 }) {
    return (
        <g>
            <line x1={x1} y1={y1} x2={x2} y2={y2} stroke={color} strokeWidth="1.6" />
            {label ? (
                <text x={(x1 + x2) / 2} y={(y1 + y2) / 2 + offsetY} textAnchor="middle" fontSize="11" fontWeight="600" fill={labelFill}>
                    {label}
                </text>
            ) : null}
        </g>
    )
}

function ProblemCard({ problem, question, accent = 'emerald' }) {
    if (!problem && !question) return null
    const colors = {
        emerald: { bg: 'bg-emerald-50', border: 'border-emerald-400', badge: 'bg-emerald-600', qbg: 'bg-emerald-100', qborder: 'border-emerald-300', text: 'text-emerald-900', qtext: 'text-emerald-800' },
        violet: { bg: 'bg-violet-50', border: 'border-violet-400', badge: 'bg-violet-600', qbg: 'bg-violet-100', qborder: 'border-violet-300', text: 'text-violet-900', qtext: 'text-violet-800' },
        amber: { bg: 'bg-amber-50', border: 'border-amber-400', badge: 'bg-amber-600', qbg: 'bg-amber-100', qborder: 'border-amber-300', text: 'text-amber-900', qtext: 'text-amber-800' },
    }
    const c = colors[accent] || colors.emerald
    return (
        <div className={`rounded-2xl border-2 ${c.border} ${c.bg} p-5 space-y-3`}>
            {problem && (
                <div className="space-y-2">
                    <div className="flex items-center gap-2">
                        <span className={`${c.badge} text-white text-xs font-black px-3 py-1 rounded-full uppercase tracking-wider`}>Đề bài</span>
                    </div>
                    <p className={`text-sm leading-relaxed ${c.text} font-medium`}>{problem}</p>
                </div>
            )}
            {question && (
                <div className={`rounded-xl border ${c.qborder} ${c.qbg} px-4 py-3 space-y-1`}>
                    <div className="flex items-center gap-1.5">
                        <span className="text-xs font-black uppercase tracking-wider text-slate-500">Câu hỏi</span>
                    </div>
                    <p className={`text-sm font-semibold leading-relaxed ${c.qtext}`}>{question}</p>
                </div>
            )}
        </div>
    )
}

function HeaderHero({ activeTab, onSelect }) {
    const active = TAB_META.find(tab => tab.id === activeTab) || TAB_META[0]
    const tabStyles = {
        tree136: { active: 'bg-emerald-600 border-b-4 border-emerald-300 text-white', badge: 'text-emerald-200', hover: 'hover:bg-slate-700' },
        tree248: { active: 'bg-violet-600 border-b-4 border-violet-300 text-white', badge: 'text-violet-200', hover: 'hover:bg-slate-700' },
        duel: { active: 'bg-amber-500 border-b-4 border-amber-300 text-white', badge: 'text-amber-200', hover: 'hover:bg-slate-700' },
    }
    return (
        <div className="rounded-2xl overflow-hidden shadow-xl border border-slate-800">
            <div className="bg-slate-900 px-6 py-5">
                <p className="text-xs font-bold uppercase tracking-widest text-slate-400 mb-2">Studio Xác Suất Điều Kiện</p>
                <h1 className="text-2xl font-black text-white leading-tight">Sơ Đồ Cây 1-3-6, 2-4-8 &amp; Đối Kháng</h1>
                <p className="text-slate-300 text-sm mt-1.5 max-w-3xl leading-relaxed">
                    Mỗi tab có <strong className="text-white">đề bài rõ ràng</strong>, cây động và lời giải từng bước.
                    Thay số ngay — cây, bảng, đáp số cập nhật tức thì.
                </p>
            </div>
            <div className="bg-slate-800 grid grid-cols-3">
                {TAB_META.map(tab => {
                    const isActive = tab.id === activeTab
                    const s = tabStyles[tab.id]
                    return (
                        <button
                            key={tab.id}
                            type="button"
                            onClick={() => onSelect(tab.id)}
                            className={`py-4 px-5 text-left transition-all ${isActive ? s.active : `text-slate-300 border-b-4 border-transparent ${s.hover}`}`}
                        >
                            <div className={`text-xs font-bold uppercase tracking-widest mb-1 ${isActive ? s.badge : 'text-slate-500'}`}>{tab.short}</div>
                            <div className={`font-bold text-sm leading-snug ${isActive ? 'text-white' : 'text-slate-200'}`}>{tab.label}</div>
                        </button>
                    )
                })}
            </div>
        </div>
    )
}

function ThreeWaySourceEditor({ source, isTarget, onChange, onSetTarget }) {
    return (
        <div className={`rounded-xl border p-4 space-y-3 ${isTarget ? 'border-emerald-400 bg-emerald-50' : 'border-slate-200 bg-slate-50'}`}>
            <div className="flex items-center justify-between gap-3">
                <TextInput label="Tên nhánh" value={source.label} onChange={value => onChange({ ...source, label: value })} accent="focus:ring-emerald-400" />
                <button
                    type="button"
                    onClick={onSetTarget}
                    className={`px-3 py-1.5 rounded-full text-xs font-bold border self-end ${isTarget ? 'bg-emerald-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-300 hover:border-slate-500'}`}
                >
                    {isTarget ? 'Đang truy ngược' : 'Chọn nhánh cần truy ngược'}
                </button>
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <NumberInput label="Trọng số / quy mô" value={source.weight} onChange={value => onChange({ ...source, weight: value })} min={0} max={9999} accent="focus:ring-emerald-400" />
                <NumberInput label="Tỉ lệ thành công (%)" value={source.successRate} onChange={value => onChange({ ...source, successRate: clampPercent(value) })} min={0} max={100} accent="focus:ring-emerald-400" />
            </div>
        </div>
    )
}

function Tree136Svg({ rows, successLabel, failureLabel, knownLeaf, targetId }) {
    // Geometry — guaranteed no overlaps:
    // 3 row centers at Y = 75, 215, 355 (gap 140px)
    // Each row: upper leaf at cy-60 to cy-8, lower leaf at cy+8 to cy+60
    // Row-to-row gap: e.g. row0 lower bottom = 75+60=135, row1 upper top = 215-60=155 → 20px gap ✓
    const ROW_CY = [75, 215, 355]
    const SOURCE_X = 190, SOURCE_W = 165, SOURCE_H = 56
    const LEAF_X = 460, LEAF_W = 200, LEAF_H = 52
    const ROOT_X = 12, ROOT_W = 115, ROOT_H = 58
    const ROOT_CY = 215

    // upper leaf top = cy - LEAF_H - 8 = cy - 60; center = cy - 34
    // lower leaf top = cy + 8; center = cy + 34
    const uyTop = cy => cy - LEAF_H - 8
    const lyTop = cy => cy + 8
    const sourceCY = cy => cy  // source node center Y same as row center

    const SUCCESS_LINE = '#059669', SUCCESS_LABEL = '#064e3b', SUCCESS_BG = '#d1fae5', SUCCESS_BORDER = '#34d399'
    const FAIL_LINE = '#d97706', FAIL_LABEL = '#78350f', FAIL_BG = '#fef3c7', FAIL_BORDER = '#fcd34d'
    const TARGET_LINE = '#6366f1', TARGET_TEXT = '#3730a3'

    return (
        <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4 overflow-x-auto">
            <svg viewBox="0 0 790 432" className="min-w-[790px] w-full h-auto">
                {/* Root node */}
                <g transform={`translate(${ROOT_X},${ROOT_CY - ROOT_H / 2})`}>
                    <rect width={ROOT_W} height={ROOT_H} rx="12" fill="#1e293b" stroke="#1e293b" />
                    <text x={ROOT_W / 2} y={22} textAnchor="middle" fontSize={13} fontWeight="800" fill="#f8fafc">Gốc</text>
                    <text x={ROOT_W / 2} y={38} textAnchor="middle" fontSize={11} fill="#94a3b8">1 → 3 → 6</text>
                    <text x={ROOT_W / 2} y={52} textAnchor="middle" fontSize={10} fill="#64748b">{rows.length} nhánh</text>
                </g>

                {rows.map((row, index) => {
                    const rc = ROW_CY[index]
                    const sy = rc - SOURCE_H / 2
                    const uy = uyTop(rc)
                    const ly = lyTop(rc)
                    const uc = uy + LEAF_H / 2
                    const lc = ly + LEAF_H / 2
                    const isTarget = row.id === targetId
                    const isKnownSuccess = knownLeaf === 'success'
                    const successBg = isKnownSuccess ? (isTarget ? SUCCESS_BG : FAIL_BG) : '#ffffff'
                    const failureBg = !isKnownSuccess ? (isTarget ? SUCCESS_BG : FAIL_BG) : '#ffffff'
                    const successBorder = isKnownSuccess ? (isTarget ? SUCCESS_LINE : FAIL_BORDER) : '#e2e8f0'
                    const failureBorder = !isKnownSuccess ? (isTarget ? SUCCESS_LINE : FAIL_BORDER) : '#e2e8f0'

                    // Mid x for edge labels
                    const rootRX = ROOT_X + ROOT_W
                    const rootToSourceMX = (rootRX + SOURCE_X) / 2
                    const sourceLX = SOURCE_X + SOURCE_W
                    const leafMX = (sourceLX + LEAF_X) / 2

                    return (
                        <g key={row.id}>
                            {/* Root → Source edge */}
                            <line x1={rootRX} y1={ROOT_CY} x2={SOURCE_X} y2={rc} stroke="#94a3b8" strokeWidth="1.8" />
                            <text x={rootToSourceMX} y={(ROOT_CY + rc) / 2 - 5} textAnchor="middle" fontSize={11} fontWeight="700" fill="#475569">
                                {fracToText(row.prior)}
                            </text>

                            {/* Source node */}
                            <g transform={`translate(${SOURCE_X},${sy})`}>
                                <rect width={SOURCE_W} height={SOURCE_H} rx="10"
                                    fill={isTarget ? '#eef2ff' : '#ffffff'}
                                    stroke={isTarget ? TARGET_LINE : '#cbd5e1'}
                                    strokeWidth={isTarget ? 2.2 : 1.4} />
                                <text x={SOURCE_W / 2} y={20} textAnchor="middle" fontSize={12} fontWeight="700" fill={isTarget ? TARGET_TEXT : '#0f172a'}>
                                    {row.label}
                                </text>
                                <text x={SOURCE_W / 2} y={35} textAnchor="middle" fontSize={10} fill="#64748b">
                                    trọng số {row.weight}
                                </text>
                                {isTarget && (
                                    <text x={SOURCE_W / 2} y={50} textAnchor="middle" fontSize={9} fontWeight="800" fill={TARGET_LINE}>
                                        ← CẦN TÌM
                                    </text>
                                )}
                            </g>

                            {/* Source → upper leaf (success) */}
                            <line x1={sourceLX} y1={rc} x2={LEAF_X} y2={uc} stroke={SUCCESS_LINE} strokeWidth="1.8" />
                            <text x={leafMX - 8} y={(rc + uc) / 2 - 7} textAnchor="middle" fontSize={11} fontWeight="700" fill={SUCCESS_LABEL}>
                                {fracToText(row.success)}
                            </text>

                            {/* Source → lower leaf (failure) */}
                            <line x1={sourceLX} y1={rc} x2={LEAF_X} y2={lc} stroke={FAIL_LINE} strokeWidth="1.8" />
                            <text x={leafMX - 8} y={(rc + lc) / 2 + 12} textAnchor="middle" fontSize={11} fontWeight="700" fill={FAIL_LABEL}>
                                {fracToText(row.failure)}
                            </text>

                            {/* Upper leaf — success */}
                            <g transform={`translate(${LEAF_X},${uy})`}>
                                <rect width={LEAF_W} height={LEAF_H} rx="10" fill={successBg} stroke={successBorder} strokeWidth={isKnownSuccess && isTarget ? 2.5 : 1.5} />
                                <text x={LEAF_W / 2} y={18} textAnchor="middle" fontSize={11} fontWeight="700" fill={SUCCESS_LABEL}>{successLabel}</text>
                                <text x={LEAF_W / 2} y={34} textAnchor="middle" fontSize={10} fill="#047857">
                                    P = {fracToText(row.successJoint)}
                                </text>
                            </g>

                            {/* Lower leaf — failure */}
                            <g transform={`translate(${LEAF_X},${ly})`}>
                                <rect width={LEAF_W} height={LEAF_H} rx="10" fill={failureBg} stroke={failureBorder} strokeWidth={!isKnownSuccess && isTarget ? 2.5 : 1.5} />
                                <text x={LEAF_W / 2} y={18} textAnchor="middle" fontSize={11} fontWeight="700" fill={FAIL_LABEL}>{failureLabel}</text>
                                <text x={LEAF_W / 2} y={34} textAnchor="middle" fontSize={10} fill="#b45309">
                                    P = {fracToText(row.failureJoint)}
                                </text>
                            </g>
                        </g>
                    )
                })}
            </svg>
        </div>
    )
}

function Tree136Tab() {
    const [presetId, setPresetId] = useState(TREE136_PRESETS[0].id)
    const preset = useMemo(() => TREE136_PRESETS.find(item => item.id === presetId) || TREE136_PRESETS[0], [presetId])
    const [sources, setSources] = useState(preset.sources)
    const [successLabel, setSuccessLabel] = useState(preset.successLabel)
    const [failureLabel, setFailureLabel] = useState(preset.failureLabel)
    const [knownLeaf, setKnownLeaf] = useState(preset.knownLeaf)
    const [targetId, setTargetId] = useState(preset.targetId)

    useEffect(() => {
        setSources(preset.sources.map(item => ({ ...item })))
        setSuccessLabel(preset.successLabel)
        setFailureLabel(preset.failureLabel)
        setKnownLeaf(preset.knownLeaf)
        setTargetId(preset.targetId)
    }, [preset])

    const derived = useMemo(() => {
        const safeSources = sources.map(source => ({
            ...source,
            weight: clampInt(source.weight, 0, 99999),
            successRate: clampPercent(source.successRate),
        }))
        const weightSum = sumBy(safeSources, source => source.weight)
        const rows = safeSources.map(source => {
            const prior = weightSum > 0 ? frac(source.weight, weightSum) : frac(0, 1)
            const success = percentFrac(source.successRate)
            const failure = subFrac(frac(1, 1), success)
            return {
                ...source,
                prior,
                success,
                failure,
                successJoint: mulFrac(prior, success),
                failureJoint: mulFrac(prior, failure),
            }
        })
        const knownTotal = rows.reduce((sum, row) => addFrac(sum, knownLeaf === 'success' ? row.successJoint : row.failureJoint), frac(0, 1))
        const target = rows.find(row => row.id === targetId) || rows[0]
        const targetJoint = target ? (knownLeaf === 'success' ? target.successJoint : target.failureJoint) : frac(0, 1)
        const posterior = knownTotal.n === 0 ? frac(0, 1) : divFrac(targetJoint, knownTotal)
        return { rows, weightSum, knownTotal, target, targetJoint, posterior }
    }, [sources, knownLeaf, targetId])

    const isDegenerate = derived.weightSum === 0 || derived.knownTotal.n === 0

    return (
        <div className="space-y-5">
            <ProblemCard problem={preset.problem} question={preset.question} accent="emerald" />
            <div className="grid grid-cols-1 xl:grid-cols-[1.08fr_0.92fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Chọn bài mẫu</p>
                        <div className="flex flex-wrap gap-2">
                            {TREE136_PRESETS.map(item => (
                                <button
                                    key={item.id}
                                    type="button"
                                    onClick={() => setPresetId(item.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${item.id === presetId ? 'bg-emerald-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {item.title}
                                </button>
                            ))}
                        </div>
                        <p className="text-xs text-slate-500 mt-3">{preset.note}</p>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Ý nghĩa của tầng 2</p>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <TextInput label="Nhánh thành công" value={successLabel} onChange={setSuccessLabel} accent="focus:ring-emerald-400" />
                            <TextInput label="Nhánh còn lại" value={failureLabel} onChange={setFailureLabel} accent="focus:ring-emerald-400" />
                        </div>
                        <div className="mt-4 flex flex-wrap gap-2">
                            <button
                                type="button"
                                onClick={() => setKnownLeaf('success')}
                                className={`px-4 py-2 rounded-xl text-sm font-semibold border ${knownLeaf === 'success' ? 'bg-emerald-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200'}`}
                            >
                                Biết đã rơi vào nhánh {successLabel}
                            </button>
                            <button
                                type="button"
                                onClick={() => setKnownLeaf('failure')}
                                className={`px-4 py-2 rounded-xl text-sm font-semibold border ${knownLeaf === 'failure' ? 'bg-amber-500 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200'}`}
                            >
                                Biết đã rơi vào nhánh {failureLabel}
                            </button>
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Dữ liệu gốc của 3 nhánh</p>
                        <div className="space-y-3">
                            {sources.map(source => (
                                <ThreeWaySourceEditor
                                    key={source.id}
                                    source={source}
                                    isTarget={targetId === source.id}
                                    onSetTarget={() => setTargetId(source.id)}
                                    onChange={next => setSources(prev => prev.map(item => item.id === source.id ? next : item))}
                                />
                            ))}
                        </div>
                    </SectionCard>
                </div>

                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Khung tư duy cho cây 1-3-6</p>
                        <div className="space-y-2 text-sm text-slate-700 leading-relaxed">
                            <p><strong>Bước 1.</strong> Tầng 1 cho ta các nguyên nhân đầy đủ: 3 nhánh A, B, C.</p>
                            <p><strong>Bước 2.</strong> Tầng 2 cho biết ở từng nguyên nhân, biến cố ta quan sát có xác suất bao nhiêu.</p>
                            <p><strong>Bước 3.</strong> Muốn tính xác suất của biến cố quan sát, phải cộng tất cả các lá cùng loại.</p>
                            <p><strong>Bước 4.</strong> Muốn truy ngược nguyên nhân, lấy đúng lá của nhánh cần tìm chia cho tổng các lá cùng loại.</p>
                        </div>
                        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 mt-4">
                            <BlockMath math={`P(H_t\mid E)=\dfrac{P(H_t)P(E\mid H_t)}{\sum_i P(H_i)P(E\mid H_i)}`} />
                        </div>
                    </SectionCard>

                    {!isDegenerate && derived.target ? (
                        <>
                            <div className={`rounded-2xl bg-gradient-to-br ${sectionAccent('emerald')} p-6 text-white shadow-lg`}>
                                <div className="text-xs uppercase tracking-[0.2em] text-white/65 mb-2">Xác suất hậu nghiệm</div>
                                <div className="text-4xl font-black leading-none mb-2">{fracToDecimal(derived.posterior, 4)}</div>
                                <div className="text-sm text-white/85">= {fracToText(derived.posterior)} = {fracToPercent(derived.posterior, 2)}</div>
                            </div>
                            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                                <TinyStat label="Nhánh quan sát" value={knownLeaf === 'success' ? successLabel : failureLabel} accent="text-amber-700" />
                                <TinyStat label="Nhánh cần truy" value={derived.target.label} accent="text-emerald-700" />
                                <TinyStat label="Tổng xác suất nhánh quan sát" value={fracToText(derived.knownTotal)} accent="text-slate-800" />
                            </div>
                        </>
                    ) : (
                        <SectionCard className="border-red-200 bg-red-50">
                            <p className="font-bold text-red-700 text-sm mb-2">Chưa đủ dữ kiện để tính</p>
                            <p className="text-sm text-red-700">Cần ít nhất một trọng số dương và nhánh quan sát phải có xác suất lớn hơn 0.</p>
                        </SectionCard>
                    )}
                </div>
            </div>

            {!isDegenerate && derived.target ? (
                <>
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={1} /> Cây động 1-3-6</p>
                        <Tree136Svg rows={derived.rows} successLabel={successLabel} failureLabel={failureLabel} knownLeaf={knownLeaf} targetId={targetId} />
                        <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mt-4 text-sm">
                            <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-emerald-800">Ô xanh: chính là lá vừa là nhánh quan sát vừa là nhánh cần truy ngược.</div>
                            <div className="rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-amber-800">Ô vàng: cũng tạo ra biến cố đã biết nên phải cộng vào mẫu số.</div>
                            <div className="rounded-xl border border-slate-200 bg-slate-50 px-4 py-3 text-slate-700">Ô trắng: không thuộc biến cố đã biết nên không đi vào mẫu số của Bayes.</div>
                        </div>
                    </SectionCard>

                    <div className="grid grid-cols-1 xl:grid-cols-2 gap-5">
                        <SectionCard>
                            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={2} /> Gộp các lá cùng loại để tính biến cố đã biết</p>
                            <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                                <p>
                                    Nếu đã biết kết quả rơi vào nhánh <strong>{knownLeaf === 'success' ? successLabel : failureLabel}</strong>,
                                    thì mẫu số phải là tổng của cả 3 lá cùng loại, không được giữ lại một lá duy nhất.
                                </p>
                                <div className="rounded-xl bg-slate-50 border border-slate-200 p-4">
                                    <BlockMath
                                        math={`P(E)=${derived.rows.map(row => `${fracToLatex(row.prior)}\\cdot${fracToLatex(knownLeaf === 'success' ? row.success : row.failure)}`).join(' + ')}=${fracToLatex(derived.knownTotal)}`}
                                    />
                                </div>
                            </div>
                        </SectionCard>

                        <SectionCard>
                            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={3} /> Truy ngược nguyên nhân cần tìm</p>
                            <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                                <p>
                                    Tử số chỉ lấy riêng lá thuộc nhánh <strong>{derived.target.label}</strong> và thuộc đúng biến cố đã biết.
                                </p>
                                <div className="rounded-xl bg-emerald-50 border border-emerald-200 p-4">
                                    <BlockMath
                                        math={`P(${derived.target.label}\\mid E)=\\dfrac{${fracToLatex(derived.targetJoint)}}{${fracToLatex(derived.knownTotal)}}=${fracToLatex(derived.posterior)}`}
                                    />
                                </div>
                            </div>
                        </SectionCard>
                    </div>
                </>
            ) : null}
        </div>
    )
}

function FilterBuilder({ title, filter, stages, onChange, accent = 'focus:ring-violet-400' }) {
    const optionsFor = stage => [
        { value: '*', label: `Bỏ qua ${stage.title}` },
        { value: 'L', label: stage.left },
        { value: 'R', label: stage.right },
    ]

    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
            <p className="font-bold text-slate-800 text-sm">{title}</p>
            {stages.map((stage, index) => {
                const key = `s${index + 1}`
                return (
                    <label key={stage.title} className="block text-sm space-y-1.5">
                        <span className="font-medium text-slate-600">{stage.title}</span>
                        <select
                            value={filter[key]}
                            onChange={event => onChange({ ...filter, [key]: event.target.value })}
                            className={`w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 ${accent}`}
                        >
                            {optionsFor(stage).map(option => (
                                <option key={option.value} value={option.value}>{option.label}</option>
                            ))}
                        </select>
                    </label>
                )
            })}
        </div>
    )
}

function Tree248Svg({ stages, leafCounts, eventFilter, conditionFilter }) {
    // Center-based layout — all nodes centered on their leaf-group midpoint
    // 8 leaves in 2 groups of 4, LEAF_H=46, gap=8 within group, gap=52 between groups
    const LEAF_H = 46, LEAF_GAP = 8, GROUP_GAP = 52
    const leafYs = [0, 54, 108, 162, 266, 320, 374, 428]  // leafY[4] = 162+46+52+6=266
    // leaf centers:
    const lc = i => leafYs[i] + LEAF_H / 2  // [23, 77, 131, 185, 289, 343, 397, 451]

    // Stage2 centers = midpoint of their 2 leaf centers
    const s2c = [
        (lc(0) + lc(1)) / 2,   // LL: (23+77)/2=50
        (lc(2) + lc(3)) / 2,   // LR: (131+185)/2=158
        (lc(4) + lc(5)) / 2,   // RL: (289+343)/2=316
        (lc(6) + lc(7)) / 2,   // RR: (397+451)/2=424
    ]
    const S2H = 52, S2W = 160
    const s2Ys = s2c.map(cy => cy - S2H / 2)  // [24, 132, 290, 398]

    // Stage1 centers = midpoint of their 2 stage2 centers
    const s1c = [
        (s2c[0] + s2c[1]) / 2,  // L: (50+158)/2=104
        (s2c[2] + s2c[3]) / 2,  // R: (316+424)/2=370
    ]
    const S1H = 52, S1W = 130
    const s1Ys = s1c.map(cy => cy - S1H / 2)  // [78, 344]

    // Root center = midpoint of both stage1 centers
    const rootCY = (s1c[0] + s1c[1]) / 2  // (104+370)/2=237
    const ROOT_H = 58, ROOT_W = 120
    const rootY = rootCY - ROOT_H / 2  // 208

    // X positions
    const LEAF_X = 640, LEAF_W = 215
    const S2_X = 400, S1_X = 185, ROOT_X = 12

    const viewH = Math.max(leafYs[7] + LEAF_H, s2Ys[3] + S2H) + 25  // ~500

    const leafColors = code => {
        const inA = matchesFilter(code, eventFilter)
        const inB = matchesFilter(code, conditionFilter)
        if (inA && inB) return { fill: '#d1fae5', stroke: '#059669', sw: 2.2 }
        if (inB) return { fill: '#fef3c7', stroke: '#d97706', sw: 1.8 }
        if (inA) return { fill: '#ede9fe', stroke: '#7c3aed', sw: 1.8 }
        return { fill: '#f8fafc', stroke: '#e2e8f0', sw: 1.2 }
    }
    const countForPrefix = prefix => sumBy(nodeLeafCodes(prefix), code => leafCounts[code] ?? 0)
    const totalCount = countForPrefix('')
    const s1Labels = ['L', 'R']
    const s2Labels = ['LL', 'LR', 'RL', 'RR']

    return (
        <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4 overflow-x-auto">
            <svg viewBox={`0 0 875 ${viewH}`} className="min-w-[875px] w-full h-auto">
                {/* Root */}
                <g transform={`translate(${ROOT_X},${rootY})`}>
                    <rect width={ROOT_W} height={ROOT_H} rx="12" fill="#1e293b" stroke="#1e293b" />
                    <text x={ROOT_W / 2} y={22} textAnchor="middle" fontSize={12} fontWeight="800" fill="#f8fafc">Tổng</text>
                    <text x={ROOT_W / 2} y={38} textAnchor="middle" fontSize={11} fill="#94a3b8">N = {formatCount(totalCount)}</text>
                    <text x={ROOT_W / 2} y={52} textAnchor="middle" fontSize={10} fill="#64748b">2 → 4 → 8</text>
                </g>

                {/* Stage 1 */}
                {s1Labels.map((lbl, i) => {
                    const cy = s1c[i], ty = s1Ys[i]
                    const name = lbl === 'L' ? stages[0].left : stages[0].right
                    const cnt = countForPrefix(lbl)
                    return (
                        <g key={lbl}>
                            <line x1={ROOT_X + ROOT_W} y1={rootCY} x2={S1_X} y2={cy} stroke="#94a3b8" strokeWidth="1.8" />
                            <g transform={`translate(${S1_X},${ty})`}>
                                <rect width={S1W} height={S1H} rx="10" fill="#fff" stroke="#cbd5e1" strokeWidth="1.4" />
                                <text x={S1W / 2} y={19} textAnchor="middle" fontSize={12} fontWeight="700" fill="#1e293b">{name}</text>
                                <text x={S1W / 2} y={34} textAnchor="middle" fontSize={10} fill="#64748b">{formatCount(cnt)} người</text>
                                <text x={S1W / 2} y={47} textAnchor="middle" fontSize={10} fill="#94a3b8">
                                    {totalCount > 0 ? `${((cnt / totalCount) * 100).toFixed(1)}%` : '—'}
                                </text>
                            </g>
                        </g>
                    )
                })}

                {/* Stage 2 */}
                {s2Labels.map((lbl, i) => {
                    const parentS1 = lbl[0]
                    const pcy = s1c[s1Labels.indexOf(parentS1)]
                    const cy = s2c[i], ty = s2Ys[i]
                    const n1 = lbl[0] === 'L' ? stages[0].left : stages[0].right
                    const n2 = lbl[1] === 'L' ? stages[1].left : stages[1].right
                    const cnt = countForPrefix(lbl)
                    return (
                        <g key={lbl}>
                            <line x1={S1_X + S1W} y1={pcy} x2={S2_X} y2={cy} stroke="#94a3b8" strokeWidth="1.6" />
                            <g transform={`translate(${S2_X},${ty})`}>
                                <rect width={S2W} height={S2H} rx="10" fill="#fff" stroke="#e2e8f0" strokeWidth="1.3" />
                                <text x={S2W / 2} y={16} textAnchor="middle" fontSize={10} fontWeight="700" fill="#334155">{n1}</text>
                                <text x={S2W / 2} y={29} textAnchor="middle" fontSize={10} fontWeight="700" fill="#334155">{n2}</text>
                                <text x={S2W / 2} y={43} textAnchor="middle" fontSize={10} fill="#64748b">{formatCount(cnt)}</text>
                            </g>
                        </g>
                    )
                })}

                {/* Leaves */}
                {LEAF_CODES.map((code, idx) => {
                    const parentS2 = code.slice(0, 2)
                    const s2idx = s2Labels.indexOf(parentS2)
                    const pcy = s2c[s2idx]
                    const lfy = leafYs[idx]
                    const lfcy = lc(idx)
                    const cnt = leafCounts[code] ?? 0
                    const colors = leafColors(code)
                    const n1 = code[0] === 'L' ? stages[0].left : stages[0].right
                    const n2 = code[1] === 'L' ? stages[1].left : stages[1].right
                    const n3 = code[2] === 'L' ? stages[2].left : stages[2].right
                    const shortLabel = `${n1[0]}/${n2[0]}/${n3[0]}`  // abbreviated
                    return (
                        <g key={code}>
                            <line x1={S2_X + S2W} y1={pcy} x2={LEAF_X} y2={lfcy} stroke="#94a3b8" strokeWidth="1.4" />
                            <g transform={`translate(${LEAF_X},${lfy})`}>
                                <rect width={LEAF_W} height={LEAF_H} rx="9" fill={colors.fill} stroke={colors.stroke} strokeWidth={colors.sw} />
                                <text x={8} y={16} fontSize={9} fontWeight="700" fill="#1e293b">{n1} / {n2}</text>
                                <text x={8} y={28} fontSize={9} fill="#475569">{n3}</text>
                                <text x={LEAF_W - 8} y={28} textAnchor="end" fontSize={11} fontWeight="800" fill="#1e293b">{formatCount(cnt)}</text>
                            </g>
                        </g>
                    )
                })}
            </svg>
        </div>
    )
}

function Tree248Tab() {
    const [presetId, setPresetId] = useState(TREE248_PRESETS[0].id)
    const preset = useMemo(() => TREE248_PRESETS.find(item => item.id === presetId) || TREE248_PRESETS[0], [presetId])
    const [stages, setStages] = useState(preset.stages)
    const [leafCounts, setLeafCounts] = useState(preset.leaves)
    const [eventFilter, setEventFilter] = useState(preset.eventFilter)
    const [conditionFilter, setConditionFilter] = useState(preset.conditionFilter)

    useEffect(() => {
        setStages(preset.stages.map(stage => ({ ...stage })))
        setLeafCounts({ ...preset.leaves })
        setEventFilter({ ...preset.eventFilter })
        setConditionFilter({ ...preset.conditionFilter })
    }, [preset])

    const derived = useMemo(() => {
        const safeLeaves = Object.fromEntries(LEAF_CODES.map(code => [code, clampInt(leafCounts[code] ?? 0, 0, 999999)]))
        const total = sumBy(LEAF_CODES, code => safeLeaves[code])
        const eventCodes = LEAF_CODES.filter(code => matchesFilter(code, eventFilter))
        const conditionCodes = LEAF_CODES.filter(code => matchesFilter(code, conditionFilter))
        const bothCodes = LEAF_CODES.filter(code => matchesFilter(code, eventFilter) && matchesFilter(code, conditionFilter))
        const eventCount = sumBy(eventCodes, code => safeLeaves[code])
        const conditionCount = sumBy(conditionCodes, code => safeLeaves[code])
        const bothCount = sumBy(bothCodes, code => safeLeaves[code])
        const unconditional = total > 0 ? frac(eventCount, total) : frac(0, 1)
        const conditionProb = total > 0 ? frac(conditionCount, total) : frac(0, 1)
        const intersectionProb = total > 0 ? frac(bothCount, total) : frac(0, 1)
        const conditional = conditionCount > 0 ? frac(bothCount, conditionCount) : frac(0, 1)
        return {
            safeLeaves,
            total,
            eventCodes,
            conditionCodes,
            bothCodes,
            eventCount,
            conditionCount,
            bothCount,
            unconditional,
            conditionProb,
            intersectionProb,
            conditional,
        }
    }, [leafCounts, eventFilter, conditionFilter])

    return (
        <div className="space-y-5">
            <ProblemCard problem={preset.problem} question={preset.question} accent="violet" />
            <div className="grid grid-cols-1 xl:grid-cols-[1.1fr_0.9fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Chọn bài mẫu</p>
                        <div className="flex flex-wrap gap-2">
                            {TREE248_PRESETS.map(item => (
                                <button
                                    key={item.id}
                                    type="button"
                                    onClick={() => setPresetId(item.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${item.id === presetId ? 'bg-violet-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {item.title}
                                </button>
                            ))}
                        </div>
                        <p className="text-xs text-slate-500 mt-3">{preset.note}</p>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Đặt tên cho 3 tầng nhị phân</p>
                        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                            {stages.map((stage, index) => (
                                <div key={stage.title + index} className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
                                    <TextInput label={`Tên tầng ${index + 1}`} value={stage.title} onChange={value => setStages(prev => prev.map((item, idx) => idx === index ? { ...item, title: value } : item))} accent="focus:ring-violet-400" />
                                    <TextInput label="Nhánh trái" value={stage.left} onChange={value => setStages(prev => prev.map((item, idx) => idx === index ? { ...item, left: value } : item))} accent="focus:ring-violet-400" />
                                    <TextInput label="Nhánh phải" value={stage.right} onChange={value => setStages(prev => prev.map((item, idx) => idx === index ? { ...item, right: value } : item))} accent="focus:ring-violet-400" />
                                </div>
                            ))}
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Nhập trực tiếp số lượng ở 8 lá</p>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                            {LEAF_CODES.map(code => (
                                <div key={code} className="rounded-xl border border-slate-200 bg-slate-50 p-4">
                                    <div className="text-sm font-bold text-slate-800 mb-2">{leafLabel(code, stages)}</div>
                                    <NumberInput label="Số lượng" value={leafCounts[code] ?? 0} onChange={value => setLeafCounts(prev => ({ ...prev, [code]: value }))} min={0} max={999999} accent="focus:ring-violet-400" />
                                </div>
                            ))}
                        </div>
                    </SectionCard>
                </div>

                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Khung tư duy cho cây 2-4-8</p>
                        <div className="space-y-2 text-sm text-slate-700 leading-relaxed">
                            <p><strong>Bước 1.</strong> Xem mỗi lá là một nhóm rất cụ thể, ví dụ: Nam / Trẻ / Đã lập GĐ.</p>
                            <p><strong>Bước 2.</strong> Cộng các lá phù hợp để tạo ra biến cố A.</p>
                            <p><strong>Bước 3.</strong> Cộng tiếp các lá phù hợp để tạo ra điều kiện B.</p>
                            <p><strong>Bước 4.</strong> Phần giao của hai nhóm chính là tử số của xác suất có điều kiện.</p>
                        </div>
                        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 mt-4">
                            <BlockMath math={`P(A\mid B)=\dfrac{n(A\cap B)}{n(B)}`} />
                        </div>
                    </SectionCard>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                        <FilterBuilder title="Biến cố A" filter={eventFilter} stages={stages} onChange={setEventFilter} accent="focus:ring-violet-400" />
                        <FilterBuilder title="Điều kiện B" filter={conditionFilter} stages={stages} onChange={setConditionFilter} accent="focus:ring-violet-400" />
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                        <TinyStat label="Tổng mẫu" value={formatCount(derived.total)} accent="text-slate-800" />
                        <TinyStat label="n(A ∩ B)" value={formatCount(derived.bothCount)} accent="text-violet-700" />
                        <TinyStat label="P(A | B)" value={fracToText(derived.conditional)} accent="text-violet-700" />
                    </div>

                    <div className={`rounded-2xl bg-gradient-to-br ${sectionAccent('violet')} p-6 text-white shadow-lg`}>
                        <div className="text-xs uppercase tracking-[0.2em] text-white/65 mb-2">Đáp số điều kiện</div>
                        <div className="text-4xl font-black leading-none mb-2">{fracToDecimal(derived.conditional, 4)}</div>
                        <div className="text-sm text-white/85">= {fracToText(derived.conditional)} = {fracToPercent(derived.conditional, 2)}</div>
                    </div>
                </div>
            </div>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={1} /> Cây động 2-4-8</p>
                <Tree248Svg stages={stages} leafCounts={derived.safeLeaves} eventFilter={eventFilter} conditionFilter={conditionFilter} />
                <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mt-4 text-sm">
                    <div className="rounded-xl border border-violet-200 bg-violet-50 px-4 py-3 text-violet-800">Ô tím: thuộc A nhưng chưa chắc thuộc điều kiện B.</div>
                    <div className="rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-amber-800">Ô vàng: thuộc B nên góp vào mẫu số của xác suất có điều kiện.</div>
                    <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-emerald-800">Ô xanh: chính là phần giao A ∩ B, tức tử số.</div>
                </div>
            </SectionCard>

            <div className="grid grid-cols-1 xl:grid-cols-2 gap-5">
                <SectionCard>
                    <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={2} /> Cộng nhóm bằng số lượng</p>
                    <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                        <p><strong>A</strong> đang được hiểu là: <strong>{eventFilterText(eventFilter, stages)}</strong>.</p>
                        <p><strong>B</strong> đang được hiểu là: <strong>{eventFilterText(conditionFilter, stages)}</strong>.</p>
                        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-2">
                            <div><strong>n(A)</strong> = {formatCount(derived.eventCount)} từ {derived.eventCodes.length} lá phù hợp.</div>
                            <div><strong>n(B)</strong> = {formatCount(derived.conditionCount)} từ {derived.conditionCodes.length} lá phù hợp.</div>
                            <div><strong>n(A ∩ B)</strong> = {formatCount(derived.bothCount)} từ {derived.bothCodes.length} lá phù hợp đồng thời.</div>
                        </div>
                    </div>
                </SectionCard>

                <SectionCard>
                    <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={3} /> Viết thành xác suất</p>
                    <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                        <div className="rounded-xl border border-violet-200 bg-violet-50 p-4">
                            <BlockMath math={`P(A)=\dfrac{${derived.eventCount}}{${Math.max(1, derived.total)}}=${fracToLatex(derived.unconditional)}`} />
                            <BlockMath math={`P(B)=\dfrac{${derived.conditionCount}}{${Math.max(1, derived.total)}}=${fracToLatex(derived.conditionProb)}`} />
                            <BlockMath math={`P(A\cap B)=\dfrac{${derived.bothCount}}{${Math.max(1, derived.total)}}=${fracToLatex(derived.intersectionProb)}`} />
                            <BlockMath math={`P(A\mid B)=\dfrac{${derived.bothCount}}{${Math.max(1, derived.conditionCount)}}=${fracToLatex(derived.conditional)}`} />
                        </div>
                    </div>
                </SectionCard>
            </div>
        </div>
    )
}

function OutcomeEditor({ row, onChange }) {
    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 grid grid-cols-[1fr_auto] gap-3 items-end">
            <TextInput label="Nhãn điểm" value={row.label} onChange={value => onChange({ ...row, label: value })} accent="focus:ring-amber-400" />
            <NumberInput label="Số cách" value={row.weight} onChange={value => onChange({ ...row, weight: value })} min={0} max={999999} accent="focus:ring-amber-400" />
        </div>
    )
}

function DuelHeatmap({ outcomes, matrix }) {
    return (
        <div className="overflow-x-auto rounded-xl border border-slate-200">
            <table className="w-full min-w-[760px] text-xs border-collapse">
                <thead>
                    <tr className="bg-slate-100 text-slate-700">
                        <th className="px-3 py-2 text-left">A \ B</th>
                        {outcomes.map(row => (
                            <th key={row.label} className="px-2 py-2 text-center font-bold">{row.label}</th>
                        ))}
                    </tr>
                </thead>
                <tbody>
                    {outcomes.map((row, rowIndex) => (
                        <tr key={row.label} className="border-t border-slate-200">
                            <td className="px-3 py-2 font-bold text-slate-700 bg-slate-50">{row.label}</td>
                            {outcomes.map((col, colIndex) => {
                                const cell = matrix[rowIndex][colIndex]
                                return (
                                    <td
                                        key={col.label}
                                        className={`px-2 py-2 text-center font-mono ${cell.kind === 'win' ? 'bg-emerald-50 text-emerald-700' : cell.kind === 'tie' ? 'bg-amber-50 text-amber-700' : 'bg-slate-50 text-slate-500'}`}
                                    >
                                        {fracToPercent(cell.prob, 1)}
                                    </td>
                                )
                            })}
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

function DuelTab() {
    const [presetId, setPresetId] = useState(DUEL_PRESETS[0].id)
    const preset = useMemo(() => DUEL_PRESETS.find(item => item.id === presetId) || DUEL_PRESETS[0], [presetId])
    const [playerA, setPlayerA] = useState(preset.playerA)
    const [playerB, setPlayerB] = useState(preset.playerB)
    const [scoreLabel, setScoreLabel] = useState(preset.scoreLabel)
    const [outcomes, setOutcomes] = useState(preset.outcomes)

    useEffect(() => {
        setPlayerA(preset.playerA)
        setPlayerB(preset.playerB)
        setScoreLabel(preset.scoreLabel)
        setOutcomes(preset.outcomes.map(item => ({ ...item })))
    }, [preset])

    const derived = useMemo(() => {
        const safeOutcomes = outcomes.map(row => ({
            ...row,
            weight: clampInt(row.weight, 0, 999999),
        }))
        const totalWeight = sumBy(safeOutcomes, row => row.weight)
        const rows = safeOutcomes.map(row => ({
            ...row,
            prob: totalWeight > 0 ? frac(row.weight, totalWeight) : frac(0, 1),
        }))
        const totalSquare = totalWeight * totalWeight
        const tieNumerator = sumBy(rows, row => row.weight * row.weight)
        const tie = totalSquare > 0 ? frac(tieNumerator, totalSquare) : frac(0, 1)
        const win = totalSquare > 0 ? frac(totalSquare - tieNumerator, 2 * totalSquare) : frac(0, 1)
        const matrix = rows.map((row, rowIndex) => rows.map((col, colIndex) => ({
            kind: rowIndex > colIndex ? 'win' : rowIndex === colIndex ? 'tie' : 'lose',
            prob: totalSquare > 0 ? frac(row.weight * col.weight, totalSquare) : frac(0, 1),
        })))
        return { rows, totalWeight, tie, win, matrix }
    }, [outcomes])

    const isDegenerate = derived.totalWeight === 0

    return (
        <div className="space-y-5">
            <ProblemCard problem={preset.problem} question={preset.question} accent="amber" />
            <div className="grid grid-cols-1 xl:grid-cols-[1.08fr_0.92fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Chọn bài mẫu</p>
                        <div className="flex flex-wrap gap-2">
                            {DUEL_PRESETS.map(item => (
                                <button
                                    key={item.id}
                                    type="button"
                                    onClick={() => setPresetId(item.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${item.id === presetId ? 'bg-amber-500 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {item.title}
                                </button>
                            ))}
                        </div>
                        <p className="text-xs text-slate-500 mt-3">{preset.note}</p>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Tùy chỉnh câu chuyện</p>
                        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <TextInput label="Người chơi A" value={playerA} onChange={setPlayerA} accent="focus:ring-amber-400" />
                            <TextInput label="Người chơi B" value={playerB} onChange={setPlayerB} accent="focus:ring-amber-400" />
                            <TextInput label="Tên đại lượng so sánh" value={scoreLabel} onChange={setScoreLabel} accent="focus:ring-amber-400" />
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Phân bố của một người chơi</p>
                        <div className="space-y-3">
                            {outcomes.map((row, index) => (
                                <OutcomeEditor key={index} row={row} onChange={next => setOutcomes(prev => prev.map((item, idx) => idx === index ? next : item))} />
                            ))}
                        </div>
                    </SectionCard>
                </div>

                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Lõi tư duy đối kháng</p>
                        <div className="space-y-2 text-sm text-slate-700 leading-relaxed">
                            <p><strong>Bước 1.</strong> Lập phân bố của điểm số cho một người chơi.</p>
                            <p><strong>Bước 2.</strong> Tính xác suất hòa bằng cách bình phương rồi cộng từng xác suất thành phần.</p>
                            <p><strong>Bước 3.</strong> Vì hai người cùng luật, cùng phân bố nên cửa thắng của hai bên bằng nhau.</p>
                            <p><strong>Bước 4.</strong> Vậy xác suất thắng ngay vòng đầu là nửa của phần không hòa.</p>
                        </div>
                        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 mt-4">
                            <BlockMath math={`P(${playerA}\ \text{thắng})=\dfrac{1-P(\text{hòa})}{2}`} />
                        </div>
                    </SectionCard>

                    {!isDegenerate ? (
                        <>
                            <div className={`rounded-2xl bg-gradient-to-br ${sectionAccent('amber')} p-6 text-white shadow-lg`}>
                                <div className="text-xs uppercase tracking-[0.2em] text-white/65 mb-2">Xác suất thắng ngay lượt đầu</div>
                                <div className="text-4xl font-black leading-none mb-2">{fracToDecimal(derived.win, 4)}</div>
                                <div className="text-sm text-white/85">= {fracToText(derived.win)} = {fracToPercent(derived.win, 2)}</div>
                            </div>
                            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                                <TinyStat label="P(hòa)" value={fracToText(derived.tie)} accent="text-amber-700" />
                                <TinyStat label={`P(${playerA} thắng)`} value={fracToText(derived.win)} accent="text-emerald-700" />
                                <TinyStat label={`P(${playerB} thắng)`} value={fracToText(derived.win)} accent="text-emerald-700" />
                            </div>
                        </>
                    ) : (
                        <SectionCard className="border-red-200 bg-red-50">
                            <p className="font-bold text-red-700 text-sm mb-2">Chưa đủ dữ liệu</p>
                            <p className="text-sm text-red-700">Cần ít nhất một giá trị điểm có số cách dương.</p>
                        </SectionCard>
                    )}
                </div>
            </div>

            {!isDegenerate ? (
                <>
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={1} /> Phân bố điểm của một người chơi</p>
                        <div className="space-y-3">
                            {derived.rows.map(row => (
                                <div key={row.label} className="space-y-1.5">
                                    <div className="flex items-center justify-between gap-3 text-sm">
                                        <div>
                                            <span className="font-bold text-slate-800">{scoreLabel} = {row.label}</span>
                                            <span className="text-slate-400 ml-2">số cách: {row.weight}</span>
                                        </div>
                                        <span className="font-mono font-bold text-amber-700">{fracToText(row.prob)}</span>
                                    </div>
                                    <div className="w-full h-3 rounded-full bg-slate-100 overflow-hidden">
                                        <div className="h-full rounded-full bg-amber-400" style={{ width: `${(100 * row.prob.n) / row.prob.d}%` }} />
                                    </div>
                                </div>
                            ))}
                        </div>
                    </SectionCard>

                    <div className="grid grid-cols-1 xl:grid-cols-2 gap-5">
                        <SectionCard>
                            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={2} /> Tính cửa hòa</p>
                            <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                                <p>
                                    Vì hai người có cùng phân bố, xác suất hòa bằng tổng của các ô đường chéo trong ma trận.
                                    Nghĩa là cứ mỗi mức điểm {scoreLabel}, ta lấy <InlineMath math={`P(X=k)^2`} /> rồi cộng lại.
                                </p>
                                <div className="rounded-xl border border-slate-200 bg-slate-50 p-4">
                                    <BlockMath math={`P(\text{hòa})=${derived.rows.map(row => `${fracToLatex(row.prob)}^2`).join(' + ')}=${fracToLatex(derived.tie)}`} />
                                </div>
                            </div>
                        </SectionCard>

                        <SectionCard>
                            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={3} /> Chia đôi phần không hòa</p>
                            <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                                <p>
                                    Phần không hòa gồm hai cửa đối xứng nhau: <strong>{playerA} thắng</strong> và <strong>{playerB} thắng</strong>.
                                    Vì trò chơi công bằng, hai cửa này bằng nhau.
                                </p>
                                <div className="rounded-xl border border-amber-200 bg-amber-50 p-4">
                                    <BlockMath math={`P(${playerA}\ \text{thắng})=\dfrac{1-${fracToLatex(derived.tie)}}{2}=${fracToLatex(derived.win)}`} />
                                </div>
                            </div>
                        </SectionCard>
                    </div>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={4} /> Ma trận đối kháng một vòng</p>
                        <DuelHeatmap outcomes={derived.rows} matrix={derived.matrix} />
                        <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mt-4 text-sm">
                            <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-emerald-800">Ô xanh: {playerA} thắng vì điểm hàng lớn hơn điểm cột.</div>
                            <div className="rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-amber-800">Ô vàng: hòa, tức hai người có cùng điểm.</div>
                            <div className="rounded-xl border border-slate-200 bg-slate-50 px-4 py-3 text-slate-700">Ô xám: {playerA} thua. Nhờ đối xứng, tổng phần này đúng bằng tổng phần thắng.</div>
                        </div>
                    </SectionCard>
                </>
            ) : null}
        </div>
    )
}

export default function TreeProbabilityStudioPage() {
    const [activeTab, setActiveTab] = useState(TAB_META[0].id)

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-5">
            <HeaderHero activeTab={activeTab} onSelect={setActiveTab} />
            {activeTab === 'tree136' && <Tree136Tab />}
            {activeTab === 'tree248' && <Tree248Tab />}
            {activeTab === 'duel' && <DuelTab />}
        </div>
    )
}