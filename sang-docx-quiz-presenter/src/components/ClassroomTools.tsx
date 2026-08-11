import { useEffect, useRef, useState, type CSSProperties, type PointerEvent as ReactPointerEvent } from 'react';
import {
  listClassrooms,
  makeClassroomId,
  removeClassroom,
  saveClassroom,
  todayKey,
  withFreshDailyState,
  type ClassroomRoster,
  type RandomPolicy,
} from '../features/classroom/classroomStore';

type ToolId = 'presentation' | 'timer' | 'random';
type ToolPosition = { left: number; top: number };

type PresentationTheme = 'light' | 'dark' | 'ocean' | 'mint' | 'sunset';

export interface ClassroomPresentationControls {
  theme: PresentationTheme;
  fontScale: number;
  catalogOpen: boolean;
  whiteboardMode: 'off' | 'overlay' | 'split';
  fullscreen: boolean;
  isEnglish: boolean;
  onThemeChange: (theme: PresentationTheme) => void;
  onDecreaseFont: () => void;
  onIncreaseFont: () => void;
  onToggleCatalog: () => void;
  onToggleOverlay: () => void;
  onToggleSplitBoard: () => void;
  onToggleFullscreen: () => void;
  onExit: () => void;
}

interface ClassroomToolsProps {
  presentation?: ClassroomPresentationControls;
}

const TOOL_POSITION_KEY = 'conic-classroom-tools-position';

const TIMER_PRESETS = [1, 3, 5, 10, 15];

function readSavedToolPosition(): ToolPosition | null {
  if (typeof window === 'undefined' || typeof localStorage === 'undefined') return null;
  try {
    const raw = localStorage.getItem(TOOL_POSITION_KEY);
    if (!raw) return null;
    const parsed = JSON.parse(raw) as Partial<ToolPosition>;
    return typeof parsed.left === 'number' && typeof parsed.top === 'number'
      ? { left: parsed.left, top: parsed.top }
      : null;
  } catch {
    return null;
  }
}

function clampToolPosition(position: ToolPosition, width: number, height: number): ToolPosition {
  const margin = 10;
  const maxLeft = Math.max(margin, window.innerWidth - width - margin);
  const maxTop = Math.max(margin, window.innerHeight - height - margin);
  return {
    left: Math.max(margin, Math.min(maxLeft, position.left)),
    top: Math.max(margin, Math.min(maxTop, position.top)),
  };
}

function formatTime(totalSeconds: number) {
  const minutes = Math.floor(totalSeconds / 60).toString().padStart(2, '0');
  const seconds = (totalSeconds % 60).toString().padStart(2, '0');
  return `${minutes}:${seconds}`;
}

function parseNames(value: string) {
  const seen = new Set<string>();
  return value
    .split(/[\n,;\t]+/)
    .map((name) => name.trim().replace(/^[-*•]+\s*/, ''))
    .filter((name) => {
      const key = name.toLocaleLowerCase();
      if (!name || seen.has(key)) return false;
      seen.add(key);
      return true;
    });
}

