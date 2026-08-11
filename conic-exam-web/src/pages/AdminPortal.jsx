import { useCallback, useEffect, useMemo, useState } from 'react';
import { useAuth } from '../auth/AuthContext';
import { confirmAction, typedConfirmAction } from '../lib/alerts';
import { Shell } from '../components/Shell';
import AdminOnboarding from '../components/AdminOnboarding';
import {
  Button, Card, EmptyState, Field, Metric, Modal, Notice, Pill, formatDate, statusTone,
} from '../components/UI';

const FILTERS = ['pending', 'active', 'suspended', 'deletion_scheduled', 'all'];
const DEFAULT_LIMITS = Object.freeze({
  storageBytes: 536870912,
  maxClasses: 10,
  maxStudents: 500,
  maxPublishedExams: 200,
  maxActiveAssignments: 30,
  maxAttemptsPerYear: 12000,
  retentionDays: 365,
});

const FILTER_LABELS = Object.freeze({
  pending: 'Chờ duyệt', active: 'Đang dùng', suspended: 'Tạm dừng',
  deletion_scheduled: 'Chờ xóa', all: 'Tất cả',
});

function number(value) {
  return new Intl.NumberFormat('vi-VN').format(Number(value || 0));
}

function money(value) {
  return new Intl.NumberFormat('vi-VN', {
    style: 'currency', currency: 'VND', maximumFractionDigits: 0,
  }).format(Number(value || 0));
}

function bytes(value) {
  const amount = Number(value || 0);
  if (amount < 1024) return `${number(amount)} B`;
  if (amount < 1048576) return `${(amount / 1024).toFixed(1)} KiB`;
  if (amount < 1073741824) return `${(amount / 1048576).toFixed(1)} MiB`;
  return `${(amount / 1073741824).toFixed(2)} GiB`;
}

function severityTone(severity) {
  if (severity === 'critical' || severity === 'danger') return 'danger';
  if (severity === 'warning') return 'warning';
  return 'success';
}

function CostTrend({ items = [] }) {
  const maximum = Math.max(1, ...items.map((item) => Number(item.attempts || 0)));
  return (
    <div className="cost-trend" role="img" aria-label="Biểu đồ lượt thi trong 14 ngày">
      {items.map((item) => {
        const height = Math.max(4, Math.round(Number(item.attempts || 0) / maximum * 100));
        const label = new Date(`${item.date}T00:00:00+07:00`).toLocaleDateString('vi-VN', { day: '2-digit', month: '2-digit' });
        return (
          <span key={item.date} title={`${label}: ${number(item.attempts)} lượt`}>
            <b>{number(item.attempts)}</b>
            <i style={{ height: `${height}%` }} />
            <small>{label}</small>
          </span>
        );
      })}
    </div>
  );
}

function QuotaMeter({ item, compact = false }) {
  if (!item) return <small className="block-note">Chưa có dữ liệu</small>;
  const percent = Math.max(0, Math.round(Number(item.ratio || 0) * 100));
  const capped = Math.min(100, percent);
  return (
    <div className={`quota-meter ${compact ? 'quota-meter--compact' : ''}`}>
      <div><span>{item.label}</span><strong>{percent}%</strong></div>
      <div className={`quota-meter__track quota-meter__track--${percent >= 100 ? 'danger' : percent >= 75 ? 'warning' : 'healthy'}`}>
        <i style={{ width: `${capped}%` }} />
      </div>
      {!compact && <small>{item.limitKey === 'storageBytes' ? `${bytes(item.used)} / ${bytes(item.limit)}` : `${number(item.used)} / ${number(item.limit)}`}</small>}
    </div>
  );
}

