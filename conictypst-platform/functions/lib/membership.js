'use strict';

const LIMIT_RULES = Object.freeze({
  storageBytes: Object.freeze({ min: 0, max: 10737418240 }),
  maxClasses: Object.freeze({ min: 0, max: 500 }),
  maxStudents: Object.freeze({ min: 0, max: 10000 }),
  maxResults: Object.freeze({ min: 0, max: 1000000 }),
  maxPublishedExams: Object.freeze({ min: 0, max: 10000 }),
  maxActiveAssignments: Object.freeze({ min: 0, max: 1000 }),
  maxAttemptsPerYear: Object.freeze({ min: 0, max: 1000000 }),
  retentionDays: Object.freeze({ min: 1, max: 365 }),
});

class MembershipActionError extends Error {
  constructor(code, message) {
    super(message);
    this.name = 'MembershipActionError';
    this.code = code;
  }
}

function fail(code, message) {
  throw new MembershipActionError(code, message);
}

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value);
}

function assertOnlyKeys(value, allowedKeys, action) {
  if (!isPlainObject(value)) fail('invalid-argument', `payload của ${action} phải là object.`);
  const extra = Object.keys(value).filter((key) => !allowedKeys.includes(key));
  if (extra.length) {
    fail('invalid-argument', `payload của ${action} chứa trường không hợp lệ: ${extra.join(', ')}.`);
  }
}

function asMillis(value) {
  if (value === undefined || value === null) return null;
  if (value instanceof Date) return value.getTime();
  if (typeof value === 'number') return Number.isFinite(value) ? value : null;
  if (typeof value === 'string') {
    const parsed = Date.parse(value);
    return Number.isFinite(parsed) ? parsed : null;
  }
  if (typeof value.toMillis === 'function') return value.toMillis();
  if (typeof value.seconds === 'number') return value.seconds * 1000;
  return null;
}

function asDate(value, field) {
  const milliseconds = asMillis(value);
  if (milliseconds === null) fail('invalid-argument', `${field} không phải thời điểm hợp lệ.`);
  const date = new Date(milliseconds);
  const year = date.getUTCFullYear();
  if (year < 2020 || year > 2100) {
    fail('invalid-argument', `${field} phải nằm trong khoảng năm 2020-2100.`);
  }
  return date;
}

function asMonths(value, field = 'months') {
  if (!Number.isSafeInteger(value) || value < 1 || value > 120) {
    fail('invalid-argument', `${field} phải là số nguyên từ 1 đến 120.`);
  }
  return value;
}

function addUtcMonthsClamped(baseValue, months) {
  const base = new Date(asMillis(baseValue));
  const day = base.getUTCDate();
  const result = new Date(base.getTime());
  result.setUTCDate(1);
  result.setUTCMonth(result.getUTCMonth() + months);
  const lastDay = new Date(Date.UTC(
    result.getUTCFullYear(),
    result.getUTCMonth() + 1,
    0,
    result.getUTCHours(),
    result.getUTCMinutes(),
    result.getUTCSeconds(),
    result.getUTCMilliseconds(),
  )).getUTCDate();
  result.setUTCDate(Math.min(day, lastDay));
  return result;
}

function sanitizeLimits(value) {
  if (!isPlainObject(value)) fail('invalid-argument', 'limits phải là object.');
  const result = {};
  for (const [key, rawValue] of Object.entries(value)) {
    if (key === 'cloudImageEnabled') {
      if (typeof rawValue !== 'boolean') {
        fail('invalid-argument', 'cloudImageEnabled phải là true hoặc false.');
      }
      result[key] = rawValue;
      continue;
    }
    const rule = LIMIT_RULES[key];
    if (!rule) fail('invalid-argument', `Quota không được hỗ trợ: ${key}.`);
    if (!Number.isSafeInteger(rawValue) || rawValue < rule.min || rawValue > rule.max) {
      fail('invalid-argument', `${key} phải là số nguyên từ ${rule.min} đến ${rule.max}.`);
    }
    result[key] = rawValue;
  }
  if (!Object.keys(result).length) fail('invalid-argument', 'limits không được để trống.');
  return result;
}

