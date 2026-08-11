import { httpsCallable } from 'firebase/functions';

export function createApi(functions) {
  const cache = new Map();

  async function call(name, data = {}) {
    if (!cache.has(name)) cache.set(name, httpsCallable(functions, name));
    try {
      const response = await cache.get(name)(data);
      return response.data;
    } catch (error) {
      throw normalizeCallableError(error);
    }
  }

  return Object.freeze({
    call,
    getAccount: () => call('ctGetAccount'),
    requestTeacherAccess: (note = '') => call('ctRequestProductAccess', { productId: 'exam', note }),
    createPayment: (planId) => call('examCreatePayment', { planId }),
    getPaymentStatus: (orderCode) => call('examGetPaymentStatus', { orderCode }),
    adminBootstrap: () => call('ctAdminBootstrap'),
    adminListMembers: (filter = {}) => call('ctAdminListMembers', { productId: 'exam', pageSize: 100, ...filter }),
    adminListAudit: () => call('ctAdminListAudit'),
    adminExamStats: () => call('examAdminGetStats'),
    adminTeacherOverview: (teacherUid) => call('examAdminGetTeacherOverview', { teacherUid }),
    adminApplyMembership: (payload) => call('ctAdminApplyMembershipAction', { productId: 'exam', ...payload }),
    examBootstrap: (mode) => call('examGetBootstrap', mode ? { mode } : {}),
    createClassroom: (payload) => call('examCreateClassroom', payload),
    updateClassroomJoinSettings: (classId, joinMode) => call('examUpdateClassroomJoinSettings', { classId, joinMode }),
    joinClassroom: (code) => call('examJoinClassroom', { joinCode: code }),
    reviewStudent: (payload) => call('examReviewStudent', {
      classId: payload.classId || payload.classroomId,
      studentUid: payload.studentUid,
      decision: payload.decision || payload.action,
    }),
    listClassroomStudents: (classId, status = 'all') => call('examListClassroomStudents', {
      classId,
      status,
      pageSize: 500,
    }),
    publishRelease: (payload) => call('examPublishRelease', payload),
    getRelease: (releaseId) => call('examGetRelease', { releaseId }),
    getReleaseForEdit: (releaseId) => call('examGetReleaseForEdit', { releaseId }),
    archiveRelease: (releaseId) => call('examArchiveRelease', { releaseId }),
    createAssignment: (payload) => call('examCreateAssignment', normalizeAssignment(payload)),
    updateAssignment: (payload) => call('examUpdateAssignment', normalizeAssignment(payload, { partial: true })),
    startAttempt: (assignmentId) => call('examStartAttempt', { assignmentId }),
    getAttempt: (attemptId) => call('examGetAttempt', { attemptId }),
    reportIntegrityEvent: (attemptId, eventType) => call('examReportIntegrityEvent', { attemptId, eventType }),
    submitAttempt: (payload) => call('examSubmitAttempt', payload),
    getResult: (attemptId) => call('examGetResult', { attemptId }),
    listResults: (payload = {}) => call('examListResults', payload),
    gradeManual: (payload) => call('examGradeManual', payload),
  });
}

function normalizeAssignment(payload, { partial = false } = {}) {
  const policy = (value) => value === 'after_submit' ? 'immediate' : value;
  const normalized = { ...payload };
  const classId = payload.classId || payload.classroomId;
  const releaseId = payload.releaseId || payload.examId;
  if (classId !== undefined) normalized.classId = classId;
  if (releaseId !== undefined) normalized.releaseId = releaseId;
  if (!partial || payload.attemptLimit !== undefined || payload.maxAttempts !== undefined) {
    normalized.attemptLimit = Number(payload.attemptLimit ?? payload.maxAttempts ?? 1);
  }
  if (!partial || payload.resultRelease !== undefined || payload.scoreReleasePolicy !== undefined) {
    normalized.resultRelease = policy(payload.resultRelease || payload.scoreReleasePolicy || 'immediate');
  }
  if (!partial || payload.solutionRelease !== undefined || payload.solutionReleasePolicy !== undefined) {
    normalized.solutionRelease = policy(payload.solutionRelease || payload.solutionReleasePolicy || 'after_close');
  }
  return normalized;
}

function normalizeCallableError(error) {
  const message = error?.message?.replace(/^Firebase:\s*/i, '') || 'Không thể kết nối máy chủ.';
  const normalized = new Error(message);
  normalized.code = String(error?.code || 'unknown').replace(/^functions\//, '');
  normalized.details = error?.details || null;
  return normalized;
}
