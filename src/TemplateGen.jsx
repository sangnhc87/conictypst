import React, { useState, useMemo } from 'react'
import './TemplateGen.css'

// ─────────────────────────────────────────────────────────
// Pure-JS stored ZIP builder
// ─────────────────────────────────────────────────────────
function u16(n) { return new Uint8Array([n & 0xff, (n >> 8) & 0xff]) }
function u32(n) { return new Uint8Array([n & 0xff, (n >> 8) & 0xff, (n >> 16) & 0xff, (n >> 24) & 0xff]) }
function cat(...arrs) {
    const len = arrs.reduce((s, a) => s + a.length, 0)
    const out = new Uint8Array(len)
    let off = 0
    for (const a of arrs) { out.set(a, off); off += a.length }
    return out
}
function crc32(data) {
    const t = new Uint32Array(256)
    for (let i = 0; i < 256; i++) {
        let c = i
        for (let j = 0; j < 8; j++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1
        t[i] = c
    }
    let crc = 0xffffffff
    for (const b of data) crc = (crc >>> 8) ^ t[(crc ^ b) & 0xff]
    return (crc ^ 0xffffffff) >>> 0
}

function makeZip(files) {
    const enc = new TextEncoder()
    const locals = [], dirs = []
    let offset = 0
    for (const [path, content] of Object.entries(files)) {
        const name = enc.encode(path)
        const data = typeof content === 'string' ? enc.encode(content) : content
        const crc = crc32(data)
        const sz = data.length
        const local = cat(
            new Uint8Array([0x50, 0x4b, 0x03, 0x04]),
            u16(20), u16(0), u16(0), u16(0), u16(0),
            u32(crc), u32(sz), u32(sz),
            u16(name.length), u16(0), name, data,
        )
        const dir = cat(
            new Uint8Array([0x50, 0x4b, 0x01, 0x02]),
            u16(20), u16(20), u16(0), u16(0), u16(0), u16(0),
            u32(crc), u32(sz), u32(sz),
            u16(name.length), u16(0), u16(0), u16(0), u16(0), u32(0), u32(offset), name,
        )
        locals.push(local); dirs.push(dir); offset += local.length
    }
    const cdOff = offset
    const cdSz = dirs.reduce((s, d) => s + d.length, 0)
    const n = Object.keys(files).length
    const eocd = cat(
        new Uint8Array([0x50, 0x4b, 0x05, 0x06]),
        u16(0), u16(0), u16(n), u16(n), u32(cdSz), u32(cdOff), u16(0),
    )
    return cat(...locals, ...dirs, eocd)
}

function downloadZip(files, zipName) {
    const bytes = makeZip(files)
    const blob = new Blob([bytes], { type: 'application/zip' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = zipName
    a.click()
    URL.revokeObjectURL(url)
}

// ─────────────────────────────────────────────────────────
// Template definitions — grouped by category
// ─────────────────────────────────────────────────────────
const TEMPLATES = [
    // ── Đề & Kiểm Tra ──────────────────────────────────────
    {
        id: 'exam',
        category: 'dethi',
        icon: '📝',
        label: 'Đề Thi',
        desc: 'Đề thi THPT: header chuẩn Bộ GD, đáp án, barem, phiếu trả lời',
        fields: [
            { key: 'title', label: 'Tên kỳ thi', placeholder: 'ĐỀ THI THỬ THPT QUỐC GIA 2026', required: true },
            { key: 'school', label: 'Trường', placeholder: 'TRƯỜNG THPT CHUYÊN ABC', required: true },
            { key: 'dept', label: 'Sở GD', placeholder: 'SỞ GD&ĐT THÀNH PHỐ HỒ CHÍ MINH' },
            { key: 'subject', label: 'Môn thi', placeholder: 'TOÁN - LỚP 12' },
            { key: 'duration', label: 'Thời gian', placeholder: '90 phút' },
            { key: 'code', label: 'Mã đề', placeholder: '101' },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
            {
                key: 'parts', label: 'Cấu trúc', type: 'select',
                options: [
                    { v: 'tn+ds+tln', l: 'TN + Đúng/Sai + Điền số' },
                    { v: 'tn+tl', l: 'TN + Tự luận' },
                    { v: 'tn-only', l: 'Toàn trắc nghiệm' },
                ]
            },
        ],
        color: '#0057b8',
        docType: 'exam',
    },
    {
        id: 'bode',
        category: 'dethi',
        icon: '🗂️',
        label: 'Bộ Đề',
        desc: 'Nhiều đề thi kèm đáp án, ma trận & barem',
        fields: [
            { key: 'title', label: 'Tên bộ đề', placeholder: 'Bộ 5 Đề Thi Thử THPT 2026', required: true },
            { key: 'author', label: 'Tác giả', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'nde', label: 'Số đề', placeholder: '5', type: 'number' },
            { key: 'subject', label: 'Môn thi', placeholder: 'Toán 12' },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
        ],
        color: '#117A65',
        docType: 'bo-de',
    },
    {
        id: 'hsg',
        category: 'dethi',
        icon: '🏆',
        label: 'Thi HSG / Olympic',
        desc: 'Đề học sinh giỏi: bài tự luận, thang điểm',
        fields: [
            { key: 'title', label: 'Tên kỳ thi', placeholder: 'KỲ THI HỌC SINH GIỎI TOÁN 12', required: true },
            { key: 'school', label: 'Trường / Sở', placeholder: 'SỞ GD&ĐT TỈNH ABC', required: true },
            { key: 'subject', label: 'Môn thi', placeholder: 'TOÁN' },
            { key: 'grade', label: 'Lớp', placeholder: '12' },
            { key: 'duration', label: 'Thời gian', placeholder: '150 phút' },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
            { key: 'nprob', label: 'Số bài', placeholder: '5', type: 'number' },
        ],
        color: '#92400e',
        docType: 'exam',
    },
    {
        id: 'worksheet',
        category: 'dethi',
        icon: '📄',
        label: 'Phiếu Bài Tập',
        desc: 'Phiếu in: ô điền tên, bài tập số hóa',
        fields: [
            { key: 'title', label: 'Tiêu đề', placeholder: 'PHIẾU BÀI TẬP SỐ 3: HÀM SỐ', required: true },
            { key: 'subject', label: 'Môn / Lớp', placeholder: 'Toán 12' },
            { key: 'chapter', label: 'Chương', placeholder: 'Chương 1: Hàm Số' },
            { key: 'duration', label: 'Thời gian', placeholder: '45 phút' },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
            { key: 'nex', label: 'Số bài', placeholder: '10', type: 'number' },
            { key: 'author', label: 'GV ra đề', placeholder: 'Nguyễn Văn A' },
        ],
        color: '#0369a1',
        docType: 'book',
    },
    // ── Chuyên Đề & Tài Liệu ───────────────────────────────
    {
        id: 'chuyende',
        category: 'chuyende',
        icon: '📐',
        label: 'Chuyên Đề',
        desc: 'Chuyên đề Toán: lý thuyết, ví dụ, bài tập phân dạng',
        fields: [
            { key: 'title', label: 'Tên chuyên đề', placeholder: 'Thiết Diện Parabol Của Hình Nón', required: true },
            { key: 'subtitle', label: 'Phụ đề', placeholder: 'Vận dụng cao THPT QG 2026' },
            { key: 'author', label: 'Tác giả', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'subject', label: 'Môn / Lớp', placeholder: 'Toán 12' },
            { key: 'series', label: 'Bộ tài liệu', placeholder: 'Bộ Chuyên Đề Hình Học' },
            { key: 'cdnum', label: 'Số chuyên đề', placeholder: '07' },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
            {
                key: 'mode', label: 'Chế độ', type: 'select',
                options: [{ v: 'loigiai', l: 'Có lời giải' }, { v: 'dethi', l: 'Đề thi (ẩn lời giải)' }]
            },
        ],
        color: '#1A5276',
        docType: 'chuyende',
    },
    {
        id: 'decuong',
        category: 'chuyende',
        icon: '📋',
        label: 'Đề Cương Ôn Tập',
        desc: 'Đề cương: lý thuyết trọng tâm, phân dạng, công thức',
        fields: [
            { key: 'title', label: 'Tiêu đề', placeholder: 'ĐỀ CƯƠNG ÔN TẬP HKII TOÁN 12', required: true },
            { key: 'subject', label: 'Môn / Lớp', placeholder: 'Toán 12' },
            { key: 'author', label: 'GV biên soạn', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
            { key: 'school', label: 'Trường', placeholder: 'THPT ABC' },
            { key: 'ntopic', label: 'Số chủ đề', placeholder: '5', type: 'number' },
        ],
        color: '#0b5653',
        docType: 'book',
    },
    {
        id: 'tomtat',
        category: 'chuyende',
        icon: '⚡',
        label: 'Tóm Tắt / Công Thức',
        desc: 'Bảng tóm tắt lý thuyết, cheat-sheet in được',
        fields: [
            { key: 'title', label: 'Tiêu đề', placeholder: 'BẢNG CÔNG THỨC LƯỢNG GIÁC', required: true },
            { key: 'subject', label: 'Môn / Lớp', placeholder: 'Toán 12' },
            { key: 'author', label: 'Tác giả', placeholder: 'Nguyễn Văn A' },
            { key: 'year', label: 'Năm', placeholder: '2026' },
        ],
        color: '#c2410c',
        docType: 'book',
    },
    {
        id: 'book',
        category: 'chuyende',
        icon: '📚',
        label: 'Sách / Tài Liệu',
        desc: 'Tài liệu tham khảo, sách bài tập nhiều chương',
        fields: [
            { key: 'title', label: 'Tên tài liệu', placeholder: 'Toán Nâng Cao THPT', required: true },
            { key: 'subtitle', label: 'Phụ đề', placeholder: 'Hình học không gian và giải tích' },
            { key: 'author', label: 'Tác giả', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'publisher', label: 'NXB', placeholder: 'NXB Giáo Dục' },
            { key: 'year', label: 'Năm', placeholder: '2026' },
            { key: 'nchapter', label: 'Số chương', placeholder: '5', type: 'number' },
        ],
        color: '#B7410E',
        docType: 'book',
    },
    // ── Giảng Dạy & Báo Cáo ───────────────────────────────
    {
        id: 'giaoandientu',
        category: 'giaoduc',
        icon: '🎯',
        label: 'Giáo Án Điện Tử',
        desc: 'Giáo án chuẩn: mục tiêu, tiến trình, hoạt động',
        fields: [
            { key: 'title', label: 'Tên bài dạy', placeholder: 'Bài 5: Ứng dụng tích phân', required: true },
            { key: 'subject', label: 'Môn học', placeholder: 'Toán 12' },
            { key: 'grade', label: 'Khối lớp', placeholder: '12' },
            { key: 'duration', label: 'Số tiết', placeholder: '2 tiết' },
            { key: 'school', label: 'Trường', placeholder: 'THPT ABC' },
            { key: 'author', label: 'GV soạn', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
        ],
        color: '#065f46',
        docType: 'book',
    },
    {
        id: 'beamer',
        category: 'giaoduc',
        icon: '🎞️',
        label: 'Slide Bài Giảng',
        desc: 'Trình chiếu Beamer: tiêu đề, nội dung, ví dụ',
        fields: [
            { key: 'title', label: 'Tên bài giảng', placeholder: 'Hàm Số Và Ứng Dụng', required: true },
            { key: 'subtitle', label: 'Phụ đề', placeholder: 'Chương 1 – Toán 12' },
            { key: 'author', label: 'Tác giả / GV', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'institute', label: 'Đơn vị', placeholder: 'THPT Chuyên ABC' },
            { key: 'subject', label: 'Môn học', placeholder: 'Toán 12' },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
            { key: 'nframe', label: 'Số frame', placeholder: '8', type: 'number' },
        ],
        color: '#4c1d95',
        docType: 'book',
    },
    {
        id: 'research',
        category: 'giaoduc',
        icon: '🔬',
        label: 'Nghiên Cứu / NCKH',
        desc: 'Bài báo khoa học: tóm tắt, từ khóa, 2 cột, references',
        fields: [
            { key: 'title', label: 'Tiêu đề', placeholder: 'Phân tích thiết diện conic', required: true },
            { key: 'author', label: 'Tác giả', placeholder: 'Nguyễn Văn A, Trần Thị B', required: true },
            { key: 'abstract', label: 'Tóm tắt', placeholder: 'Bài báo này nghiên cứu...', type: 'textarea' },
            { key: 'keywords', label: 'Từ khóa', placeholder: 'hình nón, parabol' },
            { key: 'journal', label: 'Tạp chí', placeholder: 'Tạp chí Toán học' },
        ],
        color: '#5B2C8D',
        docType: 'research',
    },
    {
        id: 'luanvan',
        category: 'giaoduc',
        icon: '📖',
        label: 'Luận Văn / KLTN',
        desc: 'Khóa luận, luận văn: bìa, tóm tắt, mục lục, chương',
        fields: [
            { key: 'title', label: 'Tên đề tài', placeholder: 'Nghiên cứu ứng dụng Typst', required: true },
            { key: 'author', label: 'Sinh viên', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'advisor', label: 'GVHD', placeholder: 'PGS.TS. Trần Thị B', required: true },
            { key: 'university', label: 'Trường ĐH', placeholder: 'ĐHQG TP.HCM' },
            { key: 'dept', label: 'Khoa / Ngành', placeholder: 'Khoa Toán – Tin' },
            {
                key: 'degree', label: 'Bậc đào tạo', type: 'select',
                options: [
                    { v: 'dh', l: 'Đại học (KLTN)' },
                    { v: 'ths', l: 'Thạc sĩ' },
                    { v: 'ts', l: 'Tiến sĩ' },
                ]
            },
            { key: 'year', label: 'Năm', placeholder: '2026' },
        ],
        color: '#1f2937',
        docType: 'book',
    },
    {
        id: 'sangkien',
        category: 'giaoduc',
        icon: '💡',
        label: 'SKKN / Sáng Kiến',
        desc: 'Sáng kiến kinh nghiệm: thực trạng, giải pháp, kết quả',
        fields: [
            { key: 'title', label: 'Tên sáng kiến', placeholder: 'Ứng dụng CAS vào dạy học Toán', required: true },
            { key: 'author', label: 'Tác giả', placeholder: 'Nguyễn Văn A', required: true },
            { key: 'school', label: 'Đơn vị', placeholder: 'THPT ABC, Tỉnh XYZ' },
            { key: 'subject', label: 'Môn dạy', placeholder: 'Toán' },
            { key: 'grade', label: 'Khối lớp', placeholder: '10, 11, 12' },
            { key: 'year', label: 'Năm học', placeholder: '2025 – 2026' },
        ],
        color: '#166534',
        docType: 'book',
    },
]

const CATEGORIES = [
    { id: 'all', label: 'Tất cả' },
    { id: 'dethi', label: 'Đề & Kiểm Tra' },
    { id: 'chuyende', label: 'Chuyên Đề & Tài Liệu' },
    { id: 'giaoduc', label: 'Giảng Dạy & Báo Cáo' },
]

const CAT_LABELS = {
    dethi: 'Đề & Kiểm Tra',
    chuyende: 'Chuyên Đề',
    giaoduc: 'Giảng Dạy',
}
function getCatLabel(cat) { return CAT_LABELS[cat] || cat }

// ─────────────────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────────────────
function slug(str) {
    return (str || 'tai-lieu')
        .normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .replace(/đ/gi, 'd')
        .replace(/[^a-zA-Z0-9\s-]/g, '')
        .trim()
        .replace(/\s+/g, '-')
        .substring(0, 60)
}

function darkenColor(hex, amount) {
    let r = parseInt(hex.slice(1, 3), 16)
    let g = parseInt(hex.slice(3, 5), 16)
    let b = parseInt(hex.slice(5, 7), 16)
    r = Math.max(0, Math.floor(r * (1 - amount)))
    g = Math.max(0, Math.floor(g * (1 - amount)))
    b = Math.max(0, Math.floor(b * (1 - amount)))
    return `#${r.toString(16).padStart(2, '0')}${g.toString(16).padStart(2, '0')}${b.toString(16).padStart(2, '0')}`
}

// ─────────────────────────────────────────────────────────
// File content generators — using REAL template.typ system
// ─────────────────────────────────────────────────────────
function generateFiles(tpl, form) {
    const g = (k, fallback = '') => form[k] || fallback
    const files = {}

    if (tpl.id === 'exam') {
        const name = g('title', 'Đề Thi')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genExam(g, name)
        files[`${fname}/README.md`] = genReadme('exam', name, g)
    } else if (tpl.id === 'bode') {
        const name = g('title', 'Bo-De')
        const fname = slug(name)
        const n = parseInt(g('nde', '3'), 10) || 3
        files[`${fname}/main.typ`] = genBode(g, name, n)
        for (let i = 1; i <= n; i++) {
            files[`${fname}/de-${i}.typ`] = genBodeDe(g, i)
        }
        files[`${fname}/README.md`] = genReadme('bode', name, g)
    } else if (tpl.id === 'chuyende') {
        const name = g('title', 'Chuyên Đề')
        const fname = `CD-${slug(name)}`
        files[`${fname}/main.typ`] = genChuyende(g, name)
        files[`${fname}/figures/.gitkeep`] = ''
        files[`${fname}/README.md`] = genReadme('chuyende', name, g)
    } else if (tpl.id === 'book') {
        const name = g('title', 'Tai-Lieu')
        const fname = slug(name)
        const n = parseInt(g('nchapter', '3'), 10) || 3
        files[`${fname}/main.typ`] = genBook(g, name, n)
        for (let i = 1; i <= n; i++) {
            files[`${fname}/chapters/chuong-${i}.typ`] = genChapter(g, i)
        }
        files[`${fname}/figures/.gitkeep`] = ''
        files[`${fname}/README.md`] = genReadme('book', name, g)
    } else if (tpl.id === 'hsg') {
        const name = g('title', 'De-HSG')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genHSG(g, name)
        files[`${fname}/README.md`] = genReadme('hsg', name, g)
    } else if (tpl.id === 'worksheet') {
        const name = g('title', 'Phieu-Bai-Tap')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genWorksheet(g, name)
        files[`${fname}/README.md`] = genReadme('worksheet', name, g)
    } else if (tpl.id === 'decuong') {
        const name = g('title', 'De-Cuong')
        const fname = slug(name)
        const n = parseInt(g('ntopic', '4'), 10) || 4
        files[`${fname}/main.typ`] = genDecuong(g, name, n)
        files[`${fname}/README.md`] = genReadme('decuong', name, g)
    } else if (tpl.id === 'tomtat') {
        const name = g('title', 'Tom-Tat')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genTomtat(g, name)
        files[`${fname}/README.md`] = genReadme('tomtat', name, g)
    } else if (tpl.id === 'giaoandientu') {
        const name = g('title', 'Giao-An')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genGiaoAn(g, name)
        files[`${fname}/README.md`] = genReadme('giaoandientu', name, g)
    } else if (tpl.id === 'beamer') {
        const name = g('title', 'Slide')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genBeamer(g, name)
        files[`${fname}/figures/.gitkeep`] = ''
        files[`${fname}/README.md`] = genReadme('beamer', name, g)
    } else if (tpl.id === 'research') {
        const name = g('title', 'Bai-Bao')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genResearch(g, name)
        files[`${fname}/references.bib`] = genBib()
        files[`${fname}/README.md`] = genReadme('research', name, g)
    } else if (tpl.id === 'luanvan') {
        const name = g('title', 'Luan-Van')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genLuanVan(g, name)
        files[`${fname}/references.bib`] = genBib()
        files[`${fname}/README.md`] = genReadme('luanvan', name, g)
    } else if (tpl.id === 'sangkien') {
        const name = g('title', 'SKKN')
        const fname = slug(name)
        files[`${fname}/main.typ`] = genSangKien(g, name)
        files[`${fname}/README.md`] = genReadme('sangkien', name, g)
    }

    return files
}

// ═══════════════════════════════════════════════════════════
// EXAM — uses stexgv-doc router (doc-type: "exam")
// ═══════════════════════════════════════════════════════════
function genExam(g, name) {
    const parts = g('parts', 'tn+ds+tln')
    const hasDS = parts.includes('ds')
    const hasTLN = parts.includes('tln')
    const hasTL = parts.includes('tl')
    const dept = g('dept', 'BỘ GIÁO DỤC VÀ ĐÀO TẠO')
    const school = g('school', 'TRƯỜNG THPT CHUYÊN ABC')
    const subject = g('subject', 'TOÁN - LỚP 12')
    const duration = g('duration', '90 phút')
    const code = g('code', '101')
    const year = g('year', '2025 – 2026')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-doc hệ thống
// Biên dịch: typst compile --root .. main.typ
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── CHẾ ĐỘ ĐỀ ────────────────────────────────────────────
// Đổi "dethi" → "loigiai" để có lời giải. "solcolor" để tô màu đáp án.
#let mode   = "dethi"
#let accent = classic.blue

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup.with(math-color: accent)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ── TIÊU ĐỀ ĐỀ THI (show rule) ───────────────────────────
#show: stexgv-doc.with(
  doc-type: "exam",
  title: "${name}",
  subject: "${subject}",
  department: "${dept}",
  school: "${school}",
  duration: "${duration}",
  code: "${code}",
  academic-year: "${year}",
  theme-color: accent,
  show-topbar: true,
  header-border: true,
)

// ═══════════════════════════════════════════════════════════
// PHẦN I — TRẮC NGHIỆM NHIỀU LỰA CHỌN (18 câu · 7,2 điểm)
// ═══════════════════════════════════════════════════════════
#exam-part[Phần I. *Trắc nghiệm nhiều lựa chọn.* \
  Thí sinh trả lời từ câu 1 đến câu 18. \
  Mỗi câu thí sinh chỉ chọn **một** phương án.]

// ── Câu 1 — NB · Hàm số ──────────────────────────────────
#tn(
  [Đề bài câu 1... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 2 — TH · Đạo hàm ────────────────────────────────
#tn(
  [Đề bài câu 2... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (2,),
)

// ── Câu 3 ────────────────────────────────────────────────
#tn(
  [Đề bài câu 3... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 4 ────────────────────────────────────────────────
#tn(
  [Đề bài câu 4... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 5 ────────────────────────────────────────────────
#tn(
  [Đề bài câu 5... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 6 ────────────────────────────────────────────────
#tn(
  [Đề bài câu 6... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 7 ────────────────────────────────────────────────
#tn(
  [Đề bài câu 7... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 8 ────────────────────────────────────────────────
#tn(
  [Đề bài câu 8... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 9 ────────────────────────────────────────────────
#tn(
  [Đề bài câu 9... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 10 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 10... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 11 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 11... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 12 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 12... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 13 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 13... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 14 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 14... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 15 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 15... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 16 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 16... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 17 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 17... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ── Câu 18 ───────────────────────────────────────────────
#tn(
  [Đề bài câu 18... *(thay nội dung thực tế)*],
  ([A], [B], [C], [D]),
  correct: (1,),
)
${hasDS ? `
// ═══════════════════════════════════════════════════════════
// PHẦN II — CÂU ĐÚNG / SAI (4 câu · 4 điểm)
// ═══════════════════════════════════════════════════════════
#exam-part[Phần II. *Câu trắc nghiệm đúng sai.* \
  Thí sinh trả lời từ câu 1 đến câu 4. \
  Mỗi câu có **4 ý** a), b), c), d). \
  Ghi \u0110 (Đúng) hoặc S (Sai) cho từng ý.]

// ── Câu 1 (19) ───────────────────────────────────────────
#ds(
  [Cho hàm số $f(x) = x^2 - 2x + 3$ xác định trên $RR$. \
   Xét tính đúng sai của các mệnh đề sau:],
  (
    [Đồ thị hàm số có trục đối xứng $x = 1$.],
    True([Giá trị nhỏ nhất của hàm số trên $RR$ bằng $2$.]),
    [Hàm số đồng biến trên $(1;+oo)$.],
    True([$f(0) + f(2) = 4$.]),
  ),
)

// ── Câu 2 (20) ───────────────────────────────────────────
#ds(
  [Trong không gian $O x y z$, cho mặt phẳng \
   $(P): 2x - y + 2z - 6 = 0$. \
   Xét tính đúng sai của các mệnh đề sau:],
  (
    True([$(P)$ có vector pháp tuyến $arrow(n)(2;-1;2)$.]),
    [Khoảng cách từ $O$ đến $(P)$ bằng $2$.],
    True([$(P)$ song song với mặt phẳng $4x - 2y + 4z = 0$.]),
    [$(P)$ cắt trục $O x$ tại điểm $(0;0;3)$.]),
  ),
)

// ── Câu 3 (21) ───────────────────────────────────────────
#ds(
  [Cho cấp số cộng $(u_n)$ với $u_1 = 3$ và công sai $d = 2$. \
   Xét tính đúng sai của các mệnh đề:],
  (
    True([$u_5 = 11$.]),
    [$u_{10} = 20$.],
    True([Tổng $S_5 = u_1 + cdots + u_5 = 35$.]),
    [$u_n > 0$ với mọi $n$.],
  ),
)

// ── Câu 4 (22) ───────────────────────────────────────────
#ds(
  [Cho hình chóp $S.ABCD$ có đáy $ABCD$ là hình vuông cạnh $a$, \
   $SA$ vuông góc với đáy và $SA = a sqrt(2)$. \
   Xét tính đúng sai của các mệnh đề:],
  (
    True([$BD$ vuông góc với $(SAC)$.]),
    [Góc giữa $SC$ và $(ABCD)$ bằng $30^o$.],
    True([Khoảng cách từ $A$ đến $(SBD)$ bằng $a/3$.],
    [Thể tích khối chóp $S.ABCD$ bằng $a^3 sqrt(2)$.]),
  ),
)
` : ''}${hasTLN ? `
// ═══════════════════════════════════════════════════════════
// PHẦN III — TRẢ LỜI NGẮN (2 câu · 1,0 điểm)
// ═══════════════════════════════════════════════════════════
#exam-part[Phần III. *Câu trắc nghiệm trả lời ngắn.* \
  Thí sinh trả lời từ câu 1 đến câu 2. \
  Mỗi câu ghi kết quả vào ô đáp số (dạng số).]

// ── Câu 1 (23) ───────────────────────────────────────────
#tln(
  [Tìm giá trị lớn nhất của hàm số $f(x) = -x^2 + 4x - 3$ trên $RR$.],
  $1$,
)

// ── Câu 2 (24) ───────────────────────────────────────────
#tln(
  [Cho $log_2 a = 3$ và $log_2 b = 5$. \
   Tính $log_2 (a^2 b) - log_2 (a b^3)$. *(Làm tròn đến hàng đơn vị)*],
  $-4$,
)
` : ''}${hasTL ? `
// ═══════════════════════════════════════════════════════════
// PHẦN IV — TỰ LUẬN (1 câu · 1,0 điểm)
// ═══════════════════════════════════════════════════════════
#exam-part[Phần IV. *Tự luận.* \
  Thí sinh trình bày lời giải chi tiết.]

// ── Câu 1 (25) ───────────────────────────────────────────
#tl(
  [Cho hàm số $f(x) = x^3 - 3x^2 + mx + 1$ với $m$ là tham số. \
   Tìm $m$ để hàm số có hai điểm cực trị $x_1, x_2$ sao cho \
   $x_1^2 + x_2^2 = 6$.],
  lines: 8,
)
` : ''}

// ═══════════════════════════════════════════════════════════
// HẾT ĐỀ
// ═══════════════════════════════════════════════════════════
#het

// ── BẢNG ĐÁP ÁN ──────────────────────────────────────────
#pagebreak()
#v(2cm)
#print-answer-key()

// ── BAREM CHẤM ĐIỂM ──────────────────────────────────────
#pagebreak()
#barem(
  (
    ("Trắc nghiệm", 1,  18, [0.4],   [Mỗi câu đúng 0.4 điểm]),
    ${hasDS ? '("Đúng/Sai",   19, 22, [1.0],   [a: 0.1 · b: 0.25 · c: 0.5 · d: 1.0]),' : ''}
    ${hasTLN ? '("Điền số",    23, 24, [0.5],   [Mỗi câu đúng 0.5 điểm]),' : ''}
    ${hasTL ? '("Tự luận",    25, 25, [1.0],   [Theo thang điểm chi tiết]),' : ''}
  ),
  total: 10,
)

// ── PHIẾU TRẢ LỜI ────────────────────────────────────────
#pagebreak()
#answer-sheet(n-questions: 18, n-cols: 5)
`
}

// ═══════════════════════════════════════════════════════════
// CHUYÊN ĐỀ — uses stexgv-book router (doc-type: "chuyende")
// ═══════════════════════════════════════════════════════════
function genChuyende(g, name) {
    const mode = g('mode', 'loigiai')
    const author = g('author', 'Tác giả')
    const subject = g('subject', 'Toán')
    const year = g('year', '2025 – 2026')
    const series = g('series', '')
    const cdnum = g('cdnum', '')
    const subtitle = g('subtitle', 'Lý thuyết · Ví dụ · Bài tập phân dạng')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-book
// Biên dịch: typst compile --root .. main.typ
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

// ── CHẾ ĐỘ HIỂN THỊ ──────────────────────────────────────
// "loigiai" = có lời giải + hộp sư phạm (khuyên dùng cho chuyên đề)
// "dethi"   = ẩn lời giải (in đề cho học sinh tự làm)
#let mode   = "${mode}"
#let accent = classic.blue

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup.with(math-color: accent)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ── BÌA CHUYÊN ĐỀ ────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "chuyende",
  title: "${name}",
  subtitle: [${subtitle}],
  author: "${author}",
  subject: "${subject}",
  grade: "12",
${series ? `  series: "${series}",` : ''}${cdnum ? `  cd-number: "${cdnum}",` : ''}
  academic-year: "${year}",
  theme-color: accent,
)

// ═══════════════════════════════════════════════════════════
= Lý Thuyết Nền Tảng
// ═══════════════════════════════════════════════════════════

#muctieu[
  Sau khi học xong chuyên đề này, học sinh có thể:
  - *Kiến thức:* Nắm vững định nghĩa, định lý, công thức cốt lõi.
  - *Kỹ năng:* Vận dụng thành thạo vào giải bài tập trắc nghiệm và tự luận.
  - *Thái độ:* Tự tin khi gặp dạng toán này trong đề thi THPT QG.
]

#lythuyet[
  *Định nghĩa:* ... *(ghi định nghĩa chính thức của khái niệm)*

  *Phân loại:* Có #strong[3] trường hợp cần nhớ:
  - Trường hợp 1: ...
  - Trường hợp 2: ...
  - Trường hợp 3: ...

  *Công thức cốt lõi:* $f(x) = ...$
]

#phuongphap[
  *Quy trình giải chuẩn (3 bước):*
  #step[Bước 1: Xác định dạng bài và các đại lượng đã biết.]
  #step[Bước 2: Áp dụng công thức / định lý phù hợp.]
  #step[Bước 3: Kiểm tra điều kiện và kết luận.]
  #reset-step()
]

#meo[
  *Mẹo kiểm tra nhanh:* ...
]

#ghinho[
  *Cần nhớ:* ...
]

#luuy[
  *Bẫy thường gặp:* ...
]

// ═══════════════════════════════════════════════════════════
= Dạng 1 — Tên Dạng Bài
// ═══════════════════════════════════════════════════════════

#phuongphap[
  *Phương pháp giải dạng 1:*
  #step[Phân tích đề, xác định đúng dạng.]
  #step[Áp dụng công thức phù hợp.]
  #reset-step()
]

// ── Trắc nghiệm ─────────────────────────────────────────
== Ví dụ 1.1 — Mức độ Nhận biết

#tn(
  [Đề bài trắc nghiệm... *(thay nội dung thực tế)*],
  (
    [Đáp án A], [Đáp án B], [Đáp án C], [Đáp án D],
  ),
  correct: (1,),
  loigiai: [
    #reset-step()
    #step[Đọc kỹ đề: nhận ra đây là dạng ...]
    #step[Áp dụng công thức: $...$]
    #step[Kết luận: Đáp án A.]
    #reset-step()
  ],
)

== Ví dụ 1.2 — Mức độ Thông hiểu

#tn(
  [Đề bài trắc nghiệm nâng cao hơn... *(thay nội dung)*],
  ([A], [B], [C], [D]),
  correct: (2,),
  loigiai: [
    #reset-step()
    #step[Phân tích đề...]
    #step[Tính toán...]
    #reset-step()
  ],
)

== Ví dụ 1.3 — Mức độ Vận dụng

#tn(
  [Đề bài phức tạp, cần kết hợp nhiều kiến thức...],
  ([A], [B], [C], [D]),
  correct: (3,),
  loigiai: [
    #reset-step()
    #step[Đây là bài toán tổng hợp...]
    #step[Bước 1: ...]
    #step[Bước 2: ...]
    #step[Kết luận: Đáp án C.]
    #reset-step()
  ],
)

// ── Bài tập tự luyện ────────────────────────────────────
== Bài Tập Tự Luyện Dạng 1

#bt[
  Bài toán cơ bản tương tự Ví dụ 1.1.
] #v(1.5cm)

#bt[
  Bài toán vận dụng cao.
] #v(2.5cm)

// ═══════════════════════════════════════════════════════════
= Dạng 2 — Tên Dạng Bài (có yếu tố hình học)
// ═══════════════════════════════════════════════════════════

#phuongphap[
  *Phương pháp:* Dựng hình → Thiết lập hệ thức → Giải.
]

== Ví dụ 2.1 — Trắc nghiệm có hình vẽ

#tn(
  [Dựa vào đồ thị bên, xác định số điểm cực trị của hàm số.],
  ([0], [1], True([2]), [3]),
  fig: cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    line((-2.2,0), (2.2,0), mark: (end: ">"))
    line((0,-1.5), (0,2), mark: (end: ">"))
    content((2.2,0.3), $x$); content((0.3,2), $y$)
    let pts = ()
    for i in range(-21, 21) {
      let x = i * 0.1
      let y = -x*x*x/3 + x
      if y >= -1.5 and y <= 2 { pts.push((x, y)) }
    }
    line(..pts, stroke: 1.5pt + blue)
    circle((-1, 2/3), radius: 2.5pt, fill: red)
    circle((1, -2/3), radius: 2.5pt, fill: red)
  }),
  fig-pos: "right",
  fig-width: 38%,
  loigiai: [
    #reset-step()
    #step[Quan sát đồ thị: hàm đạt cực đại tại $x = -1$ và cực tiểu tại $x = 1$.]
    #step[Số điểm cực trị = 2. Chọn C.]
    #reset-step()
  ],
)

== Ví dụ 2.2 — Đúng/Sai

#ds(
  [Cho hàm số $y = f(x)$ có đồ thị như hình bên. Xét tính đúng/sai:],
  (
    True([Hàm số có 2 điểm cực trị.]),
    [Hàm số đồng biến trên $(-oo; +oo)$.]),
    True([$f(0) > f(2)$.]),
    [Phương trình $f(x) = 0$ có đúng 1 nghiệm.]),
  ),
  loigiai: [
    #reset-step()
    #step[*Ý a) Đúng.* Đồ thị có 1 cực đại + 1 cực tiểu.]
    #step[*Ý b) Sai.* Hàm nghịch biến trên $(0;2)$.]
    #step[*Ý c) Đúng.* $f(0) = 4 > 0 = f(2)$.]
    #step[*Ý d) Sai.* $f(x)=0$ có 3 nghiệm phân biệt.]
    #reset-step()
  ],
)

// ── BBT minh họa ────────────────────────────────────────
== Bảng Biến Thiên Minh Họa

#align(center)[
  #bbbt(
    var: $x$, der: $y'$, func: $y$,
    x-vals: ($-oo$, $-1$, $2$, $+oo$),
    d-signs: ($+$, $+$, $0$, $-$, $0$, $+$, $+$),
    v-vals: ($-oo$, $4$, $0$, $+oo$),
  )
]

// ═══════════════════════════════════════════════════════════
= Dạng 3 — Tên Dạng Bài Tự Luận / Vận Dụng Cao
// ═══════════════════════════════════════════════════════════

== Ví dụ 3.1 — Tự Luận

#tl(
  [Cho hàm số $f(x) = x^3 - 3x^2 + mx + 1$. \
   Tìm $m$ để hàm số có hai cực trị dương.],
  lines: 5,
  loigiai: [
    #reset-step()
    #step[$f'(x) = 3x^2 - 6x + m$. Để có 2 cực trị: $Delta' > 0$.]
    #step[$Delta' = 9 - 3m > 0 => m < 3$.]
    #step[Điều kiện cực trị dương: tổng và tích nghiệm $>0$.]
    #step[$x_1 + x_2 = 2 > 0$ (đúng). $x_1 x_2 = m/3 > 0 => m > 0$.]
    #step[Kết luận: $0 < m < 3$.]
    #reset-step()
  ],
)

// ── Bài tập tự luyện ────────────────────────────────────
== Bài Tập Tự Luyện Dạng 3

#bt[
  Tìm $m$ để hàm số $f(x) = 1/3 x^3 - x^2 + mx - 1$ \
  đồng biến trên $(2; +oo)$.
] #v(2.5cm)


// ═══════════════════════════════════════════════════════════
= Bảng Tổng Kết Công Thức
// ═══════════════════════════════════════════════════════════

#align(center)[
  #table(
    columns: (auto, 1.5fr, auto),
    fill: (c, r) => if r == 0 { accent } else { white },
    stroke: 0.5pt + gray,
    inset: (x: 9pt, y: 7pt),
    align: (left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Đại lượng],
      text(fill: white, weight: "bold")[Công thức],
      text(fill: white, weight: "bold")[Điều kiện],
    ),
    [Đạo hàm], [$f'(x) = ...$], [$x in RR$],
    [Cực đại], [$f'(x_0)=0, f''(x_0)<0$], [$x_0$ tới hạn],
    [Cực tiểu], [$f'(x_0)=0, f''(x_0)>0$], [$x_0$ tới hạn],
    [Tiệm cận đứng], [$lim_(x->a) f(x) = oo$], [Mẫu = 0, tử $neq$ 0],
    [Tiệm cận ngang], [$lim_(x->oo) f(x) = L$], [Bậc tử $le$ bậc mẫu],
  )
]

// ═══════════════════════════════════════════════════════════
= Phụ Lục — Đáp Án Bài Tập
// ═══════════════════════════════════════════════════════════

#phuluc[
  *Dạng 1 — Bài tập tự luyện:*
  - Bài 1: ... (gợi ý: áp dụng công thức...)
  - Bài 2: ... (gợi ý: đặt ẩn phụ...)

  *Dạng 2 — Bài tập tự luyện:*
  - Bài 3: ... (gợi ý: dùng BBT...)
  - Bài 4: ... (gợi ý: ...)
]
`
}

// ═══════════════════════════════════════════════════════════
// BỘ ĐỀ — uses stexgv-exam-set router (doc-type: "bo-de")
// ═══════════════════════════════════════════════════════════
function genBode(g, name, n) {
    const author = g('author', 'Tác giả')
    const subject = g('subject', 'Toán 12')
    const year = g('year', '2025 – 2026')
    const imports = Array.from({ length: n }, (_, i) => `#include "de-${i + 1}.typ"`).join('\n')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-exam-set · Đa đề
// Biên dịch: typst compile --root .. main.typ
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── BÌA BỘ ĐỀ ───────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "bo-de",
  title: "${name}",
  author: "${author}",
  subject: "${subject}",
  academic-year: "${year}",
  theme-color: classic.blue,
)

// ── GIỚI THIỆU BỘ ĐỀ ────────────────────────────────────
#gioithieu[
  Bộ đề này gồm ${n} đề thi thử được biên soạn bám sát cấu trúc đề thi
  THPT Quốc Gia mới nhất của Bộ GD&ĐT năm ${year || '2026'}.

  Mỗi đề gồm:
  - *Phần I:* Trắc nghiệm nhiều lựa chọn
  - *Phần II:* Trắc nghiệm Đúng / Sai
  - *Phần III:* Trắc nghiệm trả lời ngắn
  - *Bảng đáp án* đầy đủ kèm barem chấm điểm
]

// ── MA TRẬN ─────────────────────────────────────────────
#matran[
  Ma trận đề thi (chung cho bộ ${n} đề):
  #matrix-box((
    ("Hàm số",       "Giải tích 12", "NB:3 TH:3 VD:2 VDC:1", "9 câu"),
    ("Mũ & Logarit", "Giải tích 12", "NB:2 TH:2 VD:1 VDC:0", "5 câu"),
    ("Hình học KG",  "Hình học 12",  "NB:2 TH:2 VD:1 VDC:1", "6 câu"),
    ("Xác suất",     "Đại số 12",    "NB:1 TH:1 VD:1 VDC:0", "3 câu"),
    ("Thực tế",      "Ứng dụng",     "NB:1 TH:1 VD:1 VDC:0", "3 câu"),
  ))
]

// ═══════════════════════════════════════════════════════════
// CÁC ĐỀ THI
// ═══════════════════════════════════════════════════════════
${imports}
`
}

function genBodeDe(g, i) {
    const subject = g('subject', 'TOÁN 12')
    const code = String(100 + i)
    return `// ═══════════════════════════════════════════════════════════
// Đề ${i} — Mã đề ${code}
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

#de(
  title: "Đề ${i}",
  subject: "${subject}",
  duration: "90 phút",
  code: "${code}",
  show-answer-key: true,
)[
  // ── Phần I — Trắc nghiệm nhiều lựa chọn ───────────────
  #exam-part[Phần I. Trắc nghiệm nhiều lựa chọn *(18 câu)*]

  #tn(
    [Đề ${i} — Câu 1...],
    ([A], [B], [C], [D]),
    correct: (1,),
  )

  #tn(
    [Đề ${i} — Câu 2...],
    ([A], [B], [C], [D]),
    correct: (2,),
  )

  #tn(
    [Đề ${i} — Câu 3...],
    ([A], [B], [C], [D]),
    correct: (1,),
  )

  // ... (thêm 15 câu nữa)

  // ── Phần II — Đúng/Sai ────────────────────────────────
  #exam-part[Phần II. Đúng/Sai *(4 câu)*]

  #ds(
    [Đề ${i} — Cho ... Xét tính đúng/sai:],
    (
      True([Phát biểu a. Đúng]), 
      ([Phát biểu b. Sai]),
      True([Phát biểu c. Đúng]),
      ([Phát biểu d. Sai]),
    ),
  )

  // ── Phần III — Trả lời ngắn ───────────────────────────
  #exam-part[Phần III. Trả lời ngắn *(2 câu)*]

  #tln(
    [Đề ${i} — Tính ...], 
    $42$,
  )

  #het
  #pagebreak()
  #print-answer-key()
]
`
}

// ═══════════════════════════════════════════════════════════
// BOOK — uses stexgv-book router (doc-type: "book")
// ═══════════════════════════════════════════════════════════
function genBook(g, name, n) {
    const author = g('author', 'Tác giả')
    const publisher = g('publisher', '')
    const subtitle = g('subtitle', '')
    const year = g('year', '2026')
    const imports = Array.from({ length: n }, (_, i) => `#include "chapters/chuong-${i + 1}.typ"`).join('\n')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-book · Đa chương
