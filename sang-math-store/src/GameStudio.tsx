import React, { useEffect, useMemo, useRef, useState } from "react";
import type { User } from "firebase/auth";
import katex from "katex";
import "katex/dist/katex.min.css";
import { downloadBlob, exportGameZip, importGameZip } from "./gameArchive";
import { importQuestionsFromFile } from "./gameImport";
import {
  createStarterProject,
  deleteGameProject,
  listGameProjects,
  saveGameProject,
  type GameProject,
  type GameQuestion,
} from "./gameDb";
import { listenGameUser, signInGameUser, signOutGameUser } from "./gameAuth";
import { WheelOfNames, Scoreboard, ClassTimer, GroupDivider } from "./ClassTools";
import "./gameStudio.css";

const letters = ["A", "B", "C", "D"];

type GameMode = {
  id: "trieu-phu" | "dua-doi" | "manh-ghep" | "san-kho-bau" | "vong-quay" | "do-min" | "doan-tau" | "ban-co" | "ghep-cap" | "hop-qua" | "bingo" | "ten-lua" | "vuot-song" | "giai-cuu" | "nong-trai" | "rung-chuong" | "bong-da" | "olympia" | "goi-ten" | "bang-diem" | "dong-ho" | "chia-nhom";
  accessKey: string;
  productId: string;
  name: string;
  eyebrow: string;
  tagline: string;
  icon: string;
};

const GAME_MODES: Record<string, GameMode> = {
  "trieu-phu": { id: "trieu-phu", accessKey: "trieu-phu-tri-thuc", productId: "trieu-phu-tri-thuc", name: "Triệu Phú Tri Thức", eyebrow: "15 nấc thang", tagline: "Chinh phục từng nấc thang kiến thức", icon: "15" },
  "dua-doi": { id: "dua-doi", accessKey: "dua-doi-tri-thuc", productId: "dua-doi-tri-thuc", name: "Đường Đua Tri Thức", eyebrow: "Thi đấu hai đội", tagline: "Trả lời đúng để đưa đội mình về đích", icon: "↠" },
  "manh-ghep": { id: "manh-ghep", accessKey: "manh-ghep-bi-an", productId: "manh-ghep-bi-an", name: "Mảnh Ghép Bí Ẩn", eyebrow: "Khám phá hình ảnh", tagline: "Mỗi đáp án đúng mở một phần bí mật", icon: "▦" },
  "san-kho-bau": { id: "san-kho-bau", accessKey: "san-kho-bau", productId: "san-kho-bau", name: "Hành Trình Kho Báu", eyebrow: "Phiêu lưu theo chặng", tagline: "Vượt thử thách và thu thập kho báu tri thức", icon: "◆" },
  "vong-quay": { id: "vong-quay", accessKey: "vong-quay-thu-thach", productId: "vong-quay-thu-thach", name: "Vòng Quay Thử Thách", eyebrow: "Chọn câu ngẫu nhiên", tagline: "Quay nhanh, gọi vui, cả lớp cùng tham gia", icon: "◉" },
  "do-min": { id: "do-min", accessKey: "do-min-toan-hoc", productId: "do-min-toan-hoc", name: "Dò Mìn Toán Học", eyebrow: "Ba mạng sinh tồn", tagline: "Giải đúng để mở đường an toàn qua ma trận", icon: "✦" },
  "doan-tau": { id: "doan-tau", accessKey: "doan-tau-logic", productId: "doan-tau-logic", name: "Đoàn Tàu Logic", eyebrow: "Lắp toa bằng kiến thức", tagline: "Mỗi đáp án đúng nối thêm một toa về đích", icon: "▰" },
  "ban-co": { id: "ban-co", accessKey: "ban-co-thu-thach", productId: "ban-co-thu-thach", name: "Bàn Cờ Thử Thách", eyebrow: "Hai người chơi theo lượt", tagline: "Trả lời đúng, tung xúc xắc và vượt chướng ngại", icon: "⚄" },
  "ghep-cap": { id: "ghep-cap", accessKey: "ghep-cap-than-toc", productId: "ghep-cap-than-toc", name: "Ghép Cặp Thần Tốc", eyebrow: "Nối câu hỏi với đáp án", tagline: "Tìm đúng từng cặp trước khi cả lớp hết giờ", icon: "↔" },
  "hop-qua": { id: "hop-qua", accessKey: "hop-qua-bi-mat", productId: "hop-qua-bi-mat", name: "Hộp Quà Bí Mật", eyebrow: "Mở quà nhận sao", tagline: "Mỗi câu đúng mở một phần thưởng bất ngờ", icon: "▣" },
  "bingo": { id: "bingo", accessKey: "bingo-toan-hoc", productId: "bingo-toan-hoc", name: "Bingo Toán Học", eyebrow: "Cả lớp cùng săn hàng", tagline: "Đánh dấu ô đúng và chinh phục bảng Bingo", icon: "B" },
  "ten-lua": { id: "ten-lua", accessKey: "ten-lua-tri-thuc", productId: "ten-lua-tri-thuc", name: "Tên Lửa Tri Thức", eyebrow: "Phóng lên từng chặng", tagline: "Nạp năng lượng bằng đáp án đúng để chạm quỹ đạo", icon: "↑" },
  "vuot-song": { id: "vuot-song", accessKey: "vuot-song-thu-thach", productId: "vuot-song-thu-thach", name: "Vượt Sông Thử Thách", eyebrow: "Bắc cầu bằng kiến thức", tagline: "Mỗi câu đúng đặt thêm một nhịp cầu an toàn", icon: "≈" },
  "giai-cuu": { id: "giai-cuu", accessKey: "giai-cuu-thu-cung", productId: "giai-cuu-thu-cung", name: "Giải Cứu Thú Cưng", eyebrow: "Mở khóa lồng phép", tagline: "Giải đố để giải cứu thú cưng dễ thương", icon: "♥" },
  "nong-trai": { id: "nong-trai", accessKey: "nong-trai-vui-ve", productId: "nong-trai-vui-ve", name: "Nông Trại Vui Vẻ", eyebrow: "Trồng cây thu hoạch", tagline: "Giải bài tập để nuôi dưỡng nông trại", icon: "✿" },
  "rung-chuong": { id: "rung-chuong", accessKey: "rung-chuong-vang", productId: "rung-chuong-vang", name: "Rung Chuông Vàng", eyebrow: "Đấu trường toàn lớp", tagline: "Học sinh ghi bảng, trả lời để bám trụ đến cùng", icon: "🔔" },
  "bong-da": { id: "bong-da", accessKey: "bong-da-luan-luu", productId: "bong-da-luan-luu", name: "Bóng Đá Luân Lưu", eyebrow: "Hai đội sút phạt", tagline: "Đáp án đúng là một cú sút tung lưới đối phương", icon: "⚽" },
  "olympia": { id: "olympia", accessKey: "olympia", productId: "olympia", name: "Đường Lên Đỉnh Olympia", eyebrow: "Leo núi trí tuệ", tagline: "4 đội thi đấu, chia thành nhiều chặng kịch tính", icon: "🏔️" },
  "goi-ten": { id: "goi-ten", accessKey: "goi-ten", productId: "goi-ten", name: "Vòng Quay Gọi Tên", eyebrow: "Tiện ích lớp học", tagline: "Dán danh sách lớp và gọi tên ngẫu nhiên", icon: "🎡" },
  "bang-diem": { id: "bang-diem", accessKey: "bang-diem", productId: "bang-diem", name: "Bảng Điểm Thi Đua", eyebrow: "Tiện ích lớp học", tagline: "Cộng trừ điểm thi đua ngay trên màn hình", icon: "📊" },
  "dong-ho": { id: "dong-ho", accessKey: "dong-ho", productId: "dong-ho", name: "Bộ Đếm Thời Gian", eyebrow: "Tiện ích lớp học", tagline: "Đếm ngược làm việc nhóm, kiểm tra", icon: "⏳" },
  "chia-nhom": { id: "chia-nhom", accessKey: "chia-nhom", productId: "chia-nhom", name: "Chia Nhóm Tự Động", eyebrow: "Tiện ích lớp học", tagline: "Chia học sinh thành các nhóm ngẫu nhiên", icon: "👥" },
};

