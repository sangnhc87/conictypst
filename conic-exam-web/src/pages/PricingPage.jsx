import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth, examMembership } from '../auth/AuthContext';
import { Button, Notice, LoadingScreen } from '../components/UI';

const PLANS = [
  {
    id: 'exam-basic-1y',
    title: 'Gói Cơ Bản (1 Năm)',
    price: '299.000đ',
    duration: '365 ngày',
    features: ['Giới hạn 100 học sinh', 'Tối đa 10 lớp học', 'Tổ chức thi không giới hạn'],
    popular: false,
  },
  {
    id: 'exam-pro-2y',
    title: 'Gói Pro (2 Năm)',
    price: '499.000đ',
    duration: '2 năm',
    features: ['Giới hạn 500 học sinh', 'Tối đa 30 lớp học', 'Hỗ trợ ưu tiên'],
    popular: true,
  },
  {
    id: 'exam-vip-5y',
    title: 'Gói VIP (5 Năm)',
    price: '999.000đ',
    duration: '5 năm',
    features: ['Không giới hạn học sinh', 'Không giới hạn lớp', 'Cam kết 5 năm không đổi giá'],
    popular: false,
  },
];

export default function PricingPage() {
  const { account, api, refreshAccount } = useAuth();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  
  const membership = examMembership(account);
  const isActive = membership?.status === 'active';

  async function handleCheckout(planId) {
    setLoading(true);
    setError('');
    try {
      const result = await api.createPayment(planId);
      if (result.checkoutUrl) {
        window.location.href = result.checkoutUrl;
      }
    } catch (err) {
      setError(err.message || 'Có lỗi xảy ra khi tạo thanh toán.');
      setLoading(false);
    }
  }

  async function handleTrial() {
    setLoading(true);
    setError('');
    try {
      await api.requestTeacherAccess('Kích hoạt dùng thử 7 ngày (Try)');
      await refreshAccount();
      navigate('/teacher');
    } catch (err) {
      setError(err.message || 'Không thể kích hoạt dùng thử.');
      setLoading(false);
    }
  }

  if (loading) return <LoadingScreen />;

  return (
    <div style={{ maxWidth: '1000px', margin: '40px auto', padding: '0 20px', fontFamily: 'system-ui, sans-serif' }}>
      <div style={{ textAlign: 'center', marginBottom: '40px' }}>
        <h1 style={{ color: '#123b5b', fontSize: '2.5rem', marginBottom: '16px' }}>Nâng Cấp Gói Giáo Viên</h1>
        <p style={{ color: '#555', fontSize: '1.1rem' }}>Sử dụng toàn bộ tính năng chấm thi, quản lý lớp của Conic Exam.</p>
        {error && <Notice tone="danger" style={{ marginTop: '20px' }}>{error}</Notice>}
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', gap: '24px', alignItems: 'center' }}>
        {PLANS.map((plan) => (
          <div key={plan.id} style={{ 
            border: plan.popular ? '2px solid #caa655' : '1px solid #ddd', 
            borderRadius: '12px', 
            padding: '32px 24px',
            backgroundColor: '#fff',
            position: 'relative',
            boxShadow: plan.popular ? '0 12px 24px rgba(202, 166, 85, 0.15)' : '0 4px 12px rgba(0,0,0,0.05)',
            transform: plan.popular ? 'scale(1.05)' : 'none',
            zIndex: plan.popular ? 2 : 1
          }}>
            {plan.popular && (
              <div style={{ position: 'absolute', top: '-12px', left: '50%', transform: 'translateX(-50%)', background: '#caa655', color: '#fff', padding: '4px 12px', borderRadius: '20px', fontSize: '0.8rem', fontWeight: 'bold' }}>
                ĐƯỢC CHỌN NHIỀU
              </div>
            )}
            <h3 style={{ color: '#123b5b', margin: '0 0 16px 0', fontSize: '1.25rem' }}>{plan.title}</h3>
            <div style={{ fontSize: '2rem', fontWeight: 'bold', color: '#123b5b', marginBottom: '8px' }}>{plan.price}</div>
            <div style={{ color: '#666', marginBottom: '24px', fontSize: '0.9rem' }}>/ {plan.duration}</div>
            
            <ul style={{ listStyle: 'none', padding: 0, margin: '0 0 32px 0', textAlign: 'left' }}>
              {plan.features.map((feature, i) => (
                <li key={i} style={{ marginBottom: '12px', color: '#444', display: 'flex', alignItems: 'flex-start' }}>
                  <span style={{ color: '#caa655', marginRight: '8px', fontWeight: 'bold' }}>✓</span> {feature}
                </li>
              ))}
            </ul>
            
            <Button 
              onClick={() => handleCheckout(plan.id)} 
              style={{ 
                width: '100%', 
                background: plan.popular ? '#123b5b' : '#f0f0f0', 
                color: plan.popular ? '#fff' : '#123b5b',
                border: 'none',
                padding: '12px',
                borderRadius: '6px',
                fontWeight: 'bold',
                cursor: 'pointer'
              }}
            >
              Chọn gói này
            </Button>
          </div>
        ))}
      </div>

      {!isActive && (
        <div style={{ textAlign: 'center', marginTop: '48px', padding: '32px', background: '#f8f9fa', borderRadius: '12px' }}>
          <h3 style={{ color: '#123b5b', marginBottom: '16px' }}>Bạn mới tìm hiểu?</h3>
          <p style={{ color: '#666', marginBottom: '24px' }}>Trải nghiệm tất cả tính năng Pro trong vòng 7 ngày hoàn toàn miễn phí.</p>
          <Button onClick={handleTrial} style={{ background: '#fff', color: '#123b5b', border: '1px solid #123b5b', padding: '10px 24px', borderRadius: '6px', cursor: 'pointer' }}>
            Kích hoạt dùng thử (Try)
          </Button>
        </div>
      )}
    </div>
  );
}
