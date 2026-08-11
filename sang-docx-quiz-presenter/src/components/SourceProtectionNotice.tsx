type SourceProtectionNoticeProps = {
  onClose: () => void;
};

export function SourceProtectionNotice({ onClose }: SourceProtectionNoticeProps) {
  return (
    <div className="source-protection-backdrop" role="dialog" aria-modal="true" aria-label="Cảnh báo bản quyền">
      <section className="source-protection-card">
        <div className="source-protection-icon">🔐</div>
        <span className="source-protection-kicker">BẢN QUYỀN · CONIC LESSON STUDIO</span>
        <h2>Vui lòng không xem hoặc sao chép source</h2>
        <p>Mã nguồn, cấu trúc xử lý đề, prompt chuyên môn và giao diện là tài sản phát triển riêng của hệ thống. Việc sao chép, phát tán hoặc sử dụng lại khi chưa được cho phép là vi phạm điều khoản sử dụng.</p>
        <p className="source-protection-note">Tài khoản quản trị được miễn cảnh báo trong quá trình phát triển và kiểm thử.</p>
        <button className="source-protection-close" onClick={onClose}>Tôi hiểu · Tiếp tục sử dụng</button>
      </section>
    </div>
  );
}
