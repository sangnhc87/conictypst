import { getSubjectProfile, makeProfileRef } from "../config/subjectProfiles";
import type { ContentBlock, Question, QuizDocument } from "../models/quiz";
import { uid } from "../models/quiz";
import { demoQuiz } from "./demoData";

const p = (text: string): ContentBlock => ({ id: uid("p"), kind: "paragraph", text });
const table = (rows: string[][]): ContentBlock => ({ id: uid("table"), kind: "table", rows });
const choices = (items: string[], answer: number) => items.map((text, index) => ({
  id: uid("c"), label: String.fromCharCode(65 + index), content: [p(text)], isCorrect: index === answer,
}));
const mcq = (number: number, stem: string, items: string[], answer: number, skill: string, format = "Một đáp án"): Question => ({
  id: uid("q"), number, type: "single-choice", stem: [p(stem)], choices: choices(items, answer), attachments: [], confidence: "high", warnings: [], skill, format,
});
const short = (number: number, stem: string, answers: string[], skill: string): Question => ({
  id: uid("q"), number, type: "short-answer", stem: [p(stem)], shortAnswer: { acceptedAnswers: answers, caseSensitive: false }, attachments: [], confidence: "high", warnings: [], skill, format: "Trả lời ngắn",
});
const essay = (number: number, stem: string, skill: string): Question => ({
  id: uid("q"), number, type: "essay", stem: [p(stem)], attachments: [], confidence: "high", warnings: [], skill, format: "Tự luận",
});
const inSection = (sectionId: string, question: Question): Question => ({ ...question, sectionId });

type SampleGroupDefinition = {
  title: string;
  instruction?: string;
  kind?: string;
  stimulus: ContentBlock[];
  questionNumbers: number[];
};

type SampleDefinition = {
  title: string;
  groupTitle?: string;
  groupInstruction?: string;
  groupKind?: string;
  stimulus?: ContentBlock[];
  groups?: SampleGroupDefinition[];
  questions: Question[];
};

