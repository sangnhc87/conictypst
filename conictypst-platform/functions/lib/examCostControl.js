'use strict';

const DEFAULT_COST_MODEL = Object.freeze({
  currency: 'VND',
  freeReadsPerDay: 50000,
  freeWritesPerDay: 20000,
  freeStorageBytes: 1073741824,
  freeInvocationsPerMonth: 2000000,
  vndPer100kReads: 1600,
  vndPer100kWrites: 4800,
  vndPerGiBMonth: 5200,
  vndPerMillionInvocations: 10000,
  estimatedReadsPerAttempt: 18,
  estimatedWritesPerAttempt: 7,
  estimatedInvocationsPerAttempt: 6,
  baselineReadsPerTeacherDay: 25,
  baselineWritesPerTeacherDay: 3,
  baselineInvocationsPerTeacherDay: 4,
});

const QUOTA_FIELDS = Object.freeze([
  ['classCount', 'maxClasses', 'Lớp học'],
  ['activeStudentMemberships', 'maxStudents', 'Học sinh'],
  ['releaseCount', 'maxPublishedExams', 'Đề đã phát hành'],
  ['activeAssignmentCount', 'maxActiveAssignments', 'Lịch thi hoạt động'],
  ['attemptCount', 'maxAttemptsPerYear', 'Lượt thi trong kỳ'],
  ['storageBytesEstimated', 'storageBytes', 'Dung lượng ước tính'],
]);

function finiteNumber(value, fallback = 0) {
  const number = Number(value);
  return Number.isFinite(number) && number >= 0 ? number : fallback;
}

function envNumber(name, fallback) {
  const value = Number(process.env[name]);
  return Number.isFinite(value) && value >= 0 ? value : fallback;
}

function configuredCostModel() {
  return {
    ...DEFAULT_COST_MODEL,
    vndPer100kReads: envNumber('CT_COST_VND_PER_100K_READS', DEFAULT_COST_MODEL.vndPer100kReads),
    vndPer100kWrites: envNumber('CT_COST_VND_PER_100K_WRITES', DEFAULT_COST_MODEL.vndPer100kWrites),
    vndPerGiBMonth: envNumber('CT_COST_VND_PER_GIB_MONTH', DEFAULT_COST_MODEL.vndPerGiBMonth),
    vndPerMillionInvocations: envNumber(
      'CT_COST_VND_PER_MILLION_INVOCATIONS',
      DEFAULT_COST_MODEL.vndPerMillionInvocations,
    ),
  };
}

function quotaSnapshot(usage = {}, limits = {}) {
  const items = QUOTA_FIELDS.map(([usageKey, limitKey, label]) => {
    const used = finiteNumber(usage[usageKey]);
    const limit = finiteNumber(limits[limitKey]);
    const ratio = limit > 0 ? used / limit : (used > 0 ? 1 : 0);
    return { usageKey, limitKey, label, used, limit, ratio };
  });
  const peak = items.reduce((current, item) => (item.ratio > current.ratio ? item : current), items[0]);
  let severity = 'healthy';
  if (peak.ratio >= 1) severity = 'critical';
  else if (peak.ratio >= 0.9) severity = 'danger';
  else if (peak.ratio >= 0.75) severity = 'warning';
  return { items, peak, severity };
}

function buildTeacherUsage({ member, usage = {}, defaultLimits = {}, now = Date.now() }) {
  const limits = { ...defaultLimits, ...(member?.limits || {}) };
  const quota = quotaSnapshot(usage, limits);
  const accessEndsAt = member?.accessEndsAt;
  const expiryMs = accessEndsAt instanceof Date
    ? accessEndsAt.getTime()
    : typeof accessEndsAt?.toMillis === 'function'
      ? accessEndsAt.toMillis()
      : Date.parse(accessEndsAt || '');
  const daysToExpiry = Number.isFinite(expiryMs) ? Math.ceil((expiryMs - now) / 86400000) : null;
  const alerts = [];
  if (member?.status === 'deletion_scheduled') {
    alerts.push({ severity: 'critical', code: 'deletion_scheduled', message: 'Tenant đang chờ xóa.' });
  }
  if (quota.severity !== 'healthy') {
    alerts.push({
      severity: quota.severity,
      code: `quota_${quota.peak.limitKey}`,
      message: `${quota.peak.label} đã dùng ${Math.round(quota.peak.ratio * 100)}% hạn mức.`,
    });
  }
  if (member?.status === 'active' && daysToExpiry !== null && daysToExpiry <= 14) {
    alerts.push({
      severity: daysToExpiry < 0 ? 'critical' : 'warning',
      code: 'membership_expiry',
      message: daysToExpiry < 0 ? 'Gói giáo viên đã hết hạn.' : `Gói còn ${daysToExpiry} ngày.`,
    });
  }
  return {
    uid: member?.uid || '',
    displayName: String(member?.displayName || '').slice(0, 160),
    email: String(member?.email || '').slice(0, 320),
    status: member?.status || 'unknown',
    limits,
    usage: Object.fromEntries(QUOTA_FIELDS.map(([usageKey]) => [usageKey, finiteNumber(usage[usageKey])])),
    quota,
    daysToExpiry,
    alerts,
    updatedAt: usage.updatedAt || null,
  };
}

