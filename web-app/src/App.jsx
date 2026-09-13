import React, { useState, useEffect } from 'react';
import Gallery from './Gallery';
import Presenter from './Presenter';

function App() {
  const [presentations, setPresentations] = useState([]);
  const [activePresentation, setActivePresentation] = useState(null);
  const [recentItems, setRecentItems] = useState(() => {
    try {
      const saved = localStorage.getItem('sang_math_recent_v2');
      return saved ? JSON.parse(saved) : [];
    } catch {
      return [];
    }
  });

  useEffect(() => {
    fetch('/data.json')
      .then(res => res.json())
      .then(data => setPresentations(data))
      .catch(err => console.error("Error loading presentations:", err));
  }, []);

  const handleSelect = (item) => {
    if (!item.file) {
      alert("Học liệu này đang được chuẩn bị!");
      return;
    }
    setActivePresentation(item);
    try {
      setRecentItems(prev => {
        const next = [item, ...prev.filter(x => x.id !== item.id)].slice(0, 4);
        localStorage.setItem('sang_math_recent_v2', JSON.stringify(next));
        return next;
      });
    } catch {}
  };

  return (
    <>
      {activePresentation ? (
        <Presenter 
          item={activePresentation}
          url={activePresentation.file} 
          onClose={() => setActivePresentation(null)} 
        />
      ) : (
        <Gallery 
          items={presentations} 
          recentItems={recentItems}
          onSelect={handleSelect} 
        />
      )}
    </>
  );
}

export default App;
