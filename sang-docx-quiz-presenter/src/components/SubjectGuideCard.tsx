import type { SubjectProfile } from '../config/subjectProfiles';
import { profileLevelLabel } from '../config/subjectProfiles';

type SubjectGuideCardProps = {
  profile: SubjectProfile;
  grade: string;
};

const guideFor = (profile: SubjectProfile) => {
  if (profile.subject === 'Tiếng Anh') return {
    steps: ['Chọn đúng cấu trúc tỉnh/khối', 'Nạp DOCX/PDF/ảnh', 'Rà passage, ảnh, đáp án', 'Trình chiếu hoặc xuất HTML'],
    note: 'Tiếng Anh phải giữ nguyên tiếng Anh, từ gạch chân, chỗ trống và ngữ liệu chung; AI chỉ hỗ trợ hậu xử lý, giáo viên vẫn duyệt trước khi dạy.',
  };
  if (profile.subject === 'Ngữ văn') return {
    steps: ['Chọn văn bản/thi phẩm nguồn', 'Rà 5 câu Đọc hiểu', 'Lập dàn ý + dẫn chứng', 'Chấm theo rubric mở'],
    note: 'Ngữ văn không có một đáp án duy nhất: văn bản nguồn, yêu cầu, hướng dẫn chấm và lời giải tham khảo được tách riêng để giáo viên dễ sửa, dạy và chấm.',
  };
  if (profile.subject === 'Tin học') return {
    steps: ['Chọn định hướng đề', 'Nạp DOCX/PDF/ảnh', 'Rà mã, bảng và đáp án', 'Trình chiếu hoặc giao thi online'],
    note: 'Tin học giữ nguyên mã Python/C++, SQL, HTML/CSS và dữ kiện chung. Phần Đúng/Sai được tách thành phần chung, Khoa học máy tính và Tin học ứng dụng; giáo viên kiểm tra lại mã trước khi dạy.',
  };
  if (profile.family === 'stem') return {
    steps: ['Chọn đúng khối', 'Nạp đề và dữ kiện', 'Kiểm tra công thức/hình', 'Trình chiếu hoặc xuất file'],
    note: 'Công thức, bảng, hình và các câu dùng chung dữ kiện cần được kiểm tra trực tiếp trước khi xuất.',
  };
  if (profile.family === 'primary') return {
    steps: ['Chọn lớp/chủ đề', 'Nạp phiếu hoặc đề', 'Kiểm tra hình và câu lệnh', 'Trình chiếu hoạt động'],
    note: 'Ưu tiên câu lệnh ngắn, hình lớn, màu sáng và hoạt động vừa sức học sinh tiểu học.',
  };
  return {
    steps: ['Chọn khối/chuyên đề', 'Nạp đề hoặc tư liệu', 'Rà nguồn và câu chùm', 'Trình chiếu, thảo luận'],
    note: 'Tư liệu, tình huống, bảng hoặc nguồn chung được giữ riêng để giáo viên dễ dẫn dắt thảo luận.',
  };
};

export function SubjectGuideCard({ profile, grade }: SubjectGuideCardProps) {
  const guide = guideFor(profile);
  return (
    <section className="subject-guide-card" aria-label={`Hướng dẫn ${profile.subject}`}>
      <div className="subject-guide-head">
        <div><span>▤ HƯỚNG DẪN CHUẨN</span><strong>{profile.subject} · {profileLevelLabel(profile, grade)}</strong></div>
        <small>{profile.sections.length} phần hỗ trợ</small>
      </div>
      <div className="subject-guide-steps">
        {guide.steps.map((step, index) => <div key={step}><b>{String(index + 1).padStart(2, '0')}</b><span>{step}</span></div>)}
      </div>
      <div className="subject-guide-structure"><b>Cấu trúc đang bật</b><div>{profile.sections.map((section) => <span key={section.id}>{section.title}</span>)}</div></div>
      <p>{guide.note}</p>
    </section>
  );
}
