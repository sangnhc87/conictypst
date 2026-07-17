'use strict';

function timestampMillis(value) {
  if (value instanceof Date) return value.getTime();
  if (value && typeof value.toMillis === 'function') return value.toMillis();
  if (value && typeof value.toDate === 'function') return value.toDate().getTime();
  if (typeof value === 'number' && Number.isFinite(value)) return value;
  if (typeof value === 'string') {
    const parsed = Date.parse(value);
    return Number.isFinite(parsed) ? parsed : null;
  }
  if (value && typeof value._seconds === 'number') return value._seconds * 1000;
  if (value && typeof value.seconds === 'number') return value.seconds * 1000;
  return null;
}

// A published assignment reserves one active slot until its close time. Drafts
// do not consume quota, while future published schedules do so teachers cannot
// bypass the limit by pre-scheduling an unbounded number of exams.
function consumesActiveAssignmentQuota(assignment, now = Date.now()) {
  return assignment?.status === 'published'
    && (timestampMillis(assignment.closeAt) || 0) > now;
}

function projectActiveAssignmentCount(currentCount, current, next, now = Date.now()) {
  const before = consumesActiveAssignmentQuota(current, now) ? 1 : 0;
  const after = consumesActiveAssignmentQuota(next, now) ? 1 : 0;
  return {
    before,
    after,
    delta: after - before,
    projected: Math.max(0, Number(currentCount || 0) + after - before),
  };
}

module.exports = {
  consumesActiveAssignmentQuota,
  projectActiveAssignmentCount,
  timestampMillis,
};
