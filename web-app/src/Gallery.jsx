import React, { useMemo, useState } from 'react';
import { Presentation, FolderLock } from 'lucide-react';

export default function Gallery({ items, onSelect }) {
  const [selectedGrade, setSelectedGrade] = useState(12);
  const [query, setQuery] = useState('');

  const availableGrades = useMemo(
    () => [...new Set(items.map(item => item.grade))].sort((a, b) => a - b),
    [items]
  );

  // Tìm theo tên bài/chương, không phân biệt hoa thường hay dấu tiếng Việt.
  const normalize = (value = '') =>
    value.toLocaleLowerCase('vi').normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  const normalizedQuery = normalize(query.trim());
  const filteredItems = items.filter(item => {
    if (item.grade !== selectedGrade) return false;
    if (!normalizedQuery) return true;
    return normalize(`${item.title} ${item.chapterTitle}`).includes(normalizedQuery);
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

  // Chuyển Map thành mảng và sắp xếp theo số chương
  const chapters = Array.from(chaptersMap.entries()).sort((a, b) => a[0] - b[0]);

  return (
    <div className="gallery-container">
      <div className="gallery-header">
        <div className="eyebrow">SANG MATH · THƯ VIỆN DÙNG NGAY</div>
        <h1>Kho bài giảng có sẵn cho giờ dạy</h1>
        <p>Chọn khối → chương → bài. Mở toàn màn hình và dùng phím mũi tên để trình chiếu.</p>
      </div>

      {/* Thanh Tabs Khối Lớp */}
      <div className="library-tools">
        <div className="tabs-container">
        {availableGrades.map(grade => (
          <button 
            key={grade}
            className={`tab-btn ${selectedGrade === grade ? 'active' : ''}`}
            onClick={() => setSelectedGrade(grade)}
          >
            Khối {grade} <span className="tab-count">{items.filter(item => item.grade === grade).length}</span>
          </button>
        ))}
        </div>
        <label className="search-box">
          <span aria-hidden="true">⌕</span>
          <input
            value={query}
            onChange={event => setQuery(event.target.value)}
            placeholder="Tìm bài hoặc chương…"
            aria-label="Tìm bài giảng"
          />
          {query && <button type="button" onClick={() => setQuery('')} aria-label="Xóa tìm kiếm">×</button>}
        </label>
      </div>

      <div className="library-summary">
        <strong>{filteredItems.length}</strong> bài giảng Khối {selectedGrade}
        {normalizedQuery && <> khớp với <strong>“{query}”</strong></>}
      </div>
      
      {/* Danh sách bài giảng theo từng chương */}
      {chapters.length === 0 ? (
        <div style={{ textAlign: 'center', color: 'var(--text-muted)', marginTop: '4rem' }}>
          <p>Chưa có bài giảng nào cho Khối {selectedGrade}.</p>
        </div>
      ) : (
        chapters.map(([chapterNum, chapterData]) => (
          <div key={chapterNum} className="chapter-section">
            <div className="chapter-header">
              <span className="chapter-badge">Chương {chapterNum}</span>
              <h2 className="chapter-title">{chapterData.title}</h2>
            </div>
            
            <div className="grid">
              {chapterData.items.map((item) => (
                <div 
                  key={item.id} 
                  className="card"
                  onClick={() => {
                    if (item.file) onSelect(item);
                    else alert("Bài giảng này đang được cập nhật!");
                  }}
                  style={{ opacity: item.file ? 1 : 0.6 }}
                >
                  <div className="card-icon" style={{ background: item.file ? 'rgba(6, 182, 212, 0.1)' : 'rgba(255,255,255,0.05)', color: item.file ? 'var(--accent)' : 'var(--text-muted)' }}>
                    {item.file ? <Presentation size={24} /> : <FolderLock size={24} />}
                  </div>
                  <div>
                    <h3 style={{ fontSize: '1.1rem' }}>{item.title}</h3>
                    <span className="card-action">{item.file ? 'Mở trình chiếu →' : 'Đang cập nhật'}</span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))
      )}
    </div>
  );
}
