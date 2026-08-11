// @vitest-environment jsdom
import { describe,expect,it } from 'vitest';import { parseEnglishLines, parseEnglishStructuredHtml, parseLines } from '../features/question-parser/parser';
describe('parser câu hỏi tiếng Việt',()=>{
 it('nhận dạng Câu 1 và A B C D, tách đáp án',()=>{const r=parseLines(['Câu 1. Chọn số đúng','A. Một','B. Hai','C. Ba','D. Bốn','Đáp án: B']);expect(r.questions).toHaveLength(1);expect(r.questions[0].choices).toHaveLength(4);expect(r.questions[0].choices?.[1].isCorrect).toBe(true)});
 it('nhận dạng đúng sai a b c d',()=>{const r=parseLines(['Câu 2: Xét','a) Ý một','b) Ý hai','c) Ý ba','d) Ý bốn','Đáp án: Đ S Đ S']);expect(r.questions[0].type).toBe('true-false');expect(r.questions[0].statements?.map(x=>x.correctValue)).toEqual([true,false,true,false])});
 it('nhận dạng trả lời ngắn',()=>{const q=parseLines(['Bài 3. Tính','Đáp số: 12']).questions[0];expect(q.type).toBe('short-answer');expect(q.shortAnswer?.acceptedAnswers).toEqual(['12'])});
 it('nhận dạng tự luận và tách lời giải',()=>{const q=parseLines(['Câu 4) Chứng minh','Lời giải: Bước đầu','Bước tiếp']).questions[0];expect(q.type).toBe('essay');expect(q.solution).toHaveLength(2)});
 it('nhận dạng nhãn Question, Answer và Explanation của đề Tiếng Anh',()=>{const q=parseLines(['Question 5. Choose the best answer','A. who','B. which','C. when','D. where','Answer: A','Explanation: Relative pronoun for people.']).questions[0];expect(q.choices).toHaveLength(4);expect(q.choices?.[0].isCorrect).toBe(true);expect(q.solution).toHaveLength(1)});
 it('cảnh báo khi không có câu',()=>expect(parseLines(['Nội dung tự do']).warnings[0].message).toMatch(/Không tìm thấy/));
 it('nhận dạng đề Anh có phương án inline, bảng đáp án và nhóm dữ kiện chung',()=>{
   const r=parseEnglishLines([
     'Read the following advertisement from 1 to 6.',
     'A short shared advertisement.',
     'Question 1: A. wrong B. right C. late D. quiet',
     'Question 2: A. one B. two',
     'C. three D. four',
     'Read the following leaflet from 7 to 12.',
     'A shared leaflet.',
     'Question 7: A. one B. two C. three D. four',
     'ĐÁP ÁN THAM KHẢO',
     'Câu', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Đáp án', 'B', 'C', 'A', 'D', 'A', 'B', 'C', 'D', 'A', 'B',
     'LỜI GIẢI THAM KHẢO',
     'Câu 1: B. right',
     'Giải thích đáp án.'
   ]);
   expect(r.questions).toHaveLength(3);
   expect(r.questions[0].choices).toHaveLength(4);
   expect(r.questions[1].choices?.[2].content[0]).toMatchObject({ kind: 'paragraph', text: 'three' });
   expect(r.questions[0].choices?.[1].isCorrect).toBe(true);
   expect(r.questions[0].groupId).toBeTruthy();
   expect(r.groups?.[0].questionIds).toHaveLength(2);
   expect(r.questions[0].solution).toHaveLength(2);
 });
 it('giữ gạch chân trong DOCX khi tách câu và phương án',()=>{
   const r=parseEnglishStructuredHtml('<p><strong>1.</strong> Which word is different?</p><p><strong>A. </strong>avoid<u>ed</u> <strong>B. </strong>frighten<u>ed</u> <strong>C. </strong>attend<u>ed</u> <strong>D. </strong>suggest<u>ed</u></p>');
   expect(r.questions[0].choices?.[0].content[0]).toMatchObject({kind:'paragraph',text:'avoid<u>ed</u>'});
 });
 it('tách passage đặt sau phương án D bằng xuống dòng Word và đưa vào bảng chùm',()=>{
   const r=parseEnglishStructuredHtml('<p><strong>16.</strong> Notice?<br/><strong>A. </strong>one<br/><strong>B. </strong>two<br/><strong>C. </strong>three<br/><strong>D. </strong>fourDeepfake technology is a long passage with enough context to be moved into a shared group for the following question.</p><p><strong>17.</strong> A. appear B. appears C. appearing D. appeared</p>','english-10-hcm-v1');
   expect(r.questions[0].choices).toHaveLength(4);
   expect(r.groups?.[0].stimulus[0]).toMatchObject({kind:'paragraph',text:'Deepfake technology is a long passage with enough context to be moved into a shared group for the following question.'});
   expect(r.questions[1].groupId).toBeTruthy();
 });
});
