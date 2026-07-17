'use strict';

const crypto = require('node:crypto');
const { FieldValue, getFirestore } = require('firebase-admin/firestore');
const { HttpsError, onCall } = require('firebase-functions/v2/https');
const { onSchedule } = require('firebase-functions/v2/scheduler');
const { logger } = require('firebase-functions');
const { PRODUCT_DEFINITIONS } = require('./lib/constants');
const {
  ensureBootstrapOwner,
  getPlatformAdmin,
  isVerifiedBootstrapOwner,
  normalizedAuthEmail,
  requireAuth,
  requirePlatformAdmin,
} = require('./lib/auth');
const { asMillis } = require('./lib/membership');
const { gradeResponses, roundScore } = require('./lib/examGrading');
const { buildTeacherUsage, costForecast } = require('./lib/examCostControl');
const { normalizeJoinMode, projectJoinMembership } = require('./lib/examClassroom');
const { applyAttemptPresentation, buildAttemptPresentation } = require('./lib/examShuffle');
const {
  consumesActiveAssignmentQuota,
  projectActiveAssignmentCount,
} = require('./lib/examQuota');
const {
  ExamValidationError,
  cleanJson,
  id,
  isObject,
  normalizePackage,
  normalizeResponses,
  packageHash,
  string,
} = require('./lib/examValidation');

const PRODUCT_ID = 'exam';
const CALLABLE_OPTIONS = Object.freeze({ cors: true, minInstances: 0 });
const MUTATION_TTL_MS = 30 * 86400000;
const AUDIT_TTL_MS = 365 * 86400000;
const FINAL_SUBMIT_GRACE_MS = 60 * 1000;
const JOIN_ALPHABET = '23456789ABCDEFGHJKLMNPQRSTUVWXYZ';
const RELEASE_POLICIES = Object.freeze(['immediate', 'after_close', 'manual', 'never']);

function db() {
  return getFirestore();
}

function nowIso(value) {
  const millis = asMillis(value);
  return millis === null ? null : new Date(millis).toISOString();
}

function hoChiMinhCalendar(now = new Date()) {
  const offsetMs = 7 * 60 * 60 * 1000;
  const shifted = new Date(now.getTime() + offsetMs);
  const year = shifted.getUTCFullYear();
  const month = shifted.getUTCMonth();
  const day = shifted.getUTCDate();
  const startOfDay = (dayOffset = 0) => new Date(Date.UTC(year, month, day + dayOffset) - offsetMs);
  const startOfMonth = new Date(Date.UTC(year, month, 1) - offsetMs);
  const startOfNextMonth = new Date(Date.UTC(year, month + 1, 1) - offsetMs);
  const startOfPreviousMonth = new Date(Date.UTC(year, month - 1, 1) - offsetMs);
  const daysInMonth = new Date(Date.UTC(year, month + 1, 0)).getUTCDate();
  return {
    year, month, day, daysInMonth, startOfDay, startOfMonth, startOfNextMonth, startOfPreviousMonth,
  };
}

function plain(value) {
  if (value instanceof Date) return value.toISOString();
  if (value && typeof value.toDate === 'function') return value.toDate().toISOString();
  if (Array.isArray(value)) return value.map(plain);
  if (value && typeof value === 'object') {
    return Object.fromEntries(Object.entries(value)
      .filter(([, child]) => child !== undefined)
      .map(([key, child]) => [key, plain(child)]));
  }
  return value;
}

function toHttpsError(error) {
  if (error instanceof HttpsError) return error;
  if (error instanceof ExamValidationError) return new HttpsError(error.code, error.message);
  logger.error('Unhandled Conic Exam error', {
    name: error?.name || 'Error', code: error?.code || 'unknown', message: error?.message || 'Unknown error',
  });
  return new HttpsError('internal', 'Hệ thống thi chưa thể xử lý yêu cầu. Vui lòng thử lại.');
}

function handler(fn, options = CALLABLE_OPTIONS) {
  return onCall(options, async (request) => {
    try {
      return await fn(request);
    } catch (error) {
      throw toHttpsError(error);
    }
  });
}

function dataObject(request) {
  const value = request.data || {};
  if (!isObject(value)) throw new HttpsError('invalid-argument', 'data phải là object.');
  return value;
}

function integer(value, field, min, max, fallback) {
  if (value === undefined && fallback !== undefined) return fallback;
  if (!Number.isSafeInteger(value) || value < min || value > max) {
    throw new HttpsError('invalid-argument', `${field} phải là số nguyên từ ${min} đến ${max}.`);
  }
  return value;
}

function bool(value, field, fallback = false) {
  if (value === undefined) return fallback;
  if (typeof value !== 'boolean') throw new HttpsError('invalid-argument', `${field} phải là true hoặc false.`);
  return value;
}

function classroomJoinMode(value, { input = false } = {}) {
  if (!input) return value === 'auto' ? 'auto' : 'approval';
  try {
    return normalizeJoinMode(value);
  } catch (error) {
    throw new HttpsError('invalid-argument', error.message);
  }
}

function dateValue(value, field, { required = true } = {}) {
  if ((value === undefined || value === null || value === '') && !required) return null;
  const millis = asMillis(value);
  if (millis === null || millis < Date.UTC(2020, 0, 1) || millis > Date.UTC(2100, 0, 1)) {
    throw new HttpsError('invalid-argument', `${field} không phải thời điểm hợp lệ.`);
  }
  return new Date(millis);
}

function mutationId(value) {
  const result = string(value, 'mutationId', { max: 128 });
  if (!/^[A-Za-z0-9_-]{12,128}$/u.test(result)) {
    throw new HttpsError('invalid-argument', 'mutationId phải có 12-128 ký tự chữ, số, _ hoặc -.');
  }
  return result;
}

function profile(auth) {
  return {
    uid: auth.uid,
    email: normalizedAuthEmail(auth),
    displayName: String(auth.token?.name || '').trim().slice(0, 160),
    photoURL: String(auth.token?.picture || '').trim().slice(0, 2048),
  };
}

function membershipActive(member, now = Date.now()) {
  const starts = asMillis(member?.accessStartsAt);
  const ends = asMillis(member?.accessEndsAt);
  return member?.status === 'active'
    && (starts === null || starts <= now)
    && ends !== null && ends > now;
}

function productMemberRef(uid, database = db()) {
  return database.collection('products').doc(PRODUCT_ID).collection('members').doc(uid);
}

async function teacherAccess(request) {
  const auth = requireAuth(request);
  if (isVerifiedBootstrapOwner(auth)) await ensureBootstrapOwner(auth);
  const [admin, snapshot] = await Promise.all([getPlatformAdmin(auth), productMemberRef(auth.uid).get()]);
  const member = snapshot.exists ? snapshot.data() : null;
  if (member?.status === 'deletion_scheduled' || (!admin && !membershipActive(member))) {
    throw new HttpsError('permission-denied', 'Giáo viên chưa được duyệt Conic Exam hoặc quyền 12 tháng đã hết hạn.');
  }
  return { auth, admin, member, limits: { ...PRODUCT_DEFINITIONS.exam.defaultLimits, ...(member?.limits || {}) } };
}

async function teacherEntitlementInTransaction(uid, transaction) {
  const memberRef = productMemberRef(uid);
  const adminRef = db().collection('platformAdmins').doc(uid);
  const usageRef = db().collection('examTeacherUsage').doc(uid);
  const [memberSnapshot, adminSnapshot, usageSnapshot] = await Promise.all([
    transaction.get(memberRef), transaction.get(adminRef), transaction.get(usageRef),
  ]);
  const member = memberSnapshot.exists ? memberSnapshot.data() : null;
  const admin = adminSnapshot.exists ? adminSnapshot.data() : null;
  const isAdmin = Boolean(admin?.active && ['owner', 'admin'].includes(admin.role));
  const deletionScheduled = member?.status === 'deletion_scheduled';
  return {
    active: !deletionScheduled && (membershipActive(member) || isAdmin),
    limits: { ...PRODUCT_DEFINITIONS.exam.defaultLimits, ...(member?.limits || {}) },
    periodEndMs: isAdmin ? 0 : (asMillis(member?.accessEndsAt) || 0),
    usage: usageSnapshot.exists ? usageSnapshot.data() : {},
    usageRef,
  };
}

async function requireTeacherActiveInTransaction(uid, transaction) {
  const entitlement = await teacherEntitlementInTransaction(uid, transaction);
  if (!entitlement.active) {
    throw new HttpsError('failed-precondition', 'Quyền Conic Exam của giáo viên không còn hoạt động.');
  }
  return entitlement;
}

async function requireTeacherNotDeletingInTransaction(uid, transaction) {
  const memberRef = productMemberRef(uid);
  const jobRef = db().collection('deletionJobs').doc(`${PRODUCT_ID}__${uid}`);
  const [memberSnapshot, jobSnapshot] = await Promise.all([
    transaction.get(memberRef), transaction.get(jobRef),
  ]);
  const memberDeleting = memberSnapshot.exists && memberSnapshot.data().status === 'deletion_scheduled';
  const jobStatus = jobSnapshot.exists ? jobSnapshot.data().status : '';
  if (memberDeleting || ['queued', 'processing'].includes(jobStatus)) {
    throw new HttpsError('failed-precondition', 'Dữ liệu kỳ thi đang được xóa theo yêu cầu của giáo viên.');
  }
}

function audit(transaction, action, actorUid, target = {}, details = {}) {
  const ref = db().collection('examAudit').doc();
  const now = new Date();
  transaction.create(ref, {
    productId: PRODUCT_ID,
    action,
    actorUid,
    ...target,
    details: cleanJson(details, 'audit.details'),
    createdAt: now,
    expireAt: new Date(now.getTime() + AUDIT_TTL_MS),
  });
}

function classroomView(snapshotOrData, { teacher = false } = {}) {
  const source = typeof snapshotOrData?.data === 'function' ? snapshotOrData.data() : snapshotOrData;
  const result = {
    id: source.id || snapshotOrData?.id,
    name: source.name,
    description: source.description || '',
    subject: source.subject || '',
    grade: source.grade || '',
    academicYear: source.academicYear || '',
    teacherUid: source.teacherUid,
    teacherName: source.teacherName || '',
    status: source.status || 'active',
    studentCount: source.studentCount || 0,
    pendingCount: teacher ? (source.pendingCount || 0) : undefined,
    joinMode: teacher ? classroomJoinMode(source.joinMode) : undefined,
    createdAt: source.createdAt,
    updatedAt: source.updatedAt,
  };
  if (teacher) result.joinCode = source.joinCode;
  return plain(result);
}

function releaseView(snapshotOrData, { includePackage = false } = {}) {
  const source = typeof snapshotOrData?.data === 'function' ? snapshotOrData.data() : snapshotOrData;
  return plain({
    id: source.id || snapshotOrData?.id,
    teacherUid: source.teacherUid,
    title: source.title,
    description: source.description || '',
    sourceId: source.sourceId || '',
    sourceHash: source.sourceHash || '',
    version: source.version,
    contentHash: source.contentHash,
    questionCount: source.questionCount,
    maximumScore: source.maximumScore,
    storageBytes: source.storageBytes || 0,
    status: source.status,
    publishedAt: source.publishedAt,
    archivedAt: source.archivedAt,
    publicPackage: includePackage ? source.publicPackage : undefined,
  });
}

