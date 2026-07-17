import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../auth/AuthContext';
import { Shell } from '../components/Shell';
import { Button, Card, EmptyState, Metric, Notice, Pill, formatDate, statusTone } from '../components/UI';

export default function StudentPortal() {
  const { api, account } = useAuth();
  const navigate = useNavigate();
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [joining, setJoining] = useState(false);
  const [starting, setStarting] = useState('');
  const [notice, setNotice] = useState(null);
  const linkJoinStarted = useRef(false);

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const response = await api.examBootstrap('student');
      const student = response.student || response;
      const classById = new Map((student.classrooms || []).map((item) => [item.id, item]));
      const memberships = (student.memberships || student.classes || []).map((item) => ({
        ...classById.get(item.classId || item.classroomId),
        ...item,
        classroomId: item.classroomId || item.classId,
        classroomName: item.classroomName || classById.get(item.classId || item.classroomId)?.name || (item.status === 'pending' ? 'Lớp đang chờ duyệt' : 'Lớp học'),
      }));
      setData({ ...student, memberships });
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
    } finally {
      setLoading(false);
    }
  }, [api]);

  useEffect(() => { load(); }, [load]);

  const joinWithCode = useCallback(async (rawCode, form = null) => {
    const code = String(rawCode || '').toUpperCase().replace(/[^A-Z0-9]/gu, '');
    if (!code) return;
    setJoining(true); setNotice(null);
    try {
      const response = await api.joinClassroom(code);
      form?.reset?.();
      const active = (response.status || response.membership?.status) === 'active';
      setNotice({ tone: 'success', text: active ? 'Đã xác minh tài khoản và vào lớp tự động.' : 'Đã gửi yêu cầu. Hãy chờ giáo viên duyệt.' });
      const url = new URL(window.location.href);
      if (url.searchParams.has('join')) {
        url.searchParams.delete('join');
        window.history.replaceState({}, '', `${url.pathname}${url.search}${url.hash}`);
      }
      await load();
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
    } finally { setJoining(false); }
  }, [api, load]);

  useEffect(() => {
    if (loading || !data || linkJoinStarted.current) return;
    const code = new URLSearchParams(window.location.search).get('join');
    if (!code) return;
    linkJoinStarted.current = true;
    joinWithCode(code);
  }, [data, joinWithCode, loading]);

  async function join(event) {
    event.preventDefault();
    const form = event.currentTarget;
    const code = new FormData(form).get('code');
    await joinWithCode(code, form);
  }

  async function start(assignment) {
    setStarting(assignment.id); setNotice(null);
    try {
      const response = await api.startAttempt(assignment.id);
      navigate(`/attempt/${response.attemptId || response.attempt?.id}`, {
        state: { attemptPayload: response },
      });
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
    } finally { setStarting(''); }
  }

  const memberships = data?.memberships || data?.classrooms || [];
  const assignments = data?.assignments || [];
  const attempts = data?.attempts || data?.recentAttempts || [];
  const activeAssignments = useMemo(() => assignments.filter((item) => assignmentState(item) !== 'closed'), [assignments]);

  if (loading && !data) return <Shell section="student"><div className="panel-loading panel-loading--page"><span className="spinner" />Đang tải lớp và bài thi…</div></Shell>;

  return (
    <Shell section="student">
      <section className="dashboard-hero dashboard-hero--student"><div><p className="eyebrow">CỔNG HỌC SINH</p><h1>Chào {account?.profile?.displayName || 'bạn'}!</h1><p>Quét QR hoặc nhập mã lớp; tài khoản Google giúp giáo viên nhận đúng học sinh.</p></div><form className="join-form" onSubmit={join}><label htmlFor="joinCode">Mã lớp</label><input id="joinCode" name="code" required minLength="8" maxLength="8" autoComplete="off" placeholder="8 ký tự" onInput={(event) => { event.currentTarget.value = event.currentTarget.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); }} /><Button type="submit" busy={joining}>Vào lớp</Button></form></section>
      {notice && <Notice tone={notice.tone} onClose={() => setNotice(null)}>{notice.text}</Notice>}
      <div className="metric-grid"><Metric icon="▦" label="Lớp của tôi" value={memberships.filter((item) => item.status === 'active').length} hint={`${memberships.filter((item) => ['pending', 'requested'].includes(item.status)).length} chờ duyệt`} tone="blue" /><Metric icon="▶" label="Có thể làm" value={activeAssignments.length} hint="đề đang mở" /><Metric icon="✓" label="Đã nộp" value={attempts.filter((item) => ['submitted', 'graded', 'manual_review', 'manual_pending'].includes(item.status)).length} hint="tất cả lượt" tone="gold" /><Metric icon="★" label="Điểm tốt nhất" value={bestScore(attempts)} hint="thang 10" tone="red" /></div>
      <div className="dashboard-columns dashboard-columns--student">
        <Card className="panel"><header className="panel__header"><div><p className="eyebrow">BÀI THI CỦA TÔI</p><h2>Đang mở và sắp tới</h2></div></header>{assignments.length === 0 ? <EmptyState icon="▶" title="Chưa có bài thi">Sau khi giáo viên duyệt lớp và giao đề, bài thi sẽ xuất hiện tại đây.</EmptyState> : <div className="student-exams">{assignments.map((assignment) => { const state = assignmentState(assignment); const attempt = attempts.find((item) => item.assignmentId === assignment.id && item.status === 'active'); return <article key={assignment.id} className={`student-exam student-exam--${state}`}><div className="student-exam__date"><strong>{new Date(assignment.openAt).getDate()}</strong><span>TH{new Date(assignment.openAt).getMonth() + 1}</span></div><div><Pill tone={statusTone(state)}>{state === 'open' ? 'Đang mở' : state === 'scheduled' ? 'Sắp mở' : 'Đã đóng'}</Pill><h3>{assignment.title || assignment.examTitle}</h3><p>{assignment.classroomName || assignment.className || 'Lớp học'} · {assignment.durationMinutes || 90} phút · tối đa {assignment.attemptLimit || assignment.maxAttempts || 1} lượt</p><small>{formatDate(assignment.openAt, true)} → {formatDate(assignment.closeAt, true)}</small></div><div>{attempt ? <Button onClick={() => navigate(`/attempt/${attempt.id || attempt.attemptId}`)}>Tiếp tục làm</Button> : state === 'open' ? <Button busy={starting === assignment.id} onClick={() => start(assignment)}>Bắt đầu</Button> : <Button disabled variant="secondary">{state === 'scheduled' ? 'Chưa mở' : 'Đã đóng'}</Button>}</div></article>; })}</div>}</Card>
        <div className="side-stack"><Card className="panel"><header className="panel__header"><div><p className="eyebrow">LỚP HỌC</p><h2>Trạng thái tham gia</h2></div></header>{memberships.length === 0 ? <EmptyState title="Chưa vào lớp">Nhập mã lớp ở phía trên để gửi yêu cầu.</EmptyState> : <div className="membership-list">{memberships.map((item) => <article key={item.classroomId || item.id}><span>{String(item.grade || '12').replace('Lớp ', '')}</span><div><strong>{item.classroomName || item.name || (item.status === 'pending' ? 'Lớp đang chờ duyệt' : 'Lớp học')}</strong><small>{item.teacherName || item.subject || (item.status === 'pending' ? 'Đang chờ giáo viên xác nhận' : '')}</small></div><Pill tone={statusTone(item.status)}>{item.status === 'active' ? 'Đã duyệt' : 'Chờ duyệt'}</Pill></article>)}</div>}</Card>
          <Card className="panel"><header className="panel__header"><div><p className="eyebrow">LỊCH SỬ</p><h2>Kết quả gần đây</h2></div></header>{attempts.filter((item) => item.status !== 'active').length === 0 ? <EmptyState title="Chưa có kết quả">Hoàn thành bài đầu tiên để xem điểm.</EmptyState> : <div className="result-mini-list">{attempts.filter((item) => item.status !== 'active').slice(0, 6).map((item) => { const unsubmitted = item.status === 'expired_unsubmitted'; return <button type="button" key={item.id || item.attemptId} onClick={() => navigate(`/result/${item.id || item.attemptId}`)}><span><strong>{item.examTitle || item.assignmentTitle}</strong><small>{unsubmitted ? 'Hết hạn chưa nộp' : formatDate(item.submittedAt, true)}</small></span><b>{unsubmitted ? 'Chưa nộp' : item.scoreReleased === false ? 'Chờ' : `${item.score ?? '—'}/${item.maxScore ?? 10}`}</b></button>; })}</div>}</Card></div>
      </div>
    </Shell>
  );
}

function assignmentState(item) {
  const now = Date.now(); const open = new Date(item.openAt).getTime(); const close = new Date(item.closeAt).getTime();
  if (Number.isFinite(open) && now < open) return 'scheduled';
  if (Number.isFinite(close) && now > close) return 'closed';
  return item.state === 'cancelled' ? 'closed' : 'open';
}

function bestScore(attempts) {
  const scores = attempts.map((item) => Number(item.score)).filter(Number.isFinite);
  return scores.length ? Math.max(...scores).toFixed(2).replace(/\.00$/, '') : '—';
}
