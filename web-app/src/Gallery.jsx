import React, { useState } from 'react';
import { Presentation, FolderLock } from 'lucide-react';

export default function Gallery({ items, onSelect }) {
  const [selectedGrade, setSelectedGrade] = useState(12);

  // Lọc bài giảng theo khối lớp
  const filteredItems = items.filter(item => item.grade === selectedGrade);

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
        <h1>Thư Viện Bài Giảng Typst</h1>
        <p>Hệ thống trình chiếu bài giảng trực tuyến chất lượng cao</p>
      </div>

      {/* Thanh Tabs Khối Lớp */}
      <div className="tabs-container">
        {[10, 11, 12].map(grade => (
          <button 
            key={grade}
            className={`tab-btn ${selectedGrade === grade ? 'active' : ''}`}
            onClick={() => setSelectedGrade(grade)}
          >
            Khối {grade}
          </button>
        ))}
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