function TimerTool() {
  const [seconds, setSeconds] = useState(5 * 60);
  const [duration, setDuration] = useState(5 * 60);
  const [running, setRunning] = useState(false);

  useEffect(() => {
    if (!running) return undefined;
    const timerId = window.setInterval(() => {
      setSeconds((current) => {
        if (current <= 1) {
          setRunning(false);
          return 0;
        }
        return current - 1;
      });
    }, 1000);
    return () => window.clearInterval(timerId);
  }, [running]);

  const progress = duration > 0 ? Math.max(0, Math.min(100, (seconds / duration) * 100)) : 0;
  const isFinished = seconds === 0;

  const choosePreset = (minutes: number) => {
    setRunning(false);
    setDuration(minutes * 60);
    setSeconds(minutes * 60);
  };

  const adjust = (amount: number) => {
    setSeconds((current) => Math.max(0, Math.min(99 * 60 + 59, current + amount)));
    setDuration((current) => Math.max(60, current + amount));
  };

  return (
    <div className="classroom-tool-panel classroom-timer-panel">
      <div className="classroom-tool-heading">
        <div>
          <span className="classroom-tool-kicker">CLASSROOM TOOL</span>
          <h3>⏱ Đồng hồ bấm giờ</h3>
        </div>
        <span className={`timer-status ${isFinished ? 'is-finished' : running ? 'is-running' : ''}`}>
          {isFinished ? 'Hết giờ' : running ? 'Đang chạy' : 'Sẵn sàng'}
        </span>
      </div>

      <div
        className={`timer-face ${isFinished ? 'is-finished' : ''}`}
        style={{ '--timer-progress': `${progress * 3.6}deg` } as CSSProperties}
      >
        <div className="timer-face-inner">
          <strong>{formatTime(seconds)}</strong>
          <span>{isFinished ? 'Time is up' : 'Keep going'}</span>
        </div>
      </div>

      <div className="timer-presets" aria-label="Thời lượng nhanh">
        {TIMER_PRESETS.map((minutes) => (
          <button
            key={minutes}
            className={duration === minutes * 60 ? 'is-selected' : ''}
            onClick={() => choosePreset(minutes)}
          >
            {minutes}′
          </button>
        ))}
      </div>

      <div className="timer-actions">
        <button className="timer-adjust" onClick={() => adjust(-30)} disabled={seconds === 0}>
          −30s
        </button>
        <button className="timer-main-action" onClick={() => setRunning((current) => !current)}>
          {running ? 'Ⅱ Tạm dừng' : isFinished ? '↻ Chạy lại' : '▶ Bắt đầu'}
        </button>
        <button className="timer-adjust" onClick={() => adjust(30)}>
          +30s
        </button>
      </div>
      <button className="timer-reset" onClick={() => { setRunning(false); setSeconds(duration); }}>
        Đặt lại về {formatTime(duration)}
      </button>
    </div>
  );
}

const PRESENTATION_THEMES: Array<{ value: PresentationTheme; icon: string; label: string }> = [
  { value: 'light', icon: '☀️', label: 'Sáng' },
  { value: 'dark', icon: '🌙', label: 'Tối' },
  { value: 'ocean', icon: '🌊', label: 'Biển xanh' },
  { value: 'mint', icon: '🌿', label: 'Xanh lá' },
  { value: 'sunset', icon: '🌅', label: 'Cam sáng' },
];

function PresentationSettingsTool({ controls }: { controls: ClassroomPresentationControls }) {
  const language = controls.isEnglish;
  return (
    <div className="classroom-tool-panel presentation-settings-panel">
      <div className="classroom-tool-heading">
        <div>
          <span className="classroom-tool-kicker">PRESENTATION CONTROL</span>
          <h3>{language ? 'Presentation settings' : 'Cài đặt trình chiếu'}</h3>
        </div>
        <span className="presentation-settings-status">{Math.round(controls.fontScale * 100)}%</span>
      </div>

      <section className="presentation-setting-section">
        <span className="presentation-setting-label">{language ? 'Interface' : 'Giao diện'}</span>
        <div className="presentation-theme-grid">
          {PRESENTATION_THEMES.map((theme) => (
            <button
              key={theme.value}
              className={controls.theme === theme.value ? 'is-selected' : ''}
              onClick={() => controls.onThemeChange(theme.value)}
              title={theme.label}
            >
              <span>{theme.icon}</span>{theme.label}
            </button>
          ))}
        </div>
        <div className="presentation-font-row">
          <span>{language ? 'Text size' : 'Cỡ chữ'}</span>
          <div>
            <button onClick={controls.onDecreaseFont} aria-label={language ? 'Decrease text size' : 'Giảm cỡ chữ'}>A−</button>
            <strong>{Math.round(controls.fontScale * 100)}%</strong>
            <button onClick={controls.onIncreaseFont} aria-label={language ? 'Increase text size' : 'Tăng cỡ chữ'}>A+</button>
          </div>
        </div>
      </section>

      <section className="presentation-setting-section">
        <span className="presentation-setting-label">{language ? 'Teaching tools' : 'Công cụ giảng dạy'}</span>
        <div className="presentation-action-grid">
          <button className={controls.catalogOpen ? 'is-selected' : ''} onClick={controls.onToggleCatalog}>
            <span>📋</span>{language ? 'Questions' : 'Danh mục'}
          </button>
          <button className={controls.whiteboardMode === 'overlay' ? 'is-selected' : ''} onClick={controls.onToggleOverlay}>
            <span>✎</span>{language ? 'Write on slide' : 'Viết lên slide'}
          </button>
          <button className={controls.whiteboardMode === 'split' ? 'is-selected is-board' : ''} onClick={controls.onToggleSplitBoard}>
            <span>▦</span>{language ? 'Whiteboard' : 'Bảng trắng'}
          </button>
          <button className={controls.fullscreen ? 'is-selected' : ''} onClick={controls.onToggleFullscreen}>
            <span>{controls.fullscreen ? '↙' : '⛶'}</span>{controls.fullscreen ? (language ? 'Exit full screen' : 'Thu nhỏ') : (language ? 'Full screen' : 'Toàn màn hình')}
          </button>
        </div>
      </section>

      <button className="presentation-exit-action" onClick={controls.onExit}>
        <span>✕</span>{language ? 'Exit presentation' : 'Thoát trình chiếu'}
      </button>
    </div>
  );
}

