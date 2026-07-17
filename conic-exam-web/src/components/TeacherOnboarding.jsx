import { useMemo, useState } from 'react';
import { Button, Card, Modal, Notice, Pill } from './UI';
import { TEACHER_ONBOARDING_STEPS, teacherOnboardingState } from '../lib/onboarding';

const PUBLISH_COMMAND = `cd conic-exam-publisher
node bin/conic-exam-publish.mjs \\
  ../typst/dethi/de-mau-tu-do.typ \\
  --root .. \\
  --renderer typst/sang-exam.typ \\
  --strict \\
  --title "Đề mẫu tự do" \\
  --source-id "de-mau-tu-do" \\
  --version "1" \\
  --out ./.de-mau-tu-do`;
const STUDIO_TEMPLATE_URL = 'https://typstconichub.pages.dev/#studio?template=exam-online-demo';

export default function TeacherOnboarding({
  classrooms,
  exams,
  assignments,
  pendingStudents,
  stats,
  onCreateClass,
  onPublish,
  onCreateAssignment,
  onReviewMembers,
  onOpenResults,
}) {
  const state = useMemo(() => teacherOnboardingState({
    classrooms,
    exams,
    assignments,
    pendingStudents,
    stats,
  }), [classrooms, exams, assignments, pendingStudents, stats]);
  const [sampleOpen, setSampleOpen] = useState(false);
  const [sampleSource, setSampleSource] = useState('');
  const [sampleError, setSampleError] = useState('');
  const [sampleLoading, setSampleLoading] = useState(false);
  const [copied, setCopied] = useState(false);

  const firstClassroom = classrooms[0];
  const firstAssignment = assignments[0];

  async function openSample() {
    setSampleOpen(true);
    if (sampleSource || sampleLoading) return;
    setSampleLoading(true);
    setSampleError('');
    try {
      const module = await import('../../../typst/dethi/de-mau-tu-do.typ?raw');
      setSampleSource(module.default);
    } catch {
      setSampleError('Không thể nạp đề mẫu. Thầy/cô vẫn có thể dùng lệnh Publisher ở bên dưới.');
    } finally {
      setSampleLoading(false);
    }
  }

  function downloadSample() {
    if (!sampleSource) return;
    const url = URL.createObjectURL(new Blob([sampleSource], { type: 'text/plain;charset=utf-8' }));
    const anchor = document.createElement('a');
    anchor.href = url;
    anchor.download = 'de-mau-tu-do.typ';
    anchor.click();
    URL.revokeObjectURL(url);
  }

  async function copyCommand() {
    try {
      await navigator.clipboard.writeText(PUBLISH_COMMAND);
      setCopied(true);
      window.setTimeout(() => setCopied(false), 1800);
    } catch {
      setCopied(false);
    }
  }

  const stepContent = {
    classroom: {
      title: 'Tạo không gian lớp',
      text: 'Mỗi lớp có mã tham gia riêng. Học sinh nhập mã nhưng chưa được vào học cho tới khi thầy/cô duyệt.',
      action: <Button variant={state.nextStep === 'classroom' ? 'primary' : 'secondary'} onClick={onCreateClass}>+ Tạo lớp</Button>,
    },
    release: {
      title: 'Biên dịch và phát hành đề Typst',
      text: 'Dùng Publisher tạo conic-exam-package.json, kiểm tra cảnh báo rồi tải gói lên Kho đề. Đáp án sẽ được máy chủ tách riêng.',
      action: <><a className="button button--secondary" href={STUDIO_TEMPLATE_URL} target="_blank" rel="noreferrer">Mở mẫu trong Studio ↗</a><Button variant="secondary" onClick={openSample}>Xem nguồn</Button><Button variant={state.nextStep === 'release' ? 'primary' : 'secondary'} onClick={onPublish}>↑ Tải gói đề</Button></>,
    },
    assignment: {
      title: 'Giao đề thành một đợt thi',
      text: 'Chọn đề, lớp, giờ mở–đóng, thời lượng, số lượt và chính sách công bố điểm/lời giải.',
      action: <Button variant={state.nextStep === 'assignment' ? 'primary' : 'secondary'} onClick={onCreateAssignment} disabled={!classrooms.length || !exams.length}>+ Tạo đợt thi</Button>,
    },
    students: {
      title: 'Gửi mã và duyệt đúng học sinh',
      text: state.pendingStudentCount > 0 ? `Có ${state.pendingStudentCount} yêu cầu đang chờ. Chỉ học sinh được duyệt mới thấy đợt thi của lớp.` : 'Gửi mã lớp cho học sinh. Khi các em xin tham gia, yêu cầu sẽ xuất hiện ở tab Lớp học.',
      action: <><Button variant={state.pendingStudentCount ? 'primary' : 'secondary'} onClick={() => firstClassroom && onReviewMembers(firstClassroom)} disabled={!firstClassroom}>{state.pendingStudentCount ? `Duyệt ${state.pendingStudentCount} yêu cầu` : 'Mở thành viên'}</Button><a className="button button--secondary" href="/student">Trang học sinh</a></>,
    },
    results: {
      title: 'Theo dõi, chấm và công bố',
      text: 'Phần khách quan được chấm trên máy chủ. Thầy/cô mở từng bài để chấm tự luận, rồi công bố điểm/lời giải theo chính sách.',
      action: <Button variant={state.nextStep === 'results' ? 'primary' : 'secondary'} onClick={() => onOpenResults(firstAssignment?.id || '')} disabled={!firstAssignment}>Xem kết quả</Button>,
    },
  };

  return <div className="onboarding">
    <Card className="onboarding-welcome">
      <div>
        <p className="eyebrow">TRUNG TÂM BẮT ĐẦU</p>
        <h2>Từ tệp Typst đến một kỳ thi thật</h2>
        <p>Đi theo 5 bước dưới đây. Trạng thái được đánh dấu tự động từ dữ liệu thật trong không gian của thầy/cô.</p>
      </div>
      <div className="onboarding-progress" aria-label={`Đã hoàn thành ${state.completedCount} trên 5 bước`}>
        <strong>{state.progress}%</strong><span>{state.completedCount}/5 bước</span>
        <div><i style={{ width: `${state.progress}%` }} /></div>
      </div>
    </Card>

    <section className="tenant-explainer" aria-label="Cách dữ liệu giáo viên được tách biệt">
      <span className="tenant-explainer__icon">GV</span>
      <div><Pill tone="success">Không gian riêng theo giáo viên</Pill><h3>Mỗi giáo viên là một tenant độc lập</h3><p>Lớp, mã tham gia, học sinh, đề, khóa chấm, đợt thi và bài làm đều thuộc riêng tài khoản giáo viên. Chủ hệ thống cấp quyền thuê bao và xem số liệu vận hành; giáo viên khác không thể đọc hay sửa dữ liệu của nhau.</p></div>
      <div className="tenant-boundary"><span>Chủ hệ thống<small>Duyệt quyền · quota · nhật ký</small></span><b>→</b><span>Tenant giáo viên<small>Lớp · đề · bài làm riêng</small></span><b>→</b><span>Học sinh đã duyệt<small>Chỉ lớp của mình</small></span></div>
    </section>

    <div className="onboarding-steps">
      {TEACHER_ONBOARDING_STEPS.map((step, index) => {
        const content = stepContent[step.id];
        const done = state.completed[step.id];
        return <article key={step.id} className={`onboarding-step ${done ? 'is-done' : ''} ${state.nextStep === step.id ? 'is-next' : ''}`}>
          <span className="onboarding-step__number">{done ? '✓' : index + 1}</span>
          <div className="onboarding-step__body"><header><h3>{content.title}</h3>{done && <Pill tone="success">Đã xong</Pill>}{state.nextStep === step.id && <Pill tone="warning">Làm tiếp</Pill>}</header><p>{content.text}</p><div className="onboarding-step__actions">{content.action}</div></div>
        </article>;
      })}
    </div>

    <Card className="typst-pipeline">
      <header><div><p className="eyebrow">HÌNH, CÔNG THỨC VÀ ĐỒ THỊ TYPST</p><h2>Không chụp màn hình, vẫn giữ chất lượng vector</h2></div><Pill tone="info">Typst 0.14.2 → SVG</Pill></header>
      <div className="pipeline-diagram"><span><b>1</b>Nguồn `.typ`<small>Sang-Math, CeTZ, công thức</small></span><i>→</i><span><b>2</b>Publisher<small>Typst render từng câu</small></span><i>→</i><span><b>3</b>Gói an toàn<small>SVG gzip + khóa chấm riêng</small></span><i>→</i><span><b>4</b>Trang học sinh<small>Giải nén, lọc và hiển thị SVG</small></span></div>
      <Notice tone="info">Studio dùng Typst WASM để xem trước khi soạn. Bản phát hành chính thức hiện được Publisher biên dịch một lần bằng Typst CLI, rồi học sinh chỉ nhận SVG tự chứa — không nhận mã nguồn hay khóa đáp án. Vì vậy hình CeTZ và công thức vẫn sắc nét trên điện thoại mà máy học sinh không phải chạy WASM.</Notice>
      <div className="publisher-command"><div><strong>Lệnh chạy với đề mẫu đang mở</strong><small>Có thể sửa mẫu trên TypstConicHub Studio; đầu ra để tải lên là <code>.de-mau-tu-do/conic-exam-package.json</code>.</small></div><div className="publisher-command__actions"><a className="button button--secondary" href={STUDIO_TEMPLATE_URL} target="_blank" rel="noreferrer">Mở Studio ↗</a><Button variant="secondary" onClick={copyCommand}>{copied ? '✓ Đã sao chép' : 'Sao chép lệnh'}</Button></div><pre><code>{PUBLISH_COMMAND}</code></pre></div>
    </Card>

    <Notice tone="warning"><strong>Kiểm thử đúng vai trò:</strong> mở <code>/student</code> bằng một tài khoản Google khác hoặc cửa sổ ẩn danh, nhập mã lớp, sau đó quay lại tài khoản giáo viên để duyệt. Tài khoản chủ hệ thống mở trang Giáo viên chỉ để thử quy trình, không thay thế một học sinh thật.</Notice>

    <Modal open={sampleOpen} title="Đề mẫu · de-mau-tu-do.typ" onClose={() => setSampleOpen(false)} wide>
      <div className="sample-source-toolbar"><div><strong>Nguồn Sang-Math/Typst đầy đủ</strong><small>{sampleSource ? `${sampleSource.split('\n').length.toLocaleString('vi-VN')} dòng · ${(new Blob([sampleSource]).size / 1024).toFixed(1)} KiB` : 'Đang chuẩn bị…'}</small></div><div><a className="button button--secondary" href={STUDIO_TEMPLATE_URL} target="_blank" rel="noreferrer">Sửa trong Studio ↗</a><Button variant="secondary" onClick={downloadSample} disabled={!sampleSource}>Tải tệp `.typ`</Button></div></div>
      {sampleError && <Notice tone="danger">{sampleError}</Notice>}
      {sampleLoading ? <div className="panel-loading"><span className="spinner" />Đang nạp nguồn đề mẫu…</div> : sampleSource && <pre className="sample-source"><code>{sampleSource}</code></pre>}
      <footer className="modal-actions"><Button variant="secondary" onClick={() => setSampleOpen(false)}>Đóng</Button></footer>
    </Modal>
  </div>;
}