// Biên dịch: typst compile --root .. main.typ
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── BÌA SÁCH ─────────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
${subtitle ? `  subtitle: [${subtitle}],` : ''}  author: "${author}",
${publisher ? `  publisher: "${publisher}",` : ''}  academic-year: "${year}",
  theme-color: classic.blue,
)

// ── LỜI NÓI ĐẦU ────────────────────────────────────────
#loinoidau[
  Tài liệu này được biên soạn nhằm phục vụ cho việc dạy và học môn Toán cấp THPT.
  Nội dung bám sát chương trình giáo dục phổ thông mới, được phân chia thành các chương rõ ràng.
  Mỗi chương bao gồm: lý thuyết trọng tâm, ví dụ minh họa, bài tập tự luyện từ cơ bản đến nâng cao.

  Tác giả hy vọng cuốn sách sẽ là tài liệu hữu ích cho quý thầy cô và các em học sinh.

  #align(right)[
    _TP. Hồ Chí Minh, năm ${year || '2026'}_
    #v(0.5cm)
    *Tác giả*
  ]
]

// ── MỤC LỤC ─────────────────────────────────────────────
#pagebreak()
#outline(indent: 1.5em, depth: 3)

// ═══════════════════════════════════════════════════════════
// CÁC CHƯƠNG
// ═══════════════════════════════════════════════════════════
${imports}
`
}

function genChapter(g, i) {
    return `// ═══════════════════════════════════════════════════════════