const gameSlug = window.location.pathname.split("/").filter(Boolean)[1] || "trieu-phu";
const ACTIVE_GAME = GAME_MODES[gameSlug] || GAME_MODES["trieu-phu"];

type AccountEntitlement = { accessKey: string; productId: string; expiresAt?: string | null };
type AccountTrial = { accessKey: string; startedAt: string; expiresAt: string; active: boolean };

function safeFileName(value: string) {
  return value.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "") || "trieu-phu";
}

function MathContent({ text, block = false }: { text: string; block?: boolean }) {
  const parts = String(text || "").split(/(\$\$[\s\S]+?\$\$|\$[^$\n]+?\$)/g).filter(Boolean);
  const Wrapper = block ? "div" : "span";
  return <Wrapper className={block ? "math-content block" : "math-content"}>{parts.map((part, index) => {
    const display = part.startsWith("$$") && part.endsWith("$$");
    const inline = !display && part.startsWith("$") && part.endsWith("$");
    if (!display && !inline) return <span key={index}>{part}</span>;
    const source = part.slice(display ? 2 : 1, display ? -2 : -1);
    const html = katex.renderToString(source, { throwOnError: false, displayMode: display, strict: "ignore" });
    return <span key={index} className={display ? "formula display" : "formula"} dangerouslySetInnerHTML={{ __html: html }} />;
  })}</Wrapper>;
}

