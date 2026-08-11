'use strict';

const STUDIO_PLAN_DAYS = Object.freeze({
  'hub-cloud-1y': 365,
  'hub-cloud-2y': 730,
  'hub-cloud-5y': 1825,
});

function normalizeEmail(value) {
  const email = String(value || '').trim().toLowerCase();
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 254) {
    throw new Error('Email cấp quyền không hợp lệ.');
  }
  return email;
}

function normalizeStoreGrantPayload(value) {
  const payload = value && typeof value === 'object' ? value : {};
  const productId = String(payload.productId || '').trim();
  const expectedDays = STUDIO_PLAN_DAYS[productId];
  if (!expectedDays) throw new Error('Sản phẩm Conic Studio Pro không hợp lệ.');

  const accessDays = Math.round(Number(payload.accessDays));
  if (accessDays !== expectedDays) throw new Error('Thời hạn cấp quyền không khớp sản phẩm.');

  const orderId = String(payload.orderId || '').trim();
  const transactionId = String(payload.transactionId || '').trim();
  if (!/^[A-Za-z0-9_-]{8,128}$/.test(orderId)) throw new Error('Mã đơn hàng không hợp lệ.');
  if (!transactionId || transactionId.length > 160) throw new Error('Mã giao dịch không hợp lệ.');

  const paidAt = new Date(payload.paidAt);
  if (!Number.isFinite(paidAt.getTime())) throw new Error('Thời điểm thanh toán không hợp lệ.');

  return {
    orderId,
    transactionId,
    productId,
    email: normalizeEmail(payload.email),
    accessDays,
    totalVnd: Math.max(0, Math.round(Number(payload.totalVnd) || 0)),
    paidAt,
  };
}

function extendedAccessEnd({ paidAt, accessDays, currentAccessEnd = null }) {
  const paidAtMs = new Date(paidAt).getTime();
  const currentEndMs = currentAccessEnd ? new Date(currentAccessEnd).getTime() : 0;
  const base = Math.max(paidAtMs, Number.isFinite(currentEndMs) ? currentEndMs : 0);
  return new Date(base + accessDays * 86400000);
}

module.exports = {
  STUDIO_PLAN_DAYS,
  extendedAccessEnd,
  normalizeEmail,
  normalizeStoreGrantPayload,
};