function CostControl({ overview, usageByUid }) {
  const forecast = overview?.costForecast;
  const usage = overview?.usage;
  const alerts = usage?.alerts || [];
  const operations = forecast?.projectedOperations || {};
  const utilization = forecast?.freeTierUtilization || {};
  return (
    <>
      <div className="cost-control-grid">
        <Card className="cost-card cost-card--primary">
          <div><p className="eyebrow">DỰ BÁO CUỐI THÁNG</p><strong>{money(forecast?.projectedVnd)}</strong></div>
          <Pill tone={(forecast?.projectedVnd || 0) > 0 ? 'warning' : 'success'}>
            {forecast?.projectedVnd ? 'Có tải vượt free tier' : 'Trong free tier dự kiến'}
          </Pill>
          <p>{number(forecast?.projectedAttempts)} lượt thi dự kiến · hiện có {number(usage?.attemptsThisMonth)} lượt trong tháng.</p>
        </Card>
        <Card className="cost-card">
          <p className="eyebrow">TẢI DỰ KIẾN</p>
          <div className="cost-operations">
            <span><small>Đọc tài liệu</small><strong>{number(operations.reads)}</strong><em>{Math.round((utilization.reads || 0) * 100)}% free/day</em></span>
            <span><small>Ghi tài liệu</small><strong>{number(operations.writes)}</strong><em>{Math.round((utilization.writes || 0) * 100)}% free/day</em></span>
            <span><small>Callable</small><strong>{number(operations.invocations)}</strong><em>{Math.round((utilization.invocations || 0) * 100)}% free/month</em></span>
            <span><small>Lưu trữ</small><strong>{bytes(operations.storageBytes)}</strong><em>{Math.round((utilization.storage || 0) * 100)}% free</em></span>
          </div>
        </Card>
      </div>
      <div className="admin-insight-grid">
        <Card className="panel cost-chart-card">
          <header className="panel__header"><div><p className="eyebrow">14 NGÀY GẦN NHẤT</p><h2>Nhịp lượt thi toàn hệ thống</h2></div><Pill tone="info">Asia/Ho_Chi_Minh</Pill></header>
          <CostTrend items={overview?.trend || []} />
          <small className="cost-disclaimer">Dự báo là mô hình tải nội bộ; hóa đơn đối soát chính thức lấy từ Google Cloud Billing.</small>
        </Card>
        <Card className="panel alert-center">
          <header className="panel__header"><div><p className="eyebrow">EARLY WARNING</p><h2>Cảnh báo cần xử lý</h2></div><Pill tone={alerts.length ? 'warning' : 'success'}>{alerts.length}</Pill></header>
          {alerts.length === 0 ? <EmptyState icon="✓" title="Hệ thống khỏe">Chưa có quota hoặc thuê bao nào cần can thiệp.</EmptyState> : (
            <div className="alert-list">{alerts.slice(0, 8).map((alert, index) => {
              const teacher = usageByUid.get(alert.uid);
              return <article key={`${alert.uid}-${alert.code}-${index}`}><span className={`alert-dot alert-dot--${alert.severity}`} /><div><strong>{teacher?.displayName || teacher?.email || `${alert.uid.slice(0, 10)}…`}</strong><small>{alert.message}</small></div><Pill tone={severityTone(alert.severity)}>{alert.severity}</Pill></article>;
            })}</div>
          )}
        </Card>
      </div>
    </>
  );
}

