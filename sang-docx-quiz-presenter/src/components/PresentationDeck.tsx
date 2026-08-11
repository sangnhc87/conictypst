import React, { useState, useEffect, useCallback } from 'react';
import type { QuizDocument } from '../models/quiz';
import { QuestionPlayer } from '../features/interaction/QuestionPlayer';
import { ClassroomTools } from './ClassroomTools';
import { TeachingWhiteboard } from './TeachingWhiteboard';

export type DeckTheme = 'light' | 'dark' | 'ocean' | 'mint' | 'sunset';

interface PresentationDeckProps {
  quiz: QuizDocument;
  onExit: () => void;
}

export function PresentationDeck({ quiz, onExit }: PresentationDeckProps) {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [theme, setTheme] = useState<DeckTheme>('light');
  const [showCatalog, setShowCatalog] = useState(false);
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [teacherCue, setTeacherCue] = useState(false);
  const [fontScale, setFontScale] = useState(1);
  const [whiteboardMode, setWhiteboardMode] = useState<'off' | 'overlay' | 'split'>('off');

  const total = quiz.questions.length;
  const currentQuestion = quiz.questions[currentIndex];
  const currentGroup = quiz.groups?.find((group) => group.id === currentQuestion?.groupId);
  const currentSection = quiz.sections?.find((section) => section.id === currentQuestion?.sectionId);

  const nextSlide = useCallback(() => {
    setCurrentIndex((prev) => Math.min(prev + 1, total - 1));
  }, [total]);

  const prevSlide = useCallback(() => {
    setCurrentIndex((prev) => Math.max(prev - 1, 0));
  }, []);

  const toggleFullscreen = useCallback(() => {
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen().then(() => setIsFullscreen(true)).catch(() => undefined);
    } else {
      document.exitFullscreen().then(() => setIsFullscreen(false)).catch(() => undefined);
    }
  }, []);

  useEffect(() => {
    const handleFullscreenChange = () => {
      setIsFullscreen(!!document.fullscreenElement);
    };
    document.addEventListener('fullscreenchange', handleFullscreenChange);
    return () => document.removeEventListener('fullscreenchange', handleFullscreenChange);
  }, []);

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      const target = e.target as Element | null;
      if (target?.closest('.teaching-whiteboard')) return;
      if (['INPUT', 'TEXTAREA'].includes((e.target as HTMLElement)?.tagName)) return;

      if (e.key === 'ArrowRight' || e.key === ' ' || e.key === 'PageDown') {
        e.preventDefault();
        nextSlide();
      } else if (e.key === 'ArrowLeft' || e.key === 'PageUp') {
        e.preventDefault();
        prevSlide();
      } else if (e.key === 'f' || e.key === 'F') {
        e.preventDefault();
        toggleFullscreen();
      } else if (e.key === 'm' || e.key === 'M') {
        e.preventDefault();
        setShowCatalog((prev) => !prev);
      } else if (e.key === 'k' || e.key === 'K') {
        e.preventDefault();
        setTeacherCue((prev) => !prev);
      } else if (e.key === 'w' || e.key === 'W') {
        e.preventDefault();
        setWhiteboardMode((current) => current === 'overlay' ? 'off' : 'overlay');
      } else if (e.key === 'b' || e.key === 'B') {
        e.preventDefault();
        setWhiteboardMode((current) => current === 'split' ? 'off' : 'split');
      } else if (e.key === 'Escape') {
        if (showCatalog) {
          setShowCatalog(false);
        } else {
          onExit();
        }
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [nextSlide, prevSlide, toggleFullscreen, showCatalog, onExit]);

  const progressPercent = total > 0 ? ((currentIndex + 1) / total) * 100 : 0;
  const isEnglishDeck = quiz.profile?.subject === 'Tiếng Anh';

  // Calculate secret answer LED index for 40-LED frame
  // Position 0 (A = 1st choice), Position 9 (B = 2nd choice), Position 19 (C = 3rd choice), Position 29 (D = 4th choice)
  let activeLedIndex = -1;
  if (currentQuestion?.type === 'single-choice' && currentQuestion.choices?.length) {
    activeLedIndex = currentQuestion.choices.findIndex((c) => c.isCorrect === true);
  }

  return (
    <div className={`deck-shell theme-${theme} ${isFullscreen ? 'is-fullscreen' : ''}`}>
      <ClassroomTools
        presentation={{
          theme,
          fontScale,
          catalogOpen: showCatalog,
          whiteboardMode,
          fullscreen: isFullscreen,
          isEnglish: isEnglishDeck,
          onThemeChange: setTheme,
          onDecreaseFont: () => setFontScale((prev) => Math.max(0.8, +(prev - 0.1).toFixed(1))),
          onIncreaseFont: () => setFontScale((prev) => Math.min(1.6, +(prev + 0.1).toFixed(1))),
          onToggleCatalog: () => setShowCatalog((current) => !current),
          onToggleOverlay: () => setWhiteboardMode((current) => current === 'overlay' ? 'off' : 'overlay'),
          onToggleSplitBoard: () => setWhiteboardMode((current) => current === 'split' ? 'off' : 'split'),
          onToggleFullscreen: toggleFullscreen,
          onExit,
        }}
      />
      {/* Top Progress Line */}
      <div className="deck-progress-track">
        <div className="deck-progress-bar" style={{ width: `${progressPercent}%` }} />
      </div>

      {/* Top Glassmorphism Control Bar */}
      <header className="deck-header">
        <div className="deck-brand">
            <span className="deck-logo">{quiz.profile?.subject === 'Tiếng Anh' ? 'A' : quiz.profile?.subject === 'Sinh học' ? '🧬' : quiz.profile?.subject === 'Ngữ văn' ? '❝' : quiz.profile?.subject === 'Tin học' ? '⌘' : '∑'}</span>
          <div className="deck-title-group">
            <h1 className="deck-title">{quiz.title || 'Bài Trình Chiếu'}</h1>
            <span className="deck-badge-count">
              {isEnglishDeck ? `Question ${currentIndex + 1} / ${total}` : `Câu ${currentIndex + 1} / ${total}`}
            </span>
          </div>
        </div>

      </header>

      {/* Edge LEDs for Secret Cue & Stage Effect */}
      <div className="ambient-led-top">
        {Array.from({ length: 40 }).map((_, i) => (
          <span key={i} className="led-bulb" />
        ))}
      </div>
      <div className="ambient-led-right">
        {Array.from({ length: 25 }).map((_, i) => (
          <span key={i + 40} className="led-bulb" />
        ))}
      </div>
      <div className="ambient-led-bottom">
        {Array.from({ length: 40 }).map((_, i) => {
          // Cue indices: A=1, B=10, C=20, D=30
          const cueMap = { 0: 1, 1: 10, 2: 20, 3: 30 } as Record<number, number>;
          const isCue = teacherCue && activeLedIndex !== null && cueMap[activeLedIndex] === i;
          return <span key={i + 65} className={`led-bulb ${isCue ? 'key-active' : ''}`} />;
        })}
      </div>
      <div className="ambient-led-left">
        {Array.from({ length: 25 }).map((_, i) => (
          <span key={i + 105} className="led-bulb" />
        ))}
      </div>

      {/* Main Slide Presentation Stage */}
      <main className={`deck-stage ${whiteboardMode === 'split' ? 'deck-stage-with-whiteboard' : ''}`}>
        <div className="deck-presentation-panel">
          {currentQuestion ? (
            <div className="deck-slide-card" key={currentQuestion.id}>
              <QuestionPlayer question={currentQuestion} questionGroup={currentGroup} section={currentSection} teaching={true} english={isEnglishDeck} profileId={quiz.profile?.id} fontSizeScale={fontScale} />
            </div>
          ) : (
            <div className="deck-empty">Không có dữ liệu câu hỏi.</div>
          )}
        </div>
        {whiteboardMode === 'split' && (
          <TeachingWhiteboard
            boardId={`free-board:${quiz.id}`}
            mode="split"
            label="Bảng trắng tự do"
            onClose={() => setWhiteboardMode('off')}
          />
        )}
      </main>

      {whiteboardMode === 'overlay' && currentQuestion && (
        <TeachingWhiteboard
          boardId={`slide-ink:${quiz.id}:${currentQuestion.id}`}
          mode="overlay"
          label={`Viết lên ${isEnglishDeck ? `Question ${currentIndex + 1}` : `Câu ${currentIndex + 1}`}`}
          onClose={() => setWhiteboardMode('off')}
        />
      )}

      {/* Bottom Floating Dock Navigation */}
      <footer className="deck-footer">
        <button className="deck-nav-btn" onClick={prevSlide} disabled={currentIndex === 0}>
          {isEnglishDeck ? '← Previous' : '← Câu trước'}
        </button>

        <div className="deck-dots-strip">
          {quiz.questions.map((q, idx) => (
            <button
              key={q.id}
              className={`deck-dot ${idx === currentIndex ? 'active' : ''}`}
              onClick={() => setCurrentIndex(idx)}
              title={`Nhảy tới Câu ${idx + 1}`}
            >
              {idx + 1}
            </button>
          ))}
        </div>

        <button className="deck-nav-btn" onClick={nextSlide} disabled={currentIndex === total - 1}>
          {isEnglishDeck ? 'Next →' : 'Câu tiếp →'}
        </button>
      </footer>

      {/* Hyperlink Jump-to-Slide Catalog Modal */}
      {showCatalog && (
        <div className="deck-modal-backdrop" onClick={() => setShowCatalog(false)}>
          <div className="deck-catalog-modal" onClick={(e) => e.stopPropagation()}>
            <div className="deck-modal-header">
              <h2>{isEnglishDeck ? `📋 Questions (${total})` : `📋 Danh Mục Câu Hỏi (${total} câu)`}</h2>
              <button className="deck-modal-close" onClick={() => setShowCatalog(false)}>
                ✕
              </button>
            </div>
            <div className="deck-catalog-grid">
              {quiz.questions.map((q, idx) => (
                <button
                  key={q.id}
                  className={`catalog-item ${idx === currentIndex ? 'active' : ''}`}
                  onClick={() => {
                    setCurrentIndex(idx);
                    setShowCatalog(false);
                  }}
                >
                  <span className="catalog-num">{isEnglishDeck ? 'Question' : 'Câu'} {q.number || idx + 1}</span>
                  <span className="catalog-type">
                    {q.type === 'single-choice'
                      ? 'Trắc nghiệm'
                      : q.type === 'true-false'
                      ? 'Đúng / Sai'
                      : q.type === 'short-answer'
                      ? 'Trả lời ngắn'
                      : 'Tự luận'}
                  </span>
                </button>
              ))}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
