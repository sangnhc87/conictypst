import { useState } from 'react';
import { SUBJECT_OPTIONS } from '../config/subjectProfiles';

type SubjectOnboardingProps = {
  email?: string | null;
  onChoose: (subject: string) => Promise<void>;
  onLogout: () => void;
};

export function SubjectOnboarding({ email, onChoose, onLogout }: SubjectOnboardingProps) {
  const [selectedSubject, setSelectedSubject] = useState('');
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');

  const choose = async () => {
    if (!selectedSubject || saving) return;
    setSaving(true);
    setError('');
    try {
      await onChoose(selectedSubject);
    } catch (reason) {
      setError(reason instanceof Error ? reason.message : 'Chưa lưu được môn chuyên môn. Hãy thử lại.');
      setSaving(false);
    }
  };

  return (
    <main className="subject-onboarding-shell">
      <section className="subject-onboarding-card">
        <div className="subject-onboarding-brand"><span>✦</span><b>Trình Chiếu</b><small>AI Lesson Studio</small></div>
        <div className="subject-onboarding-copy">
          <span className="subject-onboarding-kicker">THIẾT LẬP KHÔNG GIAN CỦA BẠN</span>
          <h1>Thầy/Cô đang dạy môn nào?</h1>
          <p>Chọn một môn để chúng tôi tập trung đúng cấu trúc đề, mẫu Word, hướng dẫn và công cụ cần thiết. Có thể nhờ quản trị viên đổi môn sau này.</p>
        </div>
        <div className="subject-choice-grid">
          {SUBJECT_OPTIONS.map((option) => (
            <button
              key={option.subject}
              className={`subject-choice ${selectedSubject === option.subject ? 'is-selected' : ''}`}
              onClick={() => setSelectedSubject(option.subject)}
            >
              <span className="subject-choice-icon">{option.icon}</span>
              <span><strong>{option.subject}</strong><small>{option.description}</small></span>
              <i>{selectedSubject === option.subject ? '✓' : '›'}</i>
            </button>
          ))}
        </div>
        {selectedSubject === 'Tiếng Anh' && <div className="subject-onboarding-note">✦ Tiếng Anh mặc định chỉ mở hai không gian chính: tuyển sinh lớp 10 và tốt nghiệp 12. Cấu trúc tỉnh khác nằm trong phần nâng cao.</div>}
        {error && <div className="subject-onboarding-error">⚠ {error}</div>}
        <div className="subject-onboarding-actions">
          <span>Đã đăng nhập: <b>{email || 'Gmail'}</b></span>
          <div>
            <button className="subject-logout-button" onClick={onLogout}>Đăng xuất</button>
            <button className="subject-continue-button" disabled={!selectedSubject || saving} onClick={() => void choose()}>{saving ? 'Đang lưu…' : 'Vào không gian của tôi →'}</button>
          </div>
        </div>
        <small className="subject-onboarding-privacy">Lựa chọn này được lưu theo tài khoản Gmail để lần sau mở đúng không gian, không làm lẫn các môn khác.</small>
      </section>
    </main>
  );
}