// Chương ${i}: Tiêu Đề Chương
// ═══════════════════════════════════════════════════════════
= Chương ${i}: Tiêu Đề Chương

#muctieu[
  Sau khi học xong chương này, học sinh có thể:
  - Kiến thức 1...
  - Kiến thức 2...
  - Kỹ năng 1...
]

// ─────────────────────────────────────────────────────────
= Bài ${i}.1 — Tên Bài Học
// ─────────────────────────────────────────────────────────

#khoidong[
  Tình huống mở đầu / bài toán thực tế dẫn dắt vào bài...
]

#khampha[
  Hoạt động khám phá kiến thức mới...
]

#lythuyet[
  *Kiến thức trọng tâm:*
  - Điểm 1...
  - Điểm 2...
  - Công thức quan trọng: $...$
]

#dn[*Định nghĩa ${i}.1:* Phát biểu định nghĩa chính thức của khái niệm.]

#dl[*Định lý ${i}.1:* Phát biểu định lý và chứng minh (nếu cần).]

#tc[*Tính chất / Hệ quả:* ...]

// ── Ví dụ minh họa ──────────────────────────────────────
== Ví dụ minh họa

#vd(
  [Đề bài ví dụ 1 — mức độ Nhận biết.],
  loigiai: [Lời giải chi tiết từng bước...],
)

