import { useState } from 'react';
import { Navigate, Route, Routes, useLocation } from 'react-router-dom';
import { examMembership, useAuth } from './auth/AuthContext';
import { LoadingScreen, Notice } from './components/UI';
import QuestionRenderer from './components/QuestionRenderer';
import LandingPage from './pages/LandingPage';
import AdminPortal from './pages/AdminPortal';
import TeacherPortal, { PackageEditor } from './pages/TeacherPortal';
import StudentPortal from './pages/StudentPortal';
import ExamPlayer from './pages/ExamPlayer';
import ResultPage from './pages/ResultPage';
import PricingPage from './pages/PricingPage';
import PaymentResultPage from './pages/PaymentResultPage';
import DemoExam from './pages/DemoExam';

function RequireSignedIn({ children }) {
  const { user, status, error, signIn } = useAuth();
  const location = useLocation();
  if (['booting', 'exchanging', 'loading-account'].includes(status)) return <LoadingScreen />;
  if (!user) {
    return (
      <div className="gate-screen">
        <span className="brand-mark">C</span>
        <h1>Cần đăng nhập để tiếp tục</h1>
        <p>Conic Exam dùng tài khoản Google đã xác minh để bảo vệ lớp và bài thi.</p>
        {error && <Notice tone="danger">{error}</Notice>}
        <button className="button button--primary" type="button" onClick={signIn}>Đăng nhập Google</button>
        <a href={`/?next=${encodeURIComponent(location.pathname)}`}>Quay về trang chủ</a>
      </div>
    );
  }
  return children;
}

function RequireTeacher({ children }) {
  const { account } = useAuth();
  if (!account?.isAdmin && !examMembership(account)?.hasAccess) return <Navigate to="/" replace />;
  return children;
}

function RequireAdmin({ children }) {
  const { account } = useAuth();
  if (!account?.isAdmin) return <Navigate to="/" replace />;
  return children;
}

function PublisherPreviewDev() {
  const [payload, setPayload] = useState(() => JSON.parse(sessionStorage.getItem('__conicPublisherPreview') || '{"publicItems":[],"answerKey":[]}'));
  const [selected, setSelected] = useState(0);
  const limit = Math.max(1, Number(new URLSearchParams(location.search).get('limit')) || 6);
  const editor = new URLSearchParams(location.search).get('editor') === '1';
  if (editor) {
    const counts = (payload.publicItems || []).reduce((result, item) => ({ ...result, [item.type]: (result[item.type] || 0) + 1 }), {});
    const maxScore = (payload.answerKey || []).reduce((sum, item) => sum + Number(item.points || 0), 0);
    return <main style={{ width: 'min(1160px, calc(100% - 32px))', margin: '32px auto' }}><PackageEditor payload={payload} report={{ counts, maxScore }} sourceLabel="Kiểm thử giao diện" selected={selected} onSelect={setSelected} onChange={setPayload} /></main>;
  }
  return <main style={{ width: 'min(980px, calc(100% - 32px))', margin: '32px auto' }}>
    {payload.publicItems.slice(0, limit).map((item, index) => <QuestionRenderer key={item.id} item={item} number={index + 1} disabled onChange={() => {}} />)}
  </main>;
}

export default function App() {
  const { status } = useAuth();
  if (status === 'booting') return <LoadingScreen />;

  return (
    <Routes>
      <Route path="/" element={<LandingPage />} />
      <Route path="/student" element={<RequireSignedIn><StudentPortal /></RequireSignedIn>} />
      <Route path="/attempt/:attemptId" element={<RequireSignedIn><ExamPlayer /></RequireSignedIn>} />
      <Route path="/result/:attemptId" element={<RequireSignedIn><ResultPage /></RequireSignedIn>} />
      <Route path="/teacher" element={<RequireSignedIn><RequireTeacher><TeacherPortal /></RequireTeacher></RequireSignedIn>} />
      <Route path="/teacher/pricing" element={<RequireSignedIn><PricingPage /></RequireSignedIn>} />
      <Route path="/teacher/payment/success" element={<RequireSignedIn><PaymentResultPage isSuccess={true} /></RequireSignedIn>} />
      <Route path="/teacher/payment/cancel" element={<RequireSignedIn><PaymentResultPage isSuccess={false} /></RequireSignedIn>} />
      <Route path="/admin" element={<RequireSignedIn><RequireAdmin><AdminPortal /></RequireAdmin></RequireSignedIn>} />
      <Route path="/demo" element={<DemoExam />} />
      {import.meta.env.DEV && <Route path="/__publisher-preview" element={<PublisherPreviewDev />} />}
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
}
