import { useCallback, useEffect, useMemo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Shell } from '../components/Shell';
import { useAuth } from '../auth/AuthContext';
import { Button, Card, EmptyState, Field, Metric, Modal, Notice, Pill, formatDate, statusTone } from '../components/UI';
import QuestionRenderer, { RichContent } from '../components/QuestionRenderer';
import TeacherOnboarding from '../components/TeacherOnboarding';
import { questionCountLabel, readExamPackage } from '../lib/examPackage';
import { createReleasePreview } from '../lib/releasePreview';
import { decodeStructuredContent, encodeStructuredContent } from '../lib/structuredContent';
import { filesToTypstProject, listTypstEntries, typstFileTree } from '../lib/typstProject';
import { publishTypstProject } from '../publisher/browserPublisher';
import { confirmAction, toastSuccess } from '../lib/alerts';
import { clearPublisherDraft, loadPublisherDraft, savePublisherDraft } from '../lib/publisherDraft';
import QRCode from 'qrcode';

const TABS = [
  ['start', 'Bắt đầu'],
  ['overview', 'Tổng quan'],
  ['classes', 'Lớp học'],
  ['exams', 'Kho đề'],
  ['assignments', 'Đợt thi'],
  ['results', 'Kết quả'],
];

export default function TeacherPortal() {
  const { api, account, user } = useAuth();
  const navigate = useNavigate();
  const [data, setData] = useState(null);
  const [tab, setTab] = useState(() => {
    const requested = new URLSearchParams(window.location.search).get('tab');
    return TABS.some(([value]) => value === requested) ? requested : 'start';
  });
  const [loading, setLoading] = useState(true);
  const [notice, setNotice] = useState(null);
  const [modal, setModal] = useState('');
  const [selectedClass, setSelectedClass] = useState(null);
  const [results, setResults] = useState([]);
  const [resultsAssignment, setResultsAssignment] = useState(null);
  const [selectedAssignmentId, setSelectedAssignmentId] = useState('');
  const [resultsLoading, setResultsLoading] = useState(false);
  const [releaseBusy, setReleaseBusy] = useState('');
  const [assignmentBusy, setAssignmentBusy] = useState('');
  const [reviewAttempt, setReviewAttempt] = useState(null);
  const [releasePreview, setReleasePreview] = useState(null);
  const [releaseActionBusy, setReleaseActionBusy] = useState('');
  const [publishSeed, setPublishSeed] = useState(null);

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const response = await api.examBootstrap('teacher');
      const next = response.teacher || response;
      setData({ ...next, stats: response.stats || next.stats || response.adminStats || {} });
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
    } finally {
      setLoading(false);
    }
  }, [api]);

  useEffect(() => { load(); }, [load]);

  async function loadResults(assignmentId = '') {
    setTab('results');
    setSelectedAssignmentId(assignmentId);
    if (!assignmentId) {
      setResults([]);
      setResultsAssignment(null);
      return;
    }
    setResultsLoading(true);
    try {
      const response = await api.listResults({ assignmentId });
      setResults(response.items || response.results || []);
      setResultsAssignment(response.assignment || assignments.find((item) => item.id === assignmentId) || null);
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
    } finally {
      setResultsLoading(false);
    }
  }

  async function toggleRelease(kind) {
    const assignment = resultsAssignment || assignments.find((item) => item.id === selectedAssignmentId);
    if (!assignment) return;
    const flag = kind === 'result' ? 'resultsReleased' : 'solutionsReleased';
    setReleaseBusy(kind);
    try {
      const response = await api.updateAssignment({
        assignmentId: assignment.id,
        expectedRevision: Number(assignment.revision || 1),
        [flag]: assignment[flag] !== true,
      });
      const updated = response.assignment;
      setResultsAssignment(updated);
      setData((current) => current ? {
        ...current,
        assignments: (current.assignments || []).map((item) => item.id === updated.id ? updated : item),
      } : current);
      setNotice({
        tone: 'success',
        text: `${kind === 'result' ? 'Điểm số' : 'Lời giải'} ${updated[flag] ? 'đã được công bố' : 'đã được thu hồi theo đúng chính sách đợt thi'}.`,
      });
    } catch (error) {
      if (error.code === 'aborted') await loadResults(assignment.id);
      setNotice({ tone: 'danger', text: error.message });
    } finally {
      setReleaseBusy('');
    }
  }

  async function manualGradeDone(updatedAttempt) {
    setResults((current) => current.map((item) => (item.id || item.attemptId) === updatedAttempt.id
      ? { ...item, ...updatedAttempt }
      : item));
    setNotice({ tone: 'success', text: 'Đã lưu điểm tự luận và cập nhật tổng điểm trên máy chủ.' });
  }

  async function changeAssignmentStatus(assignment, status) {
    const actionLabel = status === 'closed' ? 'đóng đợt thi' : 'hủy đợt thi';
    const consequence = status === 'closed'
      ? 'Học sinh sẽ không thể bắt đầu lượt mới; các bài đã nộp vẫn giữ nguyên.'
      : 'Lịch thi sẽ bị hủy và không nhận lượt thi mới. Dữ liệu đã có vẫn được lưu để đối soát.';
    if (!await confirmAction({ title: `Xác nhận ${actionLabel}?`, text: `${assignment.title || assignment.examTitle} — ${consequence}`, confirmText: actionLabel, danger: true })) return;
    setAssignmentBusy(`${assignment.id}:${status}`);
    try {
      const response = await api.updateAssignment({
        assignmentId: assignment.id,
        expectedRevision: Number(assignment.revision || 1),
        status,
      });
      const updated = response.assignment;
      setData((current) => current ? {
        ...current,
        assignments: (current.assignments || []).map((item) => item.id === updated.id ? updated : item),
      } : current);
      if (resultsAssignment?.id === updated.id) setResultsAssignment(updated);
      setNotice({ tone: 'success', text: `Đã ${status === 'closed' ? 'đóng' : 'hủy'} đợt thi “${updated.title}”.` });
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
      if (error.code === 'aborted') await load();
    } finally {
      setAssignmentBusy('');
    }
  }

  async function openReleasePreview(exam) {
    setReleasePreview({ exam, loading: true, release: null, error: '' });
    try {
      const response = await api.getRelease(exam.id);
      setReleasePreview((current) => current?.exam?.id === exam.id
        ? { ...current, loading: false, release: response.release }
        : current);
    } catch (error) {
      setReleasePreview((current) => current?.exam?.id === exam.id
        ? { ...current, loading: false, error: error.message }
        : current);
    }
  }

  function openNewPublish() {
    setPublishSeed(null);
    setModal('publish');
  }

  async function editRelease(exam) {
    setReleaseActionBusy(`${exam.id}:edit`);
    try {
      const response = await api.getReleaseForEdit(exam.id);
      const currentVersion = String(response.package?.version || exam.version || '1');
      const version = /^\d+$/u.test(currentVersion) ? String(Number(currentVersion) + 1) : `${currentVersion}.1`;
      setPublishSeed({ package: { ...response.package, version }, sourceLabel: `Bản ${currentVersion} · ${exam.title}` });
      setModal('publish');
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
    } finally {
      setReleaseActionBusy('');
    }
  }

  async function archiveRelease(exam) {
    if (!await confirmAction({ title: `Xóa “${exam.title}” khỏi kho đề?`, text: 'Các đợt thi và bài làm cũ vẫn được giữ để đối soát. Đề sẽ không còn dùng cho đợt thi mới.', confirmText: 'Xóa khỏi kho', danger: true })) return;
    setReleaseActionBusy(`${exam.id}:delete`);
    try {
      await api.archiveRelease(exam.id);
      await load();
      setNotice({ tone: 'success', text: `Đã xóa “${exam.title}” khỏi kho đề; lịch sử thi cũ vẫn được giữ.` });
    } catch (error) {
      setNotice({ tone: 'danger', text: error.message });
    } finally {
      setReleaseActionBusy('');
    }
  }

  const classrooms = data?.classrooms || [];
  const exams = data?.exams || data?.sources || data?.releases || [];
  const assignments = data?.assignments || [];
  const pendingStudents = data?.pendingStudents || data?.joinRequests || [];
  const stats = data?.stats || {};

  if (loading && !data) return <Shell section="teacher"><div className="panel-loading panel-loading--page"><span className="spinner" />Đang mở không gian giáo viên…</div></Shell>;

  return (
    <Shell section="teacher">
      <section className="dashboard-hero dashboard-hero--teacher">
        <div><p className="eyebrow">KHÔNG GIAN GIÁO VIÊN</p><h1>{account?.profile?.displayName || 'Giáo viên'}</h1><p>Soạn một lần trong Typst, phát hành và theo dõi toàn bộ lớp học ở đây.</p></div>
        <div className="hero-actions">
          <Button style={{ background: '#caa655', color: '#fff', border: 'none' }} onClick={() => navigate('/teacher/pricing')}>✨ Nâng cấp gói</Button>
          <Button variant="secondary" onClick={() => setModal('class')}>+ Tạo lớp</Button>
          <Button onClick={openNewPublish}>↑ Xuất bản đề</Button>
        </div>
      </section>
      {notice && <Notice tone={notice.tone} onClose={() => setNotice(null)}>{notice.text}</Notice>}
      <nav className="tabbar">{TABS.map(([value, label]) => <button key={value} type="button" className={tab === value ? 'is-active' : ''} onClick={() => setTab(value)}>{label}{value === 'classes' && pendingStudents.length > 0 && <b>{pendingStudents.length}</b>}</button>)}</nav>

      {tab === 'start' && <TeacherOnboarding
        classrooms={classrooms}
        exams={exams}
        assignments={assignments}
        pendingStudents={pendingStudents}
        stats={stats}
        onCreateClass={() => setModal('class')}
        onPublish={openNewPublish}
        onCreateAssignment={() => { setSelectedClass(null); setModal('assignment'); }}
        onReviewMembers={(classroom) => { setSelectedClass(classroom); setModal('members'); }}
        onOpenResults={loadResults}
      />}
      {tab === 'overview' && <Overview stats={stats} classrooms={classrooms} exams={exams} assignments={assignments} pendingStudents={pendingStudents} setTab={setTab} onReview={(classroom) => { setSelectedClass(classroom); setModal('members'); }} />}
      {tab === 'classes' && <Classes classrooms={classrooms} pendingStudents={pendingStudents} onCreate={() => setModal('class')} onReview={(classroom) => { setSelectedClass(classroom); setModal('members'); }} />}
      {tab === 'exams' && <Exams exams={exams} busy={releaseActionBusy} onPublish={openNewPublish} onPreview={openReleasePreview} onEdit={editRelease} onDelete={archiveRelease} onAssign={(exam) => { setSelectedClass({ exam }); setModal('assignment'); }} />}
      {tab === 'assignments' && <Assignments assignments={assignments} busy={assignmentBusy} onCreate={() => setModal('assignment')} onResults={loadResults} onStatus={changeAssignmentStatus} />}
      {tab === 'results' && <Results items={results} assignments={assignments} assignment={resultsAssignment} selectedAssignmentId={selectedAssignmentId} loading={resultsLoading} releaseBusy={releaseBusy} onLoad={loadResults} onOpen={setReviewAttempt} onToggleRelease={toggleRelease} />}

      <CreateClassModal open={modal === 'class'} api={api} onClose={() => setModal('')} onDone={async () => { setModal(''); await load(); setNotice({ tone: 'success', text: 'Đã tạo lớp và sinh mã tham gia riêng.' }); }} />
      <PublishModal open={modal === 'publish'} api={api} ownerUid={user?.uid} initialPackage={publishSeed} onClose={() => { setModal(''); setPublishSeed(null); }} onDone={async () => { setModal(''); setPublishSeed(null); await load(); toastSuccess('Đã phát hành revision mới'); setNotice({ tone: 'success', text: 'Đã phát hành một revision mới; các lịch thi cũ vẫn giữ nguyên bản trước.' }); }} />
      <AssignmentModal open={modal === 'assignment'} api={api} classrooms={classrooms} exams={exams} preferredExam={selectedClass?.exam} onClose={() => setModal('')} onDone={async () => { setModal(''); setSelectedClass(null); await load(); setNotice({ tone: 'success', text: 'Đã tạo đợt thi cho lớp.' }); }} />
      <MembersModal open={modal === 'members'} api={api} classroom={selectedClass} requests={pendingStudents.filter((item) => (item.classroomId || item.classId) === selectedClass?.id)} onClose={() => { setModal(''); setSelectedClass(null); }} onDone={load} />
      <AttemptReviewModal open={Boolean(reviewAttempt)} api={api} attempt={reviewAttempt} onClose={() => setReviewAttempt(null)} onDone={manualGradeDone} />
      <ReleasePreviewModal preview={releasePreview} onClose={() => setReleasePreview(null)} />
    </Shell>
  );
}

