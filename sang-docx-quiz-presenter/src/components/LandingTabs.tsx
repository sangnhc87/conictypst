import { useEffect, useMemo, useState } from "react";
import "./LandingTabs.css";
import { profileLevelLabel, SUBJECT_PROFILES } from "../config/subjectProfiles";

export type SampleCard = {
  id: string;
  profileId: string;
  subject: string;
  grade: string;
  gradeValue: string;
  title: string;
  description: string;
  icon: string;
  tags: string[];
  docxUrl?: string;
  docxFileName?: string;
};

export const SAMPLE_CARDS: SampleCard[] = SUBJECT_PROFILES.map((profile) => {
  const base: SampleCard = {
    id: profile.id,
    profileId: profile.id,
    subject: profile.subject,
    grade: profileLevelLabel(profile),
    gradeValue: profile.defaultGrade,
    title: profile.label,
    description: profile.description,
    icon: profile.icon,
    tags: [...new Set(profile.sections.slice(0, 3).flatMap((section) => section.formats.slice(0, 1)))],
  };
  if (profile.id === "english-10-hcm-v1") {
    return {
      ...base,
      id: "english-10-hcm-tphcm-2026-2027",
      title: "Đề tuyển sinh lớp 10 · Sở GDĐT TP.HCM 2026–2027",
      description: "Mẫu Word thật 40 câu/90 phút: ngữ âm, trọng âm, ngôn ngữ, giao tiếp, biển báo, cloze, đọc hiểu Đúng–Sai + trắc nghiệm, word form, cụm từ và viết lại câu.",
      tags: ["DOCX gốc", "40 câu", "90 phút", "Đọc + Đúng–Sai", "Word form"],
      docxUrl: "/samples/thuvienhoclieu.com-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-TP-HCM-nam-26-27-.docx",
      docxFileName: "thuvienhoclieu.com-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-TP-HCM-nam-26-27-.docx",
    };
  }
  if (profile.id === "english-10-v1") {
    return {
      ...base,
      id: "english-10-hanoi-2026-2027",
      title: "Đề tuyển sinh lớp 10 · Sở GDĐT Hà Nội 2026–2027",
      description: "Mẫu Word thật 40 câu/60 phút: ngôn ngữ & giao tiếp, phát âm, đọc hiểu, hoàn thành/sắp xếp, trọng âm, thông báo, cloze, viết câu và gapped text.",
      tags: ["DOCX gốc", "40 câu", "60 phút", "Đọc hiểu", "Cloze + gapped text"],
      docxUrl: "/samples/HN-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-Ha-Noi-nam-26-27.docx",
      docxFileName: "HN-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-Ha-Noi-nam-26-27.docx",
    };
  }
  if (profile.id === "history-thpt-v1") {
    return {
      ...base,
      id: "history-thpt-2026-real-sample",
      title: "Đề tốt nghiệp THPT môn Lịch sử 2026 · Mã đề 0828",
      description: "Đúng file Word bạn gửi: 24 câu A–D ở Phần I và 4 câu chùm tư liệu Đúng/Sai ở Phần II; có bảng đáp án và lời giải tham khảo.",
      tags: ["DOCX gốc", "24 câu A–D", "4 câu tư liệu", "Đúng/Sai", "50 phút"],
      docxUrl: "/samples/lich-su-tot-nghiep-2026.docx",
      docxFileName: "lich-su-tot-nghiep-2026.docx",
    };
  }
  if (profile.id === "biology-thpt-v1") {
    return {
      ...base,
      id: "biology-thpt-2026-real-sample",
      title: "Đề tốt nghiệp THPT môn Sinh học 2026 · Mã đề 0430",
      description: "Đúng file Word bạn gửi: 18 câu A–D, 4 nhóm Đúng/Sai, 6 câu trả lời ngắn; giữ sơ đồ gene, lưới thức ăn, bảng số liệu, đồ thị, công thức và lời giải.",
      tags: ["DOCX gốc", "18 câu A–D", "4 nhóm dữ kiện", "6 câu ngắn", "Hình + OLE"],
      docxUrl: "/samples/sinh-hoc-tot-nghiep-2026.docx",
      docxFileName: "sinh-hoc-tot-nghiep-2026.docx",
    };
  }
  if (profile.id === "geography-thpt-v1") {
    return {
      ...base,
      id: "geography-thpt-2026-real-sample",
      title: "Đề tốt nghiệp THPT môn Địa lí 2026 · Mã đề 0920",
      description: "Đúng file Word bạn gửi: 18 câu A–D, 4 câu chùm Đúng/Sai, 6 câu trả lời ngắn; giữ nguyên 2 biểu đồ và bảng số liệu để trình chiếu rõ.",
      tags: ["DOCX gốc", "18 câu A–D", "4 câu tư liệu", "6 câu ngắn", "Biểu đồ + bảng"],
      docxUrl: "/samples/dia-ly-tot-nghiep-2026.docx",
      docxFileName: "dia-ly-tot-nghiep-2026.docx",
    };
  }
  if (profile.id === "physics-thpt-v1") {
    return {
      ...base,
      id: "physics-thpt-2026-real-sample",
      title: "Đề tốt nghiệp THPT môn Vật lí 2026 · Mã đề 0211",
      description: "Đúng file Word bạn gửi: 18 câu A–D, 4 nhóm Đúng/Sai, 6 câu trả lời ngắn; giữ hình thí nghiệm, công thức MathType/OLE, bảng đáp án và lời giải.",
      tags: ["DOCX gốc", "18 câu A–D", "4 nhóm Đúng/Sai", "6 câu ngắn", "Công thức + hình"],
      docxUrl: "/samples/vat-ly-tot-nghiep-2026.docx",
      docxFileName: "vat-ly-tot-nghiep-2026.docx",
    };
  }
  if (profile.id === "gdqp-10-v1") {
    return {
      ...base,
      id: "gdqp-10-2025-2026-real-sample",
      title: "Đề cương GDQP 10 · Ôn tập cuối HKI 2025–2026",
      description: "Đúng file Word bạn gửi: 30 câu A–D, 2 chủ đề tự luận và bảng đáp án; các phương án dài được xếp một cột để trình chiếu rõ.",
      tags: ["DOCX gốc", "30 câu A–D", "2 chủ đề tự luận", "Bảng đáp án", "Lớp 10"],
      docxUrl: "/samples/gdqp-10-cuoi-hki-2025-2026.docx",
      docxFileName: "gdqp-10-cuoi-hki-2025-2026.docx",
    };
  }
  if (profile.id === "informatics-thpt-v1") {
    return {
      ...base,
      id: "informatics-thpt-2026-real-sample",
      title: "Đề thi thử tốt nghiệp THPT môn Tin học 2026 · Mã đề 0501",
      description: "Đúng file Word bạn gửi từ Trường THPT Lê Trọng Tấn: 24 câu A–D và 6 câu Đúng/Sai; có phần chung, hai định hướng, bảng mã Python/C++, SQL, HTML/CSS và lời giải.",
      tags: ["DOCX gốc", "24 câu A–D", "6 câu Đúng/Sai", "Python/C++/SQL", "2 định hướng"],
      docxUrl: "/samples/tin-hoc-tot-nghiep-2026-le-trong-tan.docx",
      docxFileName: "tin-hoc-tot-nghiep-2026-le-trong-tan.docx",
    };
  }
  if (profile.id === "literature-thpt-v1") {
    return {
      ...base,
      id: "literature-thpt-2026-real-sample",
      title: "Đề tốt nghiệp THPT môn Ngữ văn 2026 · Bộ GDĐT",
      description: "Đúng file Word bạn gửi: một văn bản nghị luận + 5 câu Đọc hiểu (4,0 điểm), đoạn nghị luận xã hội khoảng 200 chữ (2,0 điểm), bài nghị luận văn học khoảng 600 chữ (4,0 điểm), kèm hướng dẫn chấm mở và lời giải tham khảo.",
      tags: ["DOCX gốc", "Đọc hiểu 5 câu", "Viết 200 chữ", "Viết 600 chữ", "Rubric mở"],
      docxUrl: "/samples/nguvan-totnghiep-2026.docx",
      docxFileName: "nguvan-totnghiep-2026.docx",
    };
  }
  if (profile.id !== "english-12-v1") return base;
  return {
    ...base,
    id: "english-12-bac-ninh-hk2-2025-2026",
    title: "Đề HK II lớp 12 · Sở GDĐT Bắc Ninh 2025–2026",
    description: "Mẫu Word thật 40 câu/60 phút: advertisement, leaflet, sắp xếp, cloze và hai bài đọc; có bảng đáp án và lời giải đầy đủ.",
    tags: ["DOCX gốc", "40 câu", "Dữ kiện chung", "Đáp án + lời giải"],
    docxUrl: "/samples/De-kiem-tra-HK2-Tieng-Anh-12-So-GD-Bac-Ninh-25-26.docx",
    docxFileName: "De-kiem-tra-HK2-Tieng-Anh-12-So-GD-Bac-Ninh-25-26.docx",
  };
});

