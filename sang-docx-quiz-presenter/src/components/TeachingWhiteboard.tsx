import { useEffect, useMemo, useRef, useState } from 'react';
import type { CSSProperties } from 'react';
import { Excalidraw } from '@excalidraw/excalidraw';
import '@excalidraw/excalidraw/index.css';
import type { BinaryFiles, ExcalidrawImperativeAPI } from '@excalidraw/excalidraw/types';
import type { ExcalidrawElement } from '@excalidraw/excalidraw/element/types';

type WhiteboardMode = 'overlay' | 'split';
type BoardTool = 'selection' | 'freedraw' | 'eraser' | 'text' | 'arrow' | 'rectangle';

type SavedScene = {
  elements: readonly ExcalidrawElement[];
  files?: BinaryFiles;
};

const QUICK_COLORS = ['#ef4444', '#f97316', '#2563eb', '#16a34a', '#7c3aed', '#172554'];
const STROKE_WIDTHS = [1, 2, 4] as const;
const storageKey = (boardId: string) => `conic-teaching-whiteboard:${boardId}`;

const loadScene = (boardId: string): SavedScene => {
  try {
    const raw = localStorage.getItem(storageKey(boardId));
    if (!raw) return { elements: [] };
    const parsed = JSON.parse(raw) as Partial<SavedScene>;
    return Array.isArray(parsed.elements) ? { elements: parsed.elements, files: parsed.files } : { elements: [] };
  } catch {
    return { elements: [] };
  }
};

interface TeachingWhiteboardProps {
  boardId: string;
  mode: WhiteboardMode;
  label: string;
  onClose: () => void;
}

const toolLabels: Array<{ tool: BoardTool; icon: string; label: string; shortcut: string }> = [
  { tool: 'freedraw', icon: '✎', label: 'Bút', shortcut: 'P' },
  { tool: 'eraser', icon: '⌫', label: 'Tẩy', shortcut: 'E' },
  { tool: 'selection', icon: '↖', label: 'Chọn', shortcut: 'V' },
  { tool: 'text', icon: 'T', label: 'Chữ', shortcut: 'T' },
  { tool: 'arrow', icon: '↗', label: 'Mũi tên', shortcut: 'A' },
  { tool: 'rectangle', icon: '□', label: 'Hình', shortcut: 'R' },
];

/**
 * A local-first canvas tailored for live teaching. The familiar Excalidraw
 * tools remain available, while the dock gives fast access to the actions
 * teachers use dozens of times in one lesson.
 */