#vd(
  [Đề bài ví dụ 2 — mức độ Thông hiểu.],
  loigiai: [
    #reset-step()
    #step[Phân tích đề: ...]
    #step[Áp dụng định lý: ...]
    #step[Kết luận: ...]
    #reset-step()
  ],
)

#vd(
  [Đề bài ví dụ 3 — mức độ Vận dụng. *(có thể kết hợp hình vẽ)*],
  loigiai: [
    #reset-step()
    #step[Bước 1: ...]
    #step[Bước 2: ...]
    #step[Kết luận: ...]
    #reset-step()
  ],
)

#luuy[
  *Lưu ý khi làm bài:* ...
  - Lỗi thường gặp 1...
  - Lỗi thường gặp 2...
]

#meo[
  *Mẹo giải nhanh:* ...
]

// ── Bài tập ─────────────────────────────────────────────
== Bài Tập

#bt[Bài ${i}.1 — Cơ bản.][
  Nội dung bài tập cơ bản...
] #v(1.5cm)

#bt[Bài ${i}.2 — Nâng cao.][
  Nội dung bài tập nâng cao...
] #v(2.5cm)

#bt[Bài ${i}.3 — Vận dụng.][
  Nội dung bài tập vận dụng thực tế...
] #v(3cm)

// ── Tóm tắt ─────────────────────────────────────────────
#tomtat[
  *Những điểm cần nhớ:*
  - ...
  - ...
]