function costForecast({
  attemptsThisMonth = 0,
  elapsedDays = 1,
  daysInMonth = 30,
  teacherCount = 0,
  storageBytes = 0,
  model = configuredCostModel(),
}) {
  const safeElapsed = Math.max(1, Math.min(daysInMonth, finiteNumber(elapsedDays, 1)));
  const projectedAttempts = Math.ceil(finiteNumber(attemptsThisMonth) / safeElapsed * daysInMonth);
  const attemptsPerDay = projectedAttempts / Math.max(1, daysInMonth);
  const readsPerDay = attemptsPerDay * model.estimatedReadsPerAttempt
    + finiteNumber(teacherCount) * model.baselineReadsPerTeacherDay;
  const writesPerDay = attemptsPerDay * model.estimatedWritesPerAttempt
    + finiteNumber(teacherCount) * model.baselineWritesPerTeacherDay;
  const invocations = projectedAttempts * model.estimatedInvocationsPerAttempt
    + finiteNumber(teacherCount) * model.baselineInvocationsPerTeacherDay * daysInMonth;
  const billableReads = Math.max(0, readsPerDay - model.freeReadsPerDay) * daysInMonth;
  const billableWrites = Math.max(0, writesPerDay - model.freeWritesPerDay) * daysInMonth;
  const billableInvocations = Math.max(0, invocations - model.freeInvocationsPerMonth);
  const billableStorageBytes = Math.max(0, finiteNumber(storageBytes) - model.freeStorageBytes);
  const components = {
    readsVnd: Math.ceil(billableReads / 100000 * model.vndPer100kReads),
    writesVnd: Math.ceil(billableWrites / 100000 * model.vndPer100kWrites),
    invocationsVnd: Math.ceil(billableInvocations / 1000000 * model.vndPerMillionInvocations),
    storageVnd: Math.ceil(billableStorageBytes / 1073741824 * model.vndPerGiBMonth),
  };
  const projectedVnd = Object.values(components).reduce((sum, value) => sum + value, 0);
  return {
    currency: model.currency,
    attemptsThisMonth: finiteNumber(attemptsThisMonth),
    projectedAttempts,
    projectedVnd,
    components,
    projectedOperations: {
      reads: Math.ceil(readsPerDay * daysInMonth),
      writes: Math.ceil(writesPerDay * daysInMonth),
      invocations: Math.ceil(invocations),
      storageBytes: finiteNumber(storageBytes),
    },
    freeTierUtilization: {
      reads: readsPerDay / Math.max(1, model.freeReadsPerDay),
      writes: writesPerDay / Math.max(1, model.freeWritesPerDay),
      invocations: invocations / Math.max(1, model.freeInvocationsPerMonth),
      storage: finiteNumber(storageBytes) / Math.max(1, model.freeStorageBytes),
    },
    assumptions: {
      estimatedReadsPerAttempt: model.estimatedReadsPerAttempt,
      estimatedWritesPerAttempt: model.estimatedWritesPerAttempt,
      estimatedInvocationsPerAttempt: model.estimatedInvocationsPerAttempt,
      note: 'Dự báo nội bộ theo tải nghiệp vụ; hóa đơn thực tế lấy từ Google Cloud Billing.',
    },
  };
}

module.exports = {
  DEFAULT_COST_MODEL,
  QUOTA_FIELDS,
  buildTeacherUsage,
  configuredCostModel,
  costForecast,
  quotaSnapshot,
};
