'use strict';

const EXAM_PRODUCT_ID = 'exam';
const PAGE_SIZE = 200;
const IN_QUERY_SIZE = 30;

function validUid(uid) {
  return typeof uid === 'string' && uid.length > 0 && uid.length <= 128 && !uid.includes('/');
}

function isExamMemberPath(path, uid) {
  return validUid(uid) && path === `products/${EXAM_PRODUCT_ID}/members/${uid}`;
}

function isExamStudentClassLinkPath(path) {
  const parts = String(path || '').split('/');
  return parts.length === 4
    && parts[0] === 'examStudentClassLinks'
    && validUid(parts[1])
    && parts[2] === 'classes'
    && Boolean(parts[3]);
}

function chunks(values, size) {
  const result = [];
  for (let offset = 0; offset < values.length; offset += size) result.push(values.slice(offset, offset + size));
  return result;
}

async function deleteRefs(database, refs) {
  for (let offset = 0; offset < refs.length; offset += 400) {
    const batch = database.batch();
    refs.slice(offset, offset + 400).forEach((ref) => batch.delete(ref));
    await batch.commit();
  }
}

async function requireLease(renewLease) {
  if (renewLease && !await renewLease()) throw new Error('Deletion lease is no longer active.');
}

async function drainQuery(database, queryFactory, renewLease, beforeDelete) {
  let removed = 0;
  for (;;) {
    await requireLease(renewLease);
    const snapshot = await queryFactory().limit(PAGE_SIZE).get();
    if (snapshot.empty) return removed;
    const alreadyDeleted = beforeDelete ? await beforeDelete(snapshot.docs) === true : false;
    if (!alreadyDeleted) await deleteRefs(database, snapshot.docs.map((doc) => doc.ref));
    removed += snapshot.size;
  }
}

async function deleteByValues(database, collectionName, field, values, renewLease) {
  for (const group of chunks([...new Set(values)].filter(Boolean), IN_QUERY_SIZE)) {
    await drainQuery(
      database,
      () => database.collection(collectionName).where(field, 'in', group),
      renewLease,
    );
  }
}

async function deleteOwnedDocs(database, collectionName, teacherUid, renewLease, beforeDelete) {
  return drainQuery(
    database,
    () => database.collection(collectionName).where('teacherUid', '==', teacherUid),
    renewLease,
    beforeDelete,
  );
}

async function purgeExamMemberForDeletion({ database, targetRef, uid, renewLease }) {
  if (!database || !targetRef || !isExamMemberPath(targetRef.path, uid)) {
    throw new Error('Exam deletion target is invalid.');
  }
  const target = await targetRef.get();
  if (target.exists && target.data().status !== 'deletion_scheduled') {
    throw new Error('Exam membership is not scheduled for deletion.');
  }
  await requireLease(renewLease);

  // New records carry teacherUid for an efficient tenant purge. The related-ID
  // passes below also remove legacy records created before that denormalization.
  await deleteOwnedDocs(database, 'examAttemptMutations', uid, renewLease);
  await deleteOwnedDocs(database, 'examAttemptCounters', uid, renewLease);

  await deleteOwnedDocs(database, 'examAttempts', uid, renewLease, async (docs) => {
    const attemptIds = docs.map((doc) => doc.id);
    await deleteByValues(database, 'examAttemptMutations', 'attemptId', attemptIds, renewLease);
    await deleteByValues(database, 'examAudit', 'attemptId', attemptIds, renewLease);
  });

  await deleteOwnedDocs(database, 'examAssignments', uid, renewLease, async (docs) => {
    const assignmentIds = docs.map((doc) => doc.id);
    await deleteByValues(database, 'examAttemptCounters', 'assignmentId', assignmentIds, renewLease);
    await deleteByValues(database, 'examAudit', 'assignmentId', assignmentIds, renewLease);
  });

  // Delete private keys first. A retry can therefore never leave a public exam
  // whose answer key is still retained after the owner requested erasure.
  await deleteOwnedDocs(database, 'examAnswerKeys', uid, renewLease);
  await deleteOwnedDocs(database, 'examReleases', uid, renewLease, async (docs) => {
    const releaseIds = docs.map((doc) => doc.id);
    await deleteRefs(database, releaseIds.map((releaseId) => database.collection('examAnswerKeys').doc(releaseId)));
    await deleteByValues(database, 'examAudit', 'releaseId', releaseIds, renewLease);
  });

  const linkSnapshot = await database.collectionGroup('classes').where('teacherUid', '==', uid).get();
  const ownedLinks = linkSnapshot.docs
    .filter((doc) => isExamStudentClassLinkPath(doc.ref.path))
    .map((doc) => doc.ref);
  await deleteRefs(database, ownedLinks);

  await deleteOwnedDocs(database, 'examClassrooms', uid, renewLease, async (docs) => {
    const classIds = docs.map((doc) => doc.id);
    await deleteByValues(database, 'examAudit', 'classId', classIds, renewLease);
    // recursiveDelete removes every pending/active/rejected roster record and
    // therefore all names, emails and photos held by this teacher's tenant.
    for (const doc of docs) {
      await requireLease(renewLease);
      await database.recursiveDelete(doc.ref);
    }
    // The outer drain must not try to delete the same refs in a batch.
    return true;
  });

  await deleteOwnedDocs(database, 'examJoinCodes', uid, renewLease);
  await deleteOwnedDocs(database, 'examAudit', uid, renewLease);
  await database.collection('examTeacherUsage').doc(uid).delete();
  await requireLease(renewLease);
  await database.recursiveDelete(targetRef);
}

module.exports = {
  EXAM_PRODUCT_ID,
  isExamMemberPath,
  isExamStudentClassLinkPath,
  purgeExamMemberForDeletion,
};
