import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useParams } from 'react-router-dom';
import { useAuth } from '../auth/AuthContext';
import { Shell } from '../components/Shell';
import QuestionRenderer from '../components/QuestionRenderer';
import { Button, Card, LoadingScreen, Notice, Pill, formatDate, statusTone } from '../components/UI';

export default function ResultPage() {
  const { attemptId } = useParams(); const location = useLocation(); const { api } = useAuth();
  const [data, setData] = useState(null); const [error, setError] = useState(''); const [reviewIndex, setReviewIndex] = useState(-1);
  useEffect(() => { let active = true; api.getResult(attemptId).then((value) => { if (active) setData(value); }).catch((cause) => { if (active) setError(cause.message); }); return () => { active = false; }; }, [api, attemptId]);
  const attempt = data?.attempt || data?.result || data || {};
  const assignment = data?.assignment || {};
  const result = {
    ...attempt,
    assignmentTitle: attempt.assignmentTitle || assignment.title,
    examTitle: attempt.examTitle || assignment.examTitle || assignment.releaseTitle,
    maxScore: attempt.maxScore ?? attempt.maximumScore ?? assignment.maximumScore,
    autoScore: attempt.autoScore ?? attempt.automaticScore,
    gradeStatus: attempt.gradeStatus || attempt.status,
    scoreReleased: data?.resultVisible !== undefined ? data.resultVisible : attempt.scoreReleased,
    solutionReleased: data?.solutionsVisible !== undefined ? data.solutionsVisible : attempt.solutionReleased,
    manualPendingCount: Number(attempt.manualPendingCount ?? attempt.manualPending ?? 0),
    timeSpentSeconds: attempt.timeSpentSeconds ?? elapsedSeconds(attempt.startedAt, attempt.submittedAt),
  };
  const details = data?.items || attempt.items || [];
  const unsubmitted = result.status === 'expired_unsubmitted';
  const itemGradingVisible = result.solutionReleased === true;
  const percent = useMemo(() => result.score != null && result.maxScore ? Math.round(result.score / result.maxScore * 100) : null, [result.maxScore, result.score]);
  if (!data && !error) return <LoadingScreen label="Đang lấy biên nhận và kết quả…" />;
  if (error) return <Shell section="student"><div className="gate-screen gate-screen--inside"><h1>Chưa thể xem kết quả</h1><Notice tone="warning">{error}</Notice><Link className="button button--primary" to="/student">Về cổng học sinh</Link></div></Shell>;
  return <Shell section="student"><section className="result-hero"><div className={`score-ring ${result.scoreReleased === false || unsubmitted ? 'score-ring--pending' : ''}`}><span>{unsubmitted ? '×' : result.scoreReleased === false ? '…' : result.score ?? '—'}</span><small>{unsubmitted ? '' : `/${result.maxScore ?? 10}`}</small></div><div><Pill tone={unsubmitted ? 'danger' : statusTone(result.gradeStatus || result.status)}>{unsubmitted ? 'Chưa nộp' : ['manual_review', 'manual_pending'].includes(result.gradeStatus) ? 'Chờ chấm tự luận' : result.status || 'Đã nộp'}</Pill><h1>{unsubmitted ? 'Lượt thi đã hết hạn nhưng chưa nhận được bài nộp' : result.scoreReleased === false ? 'Bài đã được ghi nhận an toàn' : percent >= 80 ? 'Hoàn thành rất tốt!' : percent >= 50 ? 'Bạn đã hoàn thành bài thi' : 'Hãy xem lại và cố gắng thêm'}</h1><p>{result.assignmentTitle || result.examTitle || 'Bài thi'} · Lượt #{result.attemptNo || 1}{unsubmitted ? '' : ` · Nộp ${formatDate(result.submittedAt, true)}`}</p>{location.state?.receipt || result.receiptHash ? <code className="receipt">Biên nhận: {(location.state?.receipt || result.receiptHash).slice(0, 24)}…</code> : null}</div></section>
    {unsubmitted && <Notice tone="warning">Hệ thống không nhận được gói đáp án cuối cùng trong thời gian cho phép nên lượt này không được tính là bài đã nộp.</Notice>}
    {!unsubmitted && result.scoreReleased === false && <Notice tone="info">Giáo viên chưa công bố điểm. Bài làm đã được khóa và lưu trên máy chủ.</Notice>}
    {!unsubmitted && <div className="result-metrics"><Card><small>Điểm số</small><strong>{result.scoreReleased === false ? 'Chờ công bố' : `${result.score ?? '—'} / ${result.maxScore ?? 10}`}</strong></Card><Card><small>Tự động chấm</small><strong>{result.scoreReleased === false ? 'Chờ công bố' : itemGradingVisible ? result.autoScore ?? '—' : 'Đang ẩn'}</strong></Card><Card><small>Cần giáo viên chấm</small><strong>{itemGradingVisible ? `${result.manualPendingCount ?? 0} câu` : ['manual_review', 'manual_pending'].includes(result.gradeStatus) ? 'Đang chờ' : 'Đang ẩn'}</strong></Card><Card><small>Thời gian làm</small><strong>{formatDuration(result.timeSpentSeconds)}</strong></Card></div>}
    {!unsubmitted && <Card className="panel"><header className="panel__header"><div><p className="eyebrow">CHI TIẾT BÀI LÀM</p><h2>{itemGradingVisible ? 'Đáp án và lời giải' : 'Câu trả lời đã nộp'}</h2></div><Link className="button button--secondary" to="/student">Về danh sách bài</Link></header>{details.length && !itemGradingVisible ? <Notice tone="info">Điểm tổng có thể đã được công bố, nhưng đúng/sai, điểm từng câu và lời giải chỉ hiện theo chính sách của giáo viên.</Notice> : null}{details.length ? <div className="review-grid">{details.map((item, index) => { const grade = itemGradeDisplay(item, itemGradingVisible); return <button type="button" key={item.id} className={`review-chip${grade.tone ? ` review-chip--${grade.tone}` : ''}`} onClick={() => setReviewIndex(index)}><span>Câu {index + 1}</span><strong>{grade.label}</strong></button>; })}</div> : <p className="form-note">Chi tiết câu hỏi chưa được công bố theo chính sách của giáo viên.</p>}{reviewIndex >= 0 && details[reviewIndex] && <div className="review-question"><QuestionRenderer item={details[reviewIndex]} number={reviewIndex + 1} value={details[reviewIndex].userAnswer} disabled reveal={itemGradingVisible ? details[reviewIndex] : null} /><Button variant="ghost" onClick={() => setReviewIndex(-1)}>Đóng chi tiết</Button></div>}</Card>}
  </Shell>;
}

