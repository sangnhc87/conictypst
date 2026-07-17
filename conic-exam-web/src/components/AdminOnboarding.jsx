import { Link } from 'react-router-dom';
import { Card, Pill } from './UI';

export default function AdminOnboarding({ overview = {} }) {
  const hasTeachers = Number(overview.teachers || 0) > Number(overview.pendingTeachers || 0);
  const hasClasses = Number(overview.classrooms || 0) > 0;
  const hasAttempts = Number(overview.attempts || 0) > 0;

  const steps = [
    {
      done: hasTeachers,
      title: 'Duyệt thuê bao giáo viên',
      text: 'Xác minh thanh toán, bấm Duyệt 12 tháng; mọi thay đổi quyền được ghi vào Audit Trail.',
      action: <a className="text-button" href="#teacher-members">Đến danh sách giáo viên →</a>,
    },
    {
      done: hasClasses,
      title: 'Kiểm thử một tenant giáo viên',
      text: 'Owner có thể mở Không gian giáo viên để chạy đề mẫu. Dữ liệu thử này thuộc tenant owner, không nằm trong tenant của giáo viên khác.',
      action: <Link className="text-button" to="/teacher?tab=start">Mở hướng dẫn giáo viên →</Link>,
    },
    {
      done: hasAttempts,
      title: 'Kiểm thử hành trình học sinh',
      text: 'Dùng tài khoản Google khác ở cửa sổ ẩn danh: nhập mã lớp → chờ duyệt → làm bài → nộp → xem điểm theo chính sách.',
      action: <Link className="text-button" to="/student">Mở trang học sinh →</Link>,
    },
    {
      done: true,
      title: 'Giám sát, không can thiệp nội dung',
      text: 'Control Center quản lý quyền, quota và nhật ký. Lớp, đề, đáp án và bài làm do từng giáo viên tự quản trong tenant riêng.',
      action: null,
    },
  ];

  return <Card className="admin-onboarding">
    <header><div><p className="eyebrow">BẮT ĐẦU CHO CHỦ HỆ THỐNG</p><h2>Vai trò của Super Admin</h2><p>Chủ hệ thống vận hành thuê bao; mỗi giáo viên vận hành lớp và kỳ thi của chính họ.</p></div><Pill tone="info">Owner control plane</Pill></header>
    <div className="admin-onboarding__steps">{steps.map((step, index) => <article key={step.title} className={step.done ? 'is-done' : ''}><span>{step.done ? '✓' : index + 1}</span><div><h3>{step.title}</h3><p>{step.text}</p>{step.action}</div></article>)}</div>
    <div className="role-boundaries"><span><b>Super Admin</b><small>Duyệt, gia hạn, khóa, quota, audit</small></span><i>không gian tách biệt</i><span><b>Giáo viên A</b><small>Lớp A · đề A · học sinh A · bài A</small></span><span><b>Giáo viên B</b><small>Lớp B · đề B · học sinh B · bài B</small></span></div>
  </Card>;
}
