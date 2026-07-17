import { useEffect, useRef } from 'react';

export function Button({ children, variant = 'primary', busy = false, className = '', ...props }) {
  return (
    <button className={`button button--${variant} ${className}`.trim()} disabled={busy || props.disabled} {...props}>
      {busy && <span className="spinner spinner--small" aria-hidden="true" />}
      {children}
    </button>
  );
}

export function Card({ children, className = '', ...props }) {
  return <section className={`card ${className}`.trim()} {...props}>{children}</section>;
}

export function EmptyState({ icon = '◇', title, children, action }) {
  return (
    <div className="empty-state">
      <span className="empty-state__icon" aria-hidden="true">{icon}</span>
      <h3>{title}</h3>
      {children && <p>{children}</p>}
      {action}
    </div>
  );
}

export function Pill({ children, tone = 'neutral' }) {
  return <span className={`pill pill--${tone}`}>{children}</span>;
}

export function Metric({ icon, label, value, hint, tone = 'teal' }) {
  return (
    <article className="metric">
      <span className={`metric__icon metric__icon--${tone}`} aria-hidden="true">{icon}</span>
      <div><small>{label}</small><strong>{value}</strong>{hint && <span>{hint}</span>}</div>
    </article>
  );
}

export function LoadingScreen({ label = 'Đang kết nối hệ thống…' }) {
  return (
    <div className="loading-screen" role="status">
      <span className="brand-mark">C</span>
      <span className="spinner" aria-hidden="true" />
      <p>{label}</p>
    </div>
  );
}

export function Notice({ tone = 'info', children, onClose }) {
  return (
    <div className={`notice notice--${tone}`} role={tone === 'danger' ? 'alert' : 'status'}>
      <span>{children}</span>
      {onClose && <button type="button" onClick={onClose} aria-label="Đóng thông báo">×</button>}
    </div>
  );
}

export function Modal({ open, title, children, onClose, wide = false }) {
  const dialogRef = useRef(null);
  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;
    if (open && !dialog.open) dialog.showModal();
    if (!open && dialog.open) dialog.close();
  }, [open]);

  return (
    <dialog ref={dialogRef} className={`modal ${wide ? 'modal--wide' : ''}`} onCancel={onClose} onClose={onClose}>
      <header><h2>{title}</h2><button type="button" onClick={onClose} aria-label="Đóng">×</button></header>
      {children}
    </dialog>
  );
}

export function Field({ label, hint, children, className = '' }) {
  return (
    <label className={`field ${className}`.trim()}>
      <span>{label}</span>
      {children}
      {hint && <small>{hint}</small>}
    </label>
  );
}

export function formatDate(value, withTime = false) {
  if (!value) return '—';
  const date = value?.toDate?.() || new Date(value);
  if (Number.isNaN(date.getTime())) return '—';
  return new Intl.DateTimeFormat('vi-VN', {
    day: '2-digit',
    month: '2-digit',
    year: 'numeric',
    ...(withTime ? { hour: '2-digit', minute: '2-digit' } : {}),
  }).format(date);
}

export function statusTone(status) {
  if (['active', 'open', 'graded', 'ready', 'approved'].includes(status)) return 'success';
  if (['pending', 'requested', 'scheduled', 'manual_review'].includes(status)) return 'warning';
  if (['suspended', 'rejected', 'closed', 'expired', 'expired_unsubmitted', 'failed'].includes(status)) return 'danger';
  return 'neutral';
}