const POLICY_OPTIONS: Array<{ value: RandomPolicy; label: string; short: string }> = [
  { value: 'one', label: 'Mỗi bạn tối đa 1 lần / ngày', short: 'Tối đa 1 lượt/ngày' },
  { value: 'two', label: 'Mỗi bạn tối đa 2 lần / ngày', short: 'Tối đa 2 lượt/ngày' },
  { value: 'fair', label: 'Ngẫu nhiên công bằng · đi đủ lượt rồi xáo lại', short: 'Công bằng theo vòng' },
  { value: 'always', label: 'Luôn ngẫu nhiên · cho phép gọi lặp', short: 'Luôn ngẫu nhiên' },
];

function policyLabel(policy: RandomPolicy) {
  return POLICY_OPTIONS.find((option) => option.value === policy)?.short || POLICY_OPTIONS[0].short;
}

function RandomStudentTool() {
  const [classrooms, setClassrooms] = useState<ClassroomRoster[]>([]);
  const [selectedId, setSelectedId] = useState('');
  const [loading, setLoading] = useState(true);
  const [managerOpen, setManagerOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [draftName, setDraftName] = useState('');
  const [draftStudents, setDraftStudents] = useState('');
  const [draftPolicy, setDraftPolicy] = useState<RandomPolicy>('one');
  const [formError, setFormError] = useState('');
  const [displayName, setDisplayName] = useState('Ai sẽ được gọi?');
  const [winner, setWinner] = useState('');
  const [statusMessage, setStatusMessage] = useState('');
  const [rolling, setRolling] = useState(false);
  const rollTimerRef = useRef<number | null>(null);
  const selectedClassroom = classrooms.find((classroom) => classroom.id === selectedId) || classrooms[0] || null;
  const currentClassroom = selectedClassroom ? withFreshDailyState(selectedClassroom) : null;
  const currentCounts = currentClassroom?.dailyCounts || {};
  const currentNames = currentClassroom?.students || [];
  const pickedToday = currentNames.reduce((sum, name) => sum + (currentCounts[name] || 0), 0);
  const exhausted = Boolean(currentClassroom && currentClassroom.policy !== 'always' && currentClassroom.policy !== 'fair' && currentNames.every((name) => (currentCounts[name] || 0) >= (currentClassroom.policy === 'two' ? 2 : 1)));

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    listClassrooms().then((saved) => {
      if (cancelled) return;
      setClassrooms(saved);
      setSelectedId((current) => saved.some((classroom) => classroom.id === current) ? current : saved[0]?.id || '');
      setLoading(false);
    }).catch(() => {
      if (!cancelled) setLoading(false);
    });
    return () => { cancelled = true; };
  }, []);

  useEffect(() => () => {
    if (rollTimerRef.current !== null) window.clearInterval(rollTimerRef.current);
  }, []);

  useEffect(() => {
    setDisplayName('Ai sẽ được gọi?');
    setWinner('');
    setStatusMessage('');
  }, [selectedId]);

  const openCreate = () => {
    setEditingId(null);
    setDraftName('');
    setDraftStudents('');
    setDraftPolicy('one');
    setFormError('');
    setManagerOpen(true);
  };

  const openEdit = () => {
    if (!currentClassroom) return;
    setEditingId(currentClassroom.id);
    setDraftName(currentClassroom.name);
    setDraftStudents(currentClassroom.students.join('\n'));
    setDraftPolicy(currentClassroom.policy);
    setFormError('');
    setManagerOpen(true);
  };

  const saveDraft = async () => {
    const name = draftName.trim();
    const students = parseNames(draftStudents);
    if (!name) {
      setFormError('Bạn hãy đặt tên lớp để lần sau chọn thật nhanh.');
      return;
    }
    if (students.length === 0) {
      setFormError('Hãy dán ít nhất một tên học sinh.');
      return;
    }
    const previous = classrooms.find((classroom) => classroom.id === editingId);
    const now = Date.now();
    const nextClassroom: ClassroomRoster = {
      id: previous?.id || makeClassroomId(),
      name,
      students,
      policy: draftPolicy,
      createdAt: previous?.createdAt || now,
      updatedAt: now,
      dailyDate: todayKey(),
      dailyCounts: previous
        ? Object.fromEntries(Object.entries(withFreshDailyState(previous).dailyCounts).filter(([student]) => students.includes(student)))
        : {},
    };
    await saveClassroom(nextClassroom);
    setClassrooms((current) => [...current.filter((classroom) => classroom.id !== nextClassroom.id), nextClassroom].sort((a, b) => a.name.localeCompare(b.name, 'vi')));
    setSelectedId(nextClassroom.id);
    setManagerOpen(false);
    setFormError('');
    setStatusMessage(`Đã lưu ${nextClassroom.name}. Lần sau chỉ cần mở lớp này.`);
  };

  const deleteCurrentClassroom = async () => {
    if (!currentClassroom) return;
    if (!window.confirm(`Xóa lớp “${currentClassroom.name}” khỏi máy này?`)) return;
    await removeClassroom(currentClassroom.id);
    const remaining = classrooms.filter((classroom) => classroom.id !== currentClassroom.id);
    setClassrooms(remaining);
    setSelectedId(remaining[0]?.id || '');
    setManagerOpen(false);
    setStatusMessage('Đã xóa lớp khỏi bộ nhớ trình duyệt.');
  };

  const resetToday = async () => {
    if (!currentClassroom) return;
    const reset = { ...currentClassroom, dailyDate: todayKey(), dailyCounts: {}, updatedAt: Date.now() };
    await saveClassroom(reset);
    setClassrooms((current) => current.map((classroom) => classroom.id === reset.id ? reset : classroom));
    setWinner('');
    setDisplayName('Ai sẽ được gọi?');
    setStatusMessage('Đã mở lại lượt gọi cho hôm nay.');
  };

  const persistPick = async (student: string) => {
    if (!currentClassroom) return;
    const next = withFreshDailyState(currentClassroom);
    const updated = {
      ...next,
      updatedAt: Date.now(),
      dailyCounts: { ...next.dailyCounts, [student]: (next.dailyCounts[student] || 0) + 1 },
    };
    await saveClassroom(updated);
    setClassrooms((current) => current.map((classroom) => classroom.id === updated.id ? updated : classroom));
  };

  const chooseStudent = () => {
    if (rolling || !currentClassroom || currentNames.length === 0) return;
    const counts = currentCounts;
    let candidates = currentNames;
    if (currentClassroom.policy === 'one' || currentClassroom.policy === 'two') {
      const limit = currentClassroom.policy === 'two' ? 2 : 1;
      candidates = currentNames.filter((name) => (counts[name] || 0) < limit);
      if (candidates.length === 0) {
        setStatusMessage('Lớp đã đủ lượt hôm nay. Bạn có thể đặt lại lượt hoặc đổi quy tắc trong Sửa lớp.');
        return;
      }
    } else if (currentClassroom.policy === 'fair') {
      candidates = currentNames.filter((name) => (counts[name] || 0) === 0);
      if (candidates.length === 0) {
        candidates = currentNames;
        setStatusMessage('Đã đủ một vòng — bắt đầu xáo lại công bằng.');
      }
    }
    const finalName = candidates[Math.floor(Math.random() * candidates.length)] || currentNames[0];
    let ticks = 0;
    setRolling(true);
    setWinner('');
    setStatusMessage('');
    if (rollTimerRef.current !== null) window.clearInterval(rollTimerRef.current);
    rollTimerRef.current = window.setInterval(() => {
      ticks += 1;
      setDisplayName(currentNames[Math.floor(Math.random() * currentNames.length)] || finalName);
      if (ticks >= 18) {
        if (rollTimerRef.current !== null) window.clearInterval(rollTimerRef.current);
        rollTimerRef.current = null;
        setDisplayName(finalName);
        setWinner(finalName);
        setRolling(false);
        void persistPick(finalName);
      }
    }, 75);
  };

  return (
    <div className="classroom-tool-panel classroom-random-panel">
      <div className="classroom-tool-heading">
        <div>
          <span className="classroom-tool-kicker">CLASSROOM TOOL</span>
          <h3>🎲 Gọi tên ngẫu nhiên</h3>
        </div>
        <span className="random-count">{loading ? '...' : `${classrooms.length} lớp`}</span>
      </div>

      <div className="random-classroom-toolbar">
        <label className="random-classroom-select-wrap" htmlFor="classroom-select">
          <span>Lớp đang dùng</span>
          <select id="classroom-select" value={selectedClassroom?.id || ''} onChange={(event) => setSelectedId(event.target.value)} disabled={loading || classrooms.length === 0 || rolling}>
            {classrooms.length === 0 && <option value="">Chưa có lớp</option>}
            {classrooms.map((classroom) => <option key={classroom.id} value={classroom.id}>{classroom.name} · {classroom.students.length} bạn</option>)}
          </select>
        </label>
        <button className="random-new-class-button" onClick={openCreate}>＋ Tạo lớp</button>
      </div>

      {managerOpen ? (
        <div className="classroom-roster-manager">
          <div className="classroom-manager-head">
            <div>
              <span className="classroom-tool-kicker">SỔ LỚP LƯU TRÊN MÁY</span>
              <strong>{editingId ? 'Sửa thông tin lớp' : 'Tạo lớp mới'}</strong>
            </div>
            <button className="classroom-tools-close" onClick={() => setManagerOpen(false)} aria-label="Đóng form lớp">×</button>
          </div>
          <label className="classroom-form-label" htmlFor="classroom-name">Tên lớp</label>
          <input id="classroom-name" className="classroom-text-input" value={draftName} onChange={(event) => setDraftName(event.target.value)} placeholder="Ví dụ: 12A1 · Tiếng Anh" />
          <label className="classroom-form-label" htmlFor="classroom-students">Danh sách học sinh <small>(mỗi dòng một tên)</small></label>
          <textarea id="classroom-students" className="random-names-input classroom-students-input" value={draftStudents} onChange={(event) => setDraftStudents(event.target.value)} placeholder={'Nguyễn An\nTrần Bình\nLê Chi'} rows={6} />
          <label className="classroom-form-label" htmlFor="classroom-policy">Cách gọi tên</label>
          <select id="classroom-policy" className="classroom-policy-select" value={draftPolicy} onChange={(event) => setDraftPolicy(event.target.value as RandomPolicy)}>
            {POLICY_OPTIONS.map((option) => <option key={option.value} value={option.value}>{option.label}</option>)}
          </select>
          <div className="classroom-form-preview">{parseNames(draftStudents).length || 0} tên hợp lệ · Dữ liệu được lưu trong IndexedDB của trình duyệt này.</div>
          {formError && <p className="classroom-form-error">⚠ {formError}</p>}
          <div className="classroom-manager-actions">
            <button className="random-clear-button" onClick={() => setManagerOpen(false)}>Hủy</button>
            <button className="random-call-button" onClick={() => void saveDraft()}>✓ Lưu lớp</button>
          </div>
        </div>
      ) : !currentClassroom ? (
        <div className="classroom-roster-empty">
          <span>✦</span>
          <strong>Tạo lớp một lần, dùng cả năm</strong>
          <p>Dán danh sách học sinh vào sổ lớp. Lần sau chỉ cần chọn lớp và bấm gọi tên.</p>
          <button className="random-call-button" onClick={openCreate}>＋ Tạo lớp đầu tiên</button>
        </div>
      ) : (
        <>
          <div className="classroom-selected-meta">
            <div><strong>{currentClassroom.name}</strong><span>{currentNames.length} học sinh · {policyLabel(currentClassroom.policy)}</span></div>
            <div className="classroom-meta-actions">
              <button onClick={openEdit} disabled={rolling}>✎ Sửa</button>
              <button onClick={() => void deleteCurrentClassroom()} disabled={rolling} aria-label={`Xóa lớp ${currentClassroom.name}`}>×</button>
            </div>
          </div>
          <div className={`random-winner ${rolling ? 'is-rolling' : ''} ${winner ? 'has-winner' : ''}`} aria-live="polite">
            <span className="random-sparkle">✦</span>
            <strong>{displayName}</strong>
            <span>{rolling ? 'Đang chọn...' : winner ? `Đã gọi từ ${currentClassroom.name}` : 'Sẵn sàng gọi tên'}</span>
          </div>
          <div className="classroom-daily-row">
            <span>Hôm nay đã gọi <b>{pickedToday}</b> lượt</span>
            <button onClick={() => void resetToday()}>↻ Đặt lại lượt</button>
          </div>
          <div className="random-actions">
            <button className="random-call-button" onClick={chooseStudent} disabled={rolling || currentNames.length === 0 || exhausted}>
              {rolling ? '✨ Đang quay...' : exhausted ? '✓ Đã đủ lượt hôm nay' : '🎲 Gọi một bạn'}
            </button>
            <button className="random-clear-button" onClick={openEdit} disabled={rolling}>Sửa lớp</button>
          </div>
          {statusMessage && <p className="classroom-status-message">{statusMessage}</p>}
        </>
      )}
    </div>
  );
}

