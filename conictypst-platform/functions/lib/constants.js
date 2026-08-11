'use strict';

const PRODUCT_DEFINITIONS = Object.freeze({
  omr: Object.freeze({
    id: 'omr',
    name: 'Chấm thi ConicTypst',
    description: 'Chấm phiếu OMR, đồng bộ kết quả và tệp bài làm.',
    active: true,
    accessMode: 'approval',
    defaultMonths: 12,
    defaultLimits: Object.freeze({
      storageBytes: 0,
      cloudImageEnabled: false,
      maxClasses: 10,
      maxStudents: 500,
      maxResults: 12000,
      retentionDays: 365,
    }),
  }),
  hub: Object.freeze({
    id: 'hub',
    name: 'ConicTypst Hub',
    description: 'Không gian trung tâm của hệ sinh thái ConicTypst.',
    active: true,
    accessMode: 'public',
    defaultMonths: 12,
    defaultLimits: Object.freeze({
      storageBytes: 104857600,
      maxClasses: 10,
      maxStudents: 500,
      retentionDays: 365,
    }),
  }),
  hdsd: Object.freeze({
    id: 'hdsd',
    name: 'Hướng dẫn ConicTypst',
    description: 'Tài liệu, ví dụ và công cụ hướng dẫn sử dụng.',
    active: true,
    // Tài liệu package: email Google đã xác minh đăng nhập là được dùng ngay.
    accessMode: 'authenticated',
    defaultMonths: 12,
    defaultLimits: Object.freeze({
      storageBytes: 0,
      maxClasses: 10,
      maxStudents: 500,
      retentionDays: 365,
    }),
  }),
  studio: Object.freeze({
    id: 'studio',
    name: 'ConicTypst Studio',
    description: 'Ứng dụng soạn thảo và xuất bản nội dung Typst.',
    active: true,
    accessMode: 'approval',
    defaultMonths: 12,
    priceVnd: 99000,
    defaultLimits: Object.freeze({
      // 50 MiB/người: đủ rộng cho mã .typ và ảnh học liệu đã tối ưu; local vẫn không giới hạn.
      storageBytes: 52428800,
      maxClasses: 10,
      maxStudents: 500,
      retentionDays: 365,
    }),
  }),
  exam: Object.freeze({
    id: 'exam',
    name: 'Conic Exam',
    description: 'Xuất bản đề Typst và tổ chức thi trực tuyến cho lớp học.',
    active: true,
    accessMode: 'approval',
    defaultMonths: 12,
    priceVnd: 100000,
    defaultLimits: Object.freeze({
      storageBytes: 536870912,
      maxClasses: 10,
      maxStudents: 500,
      maxPublishedExams: 200,
      maxActiveAssignments: 30,
      maxAttemptsPerYear: 12000,
      maxResults: 12000,
      retentionDays: 365,
    }),
  }),
});

const PRODUCT_IDS = Object.freeze(Object.keys(PRODUCT_DEFINITIONS));
const MEMBER_STATUSES = Object.freeze([
  'pending',
  'active',
  'suspended',
  'deletion_scheduled',
]);
const ADMIN_ACTIONS = Object.freeze([
  'approve',
  'suspend',
  'resume',
  'extend',
  'set_expiry',
  'update_limits',
  'schedule_delete',
  'cancel_delete',
]);

const DEFAULT_OWNER_EMAILS = Object.freeze([
  'nguyensangnhc@gmail.com',
  'sangbeau@gmail.com',
]);
const DEFAULT_OWNER_EMAIL = DEFAULT_OWNER_EMAILS[0];
const AUDIT_RETENTION_DAYS = 365;
const MUTATION_RETENTION_DAYS = 30;

function bootstrapOwnerEmails() {
  const configured = process.env.CT_BOOTSTRAP_OWNER_EMAILS || DEFAULT_OWNER_EMAIL;
  return new Set([
    ...DEFAULT_OWNER_EMAILS,
    ...configured
      .split(',')
      .map((email) => email.trim().toLowerCase())
      .filter(Boolean),
  ]);
}

module.exports = {
  ADMIN_ACTIONS,
  AUDIT_RETENTION_DAYS,
  DEFAULT_OWNER_EMAIL,
  DEFAULT_OWNER_EMAILS,
  MEMBER_STATUSES,
  MUTATION_RETENTION_DAYS,
  PRODUCT_DEFINITIONS,
  PRODUCT_IDS,
  bootstrapOwnerEmails,
};
