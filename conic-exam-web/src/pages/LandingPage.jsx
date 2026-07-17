import { useState } from 'react';
import { Link } from 'react-router-dom';
import { APP_CONFIG } from '../config';
import { examMembership, useAuth } from '../auth/AuthContext';
import { Button, Card, Notice, Pill, formatDate } from '../components/UI';
import { Shell } from '../components/Shell';

export default function LandingPage() {
  const { user, account, status, error, signIn, api, refreshAccount, setError } = useAuth();
  const [requesting, setRequesting] = useState(false);
  const membership = examMembership(account);

  async function requestAccess() {
    setRequesting(true);
    setError('');
    try {
      await api.requestTeacherAccess('Đăng ký gói Conic Exam giáo viên 12 tháng.');
      await refreshAccount();
    } catch (cause) {
      setError(cause.message);
    } finally {
      setRequesting(false);
    }
  }

  if (!user) {
    return (
      <div className="landing">
        <header className="landing__nav">
          <a className="topbar__brand" href="#top"><span className="brand-mark brand-mark--small">C</span><span><strong>Conic Exam</strong><small>by ConicTypst</small></span></a>
          <a href="#features">Năng lực</a><a href="#pricing">Dành cho giáo viên</a>
          <Button onClick={signIn} busy={status === 'exchanging'}>Đăng nhập Google</Button>
        </header>
        <main id="top">
          <section className="hero-public">
            <div className="hero-public__copy">
              <Pill tone="success">Typst Sang-Math → Online · PDF · OMR</Pill>
              <h1>Một nguồn đề.<br /><em>Ba cách tổ chức thi.</em></h1>
              <p>Phát hành đề trực tuyến chuyên nghiệp, quản lý lớp riêng, duyệt học sinh, tự lưu bản nháp trên thiết bị và chấm hoàn toàn phía máy chủ khi nộp.</p>
              {error && <Notice tone="danger">{error}</Notice>}
              <div className="hero-public__actions"><Button onClick={signIn}>Bắt đầu bằng Google</Button><a className="button button--secondary" href="#features">Xem hệ thống</a></div>
              <div className="trust-row"><span>✓ Đáp án không xuống máy học sinh</span><span>✓ Reload vẫn khôi phục trên cùng thiết bị</span><span>✓ Chuẩn 12–4–6</span></div>
            </div>
            <div className="hero-public__visual" aria-label="Minh họa luồng tổ chức kỳ thi">
              <div className="visual-window">
                <div className="visual-window__bar"><i /><i /><i /><span>Đợt thi · Lớp 12A1</span></div>
                <div className="visual-grid">
                  <article><small>Đang làm</small><strong>28</strong><span className="spark spark--teal" /></article>
                  <article><small>Đã nộp</small><strong>14</strong><span className="spark spark--gold" /></article>
                  <div className="visual-chart"><b>Phổ điểm trực tiếp</b><div>{[32, 48, 76, 58, 91, 70, 44].map((height, index) => <i key={index} style={{ height: `${height}%` }} />)}</div></div>
                  <div className="visual-students"><b>Tiến độ lớp học</b>{['Nguyễn Minh Anh', 'Trần Hoàng Nam', 'Lê Phương Linh'].map((name, index) => <span key={name}><i>{name[0]}</i><em>{name}</em><small>{index === 2 ? 'Đang làm' : 'Đã lưu'}</small></span>)}</div>
                </div>
              </div>
            </div>
          </section>
          <section id="features" className="feature-section">
            <p className="eyebrow">CONIC EXAM ENGINE</p><h2>Đủ sâu cho thi thật, đủ nhẹ để giáo viên tự vận hành</h2>
            <div className="feature-grid">
              <Card><span>⌘</span><h3>Xuất bản từ Typst</h3><p>Giữ chất lượng công thức và hình vẽ, tách gói đề công khai khỏi kho đáp án riêng.</p></Card>
              <Card><span>◎</span><h3>Lớp học độc lập</h3><p>Mỗi giáo viên có mã lớp, hàng chờ duyệt học sinh và dữ liệu hoàn toàn tách biệt.</p></Card>
              <Card><span>↻</span><h3>Thi bền bỉ</h3><p>Server giữ thời gian; trình duyệt tự lưu cục bộ và chỉ gửi một gói đáp án cuối cùng khi nộp.</p></Card>
              <Card><span>▥</span><h3>Báo cáo theo câu</h3><p>Phân tích TN, Đ/S, TLN, tự luận và nối cùng Item ID với kết quả OMR.</p></Card>
            </div>
          </section>
          <section id="pricing" className="pricing-section">
            <div><p className="eyebrow">GÓI GIÁO VIÊN</p><h2>100.000đ cho trọn một năm</h2><p>Anh Sang duyệt từng tài khoản giáo viên. Giáo viên tự tạo lớp và tự quản lý học sinh của mình.</p></div>
            <Card className="price-card"><Pill tone="success">12 tháng</Pill><strong>100.000<small>đ / năm</small></strong><ul><li>10 lớp học</li><li>500 học sinh</li><li>200 đề đã phát hành</li><li>12.000 lượt thi / năm</li></ul><Button onClick={signIn}>Đăng ký tài khoản</Button></Card>
          </section>
        </main>
      </div>
    );
  }

  return (
    <Shell>
      <section className="dashboard-hero">
        <div><p className="eyebrow">TRUNG TÂM CONIC EXAM</p><h1>Xin chào, {account?.profile?.displayName || user.displayName}.</h1><p>Chọn không gian làm việc phù hợp với vai trò hôm nay.</p></div>
        <div className="dashboard-hero__badge"><span className="live-dot" /><span><small>Hệ thống</small><strong>Đang hoạt động</strong></span></div>
      </section>
      {error && <Notice tone="danger" onClose={() => setError('')}>{error}</Notice>}
      <div className="role-grid">
        <Card className="role-card role-card--student"><span className="role-card__icon">HS</span><div><Pill tone="success">Học sinh</Pill><h2>Vào lớp và làm bài</h2><p>Nhập mã lớp giáo viên cung cấp, theo dõi yêu cầu và tiếp tục các lượt thi đang làm.</p><Link className="button button--primary" to="/student">Mở cổng học sinh</Link></div></Card>
        <Card className="role-card role-card--teacher"><span className="role-card__icon">GV</span><div><Pill tone={membership?.hasAccess || account?.isAdmin ? 'success' : 'warning'}>{membership?.hasAccess || account?.isAdmin ? 'Đã kích hoạt' : 'Gói 100.000đ/năm'}</Pill><h2>Tổ chức lớp và kỳ thi</h2>
          {account?.isAdmin ? <><p>Chủ hệ thống có quyền mở không gian giáo viên để kiểm thử và vận hành.</p><Link className="button button--primary" to="/teacher">Mở bảng điều khiển</Link></> : membership?.hasAccess ? <><p>Quyền giáo viên còn hạn đến {formatDate(membership.accessEndsAt)}.</p><Link className="button button--primary" to="/teacher">Mở bảng điều khiển</Link></> : membership?.status === 'pending' ? <><p>Yêu cầu của thầy/cô đang chờ quản trị viên xác minh và kích hoạt.</p><Button disabled>Đang chờ duyệt</Button></> : <><p>Đăng ký quyền giáo viên, sau đó liên hệ quản trị viên để xác minh thanh toán.</p><Button onClick={requestAccess} busy={requesting}>Đăng ký quyền giáo viên</Button></>}
        </div></Card>
        {account?.isAdmin && <Card className="role-card role-card--admin"><span className="role-card__icon">QT</span><div><Pill tone="danger">Chủ hệ thống</Pill><h2>Duyệt và vận hành SaaS</h2><p>Xử lý giáo viên đăng ký, thời hạn thuê bao, hạn mức và nhật ký quản trị.</p><Link className="button button--primary" to="/admin">Mở trung tâm quản trị</Link></div></Card>}
      </div>
      <p className="subtle-note">Tài khoản: {user.email} · Trạng thái đồng bộ: {status}</p>
    </Shell>
  );
}