function Overview({ stats, classrooms, exams, assignments, pendingStudents, setTab, onReview }) {
  return <>
    <div className="metric-grid"><Metric icon="▦" label="Lớp đang quản lý" value={stats.classrooms ?? classrooms.length} hint="tách dữ liệu riêng" tone="blue" /><Metric icon="HS" label="Học sinh" value={stats.activeStudentMemberships ?? stats.students ?? 0} hint={`${pendingStudents.length} chờ duyệt`} /><Metric icon="⌘" label="Đề đã phát hành" value={stats.releases ?? stats.exams ?? exams.length} hint="revision bất biến" tone="gold" /><Metric icon="✓" label="Lượt thi" value={stats.attempts ?? stats.submittedAttempts ?? 0} hint="chấm phía server" tone="red" /></div>
    <div className="dashboard-columns"><Card className="panel"><header className="panel__header"><div><p className="eyebrow">HÔM NAY</p><h2>Đợt thi gần nhất</h2></div><button className="text-button" onClick={() => setTab('assignments')}>Xem tất cả →</button></header>{assignments.length ? <div className="assignment-list">{assignments.slice(0, 5).map((item) => <AssignmentRow key={item.id} item={item} />)}</div> : <EmptyState title="Chưa có đợt thi">Phát hành một đề và gán cho lớp để bắt đầu.</EmptyState>}</Card>
      <Card className="panel"><header className="panel__header"><div><p className="eyebrow">LỚP HỌC</p><h2>Yêu cầu cần duyệt</h2></div></header>{pendingStudents.length ? <div className="request-list">{pendingStudents.slice(0, 6).map((request) => { const classId = request.classroomId || request.classId; return <article key={`${classId}-${request.studentUid}`}><span className="avatar-fallback">{(request.displayName || '?')[0]}</span><div><strong>{request.displayName}</strong><small>{request.classroomName || classrooms.find((item) => item.id === classId)?.name} · {request.email}</small></div><Button variant="secondary" onClick={() => onReview(classrooms.find((item) => item.id === classId))}>Xử lý</Button></article>; })}</div> : <EmptyState icon="✓" title="Đã xử lý hết">Hiện không có học sinh chờ duyệt.</EmptyState>}</Card></div>
  </>;
}

function Classes({ classrooms, pendingStudents, onCreate, onReview }) {
  return <Card className="panel"><header className="panel__header"><div><p className="eyebrow">MÃ · LINK · QR RIÊNG</p><h2>Lớp học của tôi</h2></div><Button onClick={onCreate}>+ Tạo lớp</Button></header>{classrooms.length === 0 ? <EmptyState icon="▦" title="Chưa có lớp học" action={<Button onClick={onCreate}>Tạo lớp đầu tiên</Button>}>Mỗi lớp có QR riêng và có thể chọn tự động hoặc cần duyệt.</EmptyState> : <div className="card-grid">{classrooms.map((item) => { const pending = pendingStudents.filter((request) => (request.classroomId || request.classId) === item.id).length; return <article className="class-card" key={item.id}><header><span>{String(item.grade || 'Lớp').replace('Lớp ', '')}</span><Pill tone={item.joinMode === 'auto' ? 'info' : item.status === 'archived' ? 'neutral' : 'success'}>{item.joinMode === 'auto' ? 'Vào tự động' : 'Cần duyệt'}</Pill></header><h3>{item.name}</h3><p>{item.subject || 'Toán'} · {item.academicYear || item.schoolYear || 'Năm học hiện tại'}</p><div className="class-code"><small>Mã tham gia</small><strong>{item.joinCode || item.code || '••••••'}</strong></div><footer><span>{item.memberCounts?.active ?? item.studentCount ?? 0} học sinh</span><Button variant={pending ? 'primary' : 'secondary'} onClick={() => onReview(item)}>{pending ? `${pending} chờ duyệt` : 'QR & thành viên'}</Button></footer></article>; })}</div>}</Card>;
}

function Exams({ exams, busy, onPublish, onPreview, onEdit, onDelete, onAssign }) {
  return <Card className="panel"><header className="panel__header"><div><p className="eyebrow">TYPST SANG-MATH</p><h2>Kho đề đã phát hành</h2></div><Button onClick={onPublish}>↑ Tải file .typ</Button></header>{exams.length === 0 ? <EmptyState icon="⌘" title="Chưa có đề thi" action={<Button onClick={onPublish}>Xuất bản đề đầu tiên</Button>}>Tải file Typst, duyệt và sửa từng câu rồi mới xuất bản.</EmptyState> : <div className="exam-list">{exams.map((exam) => <article key={exam.id}><span className="exam-list__icon">T</span><div><Pill tone="success">Bản {exam.version || exam.revisionNo || exam.currentRevisionNo || 1}</Pill><h3>{exam.title}</h3><p>{exam.subject || 'Toán'} · {exam.questionCounts ? questionCountLabel(exam.questionCounts) : `${exam.questionCount || 0} câu`} · {exam.maximumScore ?? exam.maxScore ?? 10} điểm</p><small>Xuất bản {formatDate(exam.publishedAt || exam.updatedAt, true)}</small></div><div className="exam-list__actions"><Button variant="secondary" onClick={() => onPreview(exam)}>Xem</Button><Button variant="secondary" busy={busy === `${exam.id}:edit`} onClick={() => onEdit(exam)}>Sửa · tạo bản mới</Button><Button onClick={() => onAssign(exam)}>Giao lớp</Button><Button variant="danger-ghost" busy={busy === `${exam.id}:delete`} onClick={() => onDelete(exam)}>Xóa</Button></div></article>)}</div>}</Card>;
}