type Props = {
  onOpenSample?: (sample: SampleCard) => void;
  onDownloadSample?: (sample: SampleCard) => void;
  onToggleSupport?: () => void;
  showSupport?: boolean;
  visibleProfileIds?: string[];
};

type Tab = "intro" | "features" | "guide" | "samples";

export function LandingTabs({ onOpenSample, onDownloadSample, onToggleSupport, showSupport, visibleProfileIds }: Props) {
  const [activeTab, setActiveTab] = useState<Tab>("intro");
  const [subjectFilter, setSubjectFilter] = useState("Tất cả");
  const scopedSamples = visibleProfileIds ? SAMPLE_CARDS.filter((sample) => visibleProfileIds.includes(sample.profileId)) : SAMPLE_CARDS;
  const subjects = useMemo(() => ["Tất cả", ...Array.from(new Set(scopedSamples.map((sample) => sample.subject)))], [scopedSamples]);
  const filteredSamples = subjectFilter === "Tất cả" ? scopedSamples : scopedSamples.filter((sample) => sample.subject === subjectFilter);
  useEffect(() => {
    if (!subjects.includes(subjectFilter)) setSubjectFilter("Tất cả");
  }, [subjectFilter, subjects]);

  const tabs: Array<{ id: Tab; label: string; icon: string }> = [
    { id: "intro", label: "Giới thiệu", icon: "✦" },
    { id: "features", label: "Siêu tính năng", icon: "⚡" },
    { id: "guide", label: "HDSD nhanh", icon: "▤" },
    { id: "samples", label: "Kho file mẫu", icon: "▦" },
  ];

  return (
    <section className="landing-tabs-container" aria-label="Thông tin Trình Chiếu AI">
      <div className="landing-tabs-heading">
        <div>
          <span className="section-kicker">CONIC LESSON STUDIO</span>
          <h2>Tạo bài giảng đẹp trong vài phút</h2>
          <p>Từ một tệp đề thô đến bộ slide có cấu trúc, công thức và đáp án để thầy cô chỉnh sửa ngay.</p>
        </div>
        <span className="tabs-status"><i /> Local-first · riêng tư · dễ kiểm tra</span>
      </div>
      <div className="landing-tabs-header" role="tablist">
        {tabs.map((tab) => (
          <button
            key={tab.id}
            role="tab"
            aria-selected={activeTab === tab.id}
            className={`tab-btn ${activeTab === tab.id ? "active" : ""}`}
            onClick={() => setActiveTab(tab.id)}
          >
            <span>{tab.icon}</span>{tab.label}
          </button>
        ))}
      </div>

      <div className="landing-tabs-content">
        {activeTab === "intro" && (
          <div className="tab-pane intro-pane fade-in">
            <div className="intro-copy">
              <span className="intro-badge">Dành cho giáo viên bận rộn</span>
              <h3>Không cần dàn trang lại từng câu hỏi.</h3>
              <p>Trình Chiếu giữ nguyên nội dung gốc, nhận diện công thức và hình ảnh, sau đó biến đề thành một không gian giảng dạy tương tác 16:9.</p>
              <div className="intro-points">
                <span><b>01</b> Ném PDF, Word hoặc ảnh</span>
                <span><b>02</b> Kiểm tra và sửa trực tiếp</span>
                <span><b>03</b> Bấm trình chiếu, xuất HTML</span>
                <a 
                  href="https://www.facebook.com/nguyenvan.sang.92798072/"
                  target="_blank"
                  rel="noreferrer"
                  style={{ textDecoration: 'none' }}
                >
                  <span 
                    style={{ color: 'var(--o600)', fontWeight: 700 }}
                    title="Bấm để kết nối hỗ trợ qua Facebook"
                  >
                    <b style={{ background: 'linear-gradient(135deg, var(--o600), var(--o400))' }}>04</b>
                    Liên hệ & Hỗ trợ kỹ thuật (VIP) ↗
                  </span>
                </a>
              </div>

              {/* Khung Thông tin & Kết nối Facebook hiển thị cố định bên trái */}
              <div style={{ marginTop: '24px', padding: '18px 20px', background: 'linear-gradient(135deg, #f8fafc 0%, #eef2ff 100%)', borderRadius: '16px', border: '1px solid #c7d2fe', display: 'flex', flexDirection: 'column', gap: '12px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                  <div style={{ fontSize: '24px', background: '#e0f2fe', width: '42px', height: '42px', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center', boxShadow: '0 2px 8px rgba(2, 132, 199, 0.15)' }}>🎧</div>
                  <div>
                    <h4 style={{ margin: 0, color: '#3730a3', fontSize: '15px', fontWeight: 800 }}>Trung tâm Hỗ trợ & Yêu cầu Cấu trúc</h4>
                    <p style={{ margin: '2px 0 0', color: 'var(--n600)', fontSize: '12px' }}>Sẵn sàng hỗ trợ thêm các cấu trúc bài giảng mong muốn của thành viên VIP.</p>
                  </div>
                </div>
                <p style={{ fontSize: '13px', color: 'var(--n700)', margin: 0, lineHeight: 1.5 }}>
                  Nếu Thầy/Cô có bất kỳ góp ý nào hoặc cần hỗ trợ kỹ thuật trong quá trình sử dụng, xin vui lòng liên hệ ngay hỗ trợ.
                </p>
                <div>
                  <a 
                    href="https://www.facebook.com/nguyenvan.sang.92798072/" 
                    target="_blank" 
                    rel="noreferrer" 
                    style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', background: '#4f46e5', color: '#fff', padding: '10px 18px', borderRadius: '10px', textDecoration: 'none', fontWeight: 700, fontSize: '13px', boxShadow: '0 2px 8px rgba(79, 70, 229, 0.25)' }}
                  >
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2.04C6.5 2.04 2 6.53 2 12.06C2 17.06 5.66 21.21 10.44 21.96V14.96H7.9V12.06H10.44V9.85C10.44 7.34 11.93 5.96 14.22 5.96C15.31 5.96 16.45 6.15 16.45 6.15V8.62H15.19C13.95 8.62 13.56 9.39 13.56 10.18V12.06H16.34L15.89 14.96H13.56V21.96A10 10 0 0 0 22 12.06C22 6.53 17.5 2.04 12 2.04Z"/></svg>
                    Kết nối qua Facebook để được hỗ trợ ↗
                  </a>
                </div>
              </div>
            </div>
            <div className="intro-visual">
              <div className="visual-window"><div className="visual-dots"><i /><i /><i /></div><div className="visual-title">BÀI GIẢNG · TOÁN 12</div><div className="visual-equation">f'(x) &gt; 0</div><div className="visual-bars"><span /><span /><span /><span /></div></div>
              <div className="visual-float float-one">✓ Công thức rõ nét</div>
              <div className="visual-float float-two">▶ Sẵn sàng trình chiếu</div>
            </div>
          </div>
        )}

        {activeTab === "features" && (
          <div className="tab-pane fade-in">
            <div className="features-grid">
              {[
                ["◈", "Local-first", "PDF có lớp chữ và DOCX được đọc ngay trên máy; chỉ bản quét mới cần OCR."],
                ["∑", "Công thức chuẩn", "Công thức, chỉ số, ký hiệu và hình minh họa được nhận diện chính xác — thầy cô chỉ cần kiểm tra và chỉnh nhẹ."],
                ["✣", "Ba lớp kiểm tra", "OCR nhận nội dung, parser tách cấu trúc, giáo viên duyệt lại trước khi xuất."],
                ["⌘", "Đủ mọi dạng câu", "Trắc nghiệm, đúng–sai, trả lời ngắn, tự luận và câu có hình/đồ thị."],
                ["▶", "Trình chiếu 16:9", "Hiệu ứng nhẹ, tương tác đáp án, âm thanh đúng/sai và chế độ toàn màn hình."],
                ["⬡", "Xuất linh hoạt", "HTML offline, ZIP, Word, Typst và JSON; hình ảnh được nhúng để không thất lạc."],
              ].map(([icon, title, text]) => (
                <article className="feature-item" key={title}><div className="feature-icon">{icon}</div><h3>{title}</h3><p>{text}</p></article>
              ))}
            </div>
          </div>
        )}

        {activeTab === "guide" && (
          <div className="tab-pane guide-pane fade-in">
            <div className="guide-steps">
              {[
                ["01", "Chọn tệp", "Kéo PDF, DOCX hoặc ảnh vào ô tải lên. Có thể bắt đầu bằng bài demo."],
                ["02", "Chọn chế độ", "Tự động là lựa chọn cân bằng. Tiết kiệm ưu tiên đọc cục bộ; chính xác dùng OCR khi cần."],
                ["03", "Duyệt nội dung", "Kiểm tra câu, đáp án, công thức và cảnh báo trong trình biên tập trước khi trình chiếu."],
                ["04", "Xuất & dạy", "Bấm Trình chiếu để dạy ngay, hoặc xuất HTML/ZIP để dùng offline trên máy chiếu."],
              ].map(([number, title, text]) => <div className="guide-step" key={number}><b>{number}</b><div><h3>{title}</h3><p>{text}</p></div></div>)}
            </div>
            <div className="guide-notes"><div><b>✓ Tệp tốt nhất</b><span>DOCX có Equation/MathType hoặc PDF rõ nét, thẳng trang.</span></div><div><b>⚠ Luôn duyệt</b><span>Ảnh mờ, bảng biểu và đáp án cần được giáo viên xác nhận trước khi xuất.</span></div><div><b>⌘ Tiết kiệm</b><span>Dùng Auto/Economy để không gửi PDF có chữ lên dịch vụ OCR.</span></div></div>
          </div>
        )}

        {activeTab === "samples" && (
          <div className="tab-pane samples-pane fade-in">
            <div className="samples-toolbar"><div><h3>Mẫu sẵn để thử ngay</h3><p>Chọn một môn để xem khung trình chiếu và tải tệp Word đúng cấu trúc để thay nội dung.</p></div><select value={subjectFilter} onChange={(event) => setSubjectFilter(event.target.value)} aria-label="Lọc môn học">{subjects.map((subject) => <option key={subject}>{subject}</option>)}</select></div>
            <div className="samples-grid">
              {filteredSamples.map((sample) => <article className="sample-card" key={sample.id}><div className="sample-card-top"><span className="sample-icon">{sample.icon}</span><span className="sample-grade">{sample.grade}</span></div><h4>{sample.subject} · {sample.title}</h4><p>{sample.description}</p><div className="sample-tags">{sample.tags.map((tag) => <span key={tag}>{tag}</span>)}</div><div className="sample-actions"><button className="sample-open" onClick={() => onOpenSample?.(sample)}>{sample.docxUrl ? "▶ Mở mẫu Word" : "▶ Mở khung"}</button><button className="sample-download" onClick={() => onDownloadSample?.(sample)}>{sample.docxUrl ? "⇩ Tải Word gốc" : "▣ Tải Word"}</button></div></article>)}
            </div>
            <p className="samples-footnote">Mỗi mẫu dùng đúng profile môn học, phần thi và công cụ soạn thảo tương ứng. Tiếng Anh tuyển sinh vào lớp 10 và Tiếng Anh tốt nghiệp THPT là hai cấu trúc độc lập.</p>
          </div>
        )}
      </div>
    </section>
  );
}
