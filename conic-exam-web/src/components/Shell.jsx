import { NavLink } from 'react-router-dom';
import { useAuth, examMembership } from '../auth/AuthContext';
import { Button, Pill } from './UI';

export function Shell({ children, section = 'home' }) {
  const { account, user, signOut } = useAuth();
  const membership = examMembership(account);
  const isAdmin = account?.isAdmin;
  const isTeacher = membership?.hasAccess || isAdmin;

  return (
    <div className="app-shell">
      <header className="topbar">
        <NavLink to="/" className="topbar__brand" aria-label="Conic Exam — trang chủ">
          <span className="brand-mark brand-mark--small">C</span>
          <span><strong>Conic Exam</strong><small>Thi trực tuyến từ Typst</small></span>
        </NavLink>
        <nav className="topbar__nav" aria-label="Điều hướng chính">
          <NavLink to="/" className={section === 'home' ? 'is-active' : ''}>Trang chủ</NavLink>
          {isTeacher && <NavLink to="/teacher" className={section === 'teacher' ? 'is-active' : ''}>Giáo viên</NavLink>}
          <NavLink to="/student" className={section === 'student' ? 'is-active' : ''}>Học sinh</NavLink>
          {isAdmin && <NavLink to="/admin" className={section === 'admin' ? 'is-active' : ''}>Quản trị</NavLink>}
        </nav>
        <div className="topbar__account">
          {membership?.status && <Pill tone={membership.hasAccess ? 'success' : 'warning'}>{membership.hasAccess ? 'GV đã duyệt' : membership.status}</Pill>}
          {user?.photoURL ? <img src={user.photoURL} alt="" referrerPolicy="no-referrer" /> : <span className="avatar-fallback">{(user?.displayName || '?')[0]}</span>}
          <span className="topbar__identity"><strong>{user?.displayName || 'Tài khoản'}</strong><small>{user?.email}</small></span>
          <Button variant="ghost" onClick={signOut} title="Đăng xuất">Đăng xuất</Button>
        </div>
      </header>
      <main className="workspace">{children}</main>
      <footer className="footer"><span>© 2026 ConicTypst</span><span>Đề an toàn · Chấm phía máy chủ · Dữ liệu tách theo giáo viên</span></footer>
    </div>
  );
}
