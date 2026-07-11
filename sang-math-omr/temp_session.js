// Quản lý lớp/kỳ thi
let examSessions = ['Mặc định'];

function loadSessions() {
    const saved = localStorage.getItem('omr_sessions_v1');
    if (saved) {
        try {
            examSessions = JSON.parse(saved);
        } catch(e) {}
    }
    updateSessionSelects();
}

function saveSessions() {
    localStorage.setItem('omr_sessions_v1', JSON.stringify(examSessions));
    updateSessionSelects();
}

function updateSessionSelects() {
    const sel1 = document.getElementById('sessionNameSelect');
    const sel2 = document.getElementById('statsSessionSelect');
    if(!sel1 || !sel2) return;
    
    const curr1 = sel1.value;
    const curr2 = sel2.value;
    
    let html1 = '';
    let html2 = '<option value="All">-- Tất cả --</option>';
    examSessions.forEach(s => {
        const opt = `<option value="${s}">${s}</option>`;
        html1 += opt;
        html2 += opt;
    });
    
    sel1.innerHTML = html1;
    sel2.innerHTML = html2;
    
    if(examSessions.includes(curr1)) sel1.value = curr1;
    if(curr2 === 'All' || examSessions.includes(curr2)) sel2.value = curr2;
}

window.promptAddSession = function() {
    const name = prompt("Nhập tên Lớp / Kỳ thi mới (VD: Kiểm tra 15p Lớp 12A1):");
    if (name && name.trim()) {
        const t = name.trim();
        if (!examSessions.includes(t)) {
            examSessions.push(t);
            saveSessions();
            document.getElementById('sessionNameSelect').value = t;
        }
    }
};

window.onSessionChange = function() {
    // Không cần xử lý logic gì đặc biệt vì khi chấm tự lấy value này
};

function exportExcel() {
    const sessionFilter = document.getElementById('statsSessionSelect').value;
    let filtered = gradeResults;
    if (sessionFilter !== 'All') {
        filtered = gradeResults.filter(r => (r.sessionName || 'Mặc định') === sessionFilter);
    }
    if (filtered.length === 0) {
        alert("Không có dữ liệu để xuất!");
        return;
    }
    let csv = "\uFEFF"; // BOM for UTF-8 Excel
    csv += "STT,SBD,Họ tên,Mã đề,Điểm,Số câu đúng,Tổng số câu,Xếp loại,Lớp/Kỳ thi,Thời gian\n";
    filtered.forEach((r, idx) => {
        const t = new Date(r.timestamp).toLocaleString();
        csv += `${idx + 1},${r.sbd},${r.name},${r.made},${r.score},${r.correct},${r.total},${r.verdict},${r.sessionName || 'Mặc định'},${t}\n`;
    });
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.setAttribute("href", url);
    link.setAttribute("download", `Diem_Thi_${sessionFilter === 'All' ? 'TongHop' : sessionFilter}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

// Chèn gọi loadSessions vào window.onload
const oldOnload = window.onload;
window.onload = function() {
    if(oldOnload) oldOnload();
    loadSessions();
};