function formatDuration(seconds) { const value = Number(seconds); if (!Number.isFinite(value)) return '—'; return `${Math.floor(value / 60)} phút ${value % 60} giây`; }

function elapsedSeconds(startedAt, submittedAt) {
  const start = new Date(startedAt).getTime();
  const end = new Date(submittedAt).getTime();
  return Number.isFinite(start) && Number.isFinite(end) ? Math.max(0, Math.round((end - start) / 1000)) : null;
}

function itemGradeDisplay(item, gradingVisible) {
  if (!gradingVisible) return { tone: '', label: hasResponse(item) ? 'Đã trả lời' : 'Bỏ trống' };
  const hasEarnedPoints = Object.hasOwn(item, 'earnedPoints') && item.earnedPoints !== null && item.earnedPoints !== undefined;
  const hasMaximum = Object.hasOwn(item, 'points') && item.points !== null && item.points !== undefined;
  if (hasEarnedPoints) return {
    tone: item.correct === true ? 'correct' : item.correct === false ? 'wrong' : 'pending',
    label: `${item.earnedPoints}${hasMaximum ? `/${item.points}` : ''}`,
  };
  return { tone: 'pending', label: item.type === 'tl' ? 'Chờ chấm' : 'Chưa công bố' };
}

function hasResponse(item) {
  const value = item?.userAnswer;
  if (Array.isArray(value)) return value.some((entry) => entry !== null && entry !== undefined);
  return value !== null && value !== undefined && String(value).trim() !== '';
}