function assignmentView(snapshotOrData) {
  const source = typeof snapshotOrData?.data === 'function' ? snapshotOrData.data() : snapshotOrData;
  return plain({
    id: source.id || snapshotOrData?.id,
    teacherUid: source.teacherUid,
    classId: source.classId,
    releaseId: source.releaseId,
    title: source.title,
    instructions: source.instructions || '',
    status: source.status,
    openAt: source.openAt,
    closeAt: source.closeAt,
    durationMinutes: source.durationMinutes,
    attemptLimit: source.attemptLimit,
    shuffleQuestions: source.shuffleQuestions === true,
    shuffleOptions: source.shuffleOptions === true,
    resultRelease: source.resultRelease,
    solutionRelease: source.solutionRelease,
    resultsReleased: source.resultsReleased === true,
    solutionsReleased: source.solutionsReleased === true,
    revision: source.revision || 1,
    startedCount: source.startedCount || 0,
    createdAt: source.createdAt,
    updatedAt: source.updatedAt,
    classroomName: source.classroomName,
    releaseTitle: source.releaseTitle,
    examTitle: source.examTitle || source.releaseTitle,
    maximumScore: source.maximumScore,
  });
}

function enrichAssignmentView(view, classroom, release) {
  return {
    ...view,
    classroomName: classroom?.name || view.classroomName || '',
    releaseTitle: release?.title || view.releaseTitle || '',
    examTitle: release?.title || view.examTitle || view.releaseTitle || '',
    maximumScore: release?.maximumScore ?? view.maximumScore ?? null,
  };
}

function attemptView(source, {
  includeResponses = true,
  includeGrade = false,
  includeGradeDetails = includeGrade,
} = {}) {
  const data = typeof source?.data === 'function' ? source.data() : source;
  return plain({
    id: data.id || source?.id,
    assignmentId: data.assignmentId,
    classId: data.classId,
    releaseId: data.releaseId,
    studentUid: data.studentUid,
    studentName: data.studentName || '',
    attemptNo: data.attemptNo,
    status: data.status,
    startedAt: data.startedAt,
    deadlineAt: data.deadlineAt,
    submittedAt: data.submittedAt,
    expiredAt: data.expiredAt,
    submissionReason: data.submissionReason,
    receiptHash: data.receiptHash,
    responseSeq: data.responseSeq || 0,
    responseRevision: data.responseSeq || 0,
    responses: includeResponses ? (data.responses || {}) : undefined,
    score: includeGrade ? data.score : undefined,
    maximumScore: includeGrade ? data.maximumScore : undefined,
    automaticScore: includeGradeDetails ? data.automaticScore : undefined,
    manualScore: includeGradeDetails ? data.manualScore : undefined,
    manualPending: includeGradeDetails ? data.manualPending : undefined,
    itemResults: includeGradeDetails ? data.itemResults : undefined,
    integrityEventCount: includeGrade ? Number(data.integrityEventCount || 0) : undefined,
    integrityEventTypes: includeGradeDetails ? (data.integrityEventTypes || {}) : undefined,
  });
}

function presentedItems(release, attempt) {
  return applyAttemptPresentation(release.publicPackage.publicItems, {
    itemOrder: attempt.itemOrder,
    optionOrders: attempt.optionOrders,
  });
}

function randomJoinCode() {
  const bytes = crypto.randomBytes(8);
  return Array.from(bytes, (byte) => JOIN_ALPHABET[byte % JOIN_ALPHABET.length]).join('');
}

function releasePolicy(value, field, fallback) {
  if (value === undefined) return fallback;
  const policy = string(value, field, { max: 32 }).toLowerCase();
  if (!RELEASE_POLICIES.includes(policy)) throw new HttpsError('invalid-argument', `${field} không hợp lệ.`);
  return policy;
}

function visibleByPolicy(assignment, kind, now = Date.now()) {
  const policy = assignment[kind === 'solution' ? 'solutionRelease' : 'resultRelease'];
  const explicitlyReleased = assignment[kind === 'solution' ? 'solutionsReleased' : 'resultsReleased'] === true;
  if (explicitlyReleased || policy === 'immediate') return true;
  if (policy === 'after_close') return now >= asMillis(assignment.closeAt);
  return false;
}

