import React, { useState, useMemo, useCallback } from 'react'
import { BlockMath, InlineMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { FaPlay, FaPause, FaStepForward, FaUndo, FaRandom, FaCalculator, FaBookOpen, FaChartBar, FaGraduationCap } from 'react-icons/fa'

// ─── Math core ────────────────────────────────────────────────────────────────

function C(n, k) {
    if (k < 0 || k > n) return 0
    if (k === 0 || k === n) return 1
    k = Math.min(k, n - k)
    let result = 1
    for (let i = 0; i < k; i++) {
        result = result * (n - i) / (i + 1)
    }
    return Math.round(result)
}

function computeT(n, s) {
    const absS = Math.abs(s)
    const terms = []
    let total = 0
    for (let q = 0; 2 * q + absS <= n; q++) {
        const p = q + absS
        const cn_p = C(n, p)
        const cn_p_q = C(n - p, q)
        const term = cn_p * cn_p_q
        terms.push({ q, p, cn_p, cn_p_q, term })
        total += term
    }
    return { total, terms }
}

function buildSTable(maxN = 16) {
    const table = []
    for (let n = 0; n <= maxN; n++) {
        table.push(computeT(n, 0).total)
    }
    return table
}

function buildT1Table(maxN = 16) {
    const table = []
    for (let n = 0; n <= maxN; n++) {
        table.push(computeT(n, 1).total)
    }
    return table
}

function pow3(n) {
    let r = 1
    for (let i = 0; i < n; i++) r *= 3
    return r
}

// ─── Problem Types Generator (Using React Nodes) ──────────────────────────────

const PROBLEM_TYPES = [
    {
        id: 'dang-goc',
        label: 'Bài Toán Gốc (Olympic): Tách Nhóm & Điều Kiện Đầu',
        gen(rng) {
            const n = rng.pick([18, 14, 16])
            return { n, type: 'dang-goc' }
        },
        solve(p) {
            const { n } = p
            const half = n / 2
            const sHalf = computeT(half, 0).total
            const tHalf_minus_1 = computeT(half - 1, 1).total
            const L = 2 * tHalf_minus_1
            const C_val = sHalf
            const N = L * C_val
            const mau = pow3(n)
            return { L, C_val, N, mau, half }
        },
        render(p, sol) {
            return {
                problem: (
                    <div className="space-y-2">
                        <p>Xét tất cả các dãy <InlineMath math={`(a_1, a_2, \\ldots, a_{${p.n}})`} />, trong đó mỗi phần tử nhận một trong ba giá trị <InlineMath math="-1, 0, 1" />, thỏa mãn đồng thời ba điều kiện:</p>
                        <ul className="list-decimal pl-6 space-y-1 my-2 font-medium">
                            <li>Phần tử đầu tiên thỏa <InlineMath math="a_1 \neq 0" />.</li>
                            <li>Tổng các phần tử ở vị trí lẻ bằng <InlineMath math="0" />.</li>
                            <li>Tổng các phần tử ở vị trí chẵn bằng <InlineMath math="0" />.</li>
                        </ul>
                        <p>Gọi <InlineMath math="p" /> là xác suất chọn ngẫu nhiên một dãy từ tập tất cả các dãy độ dài <InlineMath math={`${p.n}`} />. Tính số lượng dãy thỏa mãn.</p>
                    </div>
                ),
                analysis: (
                    <div className="space-y-2">
                        <p>Bài toán nhìn phức tạp nhưng trái tim của nó là đếm theo <strong>hai nhóm vị trí độc lập</strong>. Muốn giải gọn, phải tách nhóm lẻ và nhóm chẵn ra trước:</p>
                        <ul className="list-disc pl-5 space-y-1">
                            <li>Nhóm chẵn và lẻ hoàn toàn không liên quan đến nhau.</li>
                            <li>Điều kiện <InlineMath math="a_1 \neq 0" /> chỉ tác động lên nhóm lẻ.</li>
                            <li>Ta sẽ đếm riêng số cách cho nhóm lẻ (gọi là <InlineMath math="|L|" />) và nhóm chẵn (gọi là <InlineMath math="|C|" />). Sau đó nhân lại.</li>
                        </ul>
                    </div>
                ),
                solution: (
                    <div className="space-y-3">
                        <p>Dãy <InlineMath math={String(p.n)} /> phần tử được chia thành 2 nhóm, mỗi nhóm <InlineMath math={String(sol.half)} /> phần tử:</p>
                        <p><strong>Bước 1: Đếm nhóm chẵn (Nhóm C)</strong></p>
                        <p className="pl-4">Nhóm chẵn có <InlineMath math={String(sol.half)} /> phần tử và tổng bằng 0, không có điều kiện gì thêm. Đây chính là hàm <InlineMath math={`S(${sol.half})`} />.</p>
                        <div className="my-1 pl-4"><BlockMath math={`|C| = S(${sol.half}) = ${sol.C_val.toLocaleString()}`} /></div>
                        
                        <p><strong>Bước 2: Đếm nhóm lẻ (Nhóm L)</strong></p>
                        <p className="pl-4">Nhóm lẻ có <InlineMath math={String(sol.half)} /> phần tử, tổng bằng 0, nhưng bắt buộc <InlineMath math="a_1 \neq 0" />.</p>
                        <p className="pl-4">Ta cố định <InlineMath math="a_1" />:</p>
                        <ul className="list-disc pl-10 space-y-1 text-sm">
                            <li>Nếu <InlineMath math="a_1 = 1" />, thì <InlineMath math={String(sol.half - 1)} /> phần tử còn lại có tổng bằng <InlineMath math="-1" />. Có <InlineMath math={`T(${sol.half - 1}, 1)`} /> cách.</li>
                            <li>Nếu <InlineMath math="a_1 = -1" />, thì <InlineMath math={String(sol.half - 1)} /> phần tử còn lại có tổng bằng <InlineMath math="1" />. Có <InlineMath math={`T(${sol.half - 1}, 1)`} /> cách.</li>
                        </ul>
                        <div className="my-1 pl-4"><BlockMath math={`|L| = 2 \\cdot T(${sol.half - 1}, 1) = ${sol.L.toLocaleString()}`} /></div>
                        
                        <p><strong>Bước 3: Kết luận</strong></p>
                        <p>Số dãy thỏa mãn là tích của hai nhóm độc lập:</p>
                        <div className="my-1"><BlockMath math={`N = |L| \\cdot |C| = ${sol.L.toLocaleString()} \\cdot ${sol.C_val.toLocaleString()} = \mathbf{${sol.N.toLocaleString()}}`} /></div>
                    </div>
                )
            }
        }
    },
    {
        id: 'b1-mot-nhom',
        label: 'Biến thể B1: Một Nhóm, Điều Kiện Đầu',
        gen(rng) {
            const n = rng.pick([8, 10, 12, 14])
            return { n, type: 'b1-mot-nhom' }
        },
        solve(p) {
            const { n } = p
            const sn = computeT(n, 0).total
            const sn1 = computeT(n - 1, 0).total
            const N = sn - sn1
            return { n, N, sn, sn1 }
        },
        render(p, sol) {
            return {
                problem: (
                    <div className="space-y-2">
                        <p>Xét các dãy <InlineMath math={`(a_1, \\ldots, a_{${p.n}})`} />, trong đó mỗi phần tử nhận một trong ba giá trị <InlineMath math="-1, 0, 1" />.</p>
                        <p>Điều kiện:</p>
                        <ul className="list-disc pl-5">
                            <li><InlineMath math="a_1 \neq 0" /></li>
                            <li><InlineMath math={`a_1 + a_2 + \\cdots + a_{${p.n}} = 0`} /></li>
                        </ul>
                        <p>Đếm số dãy thỏa mãn.</p>
                    </div>
                ),
                analysis: (
                    <div className="space-y-2">
                        <p>Đây là bài toán đếm dãy có ràng buộc tại một vị trí cụ thể. Ta có thể dùng phương pháp <strong>bù trừ</strong>: đếm tổng số dãy không có ràng kiện <InlineMath math="a_1 \neq 0" />, sau đó trừ đi trường hợp <InlineMath math="a_1 = 0" />.</p>
                    </div>
                ),
                solution: (
                    <div className="space-y-3">
                        <p>Gọi <InlineMath math="S(n)" /> là số dãy độ dài <InlineMath math="n" /> có tổng bằng 0.</p>
                        <p>Số dãy độ dài <InlineMath math={String(p.n)} /> có tổng bằng 0 là <InlineMath math={`S(${p.n}) = ${sol.sn.toLocaleString()}`} />.</p>
                        <p>Trường hợp vi phạm là khi <InlineMath math="a_1 = 0" />. Khi đó <InlineMath math={String(p.n - 1)} /> phần tử còn lại phải có tổng bằng 0. Số lượng dãy vi phạm chính là <InlineMath math={`S(${p.n - 1}) = ${sol.sn1.toLocaleString()}`} />.</p>
                        <p>Vậy số dãy thỏa mãn là phần bù:</p>
                        <div className="my-2"><BlockMath math={`N = S(${p.n}) - S(${p.n - 1}) = ${sol.sn.toLocaleString()} - ${sol.sn1.toLocaleString()} = \mathbf{${sol.N.toLocaleString()}}`} /></div>
                        <p className="text-sm text-slate-500 italic">Cách kiểm tra chéo: Số dãy cũng bằng <InlineMath math={`2 \\cdot T(${p.n - 1}, 1)`} />.</p>
                    </div>
                )
            }
        }
    },
    {
        id: 'b2-le-chan',
        label: 'Biến thể B2: Tách Lẻ/Chẵn, Không Điều Kiện Phụ',
        gen(rng) {
            const n = rng.pick([10, 12, 14, 16])
            return { n, type: 'b2-le-chan' }
        },
        solve(p) {
            const { n } = p
            const half = n / 2
            const sHalf = computeT(half, 0).total
            const N = sHalf * sHalf
            return { n, half, sHalf, N }
        },
        render(p, sol) {
            return {
                problem: (
                    <div className="space-y-2">
                        <p>Dãy <InlineMath math={`(a_1, \\ldots, a_{${p.n}})`} /> với <InlineMath math="a_i \in \{-1, 0, 1\}" /> thỏa mãn:</p>
                        <ul className="list-disc pl-5">
                            <li>Tổng các vị trí lẻ bằng 0.</li>
                            <li>Tổng các vị trí chẵn bằng 0.</li>
                        </ul>
                        <p>Đếm số dãy thỏa mãn.</p>
                    </div>
                ),
                analysis: (
                    <div className="space-y-2">
                        <p>Cấu trúc dãy tách rời hoàn toàn thành hai tập hợp: các vị trí mang chỉ số lẻ và các vị trí mang chỉ số chẵn. Mọi quyết định ở vị trí lẻ không ảnh hưởng đến vị trí chẵn. Ta đếm độc lập rồi dùng quy tắc nhân.</p>
                    </div>
                ),
                solution: (
                    <div className="space-y-3">
                        <p>Dãy có <InlineMath math={String(sol.half)} /> vị trí lẻ và <InlineMath math={String(sol.half)} /> vị trí chẵn.</p>
                        <ul className="list-disc pl-5">
                            <li>Nhóm lẻ có tổng bằng 0, số cách chọn là <InlineMath math={`S(${sol.half}) = ${sol.sHalf.toLocaleString()}`} />.</li>
                            <li>Nhóm chẵn có tổng bằng 0, số cách chọn là <InlineMath math={`S(${sol.half}) = ${sol.sHalf.toLocaleString()}`} />.</li>
                        </ul>
                        <p>Theo quy tắc nhân, tổng số dãy thỏa mãn là:</p>
                        <div className="my-2"><BlockMath math={`N = S(${sol.half})^2 = ${sol.sHalf.toLocaleString()}^2 = \mathbf{${sol.N.toLocaleString()}}`} /></div>
                    </div>
                )
            }
        }
    },
    {
        id: 'b4-le1-chan1',
        label: 'Biến thể B4: Tổng Nhóm Khác Nhau',
        gen(rng) {
            const n = rng.pick([15, 17])
            return { n, type: 'b4-le1-chan1' }
        },
        solve(p) {
            const { n } = p
            const oddCount = Math.ceil(n / 2)
            const evenCount = Math.floor(n / 2)
            const tOdd = computeT(oddCount, 1).total
            const tEven = computeT(evenCount, -1).total
            const N = tOdd * tEven
            return { n, oddCount, evenCount, tOdd, tEven, N }
        },
        render(p, sol) {
            return {
                problem: (
                    <div className="space-y-2">
                        <p>Dãy <InlineMath math={`(a_1, \\ldots, a_{${p.n}})`} /> với <InlineMath math="a_i \in \{-1, 0, 1\}" /> thỏa mãn:</p>
                        <ul className="list-disc pl-5">
                            <li>Tổng các vị trí lẻ bằng 1.</li>
                            <li>Tổng các vị trí chẵn bằng -1.</li>
                        </ul>
                        <p>Đếm số dãy thỏa mãn.</p>
                    </div>
                ),
                analysis: (
                    <div className="space-y-2">
                        <p>Vẫn là kỹ thuật tách nhóm độc lập, nhưng thay vì tổng bằng 0, ta cần tính số dãy có tổng bằng một hằng số <InlineMath math="s \neq 0" />. Lúc này ta sử dụng hàm <InlineMath math="T(n, s)" />.</p>
                    </div>
                ),
                solution: (
                    <div className="space-y-3">
                        <p>Với độ dài <InlineMath math={String(p.n)} />, dãy có <InlineMath math={String(sol.oddCount)} /> vị trí lẻ và <InlineMath math={String(sol.evenCount)} /> vị trí chẵn.</p>
                        <ul className="list-disc pl-5">
                            <li>Nhóm lẻ có tổng bằng 1, số cách là <InlineMath math={`T(${sol.oddCount}, 1) = ${sol.tOdd.toLocaleString()}`} />.</li>
                            <li>Nhóm chẵn có tổng bằng -1. Ta biết rằng đổi dấu không làm thay đổi số cách, nên <InlineMath math={`T(${sol.evenCount}, -1) = T(${sol.evenCount}, 1) = ${sol.tEven.toLocaleString()}`} />.</li>
                        </ul>
                        <p>Quy tắc nhân cho ta tổng số dãy:</p>
                        <div className="my-2"><BlockMath math={`N = ${sol.tOdd.toLocaleString()} \\cdot ${sol.tEven.toLocaleString()} = \mathbf{${sol.N.toLocaleString()}}`} /></div>
                    </div>
                )
            }
        }
    }
]

// ─── Lớp sinh RNG ────────────────────────────────────────────────────────────
class SeededRNG {
    constructor(seed) { this.seed = seed }
    next() {
        this.seed = (this.seed * 9301 + 49297) % 233280
        return this.seed / 233280
    }
    pick(arr) {
        return arr[Math.floor(this.next() * arr.length)]
    }
}

// ─── Bảng tra cứu 컴포넌트 ───────────────────────────────────────────────────
function ReferenceTable() {
    const sTable = useMemo(() => buildSTable(16), [])
    const tTable = useMemo(() => buildT1Table(16), [])

    return (
        <div className="overflow-x-auto rounded-xl border border-slate-200 shadow-sm bg-white">
            <table className="w-full text-sm text-center">
                <thead className="bg-slate-100/80 border-b border-slate-200 text-slate-700">
                    <tr>
                        <th className="p-3 font-semibold border-r border-slate-200">n</th>
                        <th className="p-3 font-semibold border-r border-slate-200">S(n) (Tổng = 0)</th>
                        <th className="p-3 font-semibold border-r border-slate-200">T(n, 1) (Tổng = 1)</th>
                        <th className="p-3 font-semibold text-slate-500">Tổng mẫu 3^n</th>
                    </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                    {sTable.map((val, i) => (
                        <tr key={i} className="hover:bg-slate-50 transition-colors">
                            <td className="p-2 font-medium text-slate-900 border-r border-slate-100">{i}</td>
                            <td className="p-2 text-sky-700 font-medium border-r border-slate-100">{val.toLocaleString()}</td>
                            <td className="p-2 text-teal-700 font-medium border-r border-slate-100">{tTable[i] ? tTable[i].toLocaleString() : '--'}</td>
                            <td className="p-2 text-slate-400">{i <= 10 ? pow3(i).toLocaleString() : '...'}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

// ─── Main Component ───────────────────────────────────────────────────────────
export default function OlympicSequenceStudioPage() {
    const [activeTab, setActiveTab] = useState('theory')

    // State cho tab Thực hành
    const [problemSeed, setProblemSeed] = useState(12345)
    const [selectedType, setSelectedType] = useState(PROBLEM_TYPES[0].id)
    
    // Khởi tạo bài toán
    const problem = useMemo(() => {
        const typeDef = PROBLEM_TYPES.find(t => t.id === selectedType)
        const rng = new SeededRNG(problemSeed)
        const p = typeDef.gen(rng)
        const sol = typeDef.solve(p)
        const rendered = typeDef.render(p, sol)
        return { typeDef, p, sol, rendered }
    }, [selectedType, problemSeed])

    const handleNextProblem = () => {
        setProblemSeed(s => s + 1)
    }

    return (
        <div className="min-h-screen bg-slate-50 p-4 md:p-8 font-sans text-slate-800">
            <div className="max-w-5xl mx-auto space-y-6">
                
                {/* Header */}
                <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-200 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <div className="inline-flex items-center gap-2 px-3 py-1 bg-sky-100 text-sky-700 rounded-full text-xs font-bold uppercase tracking-wider mb-3">
                            <FaChartBar /> Studio Toán Học
                        </div>
                        <h1 className="text-2xl md:text-3xl font-extrabold text-slate-900 tracking-tight">
                            Dãy Âm - Không - Dương
                        </h1>
                        <p className="text-slate-500 mt-2 font-medium">Chuyên đề: Tổng Theo Nhóm & Các Biến Thể Olympic</p>
                    </div>
                </div>

                {/* Tabs */}
                <div className="flex gap-2 overflow-x-auto pb-2">
                    <button
                        onClick={() => setActiveTab('theory')}
                        className={`flex items-center gap-2 px-5 py-2.5 rounded-xl font-semibold transition-all ${
                            activeTab === 'theory' 
                            ? 'bg-sky-600 text-white shadow-md shadow-sky-200' 
                            : 'bg-white text-slate-600 hover:bg-slate-100 border border-slate-200'
                        }`}
                    >
                        <FaBookOpen /> Lý thuyết Sư phạm
                    </button>
                    <button
                        onClick={() => setActiveTab('practice')}
                        className={`flex items-center gap-2 px-5 py-2.5 rounded-xl font-semibold transition-all ${
                            activeTab === 'practice' 
                            ? 'bg-amber-500 text-white shadow-md shadow-amber-200' 
                            : 'bg-white text-slate-600 hover:bg-slate-100 border border-slate-200'
                        }`}
                    >
                        <FaGraduationCap /> Luyện tập Biến thể
                    </button>
                </div>

                {/* Nội dung Tab */}
                {activeTab === 'theory' && (
                    <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                        <div className="lg:col-span-2 space-y-6">
                            <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-200 space-y-4">
                                <h2 className="text-xl font-bold text-sky-800 border-b border-sky-100 pb-2">1. Lõi Tư Duy & Hai Hàm Cơ Bản</h2>
                                <p className="leading-relaxed">
                                    Khi đếm dãy có các phần tử nhận giá trị <InlineMath math="-1, 0, 1" /> và bị ràng buộc bởi <strong>tổng</strong>, ta tuyệt đối không đếm trực tiếp từng dãy thô. Ta dùng hai hàm cốt lõi sau:
                                </p>
                                
                                <div className="bg-sky-50 rounded-xl p-4 border border-sky-100 space-y-3">
                                    <div className="font-bold text-sky-900 flex items-center gap-2">
                                        <div className="w-2 h-2 rounded-full bg-sky-500"></div>
                                        Hàm S(n): Số dãy độ dài n có tổng bằng 0
                                    </div>
                                    <BlockMath math="S(n) = \sum_{k=0}^{\lfloor n/2 
floor} C_n^{2k} \\cdot C_{2k}^k" />
                                    <p className="text-sm text-sky-800">Ý nghĩa: Chọn 2k vị trí khác 0, sau đó chia làm hai nửa: k vị trí cho (+1) và k vị trí cho (-1).</p>
                                </div>

                                <div className="bg-teal-50 rounded-xl p-4 border border-teal-100 space-y-3 mt-4">
                                    <div className="font-bold text-teal-900 flex items-center gap-2">
                                        <div className="w-2 h-2 rounded-full bg-teal-500"></div>
                                        Hàm T(n, s): Số dãy độ dài n có tổng bằng s (s ≥ 0)
                                    </div>
                                    <BlockMath math="T(n, s) = \sum_{q=0}^{\lfloor (n-s)/2 
floor} C_n^{q+s} \\cdot C_{n-q-s}^q" />
                                    <p className="text-sm text-teal-800">Ý nghĩa: Gọi q là số lượng số (-1), thì số lượng số (+1) bắt buộc là q+s. Chọn vị trí cho chúng.</p>
                                </div>
                            </div>
                        </div>

                        <div className="lg:col-span-1">
                            <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-200 h-full">
                                <h3 className="font-bold text-slate-800 mb-4 border-b border-slate-100 pb-2">Bảng Tra Cứu Nhanh</h3>
                                <ReferenceTable />
                                <p className="text-xs text-slate-500 mt-4 leading-relaxed">
                                    <strong>Mẹo phòng thi:</strong> Nhiều bài toán nâng cao chỉ yêu cầu học sinh nhận diện đúng dạng và truy xuất kết quả bảng này thay vì phải tự thiết lập lại tổng. Nhớ S(8)=1107, S(9)=3139 giúp giải bài Olympic cực nhanh.
                                </p>
                            </div>
                        </div>
                    </div>
                )}

                {activeTab === 'practice' && (
                    <div className="grid grid-cols-1 lg:grid-cols-4 gap-6">
                        {/* Cột trái: Điều hướng */}
                        <div className="lg:col-span-1 space-y-3">
                            <div className="bg-white rounded-xl shadow-sm border border-slate-200 overflow-hidden">
                                <div className="bg-slate-50 px-4 py-3 border-b border-slate-200 font-bold text-slate-700">
                                    Dạng bài tập
                                </div>
                                <div className="p-2 space-y-1">
                                    {PROBLEM_TYPES.map(type => (
                                        <button
                                            key={type.id}
                                            onClick={() => {
                                                setSelectedType(type.id)
                                                setProblemSeed(12345)
                                            }}
                                            className={`w-full text-left px-3 py-2.5 rounded-lg text-sm font-medium transition-colors ${
                                                selectedType === type.id
                                                ? 'bg-amber-100 text-amber-900 shadow-sm'
                                                : 'text-slate-600 hover:bg-slate-100'
                                            }`}
                                        >
                                            {type.label}
                                        </button>
                                    ))}
                                </div>
                            </div>
                            
                            <button
                                onClick={handleNextProblem}
                                className="w-full py-3 bg-white border-2 border-slate-200 rounded-xl font-bold text-slate-600 hover:border-slate-300 hover:bg-slate-50 transition-all flex items-center justify-center gap-2"
                            >
                                <FaRandom /> Đổi số liệu mới
                            </button>
                        </div>

                        {/* Cột phải: Đề và giải */}
                        <div className="lg:col-span-3 space-y-6">
                            
                            {/* Khung đề bài */}
                            <div className="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
                                <div className="bg-sky-50 px-6 py-4 border-b border-sky-100 flex justify-between items-center">
                                    <h3 className="font-bold text-sky-900 text-lg">Đề bài</h3>
                                    <div className="px-3 py-1 bg-white rounded-full text-xs font-bold text-sky-600 border border-sky-200">
                                        Seed: {problemSeed}
                                    </div>
                                </div>
                                <div className="p-6 text-slate-800 leading-relaxed text-lg">
                                    {problem.rendered.problem}
                                </div>
                            </div>

                            {/* Khung lời giải sư phạm */}
                            <div className="bg-white rounded-2xl shadow-sm border border-amber-200 overflow-hidden relative">
                                <div className="absolute top-0 left-0 w-1 h-full bg-amber-400"></div>
                                <div className="bg-amber-50 px-6 py-4 border-b border-amber-100">
                                    <h3 className="font-bold text-amber-900 text-lg flex items-center gap-2">
                                        <FaGraduationCap className="text-amber-600" />
                                        Phân tích & Lời giải Sư phạm
                                    </h3>
                                </div>
                                <div className="p-6 space-y-6">
                                    
                                    {/* Phân tích */}
                                    <div className="bg-blue-50/50 rounded-xl p-5 border border-blue-100">
                                        <div className="font-bold text-blue-800 mb-3 text-base flex items-center gap-2">
                                            💡 Hướng suy nghĩ:
                                        </div>
                                        <div className="text-slate-700 leading-relaxed">
                                            {problem.rendered.analysis}
                                        </div>
                                    </div>

                                    {/* Lời giải */}
                                    <div>
                                        <div className="font-bold text-slate-800 mb-3 border-b border-slate-100 pb-2">
                                            Chi tiết các bước đếm:
                                        </div>
                                        <div className="text-slate-700 leading-relaxed">
                                            {problem.rendered.solution}
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                )}
            </div>
        </div>
    )
}