// ─────────────────────────────────────────────────────────
= Bài ${i}.2 — Tên Bài Học Tiếp Theo
// ─────────────────────────────────────────────────────────

#khoidong[
  ...
]

// (Tiếp tục với cấu trúc tương tự...)
`
}

// ═══════════════════════════════════════════════════════════
// HSG / OLYMPIC
// ═══════════════════════════════════════════════════════════
function genHSG(g, name) {
    const n = parseInt(g('nprob', '5'), 10) || 5
    const author = g('author', '')
    const subject = g('subject', 'TOÁN')
    const school = g('school', 'SỞ GD&ĐT TỈNH ABC')
    const duration = g('duration', '150 phút')
    const year = g('year', '2025 – 2026')
    const problems = Array.from({ length: n }, (_, i) => `
// ── Bài ${i + 1} ────────────────────────────────────────
#bai-hsg[${i + 1}][
  *(Phần chung)* Cho ... Chứng minh rằng ...

  *(Phần riêng)* Tìm tất cả ... thỏa mãn ...
]`).join('\n')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-doc (exam)
// Biên dịch: typst compile --root .. main.typ
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── TIÊU ĐỀ ──────────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "exam",
  title: "${name}",
  subject: "${subject}",
  school: "${school}",
  duration: "${duration}",
  academic-year: "${year}",
  theme-color: classic.blue,
  show-topbar: true,
)
${problems}

// ── HẾT ──────────────────────────────────────────────────
#het

// ── HƯỚNG DẪN CHẤM ──────────────────────────────────────
#pagebreak()
#align(center)[
  #text(size: 16pt, weight: "bold")[ĐÁP ÁN VÀ HƯỚNG DẪN CHẤM]
  #v(0.5em)
  #line(length: 40%, stroke: 1pt + classic.blue)
]
#v(1.5em)

#huongdancham[
  *Thang điểm:* Tổng 20 điểm.
  ${Array.from({ length: n }, (_, j) => `
  - *Bài ${j + 1}:* ${j < 2 ? 4 : 5} điểm
  `).join('')}
]
`
}

// ═══════════════════════════════════════════════════════════
// PHIẾU BÀI TẬP
// ═══════════════════════════════════════════════════════════
function genWorksheet(g, name) {
    const n = parseInt(g('nex', '10'), 10) || 10
    const subject = g('subject', 'Toán 12')
    const chapter = g('chapter', 'Chương 1')
    const duration = g('duration', '45 phút')
    const year = g('year', '2025 – 2026')
    const exercises = Array.from({ length: n }, (_, i) => `
#bt[Bài ${i + 1}.][
  *(Nội dung bài tập ${i + 1}...)*
  #v(2cm)
]`).join('\n')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-doc (book)
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── TRANG PHIẾU ─────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
  subject: "${subject}",
  academic-year: "${year}",
  theme-color: classic.blue,
  show-cover: false,
  show-outline: false,
)

// ── HEADER ──────────────────────────────────────────────
#v(0.5em)
#grid(
  columns: (1fr, auto),
  gutter: 8pt,
  [
    #text(weight: "bold", size: 12pt)[${name}]
    #linebreak()
    #text(size: 10pt)[#${subject} · ${chapter} · ${duration}]
  ],
  block(stroke: 0.5pt + gray, radius: 4pt, inset: 8pt)[
    #text(size: 9pt)[
      Họ tên: #h(2.5cm).......... \u{2003} Lớp: #h(1cm).......... \u{2003} Điểm: #h(1cm)..........
    ]
  ]
)

#line(length: 100%, stroke: 0.5pt + gray)
#v(6pt)

// ── ĐỀ BÀI ──────────────────────────────────────────────
#luuy[
  *Yêu cầu:* Làm bài cẩn thận, trình bày rõ ràng.
  Các bài có dấu (*) là bài nâng cao.
]
${exercises}

// ── HẾT ──────────────────────────────────────────────────
#line(length: 100%, stroke: 0.5pt + gray)
#v(4pt)
#align(center)[
  #text(size: 9pt, fill: luma(150), style: "italic")[
    Chúc các em làm bài tốt!
  ]
]
`
}

// ═══════════════════════════════════════════════════════════
// ĐỀ CƯƠNG ÔN TẬP
// ═══════════════════════════════════════════════════════════
function genDecuong(g, name, n) {
    const author = g('author', '')
    const subject = g('subject', 'Toán 12')
    const year = g('year', '2025 – 2026')
    const school = g('school', '')
    const topics = Array.from({ length: n }, (_, i) => `
// ─────────────────────────────────────────────────────────
= Chủ Đề ${i + 1}: Tên Chủ Đề
// ─────────────────────────────────────────────────────────

== A. Lý Thuyết Trọng Tâm

#lythuyet[
  *1. Định nghĩa:* ...
  *2. Định lý:* ...
  *3. Công thức quan trọng:* $...$
]

== B. Phân Dạng & Phương Pháp

#phuongphap[
  *Dạng 1: ...*
  #step[Nhận dạng...]
  #step[Các bước giải...]
  #reset-step()
]

#ghinho[
  *Lưu ý quan trọng:* ...
]

== C. Bài Tập Tự Luyện

#bt[BT ${(i + 1) * 10 + 1}.][Cơ bản — ...] #v(1.5cm)
#bt[BT ${(i + 1) * 10 + 2}.][Nâng cao — ...] #v(2cm)

== D. Đáp Án Gợi Ý

BT ${(i + 1) * 10 + 1}: ... *(gợi ý ngắn)* \\
BT ${(i + 1) * 10 + 2}: ... *(gợi ý ngắn)*
`).join('\n')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-doc (book)
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── BÌA ──────────────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
  subject: "${subject}",
  author: "${author}",
  institution: "${school}",
  academic-year: "${year}",
  theme-color: classic.blue,
)

// ── GIỚI THIỆU ──────────────────────────────────────────
#gioithieu[
  Tài liệu này là đề cương ôn tập môn ${subject} — ${year}.
  Nội dung được chia thành ${n} chủ đề, mỗi chủ đề gồm:
  - *Lý thuyết trọng tâm* cần nhớ
  - *Phân dạng & phương pháp* giải
  - *Bài tập tự luyện* kèm đáp án gợi ý

  Học sinh nên hoàn thành tất cả bài tập trước khi tham khảo đáp án.
]

// ── MỤC LỤC ─────────────────────────────────────────────
#pagebreak()
#outline(indent: 1.5em, depth: 2)
${topics}
`
}

