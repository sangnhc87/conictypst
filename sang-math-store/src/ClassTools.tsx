import React, { useState, useEffect, useRef } from "react";
import "./classTools.css";

type GameMode = any;

export function WheelOfNames({ game, onClose }: { game: GameMode; onClose: () => void }) {
  const [names, setNames] = useState("Nguyễn Văn A\nTrần Thị B\nLê Văn C\nPhạm Thị D\nHoàng Văn E");
  const [spin, setSpin] = useState(0);
  const [spinning, setSpinning] = useState(false);
  const [selected, setSelected] = useState("");
  
  const nameList = names.split("\n").map(n => n.trim()).filter(Boolean);

  const handleSpin = () => {
    if (spinning || nameList.length === 0) return;
    setSpinning(true);
    setSelected("");
    const extraSpin = 1440 + Math.floor(Math.random() * 360);
    setSpin(spin + extraSpin);
    
    setTimeout(() => {
      setSpinning(false);
      // Determine selected name based on angle
      const finalAngle = (spin + extraSpin) % 360;
      // Slice angle is 360 / nameList.length
      // The top pointer is at 0 degrees (or 270 deg depending on CSS)
      // We will just pick a random one directly and let CSS spin randomly.
      // Actually, a simpler way is to just pick random and rotate to it!
      const winningIndex = Math.floor(Math.random() * nameList.length);
      const sliceAngle = 360 / nameList.length;
      // Calculate rotation needed to land on winningIndex
      // If we want winningIndex to be at the top (which is -90deg or 270deg in normal CSS, or 0deg if we rotate origin)
      const targetRotation = 360 * 4 - (winningIndex * sliceAngle); // 4 full spins + offset
      setSpin(spin + targetRotation);
      setTimeout(() => setSelected(nameList[winningIndex]), 3000); // Wait for spin
    }, 10);
  };

  return (
    <div className="presenter class-tool tool-wheel">
      <header>
        <div><span>TIỆN ÍCH LỚP HỌC</span><h1>{game.name}</h1></div>
        <div className="presenter-actions">
          <button onClick={onClose}>Thoát <kbd>Esc</kbd></button>
        </div>
      </header>
      <main className="tool-stage">
        <aside className="tool-sidebar">
          <h2>Danh sách lớp ({nameList.length})</h2>
          <textarea 
            value={names} 
            onChange={(e) => setNames(e.target.value)}
            placeholder="Dán danh sách lớp vào đây, mỗi người 1 dòng..."
          />
        </aside>
        <section className="tool-main-area">
          <div className="wheel-container" onClick={handleSpin}>
            <div className="wheel" style={{ transform: `rotate(${spin}deg)`, transition: spinning ? "transform 3s cubic-bezier(0.2, 0.8, 0.2, 1)" : "none" }}>
              {nameList.map((name, i) => (
                <div key={i} className="wheel-slice" style={{ transform: `rotate(${i * (360 / nameList.length)}deg)` }}>
                  <span style={{ transform: `rotate(${180 / nameList.length}deg)` }}>{name}</span>
                </div>
              ))}
            </div>
            <div className="wheel-pointer">▼</div>
          </div>
          <div className="wheel-result">
            {selected ? <h2>{selected}</h2> : <span>Nhấn vào vòng quay để gọi tên</span>}
          </div>
        </section>
      </main>
    </div>
  );
}

export function Scoreboard({ game, onClose }: { game: GameMode; onClose: () => void }) {
  const [teams, setTeams] = useState([
    { id: 1, name: "Tổ 1", score: 0, color: "#ef4444" },
    { id: 2, name: "Tổ 2", score: 0, color: "#3b82f6" },
    { id: 3, name: "Tổ 3", score: 0, color: "#10b981" },
    { id: 4, name: "Tổ 4", score: 0, color: "#f59e0b" },
  ]);

  const updateScore = (id: number, delta: number) => {
    setTeams(teams.map(t => t.id === id ? { ...t, score: t.score + delta } : t));
  };

  return (
    <div className="presenter class-tool tool-scoreboard">
      <header>
        <div><span>TIỆN ÍCH LỚP HỌC</span><h1>{game.name}</h1></div>
        <div className="presenter-actions">
          <button onClick={() => setTeams(teams.map(t => ({ ...t, score: 0 })))}>Đặt lại</button>
          <button onClick={onClose}>Thoát <kbd>Esc</kbd></button>
        </div>
      </header>
      <main className="tool-stage">
        <div className="scoreboard-grid">
          {teams.map(team => (
            <div key={team.id} className="score-card" style={{ "--team-color": team.color } as React.CSSProperties}>
              <input value={team.name} onChange={(e) => setTeams(teams.map(t => t.id === team.id ? { ...t, name: e.target.value } : t))} />
              <div className="score-display">
                <button onClick={() => updateScore(team.id, -1)}>-</button>
                <h2>{team.score}</h2>
                <button onClick={() => updateScore(team.id, 1)}>+</button>
              </div>
              <div className="score-quick">
                <button onClick={() => updateScore(team.id, 5)}>+5</button>
                <button onClick={() => updateScore(team.id, 10)}>+10</button>
              </div>
            </div>
          ))}
        </div>
      </main>
    </div>
  );
}

