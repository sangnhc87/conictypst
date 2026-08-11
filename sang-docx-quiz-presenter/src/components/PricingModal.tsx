import React, { useState } from 'react';
import './PricingModal.css';

interface PricingModalProps {
  onClose: () => void;
  onSelectPlan: (planId: string, price: number) => void;
}

export function PricingModal({ onClose, onSelectPlan }: PricingModalProps) {
  const [loadingPlan, setLoadingPlan] = useState<string | null>(null);

  const handleSelect = async (planId: string, price: number) => {
    setLoadingPlan(planId);
    await onSelectPlan(planId, price);
    setLoadingPlan(null);
  };

  return (
    <div className="pricing-modal-overlay">
      <div className="pricing-modal">
        <button className="close-btn" onClick={onClose}>×</button>

        <div className="pricing-proof-bar">
          <span>⭐</span>
          <span>Đang hỗ trợ giáo viên THPT trên khắp cả nước soạn đề siêu tốc</span>
        </div>

        <div className="pricing-header">
          <h2>Tài liệu (Word, PDF, Ảnh) → bài trình chiếu</h2>
          <p className="pricing-subtitle">
            Tập trung cho giáo viên Tiếng Anh: giữ cấu trúc đề, câu chùm, phương án, đáp án và lời giải để thầy cô duyệt trước khi lên lớp. DOCX có thể đọc cục bộ; PDF và ảnh dùng tuyến AI/OCR khi cần.
          </p>
        </div>

        <div className="pricing-cards">
          {/* Gói Tiêu Chuẩn */}
          <div className="pricing-card">
            <h3>Gói Tiêu Chuẩn <span className="plan-duration">(1 Năm)</span></h3>
            <div className="price">149.000đ<span>/năm</span></div>
            <div className="pricing-day-cost">≈ 410đ/ngày · ít hơn 1 tin nhắn Zalo</div>
            <ul>
              <li><span className="check-icon">✨</span> Dùng các cấu trúc Tiếng Anh đã chuẩn hóa theo từng khối</li>
              <li><span className="check-icon">✨</span> Soạn, trình chiếu và rà đáp án trong cùng một nơi</li>
              <li><span className="check-icon">✨</span> Xuất HTML, Word, Typst và LaTeX khi cần</li>
            </ul>
            <button
              className="buy-btn"
              onClick={() => handleSelect('1_YEAR', 149000)}
              disabled={loadingPlan !== null}
            >
              {loadingPlan === '1_YEAR' ? 'Đang tạo link...' : 'Bắt đầu ngay'}
            </button>
          </div>

          {/* Gói Chuyên Nghiệp - Đề Xuất */}
          <div className="pricing-card highlighted">
            <div className="ribbon">ĐƯỢC CHỌN NHIỀU NHẤT</div>
            <div className="highlight-glow"></div>
            <h3>Gói Chuyên Nghiệp <span className="plan-duration">(2 Năm)</span></h3>
            <div className="price">249.000đ<span>/2 năm</span></div>
            <div className="save-badge">🎉 Tiết kiệm 49.000đ · liên tục qua 2 năm học</div>
            <ul>
              <li><span className="check-icon">🚀</span> Toàn bộ đặc quyền của gói 1 Năm</li>
              <li><span className="check-icon">🚀</span> Dùng liên tục trong 2 năm học</li>
              <li><span className="check-icon">🚀</span> Mở thêm các cấu trúc tỉnh/thành khi hệ thống cập nhật</li>
              <li><span className="check-icon">🚀</span> Kênh hỗ trợ ưu tiên trực tiếp qua Zalo, Facebook</li>
            </ul>
            <button
              className="buy-btn primary"
              onClick={() => handleSelect('2_YEAR', 249000)}
              disabled={loadingPlan !== null}
            >
              {loadingPlan === '2_YEAR' ? 'Đang tạo link...' : 'Chọn Gói Này'}
            </button>
          </div>

          {/* Gói Đặc Quyền VIP */}
          <div className="pricing-card vip">
            <h3>Gói Đặc Quyền VIP <span className="plan-duration">(5 Năm)</span></h3>
            <div className="price vip-price">499.000đ<span>/5 năm</span></div>
            <div className="save-badge">🏆 Rẻ hơn 50% · Đầu tư 1 lần dùng 5 năm</div>
            <ul>
              <li><span className="check-icon">💎</span> Dùng liên tục trong 5 năm</li>
              <li><span className="check-icon">💎</span> Nhận sớm các cấu trúc và tính năng mới</li>
              <li><span className="check-icon">💎</span> Hỗ trợ ưu tiên theo phạm vi gói</li>
              <li><span className="check-icon">💎</span> Có thể đề xuất cấu trúc đặc thù để phát triển</li>
            </ul>
            <button
              className="buy-btn vip-btn"
              onClick={() => handleSelect('5_YEAR', 499000)}
              disabled={loadingPlan !== null}
            >
              {loadingPlan === '5_YEAR' ? 'Đang tạo link...' : 'Mua Gói VIP'}
            </button>
          </div>
        </div>

        <div className="pricing-trust-bar">
          <span className="trust-item"><span className="icon">🔒</span> Thanh toán qua PayOS</span>
          <span className="divider">·</span>
          <span className="trust-item"><span className="icon">📄</span> Gmail thanh toán được cấp quyền tự động</span>
          <span className="divider">·</span>
          <span className="trust-item"><span className="icon">💬</span> Có thể dùng thử trước khi mua</span>
        </div>
      </div>
    </div>
  );
}
