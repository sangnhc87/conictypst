import type { QuestionType, QuizDocument, QuizProfileRef } from "../models/quiz";

export type SubjectFamily = "stem" | "language" | "social" | "primary";
export type GroupMode = "optional" | "recommended" | "central";

export interface ProfileSectionTemplate {
  id: string;
  title: string;
  instruction: string;
  formats: string[];
}

export interface SubjectProfile {
  id: string;
  version: string;
  subject: string;
  label: string;
  icon: string;
  family: SubjectFamily;
  language: QuizProfileRef["language"];
  grades: string[];
  defaultGrade: string;
  displayLevel?: string;
  examDuration?: string;
  description: string;
  groupMode: GroupMode;
  allowedQuestionTypes: QuestionType[];
  skills: string[];
  editorSupports: string[];
  sections: ProfileSectionTemplate[];
  choiceLayout?: "auto" | "stacked";
  imageWidth?: number;
  accent: string;
}

const allTypes: QuestionType[] = ["single-choice", "true-false", "short-answer", "essay"];
const choiceEssay: QuestionType[] = ["single-choice", "short-answer", "essay"];
const thptGrades = ["10", "11", "12"];

export const SUBJECT_PROFILES: SubjectProfile[] = [
  {
    id: "math-thpt-v1", version: "1.0.0", subject: "Toán", label: "Toán THPT", icon: "∑", family: "stem", language: "vi",
    grades: thptGrades, defaultGrade: "12", description: "Giữ nguyên luồng Toán ổn định; tối ưu công thức, bảng biến thiên, đồ thị và bốn dạng câu BGD.", groupMode: "optional", allowedQuestionTypes: allTypes,
    skills: ["Đại số", "Giải tích", "Hình học", "Xác suất – thống kê", "Câu thực tế"],
    editorSupports: ["LaTeX và OMML", "Bảng/đồ thị", "Sai số số học", "Lời giải theo bước"], accent: "#0f766e",
    sections: [
      { id: "mcq", title: "Phần I · Trắc nghiệm", instruction: "Chọn một phương án đúng.", formats: ["Một đáp án"] },
      { id: "tf", title: "Phần II · Đúng – sai", instruction: "Xác định đúng hoặc sai cho từng ý.", formats: ["Bốn mệnh đề"] },
      { id: "short", title: "Phần III · Trả lời ngắn", instruction: "Nhập kết quả và sai số nếu có.", formats: ["Kết quả số"] },
      { id: "essay", title: "Phần IV · Tự luận", instruction: "Trình bày lập luận và lời giải.", formats: ["Tự luận"] },
    ],
  },
  {
    id: "english-10-v1", version: "1.2.0", subject: "Tiếng Anh", label: "Tiếng Anh tuyển sinh 10 · Hà Nội", icon: "A", family: "language", language: "mixed",
    grades: ["10"], defaultGrade: "10", displayLevel: "Tuyển sinh vào lớp 10", examDuration: "60 phút", description: "Khớp đề Hà Nội 2026–2027: 40 câu/60 phút, từ ngôn ngữ–giao tiếp đến phát âm, đọc hiểu, cloze, thông báo, viết câu và gapped text.", groupMode: "central", allowedQuestionTypes: choiceEssay,
    skills: ["Vocabulary", "Grammar", "Communication", "Pronunciation", "Reading comprehension", "Text completion", "Sentence ordering", "Stress", "Announcement", "Paraphrase", "Cloze test", "Sentence building", "Signs & Notices", "Gapped text"],
    editorSupports: ["Đúng mẫu Hà Nội 40 câu/60 phút", "Bảng dữ kiện chung riêng", "Giữ nguyên tiếng Anh", "Gạch chân/ngữ âm", "Giải thích bằng chứng"], accent: "#2563eb",
    sections: [
      { id: "language", title: "Câu 1–8 · Language & Communication", instruction: "Choose the best answer for vocabulary, grammar and everyday communication.", formats: ["Một đáp án"] },
      { id: "pronunciation", title: "Câu 9–10 · Pronunciation", instruction: "Identify the word with a different underlined sound.", formats: ["Ngữ âm"] },
      { id: "reading", title: "Câu 11–16 · Reading comprehension", instruction: "Read the shared passage and answer the questions.", formats: ["Đoạn đọc chung"] },
      { id: "text-flow", title: "Câu 17–18 · Text completion & ordering", instruction: "Complete and arrange sentences to make a coherent text.", formats: ["Text completion", "Ordering"] },
      { id: "stress", title: "Câu 19–20 · Stress", instruction: "Identify the word with a different primary stress.", formats: ["Trọng âm"] },
      { id: "announcement", title: "Câu 21–24 · Announcement cloze", instruction: "Complete the shared announcement.", formats: ["Chùm 4 câu"] },
      { id: "paraphrase", title: "Câu 25–26 · Sentence transformation", instruction: "Choose the option closest in meaning to the original sentence.", formats: ["Paraphrase"] },
      { id: "cloze", title: "Câu 27–32 · Cloze passage", instruction: "Choose the option that best fits each numbered blank in the shared passage.", formats: ["Chùm 6 câu"] },
      { id: "sentence-writing", title: "Câu 33–34 · Sentence building", instruction: "Build a complete sentence from the given cues.", formats: ["Viết câu"] },
      { id: "notices", title: "Câu 35–36 · Signs & Notices", instruction: "Interpret each sign or notice, keeping the original image.", formats: ["Biển báo/thông báo"] },
      { id: "gapped-text", title: "Câu 37–40 · Gapped text", instruction: "Insert the removed phrases or sentences into the shared text.", formats: ["Chùm 4 câu"] },
    ],
  },
  {
    id: "english-10-hcm-v1", version: "1.0.0", subject: "Tiếng Anh", label: "Tiếng Anh tuyển sinh 10 · TP.HCM 2026–2027", icon: "A·HCM", family: "language", language: "mixed",
    grades: ["10"], defaultGrade: "10", displayLevel: "Tuyển sinh vào lớp 10", examDuration: "90 phút", description: "Profile theo đề chính thức TP.HCM 2026–2027: 40 câu/90 phút, có ngữ âm, trọng âm, ngôn ngữ, giao tiếp, biển báo, cloze, đọc hiểu Đúng–Sai + trắc nghiệm, word form, cụm từ và viết lại câu.", groupMode: "recommended", allowedQuestionTypes: choiceEssay,
    skills: ["Pronunciation", "Stress", "Vocabulary", "Grammar", "Communication", "Sign/Notice", "Cloze", "Reading", "True/False", "Word formation", "Collocation", "Sentence transformation", "Wish", "Gerund", "Phrasal verb", "Concession"],
    editorSupports: ["40 câu/90 phút", "Gạch chân ngữ âm", "Biển báo + ảnh", "Chùm cloze/đọc hiểu", "Word bank", "Viết lại câu"], accent: "#7c3aed",
    sections: [
      { id: "sound", title: "Câu 1–4 · Pronunciation & Stress", instruction: "Identify the different pronunciation or stress pattern.", formats: ["Ngữ âm", "Trọng âm"] },
      { id: "language", title: "Câu 5–12 · Vocabulary & Grammar", instruction: "Choose the option that best completes each sentence.", formats: ["Một đáp án"] },
      { id: "communication", title: "Câu 13–14 · Communication", instruction: "Choose the most appropriate response in each exchange.", formats: ["Giao tiếp"] },
      { id: "notices", title: "Câu 15–16 · Signs & Notices", instruction: "Interpret the sign or notice.", formats: ["Biển báo/thông báo"] },
      { id: "cloze", title: "Câu 17–22 · Cloze passage", instruction: "Choose the option that best fits each blank in the passage.", formats: ["Chùm 6 câu"] },
      { id: "reading-true-false", title: "Câu 23–26 · Reading · True/False", instruction: "Decide whether each statement is True or False according to the passage.", formats: ["Đúng – sai", "Đoạn đọc chung"] },
      { id: "reading-choice", title: "Câu 27–28 · Reading · Multiple choice", instruction: "Answer the title and detail questions based on the passage.", formats: ["Một đáp án", "Đoạn đọc chung"] },
      { id: "word-form", title: "Câu 29–34 · Word form", instruction: "Write the correct form of the word in brackets.", formats: ["Word form"] },
      { id: "collocation", title: "Câu 35–36 · Fill in the blank", instruction: "Complete each sentence with a phrase from the word bank.", formats: ["Cụm từ / word bank"] },
      { id: "rewrite", title: "Câu 37–40 · Rewrite", instruction: "Rewrite each sentence without changing its meaning.", formats: ["Viết lại câu"] },
    ],
  },
  {
    id: "english-12-v1", version: "1.1.0", subject: "Tiếng Anh", label: "Tiếng Anh tốt nghiệp THPT · từ 2025", icon: "A+", family: "language", language: "mixed",
    grades: ["12"], defaultGrade: "12", displayLevel: "Tốt nghiệp THPT", examDuration: "50 phút", description: "Theo cấu trúc Bộ GDĐT từ 2025: 40 câu trắc nghiệm/50 phút; advertisement, leaflet, sắp xếp, gapped text và hai bài đọc là các khối độc lập.", groupMode: "central", allowedQuestionTypes: choiceEssay,
    skills: ["Advertisement", "Leaflet", "Dialogue ordering", "Email ordering", "Paragraph ordering", "Gapped text", "Reading", "Vocabulary in context", "Reference", "Paraphrase", "Inference", "Main idea"],
    editorSupports: ["Nhiều chùm độc lập", "Khoảng câu 1–40", "Giữ đoạn đọc dài", "Giải thích bằng chứng trong bài"], accent: "#1d4ed8",
    sections: [
      { id: "advertisement", title: "Câu 1–6 · Advertisement", instruction: "Choose the option that best fits each numbered blank.", formats: ["Chùm 6 câu"] },
      { id: "leaflet", title: "Câu 7–12 · Leaflet", instruction: "Complete the shared leaflet.", formats: ["Chùm 6 câu"] },
      { id: "ordering", title: "Câu 13–17 · Arrangement", instruction: "Arrange utterances or sentences into a coherent exchange, email or paragraph.", formats: ["5 câu sắp xếp"] },
      { id: "gapped-text", title: "Câu 18–22 · Gapped text", instruction: "Choose the clause or sentence that best fits each blank in the shared passage.", formats: ["Chùm 5 câu"] },
      { id: "reading-1", title: "Câu 23–30 · Reading passage 1", instruction: "Answer vocabulary, reference, detail and paragraph-location questions.", formats: ["Chùm 8 câu"] },
      { id: "reading-2", title: "Câu 31–40 · Reading passage 2", instruction: "Answer insertion, detail, inference, paraphrase and summary questions.", formats: ["Chùm 10 câu"] },
    ],
  },
  {
    id: "biology-thpt-v1", version: "1.1.0", subject: "Sinh học", label: "Sinh học tốt nghiệp THPT · 2026", icon: "🧬", family: "stem", language: "vi",
    grades: ["12"], defaultGrade: "12", displayLevel: "Tốt nghiệp THPT", examDuration: "50 phút", description: "Bám đúng mẫu đề tốt nghiệp 2026: 18 câu A–D, 4 câu chùm Đúng/Sai và 6 câu trả lời ngắn; giữ sơ đồ gene, lưới thức ăn, bảng số liệu, đồ thị, công thức và lời giải.", groupMode: "central", allowedQuestionTypes: allTypes, choiceLayout: "stacked", imageWidth: 68,
    skills: ["Di truyền học", "Tiến hóa", "Sinh thái học", "Sinh lý thực vật", "Sinh lý động vật", "Tế bào – phân tử", "Thực hành – thí nghiệm", "Tính toán sinh học"], editorSupports: ["Đề tốt nghiệp 2026", "18 câu A–D một cột", "4 nhóm Đúng/Sai", "6 câu trả lời ngắn", "Sơ đồ/hình OLE rõ nét", "Bảng dữ kiện và đồ thị", "Lời giải sau phương án"], accent: "#15803d",
    sections: [
      { id: "part-i", title: "PHẦN I · Trắc nghiệm A–D · Câu 1–18", instruction: "Thí sinh trả lời từ câu 1 đến câu 18. Mỗi câu hỏi thí sinh chỉ chọn một phương án.", formats: ["18 câu một đáp án"] },
      { id: "part-ii", title: "PHẦN II · Đúng/Sai · Câu 1–4", instruction: "Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.", formats: ["4 câu chùm dữ kiện", "16 ý Đúng/Sai"] },
      { id: "part-iii", title: "PHẦN III · Trả lời ngắn · Câu 1–6", instruction: "Thí sinh nhập đáp án ngắn; giữ nguyên đơn vị, ký hiệu và yêu cầu làm tròn của đề.", formats: ["6 câu trả lời ngắn"] },
    ],
  },
  {
    id: "history-thpt-v1", version: "1.1.0", subject: "Lịch sử", label: "Lịch sử tốt nghiệp THPT · 2026", icon: "⚑", family: "social", language: "vi",
    grades: ["12"], defaultGrade: "12", displayLevel: "Tốt nghiệp THPT", examDuration: "50 phút", description: "Bám đúng mẫu đề tốt nghiệp 2026: Phần I gồm 24 câu chọn A–D; Phần II gồm 4 câu chùm tư liệu, mỗi câu có 4 ý Đúng/Sai.", groupMode: "central", allowedQuestionTypes: allTypes, choiceLayout: "stacked",
    skills: ["Mốc thời gian", "Nhân vật – sự kiện", "Nguyên nhân – kết quả", "So sánh", "Phân tích sử liệu", "Khai thác tư liệu"], editorSupports: ["Đề tốt nghiệp 2026", "24 câu A–D một cột", "Bảng tư liệu riêng", "4 ý Đúng/Sai", "Đáp án + lời giải sau phương án"], accent: "#b45309",
    sections: [
      { id: "part-i", title: "PHẦN I · Trắc nghiệm A–D · Câu 1–24", instruction: "Thí sinh trả lời từ câu 1 đến câu 24. Mỗi câu hỏi thí sinh chỉ chọn một phương án.", formats: ["24 câu một đáp án"] },
      { id: "part-ii", title: "PHẦN II · Đúng/Sai · Câu 1–4", instruction: "Trong mỗi a), b), c), d) ở mỗi câu, thí sinh chọn Đúng hoặc Sai.", formats: ["4 câu chùm tư liệu", "16 ý Đúng/Sai"] },
    ],
  },
  {
    id: "geography-thpt-v1", version: "1.1.0", subject: "Địa lý", label: "Địa lý tốt nghiệp THPT · 2026", icon: "⌁", family: "social", language: "vi",
    grades: ["12"], defaultGrade: "12", displayLevel: "Tốt nghiệp THPT", examDuration: "50 phút", description: "Bám đúng mẫu đề tốt nghiệp 2026: 18 câu A–D, 4 câu chùm Đúng/Sai và 6 câu trả lời ngắn; giữ nguyên bảng số liệu, biểu đồ, đơn vị và phép tính.", groupMode: "central", allowedQuestionTypes: allTypes, choiceLayout: "stacked", imageWidth: 68,
    skills: ["Atlat – bản đồ", "Bảng số liệu", "Biểu đồ", "Địa lý tự nhiên", "Địa lý kinh tế – xã hội", "Tính toán địa lý"], editorSupports: ["18 câu A–D một cột", "4 nhóm Đúng/Sai", "6 câu trả lời ngắn", "Bảng số liệu và biểu đồ rõ nét", "Lời giải sau phương án"], accent: "#0284c7",
    sections: [
      { id: "part-i", title: "PHẦN I · Trắc nghiệm A–D · Câu 1–18", instruction: "Thí sinh trả lời từ câu 1 đến câu 18. Mỗi câu hỏi thí sinh chỉ chọn một phương án.", formats: ["18 câu một đáp án"] },
      { id: "part-ii", title: "PHẦN II · Đúng/Sai · Câu 1–4", instruction: "Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn Đúng hoặc Sai.", formats: ["4 câu chùm dữ kiện", "16 ý Đúng/Sai"] },
      { id: "part-iii", title: "PHẦN III · Trả lời ngắn · Câu 1–6", instruction: "Thí sinh nhập kết quả tính toán hoặc đáp án ngắn theo yêu cầu của từng câu.", formats: ["6 câu trả lời ngắn"] },
    ],
  },
  {
    id: "civics-thpt-v1", version: "1.1.0", subject: "GDCD", label: "GDCD / GDKT&PL", icon: "⚖", family: "social", language: "vi",
    grades: thptGrades, defaultGrade: "12", description: "Tình huống pháp luật, đạo đức và kinh tế được tách khỏi câu hỏi; giữ rõ chủ thể, hành vi và căn cứ.", groupMode: "recommended", allowedQuestionTypes: allTypes,
    skills: ["Đạo đức", "Pháp luật", "Quyền và nghĩa vụ", "Kinh tế", "Phân tích tình huống"], editorSupports: ["Khung tình huống riêng", "Danh sách chủ thể", "Hành vi/căn cứ pháp lý", "Định dạng văn bản đầy đủ", "Lời giải sau phương án"], choiceLayout: "stacked", imageWidth: 76, accent: "#7c3aed",
    sections: [
      { id: "concept", title: "Khái niệm và quy định", instruction: "Nhận biết nội dung đạo đức, kinh tế và pháp luật.", formats: ["Một đáp án"] },
      { id: "scenario", title: "Tình huống", instruction: "Đọc tình huống chung, phân tích từng chủ thể và hành vi.", formats: ["Câu hỏi chùm", "Đúng – sai"] },
      { id: "argument", title: "Vận dụng", instruction: "Đề xuất cách ứng xử và giải thích căn cứ.", formats: ["Tự luận"] },
    ],
  },
  {
    id: "gdqp-10-v1", version: "1.0.0", subject: "GDQP", label: "GDQP 10 · Ôn tập cuối HKI 2025–2026", icon: "🛡", family: "social", language: "vi",
    grades: ["10"], defaultGrade: "10", displayLevel: "Lớp 10", description: "Đúng cấu trúc file ôn tập bạn gửi: 30 câu trắc nghiệm A–D, 2 chủ đề tự luận và bảng đáp án riêng; không tự biến chủ đề ôn tập thành câu hỏi trắc nghiệm.", groupMode: "optional", allowedQuestionTypes: ["single-choice", "essay"], choiceLayout: "stacked",
    skills: ["Phòng, chống ma túy", "An toàn giao thông đường bộ", "An toàn giao thông đường thủy", "An ninh quốc gia", "Trật tự – an toàn xã hội", "An ninh mạng", "Trách nhiệm học sinh"],
    editorSupports: ["30 câu A–D một cột", "Bảng đáp án riêng", "2 chủ đề tự luận", "Tách nội dung ôn tập", "Lời giải sau phương án"], accent: "#0f766e",
    sections: [
      { id: "mcq", title: "PHẦN A · Trắc nghiệm · Câu 1–30", instruction: "Chọn một phương án đúng.", formats: ["30 câu một đáp án"] },
      { id: "essay", title: "PHẦN B · Tự luận", instruction: "Trình bày các nội dung ôn tập theo yêu cầu.", formats: ["2 chủ đề tự luận"] },
    ],
  },
  {
    id: "physics-thpt-v1", version: "1.1.0", subject: "Vật lý", label: "Vật lý tốt nghiệp THPT · 2026", icon: "ϕ", family: "stem", language: "vi",
    grades: ["12"], defaultGrade: "12", displayLevel: "Tốt nghiệp THPT", examDuration: "50 phút", description: "Bám đúng mẫu đề tốt nghiệp 2026: 18 câu A–D, 4 câu chùm Đúng/Sai và 6 câu trả lời ngắn; giữ công thức MathType, hình thí nghiệm, đơn vị và lời giải.", groupMode: "central", allowedQuestionTypes: allTypes, choiceLayout: "stacked", imageWidth: 68,
    skills: ["Cơ học", "Nhiệt học", "Điện – từ", "Sóng – quang", "Vật lý hạt nhân", "Thí nghiệm – đồ thị", "Tính toán"], editorSupports: ["Đề tốt nghiệp 2026", "18 câu A–D một cột", "4 nhóm Đúng/Sai", "6 câu trả lời ngắn", "Công thức MathType/OLE", "Hình thí nghiệm rõ nét", "Lời giải sau phương án"], accent: "#0891b2",
    sections: [
      { id: "part-i", title: "PHẦN I · Trắc nghiệm A–D · Câu 1–18", instruction: "Thí sinh trả lời từ câu 1 đến câu 18. Mỗi câu hỏi thí sinh chỉ chọn một phương án.", formats: ["18 câu một đáp án"] },
      { id: "part-ii", title: "PHẦN II · Đúng/Sai · Câu 1–4", instruction: "Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.", formats: ["4 câu chùm dữ kiện", "16 ý Đúng/Sai"] },
      { id: "part-iii", title: "PHẦN III · Trả lời ngắn · Câu 1–6", instruction: "Không làm tròn kết quả các phép tính trung gian; nhập kết quả kèm đơn vị hoặc độ chính xác theo yêu cầu.", formats: ["6 câu trả lời ngắn"] },
    ],
  },
  {
    id: "informatics-thpt-v1", version: "1.0.1", subject: "Tin học", label: "Tin học tốt nghiệp THPT · mẫu 2026", icon: "⌘", family: "stem", language: "vi",
    grades: ["12"], defaultGrade: "12", displayLevel: "Tốt nghiệp THPT", examDuration: "50 phút", description: "Khung riêng cho đề Tin học tốt nghiệp 2026: 24 câu A–D, 6 câu Đúng/Sai gồm phần chung và hai định hướng; giữ nguyên mã Python/C++, SQL, HTML/CSS, cơ sở dữ liệu và lời giải.", groupMode: "central", allowedQuestionTypes: ["single-choice", "true-false"], choiceLayout: "stacked", imageWidth: 76,
    skills: ["Mạng máy tính", "HTML – CSS", "Cơ sở dữ liệu – SQL", "Lập trình Python/C++", "Trí tuệ nhân tạo", "An toàn thông tin", "Đạo đức số", "Tin học ứng dụng"],
    editorSupports: ["24 câu A–D một cột", "6 câu Đúng/Sai", "Phần chung + hai định hướng", "Bảng mã Python/C++", "SQL và cấu trúc dữ liệu", "Giữ nguyên HTML/CSS", "Lời giải sau phương án"], accent: "#0f766e",
    sections: [
      { id: "part-i", title: "PHẦN I · Trắc nghiệm A–D · Câu 1–24", instruction: "Thí sinh trả lời từ câu 1 đến câu 24. Mỗi câu hỏi thí sinh chỉ chọn một phương án.", formats: ["24 câu một đáp án"] },
      { id: "part-ii-common", title: "PHẦN II · Phần chung · Câu 1–2", instruction: "Tất cả thí sinh trả lời hai câu Đúng/Sai về cơ sở dữ liệu, mạng và an toàn thông tin.", formats: ["2 câu chùm Đúng/Sai", "8 ý Đúng/Sai"] },
      { id: "part-ii-cs", title: "PHẦN II · Định hướng Khoa học máy tính · Câu 3–4", instruction: "Thí sinh theo định hướng Khoa học máy tính chỉ trả lời Câu 3 và Câu 4.", formats: ["2 câu chùm Đúng/Sai", "8 ý Đúng/Sai"] },
      { id: "part-ii-app", title: "PHẦN II · Định hướng Tin học ứng dụng · Câu 5–6", instruction: "Thí sinh theo định hướng Tin học ứng dụng chỉ trả lời Câu 5 và Câu 6.", formats: ["2 câu chùm Đúng/Sai", "8 ý Đúng/Sai"] },
    ],
  },
  {
    id: "chemistry-thpt-v1", version: "1.1.0", subject: "Hóa học", label: "Hóa học THPT", icon: "⚗", family: "stem", language: "vi",
    grades: thptGrades, defaultGrade: "12", description: "Bảo toàn phương trình phản ứng, chỉ số hóa học, chuỗi biến hóa, phổ và dữ kiện thí nghiệm.", groupMode: "recommended", allowedQuestionTypes: allTypes,
    skills: ["Cấu tạo chất", "Vô cơ", "Hữu cơ", "Điện hóa", "Phân tích – thí nghiệm"], editorSupports: ["Phương trình phản ứng", "Chỉ số/điện tích hóa học", "Chuỗi biến hóa", "Bảng thí nghiệm", "Định dạng văn bản đầy đủ", "Lời giải sau phương án"], choiceLayout: "stacked", imageWidth: 72, accent: "#ea580c",
    sections: [
      { id: "theory", title: "Lý thuyết hóa học", instruction: "Nhận biết cấu tạo, tính chất và quy luật.", formats: ["Một đáp án", "Đúng – sai"] },
      { id: "experiment", title: "Thí nghiệm và phổ", instruction: "Dùng dữ kiện chung để nhận diện chất, hiện tượng hoặc sản phẩm.", formats: ["Câu hỏi chùm", "Đúng – sai"] },
      { id: "calculation", title: "Bài toán hóa học", instruction: "Tính toán theo phương trình, bảo toàn và dữ kiện thực tế.", formats: ["Trả lời ngắn", "Tự luận"] },
    ],
  },
  {
    id: "primary-integrated-v1", version: "1.1.0", subject: "Tiểu học", label: "Tiểu học liên môn", icon: "✿", family: "primary", language: "vi",
    grades: ["1", "2", "3", "4", "5"], defaultGrade: "5", description: "Khung nhẹ, chữ lớn và chỉ dẫn ngắn cho Toán, Tiếng Việt, Khoa học, Lịch sử – Địa lý cấp tiểu học.", groupMode: "optional", allowedQuestionTypes: allTypes,
    skills: ["Toán", "Tiếng Việt", "Đọc hiểu", "Khoa học", "Lịch sử – Địa lý", "Hoạt động trải nghiệm"], editorSupports: ["Chữ lớn", "Câu lệnh ngắn", "Ảnh minh họa", "Màu và định dạng đầy đủ", "Đáp án thân thiện", "Lời giải sau phương án"], choiceLayout: "stacked", imageWidth: 84, accent: "#db2777",
    sections: [
      { id: "warmup", title: "Khởi động", instruction: "Câu hỏi ngắn, trực quan và vừa sức.", formats: ["Chọn đáp án", "Đúng – sai"] },
      { id: "practice", title: "Luyện tập", instruction: "Thực hành theo ví dụ, tranh hoặc đoạn đọc chung.", formats: ["Câu hỏi chùm", "Trả lời ngắn"] },
      { id: "apply", title: "Vận dụng", instruction: "Liên hệ tình huống gần gũi với học sinh.", formats: ["Tự luận ngắn"] },
    ],
  },
  {
    id: "literature-thpt-v1", version: "1.2.0", subject: "Ngữ văn", label: "Ngữ văn tốt nghiệp THPT · 2026", icon: "❝", family: "language", language: "vi",
    grades: ["12"], defaultGrade: "12", displayLevel: "Tốt nghiệp THPT", examDuration: "120 phút", description: "Đúng khung đề Ngữ văn tốt nghiệp THPT 2026: Đọc hiểu 4,0 điểm với một văn bản nghị luận và 5 câu hỏi; Viết 6,0 điểm gồm đoạn nghị luận xã hội khoảng 200 chữ và bài nghị luận văn học khoảng 600 chữ, chấm theo rubric mở.", groupMode: "central", allowedQuestionTypes: ["short-answer", "essay"],
    skills: ["Đọc hiểu văn bản nghị luận", "Nhận biết luận đề – luận điểm", "Phân tích lập luận", "Giải thích từ ngữ/hình ảnh", "Liên hệ và phản biện", "Nghị luận xã hội", "Nghị luận văn học", "Thơ tự do", "Nghệ thuật ngôn từ", "Dàn ý – luận điểm", "Rubric chấm mở"], editorSupports: ["Đề tốt nghiệp 2026 · 120 phút", "Văn bản nguồn riêng", "5 câu Đọc hiểu dùng chung văn bản", "Câu viết khoảng 200 chữ", "Câu viết khoảng 600 chữ", "Dàn ý + luận điểm + dẫn chứng", "Hướng dẫn chấm mở", "Lời giải tham khảo sau yêu cầu"], choiceLayout: "stacked", imageWidth: 82, accent: "#be123c",
    sections: [
      { id: "reading", title: "PHẦN I · Đọc hiểu · 4,0 điểm", instruction: "Đọc một văn bản nghị luận dùng chung và trả lời 5 câu hỏi ngắn; chấp nhận cách trả lời tương đương theo hướng dẫn chấm.", formats: ["Văn bản nguồn", "5 câu đọc hiểu"] },
      { id: "social", title: "PHẦN II · Viết · Câu 1 · 2,0 điểm", instruction: "Viết đoạn văn nghị luận xã hội khoảng 200 chữ; có vấn đề, lập luận, bằng chứng và liên hệ phù hợp.", formats: ["Nghị luận xã hội", "Khoảng 200 chữ"] },
      { id: "literary", title: "PHẦN II · Viết · Câu 2 · 4,0 điểm", instruction: "Viết bài văn nghị luận văn học khoảng 600 chữ; phân tích nội dung, nghệ thuật và đánh giá bằng dẫn chứng.", formats: ["Nghị luận văn học", "Khoảng 600 chữ"] },
    ],
  },
];

