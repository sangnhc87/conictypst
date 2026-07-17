import test from 'node:test';
import assert from 'node:assert/strict';
import { TEACHER_ONBOARDING_STEPS, teacherOnboardingState } from '../src/lib/onboarding.js';

test('onboarding starts with the classroom step and zero progress', () => {
  const state = teacherOnboardingState();
  assert.equal(TEACHER_ONBOARDING_STEPS.length, 5);
  assert.equal(state.completedCount, 0);
  assert.equal(state.progress, 0);
  assert.equal(state.nextStep, 'classroom');
  assert.deepEqual(state.completed, {
    classroom: false,
    release: false,
    assignment: false,
    students: false,
    results: false,
  });
});

test('onboarding derives live completion and pending approvals', () => {
  const state = teacherOnboardingState({
    classrooms: [{ id: 'class-1' }],
    exams: [{ id: 'release-1' }],
    assignments: [{ id: 'assignment-1' }],
    pendingStudents: [{ studentUid: 'student-1' }, { studentUid: 'student-2' }],
    stats: { activeStudentMemberships: 0, attempts: 0 },
  });
  assert.equal(state.completedCount, 3);
  assert.equal(state.progress, 60);
  assert.equal(state.nextStep, 'students');
  assert.equal(state.pendingStudentCount, 2);
});

test('onboarding reaches completion from active students and attempts', () => {
  const state = teacherOnboardingState({
    classrooms: [{}],
    exams: [{}],
    assignments: [{}],
    stats: { students: '12', submittedAttempts: '34' },
  });
  assert.equal(state.completedCount, 5);
  assert.equal(state.progress, 100);
  assert.equal(state.nextStep, null);
  assert.equal(state.activeStudents, 12);
  assert.equal(state.attempts, 34);
});