// ═══════════════════════════════════════════════════════════
// TÓM TẮT / CÔNG THỨC — Cheat-sheet in được
// ═══════════════════════════════════════════════════════════
function genTomtat(g, name) {
    const subject = g('subject', 'Toán')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · Bảng công thức
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── CỠ CHỮ NHỎ CHO CHEAT-SHEET ──────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
  subject: "${subject}",
  academic-year: "${g('year', '2026')}",
  theme-color: classic.blue,
  show-cover: false,
  show-outline: false,
)

// ╔════════════════════════════════════════════════════════╗
// ║       Nhóm 1: Đại Số & Giải Tích                       ║
// ╚════════════════════════════════════════════════════════╝
= Nhóm 1: Đại Số & Giải Tích

#align(center)[
  #table(
    columns: (auto, 2fr, auto),
    stroke: 0.4pt + gray,
    inset: (x: 7pt, y: 5pt),
    fill: (c, r) => if r == 0 { rgb("D6EAF8") } else if calc.odd(r) { rgb("F8FBFF") } else { white },
    table.header([*STT*],[*Công thức*],[*Điều kiện/Ghi chú*]),
    [1],[$f'(x) = lim_(h->0) (f(x+h)-f(x))/h$],[Giới hạn tồn tại],
    [2],[$(u+v)' = u' + v'$],[Đạo hàm của tổng],
    [3],[$(uv)' = u'v + uv'$],[Đạo hàm của tích],
    [4],[$(u/v)' = (u'v - uv')/v^2$],[$v eq.not 0$],
    [5],[$(x^n)' = n x^(n-1)$],[$n in NN$],
    [6],[$(sin x)' = cos x$],[],
    [7],[$(cos x)' = -sin x$],[],
    [8],[$(e^x)' = e^x$],[],
    [9],[$(ln x)' = 1/x$],[$x > 0$],
  )
]

// ╔════════════════════════════════════════════════════════╗
// ║       Nhóm 2: Tích Phân                               ║
// ╚════════════════════════════════════════════════════════╝
= Nhóm 2: Tích Phân

#ghinho[
  #align(center)[
    #table(
      columns: (auto, 2fr, auto),
      stroke: 0.4pt + gray,
      inset: (x: 7pt, y: 5pt),
      fill: (c, r) => if r == 0 { rgb("D5F5E3") } else if calc.odd(r) { rgb("F9FFF9") } else { white },
      table.header([*STT*],[*Công thức*],[*Ghi chú*]),
      [1],[$integral f'(x) dif x = f(x) + C$],[Nguyên hàm cơ bản],
      [2],[$integral x^n dif x = x^(n+1)/(n+1) + C$],[$n eq.not -1$],
      [3],[$integral 1/x dif x = ln|x| + C$],[$x eq.not 0$],
      [4],[$integral e^x dif x = e^x + C$],[],
      [5],[$integral_a^b f(x)dif x = F(b) - F(a)$],[Newton-Leibniz],
      [6],[$integral_a^b [f(x)+-g(x)] dif x = integral_a^b f(x)dif x +- integral_a^b g(x)dif x$],[Tính chất],
    )
  ]
]

// ╔════════════════════════════════════════════════════════╗
// ║       Nhóm 3: Hình Học Không Gian                      ║
// ╚════════════════════════════════════════════════════════╝
= Nhóm 3: Hình Học Không Gian

#align(center)[
  #table(
    columns: (auto, 2fr, auto),
    stroke: 0.4pt + gray,
    inset: (x: 7pt, y: 5pt),
    fill: (c, r) => if r == 0 { rgb("FDEBD0") } else if calc.odd(r) { rgb("FFFDF5") } else { white },
    table.header([*STT*],[*Công thức*],[*Ghi chú*]),
    [1],[$V_(chóp) = 1/3 S_(đáy) * h$],[Thể tích khối chóp],
    [2],[$V_(lăng\ trụ) = S_(đáy) * h$],[Thể tích khối lăng trụ],
    [3],[$S_(xq\ nón) = pi r l$],[Diện tích xung quanh],
    [4],[$V_(nón) = 1/3 pi r^2 h$],[Thể tích khối nón],
    [5],[$S_(xq\ trụ) = 2 pi r h$],[Diện tích xung quanh],
    [6],[$V_(trụ) = pi r^2 h$],[Thể tích khối trụ],
    [7],[$S_(cầu) = 4 pi R^2$],[Diện tích mặt cầu],
    [8],[$V_(cầu) = 4/3 pi R^3$],[Thể tích khối cầu],
  )
]
`
}

// ═══════════════════════════════════════════════════════════
// GIÁO ÁN ĐIỆN TỬ
// ═══════════════════════════════════════════════════════════
function genGiaoAn(g, name) {
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · Giáo án điện tử
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── BÌA GIÁO ÁN ─────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
  subject: "${g('subject', 'Toán')}",
  grade: "${g('grade', '12')}",
  author: "${g('author', 'GV soạn')}",
  institution: "${g('school', 'THPT ABC')}",
  academic-year: "${g('year', '2025 – 2026')}",
  theme-color: classic.blue,
)

// ═══════════════════════════════════════════════════════════
= I. Mục Tiêu
// ═══════════════════════════════════════════════════════════

#muctieuchung[
  *1. Kiến thức:* Học sinh nắm được ...
  *2. Kỹ năng:* Vận dụng thành thạo ... vào giải bài tập.
  *3. Thái độ:* Tích cực, chủ động trong học tập, yêu thích môn Toán.
  *4. Năng lực hướng tới:* Tư duy logic, giải quyết vấn đề, mô hình hóa toán học.
]

// ═══════════════════════════════════════════════════════════
= II. Chuẩn Bị
// ═══════════════════════════════════════════════════════════

#chuanbi[
  *Giáo viên:* Giáo án, phiếu học tập, máy chiếu, bảng phụ, phần mềm Geogebra (nếu cần).
  *Học sinh:* SGK, vở ghi, máy tính cầm tay, đồ dùng học tập.
]

// ═══════════════════════════════════════════════════════════
= III. Tiến Trình Dạy Học
// ═══════════════════════════════════════════════════════════

== 1. Khởi Động *(5 phút)*

#khoidong[
  *Tình huống mở đầu:* ...
  *Câu hỏi dẫn dắt:* ...
  *Dự kiến trả lời của HS:* ...
]

== 2. Hình Thành Kiến Thức *(25 phút)*

=== 2.1. Hoạt Động Khám Phá

#khampha[
  *Nhiệm vụ:* Cho học sinh quan sát / thực hiện ...
  *Câu hỏi gợi ý:*
  - ...
  - ...
]

=== 2.2. Kiến Thức Trọng Tâm

#lythuyet[
  *Định nghĩa:* ...
  *Ví dụ minh họa:* ...
]

#phuongphap[
  *Phương pháp giải:*
  #step[Bước 1: ...]
  #step[Bước 2: ...]
  #reset-step()
]

== 3. Luyện Tập *(10 phút)*

#luyentap[
  *Hoạt động nhóm / cá nhân:*
]

#bt[Bài tập 1.][Nội dung... *(Nhận biết)*]
#v(1cm)

#bt[Bài tập 2.][Nội dung nâng cao... *(Thông hiểu)*]
#v(1.5cm)

== 4. Vận Dụng *(5 phút)*

#vandung[
  *Bài toán thực tế:* ...

  *Gợi ý:* ...
]

// ═══════════════════════════════════════════════════════════
= IV. Dặn Dò &Bài Tập Về Nhà
// ═══════════════════════════════════════════════════════════

#note[
  - Làm bài tập trong SGK: Bài 1, 2, 3 trang ...
  - Chuẩn bị bài tiếp theo: Đọc trước ...
]

// ═══════════════════════════════════════════════════════════
= V. Rút Kinh Nghiệm
// ═══════════════════════════════════════════════════════════

#nhanxet[
  *(Phần này GV tự ghi sau khi dạy)*

  - Điểm thành công: ...
  - Điểm cần cải thiện: ...
  - Điều chỉnh cho tiết sau: ...
]
`
}

// ═══════════════════════════════════════════════════════════
// SLIDE BEAMER
// ═══════════════════════════════════════════════════════════
function genBeamer(g, name) {
    const n = Math.min(Math.max(parseInt(g('nframe', '8'), 10) || 8, 3), 20)
    const frames = Array.from({ length: n - 2 }, (_, i) => `
#frame[Slide ${i + 3}: Tiêu đề][
  #lythuyet[Nội dung kiến thức chính của slide... *(thay nội dung thực tế)*]

  #phuongphap[
    #step[Bước ${i + 1}.A: ...]
    #step[Bước ${i + 1}.B: ...]
    #reset-step()
  ]
]`).join('\n')
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · Slide bài giảng
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── BÌA TRÌNH CHIẾU ─────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
  subtitle: [${g('subtitle', '')}],
  author: "${g('author', 'Tác giả')}",
  institution: "${g('institute', '')}",
  subject: "${g('subject', 'Toán 12')}",
  academic-year: "${g('year', '2025 – 2026')}",
  theme-color: classic.blue,
)

// ═══════════════════════════════════════════════════════════
// SLIDE 1 — TIÊU ĐỀ
// ═══════════════════════════════════════════════════════════

#align(center)[
  #v(4cm)
  #text(size: 28pt, weight: "bold", fill: classic.blue)[${name}]

  #v(1.2em)
  #text(size: 16pt, style: "italic")[${g('subtitle', '')}]

  #v(2.5em)
  #line(length: 40%, stroke: 1pt + classic.blue)

  #v(1.5em)
  #text(size: 13pt)[${g('author', 'Tác giả')}]
  #v(0.3em)
  #text(size: 11pt, fill: luma(120))[${g('institute', '')} · ${g('year', '2026')}]
]

#pagebreak()

// ═══════════════════════════════════════════════════════════
// SLIDE 2 — MỤC LỤC / NỘI DUNG CHÍNH
// ═══════════════════════════════════════════════════════════

#outline(indent: 1em, depth: 1)

#pagebreak()

${frames}

// ═══════════════════════════════════════════════════════════
// SLIDE CUỐI — CẢM ƠN
// ═══════════════════════════════════════════════════════════

#pagebreak()
#align(center)[
  #v(4cm)
  #text(size: 24pt, weight: "bold", fill: classic.blue)[Cảm ơn đã theo dõi! 🎓]

  #v(1.5em)
  #text(size: 14pt)[${g('author', '')}]
  #v(0.3em)
  #text(size: 11pt, fill: luma(130))[${g('institute', '')} · ${g('year', '2026')}]
]
`
}

// ═══════════════════════════════════════════════════════════
// NGHIÊN CỨU / NCKH — uses stexgv-research router
// ═══════════════════════════════════════════════════════════
function genResearch(g, name) {
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · stexgv-research
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── SHOW: RESEARCH TEMPLATE ──────────────────────────────
#show: stexgv-doc.with(
  doc-type: "research",
  title: "${name}",
  author: "${g('author', 'Tác giả')}",
  abstract: [
    ${g('abstract', 'Tóm tắt bài báo khoa học...') || 'Tóm tắt bài báo: Nghiên cứu này trình bày ...'}
  ],
  keywords: (
    ${(g('keywords', 'toán học, hình học') || 'toán học')
            .split(',').map(k => `"${k.trim()}"`).join(', ')},
  ),
  two-columns: true,
  theme-color: classic.blue,
)

// ═══════════════════════════════════════════════════════════
= 1. Giới Thiệu
// ═══════════════════════════════════════════════════════════

Nội dung phần giới thiệu: Đặt vấn đề, tổng quan nghiên cứu, mục tiêu bài báo.

#lythuyet[
  *Tổng quan:* Các nghiên cứu trước đây đã chỉ ra rằng ... \
  Tuy nhiên, vẫn còn một số vấn đề chưa được giải quyết triệt để ...
]

// ═══════════════════════════════════════════════════════════
= 2. Cơ Sở Lý Thuyết
// ═══════════════════════════════════════════════════════════

#dn[*Định nghĩa 2.1:* Phát biểu định nghĩa chính thức.]

#dl[*Định lý 2.1:* Phát biểu định lý kèm chứng minh.]

#tc[*Hệ quả 2.1:* ...]

// ═══════════════════════════════════════════════════════════
= 3. Phương Pháp & Kết Quả Chính
// ═══════════════════════════════════════════════════════════

*Phương pháp nghiên cứu:* Mô tả ngắn gọn phương pháp được sử dụng.

*Kết quả chính:*

#phuongphap[
  *Quy trình chứng minh:*
  #step[Bước 1: ...]
  #step[Bước 2: ...]
  #step[Bước 3: ...]
  #reset-step()
]

#dl[*Định lý 3.1 (Kết quả mới):* Phát biểu kết quả chính của bài báo.]

*Chứng minh.* Trình bày chứng minh chi tiết ...

// ═══════════════════════════════════════════════════════════
= 4. Kết Luận & Hướng Phát Triển
// ═══════════════════════════════════════════════════════════

#nhanxet[
  *Kết luận:* Tóm tắt các kết quả đã đạt được.
  *Hạn chế:* Những điểm còn tồn tại.
  *Hướng phát triển:* Các vấn đề có thể nghiên cứu tiếp theo.
]

#pagebreak()
#bibliography("references.bib")
`
}