export const DEFAULT_PROFILE_ID = "math-thpt-v1";

export const getSubjectProfile = (profileId?: string) =>
  SUBJECT_PROFILES.find((profile) => profile.id === profileId) || SUBJECT_PROFILES[0];

export const ENGLISH_CORE_PROFILE_IDS = ["english-10-v1", "english-12-v1"] as const;

export const profilesForSubject = (subject: string) =>
  SUBJECT_PROFILES.filter((profile) => profile.subject === subject);

export const defaultProfileForSubject = (subject: string) => {
  if (subject === "Tiếng Anh") return getSubjectProfile("english-10-v1");
  return profilesForSubject(subject)[0] || getSubjectProfile(DEFAULT_PROFILE_ID);
};

export const SUBJECT_OPTIONS = Array.from(
  new Map(SUBJECT_PROFILES.map((profile) => [profile.subject, {
    subject: profile.subject,
    icon: profile.icon,
    description: profile.subject === "Tiếng Anh"
      ? "Chọn đúng cấu trúc lớp 10 hoặc tốt nghiệp 12; hệ thống sẽ ẩn các môn khác."
      : `Không gian soạn đề, hướng dẫn và cấu trúc riêng cho ${profile.subject}.`,
    defaultProfileId: defaultProfileForSubject(profile.subject).id,
  }])).values(),
);

export const makeProfileRef = (profileId: string, grade?: string): QuizProfileRef => {
  const profile = getSubjectProfile(profileId);
  const resolvedGrade = profile.grades.includes(String(grade)) ? String(grade) : profile.defaultGrade;
  return { id: profile.id, version: profile.version, subject: profile.subject, grade: resolvedGrade, label: profile.label, language: profile.language };
};

export const withProfile = (quiz: QuizDocument, profileId: string, grade?: string): QuizDocument => ({
  ...quiz,
  profile: makeProfileRef(profileId, grade),
});

export const profileForQuiz = (quiz?: QuizDocument | null) => getSubjectProfile(quiz?.profile?.id);

export const profileLevelLabel = (profile: SubjectProfile, grade = profile.defaultGrade) =>
  profile.displayLevel || (profile.grades.length === 1 ? `Lớp ${grade}` : `Lớp ${profile.grades.join("–")}`);
