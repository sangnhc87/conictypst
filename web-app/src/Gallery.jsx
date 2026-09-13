import React, { useMemo, useState, useEffect } from 'react';
import { Presentation, FolderLock, FileText, BookOpen, Clock, Sparkles, ChevronRight, Search, X, Compass } from 'lucide-react';

export default function Gallery({ items, recentItems = [], onSelect }) {
  const [selectedGrade, setSelectedGrade] = useState(12); // Default to Grade 12 as requested
  const [categoryFilter, setCategoryFilter] = useState('all'); // 'all', 'lesson', 'exam'
  const [selectedChapter, setSelectedChapter] = useState('all'); // 'all' or chapter number
  const [query, setQuery] = useState('');

  const availableGrades = useMemo(
    () => [...new Set(items.map(item => item.grade))].sort((a, b) => a - b),
    [items]
  );

  // Thống kê theo khối
  const gradeItems = useMemo(
    () => items.filter(item => item.grade === selectedGrade),
    [items, selectedGrade]
  );
  
  const lessonCount = useMemo(
    () => gradeItems.filter(item => item.type !== 'exam').length,
    [gradeItems]
  );
  
  const examCount = useMemo(
    () => gradeItems.filter(item => item.type === 'exam').length,
    [gradeItems]
  );

  // Danh sách các chương trong khối hiện tại
  const availableChapters = useMemo(() => {
    const chMap = new Map();
    gradeItems.forEach(item => {
      if (!chMap.has(item.chapter)) {
        chMap.set(item.chapter, item.chapterTitle);
      }
    });
    return Array.from(chMap.entries()).sort((a, b) => a[0] - b[0]);
  }, [gradeItems]);

  // Reset chapter filter when grade changes
  useEffect(() => {
    setSelectedChapter('all');
  }, [selectedGrade]);

  // Tìm theo tên bài/chương/mã đề, không phân biệt hoa thường hay dấu tiếng Việt
  const normalize = (value = '') =>
    value.toLocaleLowerCase('vi').normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  const normalizedQuery = normalize(query.trim());

  const filteredItems = gradeItems.filter(item => {
    if (categoryFilter === 'lesson' && item.type === 'exam') return false;
    if (categoryFilter === 'exam' && item.type !== 'exam') return false;
    if (selectedChapter !== 'all' && item.chapter !== Number(selectedChapter)) return false;
    if (!normalizedQuery) return true;
    return normalize(`${item.title} ${item.chapterTitle} ${item.code || ''}`).includes(normalizedQuery);
  });

  // Nhóm theo chương
  const chaptersMap = new Map();
  filteredItems.forEach(item => {
    if (!chaptersMap.has(item.chapter)) {
      chaptersMap.set(item.chapter, {
        title: item.chapterTitle,
        items: []
      });
    }
    chaptersMap.get(item.chapter).items.push(item);
  });

  const chapters = Array.from(chaptersMap.entries()).sort((a, b) => a[0] - b[0]);

  return (
    <div className="gallery-container">
      {/* Top Navigation Bar */}
      <nav className="beamer-topbar">
        <div className="beamer-brand">
          <span className="brand-icon">📺</span>
          <div>
            <span className="brand-name">SANG MATH</span>
            <span className="brand-sub">BEAMER PRESENTATION</span>
          </div>
        </div>
        <div className="beamer-nav-links">
          <a href="https://hdsd-conictypst.pages.dev/atlas" className="beamer-nav-btn primary" title="Mở Sang Math Atlas - 210 học liệu">
            <span>🗺️</span> Atlas 210 Học Liệu
          </a>
          <a href="https://hdsd-conictypst.pages.dev/khbd" className="beamer-nav-btn" title="Kế hoạch bài dạy & Ký sổ">
            <span>📅</span> Kế Hoạch Bài Dạy
          </a>
          <a href="https://hdsd-conictypst.pages.dev/conic-classroom" className="beamer-nav-btn" title="Mở ConicClassroom">
            <span>🏫</span> ConicClassroom
          </a>
          <a href="https://hdsd-conictypst.pages.dev/links" className="beamer-nav-btn" title="Cổng Web Links">
            <span>🌐</span> Cổng Tiện Ích
          </a>
        </div>
      </nav>

      {/* Hero Header */}
      <header className="gallery-header">
        <div className="eyebrow">
          <Sparkles size={14} className="eyebrow-icon" /> TOÁN THPT · HỆ THỐNG TRÌNH CHIẾU TƯƠNG TÁC SƯ PHẠM
        </div>
        <h1 className="hero-title">
          Kho Bài Giảng & <span className="gradient-orange">Bộ Đề Thực Chiến</span>
        </h1>
        <p className="hero-desc">
          Bộ học liệu trình chiếu chuẩn sách giáo khoa mới. Tích hợp bài giảng lý thuyết trực quan và hệ thống đề thi thực chiến 22 câu (trắc nghiệm, đúng/sai, trả lời ngắn) điều hướng ma trận thông minh.
        </p>

        {/* Highlight Stats Strip */}
        <div className="hero-stats-strip">
          <div className="stat-badge">
            <span className="stat-num">3</span> Khối Lớp (10 · 11 · 12)
          </div>
          <div className="stat-dot">•</div>
          <div className="stat-badge">
            <span className="stat-num">{items.length}</span> Học liệu số
          </div>
          <div className="stat-dot">•</div>
          <div className="stat-badge emerald">
            <span className="stat-num">76</span> Bài giảng lý thuyết
          </div>
          <div className="stat-dot">•</div>
          <div className="stat-badge orange">
            <span className="stat-num">223</span> Đề thi 22 câu
          </div>
        </div>
      </header>

      {/* Recently Viewed Strip (Nếu có) */}
      {recentItems.length > 0 && (
        <section className="recent-section">
          <div className="recent-header">
            <Clock size={16} className="recent-icon" />
            <span>Tiếp tục giảng dạy gần đây:</span>
          </div>
          <div className="recent-chips">
            {recentItems.map(rec => (
              <button 
                key={rec.id} 
                className={`recent-chip ${rec.type === 'exam' ? 'chip-exam' : 'chip-lesson'}`}
                onClick={() => onSelect(rec)}
              >
                <span className="chip-badge">{rec.type === 'exam' ? `ĐỀ K${rec.grade}` : `BÀI K${rec.grade}`}</span>
                <span className="chip-title">{rec.title}</span>
                <ChevronRight size={14} />
              </button>
            ))}
          </div>
        </section>
      )}

      {/* Grade Selector & Search Toolbar */}
      <div className="library-tools">
        <div className="tabs-container" role="tablist">
          {availableGrades.map(grade => {
            const count = items.filter(item => item.grade === grade).length;
            const isAct = selectedGrade === grade;
            return (
              <button 
                key={grade}
                role="tab"
                aria-selected={isAct}
                className={`tab-btn ${isAct ? 'active' : ''}`}
                onClick={() => {
                  setSelectedGrade(grade);
                  setCategoryFilter('all');
                }}
              >
                <span className="tab-label">Khối {grade}</span>
                <span className="tab-count">{count}</span>
              </button>
            );
          })}
        </div>

        <div className="search-box">
          <Search size={18} className="search-icon" />
          <input
            value={query}
            onChange={event => setQuery(event.target.value)}
            placeholder="Tìm bài học, chủ đề, mã đề thi (Mã 501, 101...)"
            aria-label="Tìm bài giảng hoặc đề thi"
          />
          {query && (
            <button type="button" onClick={() => setQuery('')} aria-label="Xóa tìm kiếm" className="clear-btn">
              <X size={16} />
            </button>
          )}
        </div>
      </div>

      {/* Quick Chapter Selector Bar */}
      {availableChapters.length > 1 && (
        <div className="chapter-filter-bar">
          <div className="chapter-filter-label">
            <Compass size={15} /> Nhảy nhanh đến chương:
          </div>
          <div className="chapter-pills-scroll">
            <button
              className={`chapter-pill ${selectedChapter === 'all' ? 'active' : ''}`}
              onClick={() => setSelectedChapter('all')}
            >
              Tất cả các chương ({gradeItems.length})
            </button>
            {availableChapters.map(([chNum, chTitle]) => {
              const chCount = gradeItems.filter(it => it.chapter === chNum).length;
              return (
                <button
                  key={chNum}
                  className={`chapter-pill ${selectedChapter === chNum ? 'active' : ''}`}
                  onClick={() => setSelectedChapter(chNum)}
                >
                  Chương {chNum} <span className="ch-pill-count">{chCount}</span>
                </button>
              );
            })}
          </div>
        </div>
      )}

      {/* Category Filter Pills (Tất cả / Bài giảng / Đề thi) */}
      <div className="category-filter-bar">
        <button
          className={`category-pill all-pill ${categoryFilter === 'all' ? 'active' : ''}`}
          onClick={() => setCategoryFilter('all')}
        >
          🌟 Tất cả học liệu ({gradeItems.length})
        </button>
        <button
          className={`category-pill lesson-pill ${categoryFilter === 'lesson' ? 'active' : ''}`}
          onClick={() => setCategoryFilter('lesson')}
        >
          <BookOpen size={16} />
          Bài giảng lý thuyết ({lessonCount})
        </button>
        <button
          className={`category-pill exam-pill ${categoryFilter === 'exam' ? 'active' : ''}`}
          onClick={() => setCategoryFilter('exam')}
        >
          <FileText size={16} />
          Bộ đề thực chiến 22 câu ({examCount})
        </button>
      </div>

      <div className="library-summary">
        Đang hiển thị <strong>{filteredItems.length}</strong> học liệu Khối {selectedGrade}
        {selectedChapter !== 'all' && <> thuộc <strong>Chương {selectedChapter}</strong></>}
        {categoryFilter === 'exam' && ' (Bộ đề 22 câu: 12 Trắc nghiệm · 4 Đúng/Sai · 6 Trả lời ngắn)'}
        {categoryFilter === 'lesson' && ' (Bài giảng trình chiếu lý thuyết & ví dụ minh họa)'}
        {normalizedQuery && <> khớp với từ khóa <strong>“{query}”</strong></>}
      </div>
      
      {/* Danh sách bài giảng theo từng chương */}
      {chapters.length === 0 ? (
        <div className="empty-state">
          <p>Không tìm thấy bài giảng hoặc đề thi nào phù hợp với tìm kiếm của thầy/cô.</p>
          <button className="reset-filter-btn" onClick={() => { setQuery(''); setCategoryFilter('all'); setSelectedChapter('all'); }}>
            Hiển thị lại tất cả học liệu Khối {selectedGrade}
          </button>
        </div>
      ) : (
        chapters.map(([chapterNum, chapterData]) => (
          <section key={chapterNum} id={`chapter-${chapterNum}`} className="chapter-section">
            <div className="chapter-header">
              <span className="chapter-badge">Chương {chapterNum}</span>
              <h2 className="chapter-title">{chapterData.title}</h2>
              <span className="chapter-items-count">{chapterData.items.length} bài & đề</span>
            </div>
            
            <div className="grid">
              {chapterData.items.map((item) => {
                const isExam = item.type === 'exam';
                const hasFile = !!item.file;
                return (
                  <article 
                    key={item.id} 
                    className={`card ${isExam ? 'card-exam' : 'card-lesson'} ${!hasFile ? 'card-disabled' : ''}`}
                    onClick={() => {
                      if (hasFile) onSelect(item);
                      else alert("Học liệu này đang được chuẩn bị bản trình chiếu!");
                    }}
                  >
                    <div className="card-top-header">
                      <div className="card-icon">
                        {isExam ? <FileText size={22} /> : (hasFile ? <Presentation size={22} /> : <FolderLock size={22} />)}
                      </div>
                      <span className={`card-badge ${isExam ? 'badge-exam' : 'badge-lesson'}`}>
                        {isExam ? `ĐỀ THI 22 CÂU · MÃ ${item.code || 'THI'}` : 'BÀI GIẢNG CHÍNH'}
                      </span>
                    </div>

                    <div className="card-content">
                      <h3 className="card-title">{item.title}</h3>
                      <p className="card-subtitle">
                        {isExam 
                          ? '12 Trắc nghiệm · 4 Đúng/Sai · 6 Trả lời ngắn' 
                          : (hasFile ? 'Bài giảng lý thuyết & ví dụ minh họa tương tác' : 'Bản trình chiếu đang được hoàn thiện')}
                      </p>
                    </div>

                    <div className="card-footer">
                      <span className={`card-action ${isExam ? 'action-exam' : 'action-lesson'}`}>
                        {isExam ? 'Trình chiếu đề thi (22 câu) →' : (hasFile ? 'Mở bài giảng trình chiếu →' : 'Đang cập nhật')}
                      </span>
                    </div>
                  </article>
                );
              })}
            </div>
          </section>
        ))
      )}
    </div>
  );
}