export function TeachingWhiteboard({ boardId, mode, label, onClose }: TeachingWhiteboardProps) {
  const boardRef = useRef<HTMLElement | null>(null);
  const apiRef = useRef<ExcalidrawImperativeAPI | null>(null);
  const saveTimer = useRef<number | null>(null);
  const [saved, setSaved] = useState(() => loadScene(boardId));
  const [elementCount, setElementCount] = useState(saved.elements.filter((element) => !element.isDeleted).length);
  const [activeTool, setActiveTool] = useState<BoardTool>('freedraw');
  const [inkColor, setInkColor] = useState(mode === 'overlay' ? '#ef4444' : '#2563eb');
  const [strokeWidth, setStrokeWidth] = useState<number>(2);
  const [isFocused, setIsFocused] = useState(false);

  useEffect(() => {
    const next = loadScene(boardId);
    setSaved(next);
    setElementCount(next.elements.filter((element) => !element.isDeleted).length);
  }, [boardId]);

  useEffect(() => () => {
    if (saveTimer.current !== null) window.clearTimeout(saveTimer.current);
  }, []);

  useEffect(() => {
    const handleFullscreen = () => setIsFocused(document.fullscreenElement === boardRef.current);
    document.addEventListener('fullscreenchange', handleFullscreen);
    return () => document.removeEventListener('fullscreenchange', handleFullscreen);
  }, []);

  const initialData = useMemo(() => ({
    elements: saved.elements,
    files: saved.files,
    appState: {
      viewBackgroundColor: mode === 'overlay' ? 'transparent' : '#ffffff',
      currentItemStrokeColor: mode === 'overlay' ? '#ef4444' : '#2563eb',
      currentItemBackgroundColor: 'transparent',
      currentItemStrokeWidth: 2,
      currentItemRoughness: 0,
      currentItemFontFamily: 2,
    },
  }), [mode, saved]);

  const saveScene = (elements: readonly ExcalidrawElement[], files: BinaryFiles) => {
    const scene: SavedScene = { elements, files };
    const nextCount = elements.filter((element) => !element.isDeleted).length;
    setElementCount((current) => current === nextCount ? current : nextCount);
    if (saveTimer.current !== null) window.clearTimeout(saveTimer.current);
    saveTimer.current = window.setTimeout(() => {
      try {
        localStorage.setItem(storageKey(boardId), JSON.stringify(scene));
      } catch {
        // A pasted photo can exceed localStorage. The active board remains
        // usable, and Excalidraw's export can still keep that scene.
      }
    }, 450);
  };

  const applyInk = (nextColor = inkColor, nextWidth = strokeWidth) => {
    apiRef.current?.updateScene({
      appState: {
        currentItemStrokeColor: nextColor,
        currentItemStrokeWidth: nextWidth,
        currentItemRoughness: 0,
        currentItemStrokeStyle: 'solid',
      },
    });
  };

  const chooseTool = (tool: BoardTool) => {
    setActiveTool(tool);
    apiRef.current?.setActiveTool({ type: tool });
    applyInk();
  };

  const chooseColor = (color: string) => {
    setInkColor(color);
    if (activeTool !== 'eraser') {
      setActiveTool('freedraw');
      apiRef.current?.setActiveTool({ type: 'freedraw' });
    }
    applyInk(color);
  };

  const chooseStroke = (width: number) => {
    setStrokeWidth(width);
    applyInk(inkColor, width);
  };

  const triggerHistory = (key: 'z' | 'y', shiftKey = false) => {
    window.dispatchEvent(new KeyboardEvent('keydown', {
      key,
      code: `Key${key.toUpperCase()}`,
      ctrlKey: true,
      metaKey: navigator.platform.toLowerCase().includes('mac'),
      shiftKey,
      bubbles: true,
    }));
  };

  const toggleFocus = async () => {
    try {
      if (document.fullscreenElement === boardRef.current) await document.exitFullscreen();
      else await boardRef.current?.requestFullscreen();
    } catch {
      // Fullscreen is an optional convenience; all core board actions work without it.
    }
  };

  const clearBoard = () => {
    if (!window.confirm('Xóa toàn bộ nét viết trên bảng này?')) return;
    apiRef.current?.updateScene({ elements: [] });
    apiRef.current?.history.clear();
    try { localStorage.removeItem(storageKey(boardId)); } catch { /* ignore */ }
    setElementCount(0);
  };

  return (
    <section ref={boardRef} className={`teaching-whiteboard teaching-whiteboard-${mode} ${isFocused ? 'is-board-focused' : ''}`} aria-label={label}>
      <div className="teaching-whiteboard-head">
        <div>
          <span className="teaching-whiteboard-kicker">BẢNG GIẢNG · TỰ LƯU TRÊN MÁY</span>
          <strong>{label}</strong>
          <small>{elementCount ? `${elementCount} nét/đối tượng · đã tự lưu` : 'Chọn Bút rồi viết ngay — mọi công cụ nâng cao vẫn ở thanh trên'}</small>
        </div>
        <div className="teaching-whiteboard-actions">
          <button type="button" onClick={() => triggerHistory('z')} title="Hoàn tác (Ctrl/Cmd + Z)">↶</button>
          <button type="button" onClick={() => triggerHistory('z', true)} title="Làm lại (Ctrl/Cmd + Shift + Z)">↷</button>
          <button type="button" onClick={toggleFocus} title="Tập trung vào bảng">{isFocused ? '↙ Thu nhỏ' : '⛶ Tập trung'}</button>
          <button type="button" onClick={clearBoard} title="Xóa bảng hiện tại">⌫ Xóa</button>
          <button type="button" className="teaching-whiteboard-close" onClick={onClose} title="Đóng bảng">✕</button>
        </div>
      </div>
      <div className="teaching-whiteboard-canvas">
        <Excalidraw
          key={boardId}
          initialData={initialData}
          excalidrawAPI={(api) => {
            apiRef.current = api;
            // The imperative callback is invoked while Excalidraw is mounting.
            // Applying the default pen on the next frame avoids a setState-on-
            // unmounted warning while keeping the board ready to write.
            window.requestAnimationFrame(() => {
              if (apiRef.current !== api) return;
              api.setActiveTool({ type: 'freedraw' });
              applyInk();
            });
          }}
          onChange={(elements, _appState, files) => saveScene(elements, files)}
          UIOptions={{ canvasActions: { loadScene: true, saveToActiveFile: true, export: { saveFileToDisk: true } } }}
        />
      </div>
      <div className="teaching-whiteboard-dock" role="toolbar" aria-label="Công cụ bảng giảng nhanh">
        <div className="board-tool-group board-tool-group-tools">
          {toolLabels.map(({ tool, icon, label: toolLabel, shortcut }) => (
            <button
              key={tool}
              type="button"
              className={`board-tool ${activeTool === tool ? 'active' : ''}`}
              onClick={() => chooseTool(tool)}
              title={`${toolLabel} (${shortcut})`}
              aria-label={toolLabel}
            >
              <span aria-hidden="true">{icon}</span><b>{toolLabel}</b>
            </button>
          ))}
        </div>
        <span className="board-dock-divider" />
        <div className="board-tool-group board-color-picker" aria-label="Màu nét bút">
          {QUICK_COLORS.map((color) => (
            <button
              type="button"
              key={color}
              className={`board-color ${inkColor === color ? 'active' : ''}`}
              style={{ '--board-color': color } as CSSProperties}
              onClick={() => chooseColor(color)}
              aria-label={`Màu ${color}`}
              title={`Đổi màu bút`}
            />
          ))}
        </div>
        <span className="board-dock-divider" />
        <div className="board-tool-group board-width-picker" aria-label="Độ dày nét bút">
          {STROKE_WIDTHS.map((width) => (
            <button
              type="button"
              key={width}
              className={`board-width ${strokeWidth === width ? 'active' : ''}`}
              onClick={() => chooseStroke(width)}
              aria-label={`Nét ${width === 1 ? 'mảnh' : width === 2 ? 'vừa' : 'đậm'}`}
              title={`Nét ${width === 1 ? 'mảnh' : width === 2 ? 'vừa' : 'đậm'}`}
            ><i style={{ '--board-width': `${width * 1.5}px` } as CSSProperties} /></button>
          ))}
        </div>
      </div>
    </section>
  );
}
