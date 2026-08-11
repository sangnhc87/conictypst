import { useState } from 'react';
import type { Question, QuestionGroup, QuizSection } from '../../models/quiz';
import { isShortAnswerCorrect } from '../../utils/answer';
import { ContentRenderer } from '../../components/ContentRenderer';
import { choiceLayout } from '../../utils/choiceLayout';

interface QuestionPlayerProps {
  question: Question;
  teaching?: boolean;
  fontSizeScale?: number;
  questionGroup?: QuestionGroup;
  section?: QuizSection;
  english?: boolean;
  profileId?: string;
}

export function QuestionPlayer({ question, teaching = false, fontSizeScale = 1, questionGroup, section, english = false, profileId }: QuestionPlayerProps) {
  const [selected, setSelected] = useState<string>('');
  const [tf, setTf] = useState<Record<string, boolean>>({});
  const [short, setShort] = useState('');
  const [checked, setChecked] = useState(false);
  const [steps, setSteps] = useState(0);
  const literatureOpenReading = profileId === 'literature-thpt-v1' && question.type === 'short-answer' && question.sectionId === 'reading';
  const answerKnown = question.type === 'single-choice'
    ? Boolean(question.choices?.some((choice) => choice.isCorrect === true))
    : question.type === 'true-false'
    ? Boolean(question.statements?.length && question.statements.every((statement) => typeof statement.correctValue === 'boolean'))
    : question.type === 'short-answer'
    ? Boolean(question.shortAnswer?.acceptedAnswers.some(Boolean))
    : true;

  const reset = () => {
    setSelected('');
    setTf({});
    setShort('');
    setChecked(false);
    setSteps(0);
  };

  const playAudio = (isCorrect: boolean) => {
    const audio = new Audio(isCorrect ? '/sounds/correct.mp3' : '/sounds/incorrect.mp3');
    audio.play().catch(e => console.error("Audio play failed:", e));
  };

  const handleCheckAnswer = () => {
    if (checked) return; // Prevent multiple plays
    setChecked(true);
    if (!answerKnown) return;
    let isCorrect = false;
    if (question.type === 'single-choice') {
      const selectedChoice = question.choices?.find(c => c.id === selected);
      isCorrect = !!selectedChoice?.isCorrect;
    } else if (question.type === 'true-false') {
      let allCorrect = true;
      let hasAnswers = false;
      question.statements?.forEach(s => {
        if (tf[s.id] !== undefined) hasAnswers = true;
        if (tf[s.id] !== s.correctValue) allCorrect = false;
      });
      isCorrect = allCorrect && hasAnswers;
    } else if (question.type === 'short-answer') {
      isCorrect = isShortAnswerCorrect(short, question.shortAnswer?.acceptedAnswers || [], question.shortAnswer?.numericTolerance);
    }
    
    playAudio(isCorrect);
  };

  const isShortCorrect = checked && isShortAnswerCorrect(short, question.shortAnswer?.acceptedAnswers || [], question.shortAnswer?.numericTolerance);

  return (
    <div className="player" key={question.id} style={{ fontSize: `${fontSizeScale * 100}%` }}>
      <div className="question-heading">
        <div className="question-num-tag">
          <span className="q-num">{english ? 'Question' : 'Câu'} {question.number}</span>
          <span className="q-part-badge">
            {section?.title || (english
              ? (question.type === 'single-choice' ? 'Part I · Multiple choice' : question.type === 'true-false' ? 'Part II · True / False' : question.type === 'short-answer' ? 'Part III · Short answer' : 'Part IV · Essay')
              : (question.type === 'single-choice' ? 'Phần I · Trắc nghiệm' : question.type === 'true-false' ? 'Phần II · Đúng / Sai' : question.type === 'short-answer' ? 'Phần III · Trả lời ngắn' : 'Phần IV · Tự luận'))}
          </span>
          {question.title && <span className="question-sub-title"> · {question.title}</span>}
        </div>
        <small>{question.confidence === 'low' ? '⚠ Độ tin cậy thấp' : ''}</small>
      </div>

      {questionGroup && (
        <section className="shared-stimulus" style={{ margin: '0 0 16px', padding: '18px 20px', borderRadius: '14px', border: literatureOpenReading || profileId === 'literature-thpt-v1' ? '1px solid #fda4af' : '1px solid #bfdbfe', background: literatureOpenReading || profileId === 'literature-thpt-v1' ? 'linear-gradient(135deg,#fff1f2,#fff7ed)' : 'linear-gradient(135deg,#eff6ff,#f8fafc)' }}>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '10px', marginBottom: '7px' }}>
            <b style={{ color: profileId === 'literature-thpt-v1' ? '#be123c' : '#1d4ed8' }}>▣ {questionGroup.title}</b>
            <small style={{ color: '#64748b' }}>{english ? `Shared content · ${questionGroup.questionIds.length} questions` : `Dữ kiện chung · ${questionGroup.questionIds.length} câu`}</small>
          </div>
          {questionGroup.instruction && <p style={{ margin: '0 0 7px', fontSize: '.86em', fontWeight: 700, color: '#475569' }}>{questionGroup.instruction}</p>}
          <ContentRenderer blocks={questionGroup.stimulus} />
        </section>
      )}

      <div className="question-stem-wrapper">
        <ContentRenderer blocks={question.stem} />
      </div>

      {/* SINGLE CHOICE QUESTION TYPE */}
      {question.type === 'single-choice' && (
        <div className={`choices choice-layout-${choiceLayout(question, profileId)}`}>
          {question.choices?.map((c) => {
            const isPicked = selected === c.id;
            const isChoiceCorrect = c.isCorrect;

            let statusClass = '';
            if (isPicked) statusClass += ' picked';
            if (checked && answerKnown) {
              if (isChoiceCorrect) statusClass += ' correct-revealed';
              if (isPicked && !isChoiceCorrect) statusClass += ' wrong-revealed';
            }

            return (
              <button
                key={c.id}
                className={`choice ${statusClass}`}
                onClick={() => setSelected(c.id)}
              >
                <b className="choice-label">{c.label}.</b>
                <div className="choice-content">
                  <ContentRenderer blocks={c.content} />
                </div>
                {checked && answerKnown && isChoiceCorrect && <span className="choice-badge badge-correct">{english ? '✓ Correct answer' : '✓ Đáp án đúng'}</span>}
                {checked && answerKnown && isPicked && !isChoiceCorrect && <span className="choice-badge badge-wrong">{english ? '✕ Incorrect' : '✕ Chọn sai'}</span>}
              </button>
            );
          })}
        </div>
      )}

      {/* TRUE / FALSE QUESTION TYPE */}
      {question.type === 'true-false' && (
        <div className="tf-container">
          {question.statements?.map((s) => {
            const userVal = tf[s.id];
            const isRowAnswered = userVal !== undefined;
            const isRowCorrect = isRowAnswered && userVal === s.correctValue;

            let rowClass = '';
            if (checked && isRowAnswered) {
              rowClass = isRowCorrect ? 'tf-row-correct' : 'tf-row-wrong';
            }

            return (
              <div className={`statement ${rowClass}`} key={s.id}>
                <div className="statement-text">
                  <ContentRenderer blocks={s.content} />
                </div>
                <div className="tf-buttons">
                  <button
                    onClick={() => setTf({ ...tf, [s.id]: true })}
                    className={`tf-btn ${tf[s.id] === true ? 'active-true' : ''} ${checked && s.correctValue === true ? 'highlight-correct' : ''}`}
                  >
                    {english ? 'True' : 'Đúng'}
                  </button>
                  <button
                    onClick={() => setTf({ ...tf, [s.id]: false })}
                    className={`tf-btn ${tf[s.id] === false ? 'active-false' : ''} ${checked && s.correctValue === false ? 'highlight-correct' : ''}`}
                  >
                    {english ? 'False' : 'Sai'}
                  </button>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {/* SHORT ANSWER QUESTION TYPE */}
      {question.type === 'short-answer' && literatureOpenReading ? (
        <div className="essay-notice" style={{ borderColor: '#fda4af', background: '#fff1f2' }}>
          <p className="muted">✦ Câu trả lời mở — học sinh trình bày ý hiểu; giáo viên đối chiếu theo rubric, không chấm bằng một chuỗi đáp án cứng.</p>
        </div>
      ) : question.type === 'short-answer' && (
        <div className="short-input-group">
          <label className="short-input">
            <span className="short-label">{english ? 'Your answer:' : 'Đáp án của bạn:'}</span>
            <div className="short-field-wrap">
              <input
                value={short}
                onChange={(e) => setShort(e.target.value)}
                placeholder={english ? 'Type your answer…' : 'Nhập câu trả lời…'}
                className={`short-text-input ${checked ? (isShortCorrect ? 'input-ok' : 'input-bad') : ''}`}
              />
              {checked && (
                <strong className={`short-result-tag ${isShortCorrect ? 'ok' : 'bad'}`}>
                  {isShortCorrect ? (english ? '✓ Correct!' : '✓ Chính xác!') : `${english ? '✕ Incorrect' : '✕ Chưa chính xác'} (${english ? 'Answer' : 'Đáp án'}: ${question.shortAnswer?.acceptedAnswers?.join(', ') || 'N/A'})`}
                </strong>
              )}
            </div>
          </label>
        </div>
      )}

      {/* ESSAY QUESTION TYPE */}
      {question.type === 'essay' && (
        <div className="essay-notice">
          <p className="muted">📝 {english ? 'Essay question — discuss the solution together.' : 'Câu hỏi tự luận — Giáo viên và Học sinh cùng thảo luận lời giải.'}</p>
        </div>
      )}

      {/* PLAYER ACTIONS & STEP-BY-STEP SOLUTION */}
      <div className="player-controls">
        {!literatureOpenReading && !answerKnown && question.type !== 'essay' && (
          <div className="answer-unavailable">⚠ {english ? 'Answer key is not available yet.' : 'Câu này chưa có đáp án chắc chắn.'}</div>
        )}
        {question.type !== 'essay' && !literatureOpenReading && (
          <button className="player-btn btn-check" onClick={handleCheckAnswer}>
            {checked ? (english ? '✓ Checked' : '✓ Đã kiểm tra') : (english ? '✔ Check answer' : '✔ Kiểm tra đáp án')}
          </button>
        )}
        <button className="player-btn btn-reset" onClick={reset}>
          {english ? '↺ Try again' : '↺ Làm lại'}
        </button>

        {question.solution?.length ? (
          <button
            className="player-btn btn-solution"
            onClick={() => setSteps((prev) => (prev > 0 ? 0 : question.solution!.length))}
          >
            💡 {steps === 0 ? (english ? 'Show explanation' : 'Hiện lời giải') : (english ? 'Hide explanation' : 'Ẩn lời giải')}
          </button>
        ) : null}
      </div>

      {/* SOLUTION PANEL */}
      {question.solution?.length && steps > 0 ? (
        <div className="solution-panel-interactive">
          <div className="solution-head">
            <b>💡 {english ? 'Detailed explanation' : 'Lời giải chi tiết'}</b>
          </div>
          {question.solution.map((s) => (
            <div className="solution-step" key={s.id}>
              <div className="step-content">
                <ContentRenderer blocks={s.content} />
              </div>
            </div>
          ))}
        </div>
      ) : null}
    </div>
  );
}
