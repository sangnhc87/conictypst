'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const { deleteApp, initializeApp } = require('firebase-admin/app');
const { getAuth } = require('firebase-admin/auth');
const { getFirestore } = require('firebase-admin/firestore');
const { purgeExamMemberForDeletion } = require('../lib/examDeletion');
const { packageHash } = require('../lib/examValidation');

const canRun = Boolean(
  process.env.FIRESTORE_EMULATOR_HOST
  && process.env.FIREBASE_AUTH_EMULATOR_HOST,
);
const projectId = process.env.GCLOUD_PROJECT || 'conictypst-platform';
const functionHost = process.env.FUNCTIONS_EMULATOR_HOST || '127.0.0.1:5001';
const authHost = process.env.FIREBASE_AUTH_EMULATOR_HOST || '127.0.0.1:9099';
const firestoreHost = process.env.FIRESTORE_EMULATOR_HOST || '127.0.0.1:8080';

async function authRequest(path, body) {
  const response = await fetch(`http://${authHost}/identitytoolkit.googleapis.com/v1/${path}?key=fake`, {
    method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify(body),
  });
  const json = await response.json();
  if (!response.ok) throw new Error(JSON.stringify(json));
  return json;
}

async function createUser(auth, email, displayName) {
  const password = 'Emulator-only-password-123!';
  let uid;
  try {
    const created = await authRequest('accounts:signUp', { email, password, returnSecureToken: true });
    uid = created.localId;
  } catch (error) {
    if (!String(error.message).includes('EMAIL_EXISTS')) throw error;
    uid = (await auth.getUserByEmail(email)).uid;
  }
  await auth.updateUser(uid, { emailVerified: true, displayName });
  const signedIn = await authRequest('accounts:signInWithPassword', { email, password, returnSecureToken: true });
  return { uid, token: signedIn.idToken };
}

async function callable(name, token, data = {}) {
  const response = await fetch(`http://${functionHost}/${projectId}/asia-southeast1/${name}`, {
    method: 'POST',
    headers: { authorization: `Bearer ${token}`, 'content-type': 'application/json' },
    body: JSON.stringify({ data }),
  });
  const json = await response.json();
  if (!response.ok || json.error) throw new Error(`${name}: ${JSON.stringify(json.error || json)}`);
  return json.result;
}

async function firestoreGet(path, token) {
  return fetch(`http://${firestoreHost}/v1/projects/${projectId}/databases/(default)/documents/${path}`, {
    headers: { authorization: `Bearer ${token}` },
  });
}

