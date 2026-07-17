export const TEACHER_ONBOARDING_STEPS = [
  { id: 'classroom', label: 'Tạo lớp học' },
  { id: 'release', label: 'Xuất đề Typst' },
  { id: 'assignment', label: 'Giao đợt thi' },
  { id: 'students', label: 'Duyệt học sinh' },
  { id: 'results', label: 'Xem và chấm kết quả' },
];

function count(value) {
  const number = Number(value);
  return Number.isFinite(number) && number > 0 ? number : 0;
}

export function teacherOnboardingState({
  classrooms = [],
  exams = [],
  assignments = [],
  pendingStudents = [],
  stats = {},
} = {}) {
  const activeStudents = count(stats.activeStudentMemberships ?? stats.students);
  const attempts = count(stats.attempts ?? stats.submittedAttempts);
  const completed = {
    classroom: classrooms.length > 0,
    release: exams.length > 0,
    assignment: assignments.length > 0,
    students: activeStudents > 0,
    results: attempts > 0,
  };
  const completedCount = TEACHER_ONBOARDING_STEPS.filter((step) => completed[step.id]).length;

  return {
    activeStudents,
    attempts,
    completed,
    completedCount,
    progress: Math.round((completedCount / TEACHER_ONBOARDING_STEPS.length) * 100),
    pendingStudentCount: Array.isArray(pendingStudents) ? pendingStudents.length : 0,
    nextStep: TEACHER_ONBOARDING_STEPS.find((step) => !completed[step.id])?.id || null,
  };
}

