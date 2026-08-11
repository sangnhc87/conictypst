import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import QuestionRenderer from '../components/QuestionRenderer';
import { Button, LoadingScreen, Notice, Pill } from '../components/UI';
import { Shell } from '../components/Shell';
import { createReleasePreview } from '../lib/releasePreview';

export default function DemoExam() {
  const [data, setData] = useState(null);
  const [error, setError] = useState('');
  const [answers, setAnswers] = useState({});

  useEffect(() => {
    let active = true;
    fetch('/demo-exam.json')
      .then((res) => {
        if (!res.ok) throw new Error('Không thể tải đề thi mẫu.');
        return res.json();
      })
      .then((json) => {
        if (active) {
          try {
            const releaseData = {
              id: 'demo-exam-2026',
              title: json.title || 'Đề thi mẫu (Góc nhìn Học sinh)',
              version: json.version || '1',
              maximumScore: json.maximumScore || 10,
              publicPackage: json,
            };
            setData(createReleasePreview(releaseData));
          } catch (e) {
            setError(e.message);
          }
        }
      })
      .catch((err) => {
        if (active) setError(err.message);
      });
    return () => { active = false; };
  }, []);

  function setAnswer(questionId, value) {
    setAnswers((current) => ({ ...current, [questionId]: value }));
  }

  if (error) {
    return (
      <div className="gate-screen">
        <span className="brand-mark">C</span>
        <h1>Lỗi tải đề thi</h1>
        <Notice tone="danger">{error}</Notice>
        <Link className="button button--primary" to="/">Quay về trang chủ</Link>
      </div>
    );
  }

  if (!data) return <LoadingScreen />;

  return (
    <Shell section="student">
      <div className="exam-player-header">
        <div className="exam-player-header__title">
          <h1>{data.title || 'Đề thi mẫu (Góc nhìn Học sinh)'}</h1>
          <p>
            <Pill tone="info">Demo</Pill> {data.publicItems.length} câu hỏi · {data.maximumScore || 10} điểm
          </p>
        </div>
        <div className="exam-player-header__clock">
          <strong>90:00</strong>
          <small>Thời gian ảo</small>
        </div>
      </div>
      
      <main className="exam-player-main">
        <div className="exam-player-scroll">
          <Notice tone="success">
            <strong>Đây là giao diện làm bài thực tế của Học sinh.</strong>
            <br />
            Bạn có thể thử chọn đáp án (A, B, C, D), điền Đúng/Sai hoặc gõ câu trả lời ngắn. Hình ảnh và công thức Toán được bóc tách từ file Typst và hiển thị dưới dạng Vector SVG và KaTeX siêu nét!
          </Notice>
          
          <div className="exam-items">
            {data.publicItems.map((item, index) => (
              <QuestionRenderer
                key={item.id}
                item={item}
                number={index + 1}
                value={item.type === 'ds' ? (answers[item.id] || []) : (answers[item.id] || '')}
                onChange={(value) => setAnswer(item.id, value)}
                disabled={false}
              />
            ))}
          </div>
          
          <div className="exam-player-end">
            <h2>Hết đề thi</h2>
            <p>Bài thi thực tế sẽ được tự động lưu lên máy chủ khi học sinh nộp.</p>
            <Link className="button button--secondary" to="/">Thoát chế độ Demo</Link>
          </div>
        </div>
      </main>
    </Shell>
  );
}
