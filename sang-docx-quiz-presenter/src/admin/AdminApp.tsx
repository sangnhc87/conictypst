import { useEffect, useMemo, useState } from "react";
import { onAuthStateChanged, type User } from "firebase/auth";
import { auth, logout, signInWithGoogle } from "../config/firebase";
import { isAdminEmail } from "../config/access";

type AdminStatus = "all" | "admin" | "trial-active" | "paid-active" | "trial-expired" | "paid-expired" | "registered";

type AdminUser = {
  uid: string;
  email: string;
  displayName: string;
  photoURL: string;
  createdAt: string | null;
  lastSeenAt: string | null;
  authLastLoginAt: string | null;
  authDisabled: boolean;
  emailVerified: boolean;
  preferredSubject: string;
  aiImportCount: number;
  trialUsesRemaining: number;
  trialEndsAt: string | null;
  subscriptionPlanId: string;
  subscriptionStatus: string;
  accessEndsAt: string | null;
  status: Exclude<AdminStatus, "all">;
  totalOrders: number;
  paidOrders: number;
  paidAmount: number;
  lastPaymentAt: string | null;
  lastPaymentOrderCode: string;
};

type AdminPayment = {
  orderCode: string;
  uid: string;
  email: string;
  planId: string;
  subject: string;
  status: string;
  amount: number;
  createdAt: string | null;
  paidAt: string | null;
  accessEndsAt: string | null;
};

type Overview = {
  generatedAt: string;
  stats: {
    totalAccounts: number;
    trackedProfiles: number;
    customerCount: number;
    adminCount: number;
    trialActive: number;
    paidActive: number;
    paidExpired: number;
    trialExpired: number;
    registered: number;
    aiImportCount: number;
    paidOrderCount: number;
    revenue: number;
  };
  users: AdminUser[];
  payments: AdminPayment[];
  dataSources: {
    authAvailable: boolean;
    authTotal: number | null;
    authTruncated: boolean;
    usersTruncated: boolean;
    billingTruncated: boolean;
    paymentsTruncated: boolean;
  };
};

const STATUS_LABELS: Record<Exclude<AdminStatus, "all">, string> = {
  admin: "Admin",
  "trial-active": "Đang dùng thử",
  "paid-active": "Đã mua · còn hạn",
  "trial-expired": "Hết dùng thử",
  "paid-expired": "Gói đã hết hạn",
  registered: "Đã đăng ký",
};

const formatDate = (value: string | null) => {
  if (!value) return "—";
  const date = new Date(value);
  if (!Number.isFinite(date.getTime())) return "—";
  return new Intl.DateTimeFormat("vi-VN", { dateStyle: "medium", timeStyle: "short" }).format(date);
};

const formatMoney = (value: number) => new Intl.NumberFormat("vi-VN", {
  style: "currency",
  currency: "VND",
  maximumFractionDigits: 0,
}).format(value || 0);

const formatNumber = (value: number) => new Intl.NumberFormat("vi-VN").format(value || 0);

const csvCell = (value: unknown) => `"${String(value ?? "").replaceAll('"', '""')}"`;

function downloadCsv(users: AdminUser[]) {
  const headers = ["Email", "Tên", "Trạng thái", "Ngày đăng ký", "Hoạt động gần nhất", "Môn", "Lượt AI", "Còn lượt thử", "Hết thử", "Gói", "Hết hạn gói", "Đơn đã trả", "Doanh thu"];
  const rows = users.map((user) => [
    user.email,
    user.displayName,
    STATUS_LABELS[user.status],
    formatDate(user.createdAt),
    formatDate(user.lastSeenAt),
    user.preferredSubject,
    user.aiImportCount,
    user.trialUsesRemaining,
    formatDate(user.trialEndsAt),
    user.subscriptionPlanId,
    formatDate(user.accessEndsAt),
    user.paidOrders,
    user.paidAmount,
  ]);
  const csv = [headers, ...rows].map((row) => row.map(csvCell).join(",")).join("\n");
  const blob = new Blob(["\ufeff" + csv], { type: "text/csv;charset=utf-8" });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = `trinh-chieu-nguoi-dung-${new Date().toISOString().slice(0, 10)}.csv`;
  link.click();
  URL.revokeObjectURL(url);
}