function Assignments({ assignments, busy, onCreate, onResults, onStatus }) {
  return <Card className="panel"><header className="panel__header"><div><p className="eyebrow">LỊCH THI</p><h2>Các đợt thi</h2></div><Button onClick={onCreate}>+ Tạo đợt thi</Button></header>{assignments.length === 0 ? <EmptyState title="Chưa tạo đợt thi" action={<Button onClick={onCreate}>Tạo ngay</Button>}>Chọn đề, lớp, thời gian mở–đóng và chính sách xem kết quả.</EmptyState> : <div className="assignment-table">{assignments.map((item) => { const canStop = ['draft', 'published'].includes(item.status); return <article key={item.id}><AssignmentRow item={item} /><div className="assignment-actions"><Button variant="secondary" onClick={() => onResults(item.id)}>Kết quả</Button>{canStop && <Button variant="secondary" busy={busy === `${item.id}:closed`} onClick={() => onStatus(item, 'closed')}>Đóng</Button>}{canStop && <Button variant="danger-ghost" busy={busy === `${item.id}:cancelled`} onClick={() => onStatus(item, 'cancelled')}>Hủy</Button>}</div></article>; })}</div>}</Card>;
}

function AssignmentRow({ item }) {
  const now = Date.now(); const open = new Date(item.openAt).getTime(); const close = new Date(item.closeAt).getTime(); const state = ['closed', 'cancelled'].includes(item.status) ? item.status : item.state || (now < open ? 'scheduled' : now <= close ? 'open' : 'closed');
  return <div className="assignment-row"><span className={`assignment-row__dot assignment-row__dot--${statusTone(state === 'cancelled' ? 'closed' : state)}`} /><div><strong>{item.title || item.examTitle}</strong><small>{item.classroomName} · {item.durationMinutes || Math.round((item.durationSeconds || 5400) / 60)} phút</small></div><div><Pill tone={statusTone(state === 'cancelled' ? 'closed' : state)}>{assignmentStatusLabel(state)}</Pill><small>{formatDate(item.openAt, true)} → {formatDate(item.closeAt, true)}</small></div><strong>{item.startedCount ?? item.submittedCount ?? 0} lượt</strong></div>;
}

function assignmentStatusLabel(status) {
  return ({ scheduled: 'Sắp mở', open: 'Đang mở', closed: 'Đã đóng', cancelled: 'Đã hủy', draft: 'Bản nháp' })[status] || status;
}