test('commercial exam flow keeps keys private and grades on the server', { skip: !canRun }, async () => {
  const app = initializeApp({ projectId }, `exam-integration-${Date.now()}`);
  const auth = getAuth(app);
  const firestore = getFirestore(app);
  try {
    const owner = await createUser(auth, 'nguyensangnhc@gmail.com', 'Owner');
    const teacher = await createUser(auth, `teacher-${Date.now()}@example.com`, 'Teacher');
    const student = await createUser(auth, `student-${Date.now()}@example.com`, 'Student');

    await callable('ctGetAccount', owner.token);
    const requested = await callable('ctRequestProductAccess', teacher.token, { productId: 'exam' });
    assert.equal(requested.member.status, 'pending');
    const approved = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: `approve-exam-${Date.now()}`,
      productId: 'exam',
      uid: teacher.uid,
      action: 'approve',
      expectedRevision: requested.member.revision,
      payload: { months: 12 },
    });
    const limited = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: `limit-exam-${Date.now()}`,
      productId: 'exam',
      uid: teacher.uid,
      action: 'update_limits',
      expectedRevision: approved.member.revision,
      payload: { limits: { maxActiveAssignments: 1 } },
    });

    const createdClass = await callable('examCreateClassroom', teacher.token, {
      name: '12A1', subject: 'Toán', grade: '12', academicYear: '2026-2027',
    });
    const classroom = createdClass.classroom;
    assert.equal(classroom.name, '12A1');
    assert.equal(classroom.subject, 'Toán');
    assert.equal(classroom.grade, '12');
    assert.equal(classroom.academicYear, '2026-2027');
    assert.equal(classroom.joinCode.length, 8);
    const joined = await callable('examJoinClassroom', student.token, { joinCode: classroom.joinCode });
    assert.equal(joined.membership.status, 'pending');
    assert.equal(joined.membership.classroomName, '12A1');
    assert.equal(joined.membership.teacherName, 'Teacher');
    assert.equal(joined.membership.subject, 'Toán');
    assert.equal(joined.membership.grade, '12');
    await callable('examReviewStudent', teacher.token, {
      classId: classroom.id, studentUid: student.uid, decision: 'approve',
    });

    const published = await callable('examPublishRelease', teacher.token, {
      examPackage: {
        title: 'Đề tích hợp',
        version: '1',
        publicItems: [{
          id: 'tn-1', type: 'tn', questionText: '1 + 1 bằng bao nhiêu?',
          options: [{ id: 'A', text: '2' }, { id: 'B', text: '3' }],
        }],
        answerKey: [{ id: 'tn-1', type: 'tn', answer: 'A', points: 0.25, solution: '1 + 1 = 2' }],
      },
    });
    assert.equal(JSON.stringify(published).includes('1 + 1 = 2'), false);
    assert.equal((await firestoreGet(`examAnswerKeys/${published.release.id}`, teacher.token)).status, 403);
    assert.equal((await firestoreGet(`examAnswerKeys/${published.release.id}`, student.token)).status, 403);

    const preview = await callable('examGetRelease', teacher.token, { releaseId: published.release.id });
    assert.equal(preview.release.id, published.release.id);
    assert.equal(preview.release.teacherUid, teacher.uid);
    assert.equal(preview.release.publicPackage.publicItems[0].questionText, '1 + 1 bằng bao nhiêu?');
    assert.equal(JSON.stringify(preview).includes('1 + 1 = 2'), false);
    assert.equal(Object.hasOwn(preview.release, 'answerKey'), false);
    await assert.rejects(
      () => callable('examGetRelease', student.token, { releaseId: published.release.id }),
      /PERMISSION_DENIED|permission-denied/u,
    );
    // A platform admin may use their own teacher tenant, but cannot cross the
    // release owner boundary to inspect another teacher's package.
    await assert.rejects(
      () => callable('examGetRelease', owner.token, { releaseId: published.release.id }),
      /PERMISSION_DENIED|permission-denied/u,
    );

    const now = Date.now();
    // A historical published schedule must not consume the one active slot.
    await callable('examCreateAssignment', teacher.token, {
      classId: classroom.id,
      releaseId: published.release.id,
      title: 'Lịch thi đã kết thúc',
      openAt: new Date(now - 7200000).toISOString(),
      closeAt: new Date(now - 3600000).toISOString(),
      status: 'published',
    });
    const createdAssignment = await callable('examCreateAssignment', teacher.token, {
      classId: classroom.id,
      releaseId: published.release.id,
      title: 'Kiểm tra tích hợp',
      openAt: new Date(now - 60000).toISOString(),
      closeAt: new Date(now + 3600000).toISOString(),
      durationMinutes: 30,
      attemptLimit: 1,
      shuffleQuestions: true,
      shuffleOptions: true,
      resultRelease: 'immediate',
      solutionRelease: 'immediate',
    });

    const started = await callable('examStartAttempt', student.token, {
      assignmentId: createdAssignment.assignment.id,
    });
    assert.equal(started.resumed, false);
    assert.equal(started.items.length, 1);
    assert.equal(JSON.stringify(started).includes('answer'), false);
    const activeResult = await callable('examGetResult', student.token, { attemptId: started.attemptId });
    assert.equal(activeResult.resultVisible, false);
    assert.equal(activeResult.solutionsVisible, false);
    assert.equal(activeResult.items, undefined);
    assert.equal(activeResult.solutions, undefined);
    assert.equal(activeResult.attempt.score, undefined);
    const resumedPayload = await callable('examGetAttempt', student.token, { attemptId: started.attemptId });
    assert.deepEqual(resumedPayload.items, started.items);
    assert.deepEqual(resumedPayload.attempt.responses, {});
    const manualReleaseAssignment = await callable('examUpdateAssignment', teacher.token, {
      assignmentId: createdAssignment.assignment.id,
      expectedRevision: createdAssignment.assignment.revision,
      resultRelease: 'manual',
      solutionRelease: 'manual',
    });
    const suspended = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: `suspend-exam-${Date.now()}`,
      productId: 'exam', uid: teacher.uid, action: 'suspend',
      expectedRevision: limited.member.revision, payload: {},
    });
    await assert.rejects(
      () => callable('examGetRelease', teacher.token, { releaseId: published.release.id }),
      /PERMISSION_DENIED|permission-denied/u,
    );
    const submitMutationId = `submit-exam-${Date.now()}`;
    const submitted = await callable('examSubmitAttempt', student.token, {
      attemptId: started.attemptId,
      mutationId: submitMutationId,
      responses: { 'tn-1': 'A' },
    });
    assert.equal(submitted.status, 'graded');
    assert.equal(submitted.attempt.responseRevision, 1);
    assert.equal(submitted.resultReleased, false);
    assert.equal(submitted.score, undefined);
    assert.equal(submitted.maximumScore, undefined);
    assert.equal(submitted.attempt.itemResults, undefined);
    assert.equal(submitted.attempt.automaticScore, undefined);
    assert.match(submitted.receiptHash, /^[a-f0-9]{64}$/u);
    const replayedSubmit = await callable('examSubmitAttempt', student.token, {
      attemptId: started.attemptId,
      mutationId: submitMutationId,
      responses: { 'tn-1': 'A' },
    });
    assert.equal(replayedSubmit.replayed, true);
    assert.equal(replayedSubmit.receiptHash, submitted.receiptHash);
    await assert.rejects(
      () => callable('examSubmitAttempt', student.token, {
        attemptId: started.attemptId,
        mutationId: submitMutationId,
        responses: { 'tn-1': 'B' },
      }),
      /FAILED_PRECONDITION|failed-precondition/u,
    );
    // A public SHA-256 receipt must not contain the hidden score, otherwise a
    // student can brute-force the tiny finite score space.
    assert.notEqual(submitted.receiptHash, packageHash({
      attemptId: started.attemptId,
      studentUid: student.uid,
      submittedAt: submitted.attempt.submittedAt,
      responseRevision: submitted.attempt.responseRevision,
      score: 0.25,
    }));
    const resumedMembership = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: `resume-exam-${Date.now()}`,
      productId: 'exam', uid: teacher.uid, action: 'resume',
      expectedRevision: suspended.member.revision, payload: {},
    });

    const resultReleasedAssignment = await callable('examUpdateAssignment', teacher.token, {
      assignmentId: createdAssignment.assignment.id,
      expectedRevision: manualReleaseAssignment.assignment.revision,
      resultsReleased: true,
    });

    const result = await callable('examGetResult', student.token, { attemptId: started.attemptId });
    assert.equal(result.resultVisible, true);
    assert.equal(result.solutionsVisible, false);
    assert.equal(result.attempt.score, 0.25);
    assert.equal(result.attempt.itemResults, undefined);
    assert.equal(result.attempt.automaticScore, undefined);
    assert.equal(result.items[0].userAnswer, 'A');
    ['earnedPoints', 'correct', 'feedback', 'correctAnswer', 'acceptedAnswers', 'tolerance', 'solution']
      .forEach((field) => assert.equal(Object.hasOwn(result.items[0], field), false, `${field} must stay private`));
    assert.equal(JSON.stringify(result).includes('1 + 1 = 2'), false);
    const studentBootstrap = await callable('examGetBootstrap', student.token);
    assert.equal(studentBootstrap.student.recentAttempts[0].id, started.attemptId);
    assert.equal(studentBootstrap.student.recentAttempts[0].assignmentTitle, 'Kiểm tra tích hợp');
    assert.equal(studentBootstrap.student.recentAttempts[0].examTitle, 'Đề tích hợp');
    assert.equal(studentBootstrap.student.recentAttempts[0].classroomName, '12A1');
    assert.equal(studentBootstrap.student.recentAttempts[0].scoreReleased, true);
    assert.equal(studentBootstrap.student.recentAttempts[0].maximumScore, 0.25);
    assert.equal(studentBootstrap.student.recentAttempts[0].itemResults, undefined);
    assert.equal(studentBootstrap.student.assignments[0].classroomName, '12A1');
    assert.equal(studentBootstrap.student.assignments[0].examTitle, 'Đề tích hợp');
    assert.equal(studentBootstrap.student.assignments[0].maximumScore, 0.25);
    const teacherResults = await callable('examListResults', teacher.token, {
      assignmentId: createdAssignment.assignment.id,
    });
    assert.equal(teacherResults.items.length, 1);
    assert.equal(teacherResults.items[0].score, 0.25);

    await callable('examUpdateAssignment', teacher.token, {
      assignmentId: createdAssignment.assignment.id,
      expectedRevision: resultReleasedAssignment.assignment.revision,
      solutionsReleased: true,
    });
    const releasedResult = await callable('examGetResult', student.token, { attemptId: started.attemptId });
    assert.equal(releasedResult.solutionsVisible, true);
    assert.equal(releasedResult.items[0].earnedPoints, 0.25);
    assert.equal(releasedResult.items[0].correct, true);
    assert.equal(releasedResult.items[0].correctAnswer, 'A');
    assert.equal(releasedResult.items[0].solution, '1 + 1 = 2');

    // Product erasure removes only this teacher's Exam tenant. Auth, users and
    // an unrelated OMR tenant must remain intact.
    const omrSentinel = firestore.collection('products').doc('omr').collection('members').doc(teacher.uid);
    await omrSentinel.set({ status: 'active', sentinel: true });
    const scheduled = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: `delete-exam-${Date.now()}`,
      productId: 'exam',
      uid: teacher.uid,
      action: 'schedule_delete',
      expectedRevision: resumedMembership.member.revision,
      payload: { graceDays: 0 },
      reason: 'exam integration erasure',
    });
    assert.equal(scheduled.member.status, 'deletion_scheduled');
    const examMemberRef = firestore.collection('products').doc('exam').collection('members').doc(teacher.uid);
    await purgeExamMemberForDeletion({
      database: firestore,
      targetRef: examMemberRef,
      uid: teacher.uid,
      renewLease: async () => true,
    });
    assert.equal((await examMemberRef.get()).exists, false);
    assert.equal((await omrSentinel.get()).data().sentinel, true);
    assert.equal((await firestore.collection('examClassrooms').doc(classroom.id).get()).exists, false);
    assert.equal((await firestore.collection('examReleases').doc(published.release.id).get()).exists, false);
    assert.equal((await firestore.collection('examAnswerKeys').doc(published.release.id).get()).exists, false);
    assert.equal((await firestore.collection('examAssignments').doc(createdAssignment.assignment.id).get()).exists, false);
    assert.equal((await firestore.collection('examAttempts').doc(started.attemptId).get()).exists, false);
    assert.equal((await firestore.collection('examStudentClassLinks').doc(student.uid)
      .collection('classes').doc(classroom.id).get()).exists, false);
    assert.equal((await firestore.collection('examTeacherUsage').doc(teacher.uid).get()).exists, false);
    assert.equal((await firestore.collection('examAttemptMutations')
      .where('attemptId', '==', started.attemptId).get()).empty, true);
    assert.equal((await firestore.collection('examAttemptCounters')
      .where('assignmentId', '==', createdAssignment.assignment.id).get()).empty, true);
    assert.equal((await auth.getUser(teacher.uid)).uid, teacher.uid);
  } finally {
    await deleteApp(app);
  }
});
