'use strict';

const crypto = require('node:crypto');
const { HttpsError } = require('firebase-functions/v2/https');
const { ADMIN_ACTIONS, MEMBER_STATUSES, PRODUCT_IDS } = require('./constants');

function asObject(value, field = 'data') {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    throw new HttpsError('invalid-argument', `${field} phải là một object.`);
  }
  return value;
}

function asOptionalString(value, field, maxLength = 500) {
  if (value === undefined || value === null) return '';
  if (typeof value !== 'string') {
    throw new HttpsError('invalid-argument', `${field} phải là chuỗi.`);
  }
  const result = value.trim();
  if (result.length > maxLength) {
    throw new HttpsError('invalid-argument', `${field} vượt quá ${maxLength} ký tự.`);
  }
  return result;
}

function asProductId(value) {
  const productId = asOptionalString(value, 'productId', 32).toLowerCase();
  if (!PRODUCT_IDS.includes(productId)) {
    throw new HttpsError('invalid-argument', 'productId không được hỗ trợ.');
  }
  return productId;
}

function asUid(value) {
  const uid = asOptionalString(value, 'uid', 128);
  if (!uid || uid.includes('/') || /[\u0000-\u001f]/u.test(uid)) {
    throw new HttpsError('invalid-argument', 'uid không hợp lệ.');
  }
  return uid;
}

function asMutationId(value) {
  const mutationId = asOptionalString(value, 'mutationId', 128);
  if (!/^[A-Za-z0-9_-]{12,128}$/u.test(mutationId)) {
    throw new HttpsError(
      'invalid-argument',
      'mutationId phải có 12-128 ký tự chữ, số, gạch ngang hoặc gạch dưới.',
    );
  }
  return mutationId;
}

function asExpectedRevision(value) {
  if (!Number.isSafeInteger(value) || value < 0) {
    throw new HttpsError('invalid-argument', 'expectedRevision phải là số nguyên không âm.');
  }
  return value;
}

function asAdminAction(value) {
  const action = asOptionalString(value, 'action', 40).toLowerCase();
  if (!ADMIN_ACTIONS.includes(action)) {
    throw new HttpsError('invalid-argument', 'action không được hỗ trợ.');
  }
  return action;
}

function asStatusFilter(value) {
  if (value === undefined || value === null || value === '' || value === 'all') return 'all';
  const status = asOptionalString(value, 'status', 32).toLowerCase();
  if (!MEMBER_STATUSES.includes(status)) {
    throw new HttpsError('invalid-argument', 'Bộ lọc trạng thái không hợp lệ.');
  }
  return status;
}

function asPageSize(value) {
  if (value === undefined || value === null || value === '') return 50;
  if (!Number.isSafeInteger(value) || value < 1 || value > 100) {
    throw new HttpsError('invalid-argument', 'pageSize phải nằm trong khoảng 1-100.');
  }
  return value;
}

function stableValue(value) {
  if (Array.isArray(value)) return value.map(stableValue);
  if (value && typeof value === 'object') {
    return Object.keys(value)
      .sort()
      .reduce((result, key) => {
        result[key] = stableValue(value[key]);
        return result;
      }, {});
  }
  return value;
}

function requestHash(value) {
  return crypto
    .createHash('sha256')
    .update(JSON.stringify(stableValue(value)))
    .digest('hex');
}

function encodePageToken(value) {
  return Buffer.from(JSON.stringify(value), 'utf8').toString('base64url');
}

function decodePageToken(value) {
  if (!value) return null;
  const token = asOptionalString(value, 'pageToken', 1024);
  try {
    const decoded = JSON.parse(Buffer.from(token, 'base64url').toString('utf8'));
    if (!decoded || decoded.v !== 1 || typeof decoded.uid !== 'string') throw new Error('bad token');
    return decoded;
  } catch (_error) {
    throw new HttpsError('invalid-argument', 'pageToken không hợp lệ hoặc đã hết hiệu lực.');
  }
}

function normalizeSearch(value) {
  return asOptionalString(value, 'search', 120)
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/gu, '')
    .toLowerCase()
    .replace(/\s+/gu, ' ')
    .trim();
}

module.exports = {
  asAdminAction,
  asExpectedRevision,
  asMutationId,
  asObject,
  asOptionalString,
  asPageSize,
  asProductId,
  asStatusFilter,
  asUid,
  decodePageToken,
  encodePageToken,
  normalizeSearch,
  requestHash,
};