function MillionairePresenter({ project, onClose }: { project: GameProject; onClose: () => void }) {
  const [index, setIndex] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [revealed, setRevealed] = useState(false);
  const [hidden, setHidden] = useState<number[]>([]);
  const [seconds, setSeconds] = useState(45);
  const question = project.questions[index];
  const finished = index >= project.questions.length;

  useEffect(() => {
    if (finished || revealed) return;
    const timer = window.setInterval(() => setSeconds((value) => Math.max(0, value - 1)), 1000);
    return () => window.clearInterval(timer);
  }, [finished, index, revealed]);

  useEffect(() => {
    const onKey = (event: KeyboardEvent) => {
      if (event.key === "Escape") onClose();
      if (!finished && ["1", "2", "3", "4"].includes(event.key)) setSelected(Number(event.key) - 1);
      if (event.key === "Enter" && selected !== null) {
        if (!revealed) setRevealed(true);
        else if (index + 1 < project.questions.length) { setIndex(index + 1); setSelected(null); setRevealed(false); setHidden([]); setSeconds(45); }
        else setIndex(project.questions.length);
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [finished, index, onClose, project.questions.length, revealed, selected]);

  const fiftyFifty = () => {
    if (!question) return;
    const wrong = [0, 1, 2, 3].filter((answer) => answer !== question.correct);
    setHidden(wrong.sort(() => Math.random() - .5).slice(0, 2));
  };

  const advance = () => {
    if (selected === null) return;
    if (!revealed) { setRevealed(true); return; }
    if (index + 1 >= project.questions.length) { setIndex(project.questions.length); return; }
    setIndex(index + 1); setSelected(null); setRevealed(false); setHidden([]); setSeconds(45);
  };

  return <div className="presenter" style={{ "--game-primary": project.primary, "--game-accent": project.accent } as React.CSSProperties}>
    <header><div><span>TRIỆU PHÚ TRI THỨC</span><h1>{project.name}</h1></div><div className="presenter-actions"><button onClick={fiftyFifty} disabled={finished || hidden.length > 0}>50:50</button><button onClick={onClose}>Thoát <kbd>Esc</kbd></button></div></header>
    {finished ? <section className="game-finish"><div className="finish-orbit">★</div><span>HOÀN THÀNH</span><h2>Chúc mừng!</h2><p>Bạn đã đi qua {project.questions.length} nấc thang tri thức.</p><button onClick={() => { setIndex(0); setSelected(null); setRevealed(false); setHidden([]); setSeconds(45); }}>Chơi lại</button></section> : <main className="presenter-stage">
      <aside className="money-ladder">{Array.from({ length: Math.max(15, project.questions.length) }, (_, position) => Math.max(15, project.questions.length) - position).map((level) => <div key={level} className={question?.level === level ? "current" : level <= question?.level ? "passed" : ""}><span>{String(level).padStart(2, "0")}</span><b>{level % 5 === 0 ? "◆" : "·"}</b></div>)}</aside>
      <section className="question-stage">
        <div className="game-status"><span>CÂU {index + 1}/{project.questions.length}</span><b className={seconds <= 10 ? "urgent" : ""}>{seconds}s</b></div>
        {question.image && <img className="question-image" src={question.image} alt="Minh họa câu hỏi" />}
        <div className="question-box"><MathContent text={question.prompt} block /></div>
        <div className="answer-grid">{question.answers.map((answer, answerIndex) => {
          const state = revealed && answerIndex === question.correct ? "correct" : revealed && answerIndex === selected ? "wrong" : selected === answerIndex ? "selected" : "";
          return <button key={answerIndex} className={`${state} ${hidden.includes(answerIndex) ? "eliminated" : ""}`} disabled={revealed || hidden.includes(answerIndex)} onClick={() => setSelected(answerIndex)}><span>{letters[answerIndex]}</span><MathContent text={answer} /></button>;
        })}</div>
        {revealed && <div className="answer-explanation"><b>{selected === question.correct ? "Chính xác!" : `Đáp án đúng: ${letters[question.correct]}`}</b><MathContent text={question.explanation} /></div>}
        <button className="lock-answer" disabled={selected === null} onClick={advance}>{revealed ? index + 1 === project.questions.length ? "Xem kết quả" : "Câu tiếp theo" : "Chốt đáp án"}<span>↵</span></button>
      </section>
    </main>}
  </div>;
}

function AdventurePresenter({ project, game, onClose }: { project: GameProject; game: GameMode; onClose: () => void }) {
  const [index, setIndex] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [revealed, setRevealed] = useState(false);
  const [points, setPoints] = useState(0);
  const [team, setTeam] = useState<"A" | "B" | "C" | "D">("A");
  const [teamScores, setTeamScores] = useState({ A: 0, B: 0, C: 0, D: 0 });
  const [spin, setSpin] = useState(0);
  const [lives, setLives] = useState(3);
  const [player, setPlayer] = useState<0 | 1>(0);
  const [playerPositions, setPlayerPositions] = useState<[number, number]>([0, 0]);
  const [dice, setDice] = useState(1);
  const question = project.questions[index];
  const finished = index >= project.questions.length || (game.id === "do-min" && lives <= 0 && !revealed);
  const isCorrect = selected === question?.correct;

  const reveal = () => {
    if (selected === null || revealed) return;
    setRevealed(true);
    if (selected === question.correct) {
      setPoints((value) => value + 1);
      if (game.id === "dua-doi" || game.id === "bong-da" || game.id === "olympia") setTeamScores((value) => ({ ...value, [team]: value[team] + 1 }));
      if (game.id === "ban-co") {
        const roll = 1 + Math.floor(Math.random() * 6);
        setDice(roll);
        setPlayerPositions((value) => value.map((position, positionIndex) => positionIndex === player ? Math.min(19, position + roll) : position) as [number, number]);
      }
    } else if (game.id === "do-min") {
      setLives((value) => Math.max(0, value - 1));
    }
  };

  const advance = () => {
    if (!revealed) { reveal(); return; }
    if (index + 1 >= project.questions.length) { setIndex(project.questions.length); return; }
    setIndex((value) => value + 1);
    setSelected(null); setRevealed(false);
    if (game.id === "dua-doi" || game.id === "bong-da") setTeam((value) => value === "A" ? "B" : "A");
    if (game.id === "olympia") setTeam((value) => value === "A" ? "B" : value === "B" ? "C" : value === "C" ? "D" : "A");
    if (game.id === "ban-co") setPlayer((value) => value === 0 ? 1 : 0);
    if (game.id === "vong-quay") setSpin((value) => value + 720 + Math.floor(Math.random() * 270));
  };

  useEffect(() => {
    const onKey = (event: KeyboardEvent) => {
      if (event.key === "Escape") onClose();
      if (!finished && ["1", "2", "3", "4"].includes(event.key)) setSelected(Number(event.key) - 1);
      if (event.key === "Enter" && selected !== null) advance();
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  });

  const puzzleImage = project.questions.find((item) => item.image)?.image;
  const renderVisual = () => {
    if (game.id === "dua-doi") return <div className="race-board"><div className="race-score"><b>ĐỘI A · {teamScores.A}</b><span>LƯỢT ĐỘI {team}</span><b>ĐỘI B · {teamScores.B}</b></div><div className="race-track"><i style={{ left: `${10 + Math.min(80, teamScores.A * 13)}%` }}>A</i><em></em><i style={{ right: `${10 + Math.min(80, teamScores.B * 13)}%` }}>B</i></div></div>;
    if (game.id === "manh-ghep") return <div className="puzzle-board" style={puzzleImage ? { backgroundImage: `url(${puzzleImage})` } : undefined}>{Array.from({ length: 12 }, (_, tile) => <i key={tile} className={tile < points ? "open" : ""}>{tile < points ? "" : tile + 1}</i>)}</div>;
    if (game.id === "san-kho-bau") return <div className="treasure-board">{Array.from({ length: Math.max(8, project.questions.length) }, (_, step) => <i key={step} className={step < points ? "passed" : step === points ? "current" : ""}>{step === Math.max(8, project.questions.length) - 1 ? "◆" : step + 1}</i>)}</div>;
    if (game.id === "vong-quay") return <div className="wheel-board"><div className="challenge-wheel" style={{ transform: `rotate(${spin}deg)` }}><span>A</span><span>B</span><span>C</span><span>D</span></div><b>{points} điểm</b></div>;
    if (game.id === "do-min") return <div className="mine-board"><div className="mine-lives"><b>{"♥".repeat(lives)}</b><span>{3 - lives} lần chạm mìn</span></div><div>{Array.from({ length: 20 }, (_, tile) => <i key={tile} className={tile < points ? "safe" : tile < points + (3 - lives) ? "mine" : ""}>{tile < points ? "✓" : tile < points + (3 - lives) ? "✹" : "?"}</i>)}</div></div>;
    if (game.id === "doan-tau") return <div className="train-board"><div className="train-line"></div><b className="locomotive">S</b>{project.questions.map((item, car) => <i key={item.id} className={car < points ? "joined" : ""}>{car + 1}</i>)}</div>;
    if (game.id === "hop-qua") return <div className="gift-board">{project.questions.slice(0, 12).map((item, box) => <i key={item.id} className={box < points ? "open" : box === points ? "current" : ""}><b>{box < points ? `${1 + (item.id.charCodeAt(0) % 3)}★` : "?"}</b><span>Hộp {box + 1}</span></i>)}</div>;
    if (game.id === "bingo") return <div className="bingo-board"><b>BINGO</b><div>{Array.from({ length: 16 }, (_, tile) => <i key={tile} className={tile < points ? "marked" : ""}>{tile < points ? "✓" : tile + 1}</i>)}</div><span>{points >= 4 ? "ĐÃ CÓ MỘT HÀNG!" : `${Math.max(0, 4 - points)} ô nữa để có hàng đầu tiên`}</span></div>;
    if (game.id === "ten-lua") return <div className="rocket-board"><div><i style={{ bottom: `${Math.min(82, 8 + (points / Math.max(1, project.questions.length)) * 74)}%` }}>↑</i>{Array.from({ length: 6 }, (_, step) => <span key={step} style={{ bottom: `${step * 16}%` }}>{step + 1}</span>)}</div><b>{Math.round((points / Math.max(1, project.questions.length)) * 100)}% năng lượng</b></div>;
    if (game.id === "vuot-song") return <div className="river-board"><div className="river-water">≈ ≋ ≈ ≋ ≈</div><div className="river-path">{Array.from({ length: Math.max(8, project.questions.length) }, (_, stone) => <i key={stone} className={stone < points ? "safe" : stone === points ? "current" : ""}>{stone < points ? "✓" : stone + 1}</i>)}</div><b>{points ? `Đã vượt ${points} nhịp cầu` : "Bắt đầu từ bờ bên trái"}</b></div>;
    if (game.id === "giai-cuu") return <div className="rescue-board"><div className="cages">{Array.from({ length: Math.min(12, project.questions.length) }, (_, cage) => <i key={cage} className={cage < points ? "rescued" : cage === points ? "current" : ""}>{cage < points ? "♥" : "🔒"}</i>)}</div><b>{points ? `Đã giải cứu ${points} thú cưng` : "Mở lồng phép thuật đầu tiên"}</b></div>;
    if (game.id === "nong-trai") return <div className="farm-board"><div className="farm-plots">{Array.from({ length: Math.min(16, project.questions.length) }, (_, plot) => <i key={plot} className={plot < points ? "harvested" : plot === points ? "growing" : ""}>{plot < points ? "✿" : plot === points ? "🌱" : "🟫"}</i>)}</div><b>{points ? `Đã thu hoạch ${points} luống` : "Gieo mầm kiến thức"}</b></div>;
    if (game.id === "rung-chuong") return <div className="bell-board"><div className="bell-icon" style={{ transform: `scale(${1 + points * 0.1})` }}>🔔</div><b>{points ? `Đã vượt qua ${points} câu hỏi` : "Sẵn sàng rung chuông vàng"}</b></div>;
    if (game.id === "bong-da") return <div className="football-board"><div className="football-score"><b>ĐỘI A · {teamScores.A}</b><span>LƯỢT ĐỘI {team}</span><b>ĐỘI B · {teamScores.B}</b></div><div className="football-pitch"><div className="goal goal-left"></div><div className="goal goal-right"></div><i className="ball" style={{ left: `${50 + (teamScores.A - teamScores.B) * 5}%` }}>⚽</i></div></div>;
    if (game.id === "olympia") return <div className="olympia-board"><div className="olympia-scores"><b className={team === "A" ? "active" : ""}>A: {teamScores.A}</b><b className={team === "B" ? "active" : ""}>B: {teamScores.B}</b><b className={team === "C" ? "active" : ""}>C: {teamScores.C}</b><b className={team === "D" ? "active" : ""}>D: {teamScores.D}</b></div><div className="olympia-track"><i style={{ bottom: `${10 + Math.min(80, teamScores.A * 13)}%`, left: '12%' }}>A</i><i style={{ bottom: `${10 + Math.min(80, teamScores.B * 13)}%`, left: '37%' }}>B</i><i style={{ bottom: `${10 + Math.min(80, teamScores.C * 13)}%`, left: '62%' }}>C</i><i style={{ bottom: `${10 + Math.min(80, teamScores.D * 13)}%`, left: '87%' }}>D</i><div className="mountain">🏔️</div></div></div>;
    return <div className="board-game"><div className="board-score"><b className={player === 0 ? "active" : ""}>NGƯỜI 1 · ô {playerPositions[0] + 1}</b><span>⚄ {dice}</span><b className={player === 1 ? "active" : ""}>NGƯỜI 2 · ô {playerPositions[1] + 1}</b></div><div className="board-path">{Array.from({ length: 20 }, (_, cell) => <i key={cell}>{cell + 1}{playerPositions[0] === cell && <em>1</em>}{playerPositions[1] === cell && <strong>2</strong>}</i>)}</div></div>;
  };

  return <div className={`presenter adventure mode-${game.id}`} style={{ "--game-primary": project.primary, "--game-accent": project.accent } as React.CSSProperties}>
    <header><div><span>{game.eyebrow.toUpperCase()}</span><h1>{project.name}</h1></div><div className="presenter-actions"><b>{points}/{project.questions.length} đúng</b><button onClick={onClose}>Thoát <kbd>Esc</kbd></button></div></header>
    {finished ? <section className="game-finish"><div className="finish-orbit">{game.icon}</div><span>{game.id === "do-min" && lives <= 0 ? "HẾT MẠNG · THỬ LẠI NHÉ" : "HOÀN THÀNH THỬ THÁCH"}</span><h2>{points}/{project.questions.length}</h2><p>{(game.id === "dua-doi" || game.id === "bong-da") ? `Đội A ${teamScores.A} · Đội B ${teamScores.B}` : game.id === "olympia" ? `A:${teamScores.A} · B:${teamScores.B} · C:${teamScores.C} · D:${teamScores.D}` : game.id === "ban-co" ? `Người 1 ở ô ${playerPositions[0] + 1} · Người 2 ở ô ${playerPositions[1] + 1}` : "Mỗi câu trả lời là một bước tiến trên hành trình tri thức."}</p><button onClick={() => { setIndex(0); setSelected(null); setRevealed(false); setPoints(0); setTeamScores({ A: 0, B: 0, C: 0, D: 0 }); setLives(3); setPlayer(0); setPlayerPositions([0, 0]); setDice(1); setTeam("A"); }}>Chơi lại</button></section> : <main className="adventure-stage">
      <aside className="mode-visual"><span>{game.name}</span>{renderVisual()}<p>{game.tagline}</p></aside>
      <section className="question-stage"><div className="game-status"><span>CÂU {index + 1}/{project.questions.length}</span><b>{game.icon}</b></div>{question.image && game.id !== "manh-ghep" && <img className="question-image" src={question.image} alt="Minh họa câu hỏi" />}<div className="question-box"><MathContent text={question.prompt} block /></div><div className="answer-grid">{question.answers.map((answer, answerIndex) => { const state = revealed && answerIndex === question.correct ? "correct" : revealed && answerIndex === selected ? "wrong" : selected === answerIndex ? "selected" : ""; return <button key={answerIndex} className={state} disabled={revealed} onClick={() => setSelected(answerIndex)}><span>{letters[answerIndex]}</span><MathContent text={answer} /></button>; })}</div>{revealed && <div className="answer-explanation"><b>{isCorrect ? "Chính xác!" : `Đáp án: ${letters[question.correct]}`}</b><MathContent text={question.explanation} /></div>}<button className="lock-answer" disabled={selected === null} onClick={advance}>{revealed ? index + 1 === project.questions.length || (game.id === "do-min" && lives <= 0) ? "Xem kết quả" : "Thử thách tiếp" : "Chốt đáp án"}<span>↵</span></button></section>
    </main>}
  </div>;
}

function MatchPresenter({ project, game, onClose }: { project: GameProject; game: GameMode; onClose: () => void }) {
  const pairs = useMemo(() => project.questions.slice(0, 8).map((question, index) => ({ index, id: question.id, prompt: question.prompt, answer: question.answers[question.correct], image: question.image })), [project.questions]);
  const answerOrder = useMemo(() => pairs.map((pair) => pair.index).sort(() => Math.random() - .5), [pairs]);
  const [selectedPrompt, setSelectedPrompt] = useState<number | null>(null);
  const [matched, setMatched] = useState<number[]>([]);
  const [mistakes, setMistakes] = useState(0);
  const [feedback, setFeedback] = useState("");
  const finished = matched.length === pairs.length;

  useEffect(() => {
    const onKey = (event: KeyboardEvent) => { if (event.key === "Escape") onClose(); };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  const chooseAnswer = (answerIndex: number) => {
    if (selectedPrompt === null || matched.includes(answerIndex)) return;
    if (selectedPrompt === answerIndex) {
      setMatched((current) => [...current, answerIndex]);
      setFeedback("Ghép đúng — tuyệt vời!");
      setSelectedPrompt(null);
    } else {
      setMistakes((value) => value + 1);
      setFeedback("Chưa khớp, hãy thử cặp khác.");
    }
  };

  const reset = () => { setSelectedPrompt(null); setMatched([]); setMistakes(0); setFeedback(""); };

  return <div className="presenter match-presenter" style={{ "--game-primary": project.primary, "--game-accent": project.accent } as React.CSSProperties}>
    <header><div><span>{game.eyebrow.toUpperCase()}</span><h1>{project.name}</h1></div><div className="presenter-actions"><b>{matched.length}/{pairs.length} cặp · {mistakes} lần thử sai</b><button onClick={onClose}>Thoát <kbd>Esc</kbd></button></div></header>
    {finished ? <section className="game-finish"><div className="finish-orbit">↔</div><span>ĐÃ GHÉP XONG MỌI CẶP</span><h2>{pairs.length}</h2><p>Hoàn thành với {mistakes} lần thử sai.</p><button onClick={reset}>Chơi lại</button></section> : <main className="match-stage"><section><div className="match-heading"><span>CÂU HỎI</span><b>Chọn một thẻ bên trái rồi tìm đáp án tương ứng</b></div><div className="match-column">{pairs.map((pair) => <button key={pair.id} className={`${selectedPrompt === pair.index ? "selected" : ""} ${matched.includes(pair.index) ? "matched" : ""}`} disabled={matched.includes(pair.index)} onClick={() => { setSelectedPrompt(pair.index); setFeedback(""); }}>{pair.image && <img src={pair.image} alt="" />}<MathContent text={pair.prompt} /></button>)}</div></section><div className="match-core"><i>↔</i><span>{feedback || "GHÉP CẶP"}</span></div><section><div className="match-heading"><span>ĐÁP ÁN</span><b>Thứ tự đã được xáo trộn tự động</b></div><div className="match-column">{answerOrder.map((answerIndex) => { const pair = pairs[answerIndex]; return <button key={pair.id} className={matched.includes(answerIndex) ? "matched" : ""} disabled={matched.includes(answerIndex)} onClick={() => chooseAnswer(answerIndex)}><MathContent text={pair.answer} /></button>; })}</div></section></main>}
  </div>;
}

function Presenter({ project, game, onClose }: { project: GameProject; game: GameMode; onClose: () => void }) {
  if (game.id === "trieu-phu") return <MillionairePresenter project={project} onClose={onClose} />;
  if (game.id === "ghep-cap") return <MatchPresenter project={project} game={game} onClose={onClose} />;
  return <AdventurePresenter project={project} game={game} onClose={onClose} />;
}

function LockedGame({ game, user, trialUsed, onLogin, onSignOut, onTrial, onDemo, error }: { game: GameMode; user: User | null; trialUsed: boolean; onLogin: () => void; onSignOut: () => void; onTrial: () => void; onDemo: () => void; error: string }) {
  const titleParts = game.name.split(" ");
  const firstLine = titleParts.slice(0, Math.ceil(titleParts.length / 2)).join(" ");
  const secondLine = titleParts.slice(Math.ceil(titleParts.length / 2)).join(" ");
  return <main className={`game-gate gate-${game.id}`}><header><a href="/">← Sang Math Store</a>{user ? <button onClick={onSignOut}>Đăng xuất {user.email}</button> : <button onClick={onLogin}>Đăng nhập Google</button>}</header><section><div className="gate-badge">{game.eyebrow.toUpperCase()} · DÙNG THỬ TRƯỚC</div><h1>{firstLine}<br/><em>{secondLine}</em></h1><p>{game.tagline}. Dùng chung ngân hàng câu hỏi KaTeX, hình ảnh và màu sắc riêng; dữ liệu tự lưu trên máy và chuyển thiết bị bằng ZIP.</p><div className="gate-price"><strong>Từ 30.000đ</strong><span>1 năm 30k · 2 năm 50k · 5 năm 100k</span></div>{error && <p className="gate-error">{error}</p>}<div className="gate-actions"><button className="trial-button" onClick={onTrial} disabled={trialUsed}>{trialUsed ? "Đã dùng lượt thử" : user ? "Dùng thử full 24 giờ" : "Đăng nhập & dùng thử full"}</button><a href={`/?buy=${game.productId}#products`}>Chọn gói sử dụng</a><button onClick={onDemo}>Xem bản mẫu</button></div><div className="gate-trust"><span>✓ Mỗi Gmail thử full 1 lần</span><span>✓ Một bộ câu hỏi, nhiều game</span><span>✓ Xuất/nhập ZIP</span></div></section><aside><div className="gate-card"><span>{game.icon}</span><small>{game.eyebrow.toUpperCase()}</small><b>KaTeX</b><i>Hình ảnh</i><em>Local-first</em></div></aside></main>;
}

function ImportQuestionsDialog({ onClose, onImport }: { onClose: () => void; onImport: (file: File, mode: "append" | "replace") => Promise<void> }) {
  const [mode, setMode] = useState<"append" | "replace">("append");
  const [working, setWorking] = useState(false);
  const [message, setMessage] = useState("");
  const input = useRef<HTMLInputElement>(null);

  useEffect(() => {
    const escape = (event: KeyboardEvent) => { if (event.key === "Escape" && !working) onClose(); };
    window.addEventListener("keydown", escape);
    return () => window.removeEventListener("keydown", escape);
  }, [onClose, working]);

  const choose = async (file?: File) => {
    if (!file) return;
    setWorking(true); setMessage("");
    try { await onImport(file, mode); onClose(); }
    catch (cause) { setMessage(cause instanceof Error ? cause.message : "Không thể đọc file này."); }
    finally { setWorking(false); }
  };

  return <div className="import-backdrop" role="dialog" aria-modal="true" aria-label="Nhập ngân hàng câu hỏi">
    <section className="import-dialog">
      <button className="import-close" onClick={onClose} disabled={working} aria-label="Đóng">×</button>
      <span className="import-kicker">CỔNG NHẬP LIỆU CHUNG</span><h2>Một file, dùng cho cả 13 game</h2>
      <p>Giữ nguyên công thức <code>$...$</code>. Dữ liệu được đọc ngay trên thiết bị và không tải lên cloud.</p>
      <div className="import-formats"><span><b>Word</b><small>.docx theo từng khối câu</small></span><span><b>Excel</b><small>.xlsx theo cột</small></span><span><b>CSV</b><small>Mở được bằng Excel</small></span><span><b>JSON</b><small>Dành cho dữ liệu kỹ thuật</small></span></div>
      <div className="sample-downloads"><b>Tải file mẫu:</b><a href="/samples/sang-math-game-cau-hoi-mau.docx" download>Word mẫu</a><a href="/samples/sang-math-game-cau-hoi-mau.xlsx" download>Excel mẫu</a><a href="/samples/sang-math-game-cau-hoi-mau.csv" download>CSV mẫu</a></div>
      <div className="import-mode"><label><input type="radio" checked={mode === "append"} onChange={() => setMode("append")} /> Nối thêm vào kho hiện tại</label><label><input type="radio" checked={mode === "replace"} onChange={() => setMode("replace")} /> Thay toàn bộ câu hỏi</label></div>
      <input ref={input} type="file" hidden accept=".docx,.xlsx,.csv,.json" onChange={(event) => { void choose(event.target.files?.[0]); event.target.value = ""; }} />
      <button className="import-drop" disabled={working} onClick={() => input.current?.click()} onDragOver={(event) => event.preventDefault()} onDrop={(event) => { event.preventDefault(); void choose(event.dataTransfer.files?.[0]); }}><strong>{working ? "Đang đọc và kiểm tra…" : "Chọn hoặc thả file vào đây"}</strong><small>Tối đa 12 MB · tối đa 200 câu mỗi lần</small></button>
      {message && <p className="import-error">{message}</p>}
      <div className="import-tips"><b>Mẹo:</b> đáp án đúng có thể ghi A/B/C/D hoặc 1/2/3/4. Word nhận cả bảng lẫn mẫu “Câu hỏi – A – B – C – D – Đáp án – Lời giải”.</div>
    </section>
  </div>;
}

export default function GameStudio() {
  const [user, setUser] = useState<User | null>(null);
  const [authLoading, setAuthLoading] = useState(true);
  const [licensed, setLicensed] = useState(false);
  const [accessMode, setAccessMode] = useState<"paid" | "trial" | null>(null);
  const [accessUntil, setAccessUntil] = useState<string | null>(null);
  const [trial, setTrial] = useState<AccountTrial | null>(null);
  const [accessRefresh, setAccessRefresh] = useState(0);
  const [licenseLoading, setLicenseLoading] = useState(false);
  const [projects, setProjects] = useState<GameProject[]>([]);
  const [project, setProject] = useState<GameProject | null>(null);
  const [questionIndex, setQuestionIndex] = useState(0);
  const [presenting, setPresenting] = useState<GameProject | null>(null);
  const [status, setStatus] = useState("");
  const [error, setError] = useState("");
  const [importOpen, setImportOpen] = useState(false);
  const importInput = useRef<HTMLInputElement>(null);

  useEffect(() => listenGameUser((nextUser) => { setUser(nextUser); setAuthLoading(false); }), []);

  useEffect(() => {
    if (!user) { setLicensed(false); setAccessMode(null); setAccessUntil(null); setTrial(null); setProjects([]); setProject(null); return; }
    let active = true;
    setLicenseLoading(true); setError("");
    void user.getIdToken().then((token) => fetch("/api/account", { headers: { authorization: `Bearer ${token}` }, cache: "no-store" }))
      .then(async (response) => {
        const data = await response.json() as { entitlements?: AccountEntitlement[]; trials?: AccountTrial[]; error?: string };
        if (!response.ok) throw new Error(data.error || "Không thể kiểm tra quyền sử dụng.");
        if (!active) return;
        const grant = data.entitlements?.find((item) => item.accessKey === ACTIVE_GAME.accessKey);
        const trialAccess = data.trials?.find((item) => item.accessKey === ACTIVE_GAME.accessKey) || null;
        const hasTrial = Boolean(trialAccess?.active);
        const isAdmin = Boolean(user.email && ["nguyensangnhc@gmail.com", "sangbeau@gmail.com"].includes(user.email));
        const hasLicense = Boolean(grant || hasTrial || isAdmin);
        setTrial(trialAccess);
        setLicensed(hasLicense);
        setAccessMode(isAdmin ? "paid" : grant ? "paid" : hasTrial ? "trial" : null);
        setAccessUntil(isAdmin ? "2100-01-01T00:00:00Z" : grant?.expiresAt || trialAccess?.expiresAt || null);
        if (!hasLicense) return;
        return listGameProjects(user.email || "").then(async (stored) => {
          if (!active) return;
          if (stored.length) { setProjects(stored); setProject(stored[0]); return; }
          const starter = createStarterProject(user.email || "", `${ACTIVE_GAME.name} — Toán học`);
          await saveGameProject(starter);
          if (active) { setProjects([starter]); setProject(starter); }
        });
      }).catch((cause) => active && setError(cause instanceof Error ? cause.message : "Không thể mở sản phẩm."))
      .finally(() => active && setLicenseLoading(false));
    return () => { active = false; };
  }, [user, accessRefresh]);

  const startTrial = async () => {
    if (!user) {
      await signInGameUser();
      return;
    }
    setLicenseLoading(true); setError("");
    try {
      const token = await user.getIdToken();
      const response = await fetch(`/api/trials/${ACTIVE_GAME.accessKey}`, { method: "POST", headers: { authorization: `Bearer ${token}` } });
      const data = await response.json() as { trial?: AccountTrial; error?: string };
      if (!response.ok || !data.trial) throw new Error(data.error || "Không thể bắt đầu lượt dùng thử.");
      setAccessRefresh((value) => value + 1);
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Không thể bắt đầu lượt dùng thử.");
      setLicenseLoading(false);
    }
  };

  useEffect(() => {
    if (!licensed || !project) return;
    const timer = window.setTimeout(() => {
      void saveGameProject(project).then(() => {
        setProjects((current) => [project, ...current.filter((item) => item.id !== project.id)].sort((a, b) => b.updatedAt.localeCompare(a.updatedAt)));
        setStatus("Đã lưu trên máy");
        window.setTimeout(() => setStatus(""), 1400);
      }).catch(() => setError("Không thể lưu vào trình duyệt này."));
    }, 450);
    return () => window.clearTimeout(timer);
  }, [licensed, project]);

  const currentQuestion = project?.questions[questionIndex];
  const updateProject = (patch: Partial<GameProject>) => setProject((current) => current ? { ...current, ...patch, updatedAt: new Date().toISOString() } : current);
  const updateQuestion = (patch: Partial<GameQuestion>) => setProject((current) => current ? { ...current, updatedAt: new Date().toISOString(), questions: current.questions.map((question, index) => index === questionIndex ? { ...question, ...patch } : question) } : current);
  const updateAnswer = (index: number, value: string) => updateQuestion({ answers: currentQuestion?.answers.map((answer, answerIndex) => answerIndex === index ? value : answer) as GameQuestion["answers"] });

  const addQuestion = () => {
    if (!project) return;
    const next: GameQuestion = { id: crypto.randomUUID(), level: project.questions.length + 1, prompt: "Nhập câu hỏi mới — dùng $...$ cho công thức Toán", answers: ["Phương án A", "Phương án B", "Phương án C", "Phương án D"], correct: 0, explanation: "Nhập lời giải ngắn.", };
    updateProject({ questions: [...project.questions, next] });
    setQuestionIndex(project.questions.length);
  };

  const duplicateQuestion = () => {
    if (!project || !currentQuestion) return;
    const copy = { ...currentQuestion, id: crypto.randomUUID(), level: project.questions.length + 1, answers: [...currentQuestion.answers] as GameQuestion["answers"] };
    updateProject({ questions: [...project.questions, copy] });
    setQuestionIndex(project.questions.length);
  };

  const removeQuestion = () => {
    if (!project || project.questions.length <= 1) return;
    const next = project.questions.filter((_, index) => index !== questionIndex).map((question, index) => ({ ...question, level: index + 1 }));
    updateProject({ questions: next });
    setQuestionIndex(Math.max(0, questionIndex - 1));
  };

  const newProject = async () => {
    if (!user?.email) return;
    const next = createStarterProject(user.email, `${ACTIVE_GAME.name} ${projects.length + 1}`);
    await saveGameProject(next); setProjects((current) => [next, ...current]); setProject(next); setQuestionIndex(0);
  };

  const duplicateProject = async () => {
    if (!project || !user?.email) return;
    const now = new Date().toISOString();
    const next = { ...project, id: crypto.randomUUID(), name: `${project.name} — bản sao`, ownerEmail: user.email, createdAt: now, updatedAt: now, questions: project.questions.map((item) => ({ ...item, id: crypto.randomUUID(), answers: [...item.answers] as GameQuestion["answers"] })) };
    await saveGameProject(next); setProjects((current) => [next, ...current]); setProject(next); setQuestionIndex(0);
  };

  const removeProject = async () => {
    if (!project || projects.length <= 1 || !window.confirm(`Xóa “${project.name}” khỏi máy này?`)) return;
    await deleteGameProject(project.id);
    const next = projects.filter((item) => item.id !== project.id); setProjects(next); setProject(next[0]); setQuestionIndex(0);
  };

  const exportZip = async () => {
    if (!project) return;
    setStatus("Đang đóng gói ZIP…");
    const blob = await exportGameZip(project);
    downloadBlob(blob, `${safeFileName(project.name)}.sanggame.zip`);
    setStatus("Đã tải ZIP về máy");
  };

  const importZip = async (file: File) => {
    if (!user?.email) return;
    try {
      const imported = await importGameZip(file, user.email);
      await saveGameProject(imported); setProjects((current) => [imported, ...current]); setProject(imported); setQuestionIndex(0); setStatus("Đã nhập game từ ZIP");
    } catch (cause) { setError(cause instanceof Error ? cause.message : "Không thể nhập ZIP."); }
  };

  const importQuestions = async (file: File, mode: "append" | "replace") => {
    if (!project) return;
    const result = await importQuestionsFromFile(file);
    const combined = mode === "replace" ? result.questions : [...project.questions, ...result.questions];
    const questions = combined.slice(0, 300).map((question, index) => ({ ...question, level: index + 1 }));
    updateProject({ questions });
    setQuestionIndex(mode === "replace" ? 0 : project.questions.length);
    setStatus(`Đã nhập ${result.questions.length} câu từ ${result.source}${result.skipped ? ` · bỏ qua ${result.skipped} dòng lỗi` : ""}`);
  };

  const uploadImage = (file: File) => {
    if (file.size > 2 * 1024 * 1024) { setError("Ảnh tối đa 2 MB để game chạy nhẹ."); return; }
    const reader = new FileReader();
    reader.onload = () => updateQuestion({ image: String(reader.result || "") });
    reader.readAsDataURL(file);
  };

  const demoProject = useMemo(() => createStarterProject("demo@gmail.com", `${ACTIVE_GAME.name} — Bản mẫu`), []);

  if (authLoading || licenseLoading) return <main className="game-loading"><div></div><h1>Đang mở kho game…</h1><p>Kiểm tra Gmail và dữ liệu trên máy này.</p></main>;
  if (!user || !licensed) return <><LockedGame game={ACTIVE_GAME} user={user} trialUsed={Boolean(trial && !trial.active)} onLogin={() => void signInGameUser().catch((cause) => setError(cause.message))} onSignOut={() => void signOutGameUser()} onTrial={() => void startTrial()} onDemo={() => setPresenting(demoProject)} error={error || (user && trial && !trial.active ? "Gmail này đã dùng lượt thử. Bạn có thể chọn gói 1, 2 hoặc 5 năm để tiếp tục." : "")} />{presenting && <Presenter project={presenting} game={ACTIVE_GAME} onClose={() => setPresenting(null)} />}</>;

  const isUtility = ["goi-ten", "bang-diem", "dong-ho", "chia-nhom"].includes(ACTIVE_GAME.id);
  if (isUtility) {
     if (ACTIVE_GAME.id === "goi-ten") return <WheelOfNames game={ACTIVE_GAME} onClose={() => window.location.href = "/"} />;
     if (ACTIVE_GAME.id === "bang-diem") return <Scoreboard game={ACTIVE_GAME} onClose={() => window.location.href = "/"} />;
     if (ACTIVE_GAME.id === "dong-ho") return <ClassTimer game={ACTIVE_GAME} onClose={() => window.location.href = "/"} />;
     if (ACTIVE_GAME.id === "chia-nhom") return <GroupDivider game={ACTIVE_GAME} onClose={() => window.location.href = "/"} />;
  }

  if (!project || !currentQuestion) return <main className="game-loading"><h1>Đang tạo game đầu tiên…</h1></main>;

  return <main className="studio" style={{ "--game-primary": project.primary, "--game-accent": project.accent } as React.CSSProperties}>
    <header className="studio-header"><a className="studio-brand" href="/"><span>S</span><b>Sang Math Games</b></a><nav className="mode-switcher">{Object.values(GAME_MODES).map((mode) => <a key={mode.id} className={mode.id === ACTIVE_GAME.id ? "active" : ""} href={`/games/${mode.id}/`} title={mode.name}>{mode.icon}</a>)}</nav><div className="save-state"><i></i>{status || "Tự lưu IndexedDB trên máy"}</div><div className="studio-user"><span><b>{accessMode === "trial" ? "Đang dùng thử full" : "Gói sử dụng đang hoạt động"}</b><small>{accessUntil ? `Đến ${new Date(accessUntil).toLocaleDateString("vi-VN")}` : user.email}</small></span>{user.photoURL && <img src={user.photoURL} alt="" referrerPolicy="no-referrer" />}<button onClick={() => void signOutGameUser()}>Đăng xuất</button></div></header>
    <div className="studio-layout">
      <aside className="project-shelf"><div className="shelf-heading"><span>KHO GAME TRÊN MÁY</span><button onClick={() => void newProject()}>+</button></div><div className="project-list">{projects.map((item) => <button key={item.id} className={item.id === project.id ? "active" : ""} onClick={() => { setProject(item); setQuestionIndex(0); }}><i style={{ background: item.accent }}></i><span><b>{item.name}</b><small>{item.questions.length} câu · {new Date(item.updatedAt).toLocaleDateString("vi-VN")}</small></span></button>)}</div><div className="shelf-actions"><button onClick={() => void duplicateProject()}>Nhân bản game</button><button className="danger" onClick={() => void removeProject()} disabled={projects.length <= 1}>Xóa khỏi máy</button></div><div className="local-note"><b>Riêng tư tuyệt đối</b><p>Không có dữ liệu nào được gửi lên cloud. Hãy xuất ZIP định kỳ và cất vào Drive/USB của bạn.</p></div></aside>
      <section className="studio-main">
        <div className="studio-toolbar"><div><span>{ACTIVE_GAME.name.toUpperCase()} STUDIO · MỘT NGÂN HÀNG CÂU HỎI, NHIỀU GAME</span><input value={project.name} onChange={(event) => updateProject({ name: event.target.value })} aria-label="Tên game" /></div><div className="toolbar-actions"><input ref={importInput} type="file" accept=".zip,application/zip" hidden onChange={(event) => { const file = event.target.files?.[0]; if (file) void importZip(file); event.target.value = ""; }} /><button className="import-data" onClick={() => setImportOpen(true)}>Nhập Word / Excel</button><button onClick={() => importInput.current?.click()}>Khôi phục ZIP</button><button onClick={() => void exportZip()}>Tải ZIP về máy</button><button className="play" onClick={() => setPresenting(project)}>Trình chiếu <span>▶</span></button></div></div>
        <div className="studio-content">
          <aside className="question-list"><div><b>{project.questions.length} câu hỏi</b><button onClick={addQuestion}>+ Thêm câu</button></div>{project.questions.map((question, index) => <button key={question.id} className={index === questionIndex ? "active" : ""} onClick={() => setQuestionIndex(index)}><span>{String(index + 1).padStart(2, "0")}</span><MathContent text={question.prompt} /></button>)}</aside>
          <section className="question-editor"><div className="editor-section-title"><div><span>CÂU {questionIndex + 1}</span><h2>Nội dung câu hỏi</h2></div><div><button onClick={duplicateQuestion}>Nhân bản</button><button onClick={removeQuestion} disabled={project.questions.length <= 1}>Xóa câu</button></div></div><label>Câu hỏi <small>Dùng <code>$...$</code> cho công thức nội tuyến và <code>$$...$$</code> cho công thức riêng dòng.</small><textarea value={currentQuestion.prompt} onChange={(event) => updateQuestion({ prompt: event.target.value })} /></label><div className="answer-editor">{currentQuestion.answers.map((answer, index) => <label key={index} className={currentQuestion.correct === index ? "correct" : ""}><button onClick={() => updateQuestion({ correct: index })}>{letters[index]}</button><textarea value={answer} onChange={(event) => updateAnswer(index, event.target.value)} /><span>{currentQuestion.correct === index ? "ĐÁP ÁN" : "Chọn"}</span></label>)}</div><label>Lời giải / gợi ý<textarea value={currentQuestion.explanation} onChange={(event) => updateQuestion({ explanation: event.target.value })} /></label><div className="image-editor"><div>{currentQuestion.image ? <img src={currentQuestion.image} alt="Minh họa" /> : <span>＋</span>}</div><label><b>{currentQuestion.image ? "Đổi hình minh họa" : "Chèn hình minh họa"}</b><small>PNG/JPG/WebP · tối đa 2 MB · ảnh nằm trong ZIP</small><input type="file" accept="image/png,image/jpeg,image/webp" onChange={(event) => { const file = event.target.files?.[0]; if (file) uploadImage(file); }} /></label>{currentQuestion.image && <button onClick={() => updateQuestion({ image: undefined })}>Gỡ ảnh</button>}</div>
          </section>
          <aside className="live-preview"><div className="preview-heading"><span>XEM TRƯỚC TRỰC TIẾP</span><div><label>Màu nền<input type="color" value={project.primary} onChange={(event) => updateProject({ primary: event.target.value })} /></label><label>Màu nhấn<input type="color" value={project.accent} onChange={(event) => updateProject({ accent: event.target.value })} /></label></div></div><label className="subtitle-field">Dòng giới thiệu<input value={project.subtitle} onChange={(event) => updateProject({ subtitle: event.target.value })} /></label><div className="preview-card"><span>CÂU {questionIndex + 1}</span>{currentQuestion.image && <img src={currentQuestion.image} alt="" />}<h3><MathContent text={currentQuestion.prompt} /></h3><div>{currentQuestion.answers.map((answer, index) => <p key={index} className={currentQuestion.correct === index ? "correct" : ""}><b>{letters[index]}</b><MathContent text={answer} /></p>)}</div><footer><MathContent text={currentQuestion.explanation} /></footer></div><div className="math-guide"><b>KaTeX chuẩn và đẹp</b><code>{"$x^2-5x+6=0$"}</code><MathContent text="$x^2-5x+6=0$" /></div></aside>
        </div>
      </section>
    </div>
    {error && <div className="studio-toast error" onClick={() => setError("")}>{error} <b>×</b></div>}
    {importOpen && <ImportQuestionsDialog onClose={() => setImportOpen(false)} onImport={importQuestions} />}
    {presenting && <Presenter project={presenting} game={ACTIVE_GAME} onClose={() => setPresenting(null)} />}
  </main>;
}