const definitions = (): Record<string, SampleDefinition> => ({
  "english-10-v1": {
    title: "Tiếng Anh tuyển sinh lớp 10 · Hà Nội 2026 (mẫu rút gọn đủ 10 dạng)",
    groups: [
      {
        title: "Reading passage · A student repair club", kind: "reading", instruction: "Read the passage and answer the selected questions from 3 to 8.", questionNumbers: [3, 6, 8],
        stimulus: [p("At Minh Khai School, a student repair club meets every Friday afternoon. Members learn to fix simple objects such as lamps, bicycle bells and school bags. The club began with twelve students, but it soon attracted volunteers from other classes. Besides reducing waste, the activities help students become more patient and confident when solving practical problems.")],
      },
      {
        title: "Cloze passage · Preparing for exam week", kind: "cloze", instruction: "Choose the option that best fits each selected blank from 9 to 14.", questionNumbers: [9, 12, 14],
        stimulus: [p("PREPARING FOR EXAM WEEK\nA realistic study plan can make exam week less stressful. First, divide each subject into small tasks and complete (9) ____ task at a time. Keep your phone away so that you can focus (12) ____ your work. Finally, remember that getting enough sleep is as important as (14) ____ your notes.")],
      },
      {
        title: "Announcement · Book Exchange Day", kind: "announcement-cloze", instruction: "Complete the selected blanks in the shared announcement.", questionNumbers: [17, 20],
        stimulus: [p("BOOK EXCHANGE DAY\nSign up (17) ____ the school website before Thursday. Bring books that are clean and suitable for teenagers. Please (20) ____ a reusable bag to carry the books you choose.")],
      },
      {
        title: "Gapped text · Learning from local crafts", kind: "gapped-text", instruction: "Insert the removed phrases or sentences into the selected blanks.", questionNumbers: [37, 40],
        stimulus: [p("Many teenagers are curious about traditional crafts. (37) ____. During a workshop, local artisans can explain how they choose materials and use each tool. Students may then make a simple product themselves. Sharing the experience online is also useful (40) ____."), p("Removed options: A. because it introduces local culture to more young people · B. Schools can turn that curiosity into practical learning · C. although every craft uses the same material · D. unless students avoid asking questions")],
      },
    ],
    questions: [
      inSection("text-flow", mcq(1, "Choose the sentence that best completes the text: ‘Small actions can make a classroom greener. ____.’", ["For example, students can switch off unused lights and fans", "However, every classroom must remain empty all day", "As a result, electricity is a school subject", "In contrast, books should never be reused"], 0, "Text completion", "Text completion")),
      inSection("text-flow", mcq(2, "Reorder the sentences to complete a logical paragraph: a. Finally, review what you have learned. b. First, set a clear study goal. c. Next, work on one task without distractions.", ["a–b–c", "b–c–a", "c–a–b", "b–a–c"], 1, "Sentence ordering", "Ordering")),
      inSection("reading", mcq(3, "What is the passage mainly about?", ["A club that develops practical repair skills", "A competition for bicycle riders", "A plan to buy new school bags", "A Friday sports lesson"], 0, "Reading", "Main idea")),
      inSection("reading", mcq(6, "Which statement is TRUE according to the passage?", ["The club meets every morning", "Only teachers can join the club", "The club helps reduce waste", "Members repair computers only"], 2, "Reading", "Detail")),
      inSection("reading", mcq(8, "The word “it” in ‘it soon attracted’ refers to ____.", ["the club", "the school bag", "Friday afternoon", "another class"], 0, "Reading", "Reference")),
      inSection("cloze", mcq(9, "Blank (9)", ["one", "much", "every of", "another of"], 0, "Cloze test", "Determiner")),
      inSection("cloze", mcq(12, "Blank (12)", ["at", "in", "on", "for"], 2, "Cloze test", "Preposition")),
      inSection("cloze", mcq(14, "Blank (14)", ["review", "reviewing", "reviewed", "to reviewed"], 1, "Cloze test", "Gerund")),
      inSection("notices", mcq(15, "NOTICE: ‘LAB CLOSED AFTER 4:30 P.M.’ What does the notice mean?", ["Students may enter the lab all evening", "The lab cannot be used after 4:30 p.m.", "The lab opens at 4:30 p.m.", "Only visitors must leave at 4:30 p.m."], 1, "Notice/Message", "Notice")),
      inSection("notices", mcq(16, "MESSAGE: ‘Please leave returned books in the blue box.’ What should readers do?", ["Put returned books in the blue box", "Paint the book box blue", "Take books out of the box", "Return only blue books"], 0, "Notice/Message", "Message")),
      inSection("announcement", mcq(17, "Blank (17)", ["on", "at", "from", "with"], 0, "Cloze test", "Preposition")),
      inSection("announcement", mcq(20, "Blank (20)", ["bringing", "bring", "to bringing", "brought"], 1, "Cloze test", "Verb form")),
      inSection("language", mcq(21, "The community project has ____ many young volunteers.", ["attracted", "avoided", "refused", "prevented"], 0, "Vocabulary", "Word choice")),
      inSection("language", mcq(24, "Mai: ‘Thanks for showing me the way.’ – Nam: ‘____’", ["No problem!", "You can say that again.", "It is a way.", "Never ask me."], 0, "Communication", "Everyday English")),
      inSection("pronunciation", mcq(29, "Choose the word whose marked part is pronounced differently.", ["h[ea]d", "br[ea]d", "r[ea]dy", "t[ea]m"], 3, "Pronunciation", "Vowel sound")),
      inSection("pronunciation", mcq(30, "Choose the word whose marked ending is pronounced differently.", ["want[ed]", "need[ed]", "wash[ed]", "visit[ed]"], 2, "Pronunciation", "-ed ending")),
      inSection("sentence-writing", mcq(31, "school library / provide / quiet space / students / study", ["The school library provides a quiet space for students to study.", "The school library provide quiet space students study.", "A school library providing a quiet space students studying.", "The school library provides quietly space to students study."], 0, "Sentence building", "Given cues")),
      inSection("sentence-writing", mcq(34, "Choose the sentence closest in meaning: ‘The task was easier than Minh had expected.’", ["Minh expected the task to be easier.", "The task was not as difficult as Minh had expected.", "Minh did not complete the difficult task.", "The task was the easiest one Minh expected."], 1, "Paraphrase", "Closest meaning")),
      inSection("stress", mcq(35, "Choose the word with a different primary stress.", ["teacher", "student", "career", "lesson"], 2, "Stress", "Two-syllable words")),
      inSection("stress", mcq(36, "Choose the word with a different primary stress.", ["community", "activity", "environment", "practical"], 3, "Stress", "Multi-syllable words")),
      inSection("gapped-text", mcq(37, "Blank (37)", ["Option A", "Option B", "Option C", "Option D"], 1, "Gapped text", "Sentence insertion")),
      inSection("gapped-text", mcq(40, "Blank (40)", ["Option A", "Option B", "Option C", "Option D"], 0, "Gapped text", "Sentence insertion")),
    ],
  },
  "english-12-v1": {
    title: "Tiếng Anh tốt nghiệp THPT từ 2025 (mẫu rút gọn đủ 6 phần)",
    groups: [
      {
        title: "Advertisement · Weekend Science Tour", kind: "advertisement", instruction: "Choose the option that best fits each selected blank from 1 to 6.", questionNumbers: [1, 3, 6],
        stimulus: [p("WEEKEND SCIENCE TOUR\nAre you interested in (1) ____ how everyday technology works? Join our guided museum tour, (3) ____ by experienced university volunteers. Book this week (6) ____ receive a free activity booklet.")],
      },
      {
        title: "Leaflet · Start a reading habit", kind: "leaflet", instruction: "Complete the selected blanks from 7 to 12.", questionNumbers: [7, 10, 12],
        stimulus: [p("START A READING HABIT\nChoose a book that matches your interests rather than following (7) ____ people's choices. (10) ____ trying to finish a long book in one sitting, read a few pages each day. Keep a short list of useful ideas or new vocabulary (12) ____ you can review later.")],
      },
      {
        title: "Gapped text · Responsible use of AI", kind: "gapped-text", instruction: "Choose the clause or sentence that best fits each selected blank from 18 to 22.", questionNumbers: [18, 20, 22],
        stimulus: [p("Artificial intelligence can support students in many ways. (18) ____. For example, a learner may ask a tool to explain a difficult concept in simpler language. However, students still need to check the information they receive. (20) ____. When AI is used responsibly, it can encourage independent learning rather than replace it. (22) ____."), p("Options: A. Teachers can also guide learners in citing AI-assisted work honestly · B. It should not be treated as an unquestionable source · C. Used carefully, it can provide feedback and suggest study strategies · D. All schoolwork should therefore be completed automatically")],
      },
      {
        title: "Reading passage 1 · Community gardens", kind: "reading", instruction: "Read the passage and answer the selected questions from 23 to 30.", questionNumbers: [23, 27, 30],
        stimulus: [p("Community gardens are shared spaces where local residents grow vegetables, herbs and flowers. In crowded neighbourhoods, these gardens provide more than fresh food. They create places where people exchange knowledge, spend time outdoors and meet neighbours from different age groups. Some schools also use small garden plots for science lessons. Although maintaining a shared garden requires planning, clear schedules and access to water, many communities find that the social and educational benefits are worth the effort.")],
      },
      {
        title: "Reading passage 2 · Repair culture", kind: "reading-advanced", instruction: "Read the passage and answer the selected questions from 31 to 40.", questionNumbers: [31, 36, 40],
        stimulus: [p("[I] For many years, consumers often replaced broken household items instead of repairing them. [II] Recently, repair cafés have offered another approach. [III] At these community events, volunteers help visitors inspect and fix appliances, clothes or bicycles. [IV] The goal is not only to save money but also to reduce waste and share practical knowledge. Repair cafés cannot solve every product-design problem, and some electrical repairs must still be completed by qualified technicians. Nevertheless, the events show that extending the life of ordinary objects can become a social activity. Visitors observe the repair process and may gain enough confidence to handle simple maintenance in the future. In this way, repair culture encourages both environmental responsibility and lifelong learning.")],
      },
    ],
    questions: [
      inSection("advertisement", mcq(1, "Blank (1)", ["discover", "discovering", "discovered", "to discovering"], 1, "Advertisement", "Verb form")),
      inSection("advertisement", mcq(3, "Blank (3)", ["led", "leading", "which lead", "was leading"], 0, "Advertisement", "Reduced clause")),
      inSection("advertisement", mcq(6, "Blank (6)", ["so that", "in order to", "because of", "despite"], 1, "Advertisement", "Purpose")),
      inSection("leaflet", mcq(7, "Blank (7)", ["other", "another", "others", "the other of"], 0, "Leaflet", "Determiner")),
      inSection("leaflet", mcq(10, "Blank (10)", ["Instead of", "Because", "In spite", "According to"], 0, "Leaflet", "Linking phrase")),
      inSection("leaflet", mcq(12, "Blank (12)", ["who", "where", "that", "what"], 2, "Leaflet", "Relative clause")),
      inSection("ordering", mcq(13, "Arrange the exchange: a. Linh: Yes. It helps me remember new words. b. Tom: Do you keep a vocabulary notebook? c. Tom: That sounds useful.", ["a–b–c", "b–a–c", "c–b–a", "b–c–a"], 1, "Dialogue ordering", "Dialogue")),
      inSection("ordering", mcq(15, "Arrange the email body: a. Let me know if Saturday morning suits you. b. Thanks for inviting me to the book fair. c. I would love to go with you.", ["a–b–c", "b–c–a", "c–a–b", "b–a–c"], 1, "Email ordering", "Email")),
      inSection("gapped-text", mcq(18, "Blank (18)", ["Option A", "Option B", "Option C", "Option D"], 2, "Gapped text", "Sentence insertion")),
      inSection("gapped-text", mcq(20, "Blank (20)", ["Option A", "Option B", "Option C", "Option D"], 1, "Gapped text", "Sentence insertion")),
      inSection("gapped-text", mcq(22, "Blank (22)", ["Option A", "Option B", "Option C", "Option D"], 0, "Gapped text", "Sentence insertion")),
      inSection("reading-1", mcq(23, "Which benefit of community gardens is NOT mentioned?", ["Fresh food", "Outdoor activity", "Neighbour interaction", "Guaranteed employment"], 3, "Reading", "Not mentioned")),
      inSection("reading-1", mcq(27, "Which statement best paraphrases ‘the social and educational benefits are worth the effort’?", ["The gardens require no work", "Their value can justify the work needed", "Only schools benefit from gardens", "Planning makes gardens impossible"], 1, "Paraphrase", "Paraphrase")),
      inSection("reading-1", mcq(30, "In which sentence does the writer mention a classroom use?", ["Sentence 1", "Sentence 2", "Sentence 3", "Sentence 4"], 3, "Reading", "Paragraph location")),
      inSection("reading-2", mcq(31, "Where does this sentence best fit: ‘They also allow useful skills to pass from one person to another.’", ["[I]", "[II]", "[III]", "[IV]"], 3, "Reading", "Sentence insertion")),
      inSection("reading-2", mcq(36, "The word ‘extending’ is closest in meaning to ____.", ["shortening", "prolonging", "measuring", "predicting"], 1, "Vocabulary in context", "Closest meaning")),
      inSection("reading-2", mcq(40, "Which option best summarises the passage?", ["Repair cafés replace all professional technicians", "Repair events combine waste reduction, skill sharing and community learning", "Consumers should never buy new household items", "Only electrical products can be repaired at community events"], 1, "Main idea", "Summary")),
    ],
  },
  "biology-thpt-v1": {
    title: "Sinh học · Phân tích thí nghiệm",
    groupTitle: "Thí nghiệm ảnh hưởng của ánh sáng", groupKind: "experiment", groupInstruction: "Dùng dữ kiện chung để trả lời Câu 1–2.",
    stimulus: [p("Hai nhóm cây cùng loài được trồng trong điều kiện giống nhau. Nhóm A nhận ánh sáng 12 giờ/ngày, nhóm B nhận 4 giờ/ngày. Sau 14 ngày, sinh khối khô trung bình lần lượt là 8,2 g và 5,1 g."), table([["Nhóm", "Ánh sáng", "Sinh khối khô"], ["A", "12 giờ/ngày", "8,2 g"], ["B", "4 giờ/ngày", "5,1 g"]])],
    questions: [
      mcq(1, "Biến độc lập của thí nghiệm là", ["loài cây", "thời gian chiếu sáng", "sinh khối khô", "thời gian trồng"], 1, "Thực hành – thí nghiệm"),
      mcq(2, "Kết luận phù hợp nhất với dữ kiện là", ["ánh sáng không ảnh hưởng", "nhóm B quang hợp mạnh hơn", "tăng thời gian chiếu sáng liên quan đến tăng sinh khối", "mọi cây cần đúng 12 giờ sáng"], 2, "Thực hành – thí nghiệm"),
      short(3, "Độ chênh sinh khối khô giữa hai nhóm là bao nhiêu gam?", ["3,1", "3.1"], "Thực hành – thí nghiệm"),
    ],
  },
  "history-thpt-v1": {
    title: "Lịch sử · Khai thác sử liệu",
    groupTitle: "Nguồn sử liệu về Tổng khởi nghĩa", groupKind: "historical-source", groupInstruction: "Đọc tư liệu và trả lời Câu 1–2.",
    stimulus: [p("Tư liệu: Khi thời cơ xuất hiện, lực lượng cách mạng đã huy động quần chúng giành chính quyền trong phạm vi cả nước trong thời gian ngắn. Thắng lợi là kết quả của quá trình chuẩn bị lâu dài và khả năng chớp thời cơ." )],
    questions: [
      mcq(1, "Yếu tố nào được tư liệu nhấn mạnh?", ["Viện trợ từ bên ngoài", "Sự chuẩn bị và chớp thời cơ", "Ưu thế vũ khí", "Đàm phán ngoại giao"], 1, "Phân tích sử liệu"),
      mcq(2, "Nhận định nào phù hợp nhất với tư liệu?", ["Thắng lợi diễn ra hoàn toàn tự phát", "Thời cơ là yếu tố duy nhất", "Chuẩn bị lực lượng tạo điều kiện tận dụng thời cơ", "Tư liệu phủ nhận vai trò quần chúng"], 2, "Nguyên nhân – kết quả"),
      essay(3, "Trình bày ngắn gọn mối quan hệ giữa chuẩn bị lực lượng và chớp thời cơ trong một sự kiện lịch sử đã học.", "Phân tích sử liệu"),
    ],
  },
  "geography-thpt-v1": {
    title: "Địa lý · Bảng số liệu và biểu đồ",
    groupTitle: "Sản lượng lương thực", groupKind: "data-table", groupInstruction: "Căn cứ bảng số liệu, trả lời Câu 1–2.",
    stimulus: [table([["Năm", "2020", "2022", "2024"], ["Sản lượng (triệu tấn)", "43,1", "43,9", "44,6"]])],
    questions: [
      mcq(1, "Nhận xét đúng về sản lượng giai đoạn 2020–2024 là", ["giảm liên tục", "tăng liên tục", "không thay đổi", "tăng rồi giảm"], 1, "Bảng số liệu"),
      short(2, "Sản lượng năm 2024 tăng bao nhiêu triệu tấn so với năm 2020?", ["1,5", "1.5"], "Bảng số liệu"),
      essay(3, "Nêu một loại biểu đồ phù hợp để thể hiện sự thay đổi của chỉ tiêu trên và giải thích lựa chọn.", "Biểu đồ"),
    ],
  },
  "civics-thpt-v1": {
    title: "GDCD · Phân tích tình huống",
    groupTitle: "Tình huống mua bán trực tuyến", groupKind: "legal-scenario", groupInstruction: "Đọc tình huống và xác định quyền, nghĩa vụ của các chủ thể.",
    stimulus: [p("Bạn M đặt mua một chiếc máy tính qua cửa hàng trực tuyến. Khi nhận hàng, sản phẩm không đúng mô tả. M lưu lại hóa đơn, ảnh sản phẩm và liên hệ cửa hàng yêu cầu đổi trả theo chính sách đã công bố." )],
    questions: [
      mcq(1, "Việc M lưu hóa đơn và ảnh sản phẩm chủ yếu nhằm", ["quảng cáo cửa hàng", "làm căn cứ bảo vệ quyền lợi", "tránh thanh toán", "chuyển quyền sở hữu"], 1, "Phân tích tình huống"),
      mcq(2, "Cách xử sự phù hợp đầu tiên của cửa hàng là", ["xóa thông tin đơn hàng", "từ chối mọi liên hệ", "kiểm tra chứng cứ và thực hiện chính sách", "công khai dữ liệu của M"], 2, "Quyền và nghĩa vụ"),
      essay(3, "Đề xuất cách giải quyết nếu hai bên chưa thống nhất, bảo đảm tôn trọng pháp luật và quyền lợi chính đáng.", "Lập luận pháp lý"),
    ],
  },
  "gdqp-10-v1": {
    title: "GDQP 10 · Ôn tập cuối HKI",
    questions: [
      inSection("mcq", mcq(1, "Hành vi nào dưới đây bị nghiêm cấm trong phòng, chống ma túy?", ["Trồng cây có chứa chất ma túy.", "Giáo dục pháp luật về phòng, chống ma túy.", "Tuyên truyền lối sống lành mạnh.", "Tham gia hoạt động ngoại khóa an toàn."], 0, "Phòng, chống ma túy")),
      inSection("mcq", mcq(2, "Lực lượng nào có trách nhiệm bảo vệ an ninh quốc gia theo nội dung bài học?", ["Cá nhân bất kỳ.", "Lực lượng chuyên trách và cơ quan chức năng.", "Chỉ nhà trường.", "Chỉ doanh nghiệp."], 1, "An ninh quốc gia")),
      inSection("essay", essay(1, "Các hành vi bị nghiêm cấm trong Luật ma túy (SGK).", "Phòng, chống ma túy")),
    ],
  },
  "physics-thpt-v1": {
    title: "Vật lý · Thí nghiệm và đơn vị",
    groupTitle: "Đo chuyển động thẳng", groupKind: "experiment", groupInstruction: "Dùng bảng đo để trả lời Câu 1–2; ghi đầy đủ đơn vị.",
    stimulus: [table([["Thời gian t (s)", "0", "1", "2", "3"], ["Vị trí x (m)", "0", "2", "4", "6"]])],
    questions: [
      mcq(1, "Chuyển động trong bảng gần đúng là", ["nhanh dần đều", "chậm dần đều", "thẳng đều", "dao động"], 2, "Thực hành"),
      short(2, "Tốc độ trung bình trong 3 giây là bao nhiêu m/s?", ["2", "2 m/s"], "Công thức và sai số"),
      essay(3, "Nêu cách biểu diễn bộ số liệu trên bằng đồ thị x–t.", "Đồ thị"),
    ],
  },
  "chemistry-thpt-v1": {
    title: "Hóa học · Chuỗi phản ứng và thí nghiệm",
    groupTitle: "Phản ứng của kim loại với axit", groupKind: "chemistry-experiment", groupInstruction: "Dùng dữ kiện chung và viết phương trình khi cần.",
    stimulus: [p("Cho 6,5 g Zn phản ứng hoàn toàn với dung dịch HCl dư. Khí sinh ra được thu ở điều kiện chuẩn quy ước của đề." )],
    questions: [
      mcq(1, "Khí sinh ra là", ["O₂", "Cl₂", "H₂", "CO₂"], 2, "Vô cơ"),
      mcq(2, "Hệ số của HCl trong phương trình cân bằng là", ["1", "2", "3", "4"], 1, "Phương trình phản ứng"),
      essay(3, "Viết phương trình hóa học và trình bày cách tính lượng khí sinh ra theo dữ kiện của đề.", "Bài toán hóa học"),
    ],
  },
  "primary-integrated-v1": {
    title: "Tiểu học · Bài học liên môn",
    groupTitle: "Đọc và khám phá khu vườn", groupKind: "illustrated-passage", groupInstruction: "Đọc đoạn văn ngắn rồi trả lời Câu 1–2.",
    stimulus: [p("Sáng chủ nhật, An cùng ông chăm sóc khu vườn. An tưới 6 luống rau, sau đó trồng thêm 4 cây hoa. Bạn nhớ khóa vòi nước để không lãng phí." )],
    questions: [
      mcq(1, "An đã tưới bao nhiêu luống rau?", ["4", "5", "6", "10"], 2, "Đọc hiểu"),
      mcq(2, "Việc khóa vòi nước thể hiện điều gì?", ["Tiết kiệm nước", "Sợ cây lớn", "Không thích làm vườn", "Muốn về sớm"], 0, "Hoạt động trải nghiệm"),
      short(3, "Tổng của 6 và 4 bằng bao nhiêu?", ["10", "mười"], "Toán"),
    ],
  },
  "literature-thpt-v1": {
    title: "Ngữ văn · Đọc hiểu và viết",
    groupTitle: "Văn bản đọc hiểu", groupKind: "reading-text", groupInstruction: "Đọc văn bản và trả lời Câu 1–2.",
    stimulus: [p("Buổi sớm, con đường nhỏ còn đọng hơi mưa. Một mầm cây nghiêng về phía ánh sáng, lặng lẽ lớn lên giữa khoảng sân quen thuộc. Người đi qua chậm bước, nhận ra rằng những đổi thay bền bỉ thường bắt đầu từ điều rất nhỏ." )],
    questions: [
      short(1, "Chỉ ra một hình ảnh thiên nhiên trong văn bản.", ["mầm cây", "hơi mưa", "ánh sáng"], "Đọc hiểu"),
      essay(2, "Nêu tác dụng của hình ảnh “mầm cây nghiêng về phía ánh sáng”.", "Đọc hiểu"),
      essay(3, "Viết một đoạn văn trình bày suy nghĩ về giá trị của những thay đổi nhỏ nhưng bền bỉ.", "Nghị luận xã hội"),
    ],
  },
});

