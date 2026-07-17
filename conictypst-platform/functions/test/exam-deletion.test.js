'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  isExamMemberPath,
  isExamStudentClassLinkPath,
} = require('../lib/examDeletion');

test('exam purge path guards accept only the exact product member and reverse-link shapes', () => {
  assert.equal(isExamMemberPath('products/exam/members/teacher_1', 'teacher_1'), true);
  assert.equal(isExamMemberPath('products/omr/members/teacher_1', 'teacher_1'), false);
  assert.equal(isExamMemberPath('products/exam/members/teacher_1/archive/x', 'teacher_1'), false);
  assert.equal(isExamMemberPath('products/exam/members/teacher_2', 'teacher_1'), false);

  assert.equal(isExamStudentClassLinkPath(
    'examStudentClassLinks/student_1/classes/class_1',
  ), true);
  assert.equal(isExamStudentClassLinkPath(
    'products/omr/members/student_1/classes/class_1',
  ), false);
  assert.equal(isExamStudentClassLinkPath(
    'examStudentClassLinks/student_1/archive/classes/class_1',
  ), false);
});