function Results({ items, assignments, assignment, selectedAssignmentId, loading, releaseBusy, onLoad, onOpen, onToggleRelease }) {
  const submitted = items.filter((item) => !['active', 'expired_unsubmitted'].includes(item.status));
  const expired = items.filter((item) => item.status === 'expired_unsubmitted');
  const graded = submitted.filter((item) => item.status === 'graded' && Number(item.manualPending || 0) === 0);
  const pending = submitted.filter((item) => item.status === 'manual_pending' || Number(item.manualPending || 0) > 0);
  const scores = submitted.map((item) => Number(item.score)).filter(Number.isFinite);
  const average = scores.length ? (scores.reduce((sum, value) => sum + value, 0) / scores.length).toFixed(2) : '—';
  const sortedScores = [...scores].sort((a, b) => a - b);
  const median = sortedScores.length ? sortedScores.length % 2
    ? sortedScores[(sortedScores.length - 1) / 2]
    : (sortedScores[sortedScores.length / 2 - 1] + sortedScores[sortedScores.length / 2]) / 2 : null;
  const maximumScore = Number(assignment?.maximumScore || 10);
  const scoreBands = [
    ['Giỏi', .8, 1], ['Khá', .65, .8], ['Đạt', .5, .65], ['Chưa đạt', 0, .5],
  ].map(([label, min, max], index) => ({ label, count: scores.filter(score => score >= min * maximumScore && (index === 0 ? score <= max * maximumScore : score < max * maximumScore)).length }));
  const integrityTotal = items.reduce((sum, item) => sum + Number(item.integrityEventCount || 0), 0);

  return <>
    <Card className="panel results-panel">
      <header className="panel__header"><div><p className="eyebrow">BẢNG ĐIỂM MÁY CHỦ</p><h2>Kết quả bài làm</h2></div><select aria-label="Chọn đợt thi" onChange={(event) => onLoad(event.target.value)} value={selectedAssignmentId}><option value="">Chọn một đợt thi…</option>{assignments.map((item) => <option key={item.id} value={item.id}>{item.title || item.examTitle}</option>)}</select></header>
      {!selectedAssignmentId ? <EmptyState icon="▤" title="Chọn đợt thi để mở bảng điểm">Mỗi bảng điểm được tách theo lớp và đợt thi, giúp dữ liệu không bị lẫn.</EmptyState> : loading ? <div className="panel-loading"><span className="spinner" />Đang tải bảng điểm an toàn…</div> : <>
        <div className="results-summary"><article><small>Bài đã nộp</small><strong>{submitted.length}</strong></article><article><small>Đã chấm xong</small><strong>{graded.length}</strong></article><article className={pending.length ? 'is-warning' : ''}><small>Chờ chấm tự luận</small><strong>{pending.length}</strong></article><article className={expired.length ? 'is-warning' : ''}><small>Hết hạn chưa nộp</small><strong>{expired.length}</strong></article><article><small>Điểm trung bình</small><strong>{average}</strong></article><article><small>Trung vị</small><strong>{displayScore(median)}</strong></article><article className={integrityTotal ? 'is-warning' : ''}><small>Cảnh báo toàn vẹn</small><strong>{integrityTotal}</strong></article></div>
        {scores.length > 0 && <div className="score-distribution">{scoreBands.map(band => <article key={band.label}><span><b>{band.label}</b><strong>{band.count} bài</strong></span><div><i style={{ width: `${submitted.length ? band.count / submitted.length * 100 : 0}%` }} /></div></article>)}</div>}
        {assignment && <ReleaseControls assignment={assignment} busy={releaseBusy} onToggle={onToggleRelease} />}
        {items.length === 0 ? <EmptyState title="Chưa có lượt làm bài">Kết quả xuất hiện ngay khi học sinh bắt đầu hoặc nộp bài.</EmptyState> : <div className="table-wrap"><table className="results-table"><thead><tr><th>Học sinh</th><th>Lượt</th><th>Điểm máy</th><th>Điểm tự luận</th><th>Tổng điểm</th><th>Toàn vẹn</th><th>Trạng thái</th><th>Nộp lúc</th><th /></tr></thead><tbody>{items.map((item) => { const status = item.status || 'active'; const waiting = status === 'manual_pending' || Number(item.manualPending || 0) > 0; const unsubmitted = status === 'expired_unsubmitted'; return <tr key={item.id || item.attemptId}><td><strong>{item.studentName || 'Học sinh'}</strong><small className="block-note">{item.studentEmail || shortUid(item.studentUid)}</small></td><td>#{item.attemptNo || 1}</td><td>{displayScore(item.automaticScore)}</td><td>{waiting ? <span className="pending-score">{displayScore(item.manualScore)} · còn {item.manualPending}</span> : displayScore(item.manualScore)}</td><td><strong className="score-cell">{unsubmitted ? '—' : `${displayScore(item.score)}/${displayScore(item.maximumScore ?? assignment?.maximumScore ?? 10)}`}</strong></td><td>{Number(item.integrityEventCount || 0) > 0 ? <Pill tone="warning">⚠ {item.integrityEventCount}</Pill> : <Pill tone="success">Sạch</Pill>}</td><td><Pill tone={attemptTone(status)}>{attemptStatusLabel(status, item.manualPending)}</Pill></td><td>{status === 'active' ? 'Đang làm' : unsubmitted ? 'Không nhận được bài' : formatDate(item.submittedAt, true)}</td><td><Button variant={waiting ? 'warning' : 'secondary'} onClick={() => onOpen(item)}>{waiting ? 'Chấm bài' : 'Xem bài'}</Button></td></tr>; })}</tbody></table></div>}
      </>}
    </Card>
  </>;
}

function ReleaseControls({ assignment, busy, onToggle }) {
  return <section className="release-controls" aria-label="Công bố kết quả">
    <div><span className="release-controls__icon">◉</span><div><strong>Điểm số</strong><small>{releaseStatus(assignment, 'result')}</small></div><Button variant={assignment.resultsReleased ? 'danger-ghost' : 'secondary'} busy={busy === 'result'} disabled={assignment.resultRelease === 'immediate' && !assignment.resultsReleased} onClick={() => onToggle('result')}>{assignment.resultsReleased ? 'Thu hồi công bố thủ công' : assignment.resultRelease === 'immediate' ? 'Đang tự động' : 'Công bố ngay'}</Button></div>
    <div><span className="release-controls__icon">⌘</span><div><strong>Lời giải & đáp án</strong><small>{releaseStatus(assignment, 'solution')}</small></div><Button variant={assignment.solutionsReleased ? 'danger-ghost' : 'secondary'} busy={busy === 'solution'} disabled={assignment.solutionRelease === 'immediate' && !assignment.solutionsReleased} onClick={() => onToggle('solution')}>{assignment.solutionsReleased ? 'Thu hồi công bố thủ công' : assignment.solutionRelease === 'immediate' ? 'Đang tự động' : 'Công bố ngay'}</Button></div>
    <p>Thao tác dùng revision {assignment.revision || 1}; nếu lịch thi vừa đổi, hệ thống sẽ từ chối ghi đè và tải lại dữ liệu mới.</p>
  </section>;
}

function AttemptReviewModal({ open, api, attempt, onClose, onDone }) {
  const [data, setData] = useState(null);
  const [grades, setGrades] = useState({});
  const [loading, setLoading] = useState(false);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState('');

  const loadDetail = useCallback(async () => {
    const attemptId = attempt?.id || attempt?.attemptId;
    if (!open || !attemptId) return;
    setLoading(true);
    setError('');
    try {
      const response = await api.getResult(attemptId);
      setData(response);
      setGrades(initialManualGrades(response));
    } catch (cause) {
      setError(cause.message);
    } finally {
      setLoading(false);
    }
  }, [api, attempt, open]);

  useEffect(() => { loadDetail(); }, [loadDetail]);

  function close() {
    setData(null);
    setGrades({});
    setError('');
    onClose();
  }

  function changeGrade(questionId, field, value) {
    setGrades((current) => ({
      ...current,
      [questionId]: { ...current[questionId], [field]: value },
    }));
  }

  async function save(event) {
    event.preventDefault();
    const essayItems = (data?.items || []).filter((item) => item.type === 'tl');
    const payloadGrades = essayItems.map((item) => ({
      questionId: item.id,
      points: Number(grades[item.id]?.points),
      feedback: String(grades[item.id]?.feedback || '').trim(),
    }));
    if (payloadGrades.some((grade) => !Number.isFinite(grade.points))) {
      setError('Vui lòng nhập điểm cho tất cả câu tự luận trước khi hoàn tất.');
      return;
    }
    setBusy(true);
    setError('');
    try {
      const response = await api.gradeManual({
        attemptId: data.attempt.id,
        grades: payloadGrades,
        mutationId: crypto.randomUUID(),
      });
      const refreshed = await api.getResult(data.attempt.id);
      setData(refreshed);
      setGrades(initialManualGrades(refreshed));
      await onDone(response.attempt || refreshed.attempt);
    } catch (cause) {
      setError(cause.message);
    } finally {
      setBusy(false);
    }
  }

  const essayItems = (data?.items || []).filter((item) => item.type === 'tl');
  const detailAttempt = data?.attempt;
  const assignment = data?.assignment;
  const isActive = detailAttempt?.status === 'active';

  return <Modal open={open} title={`Bài làm · ${attempt?.studentName || 'Học sinh'}`} onClose={close} wide>
    <div className="grading-modal-body">
      {error && <Notice tone="danger">{error}</Notice>}
      {loading ? <div className="panel-loading"><span className="spinner" />Đang tải bài làm và rubric riêng tư…</div> : data && <form className="grading-form" onSubmit={save}>
        <section className="grading-overview"><div><p className="eyebrow">{assignment?.classroomName || 'LỚP HỌC'}</p><h3>{assignment?.title || assignment?.examTitle}</h3><p>Lượt #{detailAttempt.attemptNo || 1} · {isActive ? 'Học sinh đang làm bài' : `Nộp ${formatDate(detailAttempt.submittedAt, true)}`}</p></div><div className="grading-score"><strong>{displayScore(detailAttempt.score)}</strong><span>/ {displayScore(detailAttempt.maximumScore ?? assignment?.maximumScore ?? 10)}</span><small>{Number(detailAttempt.manualPending || 0) > 0 ? `Còn ${detailAttempt.manualPending} câu tự luận` : 'Đã chấm đủ'}</small></div></section>
        <div className="grading-metrics"><span>Máy chấm <strong>{displayScore(detailAttempt.automaticScore)}</strong></span><span>Tự luận <strong>{displayScore(detailAttempt.manualScore)}</strong></span><span>Trạng thái <Pill tone={attemptTone(detailAttempt.status)}>{attemptStatusLabel(detailAttempt.status, detailAttempt.manualPending)}</Pill></span></div>
        {essayItems.length === 0 ? <EmptyState icon="✓" title="Đề không có câu tự luận">Toàn bộ điểm đã được máy chủ chấm tự động; thầy/cô vẫn có thể kiểm tra bản ghi bài làm.</EmptyState> : <div className="essay-grading-list">{essayItems.map((item, index) => <EssayGradeCard key={item.id} item={item} number={questionNumber(data.items, item, index)} rubric={data.manualRubrics?.[item.id]} grade={grades[item.id] || { points: '', feedback: '' }} disabled={isActive || busy} onChange={(field, value) => changeGrade(item.id, field, value)} />)}</div>}
        <footer className="grading-actions"><div><strong>Lưu trên máy chủ</strong><small>Điểm từng câu được kiểm tra đúng giới hạn rubric.</small></div><Button type="button" variant="ghost" onClick={close}>Đóng</Button>{essayItems.length > 0 && <Button type="submit" busy={busy} disabled={isActive}>{isActive ? 'Chưa thể chấm' : 'Lưu điểm & hoàn tất'}</Button>}</footer>
      </form>}
    </div>
  </Modal>;
}

function EssayGradeCard({ item, number, rubric, grade, disabled, onChange }) {
  const answer = typeof item.userAnswer === 'string' && item.userAnswer.trim() ? item.userAnswer : 'Học sinh không nhập bài làm.';
  return <article className="essay-grade-card">
    <header><div><Pill tone="info">Câu {number} · Tự luận</Pill><strong>{item.id}</strong></div><span>Tối đa <b>{displayScore(item.points)}</b> điểm</span></header>
    <div className="essay-question"><RichContent svg={item.questionSvg || item.stemSvg} value={item.questionText || item.stemText || item.stem} alt={`Nội dung câu tự luận ${number}`} /></div>
    <div className="essay-review-grid"><section><h4>Bài làm của học sinh</h4><div className={`student-essay-answer ${answer.startsWith('Học sinh không') ? 'is-empty' : ''}`}>{answer}</div></section><section><h4>Rubric riêng tư</h4><RubricView value={rubric} maxPoints={item.points} /></section></div>
    <div className="essay-grade-inputs"><Field label={`Điểm (0–${displayScore(item.points)})`}><input type="number" min="0" max={item.points} step="0.01" required value={grade.points} disabled={disabled} onChange={(event) => onChange('points', event.target.value)} /></Field><Field label="Nhận xét cho học sinh"><textarea rows="3" maxLength="2000" value={grade.feedback} disabled={disabled} placeholder="Nêu điểm tốt và phần cần cải thiện…" onChange={(event) => onChange('feedback', event.target.value)} /></Field></div>
  </article>;
}

function RubricView({ value, maxPoints }) {
  const entries = Array.isArray(value)
    ? value
    : value && typeof value === 'object'
      ? Object.entries(value).map(([label, detail]) => typeof detail === 'object' && detail
        ? { label, ...detail }
        : { label, description: detail })
      : [];
  if (entries.length === 0) return <div className="rubric-empty">Chưa có tiêu chí chi tiết; chấm trong khoảng 0–{displayScore(maxPoints)} điểm.</div>;
  return <ol className="rubric-list">{entries.map((entry, index) => { const label = typeof entry === 'string' ? entry : entry.label || entry.criterion || entry.description || entry.text || `Tiêu chí ${index + 1}`; const points = typeof entry === 'object' && entry ? entry.points ?? entry.maxPoints ?? entry.score : null; return <li key={`${index}-${label}`}><span>{String(label)}</span>{points !== null && points !== undefined && <strong>{displayScore(points)}đ</strong>}</li>; })}</ol>;
}

function initialManualGrades(response) {
  return Object.fromEntries((response?.items || []).filter((item) => item.type === 'tl').map((item) => {
    const result = response?.attempt?.itemResults?.[item.id];
    return [item.id, {
      points: result?.pending ? '' : String(item.earnedPoints ?? result?.points ?? ''),
      feedback: item.feedback || result?.feedback || '',
    }];
  }));
}

function questionNumber(items, item, essayIndex) {
  const index = items.findIndex((candidate) => candidate.id === item.id);
  return index >= 0 ? index + 1 : essayIndex + 1;
}

function displayScore(value) {
  if (value === null || value === undefined || value === '') return '—';
  const number = Number(value);
  if (!Number.isFinite(number)) return '—';
  return new Intl.NumberFormat('vi-VN', { maximumFractionDigits: 2 }).format(number);
}

function shortUid(value) {
  const uid = String(value || '');
  return uid ? `UID ${uid.slice(0, 8)}…` : '';
}

function attemptTone(status) {
  if (status === 'expired_unsubmitted') return 'danger';
  return statusTone(status === 'manual_pending' ? 'manual_review' : status);
}

function attemptStatusLabel(status, pendingCount = 0) {
  if (status === 'active') return 'Đang làm';
  if (status === 'manual_pending') return `Chờ chấm${pendingCount ? ` (${pendingCount})` : ''}`;
  if (status === 'graded') return 'Đã chấm';
  if (status === 'submitted') return 'Đã nộp';
  if (status === 'expired_unsubmitted') return 'Hết hạn chưa nộp';
  return status || '—';
}

function releaseStatus(assignment, kind) {
  const manualFlag = assignment[kind === 'result' ? 'resultsReleased' : 'solutionsReleased'];
  if (manualFlag) return 'Đang công bố theo lệnh của giáo viên';
  const policy = assignment[kind === 'result' ? 'resultRelease' : 'solutionRelease'];
  if (policy === 'immediate') return 'Tự động công bố ngay sau khi nộp';
  if (policy === 'after_close') return `Tự động công bố sau ${formatDate(assignment.closeAt, true)}`;
  if (policy === 'manual') return 'Chờ giáo viên bấm công bố';
  return 'Không công bố cho học sinh';
}

function ReleasePreviewModal({ preview, onClose }) {
  let model = null;
  let modelError = '';
  if (preview?.release) {
    try {
      model = createReleasePreview(preview.release);
    } catch (error) {
      modelError = error.message;
    }
  }
  const error = preview?.error || modelError;
  return <Modal open={Boolean(preview)} title="Xem trước đề đã phát hành" onClose={onClose} wide>
    <div className="release-preview">
      {preview?.loading && <div className="panel-loading release-preview__loading"><span className="spinner" />Đang tải đúng gói công khai của đề…</div>}
      {error && <Notice tone="danger">{error}</Notice>}
      {model && <>
        <section className="release-preview__summary">
          <div><p className="eyebrow">CHẾ ĐỘ GIÁO VIÊN · CHỈ ĐỌC</p><h3>{model.title}</h3>{model.description && <p>{model.description}</p>}</div>
          <div className="release-preview__metrics"><Pill tone="info">Bản {model.version}</Pill><strong>{questionCountLabel(model.counts)}</strong><span>{displayScore(model.maximumScore)} điểm</span></div>
        </section>
        <Notice tone="info">Đây là nội dung học sinh sẽ nhận. Xem trước không chạy đồng hồ, không tạo lượt thi, không lưu câu trả lời và không hiển thị đáp án đúng.</Notice>
        <div className="release-preview__questions">
          {model.publicItems.map((item, index) => <QuestionRenderer
            key={item.id || index}
            item={item}
            number={index + 1}
            value={undefined}
            onChange={ignorePreviewResponse}
            disabled
          />)}
        </div>
      </>}
    </div>
    <footer className="modal-actions release-preview__actions"><Button variant="secondary" onClick={onClose}>Đóng xem trước</Button></footer>
  </Modal>;
}

function ignorePreviewResponse() {}

function CreateClassModal({ open, api, onClose, onDone }) {
  const [busy, setBusy] = useState(false); const [error, setError] = useState('');
  async function submit(event) { event.preventDefault(); setBusy(true); setError(''); const form = new FormData(event.currentTarget); try { await api.createClassroom(Object.fromEntries(form)); event.currentTarget.reset(); onDone(); } catch (cause) { setError(cause.message); } finally { setBusy(false); } }
  return <Modal open={open} title="Tạo lớp học mới" onClose={onClose}><form className="form-stack" onSubmit={submit}>{error && <Notice tone="danger">{error}</Notice>}<Field label="Tên lớp"><input name="name" required maxLength="100" placeholder="Ví dụ: Toán 12A1" /></Field><div className="form-grid"><Field label="Môn học"><input name="subject" defaultValue="Toán" required /></Field><Field label="Khối"><select name="grade" defaultValue="12"><option>10</option><option>11</option><option>12</option></select></Field></div><Field label="Năm học"><input name="academicYear" defaultValue="2026–2027" /></Field><Field label="Cách học sinh vào lớp" hint="Có thể đổi lại bất kỳ lúc nào trong quản lý thành viên."><select name="joinMode" defaultValue="approval"><option value="approval">Cần giáo viên duyệt — kiểm soát chặt</option><option value="auto">Tự động sau đăng nhập Google — nhanh nhất</option></select></Field><p className="form-note">Hệ thống sinh mã, link và QR riêng. Học sinh luôn phải đăng nhập Google đã xác minh trước khi vào lớp.</p><footer><Button type="button" variant="ghost" onClick={onClose}>Hủy</Button><Button type="submit" busy={busy}>Tạo lớp</Button></footer></form></Modal>;
}

function PublishModal({ open, api, ownerUid, initialPackage, onClose, onDone }) {
  const [project, setProject] = useState(null);
  const [entryPath, setEntryPath] = useState('');
  const [title, setTitle] = useState('');
  const [sourceLabel, setSourceLabel] = useState('');
  const [report, setReport] = useState(null);
  const [payload, setPayload] = useState(null);
  const [warningsConfirmed, setWarningsConfirmed] = useState(false);
  const [busy, setBusy] = useState(false);
  const [processing, setProcessing] = useState(false);
  const [progress, setProgress] = useState(null);
  const [error, setError] = useState('');
  const [selectedQuestion, setSelectedQuestion] = useState(0);
  const [draftState, setDraftState] = useState('');

  useEffect(() => {
    if (!open) return;
    const seeded = initialPackage?.package || null;
    setProject(null); setEntryPath(''); setTitle(seeded?.title || ''); setSourceLabel(initialPackage?.sourceLabel || '');
    setReport(seeded ? inspectGeneratedPackage(seeded) : null); setPayload(seeded); setSelectedQuestion(0);
    setWarningsConfirmed(false); setProgress(null); setError(''); setDraftState('');
    if (!seeded) loadPublisherDraft(ownerUid).then(draft => {
      if (!draft?.payload) return;
      setPayload(draft.payload); setReport(inspectGeneratedPackage(draft.payload));
      setTitle(draft.title || draft.payload.title || ''); setSourceLabel(draft.sourceLabel || 'Bản nháp tự lưu');
      setDraftState(`Đã khôi phục bản nháp ${new Date(draft.savedAt).toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' })}`);
    }).catch(() => undefined);
  }, [initialPackage, open, ownerUid]);

  useEffect(() => {
    if (!open || !payload || !ownerUid) return undefined;
    setDraftState('Đang tự lưu…');
    const timer = setTimeout(() => savePublisherDraft(ownerUid, { payload, title, sourceLabel })
      .then(() => setDraftState(`Đã tự lưu ${new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' })}`))
      .catch(() => setDraftState('Không tự lưu được')),
    650);
    return () => clearTimeout(timer);
  }, [open, ownerUid, payload, sourceLabel, title]);

  function acceptPayload(nextPayload) {
    setPayload(nextPayload);
    setReport(inspectGeneratedPackage(nextPayload));
  }

  async function processProject(nextProject, nextEntry = nextProject.entryPath, nextTitle = nextProject.name) {
    setProcessing(true); setError(''); setReport(null); setPayload(null); setWarningsConfirmed(false);
    try {
      const compiled = await publishTypstProject({ ...nextProject, entryPath: nextEntry }, {
        title: nextTitle,
        onProgress: setProgress,
      });
      const inspected = inspectGeneratedPackage(compiled.value);
      setPayload(compiled.value);
      setReport({ ...inspected, warnings: compiled.warnings });
    } catch (cause) {
      setError(cause.message);
    } finally {
      setProcessing(false);
    }
  }

  async function chooseTypst(event) {
    const selected = [...(event.target.files || [])];
    event.target.value = '';
    if (!selected.length) return;
    setError('');
    try {
      const next = await filesToTypstProject(selected);
      const nextTitle = next.name.replaceAll('-', ' ');
      setProject(next); setEntryPath(next.entryPath); setTitle(nextTitle);
      setSourceLabel(selected.length === 1 ? selected[0].name : `${selected.length} tệp`);
      await processProject(next, next.entryPath, nextTitle);
    } catch (cause) {
      setError(cause.message);
    }
  }

  async function chooseLegacyPackage(event) {
    const selected = event.target.files?.[0]; event.target.value = '';
    if (!selected) return;
    setError(''); setReport(null); setPayload(null); setWarningsConfirmed(false);
    try {
      const parsed = await readExamPackage(selected);
      setPayload(parsed.value); setReport(parsed.report); setTitle(parsed.value.title); setSourceLabel(selected.name);
    } catch (cause) { setError(cause.message); }
  }

  async function changeEntry(event) {
    const nextEntry = event.target.value;
    setEntryPath(nextEntry);
    if (project) await processProject(project, nextEntry, title || project.name);
  }

  async function publish() {
    setBusy(true); setError('');
    try {
      await api.publishRelease({ package: { ...payload, title: title.trim() || payload.title }, mutationId: crypto.randomUUID() });
      await clearPublisherDraft(ownerUid);
      onDone();
    } catch (cause) { setError(cause.message); } finally { setBusy(false); }
  }

  const phaseLabel = progress ? publisherPhaseLabel(progress) : '';
  return <Modal open={open} title="Tạo đề thi từ Typst" onClose={onClose} wide>
    <div className="typst-publish-flow">
      <input id="typstSingleFile" hidden type="file" accept=".typ" onChange={chooseTypst} />
      <input id="typstProjectFolder" hidden type="file" multiple webkitdirectory="" directory="" onChange={chooseTypst} />
      {!project && !payload && <section className="typst-source-picker">
        <div><p className="eyebrow">KHÔNG CẦN ZIP · KHÔNG CẦN JSON</p><h3>Chọn nguồn Typst, hệ thống tự làm phần còn lại</h3><p>Nếu đề chỉ có một file, chọn file <code>.typ</code>. Nếu có ảnh, dữ liệu hoặc module riêng, chọn cả thư mục dự án.</p></div>
        <div className="typst-source-actions">
          <label className="button button--primary" htmlFor="typstSingleFile">Chọn file .typ</label>
          <label className="button button--secondary" htmlFor="typstProjectFolder">Chọn thư mục đề</label>
        </div>
        <small>Nguồn chỉ được biên dịch trong trình duyệt. Đáp án chỉ gửi lên kho riêng khi bạn bấm Xuất bản.</small>
      </section>}

      {project && <div className="typst-project-workspace">
        <aside className="typst-file-tree"><header><strong>Cây thư mục</strong><small>{Object.keys(project.files).length} tệp</small></header><FileTree node={typstFileTree(project.files)} entryPath={entryPath} /><div className="typst-source-replace"><label htmlFor="typstSingleFile">Đổi file</label><label htmlFor="typstProjectFolder">Đổi thư mục</label></div></aside>
        <section className="typst-project-main">
          <div className="form-grid"><Field label="Tên đề"><input value={title} maxLength="200" onChange={event => setTitle(event.target.value)} /></Field><Field label="File đề chính"><select value={entryPath} onChange={changeEntry}>{listTypstEntries(project.files).map(path => <option key={path} value={path}>{path.replace('/project/', '')}</option>)}</select></Field></div>
          <div className="package-imports"><strong>Gói Typst được nạp tự động</strong>{projectPackageImports(project).length ? projectPackageImports(project).map(spec => <code key={spec}>{spec}</code>) : <span>Chỉ dùng runtime sang-math tích hợp</span>}<small>Mọi import <code>@preview/…</code> trong file nguồn đều được compiler tải và đưa vào main xử lý; không giới hạn riêng sang-math.</small></div>
          {processing && <div className="publisher-processing"><span className="spinner" /><div><strong>{phaseLabel}</strong><progress value={progress?.completed || 0} max={Math.max(1, progress?.total || 1)} /><small>Lần đầu có thể mất lâu hơn vì trình duyệt đang mở compiler Toán.</small></div></div>}
          {!processing && payload && <PackageEditor payload={payload} report={report} sourceLabel={sourceLabel} selected={selectedQuestion} onSelect={setSelectedQuestion} onChange={acceptPayload} />}
        </section>
      </div>}

      {!project && payload && <div className="seeded-package-title"><Field label="Tên revision mới"><input value={title} maxLength="200" onChange={event => setTitle(event.target.value)} /></Field><small>Bản mới: {payload.version || '1'} · bản cũ và các bài đã thi không bị thay đổi.</small></div>}
      {!project && payload && <PackageEditor payload={payload} report={report} sourceLabel={sourceLabel} selected={selectedQuestion} onSelect={setSelectedQuestion} onChange={acceptPayload} />}
      {error && <Notice tone="danger"><span style={{ whiteSpace: 'pre-line' }}>{error}</span></Notice>}
      {report?.warnings?.length > 0 && <Notice tone="warning"><strong>Có {report.warnings.length} điểm hệ thống đã tự xử lý:</strong><ul>{report.warnings.slice(0, 6).map((warning) => <li key={warning}>{warning}</li>)}</ul><label className="warning-confirm"><input type="checkbox" checked={warningsConfirmed} onChange={event => setWarningsConfirmed(event.target.checked)} /> Tôi đã xem cảnh báo và đồng ý xuất bản.</label></Notice>}
      {!project && <details className="legacy-package-import"><summary>Đã có gói JSON cũ?</summary><input id="packageFile" type="file" accept=".json,.conic-exam.json,application/json" onChange={chooseLegacyPackage} /><label htmlFor="packageFile">Chọn `.conic-exam.json`</label></details>}
    </div>
    <footer className="modal-actions"><span className="draft-status">● {draftState || 'Bản soạn sẽ tự lưu trên thiết bị'}</span><Button variant="ghost" onClick={onClose}>Đóng</Button><Button onClick={publish} disabled={!payload || processing || (report?.warnings?.length > 0 && !warningsConfirmed)} busy={busy}>Xem ổn rồi · Xuất bản</Button></footer>
  </Modal>;
}

function inspectGeneratedPackage(value) {
  const items = value?.publicItems || [];
  const counts = items.reduce((result, item) => ({ ...result, [item.type]: (result[item.type] || 0) + 1 }), { tn: 0, ds: 0, tln: 0, tl: 0 });
  const maxScore = (value?.answerKey || []).reduce((sum, item) => sum + Number(item.points || 0), 0);
  return { valid: Boolean(items.length), counts, maxScore, itemCount: items.length, warnings: value?.warnings || [] };
}

function publisherPhaseLabel(progress) {
  if (progress.phase === 'analyzing') return 'Đang đọc cấu trúc và đáp án…';
  if (progress.phase === 'rendering-assets') return `Đang dựng hình minh họa ${Math.min(progress.total, progress.completed + 1)}/${progress.total}…`;
  if (progress.phase === 'packing-assets') return `Đang tối ưu hình minh họa ${Math.min(progress.total, progress.completed + 1)}/${progress.total}…`;
  if (progress.phase === 'structuring') return `Đang chuyển chữ và công thức ${Math.min(progress.total, progress.completed + 1)}/${progress.total}…`;
  return 'Đang hoàn thiện gói đề…';
}

function projectPackageImports(project) {
  const found = new Set();
  for (const file of Object.values(project?.files || {})) {
    if (file?.kind !== 'text') continue;
    for (const match of String(file.content || '').matchAll(/#import\s+"(@(?:preview|local)\/[^"]+)"/gu)) found.add(match[1]);
  }
  return [...found].sort();
}

function FileTree({ node, entryPath, depth = 0 }) {
  return <div className="typst-tree-node">{depth > 0 && <div className={`typst-tree-row ${node.path === entryPath ? 'is-entry' : ''}`} style={{ paddingLeft: `${Math.max(0, depth - 1) * 13}px` }}><span>{node.kind === 'folder' ? '▾' : node.name.endsWith('.typ') ? 'T' : '·'}</span><b>{node.name}</b>{node.path === entryPath && <em>FILE ĐỀ</em>}</div>}{node.children?.map(child => <FileTree key={child.path} node={child} entryPath={entryPath} depth={depth + 1} />)}</div>;
}

export function PackageEditor({ payload, report, sourceLabel, selected, onSelect, onChange }) {
  const items = payload.publicItems || [];
  const index = Math.min(Math.max(0, selected), Math.max(0, items.length - 1));
  const item = items[index];
  const key = payload.answerKey?.find(candidate => candidate.id === item?.id);

  function updateItem(nextItem, nextKey = key) {
    const publicItems = items.map((candidate, itemIndex) => itemIndex === index ? nextItem : candidate);
    const answerKey = (payload.answerKey || []).map(candidate => candidate.id === item.id ? nextKey : candidate);
    onChange({ ...payload, publicItems, answerKey });
  }

  function updateOption(optionIndex, source) {
    const options = item.options.map((option, current) => current === optionIndex
      ? { ...option, content: replaceStructuredSource(option.content, 0, source) }
      : option);
    updateItem({ ...item, options });
  }

  function updateStatement(statementIndex, source) {
    const statements = item.statements.map((statement, current) => current === statementIndex
      ? { ...statement, content: replaceStructuredSource(statement.content, 0, source) }
      : statement);
    updateItem({ ...item, statements });
  }

  async function removeQuestion() {
    if (items.length <= 1) return;
    if (!await confirmAction({ title: `Xóa Câu ${index + 1}?`, text: 'Câu sẽ bị loại khỏi bản đang soạn; bản đã xuất bản trước đó không đổi.', confirmText: 'Xóa câu', danger: true })) return;
    const publicItems = items.filter((_, current) => current !== index)
      .map((candidate, current) => ({ ...candidate, position: current + 1 }));
    const answerKey = (payload.answerKey || []).filter(candidate => candidate.id !== item.id);
    onChange({ ...payload, publicItems, answerKey });
    onSelect(Math.min(index, publicItems.length - 1));
  }

  if (!item) return null;
  const stem = structuredSource(item.questionText, 0);
  const solution = structuredSource(key?.solution, 0);
  return <div className="package-report package-report--typst"><div className="package-report__heading"><Pill tone="success">Đã tách {items.length} câu</Pill><div><h3>{payload.title}</h3><p>{sourceLabel} · {questionCountLabel(report?.counts)} · {Number(report?.maxScore || 0).toFixed(2)} điểm</p></div></div><Notice tone="info">Chọn từng câu ở cây bên trái để xem và sửa. ID câu/phương án không đổi nên trộn đáp án vẫn chấm đúng.</Notice><div className="question-editor"><aside><header><strong>Cây câu hỏi</strong><small>{items.length} câu</small></header>{items.map((candidate, itemIndex) => <button type="button" key={candidate.id} className={itemIndex === index ? 'is-active' : ''} onClick={() => onSelect(itemIndex)}><span>{itemIndex + 1}</span><b>{typeShortLabel(candidate.type)}</b><small>{candidate.points}đ</small></button>)}</aside><section><div className="question-editor__toolbar"><div><strong>Câu {index + 1}</strong><small>ID ổn định: {item.id}</small></div><Button variant="danger-ghost" disabled={items.length <= 1} onClick={removeQuestion}>Xóa câu</Button></div><div className="question-editor__preview"><QuestionRenderer item={item} number={index + 1} disabled value={item.type === 'ds' ? [] : ''} reveal={key ? { correctAnswer: key.answer } : undefined} onChange={ignorePreviewResponse} /></div><div className="question-editor__fields"><Field label="Nội dung câu (Typst + $toán$)"><textarea rows="5" value={stem} onChange={event => updateItem({ ...item, questionText: replaceStructuredSource(item.questionText, 0, event.target.value) })} /></Field><div className="form-grid"><Field label="Điểm"><input type="number" min="0.01" max="100" step="0.01" value={key?.points ?? item.points} onChange={event => { const points = Number(event.target.value); updateItem({ ...item, points }, { ...key, points }); }} /></Field>{item.type === 'tn' && <Field label="Đáp án đúng"><select value={key?.answer || ''} onChange={event => updateItem(item, { ...key, answer: event.target.value })}>{item.options.map(option => <option key={option.id} value={option.id}>{option.label}</option>)}</select></Field>}</div>{item.type === 'tn' && item.options.map((option, optionIndex) => <Field key={option.id} label={`Phương án ${option.label}`}><textarea rows="2" value={structuredSource(option.content, 0)} onChange={event => updateOption(optionIndex, event.target.value)} /></Field>)}{item.type === 'ds' && item.statements.map((statement, statementIndex) => <div className="statement-editor" key={statement.id}><label><input type="checkbox" checked={key?.answer?.[statementIndex] === true} onChange={event => { const answer = Array.isArray(key?.answer) ? [...key.answer] : [false, false, false, false]; answer[statementIndex] = event.target.checked; updateItem(item, { ...key, answer }); }} /> Ý {statement.label} đúng</label><textarea rows="2" value={structuredSource(statement.content, 0)} onChange={event => updateStatement(statementIndex, event.target.value)} /></div>)}{item.type === 'tln' && <Field label="Đáp án chấp nhận (cách nhau bởi dấu |)"><input value={(key?.acceptedAnswers || [key?.answer]).filter(value => value !== undefined).join(' | ')} onChange={event => { const acceptedAnswers = event.target.value.split('|').map(value => value.trim()).filter(Boolean); updateItem(item, { ...key, answer: acceptedAnswers[0] || '', acceptedAnswers }); }} /></Field>}<Field label="Lời giải"><textarea rows="5" value={solution} onChange={event => updateItem(item, { ...key, solution: replaceStructuredSource(key?.solution, 0, event.target.value) })} /></Field></div></section></div></div>;
}

function structuredSource(value, index = 0) {
  const decoded = decodeStructuredContent(value);
  return decoded?.sources?.[index] || (typeof value === 'string' ? value : '');
}

function replaceStructuredSource(value, index, source) {
  const decoded = decodeStructuredContent(value);
  if (!decoded) return encodeStructuredContent(source);
  const sources = [...decoded.sources];
  while (sources.length <= index) sources.push('');
  sources[index] = source;
  return encodeStructuredContent(sources, decoded.assets);
}

function typeShortLabel(type) {
  return ({ tn: 'TN', ds: 'Đ/S', tln: 'TLN', tl: 'TL' })[type] || type;
}

function AssignmentModal({ open, api, classrooms, exams, preferredExam, onClose, onDone }) {
  const [busy, setBusy] = useState(false); const [error, setError] = useState(''); const [examId, setExamId] = useState('');
  const defaults = useMemo(() => { const start = new Date(Date.now() + 10 * 60_000); const end = new Date(start.getTime() + 7 * 86400_000); const local = (date) => new Date(date.getTime() - date.getTimezoneOffset() * 60000).toISOString().slice(0, 16); return { open: local(start), close: local(end) }; }, [open]);
  useEffect(() => { if (open) setExamId(preferredExam?.id || ''); }, [open, preferredExam?.id]);
  const selectedExam = exams.find((exam) => exam.id === examId);
  const optionShuffleSupported = releaseSupportsOptionShuffle(selectedExam);
  async function submit(event) { event.preventDefault(); setBusy(true); setError(''); const form = new FormData(event.currentTarget); const payload = Object.fromEntries(form); payload.durationMinutes = Number(payload.durationMinutes); payload.maxAttempts = Number(payload.maxAttempts); payload.shuffleQuestions = form.get('shuffleQuestions') === 'on'; payload.shuffleOptions = form.get('shuffleOptions') === 'on'; payload.openAt = new Date(payload.openAt).toISOString(); payload.closeAt = new Date(payload.closeAt).toISOString(); try { await api.createAssignment(payload); onDone(); } catch (cause) { setError(cause.message); } finally { setBusy(false); } }
  return <Modal open={open} title="Tạo đợt thi" onClose={onClose} wide><form className="form-stack" onSubmit={submit}>{error && <Notice tone="danger">{error}</Notice>}<div className="form-grid"><Field label="Đề thi"><select name="examId" required value={examId} onChange={(event) => setExamId(event.target.value)}><option value="" disabled>Chọn đề…</option>{exams.map((exam) => <option key={exam.id} value={exam.id}>{exam.title}</option>)}</select></Field><Field label="Lớp học"><select name="classroomId" required defaultValue=""><option value="" disabled>Chọn lớp…</option>{classrooms.map((item) => <option key={item.id} value={item.id}>{item.name}</option>)}</select></Field></div><Field label="Tên đợt thi"><input name="title" required placeholder="Khảo sát giữa học kỳ" /></Field><div className="form-grid"><Field label="Mở lúc"><input name="openAt" type="datetime-local" required defaultValue={defaults.open} /></Field><Field label="Đóng lúc"><input name="closeAt" type="datetime-local" required defaultValue={defaults.close} /></Field></div><div className="form-grid"><Field label="Thời gian (phút)"><input name="durationMinutes" type="number" min="5" max="300" defaultValue="90" required /></Field><Field label="Số lượt tối đa"><input name="maxAttempts" type="number" min="1" max="10" defaultValue="1" required /></Field></div><div className="check-grid"><label><input name="shuffleQuestions" type="checkbox" defaultChecked /> <span>Trộn câu trong từng phần<small>Thứ tự Phần I, II, III giữ nguyên; ID câu ổn định nên chấm đúng.</small></span></label><label className={!optionShuffleSupported ? 'is-disabled' : ''}><input name="shuffleOptions" type="checkbox" defaultChecked={false} disabled={!optionShuffleSupported} /> <span>Trộn phương án TN<small>{optionShuffleSupported ? 'Gói đề có phương án tách rời; mặc định đang tắt.' : 'Đã tắt vì đề dùng SVG nguyên câu hoặc chưa xác nhận hỗ trợ.'}</small></span></label></div><div className="form-grid"><Field label="Công bố điểm"><select name="scoreReleasePolicy" defaultValue="after_submit"><option value="after_submit">Ngay sau nộp</option><option value="after_close">Sau khi đóng đề</option><option value="manual">Giáo viên công bố</option><option value="never">Không công bố</option></select></Field><Field label="Công bố lời giải"><select name="solutionReleasePolicy" defaultValue="after_close"><option value="after_submit">Ngay sau nộp</option><option value="after_close">Sau khi đóng đề</option><option value="manual">Giáo viên công bố</option><option value="never">Không công bố</option></select></Field></div><footer><Button type="button" variant="ghost" onClick={onClose}>Hủy</Button><Button type="submit" busy={busy} disabled={!classrooms.length || !exams.length}>Tạo đợt thi</Button></footer></form></Modal>;
}

function releaseSupportsOptionShuffle(release) {
  if (!release) return false;
  if (release.supportsOptionShuffle === true || release.publicPackage?.supportsOptionShuffle === true) return true;
  const items = release.publicPackage?.publicItems;
  const choices = Array.isArray(items) ? items.filter((item) => item.type === 'tn') : [];
  return choices.length > 0 && choices.every((item) => item.supportsOptionShuffle === true);
}

function MembersModal({ open, api, classroom, requests, onClose, onDone }) {
  const [busy, setBusy] = useState('');
  const [error, setError] = useState('');
  const [members, setMembers] = useState([]);
  const [loading, setLoading] = useState(false);
  const [filter, setFilter] = useState('all');
  const [copied, setCopied] = useState(false);
  const [liveClassroom, setLiveClassroom] = useState(classroom);
  const [qrDataUrl, setQrDataUrl] = useState('');
  const [settingsBusy, setSettingsBusy] = useState(false);

  const loadMembers = useCallback(async () => {
    if (!classroom?.id) return;
    setLoading(true);
    setError('');
    try {
      const response = await api.listClassroomStudents(classroom.id, 'all');
      setMembers(response.items || []);
    } catch (cause) {
      setError(cause.message);
    } finally {
      setLoading(false);
    }
  }, [api, classroom?.id]);

  useEffect(() => {
    if (!open || !classroom?.id) return;
    setLiveClassroom(classroom);
    setMembers(requests || []);
    setFilter('all');
    setCopied(false);
    loadMembers();
  }, [open, classroom?.id, loadMembers]);

  const code = liveClassroom?.joinCode || liveClassroom?.code || '';
  const joinUrl = code ? `${window.location.origin}/student?join=${encodeURIComponent(code)}` : '';

  useEffect(() => {
    if (!open || !joinUrl) { setQrDataUrl(''); return; }
    let active = true;
    QRCode.toDataURL(joinUrl, {
      width: 280, margin: 1, errorCorrectionLevel: 'M',
      color: { dark: '#073b4c', light: '#ffffff' },
    }).then((value) => { if (active) setQrDataUrl(value); }).catch(() => { if (active) setQrDataUrl(''); });
    return () => { active = false; };
  }, [joinUrl, open]);

  async function review(member, action) {
    if (action === 'remove' && !await confirmAction({ title: `Xóa ${member.displayName || 'học sinh này'} khỏi lớp?`, text: 'Học sinh sẽ không thể mở các đợt thi mới.', confirmText: 'Xóa khỏi lớp', danger: true })) return;
    setBusy(member.studentUid);
    setError('');
    try {
      await api.reviewStudent({ classroomId: classroom.id, studentUid: member.studentUid, action });
      await Promise.all([loadMembers(), onDone?.()]);
    } catch (cause) {
      setError(cause.message);
    } finally {
      setBusy('');
    }
  }

  async function copyInvite(value) {
    if (!value) return;
    try {
      await navigator.clipboard.writeText(value);
      setCopied(true);
      window.setTimeout(() => setCopied(false), 1800);
    } catch {
      setError('Trình duyệt không cho phép sao chép tự động. Thầy/cô hãy chọn và sao chép mã lớp.');
    }
  }

  async function updateJoinMode(event) {
    const joinMode = event.target.value;
    setSettingsBusy(true); setError('');
    try {
      const response = await api.updateClassroomJoinSettings(liveClassroom.id, joinMode);
      setLiveClassroom(response.classroom);
      await onDone?.();
    } catch (cause) {
      setError(cause.message);
    } finally {
      setSettingsBusy(false);
    }
  }

  const counts = members.reduce((result, member) => ({ ...result, [member.status]: (result[member.status] || 0) + 1 }), {});
  const visibleMembers = filter === 'all' ? members : members.filter((member) => member.status === filter);
  const tabs = [
    ['all', 'Tất cả', members.length],
    ['pending', 'Chờ duyệt', counts.pending || 0],
    ['active', 'Đã duyệt', counts.active || 0],
    ['rejected', 'Đã từ chối', counts.rejected || 0],
  ];

  return <Modal open={open} title={`Thành viên · ${liveClassroom?.name || classroom?.name || ''}`} onClose={onClose} wide>
    <div className="members-modal-body">
      {error && <Notice tone="danger">{error}</Notice>}
      <section className="class-invite-center">
        <div className="class-qr">{qrDataUrl ? <img src={qrDataUrl} alt={`QR tham gia lớp ${liveClassroom?.name || ''}`} /> : <span className="spinner" />}<small>Quét bằng camera điện thoại</small></div>
        <div className="class-invite-details"><div><p className="eyebrow">MỜI HỌC SINH ĐA KÊNH</p><h3>Mã · Link · QR</h3><p>Học sinh đăng nhập Google, hệ thống nhận đúng tài khoản rồi áp dụng chế độ của lớp.</p></div><div className="class-invite-code"><span>Mã lớp</span><strong>{code || '••••••••'}</strong><Button variant="secondary" onClick={() => copyInvite(code)}>{copied ? '✓ Đã sao chép' : 'Sao chép'}</Button></div><div className="class-invite-link"><input readOnly value={joinUrl} aria-label="Link tham gia lớp" /><Button variant="secondary" onClick={() => copyInvite(joinUrl)}>Sao chép link</Button></div><Field label="Chế độ tiếp nhận" hint={liveClassroom?.joinMode === 'auto' ? 'Học sinh vào ngay nếu quota còn chỗ.' : 'Giáo viên xác nhận từng học sinh trước khi vào lớp.'}><select value={liveClassroom?.joinMode || 'approval'} disabled={settingsBusy} onChange={updateJoinMode}><option value="approval">Cần duyệt — kiểm soát từng học sinh</option><option value="auto">Tự động — đăng nhập là vào lớp</option></select></Field></div>
      </section>
      <div className="members-toolbar"><div><h3>Danh sách học sinh</h3><small>{counts.active || 0} đang học · {counts.pending || 0} chờ duyệt</small></div><div className="segmented">{tabs.map(([value, label, count]) => <button key={value} type="button" className={filter === value ? 'is-active' : ''} onClick={() => setFilter(value)}>{label} ({count})</button>)}</div></div>
      {loading ? <div className="panel-loading"><span className="spinner" />Đang tải danh sách lớp…</div> : visibleMembers.length === 0 ? <EmptyState icon="✓" title={filter === 'pending' ? 'Không có yêu cầu mới' : 'Chưa có học sinh ở trạng thái này'}>{filter === 'all' ? (liveClassroom?.joinMode === 'auto' ? 'Gửi mã, link hoặc QR; học sinh đăng nhập là được vào lớp.' : 'Gửi mã, link hoặc QR; yêu cầu mới sẽ chờ thầy/cô duyệt.') : 'Có thể chuyển sang bộ lọc khác để xem toàn bộ lớp.'}</EmptyState> : <div className="request-list request-list--modal member-manager-list">{visibleMembers.map((member) => <article key={member.studentUid}><span className="avatar-fallback">{(member.displayName || member.email || '?')[0].toUpperCase()}</span><div><strong>{member.displayName || 'Học sinh'}</strong><small>{member.email || shortUid(member.studentUid)} · {member.status === 'pending' ? `Yêu cầu ${formatDate(member.requestedAt, true)}` : `Cập nhật ${formatDate(member.updatedAt || member.reviewedAt, true)}`}</small></div><Pill tone={memberStatusTone(member.status)}>{memberStatusLabel(member.status)}</Pill>{member.status === 'pending' && <><Button variant="danger-ghost" busy={busy === member.studentUid} onClick={() => review(member, 'reject')}>Từ chối</Button><Button busy={busy === member.studentUid} onClick={() => review(member, 'approve')}>Duyệt</Button></>}{member.status === 'active' && <Button variant="danger-ghost" busy={busy === member.studentUid} onClick={() => review(member, 'remove')}>Xóa khỏi lớp</Button>}</article>)}</div>}
    </div>
    <footer className="modal-actions"><Button variant="secondary" onClick={onClose}>Đóng</Button></footer>
  </Modal>;
}

function memberStatusLabel(status) {
  return ({ active: 'Đã duyệt', pending: 'Chờ duyệt', rejected: 'Đã từ chối', removed: 'Đã xóa' })[status] || status;
}

function memberStatusTone(status) {
  return statusTone(status === 'pending' ? 'pending' : status === 'active' ? 'active' : status === 'rejected' ? 'rejected' : 'neutral');
}
