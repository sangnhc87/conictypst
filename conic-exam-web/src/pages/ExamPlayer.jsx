import { useEffect, useMemo, useRef, useState } from 'react';
import { useLocation, useNavigate, useParams } from 'react-router-dom';
import { useAuth } from '../auth/AuthContext';
import QuestionRenderer from '../components/QuestionRenderer';
import { Button, LoadingScreen, Notice, Pill } from '../components/UI';
import {
  clearOfflineAttempt,
  isRecoverableOfflineError,
  loadOfflineAttempt,
  saveOfflineAttempt,
} from '../lib/offline';
import { warningAlert } from '../lib/alerts';

export default function ExamPlayer() {
  const { attemptId } = useParams();
  const navigate = useNavigate();
  const location = useLocation();
  const { api, user } = useAuth();
  const [payload, setPayload] = useState(null);
  const [answers, setAnswers] = useState({});
  const [currentIndex, setCurrentIndex] = useState(0);
  const [flagged, setFlagged] = useState(() => new Set());
  const [saveState, setSaveState] = useState('loading');
  const [error, setError] = useState('');
  const [offlineMode, setOfflineMode] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [confirmSubmit, setConfirmSubmit] = useState(false);
  const [integrityWarnings, setIntegrityWarnings] = useState(0);
  const [now, setNow] = useState(Date.now());
  const answersRef = useRef({});
  const flaggedRef = useRef(new Set());
  const currentIndexRef = useRef(0);
  const localWriteRef = useRef(Promise.resolve());
  const localWriteCountRef = useRef(0);
  const submitMutationIdRef = useRef('');

  function queueLocalSave(nextAnswers = answersRef.current, extra = {}) {
    const ownerUid = user?.uid;
    if (!ownerUid) return Promise.reject(codedError('unauthenticated', 'Phiên đăng nhập đã hết hạn.'));
    localWriteCountRef.current += 1;
    setSaveState('local-saving');
    const record = {
      ownerUid,
      studentUid: ownerUid,
      attemptId,
      answers: nextAnswers,
      flaggedIds: [...flaggedRef.current],
      currentIndex: currentIndexRef.current,
      submitMutationId: submitMutationIdRef.current || undefined,
      pending: [],
      ...extra,
    };
    const operation = localWriteRef.current
      .catch(() => {})
      .then(async () => {
        const saved = await saveOfflineAttempt(record);
        if (!saved) throw codedError('local-storage-failed', 'Trình duyệt không lưu được bản nháp trên thiết bị.');
      });
    localWriteRef.current = operation;
    operation.then(() => {
      localWriteCountRef.current -= 1;
      if (localWriteCountRef.current === 0) {
        setSaveState('local-saved');
        setError((message) => message.includes('bản nháp') ? '' : message);
      }
    }).catch((cause) => {
      localWriteCountRef.current -= 1;
      setSaveState('local-error');
      setError(cause.message);
    });
    return operation;
  }

  useEffect(() => {
    let active = true;
    (async () => {
      try {
        const ownerUid = user?.uid;
        if (!ownerUid) throw codedError('unauthenticated', 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.');
        const offline = await loadOfflineAttempt(ownerUid, attemptId);
        let server;
        let restoredOffline = false;
        const routed = location.state?.attemptPayload;
        if (isOwnedAttemptPayload(routed, ownerUid, attemptId)) {
          server = routed;
        } else {
          try {
            server = await api.getAttempt(attemptId);
          } catch (cause) {
            if (!isRecoverableOfflineError(cause) || !offline?.snapshot) throw cause;
            server = offline.snapshot;
            restoredOffline = true;
          }
        }
        if (!active) return;
        const attempt = server.attempt || server;
        if (attempt.studentUid !== ownerUid || String(attempt.id || server.attemptId || '') !== String(attemptId)) {
          await clearOfflineAttempt(ownerUid, attemptId);
          throw codedError('permission-denied', 'Phiên thi không thuộc tài khoản đang đăng nhập.');
        }
        if (attempt.status && !['active', 'started'].includes(attempt.status)) {
          await clearOfflineAttempt(ownerUid, attemptId);
          navigate(`/result/${attemptId}`, { replace: true });
          return;
        }
        const items = server.items || server.publicItems || attempt.items || [];
        const serverAnswers = attempt.responses || server.responses || {};
        // Active attempts are intentionally device-local. A draft from this
        // authenticated browser is the newest source; server responses exist
        // only for compatibility with clients deployed before final-submit-only.
        const merged = offline?.answers ? { ...serverAnswers, ...offline.answers } : serverAnswers;
        const restoredFlags = new Set(Array.isArray(offline?.flaggedIds) ? offline.flaggedIds : []);
        const restoredIndex = Math.min(Math.max(Number(offline?.currentIndex) || 0, 0), Math.max(items.length - 1, 0));
        setPayload({ ...server, attempt, items });
        setAnswers(merged);
        answersRef.current = merged;
        setFlagged(restoredFlags);
        flaggedRef.current = restoredFlags;
        setCurrentIndex(restoredIndex);
        currentIndexRef.current = restoredIndex;
        submitMutationIdRef.current = String(offline?.submitMutationId || '');
        await saveOfflineAttempt({
          ownerUid,
          studentUid: attempt.studentUid,
          attemptId,
          answers: merged,
          flaggedIds: [...restoredFlags],
          currentIndex: restoredIndex,
          submitMutationId: submitMutationIdRef.current || undefined,
          pending: [],
          snapshot: { ...server, attempt, items },
        });
        setSaveState('local-saved');
        setOfflineMode(restoredOffline);
        if (restoredOffline) {
          setError('Đang ngoại tuyến: đề và bài làm đã được khôi phục trên thiết bị này. Cần kết nối mạng để nộp.');
        }
      } catch (cause) { if (active) setError(cause.message); }
    })();
    return () => { active = false; };
  }, [api, attemptId, location.state, navigate, user?.uid]);

  useEffect(() => { const interval = setInterval(() => setNow(Date.now()), 1000); return () => clearInterval(interval); }, []);
  useEffect(() => {
    const onBeforeUnload = (event) => {
      if (localWriteCountRef.current > 0 || saveState === 'local-error' || submitting) {
        event.preventDefault();
        event.returnValue = '';
      }
    };
    window.addEventListener('beforeunload', onBeforeUnload); return () => window.removeEventListener('beforeunload', onBeforeUnload);
  }, [saveState, submitting]);

  const items = payload?.items || [];
  const attempt = payload?.attempt || {};
  const current = items[currentIndex];
  const deadline = new Date(attempt.deadlineAt || payload?.deadlineAt).getTime();
  const remaining = Number.isFinite(deadline) ? Math.max(0, deadline - now) : null;
  const answeredCount = useMemo(() => items.filter((item) => isAnswered(item, answers[item.id])).length, [answers, items]);
  const unansweredIndexes = useMemo(() => items
    .map((item, index) => isAnswered(item, answers[item.id]) ? -1 : index)
    .filter(index => index >= 0), [answers, items]);

  useEffect(() => {
    if (!payload) return undefined;
    let leftPage = false;
    const recordWarning = (eventType, message) => {
      setIntegrityWarnings(count => count + 1);
      api.reportIntegrityEvent(attemptId, eventType).catch(() => undefined);
      warningAlert('Cảnh báo toàn vẹn bài thi', message);
    };
    const onVisibility = () => {
      if (document.hidden) leftPage = true;
      else if (leftPage) { leftPage = false; recordWarning('visibility_hidden', 'Hệ thống ghi nhận bạn vừa rời khỏi màn hình thi. Hãy tập trung làm bài và không mở tài liệu ngoài.'); }
    };
    const onCopy = event => { event.preventDefault(); recordWarning('copy_attempt', 'Không sao chép nội dung trong thời gian làm bài.'); };
    const onContext = event => event.preventDefault();
    document.addEventListener('visibilitychange', onVisibility);
    document.addEventListener('copy', onCopy);
    document.addEventListener('contextmenu', onContext);
    return () => {
      document.removeEventListener('visibilitychange', onVisibility);
      document.removeEventListener('copy', onCopy);
      document.removeEventListener('contextmenu', onContext);
    };
  }, [api, attemptId, payload]);

  useEffect(() => {
    if (payload && remaining === 0 && !submitting) submit(true);
    // submit intentionally omitted: the deadline transition is the only trigger.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [remaining, payload]);

  function answer(value) {
    if (!current || remaining === 0 || submitting) return;
    if (!user?.uid) { setSaveState('local-error'); setError('Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.'); return; }
    const id = current.id;
    const next = { ...answersRef.current, [id]: value };
    answersRef.current = next;
    setAnswers(next);
    queueLocalSave(next).catch(() => {});
  }

  function toggleFlag() {
    const id = current?.id;
    if (!id) return;
    setFlagged((previous) => {
      const next = new Set(previous);
      if (next.has(id)) next.delete(id); else next.add(id);
      flaggedRef.current = next;
      queueLocalSave(answersRef.current, { flaggedIds: [...next] }).catch(() => {});
      return next;
    });
  }

  function goToQuestion(index) {
    currentIndexRef.current = index;
    setCurrentIndex(index);
    queueLocalSave(answersRef.current, { currentIndex: index }).catch(() => {});
  }

  function goToNextUnanswered() {
    const next = unansweredIndexes.find(index => index > currentIndex) ?? unansweredIndexes[0];
    if (next !== undefined) goToQuestion(next);
  }

  function requestSubmit() {
    if (unansweredIndexes.length) {
      goToQuestion(unansweredIndexes[0]);
      warningAlert('Chưa thể nộp bài', `Bạn còn ${unansweredIndexes.length} câu chưa trả lời. Hệ thống đã chuyển đến câu trống đầu tiên.`);
      return;
    }
    setConfirmSubmit(true);
  }

  async function submit(auto = false) {
    if (submitting) return;
    setSubmitting(true); setConfirmSubmit(false); setError('');
    try {
      if (!navigator.onLine) {
        throw new Error('Thiết bị đang ngoại tuyến. Bài vẫn ở trên thiết bị này; hãy kết nối mạng rồi nộp.');
      }
      if (!submitMutationIdRef.current) submitMutationIdRef.current = crypto.randomUUID();
      await queueLocalSave(answersRef.current, {
        submitMutationId: submitMutationIdRef.current,
      }).catch(() => {});
      setSaveState('submitting');
      const response = await api.submitAttempt({
        attemptId,
        mutationId: submitMutationIdRef.current,
        responses: answersRef.current,
      });
      await clearOfflineAttempt(user.uid, attemptId);
      navigate(`/result/${response.attemptId || attemptId}`, { replace: true, state: { receipt: response.receiptHash, auto } });
    } catch (cause) {
      setError(cause.message);
      setOfflineMode(!navigator.onLine || isRecoverableOfflineError(cause));
      setSaveState('local-saved');
      setSubmitting(false);
    }
  }

  async function requestFullscreen() { try { await document.documentElement.requestFullscreen?.(); } catch { /* Fullscreen is optional. */ } }

  if (!payload && !error) return <LoadingScreen label="Đang mở phiên thi an toàn…" />;
  if (!payload) return <div className="gate-screen"><span className="brand-mark">!</span><h1>Không mở được bài thi</h1><Notice tone="danger">{error}</Notice><Button onClick={() => navigate('/student')}>Về cổng học sinh</Button></div>;

  const savePresentation = {
    loading: ['loading', 'Đang mở bài…'],
    'local-saving': ['saving', 'Đang lưu trên thiết bị…'],
    'local-saved': ['saved', 'Đã lưu trên thiết bị này'],
    'local-error': ['error', 'Không lưu được bản nháp'],
    submitting: ['saving', 'Đang gửi bài lên máy chủ…'],
  }[saveState] || ['saved', 'Đã lưu trên thiết bị này'];

  return (
    <div className="exam-shell">
      <header className="exam-topbar"><div className="exam-brand"><span className="brand-mark brand-mark--small">C</span><div><strong>{attempt.assignmentTitle || payload.assignment?.title || 'Bài thi Conic Exam'}</strong><small>{user?.displayName} · Lượt #{attempt.attemptNo || 1}</small></div></div><div className="exam-save-status"><span className={`save-dot save-dot--${savePresentation[0]}`} />{savePresentation[1]}{integrityWarnings > 0 && <b className="integrity-count">⚠ {integrityWarnings}</b>}</div><div className={`exam-clock ${remaining !== null && remaining < 5 * 60_000 ? 'is-urgent' : ''}`}><small>Thời gian còn lại</small><strong>{remaining === null ? '--:--' : formatRemaining(remaining)}</strong></div><Button variant="secondary" onClick={requestFullscreen}>Toàn màn hình</Button></header>
      {error && <Notice tone={offlineMode ? 'warning' : 'danger'} onClose={() => setError('')}>{error}</Notice>}
      <div className="exam-layout">
        <aside className="question-nav"><header><strong>Tiến độ</strong><span>{answeredCount}/{items.length} câu</span></header><div className="progress-track"><i style={{ width: `${items.length ? answeredCount / items.length * 100 : 0}%` }} /></div><div className="question-nav__grid">{items.map((item, index) => { const id = item.id; return <button key={id} type="button" className={`${index === currentIndex ? 'is-current' : ''} ${isAnswered(item, answers[id]) ? 'is-answered' : 'is-unanswered'} ${flagged.has(id) ? 'is-flagged' : ''}`} onClick={() => goToQuestion(index)}>{index + 1}</button>; })}</div><div className="question-nav__legend"><span><i className="legend-current" />Đang xem</span><span><i className="legend-answered" />Đã trả lời</span><span><i className="legend-flagged" />Đánh dấu</span></div>{unansweredIndexes.length > 0 && <Button variant="warning" onClick={goToNextUnanswered}>Câu chưa làm tiếp theo ({unansweredIndexes.length})</Button>}<Button variant="danger" onClick={requestSubmit}>Nộp bài</Button></aside>
        <main className="question-workspace">{current?.section && <div className="exam-section-label">{current.section}</div>}{current && <QuestionRenderer item={current} number={currentIndex + 1} value={answers[current.id]} onChange={answer} />}<footer className="question-actions"><Button variant="secondary" disabled={currentIndex === 0} onClick={() => goToQuestion(currentIndex - 1)}>← Câu trước</Button><Button variant={flagged.has(current?.id) ? 'warning' : 'ghost'} onClick={toggleFlag}>⚑ {flagged.has(current?.id) ? 'Đã đánh dấu' : 'Đánh dấu xem lại'}</Button>{currentIndex < items.length - 1 ? <Button onClick={() => goToQuestion(currentIndex + 1)}>Câu tiếp →</Button> : <Button variant="danger" onClick={requestSubmit}>Nộp bài</Button>}</footer></main>
      </div>
      {confirmSubmit && <div className="confirm-overlay"><section><span className="confirm-icon">✓</span><h2>Xác nhận nộp bài?</h2><p>Đã trả lời đủ <strong>{answeredCount}/{items.length}</strong> câu; có {flagged.size} câu đánh dấu xem lại.</p><p>Bài chỉ được gửi lên máy chủ ở bước này. Sau khi máy chủ xác nhận, bài sẽ bị khóa.</p><div><Button variant="secondary" onClick={() => setConfirmSubmit(false)}>Kiểm tra lại</Button><Button variant="danger" busy={submitting} onClick={() => submit(false)}>Nộp bài ngay</Button></div></section></div>}
    </div>
  );
}

function isOwnedAttemptPayload(payload, ownerUid, attemptId) {
  if (!payload || typeof payload !== 'object') return false;
  const attempt = payload.attempt || payload;
  return attempt?.studentUid === ownerUid
    && String(attempt?.id || payload.attemptId || '') === String(attemptId);
}

function isAnswered(item, value) {
  if (item.type === 'ds') { const required = (item.public?.statements || item.statements || []).length; return Array.isArray(value) && value.length >= required && value.slice(0, required).every((entry) => typeof entry === 'boolean'); }
  return value !== undefined && value !== null && String(value).trim() !== '';
}

function formatRemaining(ms) {
  const total = Math.ceil(ms / 1000); const hours = Math.floor(total / 3600); const minutes = Math.floor(total % 3600 / 60); const seconds = total % 60;
  return `${hours ? `${String(hours).padStart(2, '0')}:` : ''}${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
}

function codedError(code, message) {
  const error = new Error(message);
  error.code = code;
  return error;
}