const buildSections = (profileId: string, questions: Question[]) => {
  const profile = getSubjectProfile(profileId);
  const hasExplicitSections = questions.some((question) => Boolean(question.sectionId));
  return profile.sections.map((template, index) => ({
    id: `${profile.id}-${template.id}`,
    title: template.title,
    instruction: template.instruction,
    questionIds: hasExplicitSections
      ? questions.filter((question) => question.sectionId === template.id).map((question) => question.id)
      : index === 0 ? questions.slice(0, 2).map((question) => question.id) : index === profile.sections.length - 1 ? questions.slice(2).map((question) => question.id) : [],
  })).filter((section) => section.questionIds.length > 0);
};

export function createProfileSample(profileId: string, grade?: string): QuizDocument {
  const profile = getSubjectProfile(profileId);
  if (profile.id === "math-thpt-v1") {
    const quiz = structuredClone(demoQuiz);
    quiz.id = uid("sample");
    quiz.profile = makeProfileRef(profile.id, grade);
    quiz.sections = buildSections(profile.id, quiz.questions);
    quiz.groups = [];
    return quiz;
  }
  const definition = definitions()[profile.id] || definitions()["primary-integrated-v1"];
  const questions = structuredClone(definition.questions);
  let groups: QuizDocument["groups"] = [];
  if (definition.groups?.length) {
    groups = definition.groups.map((groupDefinition) => {
      const groupId = uid("group");
      const groupedQuestions = questions.filter((question) => groupDefinition.questionNumbers.includes(question.number));
      groupedQuestions.forEach((question) => { question.groupId = groupId; });
      return {
        id: groupId,
        title: groupDefinition.title,
        instruction: groupDefinition.instruction,
        stimulus: groupDefinition.stimulus,
        questionIds: groupedQuestions.map((question) => question.id),
        kind: groupDefinition.kind,
      };
    });
  } else if (definition.stimulus?.length) {
    const groupId = uid("group");
    const groupedIds = questions.slice(0, 2).map((question) => question.id);
    questions.slice(0, 2).forEach((question) => { question.groupId = groupId; });
    groups = [{ id: groupId, title: definition.groupTitle || "Dữ kiện chung", instruction: definition.groupInstruction, stimulus: definition.stimulus, questionIds: groupedIds, kind: definition.groupKind }];
  }
  const sections = buildSections(profile.id, questions);
  for (const section of sections) {
    for (const questionId of section.questionIds) {
      const question = questions.find((item) => item.id === questionId);
      if (question) question.sectionId = section.id;
    }
  }
  return {
    id: uid("sample"), title: definition.title, sourceFileName: `mau-${profile.id}.docx`, createdAt: new Date().toISOString(), questions, groups, sections,
    profile: makeProfileRef(profile.id, grade), warnings: [], settings: { theme: "light", revealMode: "step", hideAnswersInitially: true, ratio: "16:9" },
  };
}
