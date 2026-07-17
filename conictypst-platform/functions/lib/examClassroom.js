'use strict';

const JOIN_MODES = Object.freeze(['approval', 'auto']);

function normalizeJoinMode(value, fallback = 'approval') {
  if (value === undefined || value === null || value === '') return fallback;
  const mode = String(value).trim().toLowerCase();
  if (!JOIN_MODES.includes(mode)) {
    const error = new Error('joinMode phải là approval hoặc auto.');
    error.code = 'invalid-argument';
    throw error;
  }
  return mode;
}

function projectJoinMembership({ currentStatus = '', joinMode = 'approval', activeMemberships = 0, maxStudents = 0 }) {
  if (currentStatus === 'active' || currentStatus === 'pending') {
    return { reused: true, nextStatus: currentStatus, pendingDelta: 0, studentDelta: 0 };
  }
  if (normalizeJoinMode(joinMode) === 'auto') {
    if (Number(activeMemberships) >= Number(maxStudents)) {
      return { quotaExceeded: true, reused: false, nextStatus: '', pendingDelta: 0, studentDelta: 0 };
    }
    return { reused: false, nextStatus: 'active', pendingDelta: 0, studentDelta: 1 };
  }
  return { reused: false, nextStatus: 'pending', pendingDelta: 1, studentDelta: 0 };
}

module.exports = { JOIN_MODES, normalizeJoinMode, projectJoinMembership };