export function ClassroomTools({ presentation }: ClassroomToolsProps) {
  const [open, setOpen] = useState(false);
  const [activeTool, setActiveTool] = useState<ToolId | null>(null);
  const [position, setPosition] = useState<ToolPosition | null>(readSavedToolPosition);
  const [dragging, setDragging] = useState(false);
  const toolRef = useRef<HTMLElement>(null);
  const dragRef = useRef<{ pointerX: number; pointerY: number; left: number; top: number } | null>(null);

  useEffect(() => {
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        setActiveTool(null);
        setOpen(false);
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, []);

  useEffect(() => {
    try {
      if (position) localStorage.setItem(TOOL_POSITION_KEY, JSON.stringify(position));
      else localStorage.removeItem(TOOL_POSITION_KEY);
    } catch {
      // Position memory is a convenience; blocked storage should not affect the tools.
    }
  }, [position]);

  useEffect(() => {
    const handleResize = () => {
      if (!position || !toolRef.current) return;
      const rect = toolRef.current.getBoundingClientRect();
      setPosition(clampToolPosition(position, rect.width, rect.height));
    };
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, [position]);

  useEffect(() => {
    if (!dragging) return undefined;
    const handlePointerMove = (event: globalThis.PointerEvent) => {
      const start = dragRef.current;
      const node = toolRef.current;
      if (!start || !node) return;
      const rect = node.getBoundingClientRect();
      setPosition(clampToolPosition({
        left: start.left + event.clientX - start.pointerX,
        top: start.top + event.clientY - start.pointerY,
      }, rect.width, rect.height));
    };
    const stopDragging = () => {
      dragRef.current = null;
      setDragging(false);
    };
    window.addEventListener('pointermove', handlePointerMove);
    window.addEventListener('pointerup', stopDragging);
    window.addEventListener('pointercancel', stopDragging);
    return () => {
      window.removeEventListener('pointermove', handlePointerMove);
      window.removeEventListener('pointerup', stopDragging);
      window.removeEventListener('pointercancel', stopDragging);
    };
  }, [dragging]);

  const startDragging = (event: ReactPointerEvent<HTMLButtonElement>) => {
    const node = toolRef.current;
    if (!node) return;
    event.preventDefault();
    const rect = node.getBoundingClientRect();
    const start = position || { left: rect.left, top: rect.top };
    dragRef.current = { pointerX: event.clientX, pointerY: event.clientY, left: start.left, top: start.top };
    setPosition(start);
    setDragging(true);
    event.currentTarget.setPointerCapture?.(event.pointerId);
  };

  const resetPosition = () => {
    dragRef.current = null;
    setDragging(false);
    setPosition(null);
  };

  const toggleTool = (tool: ToolId) => {
    setOpen(true);
    setActiveTool((current) => current === tool ? null : tool);
  };

  return (
    <aside
      ref={toolRef}
      className={`classroom-tools ${open ? 'is-open' : ''} ${dragging ? 'is-dragging' : ''}`}
      style={position ? { left: `${position.left}px`, top: `${position.top}px`, right: 'auto', bottom: 'auto' } : undefined}
      aria-label="Hộp công cụ lớp học"
    >
      {open && (
        <div className="classroom-tools-popover">
          <div className="classroom-tools-popover-head">
            <div>
              <span className="classroom-tools-overline">TRÌNH CHIẾU</span>
              <strong>Hộp công cụ lớp học</strong>
            </div>
            <div className="classroom-tools-head-actions">
              <button className="classroom-tools-drag-handle" onPointerDown={startDragging} title="Kéo để di chuyển hộp công cụ" aria-label="Kéo để di chuyển hộp công cụ">⠿ Kéo</button>
              <button className="classroom-tools-position-reset" onClick={resetPosition} title="Đưa về góc mặc định" aria-label="Đưa hộp công cụ về góc mặc định">↙</button>
              <button className="classroom-tools-close" onClick={() => setOpen(false)} aria-label="Đóng hộp công cụ">×</button>
            </div>
          </div>
          <div className={`classroom-tools-tabs ${presentation ? 'has-presentation' : ''}`}>
            {presentation && (
              <button className={activeTool === 'presentation' ? 'is-active' : ''} onClick={() => toggleTool('presentation')}>
                <span>⚙</span> Cài đặt
              </button>
            )}
            <button className={activeTool === 'timer' ? 'is-active' : ''} onClick={() => toggleTool('timer')}>
              <span>⏱</span> Đồng hồ
            </button>
            <button className={activeTool === 'random' ? 'is-active' : ''} onClick={() => toggleTool('random')}>
              <span>🎲</span> Gọi tên
            </button>
          </div>
          {activeTool === 'presentation' && presentation && <PresentationSettingsTool controls={presentation} />}
          {activeTool === 'timer' && <TimerTool />}
          {activeTool === 'random' && <RandomStudentTool />}
          {!activeTool && (
            <div className="classroom-tools-empty">
              <span>✦</span>
              <strong>Chọn một công cụ để bắt đầu</strong>
              <p>Các tiện ích dạy học nhanh sẽ được bổ sung tại đây.</p>
            </div>
          )}
        </div>
      )}
      <button
        className={`classroom-tools-launcher ${open ? 'is-active' : ''}`}
        onClick={() => setOpen((current) => !current)}
        aria-expanded={open}
        aria-label="Mở hộp công cụ lớp học"
      >
        <span className="classroom-tools-launcher-icon">{open ? '×' : '✦'}</span>
        <span>{open ? 'Đóng công cụ' : 'Công cụ lớp học'}</span>
        {!open && <span className="classroom-tools-launcher-dot" />}
      </button>
    </aside>
  );
}