function normalizeProfile(profile, uid) {
  const raw = isPlainObject(profile) ? profile : {};
  const email = typeof raw.email === 'string' ? raw.email.trim().toLowerCase().slice(0, 320) : '';
  const displayName = typeof raw.displayName === 'string' ? raw.displayName.trim().slice(0, 160) : '';
  const photoURL = typeof raw.photoURL === 'string' ? raw.photoURL.trim().slice(0, 2048) : '';
  return { uid, email, emailLower: email, displayName, photoURL };
}

function normalizeSearchText(value) {
  return String(value || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/gu, '')
    .toLowerCase()
    .replace(/\s+/gu, ' ')
    .trim();
}

function buildSearchTokens(profile) {
  const pieces = new Set();
  const normalizedName = normalizeSearchText(profile.displayName);
  const normalizedEmail = normalizeSearchText(profile.email);
  const normalizedUid = normalizeSearchText(profile.uid);
  [normalizedName, normalizedEmail, normalizedUid].filter(Boolean).forEach((value) => pieces.add(value));
  normalizedName.split(' ').filter(Boolean).forEach((value) => pieces.add(value));

  const tokens = new Set();
  for (const piece of pieces) {
    const maxPrefix = Math.min(piece.length, 48);
    for (let length = 1; length <= maxPrefix; length += 1) tokens.add(piece.slice(0, length));
    tokens.add(piece.slice(0, 120));
  }
  return Array.from(tokens).slice(0, 400);
}

function requireExisting(current, action) {
  if (!current) fail('failed-precondition', `Không thể ${action}: giáo viên chưa có hồ sơ sản phẩm.`);
}

function requireStatus(current, statuses, action) {
  requireExisting(current, action);
  if (!statuses.includes(current.status)) {
    fail('failed-precondition', `Không thể ${action} khi trạng thái là ${current.status || 'không xác định'}.`);
  }
}