// ═══════════════════════════════════════════════════════════
// LUẬN VĂN / KLTN
// ═══════════════════════════════════════════════════════════
function genLuanVan(g, name) {
    const degreeLabel = { dh: 'KHÓA LUẬN TỐT NGHIỆP', ths: 'LUẬN VĂN THẠC SĨ', ts: 'LUẬN ÁN TIẾN SĨ' }
    const dl = degreeLabel[g('degree', 'dh')] || 'KHÓA LUẬN TỐT NGHIỆP'
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · ${dl}
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── TRANG BÌA CHÍNH ─────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
  author: "${g('author', 'Sinh viên')}",
  institution: "${g('university', 'ĐHQG TP.HCM')}",
  publisher: "${g('dept', 'Khoa Toán – Tin')}",
  academic-year: "${g('year', '2026')}",
  theme-color: classic.blue,
)

// ═══════════════════════════════════════════════════════════
= Lời Cam Đoan
// ═══════════════════════════════════════════════════════════

Tôi xin cam đoan đây là công trình nghiên cứu của riêng tôi, được thực hiện dưới sự hướng dẫn của ${g('advisor', 'GVHD')}.
Các số liệu, kết quả trong luận văn này là trung thực và chưa từng được công bố trong bất kỳ công trình nào khác.

#align(right)[
  _TP. Hồ Chí Minh, ngày ... tháng ... năm ${g('year', '2026')}_

  #v(1.5cm)
  *${g('author', 'Tác giả')}*
]

#pagebreak()

// ═══════════════════════════════════════════════════════════
= Lời Cảm Ơn
// ═══════════════════════════════════════════════════════════

Tôi xin bày tỏ lòng biết ơn sâu sắc đến ${g('advisor', 'GVHD')} đã tận tình hướng dẫn...

#pagebreak()

// ═══════════════════════════════════════════════════════════
= Tóm Tắt
// ═══════════════════════════════════════════════════════════

${name}: ...

*Từ khóa:* ... *(từ khóa của nghiên cứu)*

#pagebreak()

// ═══════════════════════════════════════════════════════════
= Mở Đầu
// ═══════════════════════════════════════════════════════════

== 1. Đặt vấn đề

...

== 2. Mục tiêu nghiên cứu

...

== 3. Phương pháp nghiên cứu

- Phương pháp nghiên cứu lý luận
- Phương pháp nghiên cứu thực tiễn
- Phương pháp thống kê toán học

== 4. Cấu trúc luận văn

Luận văn gồm ... chương:
- Chương 1: ...
- Chương 2: ...

// ═══════════════════════════════════════════════════════════
= Chương 1 — Cơ Sở Lý Thuyết
// ═══════════════════════════════════════════════════════════

== 1.1. ...

#dn[*Định nghĩa 1.1:* ...]

#dl[*Định lý 1.1:* ...]

#tc[*Hệ quả 1.1:* ...]

// ═══════════════════════════════════════════════════════════
= Chương 2 — Nội Dung Nghiên Cứu
// ═══════════════════════════════════════════════════════════

== 2.1. ...

*Chứng minh.* ...

== 2.2. Ví dụ minh họa

#vd(
  [Ví dụ áp dụng ...],
  loigiai: [Lời giải chi tiết...],
)

// ═══════════════════════════════════════════════════════════
= Kết Luận Và Hướng Phát Triển
// ═══════════════════════════════════════════════════════════

#nhanxet[
  *Kết quả đạt được:* ...
  *Hạn chế:* ...
  *Hướng phát triển tiếp theo:* ...
]

#pagebreak()
#bibliography("references.bib")
`
}

// ═══════════════════════════════════════════════════════════
// SKKN / SÁNG KIẾN KINH NGHIỆM
// ═══════════════════════════════════════════════════════════
function genSangKien(g, name) {
    return `// ═══════════════════════════════════════════════════════════
// ${name}
// Biên soạn bằng ConicTypst · Sáng kiến kinh nghiệm
// ═══════════════════════════════════════════════════════════
#import "../template.typ": *
#import "../themdep.typ": *

// ── SHOW RULES ───────────────────────────────────────────
#show: sang-setup

// ── BÌA SKKN ─────────────────────────────────────────────
#show: stexgv-doc.with(
  doc-type: "book",
  title: "${name}",
  author: "${g('author', 'Tác giả')}",
  institution: "${g('school', 'THPT ABC')}",
  subject: "${g('subject', 'Toán')}",
  grade: "${g('grade', '10, 11, 12')}",
  academic-year: "${g('year', '2025 – 2026')}",
  theme-color: classic.blue,
)

// ═══════════════════════════════════════════════════════════
= MỞ ĐẦU
// ═══════════════════════════════════════════════════════════

== 1. Lý do chọn đề tài

Trong quá trình giảng dạy môn ${g('subject', 'Toán')} tại trường ${g('school', 'THPT ABC')},
tôi nhận thấy học sinh thường gặp khó khăn khi ...

#lythuyet[
  *Thực trạng ban đầu:*
  - Học sinh chưa nắm vững ...
  - Kết quả kiểm tra chưa cao ...
  - Thiếu tài liệu tham khảo phù hợp ...
]

== 2. Mục đích nghiên cứu

Nhằm nâng cao chất lượng dạy và học môn ${g('subject', 'Toán')}, giúp học sinh ...

== 3. Đối tượng và phương pháp nghiên cứu

- *Đối tượng:* Học sinh lớp ${g('grade', '10, 11, 12')} trường ${g('school', 'THPT ABC')}.
- *Phương pháp:* Nghiên cứu lý luận, thực nghiệm sư phạm, thống kê toán học.

// ═══════════════════════════════════════════════════════════
= NỘI DUNG SÁNG KIẾN
// ═══════════════════════════════════════════════════════════

== 1. Cơ sở lý luận

#dn[*Định nghĩa:* ...]
#dl[*Định lý:* ...]

== 2. Thực trạng vấn đề

#nhanxet[
  Qua khảo sát ... học sinh, kết quả cho thấy:
]

== 3. Các giải pháp đề xuất

=== Giải pháp 1: Tên giải pháp

*Mô tả:* ...
*Cách thực hiện:* ...

#phuongphap[
  #step[Chuẩn bị tài liệu, giáo án...]
  #step[Triển khai trong tiết dạy...]
  #step[Kiểm tra, đánh giá...]
  #reset-step()
]

=== Giải pháp 2: Tên giải pháp

...