export function ClassTimer({ game, onClose }: { game: GameMode; onClose: () => void }) {
  const [timeLeft, setTimeLeft] = useState(300); // 5 minutes
  const [initialTime, setInitialTime] = useState(300);
  const [isRunning, setIsRunning] = useState(false);
  const timerRef = useRef<number | null>(null);

  useEffect(() => {
    if (isRunning && timeLeft > 0) {
      timerRef.current = window.setTimeout(() => setTimeLeft(timeLeft - 1), 1000);
    } else if (timeLeft <= 0) {
      setIsRunning(false);
    }
    return () => {
      if (timerRef.current) clearTimeout(timerRef.current);
    };
  }, [isRunning, timeLeft]);

  const toggleTimer = () => setIsRunning(!isRunning);
  const resetTimer = () => { setIsRunning(false); setTimeLeft(initialTime); };
  
  const addTime = (seconds: number) => {
    setInitialTime(initialTime + seconds);
    setTimeLeft(timeLeft + seconds);
  };

  const minutes = Math.floor(timeLeft / 60);
  const seconds = timeLeft % 60;

  return (
    <div className="presenter class-tool tool-timer">
      <header>
        <div><span>TIỆN ÍCH LỚP HỌC</span><h1>{game.name}</h1></div>
        <div className="presenter-actions">
          <button onClick={onClose}>Thoát <kbd>Esc</kbd></button>
        </div>
      </header>
      <main className="tool-stage">
        <div className={`timer-display ${timeLeft <= 10 && timeLeft > 0 ? "urgent" : ""}`}>
          <h1>{String(minutes).padStart(2, "0")}:{String(seconds).padStart(2, "0")}</h1>
        </div>
        <div className="timer-controls">
          <button onClick={toggleTimer} className="primary">{isRunning ? "Tạm dừng" : "Bắt đầu"}</button>
          <button onClick={resetTimer}>Đặt lại</button>
        </div>
        <div className="timer-presets">
          <button onClick={() => addTime(60)}>+ 1 phút</button>
          <button onClick={() => addTime(300)}>+ 5 phút</button>
          <button onClick={() => addTime(-60)}>- 1 phút</button>
        </div>
      </main>
    </div>
  );
}

export function GroupDivider({ game, onClose }: { game: GameMode; onClose: () => void }) {
  const [names, setNames] = useState("Nguyễn Văn A\nTrần Thị B\nLê Văn C\nPhạm Thị D\nHoàng Văn E\nĐỗ Văn F\nNgô Thị G\nBùi Văn H");
  const [numGroups, setNumGroups] = useState(4);
  const [groups, setGroups] = useState<string[][]>([]);

  const handleDivide = () => {
    const list = names.split("\n").map(n => n.trim()).filter(Boolean);
    if (list.length === 0 || numGroups <= 0) return;
    
    // Fisher-Yates shuffle
    const shuffled = [...list];
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }

    const newGroups = Array.from({ length: numGroups }, () => [] as string[]);
    shuffled.forEach((name, i) => {
      newGroups[i % numGroups].push(name);
    });
    setGroups(newGroups);
  };

  return (
    <div className="presenter class-tool tool-group-divider">
      <header>
        <div><span>TIỆN ÍCH LỚP HỌC</span><h1>{game.name}</h1></div>
        <div className="presenter-actions">
          <button onClick={onClose}>Thoát <kbd>Esc</kbd></button>
        </div>
      </header>
      <main className="tool-stage">
        <aside className="tool-sidebar">
          <h2>Danh sách lớp</h2>
          <textarea 
            value={names} 
            onChange={(e) => setNames(e.target.value)}
            placeholder="Dán danh sách lớp vào đây..."
          />
          <div className="group-controls">
            <label>Số nhóm:</label>
            <input type="number" min="2" max="20" value={numGroups} onChange={(e) => setNumGroups(parseInt(e.target.value) || 2)} />
            <button className="primary" onClick={handleDivide}>Chia Nhóm Ngay</button>
          </div>
        </aside>
        <section className="tool-main-area">
          <div className="groups-grid">
            {groups.length === 0 ? (
              <div className="empty-groups">Nhấn "Chia Nhóm Ngay" để bắt đầu</div>
            ) : (
              groups.map((group, index) => (
                <div key={index} className="group-card">
                  <h3>Nhóm {index + 1}</h3>
                  <ul>
                    {group.map((member, i) => <li key={i}>{member}</li>)}
                  </ul>
                </div>
              ))
            )}
          </div>
        </section>
      </main>
    </div>
  );
}