function reduceMembershipAction({
  action,
  current,
  payload = {},
  actorUid,
  now = new Date(),
  product,
  targetProfile,
}) {
  const revision = current && Number.isSafeInteger(current.revision) ? current.revision : 0;
  const basePatch = {
    revision: revision + 1,
    updatedAt: now,
    updatedBy: actorUid,
  };
  const deleteFields = [];
  let job = null;

  switch (action) {
    case 'approve': {
      assertOnlyKeys(payload, ['months', 'accessEndsAt', 'limits'], action);
      if (current && current.status !== 'pending') {
        fail('failed-precondition', `Chỉ duyệt hồ sơ mới hoặc pending, hiện tại là ${current.status}.`);
      }
      if (payload.months !== undefined && payload.accessEndsAt !== undefined) {
        fail('invalid-argument', 'Chỉ dùng months hoặc accessEndsAt, không dùng đồng thời.');
      }
      const profile = normalizeProfile(targetProfile, current?.uid || targetProfile?.uid);
      const months = payload.months === undefined ? product.defaultMonths : asMonths(payload.months);
      const accessEndsAt = payload.accessEndsAt === undefined
        ? addUtcMonthsClamped(now, months)
        : asDate(payload.accessEndsAt, 'accessEndsAt');
      if (accessEndsAt.getTime() <= now.getTime()) {
        fail('invalid-argument', 'Ngày hết hạn khi duyệt phải ở tương lai.');
      }
      const limits = payload.limits === undefined
        ? { ...product.defaultLimits }
        : sanitizeLimits(payload.limits);
      return {
        patch: {
          ...basePatch,
          ...profile,
          productId: product.id,
          status: 'active',
          accessStartsAt: current?.accessStartsAt || now,
          accessEndsAt,
          limits,
          approvedAt: now,
          approvedBy: actorUid,
          createdAt: current?.createdAt || now,
          searchTokens: buildSearchTokens(profile),
        },
        deleteFields: [
          'suspendedAt',
          'suspendedBy',
          'requestStatus',
          'requestedAt',
          'requestUpdatedAt',
          'requestNote',
          'requestSource',
          'statusBeforeRequest',
          'deleteScheduledAt',
          'deleteAfter',
          'deletionRequestedBy',
          'deletionReason',
          'statusBeforeDeletion',
        ],
        job,
      };
    }

    case 'suspend':
      assertOnlyKeys(payload, [], action);
      requireStatus(current, ['active'], action);
      return {
        patch: { ...basePatch, status: 'suspended', suspendedAt: now, suspendedBy: actorUid },
        deleteFields,
        job,
      };

    case 'resume':
      assertOnlyKeys(payload, [], action);
      requireStatus(current, ['suspended'], action);
      return {
        patch: { ...basePatch, status: 'active' },
        deleteFields: [
          'suspendedAt',
          'suspendedBy',
          'requestStatus',
          'requestedAt',
          'requestUpdatedAt',
          'requestNote',
          'requestSource',
          'statusBeforeRequest',
        ],
        job,
      };

    case 'extend': {
      assertOnlyKeys(payload, ['months'], action);
      requireStatus(current, ['active', 'suspended'], action);
      const months = asMonths(payload.months);
      const currentExpiry = asMillis(current.accessEndsAt);
      const base = Math.max(now.getTime(), currentExpiry === null ? 0 : currentExpiry);
      return {
        patch: { ...basePatch, accessEndsAt: addUtcMonthsClamped(base, months) },
        deleteFields: [
          'requestStatus',
          'requestedAt',
          'requestUpdatedAt',
          'requestNote',
          'requestSource',
          'statusBeforeRequest',
        ],
        job,
      };
    }

    case 'set_expiry':
      assertOnlyKeys(payload, ['accessEndsAt'], action);
      requireStatus(current, ['active', 'suspended'], action);
      return {
        patch: { ...basePatch, accessEndsAt: asDate(payload.accessEndsAt, 'accessEndsAt') },
        deleteFields: [
          'requestStatus',
          'requestedAt',
          'requestUpdatedAt',
          'requestNote',
          'requestSource',
          'statusBeforeRequest',
        ],
        job,
      };

    case 'update_limits': {
      assertOnlyKeys(payload, ['limits', 'replace'], action);
      requireStatus(current, ['pending', 'active', 'suspended'], action);
      if (payload.replace !== undefined && typeof payload.replace !== 'boolean') {
        fail('invalid-argument', 'replace phải là true hoặc false.');
      }
      const incomingLimits = sanitizeLimits(payload.limits);
      const limits = payload.replace === true
        ? incomingLimits
        : { ...(isPlainObject(current.limits) ? current.limits : {}), ...incomingLimits };
      // Deliberately does not read or write accessEndsAt.
      return { patch: { ...basePatch, limits }, deleteFields, job };
    }

    case 'schedule_delete': {
      assertOnlyKeys(payload, ['graceDays'], action);
      requireStatus(current, ['pending', 'active', 'suspended'], action);
      const graceDays = payload.graceDays === undefined ? 7 : payload.graceDays;
      if (!Number.isSafeInteger(graceDays) || graceDays < 0 || graceDays > 30) {
        fail('invalid-argument', 'graceDays phải là số nguyên từ 0 đến 30.');
      }
      const deleteAfter = new Date(now.getTime() + graceDays * 86400000);
      job = {
        operation: 'schedule',
        status: 'queued',
        deleteAfter,
        previousStatus: current.status,
      };
      return {
        patch: {
          ...basePatch,
          status: 'deletion_scheduled',
          statusBeforeDeletion: current.status,
          deleteScheduledAt: now,
          deleteAfter,
          deletionRequestedBy: actorUid,
        },
        deleteFields,
        job,
      };
    }

    case 'cancel_delete': {
      assertOnlyKeys(payload, [], action);
      requireStatus(current, ['deletion_scheduled'], action);
      const restoredStatus = ['pending', 'active', 'suspended'].includes(current.statusBeforeDeletion)
        ? current.statusBeforeDeletion
        : 'suspended';
      job = { operation: 'cancel', status: 'cancelled', cancelledAt: now };
      return {
        patch: { ...basePatch, status: restoredStatus },
        deleteFields: [
          'statusBeforeDeletion',
          'deleteScheduledAt',
          'deleteAfter',
          'deletionRequestedBy',
          'deletionReason',
        ],
        job,
      };
    }

    default:
      fail('invalid-argument', `Action không được hỗ trợ: ${action}.`);
  }
}

module.exports = {
  LIMIT_RULES,
  MembershipActionError,
  addUtcMonthsClamped,
  asMillis,
  buildSearchTokens,
  normalizeProfile,
  reduceMembershipAction,
  sanitizeLimits,
};
