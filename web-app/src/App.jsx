import React, { useState, useEffect } from 'react';
import Gallery from './Gallery';
import Presenter from './Presenter';

function App() {
  const [presentations, setPresentations] = useState([]);
  const [activePresentation, setActivePresentation] = useState(null);

  useEffect(() => {
    fetch('/data.json')
      .then(res => res.json())
      .then(data => setPresentations(data))
      .catch(err => console.error("Error loading presentations:", err));
  }, []);

  return (
    <>
      {activePresentation ? (
        <Presenter 
          url={activePresentation.file} 
          onClose={() => setActivePresentation(null)} 
        />
      ) : (
        <Gallery 
          items={presentations} 
          onSelect={setActivePresentation} 
        />
      )}
    </>
  );
}

export default App;