function StatusPill({ status }: { status: AdminUser["status"] }) {
  return <span className={`status-pill status-pill--${status}`}>{STATUS_LABELS[status]}</span>;
}

function MetricCard({ label, value, note, tone = "blue" }: { label: string; value: string; note?: string; tone?: string }) {
  return (
    <article className={`metric-card metric-card--${tone}`}>
      <span>{label}</span>
      <strong>{value}</strong>
      {note && <small>{note}</small>}
    </article>
  );
}

export default function AdminApp() {
  const [authUser, setAuthUser] = useState<User | null>(null);
  const [authLoading, setAuthLoading] = useState(true);
  const [overview, setOverview] = useState<Overview | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [search, setSearch] = useState("");
  const [statusFilter, setStatusFilter] = useState<AdminStatus>("all");
  const [reloadKey, setReloadKey] = useState(0);

  useEffect(() => onAuthStateChanged(auth, (user) => {
    setAuthUser(user);
    setAuthLoading(false);
    if (!user) setOverview(null);
  }), []);

  useEffect(() => {
    if (!authUser || !isAdminEmail(authUser.email)) return;
    let cancelled = false;
    setLoading(true);
    setError("");
    void authUser.getIdToken().then((idToken) => fetch("/api/admin-overview", {
      headers: { Authorization: `Bearer ${idToken}` },
    })).then(async (response) => {
      const payload = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(payload.error || "Không tải được số liệu quản trị.");
      if (!cancelled) setOverview(payload as Overview);
    }).catch((reason) => {
      if (!cancelled) setError(reason instanceof Error ? reason.message : "Không tải được số liệu quản trị.");
    }).finally(() => {
      if (!cancelled) setLoading(false);
    });
    return () => { cancelled = true; };
  }, [authUser, reloadKey]);

  const visibleUsers = useMemo(() => {
    const needle = search.trim().toLowerCase();
    return (overview?.users || []).filter((user) => {
      const matchesStatus = statusFilter === "all" || user.status === statusFilter;
      if (!matchesStatus) return false;
      if (!needle) return true;
      return [user.email, user.displayName, user.preferredSubject, user.subscriptionPlanId]
        .some((value) => value.toLowerCase().includes(needle));
    });
  }, [overview, search, statusFilter]);

  if (authLoading) return <div className="admin-gate"><div className="gate-card"><div className="spinner" /><p>Đang kiểm tra quyền quản trị…</p></div></div>;

  if (!authUser) return (
    <div className="admin-gate">
      <div className="gate-card">
        <div className="admin-mark">QT</div>
        <p className="eyebrow">TRÌNH CHIẾU · PRIVATE ADMIN</p>
        <h1>Trung tâm quản trị</h1>
        <p className="muted">Đăng nhập bằng một trong hai Gmail admin để xem người dùng, dùng thử, thanh toán và hoạt động AI.</p>
        <button className="primary-button" onClick={() => void signInWithGoogle()}>Đăng nhập Gmail admin</button>
        <a href="/">← Về trang Trình Chiếu</a>
      </div>
    </div>
  );

  if (!isAdminEmail(authUser.email)) return (
    <div className="admin-gate">
      <div className="gate-card">
        <div className="admin-mark admin-mark--danger">!</div>
        <p className="eyebrow">403 · KHÔNG ĐƯỢC PHÉP</p>
        <h1>Khu vực này chỉ dành cho admin</h1>
        <p className="muted">Tài khoản <strong>{authUser.email}</strong> không nằm trong danh sách admin.</p>
        <div className="gate-actions"><button onClick={() => void logout()}>Đăng xuất</button><a href="/">Về trang chính</a></div>
      </div>
    </div>
  );

  const stats = overview?.stats;
  return (
    <div className="admin-shell">
      <header className="admin-topbar">
        <div className="topbar-brand">
          <div className="admin-mark">QT</div>
          <div><strong>Trung tâm quản trị</strong><span>Trình Chiếu · AI Lesson Studio</span></div>
        </div>
        <div className="topbar-actions">
          <span className="admin-identity">{authUser.email}</span>
          <a href="/">Mở ứng dụng</a>
          <button onClick={() => void logout()}>Đăng xuất</button>
        </div>
      </header>

      <main className="admin-main">
        <section className="page-intro">
          <div><p className="eyebrow">OVERVIEW · CẬP NHẬT TRỰC TIẾP</p><h1>Người dùng & vận hành</h1><p className="muted">Theo dõi tài khoản, lượt dùng thử, gói đã mua và doanh thu từ một nơi riêng tư.</p></div>
          <div className="intro-actions"><span className="updated-at">{overview ? `Cập nhật ${formatDate(overview.generatedAt)}` : "Chưa tải dữ liệu"}</span><button onClick={() => setReloadKey((value) => value + 1)} disabled={loading}>{loading ? "Đang tải…" : "↻ Làm mới"}</button></div>
        </section>

        {error && <div className="alert alert--error">{error}<button onClick={() => setReloadKey((value) => value + 1)}>Thử lại</button></div>}
        {!overview && loading && <div className="loading-panel"><div className="spinner" /><span>Đang tổng hợp dữ liệu Firebase Auth, Firestore và PayOS…</span></div>}

        {stats && <>
          <section className="metric-grid">
            <MetricCard label="Tổng tài khoản" value={formatNumber(stats.totalAccounts)} note={`${formatNumber(stats.customerCount)} người dùng · ${stats.adminCount} admin`} tone="blue" />
            <MetricCard label="Đang dùng thử" value={formatNumber(stats.trialActive)} note="Trong 7 ngày đầu" tone="orange" />
            <MetricCard label="Đã mua · còn hạn" value={formatNumber(stats.paidActive)} note={`${formatNumber(stats.paidOrderCount)} đơn đã thanh toán`} tone="green" />
            <MetricCard label="Dùng thử hết hạn" value={formatNumber(stats.trialExpired)} note={`${formatNumber(stats.paidExpired)} gói đã hết hạn`} tone="red" />
            <MetricCard label="Lượt AI đã dùng" value={formatNumber(stats.aiImportCount)} note="Tổng các tài khoản" tone="purple" />
            <MetricCard label="Doanh thu đã trả" value={formatMoney(stats.revenue)} note="Từ các đơn PayOS thành công" tone="teal" />
          </section>

          {!overview.dataSources.authAvailable && <div className="alert alert--warning">Chưa đọc được danh sách Firebase Auth bằng service account; số liệu đang tính theo các hồ sơ Firestore đã ghi nhận. Cấp quyền <code>firebaseauth.users.get</code> cho service account để tổng tài khoản bao quát cả người mới chỉ đăng nhập.</div>}
          {(overview.dataSources.authTruncated || overview.dataSources.usersTruncated || overview.dataSources.paymentsTruncated) && <div className="alert alert--warning">Dữ liệu đã vượt giới hạn hiển thị 5.000 hồ sơ/đơn; hãy thêm phân trang nếu hệ thống tăng trưởng lớn.</div>}

          <section className="panel users-panel">
            <div className="panel-heading"><div><p className="eyebrow">CUSTOMERS</p><h2>Danh sách người dùng</h2></div><button onClick={() => downloadCsv(visibleUsers)}>↓ Xuất CSV</button></div>
            <div className="filters"><label className="search-field"><span>⌕</span><input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Tìm email, tên, môn hoặc gói…" /></label><select value={statusFilter} onChange={(event) => setStatusFilter(event.target.value as AdminStatus)}><option value="all">Tất cả trạng thái</option>{Object.entries(STATUS_LABELS).map(([value, label]) => <option value={value} key={value}>{label}</option>)}</select><span className="result-count">{formatNumber(visibleUsers.length)} / {formatNumber(overview.users.length)} tài khoản</span></div>
            <div className="table-wrap"><table><thead><tr><th>Người dùng</th><th>Trạng thái</th><th>Đăng ký / hoạt động</th><th>Dùng thử & AI</th><th>Gói & thanh toán</th></tr></thead><tbody>
              {visibleUsers.map((user) => <tr key={user.uid}>
                <td><div className="person"><div className="avatar">{user.displayName?.trim()?.[0]?.toUpperCase() || user.email?.[0]?.toUpperCase() || "?"}</div><div><strong>{user.displayName || "Chưa đặt tên"}</strong><span>{user.email || `UID ${user.uid.slice(0, 10)}…`}</span><small>{user.preferredSubject || "Chưa chọn môn"}</small></div></div></td>
                <td><StatusPill status={user.status} />{user.authDisabled && <small className="subtle-danger">Tài khoản bị khóa</small>}</td>
                <td><strong>{formatDate(user.createdAt)}</strong><small>Hoạt động: {formatDate(user.lastSeenAt)}</small></td>
                <td><strong>{formatNumber(user.aiImportCount)} lượt AI</strong><small>{user.status === "trial-active" ? `Còn ${formatNumber(user.trialUsesRemaining)} lượt · hết ${formatDate(user.trialEndsAt)}` : `Dùng thử hết ${formatDate(user.trialEndsAt)}`}</small></td>
                <td>{user.subscriptionPlanId ? <><strong>{user.subscriptionPlanId}</strong><small>{user.status === "paid-active" ? `Còn đến ${formatDate(user.accessEndsAt)}` : `Hết hạn ${formatDate(user.accessEndsAt)}`}</small></> : <><strong>Chưa mua gói</strong><small>{user.paidOrders ? `${user.paidOrders} đơn · ${formatMoney(user.paidAmount)}` : "Chưa có đơn thành công"}</small></>}</td>
              </tr>)}
              {!visibleUsers.length && <tr><td colSpan={5} className="empty-cell">Không có tài khoản phù hợp bộ lọc.</td></tr>}
            </tbody></table></div>
          </section>

          <section className="panel payments-panel"><div className="panel-heading"><div><p className="eyebrow">PAYMENTS</p><h2>Đơn thanh toán gần đây</h2></div><span className="panel-note">Hiển thị tối đa 100 đơn gần nhất</span></div><div className="table-wrap"><table><thead><tr><th>Mã đơn / email</th><th>Gói</th><th>Số tiền</th><th>Trạng thái</th><th>Thời gian</th></tr></thead><tbody>{overview.payments.map((payment) => <tr key={payment.orderCode || `${payment.uid}-${payment.createdAt}`}><td><strong>#{payment.orderCode || "—"}</strong><small>{payment.email || payment.uid}</small></td><td><strong>{payment.planId || "—"}</strong><small>{payment.subject || "—"}</small></td><td><strong>{formatMoney(payment.amount)}</strong></td><td><span className={`status-pill status-pill--payment-${payment.status}`}>{payment.status || "—"}</span></td><td><strong>{formatDate(payment.paidAt || payment.createdAt)}</strong><small>{payment.accessEndsAt ? `Quyền đến ${formatDate(payment.accessEndsAt)}` : ""}</small></td></tr>)}{!overview.payments.length && <tr><td colSpan={5} className="empty-cell">Chưa có dữ liệu thanh toán.</td></tr>}</tbody></table></div></section>
        </>}
      </main>
    </div>
  );
}