export default function AdminPortal() {
  const { api, account } = useAuth();
  const [members, setMembers] = useState([]);
  const [audit, setAudit] = useState([]);
  const [overview, setOverview] = useState(null);
  const [filter, setFilter] = useState('pending');
  const [loading, setLoading] = useState(true);
  const [actionUid, setActionUid] = useState('');
  const [message, setMessage] = useState(null);
  const [selected, setSelected] = useState(() => new Set());
  const [quotaMember, setQuotaMember] = useState(null);
  const [quotaForm, setQuotaForm] = useState(DEFAULT_LIMITS);
  const [teacherDetail, setTeacherDetail] = useState(null);

  const load = useCallback(async () => {
    setLoading(true);
    setMessage(null);
    try {
      const [memberData, auditData, statsData] = await Promise.all([
        api.adminListMembers({ status: filter }), api.adminListAudit(), api.adminExamStats(),
      ]);
      setMembers(memberData.items || []);
      setAudit((auditData.items || []).filter((item) => item.productId === 'exam'));
      setOverview(statsData);
      setSelected(new Set());
    } catch (error) {
      setMessage({ tone: 'danger', text: error.message });
    } finally {
      setLoading(false);
    }
  }, [api, filter]);

  useEffect(() => { load(); }, [load]);

  async function apply(member, action, payload = {}, { reload = true, rethrow = false } = {}) {
    setActionUid(member.uid);
    setMessage(null);
    try {
      const response = await api.adminApplyMembership({
        mutationId: crypto.randomUUID(), uid: member.uid, action,
        expectedRevision: member.revision || 0, payload,
        reason: action === 'approve'
          ? 'Đã xác minh gói giáo viên Conic Exam 299.000đ/12 tháng.'
          : action === 'schedule_delete'
            ? 'Owner lên lịch xóa tenant Conic Exam và toàn bộ dữ liệu thuộc giáo viên sau 7 ngày.'
            : action === 'cancel_delete'
              ? 'Owner hủy lịch xóa tenant Conic Exam trong thời gian ân hạn.'
              : action === 'update_limits'
                ? 'Cập nhật hạn mức vận hành từ Cost Control Center.'
                : 'Cập nhật từ Conic Exam Admin.',
      });
      if (reload) {
        await load();
        setMessage({ tone: 'success', text: 'Đã cập nhật thành công và ghi nhật ký quản trị.' });
      }
      return response;
    } catch (error) {
      setMessage({ tone: 'danger', text: error.message });
      if (rethrow) throw error;
      return null;
    } finally {
      setActionUid('');
    }
  }

  async function scheduleDelete(member) {
    if (!isOwner) return;
    const confirmed = await typedConfirmAction({
      title: 'Lên lịch xóa toàn bộ tenant?',
      text: `Sau 7 ngày, dữ liệu lớp, đề, lịch thi và bài làm của ${member.email || member.uid} sẽ bị xóa.`,
      expectedText: 'XÓA', confirmText: 'Lên lịch xóa',
    });
    if (confirmed) await apply(member, 'schedule_delete', { graceDays: 7 });
  }

  async function cancelDelete(member) {
    if (!isOwner || !await confirmAction({ title: 'Hủy lịch xóa tenant?', text: `Tài khoản ${member.email || member.uid} sẽ được khôi phục quyền trước khi lên lịch.`, confirmText: 'Hủy lịch xóa' })) return;
    await apply(member, 'cancel_delete');
  }

  function openQuota(member) {
    const limits = { ...DEFAULT_LIMITS, ...(member.limits || {}) };
    setQuotaForm({ ...limits, storageMiB: Math.round(limits.storageBytes / 1048576) });
    setQuotaMember(member);
  }

  async function openTeacherDetail(member) {
    setTeacherDetail({ loading: true, member, error: '' });
    try {
      const response = await api.adminTeacherOverview(member.uid);
      setTeacherDetail({ loading: false, member, ...response, error: '' });
    } catch (error) {
      setTeacherDetail({ loading: false, member, error: error.message });
    }
  }

  async function saveQuota(event) {
    event.preventDefault();
    if (!quotaMember) return;
    const limits = {
      maxClasses: Number(quotaForm.maxClasses),
      maxStudents: Number(quotaForm.maxStudents),
      maxPublishedExams: Number(quotaForm.maxPublishedExams),
      maxActiveAssignments: Number(quotaForm.maxActiveAssignments),
      maxAttemptsPerYear: Number(quotaForm.maxAttemptsPerYear),
      retentionDays: Number(quotaForm.retentionDays),
      storageBytes: Number(quotaForm.storageMiB) * 1048576,
    };
    if (Object.values(limits).some((value) => !Number.isSafeInteger(value) || value < 0) || limits.retentionDays < 1) {
      setMessage({ tone: 'danger', text: 'Các quota phải là số nguyên không âm; thời gian lưu tối thiểu 1 ngày.' });
      return;
    }
    try {
      const result = await apply(quotaMember, 'update_limits', { limits });
      if (!result) return;
      setQuotaMember(null);
      setMessage({ tone: 'success', text: 'Đã lưu quota mới và ghi nhật ký quản trị.' });
    } catch { /* apply already reports the server error */ }
  }

  async function bulkAction(action) {
    const targets = members.filter((member) => selected.has(member.uid)).filter((member) => (
      action === 'extend' ? ['active', 'suspended'].includes(member.status)
        : action === 'suspend' ? member.status === 'active'
          : action === 'resume' ? member.status === 'suspended' : false
    ));
    if (!targets.length) {
      setMessage({ tone: 'warning', text: 'Không có giáo viên phù hợp với thao tác đã chọn.' });
      return;
    }
    const confirmed = await confirmAction({
      title: `Áp dụng cho ${targets.length} giáo viên?`,
      text: action === 'extend' ? 'Mỗi tài khoản sẽ được gia hạn thêm 12 tháng.' : action === 'suspend' ? 'Các tài khoản đang hoạt động sẽ bị tạm dừng.' : 'Các tài khoản tạm dừng sẽ được mở lại.',
      confirmText: 'Thực hiện', danger: action === 'suspend',
    });
    if (!confirmed) return;
    setActionUid('bulk');
    let succeeded = 0;
    const failures = [];
    for (const member of targets) {
      try {
        await apply(member, action, action === 'extend' ? { months: 12 } : {}, { reload: false, rethrow: true });
        succeeded += 1;
      } catch (error) {
        failures.push(`${member.email || member.uid}: ${error.message}`);
      }
    }
    await load();
    setMessage(failures.length
      ? { tone: 'warning', text: `Đã xử lý ${succeeded}/${targets.length}. ${failures[0]}` }
      : { tone: 'success', text: `Đã xử lý thành công ${succeeded} giáo viên và ghi audit riêng từng tài khoản.` });
  }

  const usageByUid = useMemo(() => new Map((overview?.usage?.teacherUsage || []).map((item) => [item.uid, item])), [overview]);
  const stats = useMemo(() => ({
    pending: overview?.pendingTeachers ?? members.filter((member) => member.status === 'pending').length,
    teachers: overview?.teachers ?? members.length,
    classrooms: overview?.classrooms ?? 0,
    attempts: overview?.attempts ?? 0,
  }), [members, overview]);
  const isOwner = account?.admin?.isOwner === true || account?.admin?.role === 'owner';
  const allSelected = members.length > 0 && members.every((member) => selected.has(member.uid));

  return (
    <Shell section="admin">
      <section className="dashboard-hero dashboard-hero--admin">
        <div><p className="eyebrow">CONIC EXAM CONTROL CENTER</p><h1>Chi phí, quota và vận hành</h1><p>Một màn hình để phát hiện sớm tải tăng, giáo viên sắp chạm hạn mức và mọi thay đổi quản trị.</p></div>
        <Button variant="secondary" onClick={load} busy={loading}>↻ Làm mới</Button>
      </section>
      {message && <Notice tone={message.tone} onClose={() => setMessage(null)}>{message.text}</Notice>}
      <AdminOnboarding overview={overview || {}} />
      <div className="metric-grid">
        <Metric icon="GV" label="Tổng giáo viên" value={number(stats.teachers)} hint={`${members.length} trong bộ lọc`} tone="blue" />
        <Metric icon="◷" label="Chờ duyệt" value={number(stats.pending)} hint="cần xác minh" tone="gold" />
        <Metric icon="▦" label="Lớp học" value={number(stats.classrooms)} hint={`${number(overview?.assignments)} đợt thi`} />
        <Metric icon="✓" label="Lượt thi" value={number(stats.attempts)} hint={`${number(overview?.releases)} đề đã phát hành`} tone="red" />
      </div>
      <CostControl overview={overview} usageByUid={usageByUid} />

      <Card className="panel" id="teacher-members">
        <header className="panel__header"><div><p className="eyebrow">GÓI CƠ BẢN (299.000Đ / 12 THÁNG)</p><h2>Giáo viên và sức khỏe quota</h2></div><div className="segmented">{FILTERS.map((value) => <button key={value} type="button" className={filter === value ? 'is-active' : ''} onClick={() => setFilter(value)}>{FILTER_LABELS[value]}</button>)}</div></header>
        {selected.size > 0 && <div className="bulk-toolbar"><strong>{selected.size} giáo viên đã chọn</strong><span /><Button variant="secondary" busy={actionUid === 'bulk'} onClick={() => bulkAction('extend')}>+12 tháng</Button><Button variant="secondary" busy={actionUid === 'bulk'} onClick={() => bulkAction('resume')}>Mở lại</Button><Button variant="danger-ghost" busy={actionUid === 'bulk'} onClick={() => bulkAction('suspend')}>Tạm dừng</Button><Button variant="ghost" onClick={() => setSelected(new Set())}>Bỏ chọn</Button></div>}
        {loading ? <div className="panel-loading"><span className="spinner" />Đang tải giáo viên…</div> : members.length === 0 ? <EmptyState icon="✓" title="Không có tài khoản trong bộ lọc">Các yêu cầu mới sẽ xuất hiện tại đây.</EmptyState> : (
          <div className="table-wrap"><table><thead><tr><th className="select-column"><input type="checkbox" checked={allSelected} onChange={() => setSelected(allSelected ? new Set() : new Set(members.map((member) => member.uid)))} aria-label="Chọn tất cả" /></th><th>Giáo viên</th><th>Lớp & học sinh</th><th>Trạng thái</th><th>Thời hạn</th><th>Sử dụng cao nhất</th><th>Hạn mức</th><th>Thao tác</th></tr></thead><tbody>{members.map((member) => {
            const health = usageByUid.get(member.uid);
            return <tr key={member.uid}>
              <td className="select-column"><input type="checkbox" checked={selected.has(member.uid)} onChange={() => setSelected((current) => { const next = new Set(current); if (next.has(member.uid)) next.delete(member.uid); else next.add(member.uid); return next; })} aria-label={`Chọn ${member.displayName || member.email}`} /></td>
              <td><div className="person-cell">{member.photoURL ? <img src={member.photoURL} alt="" referrerPolicy="no-referrer" /> : <span>{(member.displayName || '?')[0]}</span>}<div><strong>{member.displayName || 'Chưa đặt tên'}</strong><small>{member.email}</small><code>{member.uid.slice(0, 10)}…</code></div></div></td>
              <td><div className="teacher-footprint"><strong>{number(health?.usage?.activeStudentMemberships)} học sinh</strong><small>{number(health?.usage?.classCount)} lớp · {number(health?.usage?.attemptCount)} lượt thi</small><Button variant="ghost" onClick={() => openTeacherDetail(member)}>Xem từng lớp →</Button></div></td>
              <td><Pill tone={member.status === 'deletion_scheduled' ? 'danger' : statusTone(member.hasAccess ? 'active' : member.status)}>{member.status === 'deletion_scheduled' ? 'Chờ xóa' : member.hasAccess ? 'Đang dùng' : member.status}</Pill><small className="block-note">rev {member.revision || 0}</small></td>
              <td><strong>{member.status === 'deletion_scheduled' ? `Xóa sau ${formatDate(member.deleteAfter, true)}` : formatDate(member.accessEndsAt)}</strong><small className="block-note">{health?.daysToExpiry != null && member.status === 'active' ? `${health.daysToExpiry} ngày còn lại` : `Yêu cầu ${formatDate(member.requestedAt)}`}</small></td>
              <td><QuotaMeter item={health?.quota?.peak} compact />{health?.alerts?.[0] && <small className={`quota-warning quota-warning--${health.alerts[0].severity}`}>{health.alerts[0].message}</small>}</td>
              <td><small>{member.limits?.maxClasses ?? 10} lớp · {member.limits?.maxStudents ?? 500} HS</small><small className="block-note">{member.limits?.maxAttemptsPerYear ?? 12000} lượt/năm · {member.limits?.retentionDays ?? 365} ngày</small><Button variant="ghost" className="quota-edit" onClick={() => openQuota(member)}>Điều chỉnh quota</Button></td>
              <td><div className="table-actions">
                {member.status === 'pending' && <Button busy={actionUid === member.uid} onClick={() => apply(member, 'approve', { months: 12 })}>Duyệt 12 tháng</Button>}
                {member.status === 'active' && member.hasAccess && <><Button variant="secondary" busy={actionUid === member.uid} onClick={() => apply(member, 'extend', { months: 12 })}>+12 tháng</Button><Button variant="danger-ghost" onClick={() => apply(member, 'suspend')}>Tạm dừng</Button></>}
                {member.status === 'suspended' && <Button busy={actionUid === member.uid} onClick={() => apply(member, 'resume')}>Mở lại</Button>}
                {isOwner && ['pending', 'active', 'suspended'].includes(member.status) && <Button variant="danger-ghost" busy={actionUid === member.uid} onClick={() => scheduleDelete(member)}>Xóa tenant</Button>}
                {isOwner && member.status === 'deletion_scheduled' && <Button variant="warning" busy={actionUid === member.uid} onClick={() => cancelDelete(member)}>Hủy lịch xóa</Button>}
              </div></td>
            </tr>;
          })}</tbody></table></div>
        )}
      </Card>
      <Card className="panel">
        <header className="panel__header"><div><p className="eyebrow">AUDIT TRAIL</p><h2>Nhật ký Conic Exam gần nhất</h2></div><Pill tone="info">Bất biến · 12 tháng</Pill></header>
        {audit.length === 0 ? <EmptyState title="Chưa có thao tác">Lịch sử duyệt và gia hạn sẽ được lưu ở đây.</EmptyState> : <div className="audit-list">{audit.slice(0, 30).map((item) => <article key={item.id}><span>{item.action === 'approve' ? '✓' : item.action === 'update_limits' ? '≋' : '↻'}</span><div><strong>{item.action} · {item.targetUid?.slice(0, 10)}…</strong><small>{item.actorEmail} · {formatDate(item.createdAt, true)}{item.reason ? ` · ${item.reason}` : ''}</small></div><Pill tone={statusTone(item.after?.status)}>{item.after?.status}</Pill></article>)}</div>}
      </Card>

      <Modal open={Boolean(quotaMember)} title={`Quota · ${quotaMember?.displayName || quotaMember?.email || ''}`} onClose={() => setQuotaMember(null)}>
        <form className="form-stack quota-form" onSubmit={saveQuota}>
          <Notice tone="info">Quota được backend kiểm tra trong transaction. Thay đổi không làm mất ngày còn lại của thuê bao.</Notice>
          <div className="form-grid">
            {[
              ['maxClasses', 'Số lớp tối đa', 0, 500],
              ['maxStudents', 'Học sinh tối đa', 0, 10000],
              ['maxPublishedExams', 'Đề phát hành', 0, 10000],
              ['maxActiveAssignments', 'Lịch thi hoạt động', 0, 1000],
              ['maxAttemptsPerYear', 'Lượt thi mỗi năm', 0, 1000000],
              ['retentionDays', 'Lưu bài làm (ngày)', 1, 365],
              ['storageMiB', 'Lưu trữ (MiB)', 0, 10240],
            ].map(([key, label, min, max]) => <Field key={key} label={label} hint={`${number(min)} – ${number(max)}`}><input type="number" min={min} max={max} step="1" required value={quotaForm[key] ?? ''} onChange={(event) => setQuotaForm((current) => ({ ...current, [key]: event.target.value }))} /></Field>)}
          </div>
          <footer><Button type="button" variant="secondary" onClick={() => setQuotaMember(null)}>Hủy</Button><Button type="submit" busy={actionUid === quotaMember?.uid}>Lưu quota</Button></footer>
        </form>
      </Modal>
      <Modal open={Boolean(teacherDetail)} title={`Toàn cảnh · ${teacherDetail?.teacher?.displayName || teacherDetail?.member?.displayName || teacherDetail?.member?.email || ''}`} onClose={() => setTeacherDetail(null)} wide>
        <div className="teacher-detail-body">
          {teacherDetail?.loading ? <div className="panel-loading"><span className="spinner" />Đang tổng hợp lớp và học sinh…</div> : teacherDetail?.error ? <Notice tone="danger">{teacherDetail.error}</Notice> : <>
            <div className="teacher-detail-metrics">
              <Metric icon="▦" label="Lớp học" value={number(teacherDetail?.totals?.classrooms)} hint={`${number(teacherDetail?.totals?.pendingStudents)} HS chờ duyệt`} tone="blue" />
              <Metric icon="HS" label="Học sinh" value={number(teacherDetail?.totals?.students)} hint={`quota ${number(teacherDetail?.teacher?.limits?.maxStudents)}`} />
              <Metric icon="⌘" label="Đề và lịch thi" value={number(teacherDetail?.totals?.releases)} hint={`${number(teacherDetail?.totals?.assignments)} đợt thi`} tone="gold" />
              <Metric icon="✓" label="Lượt thi" value={number(teacherDetail?.totals?.attempts)} hint={`quota ${number(teacherDetail?.teacher?.limits?.maxAttemptsPerYear)}`} tone="red" />
            </div>
            <div className="teacher-detail-heading"><div><p className="eyebrow">TENANT MAP</p><h3>Các lớp thuộc giáo viên</h3></div><Button variant="secondary" onClick={() => { const member = teacherDetail.member; setTeacherDetail(null); openQuota(member); }}>Điều chỉnh quota</Button></div>
            {(teacherDetail?.classrooms || []).length === 0 ? <EmptyState title="Giáo viên chưa tạo lớp">Lớp mới sẽ xuất hiện tại đây cùng số học sinh và chế độ tiếp nhận.</EmptyState> : <div className="admin-class-grid">{teacherDetail.classrooms.map((classroom) => <article key={classroom.id}><header><span>{String(classroom.grade || 'Lớp').replace('Lớp ', '')}</span><Pill tone={classroom.joinMode === 'auto' ? 'info' : 'success'}>{classroom.joinMode === 'auto' ? 'Tự động' : 'Cần duyệt'}</Pill></header><h4>{classroom.name}</h4><p>{classroom.subject || 'Toán'} · {classroom.academicYear || 'Năm học hiện tại'}</p><div><strong>{number(classroom.studentCount)} học sinh</strong><small>{number(classroom.pendingCount)} chờ duyệt</small></div><code>{classroom.joinCode}</code></article>)}</div>}
          </>}
        </div>
        <footer className="modal-actions"><Button variant="secondary" onClick={() => setTeacherDetail(null)}>Đóng</Button></footer>
      </Modal>
    </Shell>
  );
}