async function assertClassOwner(classId, uid) {
  const snapshot = await db().collection('examClassrooms').doc(classId).get();
  if (!snapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lớp học.');
  if (snapshot.data().teacherUid !== uid) throw new HttpsError('permission-denied', 'Bạn không quản lý lớp học này.');
  return snapshot;
}

exports.examGetBootstrap = handler(async (request) => {
  const auth = requireAuth(request);
  if (isVerifiedBootstrapOwner(auth)) await ensureBootstrapOwner(auth);
  const [admin, memberSnapshot, studentLinks] = await Promise.all([
    getPlatformAdmin(auth),
    productMemberRef(auth.uid).get(),
    db().collection('examStudentClassLinks').doc(auth.uid).collection('classes').limit(100).get(),
  ]);
  const member = memberSnapshot.exists ? memberSnapshot.data() : null;
  const canTeach = Boolean(admin) || membershipActive(member);
  let teacherClasses = [];
  let releases = [];
  let teacherAssignments = [];
  let pendingStudents = [];
  let teacherStats = null;
  if (canTeach) {
    const [classesSnapshot, releasesSnapshot, assignmentsSnapshot] = await Promise.all([
      db().collection('examClassrooms').where('teacherUid', '==', auth.uid).limit(100).get(),
      db().collection('examReleases').where('teacherUid', '==', auth.uid).limit(200).get(),
      db().collection('examAssignments').where('teacherUid', '==', auth.uid).limit(500).get(),
    ]);
    teacherClasses = classesSnapshot.docs.map((doc) => classroomView(doc, { teacher: true }));
    releases = releasesSnapshot.docs
      .filter((doc) => doc.data().status !== 'archived')
      .map((doc) => releaseView(doc));
    const teacherClassMap = new Map(classesSnapshot.docs.map((doc) => [doc.id, doc.data()]));
    const teacherReleaseMap = new Map(releasesSnapshot.docs.map((doc) => [doc.id, doc.data()]));
    teacherAssignments = assignmentsSnapshot.docs.map((doc) => enrichAssignmentView(
      assignmentView(doc), teacherClassMap.get(doc.data().classId), teacherReleaseMap.get(doc.data().releaseId),
    ));
    // Bootstrap carries a bounded pending inbox; larger tenants page each class
    // through examListClassroomStudents so the callable response stays below 1 MiB.
    const pendingClassDocs = classesSnapshot.docs.filter((doc) => Number(doc.data().pendingCount || 0) > 0).slice(0, 20);
    const pendingGroups = await Promise.all(pendingClassDocs.map((classroom) => classroom.ref
      .collection('members').where('status', '==', 'pending').limit(50).get()));
    pendingStudents = pendingGroups.flatMap((snapshot, index) => snapshot.docs.map((doc) => plain({
      classId: pendingClassDocs[index].id, studentUid: doc.id, ...doc.data(),
    })));
    const [attemptCountSnapshot, usageSnapshot] = await Promise.all([
      db().collection('examAttempts').where('teacherUid', '==', auth.uid).count().get(),
      db().collection('examTeacherUsage').doc(auth.uid).get(),
    ]);
    const usage = usageSnapshot.exists ? usageSnapshot.data() : {};
    teacherStats = {
      classrooms: classesSnapshot.size,
      releases: releasesSnapshot.size,
      assignments: assignmentsSnapshot.size,
      activeAssignments: teacherAssignments.filter((item) => consumesActiveAssignmentQuota(item)).length,
      activeStudentMemberships: Number(usage.activeStudentMemberships || 0),
      pendingStudents: pendingStudents.length,
      attempts: attemptCountSnapshot.data().count,
    };
  }
  const links = studentLinks.docs.map((doc) => plain({ classId: doc.id, ...doc.data() }));
  const activeLinks = links.filter((link) => link.status === 'active').slice(0, 30);
  const classSnapshots = activeLinks.length
    ? await db().getAll(...activeLinks.map((link) => db().collection('examClassrooms').doc(link.classId)))
    : [];
  const studentClasses = classSnapshots.filter((snapshot) => snapshot.exists).map(classroomView);
  const assignmentGroups = await Promise.all(activeLinks.map((link) => db().collection('examAssignments')
    .where('classId', '==', link.classId).limit(200).get()));
  const now = Date.now();
  const studentAssignmentDocs = assignmentGroups.flatMap((snapshot) => snapshot.docs)
    .filter((doc) => {
      const item = doc.data();
      return item.status === 'published' && asMillis(item.closeAt) >= now;
    });
  const studentReleaseIds = [...new Set(studentAssignmentDocs.map((doc) => doc.data().releaseId))];
  const studentReleaseSnapshots = studentReleaseIds.length
    ? await db().getAll(...studentReleaseIds.map((releaseId) => db().collection('examReleases').doc(releaseId)))
    : [];
  const studentReleaseMap = new Map(studentReleaseSnapshots.filter((snapshot) => snapshot.exists)
    .map((snapshot) => [snapshot.id, snapshot.data()]));
  const studentClassMap = new Map(classSnapshots.filter((snapshot) => snapshot.exists)
    .map((snapshot) => [snapshot.id, snapshot.data()]));
  const studentAssignments = studentAssignmentDocs.map((doc) => enrichAssignmentView(
    assignmentView(doc), studentClassMap.get(doc.data().classId), studentReleaseMap.get(doc.data().releaseId),
  ));
  const recentAttemptSnapshot = await db().collection('examAttempts')
    .where('studentUid', '==', auth.uid).orderBy('startedAt', 'desc').limit(100).get();
  const allAssignmentMap = new Map([
    ...teacherAssignments.map((item) => [item.id, item]),
    ...studentAssignments.map((item) => [item.id, item]),
  ]);
  const missingAttemptAssignmentIds = [...new Set(recentAttemptSnapshot.docs
    .map((doc) => doc.data().assignmentId)
    .filter((assignmentId) => !allAssignmentMap.has(assignmentId)))];
  if (missingAttemptAssignmentIds.length) {
    const missingAssignments = await db().getAll(...missingAttemptAssignmentIds
      .map((assignmentId) => db().collection('examAssignments').doc(assignmentId)));
    missingAssignments.filter((snapshot) => snapshot.exists)
      .forEach((snapshot) => allAssignmentMap.set(snapshot.id, assignmentView(snapshot)));
  }
  const recentAttempts = recentAttemptSnapshot.docs.map((doc) => {
    const assignment = allAssignmentMap.get(doc.data().assignmentId) || {};
    const scoreReleased = visibleByPolicy(assignment, 'result');
    return {
      ...attemptView(doc, { includeGrade: scoreReleased, includeGradeDetails: false }),
      assignmentTitle: assignment.title || '',
      examTitle: assignment.examTitle || assignment.releaseTitle || '',
      classroomName: assignment.classroomName || '',
      scoreReleased,
      maximumScore: scoreReleased
        ? (doc.data().maximumScore ?? assignment.maximumScore ?? null)
        : (assignment.maximumScore ?? null),
    };
  }).sort((left, right) => String(right.startedAt || '').localeCompare(String(left.startedAt || '')));

  let adminStats = null;
  if (admin) {
    const [teachers, classes, releasesCount, assignmentsCount, attempts] = await Promise.all([
      db().collection('products').doc(PRODUCT_ID).collection('members').count().get(),
      db().collection('examClassrooms').count().get(),
      db().collection('examReleases').count().get(),
      db().collection('examAssignments').count().get(),
      db().collection('examAttempts').count().get(),
    ]);
    adminStats = {
      teachers: teachers.data().count,
      classrooms: classes.data().count,
      releases: releasesCount.data().count,
      assignments: assignmentsCount.data().count,
      attempts: attempts.data().count,
    };
  }
  return {
    account: profile(auth),
    admin,
    productMembership: member ? plain({ ...member, hasAccess: membershipActive(member) }) : null,
    canTeach,
    teacher: {
      classrooms: teacherClasses, releases, assignments: teacherAssignments, pendingStudents, stats: teacherStats,
    },
    student: {
      memberships: links, classrooms: studentClasses, assignments: studentAssignments, recentAttempts,
    },
    adminStats,
    serverTime: new Date().toISOString(),
  };
});

exports.examCreateClassroom = handler(async (request) => {
  const { auth, limits } = await teacherAccess(request);
  const data = dataObject(request);
  const name = string(data.name, 'name', { max: 160 });
  const description = string(data.description, 'description', { required: false, max: 1000 });
  const subject = string(data.subject, 'subject', { required: false, max: 100 });
  const grade = string(data.grade, 'grade', { required: false, max: 40 });
  const academicYear = string(data.academicYear, 'academicYear', { required: false, max: 32 });
  const joinMode = classroomJoinMode(data.joinMode, { input: true });
  const database = db();
  const classroomRef = database.collection('examClassrooms').doc();
  const usageRef = database.collection('examTeacherUsage').doc(auth.uid);
  const teacher = profile(auth);
  for (let tries = 0; tries < 5; tries += 1) {
    const joinCode = randomJoinCode();
    const joinRef = database.collection('examJoinCodes').doc(joinCode);
    try {
      const result = await database.runTransaction(async (transaction) => {
        await requireTeacherActiveInTransaction(auth.uid, transaction);
        const [usageSnapshot, codeSnapshot] = await Promise.all([
          transaction.get(usageRef), transaction.get(joinRef),
        ]);
        if (codeSnapshot.exists) throw new HttpsError('already-exists', 'Mã lớp bị trùng.');
        const classCount = Number(usageSnapshot.data()?.classCount || 0);
        if (classCount >= limits.maxClasses) {
          throw new HttpsError('resource-exhausted', `Đã đạt hạn mức ${limits.maxClasses} lớp học.`);
        }
        const now = new Date();
        const classroom = {
          id: classroomRef.id, name, description, subject, grade, academicYear, teacherUid: auth.uid,
          teacherName: teacher.displayName, joinCode, status: 'active',
          joinMode,
          studentCount: 0, pendingCount: 0, createdAt: now, updatedAt: now,
        };
        transaction.create(classroomRef, classroom);
        transaction.create(joinRef, { classId: classroomRef.id, teacherUid: auth.uid, active: true, createdAt: now });
        transaction.set(usageRef, { classCount: classCount + 1, updatedAt: now }, { merge: true });
        audit(transaction, 'classroom.create', auth.uid, { classId: classroomRef.id, teacherUid: auth.uid });
        return classroom;
      });
      return { classroom: classroomView(result, { teacher: true }) };
    } catch (error) {
      if (error instanceof HttpsError && error.code === 'already-exists') continue;
      throw error;
    }
  }
  throw new HttpsError('aborted', 'Chưa tạo được mã lớp duy nhất; vui lòng thử lại.');
});

exports.examJoinClassroom = handler(async (request) => {
  const auth = requireAuth(request);
  const data = dataObject(request);
  const joinCode = string(data.joinCode, 'joinCode', { max: 16 }).replace(/\s+/gu, '').toUpperCase();
  if (!/^[A-Z2-9]{8}$/u.test(joinCode)) throw new HttpsError('invalid-argument', 'Mã lớp không hợp lệ.');
  const database = db();
  const codeRef = database.collection('examJoinCodes').doc(joinCode);
  const codeSnapshot = await codeRef.get();
  if (!codeSnapshot.exists || codeSnapshot.data().active !== true) throw new HttpsError('not-found', 'Mã lớp không tồn tại.');
  const classId = codeSnapshot.data().classId;
  const classroomRef = database.collection('examClassrooms').doc(classId);
  const memberRef = classroomRef.collection('members').doc(auth.uid);
  const linkRef = database.collection('examStudentClassLinks').doc(auth.uid).collection('classes').doc(classId);
  const student = profile(auth);
  const membership = await database.runTransaction(async (transaction) => {
    const entitlement = await requireTeacherActiveInTransaction(codeSnapshot.data().teacherUid, transaction);
    const [classroomSnapshot, memberSnapshot] = await Promise.all([
      transaction.get(classroomRef), transaction.get(memberRef),
    ]);
    if (!classroomSnapshot.exists || classroomSnapshot.data().status !== 'active') {
      throw new HttpsError('failed-precondition', 'Lớp học không còn hoạt động.');
    }
    const current = memberSnapshot.exists ? memberSnapshot.data() : null;
    const now = new Date();
    const classroom = classroomSnapshot.data();
    const transition = projectJoinMembership({
      currentStatus: current?.status,
      joinMode: classroomJoinMode(classroom.joinMode),
      activeMemberships: Number(entitlement.usage.activeStudentMemberships || 0),
      maxStudents: Number(entitlement.limits.maxStudents || 0),
    });
    if (transition.reused) return current;
    if (transition.quotaExceeded) {
      throw new HttpsError(
        'resource-exhausted',
        `Lớp đã đạt hạn mức ${entitlement.limits.maxStudents} lượt học sinh của giáo viên.`,
      );
    }
    const next = {
      ...student, classId, teacherUid: classroomSnapshot.data().teacherUid,
      classroomName: classroom.name || '', teacherName: classroom.teacherName || '',
      subject: classroom.subject || '', grade: classroom.grade || '',
      role: 'student', status: transition.nextStatus, requestedAt: now, updatedAt: now,
      joinedAt: transition.nextStatus === 'active' ? now : (current?.joinedAt || null),
      joinMethod: 'code', joinMode: classroomJoinMode(classroom.joinMode),
      createdAt: current?.createdAt || now,
    };
    transaction.set(memberRef, next, { merge: true });
    transaction.set(linkRef, next, { merge: true });
    transaction.update(classroomRef, {
      pendingCount: FieldValue.increment(transition.pendingDelta),
      studentCount: FieldValue.increment(transition.studentDelta),
      updatedAt: now,
    });
    if (transition.studentDelta > 0) {
      transaction.set(entitlement.usageRef, {
        activeStudentMemberships: Number(entitlement.usage.activeStudentMemberships || 0) + transition.studentDelta,
        updatedAt: now,
      }, { merge: true });
    }
    audit(transaction, transition.nextStatus === 'active' ? 'classroom.join_auto' : 'classroom.join_request', auth.uid, {
      classId, studentUid: auth.uid, teacherUid: classroom.teacherUid,
    });
    return next;
  });
  return { membership: plain(membership) };
});

exports.examUpdateClassroomJoinSettings = handler(async (request) => {
  const { auth } = await teacherAccess(request);
  const data = dataObject(request);
  const classId = id(data.classId, 'classId');
  const joinMode = classroomJoinMode(data.joinMode, { input: true });
  const classroomRef = db().collection('examClassrooms').doc(classId);
  const classroom = await db().runTransaction(async (transaction) => {
    await requireTeacherActiveInTransaction(auth.uid, transaction);
    const snapshot = await transaction.get(classroomRef);
    if (!snapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lớp học.');
    const current = snapshot.data();
    if (current.teacherUid !== auth.uid) throw new HttpsError('permission-denied', 'Bạn không quản lý lớp học này.');
    const now = new Date();
    transaction.update(classroomRef, { joinMode, updatedAt: now });
    audit(transaction, 'classroom.join_settings', auth.uid, { classId, teacherUid: auth.uid }, { joinMode });
    return { ...current, joinMode, updatedAt: now };
  });
  return { classroom: classroomView(classroom, { teacher: true }) };
});

exports.examReviewStudent = handler(async (request) => {
  const { auth, limits } = await teacherAccess(request);
  const data = dataObject(request);
  const classId = id(data.classId, 'classId');
  const studentUid = string(data.studentUid, 'studentUid', { max: 128 });
  if (studentUid.includes('/')) throw new HttpsError('invalid-argument', 'studentUid không hợp lệ.');
  const decision = string(data.decision, 'decision', { max: 16 }).toLowerCase();
  if (!['approve', 'reject', 'remove'].includes(decision)) throw new HttpsError('invalid-argument', 'decision không hợp lệ.');
  const database = db();
  const classroomRef = database.collection('examClassrooms').doc(classId);
  const memberRef = classroomRef.collection('members').doc(studentUid);
  const linkRef = database.collection('examStudentClassLinks').doc(studentUid).collection('classes').doc(classId);
  const usageRef = database.collection('examTeacherUsage').doc(auth.uid);
  const result = await database.runTransaction(async (transaction) => {
    await requireTeacherActiveInTransaction(auth.uid, transaction);
    const [classroomSnapshot, memberSnapshot, usageSnapshot] = await Promise.all([
      transaction.get(classroomRef), transaction.get(memberRef), transaction.get(usageRef),
    ]);
    if (!classroomSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lớp học.');
    if (classroomSnapshot.data().teacherUid !== auth.uid) throw new HttpsError('permission-denied', 'Bạn không quản lý lớp này.');
    if (!memberSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy yêu cầu của học sinh.');
    const current = memberSnapshot.data();
    const now = new Date();
    const activeMemberships = Number(usageSnapshot.data()?.activeStudentMemberships || 0);
    let nextStatus;
    let pendingDelta = 0;
    let studentDelta = 0;
    if (decision === 'approve') {
      if (current.status !== 'pending') throw new HttpsError('failed-precondition', 'Chỉ duyệt được yêu cầu đang chờ.');
      if (activeMemberships >= limits.maxStudents) {
        throw new HttpsError('resource-exhausted', `Đã đạt hạn mức ${limits.maxStudents} lượt học sinh trong lớp.`);
      }
      nextStatus = 'active'; pendingDelta = -1; studentDelta = 1;
    } else if (decision === 'reject') {
      if (current.status !== 'pending') throw new HttpsError('failed-precondition', 'Chỉ từ chối được yêu cầu đang chờ.');
      nextStatus = 'rejected'; pendingDelta = -1;
    } else {
      if (current.status !== 'active') throw new HttpsError('failed-precondition', 'Chỉ xóa được học sinh đang hoạt động.');
      nextStatus = 'removed'; studentDelta = -1;
    }
    const patch = { status: nextStatus, reviewedAt: now, reviewedBy: auth.uid, updatedAt: now };
    transaction.update(memberRef, patch);
    transaction.set(linkRef, patch, { merge: true });
    transaction.update(classroomRef, {
      pendingCount: FieldValue.increment(pendingDelta),
      studentCount: FieldValue.increment(studentDelta),
      updatedAt: now,
    });
    transaction.set(usageRef, {
      activeStudentMemberships: Math.max(0, activeMemberships + studentDelta), updatedAt: now,
    }, { merge: true });
    audit(transaction, `classroom.student_${decision}`, auth.uid, { classId, studentUid, teacherUid: auth.uid });
    return { ...current, ...patch };
  });
  return { membership: plain(result) };
});

exports.examListClassroomStudents = handler(async (request) => {
  const { auth } = await teacherAccess(request);
  const data = dataObject(request);
  const classId = id(data.classId, 'classId');
  const status = data.status === undefined ? 'all' : string(data.status, 'status', { max: 16 }).toLowerCase();
  if (!['all', 'pending', 'active', 'rejected', 'removed'].includes(status)) {
    throw new HttpsError('invalid-argument', 'Bộ lọc trạng thái học sinh không hợp lệ.');
  }
  const pageSize = integer(data.pageSize, 'pageSize', 1, 500, 100);
  const classroom = await assertClassOwner(classId, auth.uid);
  let query = classroom.ref.collection('members');
  if (status !== 'all') query = query.where('status', '==', status);
  const snapshot = await query.limit(pageSize).get();
  return {
    classroom: classroomView(classroom, { teacher: true }),
    status,
    items: snapshot.docs.map((doc) => plain({ classId, studentUid: doc.id, ...doc.data() })),
    pageSize,
  };
});

exports.examPublishRelease = handler(async (request) => {
  const { auth, limits } = await teacherAccess(request);
  const data = dataObject(request);
  const normalized = normalizePackage(data.examPackage || data.package || data);
  const publicStorageBytes = Buffer.byteLength(JSON.stringify(normalized.publicPackage), 'utf8');
  const privateStorageBytes = Buffer.byteLength(JSON.stringify(normalized.privatePackage), 'utf8');
  const releaseStorageBytes = publicStorageBytes + privateStorageBytes;
  const database = db();
  const releaseRef = database.collection('examReleases').doc();
  const keyRef = database.collection('examAnswerKeys').doc(releaseRef.id);
  const usageRef = database.collection('examTeacherUsage').doc(auth.uid);
  const release = await database.runTransaction(async (transaction) => {
    await requireTeacherActiveInTransaction(auth.uid, transaction);
    const usageSnapshot = await transaction.get(usageRef);
    const releaseCount = Number(usageSnapshot.data()?.releaseCount || 0);
    const storageBytesEstimated = Number(usageSnapshot.data()?.storageBytesEstimated || 0);
    const releaseLimit = Number(limits.maxPublishedExams || PRODUCT_DEFINITIONS.exam.defaultLimits.maxPublishedExams);
    if (releaseCount >= releaseLimit) {
      throw new HttpsError('resource-exhausted', `Đã đạt hạn mức ${releaseLimit} bản phát hành đề.`);
    }
    if (storageBytesEstimated + releaseStorageBytes > Number(limits.storageBytes || 0)) {
      throw new HttpsError(
        'resource-exhausted',
        'Gói đề vượt hạn mức lưu trữ. Hãy tăng quota hoặc xóa dữ liệu không còn cần thiết.',
      );
    }
    const now = new Date();
    const {
      title, description, sourceId, sourceHash, version,
    } = normalized.publicPackage;
    const publicRecord = {
      id: releaseRef.id,
      teacherUid: auth.uid,
      schemaVersion: normalized.publicPackage.schemaVersion,
      title,
      description,
      sourceId,
      sourceHash,
      version,
      publicPackage: normalized.publicPackage,
      contentHash: normalized.contentHash,
      questionCount: normalized.questionCount,
      maximumScore: normalized.maximumScore,
      storageBytes: releaseStorageBytes,
      status: 'published',
      immutable: true,
      publishedAt: now,
    };
    transaction.create(releaseRef, publicRecord);
    transaction.create(keyRef, {
      releaseId: releaseRef.id, teacherUid: auth.uid,
      contentHash: normalized.contentHash, ...normalized.privatePackage, createdAt: now,
      storageBytes: privateStorageBytes,
    });
    transaction.set(usageRef, {
      releaseCount: releaseCount + 1,
      storageBytesEstimated: storageBytesEstimated + releaseStorageBytes,
      updatedAt: now,
    }, { merge: true });
    audit(transaction, 'release.publish', auth.uid, { releaseId: releaseRef.id, teacherUid: auth.uid }, {
      contentHash: normalized.contentHash, questionCount: normalized.questionCount,
    });
    return publicRecord;
  });
  return { release: releaseView(release, { includePackage: true }) };
});

exports.examGetRelease = handler(async (request) => {
  const { auth } = await teacherAccess(request);
  const data = dataObject(request);
  const releaseId = id(data.releaseId, 'releaseId');
  const snapshot = await db().collection('examReleases').doc(releaseId).get();
  if (!snapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy bản phát hành đề.');
  if (snapshot.data().teacherUid !== auth.uid) {
    throw new HttpsError('permission-denied', 'Bạn không sở hữu bản phát hành đề này.');
  }
  // examReleases contains only the validated public package. The answer key
  // lives in examAnswerKeys and must never be read by this preview callable.
  return { release: releaseView(snapshot, { includePackage: true }) };
});

exports.examGetReleaseForEdit = handler(async (request) => {
  const { auth } = await teacherAccess(request);
  const data = dataObject(request);
  const releaseId = id(data.releaseId, 'releaseId');
  const database = db();
  const [releaseSnapshot, keySnapshot] = await database.getAll(
    database.collection('examReleases').doc(releaseId),
    database.collection('examAnswerKeys').doc(releaseId),
  );
  if (!releaseSnapshot.exists || !keySnapshot.exists) {
    throw new HttpsError('not-found', 'Không tìm thấy đủ nội dung và khóa chấm của đề.');
  }
  if (releaseSnapshot.data().teacherUid !== auth.uid || keySnapshot.data().teacherUid !== auth.uid) {
    throw new HttpsError('permission-denied', 'Bạn không sở hữu bản phát hành đề này.');
  }
  const release = releaseSnapshot.data();
  const privatePackage = keySnapshot.data();
  return {
    release: releaseView(releaseSnapshot),
    package: {
      ...plain(release.publicPackage),
      schemaVersion: 'conic-exam-package/v1',
      answerKey: plain(privatePackage.items || []),
    },
  };
});

exports.examArchiveRelease = handler(async (request) => {
  const { auth } = await teacherAccess(request);
  const data = dataObject(request);
  const releaseId = id(data.releaseId, 'releaseId');
  const database = db();
  const releaseRef = database.collection('examReleases').doc(releaseId);
  const usageRef = database.collection('examTeacherUsage').doc(auth.uid);
  const archived = await database.runTransaction(async (transaction) => {
    await requireTeacherActiveInTransaction(auth.uid, transaction);
    const [releaseSnapshot, usageSnapshot] = await Promise.all([
      transaction.get(releaseRef), transaction.get(usageRef),
    ]);
    if (!releaseSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy đề cần xóa khỏi kho.');
    const release = releaseSnapshot.data();
    if (release.teacherUid !== auth.uid) throw new HttpsError('permission-denied', 'Bạn không sở hữu đề này.');
    if (release.status === 'archived') return release;
    const now = new Date();
    const next = { ...release, status: 'archived', archivedAt: now };
    transaction.update(releaseRef, { status: 'archived', archivedAt: now });
    transaction.set(usageRef, {
      releaseCount: Math.max(0, Number(usageSnapshot.data()?.releaseCount || 0) - 1),
      updatedAt: now,
    }, { merge: true });
    audit(transaction, 'release.archive', auth.uid, { releaseId, teacherUid: auth.uid }, {
      contentHash: release.contentHash || '',
    });
    return next;
  });
  return { release: releaseView(archived) };
});

function normalizedAssignmentInput(data, defaults = {}) {
  const openAt = dateValue(data.openAt ?? defaults.openAt, 'openAt');
  const closeAt = dateValue(data.closeAt ?? defaults.closeAt, 'closeAt');
  if (closeAt <= openAt) throw new HttpsError('invalid-argument', 'closeAt phải sau openAt.');
  return {
    title: string(data.title ?? defaults.title, 'title', { max: 200 }),
    instructions: string(data.instructions ?? defaults.instructions, 'instructions', { required: false, max: 3000 }),
    openAt,
    closeAt,
    durationMinutes: integer(data.durationMinutes ?? defaults.durationMinutes, 'durationMinutes', 1, 480, 90),
    attemptLimit: integer(data.attemptLimit ?? defaults.attemptLimit, 'attemptLimit', 1, 10, 1),
    shuffleQuestions: bool(data.shuffleQuestions, 'shuffleQuestions', defaults.shuffleQuestions === true),
    shuffleOptions: bool(data.shuffleOptions, 'shuffleOptions', defaults.shuffleOptions === true),
    resultRelease: releasePolicy(data.resultRelease, 'resultRelease', defaults.resultRelease || 'immediate'),
    solutionRelease: releasePolicy(data.solutionRelease, 'solutionRelease', defaults.solutionRelease || 'after_close'),
    status: data.status === undefined ? (defaults.status || 'published') : string(data.status, 'status', { max: 16 }).toLowerCase(),
    resultsReleased: bool(data.resultsReleased, 'resultsReleased', defaults.resultsReleased === true),
    solutionsReleased: bool(data.solutionsReleased, 'solutionsReleased', defaults.solutionsReleased === true),
  };
}

function activeAssignmentsQuery(database, teacherUid, now, activeLimit) {
  return database.collection('examAssignments')
    .where('teacherUid', '==', teacherUid)
    .where('status', '==', 'published')
    .where('closeAt', '>', now)
    .limit(Math.max(1, activeLimit + 1));
}

exports.examCreateAssignment = handler(async (request) => {
  const { auth, limits } = await teacherAccess(request);
  const data = dataObject(request);
  const classId = id(data.classId, 'classId');
  const releaseId = id(data.releaseId, 'releaseId');
  const input = normalizedAssignmentInput(data);
  if (!['draft', 'published'].includes(input.status)) throw new HttpsError('invalid-argument', 'status không hợp lệ.');
  const database = db();
  const classroomRef = database.collection('examClassrooms').doc(classId);
  const releaseRef = database.collection('examReleases').doc(releaseId);
  const assignmentRef = database.collection('examAssignments').doc();
  const usageRef = database.collection('examTeacherUsage').doc(auth.uid);
  const assignment = await database.runTransaction(async (transaction) => {
    await requireTeacherActiveInTransaction(auth.uid, transaction);
    const now = new Date();
    const activeLimit = Number(limits.maxActiveAssignments
      || PRODUCT_DEFINITIONS.exam.defaultLimits.maxActiveAssignments);
    const [classroomSnapshot, releaseSnapshot, usageSnapshot, activeAssignmentsSnapshot] = await Promise.all([
      transaction.get(classroomRef), transaction.get(releaseRef), transaction.get(usageRef),
      transaction.get(activeAssignmentsQuery(database, auth.uid, now, activeLimit)),
    ]);
    if (!classroomSnapshot.exists || classroomSnapshot.data().teacherUid !== auth.uid) {
      throw new HttpsError('permission-denied', 'Bạn không quản lý lớp học này.');
    }
    if (!releaseSnapshot.exists || releaseSnapshot.data().teacherUid !== auth.uid) {
      throw new HttpsError('permission-denied', 'Bạn không sở hữu bản phát hành đề này.');
    }
    if (releaseSnapshot.data().status !== 'published') {
      throw new HttpsError('failed-precondition', 'Đề đã được xóa khỏi kho nên không thể tạo đợt thi mới.');
    }
    // The usage document is only a cache/serialization point. Recount live
    // published schedules so assignments whose closeAt has passed immediately
    // release quota without a maintenance job.
    const activeAssignmentCount = activeAssignmentsSnapshot.size;
    const countsAsActive = consumesActiveAssignmentQuota(input, now.getTime());
    if (countsAsActive && activeAssignmentCount >= activeLimit) {
      throw new HttpsError('resource-exhausted', `Đã đạt hạn mức ${activeLimit} lịch thi đang hoạt động.`);
    }
    const release = releaseSnapshot.data();
    const classroom = classroomSnapshot.data();
    const record = {
      id: assignmentRef.id, teacherUid: auth.uid, classId, releaseId,
      ...input,
      classroomName: classroom.name || '',
      releaseTitle: release.title || '',
      examTitle: release.title || '',
      maximumScore: release.maximumScore,
      revision: 1, startedCount: 0, createdAt: now, updatedAt: now,
    };
    transaction.create(assignmentRef, record);
    transaction.set(usageRef, {
      activeAssignmentCount: activeAssignmentCount + (countsAsActive ? 1 : 0), updatedAt: now,
    }, { merge: true });
    audit(transaction, 'assignment.create', auth.uid, {
      classId, releaseId, assignmentId: assignmentRef.id, teacherUid: auth.uid,
    });
    return record;
  });
  return { assignment: assignmentView(assignment) };
});

exports.examUpdateAssignment = handler(async (request) => {
  const { auth, limits } = await teacherAccess(request);
  const data = dataObject(request);
  const assignmentId = id(data.assignmentId, 'assignmentId');
  const database = db();
  const assignmentRef = database.collection('examAssignments').doc(assignmentId);
  const usageRef = database.collection('examTeacherUsage').doc(auth.uid);
  const result = await database.runTransaction(async (transaction) => {
    await requireTeacherActiveInTransaction(auth.uid, transaction);
    const snapshot = await transaction.get(assignmentRef);
    if (!snapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lịch thi.');
    const current = snapshot.data();
    if (current.teacherUid !== auth.uid) throw new HttpsError('permission-denied', 'Bạn không quản lý lịch thi này.');
    if (data.expectedRevision !== undefined && data.expectedRevision !== current.revision) {
      throw new HttpsError('aborted', 'Lịch thi đã thay đổi; vui lòng tải lại.', { currentRevision: current.revision });
    }
    const input = normalizedAssignmentInput(data, current);
    if (!['draft', 'published', 'closed', 'cancelled'].includes(input.status)) {
      throw new HttpsError('invalid-argument', 'status không hợp lệ.');
    }
    if (Number(current.startedCount || 0) > 0) {
      const timingChanged = input.openAt.getTime() !== asMillis(current.openAt)
        || input.closeAt.getTime() !== asMillis(current.closeAt)
        || input.durationMinutes !== current.durationMinutes
        || input.attemptLimit !== current.attemptLimit
        || input.shuffleQuestions !== (current.shuffleQuestions === true)
        || input.shuffleOptions !== (current.shuffleOptions === true);
      if (timingChanged) {
        throw new HttpsError(
          'failed-precondition',
          'Không thể đổi thời gian, thời lượng hoặc số lượt sau khi đã có học sinh bắt đầu thi.',
        );
      }
    }
    const now = new Date();
    const activeLimit = Number(limits.maxActiveAssignments
      || PRODUCT_DEFINITIONS.exam.defaultLimits.maxActiveAssignments);
    const [usageSnapshot, activeAssignmentsSnapshot] = await Promise.all([
      transaction.get(usageRef),
      transaction.get(activeAssignmentsQuery(database, auth.uid, now, activeLimit)),
    ]);
    const patch = { ...input, revision: (current.revision || 1) + 1, updatedAt: now };
    const projection = projectActiveAssignmentCount(
      activeAssignmentsSnapshot.size,
      current,
      { ...current, ...patch },
      now.getTime(),
    );
    if (projection.delta > 0 && projection.projected > activeLimit) {
      throw new HttpsError('resource-exhausted', `Đã đạt hạn mức ${activeLimit} lịch thi đang hoạt động.`);
    }
    transaction.update(assignmentRef, patch);
    transaction.set(usageRef, {
      activeAssignmentCount: projection.projected, updatedAt: now,
    }, { merge: true });
    audit(transaction, 'assignment.update', auth.uid, { assignmentId, teacherUid: auth.uid }, { revision: patch.revision });
    return { ...current, ...patch };
  });
  return { assignment: assignmentView(result) };
});

function counterId(assignmentId, uid) {
  return crypto.createHash('sha256').update(`${assignmentId}\u0000${uid}`).digest('hex');
}

function finalizeGrade(attempt, assignment, key, submittedAt, reason) {
  const grading = gradeResponses(key.items, attempt.responses || {}, attempt.manualGrades || {});
  return {
    ...grading,
    status: grading.manualPending ? 'manual_pending' : 'graded',
    submittedAt,
    submissionReason: reason,
    gradedAt: submittedAt,
    updatedAt: submittedAt,
  };
}

exports.examStartAttempt = handler(async (request) => {
  const auth = requireAuth(request);
  const data = dataObject(request);
  const assignmentId = id(data.assignmentId, 'assignmentId');
  const database = db();
  const assignmentRef = database.collection('examAssignments').doc(assignmentId);
  const assignmentSnapshot = await assignmentRef.get();
  if (!assignmentSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lịch thi.');
  const assignmentSeed = assignmentSnapshot.data();
  const classRef = database.collection('examClassrooms').doc(assignmentSeed.classId);
  const memberRef = classRef.collection('members').doc(auth.uid);
  const releaseRef = database.collection('examReleases').doc(assignmentSeed.releaseId);
  const keyRef = database.collection('examAnswerKeys').doc(assignmentSeed.releaseId);
  const counterRef = database.collection('examAttemptCounters').doc(counterId(assignmentId, auth.uid));
  const newAttemptRef = database.collection('examAttempts').doc();
  const result = await database.runTransaction(async (transaction) => {
    const [assignmentCurrent, memberSnapshot, releaseSnapshot, keySnapshot, counterSnapshot] = await Promise.all([
      transaction.get(assignmentRef), transaction.get(memberRef), transaction.get(releaseRef),
      transaction.get(keyRef), transaction.get(counterRef),
    ]);
    if (!assignmentCurrent.exists || assignmentCurrent.data().classId !== assignmentSeed.classId
      || assignmentCurrent.data().releaseId !== assignmentSeed.releaseId) {
      throw new HttpsError('aborted', 'Lịch thi vừa thay đổi; vui lòng thử lại.');
    }
    const assignment = assignmentCurrent.data();
    if (!memberSnapshot.exists || memberSnapshot.data().status !== 'active') {
      throw new HttpsError('permission-denied', 'Bạn chưa được giáo viên duyệt vào lớp.');
    }
    if (!releaseSnapshot.exists || !keySnapshot.exists) throw new HttpsError('failed-precondition', 'Gói đề chưa đầy đủ.');
    const entitlement = await teacherEntitlementInTransaction(assignment.teacherUid, transaction);
    if (!entitlement.active) {
      throw new HttpsError('failed-precondition', 'Quyền Conic Exam của giáo viên đã hết hạn.');
    }
    const now = new Date();
    const nowMs = now.getTime();
    if (assignment.status !== 'published') throw new HttpsError('failed-precondition', 'Lịch thi chưa được mở.');
    if (nowMs < asMillis(assignment.openAt)) throw new HttpsError('failed-precondition', 'Chưa đến giờ mở đề.');
    if (nowMs >= asMillis(assignment.closeAt)) throw new HttpsError('deadline-exceeded', 'Lịch thi đã đóng.');
    const counter = counterSnapshot.exists ? counterSnapshot.data() : {};
    if (counter.currentAttemptId) {
      const currentRef = database.collection('examAttempts').doc(counter.currentAttemptId);
      const currentSnapshot = await transaction.get(currentRef);
      if (currentSnapshot.exists && currentSnapshot.data().status === 'active') {
        const current = currentSnapshot.data();
        if (nowMs < asMillis(current.deadlineAt) + FINAL_SUBMIT_GRACE_MS) {
          return { attempt: current, release: releaseSnapshot.data(), resumed: true };
        }
        const hasLegacyResponses = Object.keys(current.responses || {}).length > 0;
        const finalPatch = hasLegacyResponses
          ? finalizeGrade(current, assignment, keySnapshot.data(), now, 'deadline')
          : {
            status: 'expired_unsubmitted',
            submissionReason: 'deadline_unsubmitted',
            expiredAt: now,
            updatedAt: now,
          };
        transaction.update(currentRef, finalPatch);
        transaction.set(counterRef, { currentAttemptId: null, updatedAt: now }, { merge: true });
        audit(transaction, hasLegacyResponses ? 'attempt.expire' : 'attempt.expire_unsubmitted', auth.uid, {
          assignmentId, attemptId: currentRef.id, teacherUid: assignment.teacherUid,
        });
        return { attempt: { ...current, ...finalPatch }, release: releaseSnapshot.data(), expired: true };
      }
    }
    const attemptCount = Number(counter.attemptCount || 0);
    if (attemptCount >= assignment.attemptLimit) throw new HttpsError('resource-exhausted', 'Bạn đã dùng hết số lượt làm bài.');
    const sameUsagePeriod = Number(entitlement.usage.attemptPeriodEndMs || 0) === entitlement.periodEndMs;
    const teacherAttemptCount = sameUsagePeriod ? Number(entitlement.usage.attemptCount || 0) : 0;
    const attemptLimit = Number(entitlement.limits.maxAttemptsPerYear || entitlement.limits.maxResults);
    if (teacherAttemptCount >= attemptLimit) {
      throw new HttpsError('resource-exhausted', `Giáo viên đã đạt hạn mức ${attemptLimit} lượt thi.`);
    }
    const deadlineAt = new Date(Math.min(
      nowMs + assignment.durationMinutes * 60000,
      asMillis(assignment.closeAt),
    ));
    const presentationSeed = packageHash({
      assignmentId,
      releaseId: assignment.releaseId,
      contentHash: releaseSnapshot.data().contentHash,
      studentUid: auth.uid,
      attemptNo: attemptCount + 1,
    });
    const presentation = buildAttemptPresentation(
      releaseSnapshot.data().publicPackage.publicItems,
      assignment,
      presentationSeed,
    );
    const attempt = {
      id: newAttemptRef.id, assignmentId, classId: assignment.classId, releaseId: assignment.releaseId,
      teacherUid: assignment.teacherUid, studentUid: auth.uid,
      studentName: profile(auth).displayName, studentEmail: profile(auth).email,
      attemptNo: attemptCount + 1, status: 'active', startedAt: now, deadlineAt,
      presentationSeed,
      itemOrder: presentation.itemOrder,
      optionOrders: presentation.optionOrders,
      responses: {}, responseSeq: 0, manualGrades: {}, createdAt: now, updatedAt: now,
      expireAt: new Date(now.getTime()
        + Number(entitlement.limits.retentionDays || 365) * 86400000),
    };
    transaction.create(newAttemptRef, attempt);
    transaction.update(assignmentRef, { startedCount: FieldValue.increment(1), updatedAt: now });
    transaction.set(counterRef, {
      assignmentId, teacherUid: assignment.teacherUid, studentUid: auth.uid, attemptCount: attemptCount + 1,
      currentAttemptId: newAttemptRef.id, updatedAt: now,
    }, { merge: true });
    transaction.set(entitlement.usageRef, {
      attemptCount: teacherAttemptCount + 1,
      attemptPeriodEndMs: entitlement.periodEndMs,
      updatedAt: now,
    }, { merge: true });
    audit(transaction, 'attempt.start', auth.uid, {
      assignmentId, attemptId: newAttemptRef.id, teacherUid: assignment.teacherUid,
    });
    return { attempt, release: releaseSnapshot.data(), resumed: false };
  });
  return {
    attemptId: result.attempt.id,
    status: result.attempt.status,
    deadlineAt: nowIso(result.attempt.deadlineAt),
    attempt: attemptView(result.attempt),
    assignment: assignmentView(assignmentSeed),
    release: releaseView(result.release),
    items: presentedItems(result.release, result.attempt),
    resumed: result.resumed === true,
    expired: result.expired === true,
    serverTime: new Date().toISOString(),
  };
});

exports.examGetAttempt = handler(async (request) => {
  const auth = requireAuth(request);
  const data = dataObject(request);
  const attemptId = id(data.attemptId, 'attemptId');
  const attemptSnapshot = await db().collection('examAttempts').doc(attemptId).get();
  if (!attemptSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lượt thi.');
  const attempt = attemptSnapshot.data();
  const owner = attempt.studentUid === auth.uid;
  const teacher = attempt.teacherUid === auth.uid;
  if (!owner && !teacher) throw new HttpsError('permission-denied', 'Bạn không được xem lượt thi này.');
  if (teacher) await teacherAccess(request);
  const [assignmentSnapshot, releaseSnapshot] = await Promise.all([
    db().collection('examAssignments').doc(attempt.assignmentId).get(),
    db().collection('examReleases').doc(attempt.releaseId).get(),
  ]);
  if (!assignmentSnapshot.exists || !releaseSnapshot.exists) throw new HttpsError('failed-precondition', 'Dữ liệu lịch thi không đầy đủ.');
  return {
    attempt: attemptView(attempt, { includeGrade: teacher }),
    assignment: assignmentView(assignmentSnapshot),
    release: releaseView(releaseSnapshot),
    items: presentedItems(releaseSnapshot.data(), attempt),
    serverTime: new Date().toISOString(),
  };
});

exports.examReportIntegrityEvent = handler(async (request) => {
  const auth = requireAuth(request);
  const data = dataObject(request);
  const attemptId = id(data.attemptId, 'attemptId');
  const eventType = string(data.eventType, 'eventType', { max: 40 }).toLowerCase();
  if (!['visibility_hidden', 'copy_attempt', 'fullscreen_exit'].includes(eventType)) {
    throw new HttpsError('invalid-argument', 'Loại cảnh báo toàn vẹn không hợp lệ.');
  }
  const database = db();
  const attemptRef = database.collection('examAttempts').doc(attemptId);
  const eventRef = attemptRef.collection('integrityEvents').doc();
  const count = await database.runTransaction(async transaction => {
    const snapshot = await transaction.get(attemptRef);
    if (!snapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lượt thi.');
    const attempt = snapshot.data();
    if (attempt.studentUid !== auth.uid) throw new HttpsError('permission-denied', 'Lượt thi không thuộc tài khoản này.');
    if (attempt.status !== 'active') return Number(attempt.integrityEventCount || 0);
    const current = Math.min(100, Number(attempt.integrityEventCount || 0));
    if (current >= 100) return current;
    const now = new Date();
    const types = { ...(attempt.integrityEventTypes || {}) };
    types[eventType] = Math.min(100, Number(types[eventType] || 0) + 1);
    transaction.set(attemptRef, {
      integrityEventCount: current + 1,
      integrityEventTypes: types,
      lastIntegrityAt: now,
      updatedAt: now,
    }, { merge: true });
    transaction.create(eventRef, {
      type: eventType,
      studentUid: auth.uid,
      createdAt: now,
      expireAt: attempt.expireAt || new Date(now.getTime() + 365 * 86400000),
    });
    return current + 1;
  });
  return { recorded: true, count };
});

exports.examSaveResponses = handler(async (request) => {
  const auth = requireAuth(request);
  const data = dataObject(request);
  const attemptId = id(data.attemptId, 'attemptId');
  const seq = integer(data.seq, 'seq', 1, 1000000000);
  const requestMutationId = mutationId(data.mutationId);
  const database = db();
  const attemptRef = database.collection('examAttempts').doc(attemptId);
  const attemptSnapshot = await attemptRef.get();
  if (!attemptSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lượt thi.');
  const releaseRef = database.collection('examReleases').doc(attemptSnapshot.data().releaseId);
  const releaseSnapshot = await releaseRef.get();
  if (!releaseSnapshot.exists) throw new HttpsError('failed-precondition', 'Không tìm thấy gói đề.');
  const validationItems = presentedItems(releaseSnapshot.data(), attemptSnapshot.data());
  let fullResponses = null;
  let changes = null;
  if (data.responses !== undefined) {
    fullResponses = normalizeResponses(data.responses, validationItems);
  } else {
    if (!Array.isArray(data.changes) || !data.changes.length || data.changes.length > 250) {
      throw new HttpsError('invalid-argument', 'changes phải có từ 1 đến 250 thay đổi.');
    }
    changes = data.changes.map((change, index) => {
      if (!isObject(change)) throw new HttpsError('invalid-argument', `changes[${index}] không hợp lệ.`);
      return { questionId: id(change.questionId, `changes[${index}].questionId`), value: change.value };
    });
    if (new Set(changes.map((change) => change.questionId)).size !== changes.length) {
      throw new HttpsError('invalid-argument', 'changes chứa questionId trùng nhau.');
    }
  }
  const hash = packageHash({ attemptId, seq, responses: fullResponses, changes });
  const mutationRef = database.collection('examAttemptMutations').doc(`${attemptId}__${requestMutationId}`);
  const result = await database.runTransaction(async (transaction) => {
    await requireTeacherNotDeletingInTransaction(attemptSnapshot.data().teacherUid, transaction);
    const [currentSnapshot, existingMutation] = await Promise.all([
      transaction.get(attemptRef), transaction.get(mutationRef),
    ]);
    if (existingMutation.exists) {
      const previous = existingMutation.data();
      if (previous.actorUid !== auth.uid || previous.requestHash !== hash) {
        throw new HttpsError('already-exists', 'mutationId đã được dùng cho nội dung khác.');
      }
      return { ...previous.result, replayed: true };
    }
    if (!currentSnapshot.exists || currentSnapshot.data().studentUid !== auth.uid) {
      throw new HttpsError('permission-denied', 'Bạn không sở hữu lượt thi này.');
    }
    const current = currentSnapshot.data();
    if (current.status !== 'active') throw new HttpsError('failed-precondition', 'Lượt thi đã kết thúc.');
    const now = new Date();
    if (now.getTime() >= asMillis(current.deadlineAt)) throw new HttpsError('deadline-exceeded', 'Đã hết thời gian làm bài.');
    if (seq <= Number(current.responseSeq || 0)) {
      throw new HttpsError('aborted', 'Bản lưu cũ hơn dữ liệu trên máy chủ.', { currentSeq: current.responseSeq || 0 });
    }
    let responses = fullResponses;
    if (changes) {
      const merged = { ...(current.responses || {}) };
      for (const change of changes) {
        if (change.value === null || change.value === undefined) delete merged[change.questionId];
        else merged[change.questionId] = change.value;
      }
      responses = normalizeResponses(merged, validationItems);
    }
    const response = {
      attemptId, seq, responseRevision: seq, savedAt: now.toISOString(), replayed: false,
    };
    transaction.update(attemptRef, { responses, responseSeq: seq, lastSavedAt: now, updatedAt: now });
    transaction.create(mutationRef, {
      attemptId, teacherUid: current.teacherUid, mutationId: requestMutationId,
      actorUid: auth.uid, requestHash: hash,
      result: response, createdAt: now, expireAt: new Date(now.getTime() + MUTATION_TTL_MS),
    });
    return response;
  });
  return result;
});

exports.examSubmitAttempt = handler(async (request) => {
  const auth = requireAuth(request);
  const data = dataObject(request);
  const attemptId = id(data.attemptId, 'attemptId');
  const requestMutationId = mutationId(data.mutationId);
  const database = db();
  const attemptRef = database.collection('examAttempts').doc(attemptId);
  const seed = await attemptRef.get();
  if (!seed.exists) throw new HttpsError('not-found', 'Không tìm thấy lượt thi.');
  const attemptSeed = seed.data();
  const assignmentRef = database.collection('examAssignments').doc(attemptSeed.assignmentId);
  const keyRef = database.collection('examAnswerKeys').doc(attemptSeed.releaseId);
  const releaseRef = database.collection('examReleases').doc(attemptSeed.releaseId);
  const counterRef = database.collection('examAttemptCounters').doc(counterId(attemptSeed.assignmentId, auth.uid));
  const releaseSnapshot = await releaseRef.get();
  if (!releaseSnapshot.exists) throw new HttpsError('failed-precondition', 'Không tìm thấy gói đề.');
  const validationItems = presentedItems(releaseSnapshot.data(), attemptSeed);
  // New clients send the complete final payload exactly once. Falling back to
  // the stored responses keeps attempts opened by the previous autosave client
  // deployable during the migration window.
  const finalResponses = data.responses === undefined
    ? normalizeResponses(attemptSeed.responses || {}, validationItems)
    : normalizeResponses(data.responses, validationItems);
  const hash = packageHash({ attemptId, action: 'submit', responses: finalResponses });
  const result = await database.runTransaction(async (transaction) => {
    await requireTeacherNotDeletingInTransaction(attemptSeed.teacherUid, transaction);
    const [attemptSnapshot, assignmentSnapshot, keySnapshot] = await Promise.all([
      transaction.get(attemptRef), transaction.get(assignmentRef), transaction.get(keyRef),
    ]);
    if (!attemptSnapshot.exists || attemptSnapshot.data().studentUid !== auth.uid) {
      throw new HttpsError('permission-denied', 'Bạn không sở hữu lượt thi này.');
    }
    const attempt = attemptSnapshot.data();
    const now = new Date();
    let completed;
    if (attempt.status !== 'active') {
      const completedHash = attempt.submissionRequestHash || packageHash({
        attemptId,
        action: 'submit',
        responses: normalizeResponses(attempt.responses || {}, validationItems),
      });
      if (completedHash !== hash) {
        throw new HttpsError('failed-precondition', 'Lượt thi đã khóa với một nội dung bài làm khác.');
      }
      completed = attempt;
    } else {
      if (!assignmentSnapshot.exists || !keySnapshot.exists) throw new HttpsError('failed-precondition', 'Dữ liệu chấm bài không đầy đủ.');
      const deadlineMs = asMillis(attempt.deadlineAt);
      if (deadlineMs === null || now.getTime() > deadlineMs + FINAL_SUBMIT_GRACE_MS) {
        throw new HttpsError('deadline-exceeded', 'Đã quá thời gian nộp bài.');
      }
      const reason = now.getTime() >= deadlineMs ? 'deadline_grace' : 'student';
      const responseSeq = Math.max(1, Number(attempt.responseSeq || 0) + 1);
      const submittedAttempt = { ...attempt, responses: finalResponses, responseSeq };
      const receiptHash = packageHash({
        attemptId,
        studentUid: attempt.studentUid,
        submittedAt: now.toISOString(),
        responseRevision: responseSeq,
        submissionHash: hash,
      });
      const patch = {
        ...finalizeGrade(submittedAttempt, assignmentSnapshot.data(), keySnapshot.data(), now, reason),
        responses: finalResponses,
        responseSeq,
        submissionMutationId: requestMutationId,
        submissionRequestHash: hash,
        receiptHash,
      };
      transaction.update(attemptRef, patch);
      transaction.set(counterRef, { currentAttemptId: null, updatedAt: now }, { merge: true });
      audit(transaction, 'attempt.submit', auth.uid, {
        assignmentId: attempt.assignmentId, attemptId, teacherUid: attempt.teacherUid,
      }, {
        reason, score: patch.score, maximumScore: patch.maximumScore,
      });
      completed = { ...attempt, ...patch };
    }
    const assignment = assignmentSnapshot.exists ? assignmentSnapshot.data() : {};
    const resultReleased = visibleByPolicy(assignment, 'result', now.getTime());
    const receiptHash = completed.receiptHash || packageHash({
      attemptId,
      studentUid: completed.studentUid,
      submittedAt: nowIso(completed.submittedAt),
      responseRevision: completed.responseSeq || 0,
      submissionHash: completed.submissionRequestHash || hash,
    });
    const response = {
      attemptId,
      status: completed.status,
      receiptHash,
      resultReleased,
      attempt: attemptView(completed, { includeGrade: resultReleased, includeGradeDetails: false }),
    };
    // Callable encoding turns an explicit `undefined` into JSON `null`. Omit
    // hidden grade fields altogether so an unreleased result has one clear,
    // non-ambiguous wire contract.
    if (resultReleased) {
      response.score = completed.score;
      response.maximumScore = completed.maximumScore;
    }
    return {
      ...response,
      replayed: attempt.status !== 'active',
    };
  });
  return { ...result, serverTime: new Date().toISOString() };
});

exports.examGetResult = handler(async (request) => {
  const auth = requireAuth(request);
  const data = dataObject(request);
  const attemptId = id(data.attemptId, 'attemptId');
  const database = db();
  const attemptSnapshot = await database.collection('examAttempts').doc(attemptId).get();
  if (!attemptSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy kết quả.');
  const attempt = attemptSnapshot.data();
  const isStudent = attempt.studentUid === auth.uid;
  const isTeacher = attempt.teacherUid === auth.uid;
  if (!isStudent && !isTeacher) throw new HttpsError('permission-denied', 'Bạn không được xem kết quả này.');
  if (isTeacher) await teacherAccess(request);
  const [assignmentSnapshot, releaseSnapshot] = await Promise.all([
    database.collection('examAssignments').doc(attempt.assignmentId).get(),
    database.collection('examReleases').doc(attempt.releaseId).get(),
  ]);
  if (!assignmentSnapshot.exists) throw new HttpsError('failed-precondition', 'Không tìm thấy lịch thi.');
  const assignment = assignmentSnapshot.data();
  // "immediate" means immediately after submission, never while a student is
  // still taking the exam. Otherwise the result endpoint becomes an answer-key
  // oracle before examSubmitAttempt establishes the completion boundary.
  const studentCompleted = attempt.status !== 'active';
  const showResult = isTeacher || (studentCompleted && visibleByPolicy(assignment, 'result'));
  const showSolutions = isTeacher || (studentCompleted && visibleByPolicy(assignment, 'solution'));
  let solutions;
  let manualRubrics;
  let privateKeyById = new Map();
  if (showSolutions || isTeacher) {
    const keySnapshot = await database.collection('examAnswerKeys').doc(attempt.releaseId).get();
    if (keySnapshot.exists) {
      const keys = keySnapshot.data().items;
      privateKeyById = new Map(keys.map((key) => [key.id, key]));
      if (showSolutions) {
        solutions = Object.fromEntries(keys.map((key) => [key.id, {
          answer: key.answer,
          acceptedAnswers: key.acceptedAnswers,
          tolerance: key.tolerance,
          solution: key.solution,
          solutionAsset: key.solutionAsset,
        }]));
      }
      if (isTeacher) manualRubrics = Object.fromEntries(keys.filter((key) => key.type === 'tl').map((key) => [key.id, key.rubric || []]));
    }
  }
  let items;
  if (showResult && releaseSnapshot.exists) {
    const publicItems = presentedItems(releaseSnapshot.data(), attempt);
    items = publicItems.map((publicItem) => {
      const detail = {
        ...publicItem,
        userAnswer: attempt.responses?.[publicItem.id] ?? null,
      };
      if (showSolutions) {
        const itemResult = attempt.itemResults?.[publicItem.id] || {};
        const privateKey = privateKeyById.get(publicItem.id);
        Object.assign(detail, {
          earnedPoints: itemResult.points ?? null,
          correct: itemResult.correct ?? null,
          feedback: itemResult.feedback,
        });
        if (privateKey) Object.assign(detail, {
          correctAnswer: privateKey.answer,
          acceptedAnswers: privateKey.acceptedAnswers,
          tolerance: privateKey.tolerance,
          solution: privateKey.solution,
          solutionAsset: privateKey.solutionAsset,
        });
      }
      return detail;
    });
  }
  const response = {
    attempt: attemptView(attempt, {
      includeGrade: showResult,
      includeGradeDetails: showSolutions,
    }),
    assignment: assignmentView(assignment),
    resultVisible: showResult,
    solutionsVisible: showSolutions,
    serverTime: new Date().toISOString(),
  };
  if (solutions !== undefined) response.solutions = solutions;
  if (items !== undefined) response.items = items;
  if (manualRubrics !== undefined) response.manualRubrics = manualRubrics;
  return response;
});

exports.examListResults = handler(async (request) => {
  const { auth } = await teacherAccess(request);
  const data = dataObject(request);
  const assignmentId = id(data.assignmentId, 'assignmentId');
  const pageSize = integer(data.pageSize, 'pageSize', 1, 200, 100);
  const assignmentSnapshot = await db().collection('examAssignments').doc(assignmentId).get();
  if (!assignmentSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy lịch thi.');
  if (assignmentSnapshot.data().teacherUid !== auth.uid) throw new HttpsError('permission-denied', 'Bạn không quản lý lịch thi này.');
  const snapshot = await db().collection('examAttempts').where('assignmentId', '==', assignmentId).limit(pageSize).get();
  const items = snapshot.docs.map((doc) => attemptView(doc, { includeGrade: true }))
    .sort((left, right) => String(right.submittedAt || right.startedAt).localeCompare(String(left.submittedAt || left.startedAt)));
  return { assignment: assignmentView(assignmentSnapshot), items, pageSize };
});

exports.examGradeManual = handler(async (request) => {
  const { auth } = await teacherAccess(request);
  const data = dataObject(request);
  const attemptId = id(data.attemptId, 'attemptId');
  const requestMutationId = mutationId(data.mutationId);
  if (!Array.isArray(data.grades) || !data.grades.length || data.grades.length > 250) {
    throw new HttpsError('invalid-argument', 'grades phải có từ 1 đến 250 mục.');
  }
  const database = db();
  const attemptRef = database.collection('examAttempts').doc(attemptId);
  const attemptSeed = await attemptRef.get();
  if (!attemptSeed.exists) throw new HttpsError('not-found', 'Không tìm thấy lượt thi.');
  const keyRef = database.collection('examAnswerKeys').doc(attemptSeed.data().releaseId);
  const mutationRef = database.collection('examAttemptMutations').doc(`${attemptId}__${requestMutationId}`);
  const cleanGrades = data.grades.map((grade, index) => {
    if (!isObject(grade)) throw new HttpsError('invalid-argument', `grades[${index}] không hợp lệ.`);
    const points = Number(grade.points);
    if (!Number.isFinite(points)) throw new HttpsError('invalid-argument', `grades[${index}].points không hợp lệ.`);
    return {
      questionId: id(grade.questionId, `grades[${index}].questionId`),
      points,
      feedback: string(grade.feedback, `grades[${index}].feedback`, { required: false, max: 2000 }),
    };
  });
  const hash = packageHash({ attemptId, grades: cleanGrades });
  const result = await database.runTransaction(async (transaction) => {
    await requireTeacherNotDeletingInTransaction(attemptSeed.data().teacherUid, transaction);
    const [attemptSnapshot, keySnapshot, existingMutation] = await Promise.all([
      transaction.get(attemptRef), transaction.get(keyRef), transaction.get(mutationRef),
    ]);
    if (existingMutation.exists) {
      const previous = existingMutation.data();
      if (previous.actorUid !== auth.uid || previous.requestHash !== hash) throw new HttpsError('already-exists', 'mutationId đã được dùng.');
      return { attempt: previous.result, replayed: true };
    }
    if (!attemptSnapshot.exists || attemptSnapshot.data().teacherUid !== auth.uid) {
      throw new HttpsError('permission-denied', 'Bạn không quản lý lượt thi này.');
    }
    const attempt = attemptSnapshot.data();
    if (attempt.status === 'active') throw new HttpsError('failed-precondition', 'Học sinh chưa nộp bài.');
    if (!keySnapshot.exists) throw new HttpsError('failed-precondition', 'Không tìm thấy rubric chấm bài.');
    const keyById = new Map(keySnapshot.data().items.map((key) => [key.id, key]));
    const manualGrades = { ...(attempt.manualGrades || {}) };
    for (const grade of cleanGrades) {
      const key = keyById.get(grade.questionId);
      if (!key || key.type !== 'tl') throw new HttpsError('invalid-argument', `${grade.questionId} không phải câu tự luận.`);
      if (grade.points < 0 || grade.points > key.points) {
        throw new HttpsError('invalid-argument', `Điểm ${grade.questionId} phải từ 0 đến ${key.points}.`);
      }
      manualGrades[grade.questionId] = { points: roundScore(grade.points), feedback: grade.feedback, gradedBy: auth.uid };
    }
    const grading = gradeResponses(keySnapshot.data().items, attempt.responses || {}, manualGrades);
    const now = new Date();
    const patch = {
      ...grading, manualGrades, status: grading.manualPending ? 'manual_pending' : 'graded',
      manuallyGradedAt: now, manuallyGradedBy: auth.uid, updatedAt: now,
    };
    transaction.update(attemptRef, patch);
    audit(transaction, 'attempt.manual_grade', auth.uid, {
      assignmentId: attempt.assignmentId, attemptId, teacherUid: auth.uid,
    }, {
      gradedQuestionIds: cleanGrades.map((grade) => grade.questionId), score: grading.score,
    });
    const response = attemptView({ ...attempt, ...patch }, { includeGrade: true });
    transaction.create(mutationRef, {
      attemptId, teacherUid: auth.uid, mutationId: requestMutationId,
      actorUid: auth.uid, requestHash: hash,
      result: response, createdAt: now, expireAt: new Date(now.getTime() + MUTATION_TTL_MS),
    });
    return { attempt: response, replayed: false };
  });
  return result;
});

exports.examAdminGetStats = handler(async (request) => {
  await requirePlatformAdmin(request, { allowBootstrap: true });
  const database = db();
  const now = new Date();
  const calendar = hoChiMinhCalendar(now);
  const memberCollection = database.collection('products').doc(PRODUCT_ID).collection('members');
  const attemptCollection = database.collection('examAttempts');
  const trendRanges = Array.from({ length: 14 }, (_, index) => {
    const offset = index - 13;
    return { start: calendar.startOfDay(offset), end: calendar.startOfDay(offset + 1) };
  });
  const [members, pending, classes, releases, assignments, attempts, memberDocs,
    attemptsThisMonth, attemptsPreviousMonth, ...trendCounts] = await Promise.all([
    memberCollection.count().get(),
    memberCollection.where('status', '==', 'pending').count().get(),
    database.collection('examClassrooms').count().get(),
    database.collection('examReleases').count().get(),
    database.collection('examAssignments').count().get(),
    attemptCollection.count().get(),
    memberCollection.orderBy('updatedAt', 'desc').limit(500).get(),
    attemptCollection.where('startedAt', '>=', calendar.startOfMonth)
      .where('startedAt', '<', calendar.startOfNextMonth).count().get(),
    attemptCollection.where('startedAt', '>=', calendar.startOfPreviousMonth)
      .where('startedAt', '<', calendar.startOfMonth).count().get(),
    ...trendRanges.map(({ start, end }) => attemptCollection
      .where('startedAt', '>=', start).where('startedAt', '<', end).count().get()),
  ]);
  const usageSnapshots = memberDocs.empty
    ? []
    : await database.getAll(...memberDocs.docs
      .map((snapshot) => database.collection('examTeacherUsage').doc(snapshot.id)));
  const usageMap = new Map(usageSnapshots
    .filter((snapshot) => snapshot.exists)
    .map((snapshot) => [snapshot.id, snapshot.data()]));
  const defaultLimits = PRODUCT_DEFINITIONS.exam.defaultLimits;
  const teacherUsage = memberDocs.docs.map((snapshot) => buildTeacherUsage({
    member: { uid: snapshot.id, ...snapshot.data() },
    usage: usageMap.get(snapshot.id) || {},
    defaultLimits,
    now: now.getTime(),
  })).sort((left, right) => right.quota.peak.ratio - left.quota.peak.ratio);
  const storageBytes = teacherUsage.reduce((sum, item) => sum + item.usage.storageBytesEstimated, 0);
  const forecast = costForecast({
    attemptsThisMonth: attemptsThisMonth.data().count,
    elapsedDays: calendar.day,
    daysInMonth: calendar.daysInMonth,
    teacherCount: members.data().count,
    storageBytes,
  });
  const alerts = teacherUsage.flatMap((item) => item.alerts.map((alert) => ({ uid: item.uid, ...alert })))
    .sort((left, right) => ({ critical: 3, danger: 2, warning: 1 }[right.severity] || 0)
      - ({ critical: 3, danger: 2, warning: 1 }[left.severity] || 0))
    .slice(0, 50);
  return {
    teachers: members.data().count,
    pendingTeachers: pending.data().count,
    classrooms: classes.data().count,
    releases: releases.data().count,
    assignments: assignments.data().count,
    attempts: attempts.data().count,
    usage: {
      attemptsThisMonth: attemptsThisMonth.data().count,
      attemptsPreviousMonth: attemptsPreviousMonth.data().count,
      storageBytesEstimated: storageBytes,
      teacherUsage,
      alerts,
      limitedToTeachers: 500,
      hasMoreTeachers: members.data().count > memberDocs.size,
    },
    trend: trendRanges.map((range, index) => ({
      date: new Date(range.start.getTime() + 7 * 60 * 60 * 1000).toISOString().slice(0, 10),
      attempts: trendCounts[index].data().count,
    })),
    costForecast: forecast,
    serverTime: now.toISOString(),
  };
});

exports.examAdminGetTeacherOverview = handler(async (request) => {
  await requirePlatformAdmin(request, { allowBootstrap: true });
  const data = dataObject(request);
  const teacherUid = string(data.teacherUid, 'teacherUid', { max: 128 });
  if (teacherUid.includes('/')) throw new HttpsError('invalid-argument', 'teacherUid không hợp lệ.');
  const database = db();
  const memberRef = productMemberRef(teacherUid, database);
  const usageRef = database.collection('examTeacherUsage').doc(teacherUid);
  const [memberSnapshot, usageSnapshot, classroomsSnapshot, releases, assignments, attempts] = await Promise.all([
    memberRef.get(),
    usageRef.get(),
    database.collection('examClassrooms').where('teacherUid', '==', teacherUid).limit(100).get(),
    database.collection('examReleases').where('teacherUid', '==', teacherUid).count().get(),
    database.collection('examAssignments').where('teacherUid', '==', teacherUid).count().get(),
    database.collection('examAttempts').where('teacherUid', '==', teacherUid).count().get(),
  ]);
  if (!memberSnapshot.exists) throw new HttpsError('not-found', 'Không tìm thấy giáo viên Conic Exam.');
  const member = memberSnapshot.data();
  const usage = usageSnapshot.exists ? usageSnapshot.data() : {};
  const classrooms = classroomsSnapshot.docs.map((snapshot) => classroomView(snapshot, { teacher: true }))
    .sort((left, right) => String(left.name || '').localeCompare(String(right.name || ''), 'vi'));
  return {
    teacher: plain({
      uid: teacherUid,
      displayName: member.displayName || '',
      email: member.email || '',
      photoURL: member.photoURL || '',
      status: member.status || 'unknown',
      accessEndsAt: member.accessEndsAt || null,
      limits: { ...PRODUCT_DEFINITIONS.exam.defaultLimits, ...(member.limits || {}) },
      usage,
    }),
    classrooms,
    totals: {
      classrooms: classrooms.length,
      students: Number(usage.activeStudentMemberships || 0),
      pendingStudents: classrooms.reduce((sum, classroom) => sum + Number(classroom.pendingCount || 0), 0),
      releases: releases.data().count,
      assignments: assignments.data().count,
      attempts: attempts.data().count,
    },
    serverTime: new Date().toISOString(),
  };
});

exports.examFinalizeExpiredAttempts = onSchedule({
  region: 'asia-southeast1',
  schedule: 'every 5 minutes',
  timeZone: 'Asia/Ho_Chi_Minh',
  memory: '256MiB',
  timeoutSeconds: 300,
  maxInstances: 1,
  retryCount: 2,
}, async () => {
  const database = db();
  const now = new Date();
  const finalSubmitCutoff = new Date(now.getTime() - FINAL_SUBMIT_GRACE_MS);
  const expired = await database.collection('examAttempts')
    .where('status', '==', 'active')
    .where('deadlineAt', '<=', finalSubmitCutoff)
    .limit(200)
    .get();
  let finalized = 0;
  // Keep transaction fan-out bounded so a busy school cannot exhaust the
  // Functions instance. Remaining attempts are picked up on the next run.
  for (let offset = 0; offset < expired.docs.length; offset += 20) {
    const group = expired.docs.slice(offset, offset + 20);
    const outcomes = await Promise.all(group.map(async (seed) => {
      const attempt = seed.data();
      const assignmentRef = database.collection('examAssignments').doc(attempt.assignmentId);
      const keyRef = database.collection('examAnswerKeys').doc(attempt.releaseId);
      const counterRef = database.collection('examAttemptCounters')
        .doc(counterId(attempt.assignmentId, attempt.studentUid));
      return database.runTransaction(async (transaction) => {
        try {
          await requireTeacherNotDeletingInTransaction(attempt.teacherUid, transaction);
        } catch (error) {
          if (error instanceof HttpsError && error.code === 'failed-precondition') return false;
          throw error;
        }
        const [attemptSnapshot, assignmentSnapshot, keySnapshot] = await Promise.all([
          transaction.get(seed.ref), transaction.get(assignmentRef), transaction.get(keyRef),
        ]);
        if (!attemptSnapshot.exists || attemptSnapshot.data().status !== 'active'
          || asMillis(attemptSnapshot.data().deadlineAt) > now.getTime()) return false;
        if (!assignmentSnapshot.exists || !keySnapshot.exists) {
          logger.error('Cannot finalize expired attempt: grading data missing', { attemptId: seed.id });
          return false;
        }
        const current = attemptSnapshot.data();
        const hasLegacyResponses = Object.keys(current.responses || {}).length > 0;
        const patch = hasLegacyResponses
          ? finalizeGrade(current, assignmentSnapshot.data(), keySnapshot.data(), now, 'deadline')
          : {
            status: 'expired_unsubmitted',
            submissionReason: 'deadline_unsubmitted',
            expiredAt: now,
            updatedAt: now,
          };
        transaction.update(seed.ref, patch);
        transaction.set(counterRef, { currentAttemptId: null, updatedAt: now }, { merge: true });
        audit(transaction, hasLegacyResponses ? 'attempt.expire' : 'attempt.expire_unsubmitted', 'system', {
          assignmentId: current.assignmentId, attemptId: seed.id,
          studentUid: current.studentUid, teacherUid: current.teacherUid,
        });
        return true;
      });
    }));
    finalized += outcomes.filter(Boolean).length;
  }
  logger.info('Conic Exam expired-attempt sweep completed', { scanned: expired.size, finalized });
});