== 4. Kết quả đạt được

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  stroke: 0.4pt + gray, inset: 8pt,
  fill: (c, r) => if r == 0 { accent.lighten(88%) } else if calc.odd(r) { luma(250) } else { white },
  table.header(
    table.cell(fill: accent)[#text(fill: white, weight: "bold")[Lớp]],
    table.cell(fill: accent)[#text(fill: white, weight: "bold")[Giỏi]],
    table.cell(fill: accent)[#text(fill: white, weight: "bold")[Khá]],
    table.cell(fill: accent)[#text(fill: white, weight: "bold")[Trung bình]],
  ),
  [12A1 *(thực nghiệm)*], [38%], [52%], [10%],
  [12A2 *(đối chứng)*],   [15%], [45%], [40%],
)

#ghinho[
  *Nhận xét:* Tỉ lệ học sinh đạt Khá, Giỏi ở lớp thực nghiệm cao hơn rõ rệt so với lớp đối chứng.
]

// ═══════════════════════════════════════════════════════════
= KẾT LUẬN VÀ KIẾN NGHỊ
// ═══════════════════════════════════════════════════════════

== 1. Kết luận

Sáng kiến đã đạt được những kết quả tích cực trong việc ...

== 2. Kiến nghị

- *Đối với nhà trường:* ...
- *Đối với Sở GD&ĐT:* ...
- *Đối với giáo viên:* ...
`
}

// ── Bib ───────────────────────────────────────────────────
function genBib() {
    return `@article{example2025,
  author  = {Nguyễn, Văn A},
  title   = {Tiêu đề bài báo},
  journal = {Tạp chí Toán học},
  year    = {2025},
  volume  = {1},
  pages   = {1--10},
}
`
}

// ── README ────────────────────────────────────────────────
function genReadme(type, name, g) {
    const cmds = {
        chuyende: `typst compile --root .. main.typ`,
        exam: `typst compile --root .. main.typ`,
        bode: `typst compile --root .. main.typ`,
        book: `typst compile --root .. main.typ`,
        research: `typst compile --root .. main.typ`,
        hsg: `typst compile --root .. main.typ`,
        worksheet: `typst compile --root .. main.typ`,
        decuong: `typst compile --root .. main.typ`,
        tomtat: `typst compile --root .. main.typ`,
        giaoandientu: `typst compile --root .. main.typ`,
        beamer: `typst compile --root .. main.typ`,
        luanvan: `typst compile --root .. main.typ`,
        sangkien: `typst compile --root .. main.typ`,
    }
    const typeLabel = {
        chuyende: 'Chuyên đề', exam: 'Đề thi', bode: 'Bộ đề',
        book: 'Sách / tài liệu', research: 'Nghiên cứu / NCKH',
        hsg: 'Thi HSG / Olympic', worksheet: 'Phiếu bài tập',
        decuong: 'Đề cương ôn tập', tomtat: 'Tóm tắt / Công thức',
        giaoandientu: 'Giáo án điện tử', beamer: 'Slide bài giảng',
        luanvan: 'Luận văn / KLTN', sangkien: 'SKKN',
    }
    return `# ${name}

**Loại:** ${typeLabel[type] || type}
**Tác giả:** ${g('author', '—')}
**Năm học:** ${g('year', '—')}

## Cấu trúc thư mục

\`\`\`
${slug(name)}/
├── main.typ        ← File chính, biên dịch file này
├── figures/        ← Hình vẽ (nếu có)
└── README.md
\`\`\`

## Biên dịch

\`\`\`bash
cd ${slug(name)}
${cmds[type] || 'typst compile main.typ'}
\`\`\`

Hoặc từ thư mục gốc \`typst/\`:
\`\`\`bash
typst compile --font-path ../src/assets/fonts --font-path ../fonts --root . ${slug(name)}/main.typ
\`\`\`

## Ghi chú

- Import từ \`template.typ\` (router chính) và \`themdep.typ\` (layout nâng cao).
- Xem \`HUONG-DAN-HE-THONG-TEMPLATE.md\` để biết thêm.
`
}

// ─────────────────────────────────────────────────────────
// Preview code snippet
// ─────────────────────────────────────────────────────────
function previewSnippet(tpl, form) {
    const files = generateFiles(tpl, form)
    const firstFile = Object.entries(files).find(([k]) => k.endsWith('.typ'))
    return firstFile ? firstFile[1].substring(0, 1500) + '\n// ...' : ''
}

// ─────────────────────────────────────────────────────────
// Component
// ─────────────────────────────────────────────────────────
const DEFAULT_FORMS = Object.fromEntries(
    TEMPLATES.map(t => [t.id, Object.fromEntries(t.fields.map(f => [f.key, '']))])
)

export default function TemplateGen() {
    const [step, setStep] = useState(1)
    const [selected, setSelected] = useState(null)
    const [activeCat, setActiveCat] = useState('all')
    const [forms, setForms] = useState(DEFAULT_FORMS)

    const tpl = TEMPLATES.find(t => t.id === selected)
    const form = forms[selected] || {}

    function pickTemplate(id) {
        setSelected(id)
        setStep(2)
    }

    function setField(key, val) {
        setForms(f => ({ ...f, [selected]: { ...f[selected], [key]: val } }))
    }

    function handleDownload() {
        const files = generateFiles(tpl, form)
        const slug_ = slug(form.title || tpl.label)
        downloadZip(files, `${slug_}.zip`)
        setStep(3)
    }

    const preview = useMemo(() => {
        if (!tpl) return ''
        return previewSnippet(tpl, form)
    }, [tpl, form])

    const filteredTpls = TEMPLATES.filter(t => activeCat === 'all' || t.category === activeCat)

    // Group templates by category for sidebar
    const groupedTpls = CATEGORIES
        .filter(c => c.id !== 'all')
        .map(c => ({
            ...c,
            items: filteredTpls.filter(t => t.category === c.id),
        }))
        .filter(g => g.items.length > 0)

    return (
        <div className="tg-shell" style={{ '--tpl-color': tpl?.color || '#3b82f6', '--tpl-color-dark': tpl ? darkenColor(tpl.color, 0.15) : '#2563eb' }}>
            {/* ── SIDEBAR ── */}
            <aside className="tg-sidebar">
                <div className="tg-sidebar__header">
                    <h2 className="tg-sidebar__title">Kho mẫu Typst</h2>
                    <p className="tg-sidebar__sub">Chọn loại tài liệu để tạo khung</p>
                </div>

                <div className="tg-filters">
                    {CATEGORIES.map(c => (
                        <button
                            key={c.id}
                            className={`tg-filter-btn ${activeCat === c.id ? 'tg-filter-btn--active' : ''}`}
                            onClick={() => setActiveCat(c.id)}
                        >{c.label}</button>
                    ))}
                </div>

                <div className="tg-list">
                    {activeCat === 'all' ? (
                        groupedTpls.map(group => (
                            <div key={group.id}>
                                <div className="tg-group-label">{group.label}</div>
                                {group.items.map(t => (
                                    <button
                                        key={t.id}
                                        className={`tg-item ${selected === t.id ? 'tg-item--active' : ''}`}
                                        onClick={() => pickTemplate(t.id)}
                                    >
                                        <span className="tg-item__icon">{t.icon}</span>
                                        <div className="tg-item__info">
                                            <div className="tg-item__label">{t.label}</div>
                                            <div className="tg-item__desc">{t.desc}</div>
                                        </div>
                                    </button>
                                ))}
                            </div>
                        ))
                    ) : (
                        filteredTpls.map(t => (
                            <button
                                key={t.id}
                                className={`tg-item ${selected === t.id ? 'tg-item--active' : ''}`}
                                onClick={() => pickTemplate(t.id)}
                            >
                                <span className="tg-item__icon">{t.icon}</span>
                                <div className="tg-item__info">
                                    <div className="tg-item__label">{t.label}</div>
                                    <div className="tg-item__desc">{t.desc}</div>
                                </div>
                            </button>
                        ))
                    )}
                </div>
            </aside>

            {/* ── MAIN CONTENT ── */}
            <main className="tg-main">
                {step === 1 && !selected && (
                    <div className="tg-welcome">
                        <div className="tg-welcome__icon">📚</div>
                        <h2 className="tg-welcome__title">Chọn loại tài liệu bên trái</h2>
                        <p className="tg-welcome__sub">
                            Click vào một mẫu trong danh sách để bắt đầu tạo khung.
                            Hệ thống sinh ZIP đầy đủ với cấu trúc chuẩn, sẵn sàng biên dịch.
                        </p>
                    </div>
                )}

                {step === 2 && tpl && (
                    <div className="tg-form">
                        <div className="tg-form-header">
                            <div className="tg-form-header__icon">{tpl.icon}</div>
                            <div className="tg-form-header__meta">
                                <p className="tg-form-header__step">Bước 2 — Điền thông tin</p>
                                <h2 className="tg-form-header__title">{tpl.label}</h2>
                                <p className="tg-form-header__hint">{tpl.desc}</p>
                            </div>
                        </div>

                        <div className="tg-form-body">
                            <div className="tg-fields">
                                {tpl.fields.map(f => (
                                    <label key={f.key} className="tg-field">
                                        <span className="tg-field__label">
                                            {f.label}
                                            {f.required && <span className="tg-field__star"> *</span>}
                                        </span>
                                        {f.type === 'textarea' ? (
                                            <textarea
                                                className="tg-field__control"
                                                value={form[f.key] || ''}
                                                placeholder={f.placeholder}
                                                rows={3}
                                                onChange={e => setField(f.key, e.target.value)}
                                            />
                                        ) : f.type === 'select' ? (
                                            <select
                                                className="tg-field__control"
                                                value={form[f.key] || ''}
                                                onChange={e => setField(f.key, e.target.value)}
                                            >
                                                {f.options.map(o => (
                                                    <option key={o.v} value={o.v}>{o.l}</option>
                                                ))}
                                            </select>
                                        ) : (
                                            <input
                                                className="tg-field__control"
                                                type={f.type || 'text'}
                                                value={form[f.key] || ''}
                                                placeholder={f.placeholder}
                                                onChange={e => setField(f.key, e.target.value)}
                                            />
                                        )}
                                    </label>
                                ))}
                            </div>

                            <div className="tg-preview">
                                <div className="tg-preview__head">
                                    <span className="tg-preview__dot"></span>
                                    <span>{form.title ? slug(form.title) + '/main.typ' : 'main.typ'}</span>
                                </div>
                                <pre className="tg-preview__code">{preview}</pre>
                            </div>
                        </div>

                        <div className="tg-form-footer">
                            <button className="tg-btn tg-btn--ghost" onClick={() => { setSelected(null); setStep(1) }}>
                                ← Đổi mẫu
                            </button>
                            <button className="tg-btn tg-btn--primary" onClick={handleDownload}>
                                Tải ZIP khung
                            </button>
                        </div>
                    </div>
                )}

                {step === 3 && tpl && (
                    <div className="tg-done">
                        <div className="tg-done__icon">✅</div>
                        <h2 className="tg-done__title">Đã tải ZIP thành công!</h2>
                        <p className="tg-done__msg">
                            Giải nén vào thư mục <code>typst/</code>, rồi biên dịch:
                        </p>
                        <pre className="tg-done__cmd">
                            {`typst compile --font-path src/assets/fonts --font-path fonts --root . typst/${slug(form.title || tpl.label)}/main.typ`}
                        </pre>
                        <div className="tg-done__actions">
                            <button className="tg-btn tg-btn--ghost" onClick={() => setStep(2)}>
                                ← Chỉnh sửa
                            </button>
                            <button className="tg-btn tg-btn--primary" onClick={handleDownload}>
                                Tải lại ZIP
                            </button>
                            <button className="tg-btn tg-btn--ghost" onClick={() => { setStep(1); setSelected(null) }}>
                                Tạo loại khác
                            </button>
                        </div>

                        <div className="tg-done__files">
                            <h3>Các file trong ZIP:</h3>
                            <ul>
                                {Object.keys(generateFiles(tpl, form)).map(f => (
                                    <li key={f}><code>{f}</code></li>
                                ))}
                            </ul>
                        </div>
                    </div>
                )}
            </main>
        </div>
    )
}
