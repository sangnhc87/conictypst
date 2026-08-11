import { useEffect, useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../auth/AuthContext';
import { Button, LoadingScreen, Notice } from '../components/UI';

export default function PaymentResultPage({ isSuccess }) {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const { api, refreshAccount } = useAuth();
  
  const [status, setStatus] = useState('checking');
  const [error, setError] = useState('');
  
  const orderCode = searchParams.get('orderCode');

  useEffect(() => {
    if (!isSuccess) {
      setStatus('canceled');
      return;
    }
    
    if (!orderCode) {
      setError('Thiếu mã đơn hàng.');
      setStatus('error');
      return;
    }

    async function checkStatus() {
      try {
        const res = await api.getPaymentStatus(orderCode);
        if (res.status === 'paid') {
          await refreshAccount();
          setStatus('paid');
        } else if (res.status === 'pending') {
          setStatus('pending_webhook');
        } else {
          setStatus('error');
          setError(`Trạng thái đơn hàng: ${res.status}`);
        }
      } catch (err) {
        setStatus('error');
        setError(err.message || 'Lỗi kiểm tra trạng thái.');
      }
    }
    
    checkStatus();
  }, [orderCode, isSuccess, api, refreshAccount]);

  const boxStyle = {
    maxWidth: '500px', margin: '80px auto', padding: '40px', 
    background: '#fff', borderRadius: '12px', textAlign: 'center',
    boxShadow: '0 8px 24px rgba(0,0,0,0.08)',
    borderTop: isSuccess ? '6px solid #28a745' : '6px solid #dc3545',
    fontFamily: 'system-ui, sans-serif'
  };

  if (status === 'checking') return <LoadingScreen />;

  return (
    <div style={boxStyle}>
      {status === 'paid' && (
        <>
          <div style={{ fontSize: '48px', marginBottom: '16px' }}>🎉</div>
          <h2 style={{ color: '#123b5b', marginBottom: '16px' }}>Thanh Toán Thành Công!</h2>
          <p style={{ color: '#555', marginBottom: '24px' }}>
            Cảm ơn thầy cô đã ủng hộ. Gói cước của thầy cô đã được kích hoạt thành công.
          </p>
          <Button onClick={() => navigate('/teacher')} style={{ background: '#123b5b', color: '#fff' }}>Vào Không Gian Quản Lý</Button>
        </>
      )}

      {status === 'pending_webhook' && (
        <>
          <div style={{ fontSize: '48px', marginBottom: '16px' }}>⏳</div>
          <h2 style={{ color: '#123b5b', marginBottom: '16px' }}>Đang Chờ Xác Nhận</h2>
          <p style={{ color: '#555', marginBottom: '24px' }}>
            Hệ thống đang chờ phản hồi từ ngân hàng. Quyền lợi sẽ được tự động kích hoạt sau vài phút.
          </p>
          <Button onClick={() => window.location.reload()} style={{ background: '#caa655', color: '#fff' }}>Kiểm Tra Lại</Button>
        </>
      )}

      {status === 'canceled' && (
        <>
          <div style={{ fontSize: '48px', marginBottom: '16px' }}>🛑</div>
          <h2 style={{ color: '#123b5b', marginBottom: '16px' }}>Đã Hủy Thanh Toán</h2>
          <p style={{ color: '#555', marginBottom: '24px' }}>
            Quá trình thanh toán đã bị hủy hoặc chưa hoàn tất.
          </p>
          <Button onClick={() => navigate('/teacher/pricing')}>Thử Lại</Button>
        </>
      )}

      {status === 'error' && (
        <>
          <div style={{ fontSize: '48px', marginBottom: '16px' }}>⚠️</div>
          <h2 style={{ color: '#123b5b', marginBottom: '16px' }}>Có Lỗi Xảy Ra</h2>
          <Notice tone="danger">{error}</Notice>
          <Button onClick={() => navigate('/teacher/pricing')} style={{ marginTop: '24px' }}>Quay lại</Button>
        </>
      )}
    </div>
  );
}
