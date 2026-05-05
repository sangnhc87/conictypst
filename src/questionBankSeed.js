export const QUESTION_TYPE_OPTIONS = [
  { value: 'tn', label: 'Trắc nghiệm', shortLabel: 'TN' },
  { value: 'ds', label: 'Đúng / sai', shortLabel: 'Đ/S' },
  { value: 'tln', label: 'Trả lời ngắn', shortLabel: 'TLN' },
  { value: 'tl', label: 'Tự luận', shortLabel: 'TL' },
]

export const STATUS_OPTIONS = [
  { value: 'draft', label: 'Bản nháp' },
  { value: 'review', label: 'Đang soát' },
  { value: 'ready', label: 'Sẵn sàng' },
  { value: 'archived', label: 'Lưu kho' },
]

export const DIFFICULTY_OPTIONS = [
  { value: 'nhan-biet', label: 'Nhận biết' },
  { value: 'thong-hieu', label: 'Thông hiểu' },
  { value: 'van-dung', label: 'Vận dụng' },
  { value: 'van-dung-cao', label: 'Vận dụng cao' },
]

export const DIFFICULTY_BY_CODE = {
  N: 'nhan-biet',
  H: 'thong-hieu',
  V: 'van-dung',
  C: 'van-dung-cao',
}

export function createEmptyOptionArray(count = 4) {
  return Array.from({ length: count }, () => '')
}

export function createEmptyStatements(count = 4) {
  return Array.from({ length: count }, () => ({ text: '', correct: false }))
}

export const SAMPLE_RECORDS = {
  '0D1N1-1': {
    id: '0D1N1-1',
    type: 'tn',
    status: 'ready',
    difficulty: 'nhan-biet',
    tags: ['lop10', 'menh-de', 'nhan-biet'],
    stem: 'Phát biểu nào sau đây là một mệnh đề?',
    options: [
      'Bạn học tốt nhé!',
      '2 là số nguyên tố.',
      'Hôm nay đẹp quá!',
      'x + 1 = 3',
    ],
    correctAnswers: [2],
    solution:
      'Chỉ phát biểu "2 là số nguyên tố" có giá trị đúng hoặc sai xác định nên được xem là mệnh đề.',
    note: 'Seed từ typst/questions.typ để kiểm thử workflow biên soạn.',
    updatedAt: '2026-05-04T09:00:00.000Z',
  },
  '0D1N1-2': {
    id: '0D1N1-2',
    type: 'ds',
    status: 'ready',
    difficulty: 'thong-hieu',
    tags: ['lop10', 'menh-de', 'dung-sai'],
    stem: 'Xét các phát biểu sau liên quan đến khái niệm mệnh đề.',
    statements: [
      { text: 'Phát biểu "2 là số chẵn" là một mệnh đề.', correct: true },
      { text: 'Câu "Hãy mở sách ra" là một mệnh đề.', correct: false },
      { text: 'Phát biểu "3 > 5" vẫn là một mệnh đề dù sai.', correct: true },
      { text: 'Biểu thức "x^2 - 1 = 0" luôn là một mệnh đề.', correct: false },
    ],
    solution:
      'Mệnh đề chỉ cần có thể xác định đúng hoặc sai. Câu cầu khiến hoặc phát biểu chứa biến chưa gán giá trị thì không phải mệnh đề.',
    updatedAt: '2026-05-04T09:05:00.000Z',
  },
  '0D1N1-3': {
    id: '0D1N1-3',
    type: 'tln',
    status: 'ready',
    difficulty: 'thong-hieu',
    tags: ['lop10', 'menh-de', 'phu-dinh'],
    stem: 'Viết phủ định của mệnh đề P: "5 là số nguyên tố".',
    shortAnswer: '5 không phải là số nguyên tố.',
    solution:
      'Phủ định của một mệnh đề đúng là mệnh đề phủ nhận nội dung đó: "5 không phải là số nguyên tố".',
    updatedAt: '2026-05-04T09:08:00.000Z',
  },
  '0D1N1-4': {
    id: '0D1N1-4',
    type: 'tl',
    status: 'review',
    difficulty: 'van-dung',
    tags: ['lop10', 'menh-de', 'menh-de-dao'],
    stem:
      'Cho mệnh đề P: "Nếu một tứ giác là hình vuông thì tứ giác đó là hình chữ nhật". Hãy nêu mệnh đề đảo và nhận xét tính đúng sai của nó.',
    solution:
      'Mệnh đề đảo là: "Nếu một tứ giác là hình chữ nhật thì tứ giác đó là hình vuông". Mệnh đề đảo sai vì tồn tại nhiều hình chữ nhật không phải hình vuông.',
    note: 'Đang chờ bổ sung rubric chấm điểm.',
    updatedAt: '2026-05-04T09:12:00.000Z',
  },
}