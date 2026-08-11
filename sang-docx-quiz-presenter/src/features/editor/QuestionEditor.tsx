import React, { useEffect, useRef, useState } from "react";
import katex from "katex";
import type {
  QuizDocument,
  Question,
  QuestionGroup,
  QuestionType,
  ContentBlock,
  SolutionStep,
} from "../../models/quiz";
import { TYPE_LABELS } from "../../config/questionPatterns";
import { uid } from "../../models/quiz";
import { ContentRenderer } from "../../components/ContentRenderer";
import { getSubjectProfile, type SubjectFamily } from "../../config/subjectProfiles";
import { sanitizeRichText } from "../../utils/richText";

const textOf = (b: ContentBlock[]) =>
  b
    .map((x) =>
      x.kind === "paragraph" ? x.text
      : x.kind === "math" && x.latex ? (x.display ? `$$${x.latex}$$` : `$${x.latex}$`)
      : ""
    )
    .filter(Boolean)
    .join(" ")
    .trim();

const setText = (b: ContentBlock[], text: string): ContentBlock[] => [
  {
    id: b.find((x) => x.kind === "paragraph")?.id || uid("p"),
    kind: "paragraph",
    text,
  },
];

const solutionText = (steps?: SolutionStep[]) =>
  (steps || [])
    .map((s) => textOf(s.content))
    .filter(Boolean)
    .join("\n");

const setSolutionText = (text: string): SolutionStep[] => [
  {
    id: uid("sol"),
    content: setText([], text),
  },
];

// Snippets are inserted through execCommand("insertHTML"). Encode literal
// programming symbols first, otherwise <html>, </td> or && can be interpreted
// as markup instead of appearing as Tin học text in the editor.
const encodeEditorText = (text: string) => text
  .replace(/&/gu, '&amp;')
  .replace(/</gu, '&lt;')
  .replace(/>/gu, '&gt;');

function EditorToolbar({
  onInsert,
  onFormat,
  onBeforeAction,
  family = "stem",
  profileId,
}: {
  onInsert: (snippet: string) => void;
  onFormat?: (command: string, value?: string) => void;
  onBeforeAction?: () => void;
  family?: SubjectFamily;
  profileId?: string;
}) {
  const [showImgModal, setShowImgModal] = useState(false);
  const [imgData, setImgData] = useState<string | null>(null);
  const [imgAlign, setImgAlign] = useState<'center' | 'left' | 'right'>('center');
  const [imgWidth, setImgWidth] = useState<number>(60);

  const formats = [
    { label: "B", title: "In đậm", command: "bold", style: { fontWeight: 800 } },
    { label: "I", title: "In nghiêng", command: "italic", style: { fontStyle: 'italic' } },
    { label: "U", title: "Gạch chân", command: "underline", style: { textDecoration: 'underline' } },
    { label: "🔴", title: "Màu đỏ", command: "foreColor", value: "#ef4444" },
    { label: "🔵", title: "Màu xanh", command: "foreColor", value: "#2563eb" },
    { label: "🟢", title: "Màu xanh lá", command: "foreColor", value: "#16a34a" },
    { label: "🟡", title: "Tô vàng", command: "hiliteColor", value: "#fef08a" },
    { label: "• Danh sách", title: "Gạch đầu dòng", code: "\n• Ý 1\n• Ý 2\n" },
    { label: "1. Số", title: "Đánh số thứ tự", code: "\n1. Ý 1\n2. Ý 2\n" },
  ];

  const mathSymbols = [
    { title: "Phân số", display: "\\dfrac{a}{b}", code: "$\\dfrac{a}{b}$" },
    { title: "Mũ / Bình phương", display: "x^2", code: "$x^2$" },
    { title: "Chỉ số dưới", display: "u_n", code: "$u_n$" },
    { title: "Căn bậc hai", display: "\\sqrt{x}", code: "$\\sqrt{x}$" },
    { title: "Căn bậc n", display: "\\sqrt[n]{x}", code: "$\\sqrt[n]{x}$" },
    { title: "Véctơ", display: "\\vec{a}", code: "$\\vec{a}$" },
    { title: "Hệ HOẶC (ngoặc vuông)", display: "\\left[\\begin{array}{l}a\\\\b\\end{array}\\right.", code: "$\\left[\\begin{array}{l}x=1\\\\x=2\\end{array}\\right.$" },
    { title: "Hệ VÀ (ngoặc nhọn)", display: "\\begin{cases}a\\\\b\\end{cases}", code: "$\\begin{cases} x=1 \\\\ y=2 \\end{cases}$" },
    { title: "Tích phân", display: "\\int_a^b", code: "$\\int_{a}^{b} f(x)dx$" },
    { title: "Giới hạn", display: "\\lim_{x\\to 0}", code: "$\\lim_{x \\to 0}$" },
    { title: "Góc", display: "\\widehat{A}", code: "$\\widehat{ABC}$" },
    { title: "Độ", display: "90^\\circ", code: "$90^\\circ$" },
    { title: "Tập R", display: "\\mathbb{R}", code: "$\\mathbb{R}$" },
    { title: "Tập N", display: "\\mathbb{N}", code: "$\\mathbb{N}$" },
    { title: "Hợp", display: "\\cup", code: "$\\cup$" },
    { title: "Giao", display: "\\cap", code: "$\\cap$" },
    { title: "Song song", display: "\\parallel", code: "$\\parallel$" },
    { title: "Vuông góc", display: "\\perp", code: "$\\perp$" },
    { title: "Mọi", display: "\\forall", code: "$\\forall$" },
    { title: "Tồn tại", display: "\\exists", code: "$\\exists$" },
    { display: "\\alpha", code: "$\\alpha$" },
    { display: "\\beta", code: "$\\beta$" },
    { display: "\\pi", code: "$\\pi$" },
    { display: "\\Delta", code: "$\\Delta$" },
    { display: "\\in", code: "$\\in$" },
    { display: "\\Rightarrow", code: "$\\Rightarrow$" },
    { display: "\\Leftrightarrow", code: "$\\Leftrightarrow$" },
  ];
  const subjectSnippets = profileId === "informatics-thpt-v1"
    ? [
        { label: "<html>", title: "Thẻ HTML mở/đóng", code: encodeEditorText("<html></html>") },
        { label: "<a>", title: "Liên kết HTML", code: encodeEditorText('<a href="URL">Nội dung</a>') },
        { label: "<img>", title: "Ảnh HTML", code: encodeEditorText('<img src="anh.jpg" alt="mô tả">') },
        { label: "SQL", title: "Mẫu truy vấn SQL", code: "SELECT * FROM TableName WHERE id = '…'" },
        { label: "Python", title: "Vòng lặp Python", code: "for i in range(n): " },
        { label: "C++", title: "Điều kiện C++", code: encodeEditorText("if (condition) { … }") },
        { label: "==", title: "So sánh bằng", code: " == " },
        { label: "≤ ≥", title: "So sánh nhỏ/lớn hơn hoặc bằng", code: " ≤  ≥ " },
        { label: "Đúng/Sai", title: "Cặp đáp án Đúng/Sai", code: "Đúng – Sai" },
      ]
    : profileId === "chemistry-thpt-v1"
    ? [
        { label: "H₂O", title: "Công thức hóa học", code: "H₂O" },
        { label: "⇌", title: "Phản ứng thuận nghịch", code: " ⇌ " },
        { label: "↑", title: "Khí thoát ra", code: "↑" },
        { label: "↓", title: "Kết tủa", code: "↓" },
        { label: "Δ", title: "Điều kiện đun nóng", code: "Δ" },
        { label: "pH", title: "Độ pH", code: "pH = " },
        { label: "Nguồn", title: "Nguồn thí nghiệm", code: "Nguồn: " },
      ]
    : profileId === "civics-thpt-v1"
    ? [
        { label: "Chủ thể", title: "Chủ thể trong tình huống", code: "Chủ thể: " },
        { label: "Hành vi", title: "Hành vi cần phân tích", code: "Hành vi: " },
        { label: "Căn cứ", title: "Căn cứ pháp lý", code: "Căn cứ: " },
        { label: "Điều", title: "Điều luật", code: "Điều …, khoản …: " },
        { label: "Nguồn", title: "Nguồn văn bản", code: "Nguồn: " },
      ]
    : profileId === "literature-thpt-v1"
    ? [
        { label: "“…”", title: "Trích dẫn văn bản", code: "“trích dẫn”" },
        { label: "[ … ]", title: "Lược dẫn", code: "[…]" },
        { label: "Xuất xứ", title: "Chú thích xuất xứ", code: "Xuất xứ: " },
        { label: "Dẫn chứng", title: "Nhãn dẫn chứng", code: "Dẫn chứng: " },
        { label: "Ý chính", title: "Nhãn ý chính", code: "Ý chính: " },
      ]
    : family === "language"
    ? [
        { label: "____", title: "Chỗ trống", code: "____" },
        { label: "/…/", title: "Phiên âm", code: "/phonetic/" },
        { label: "“…”", title: "Trích dẫn", code: "“trích dẫn”" },
        { label: "Nguồn", title: "Chú thích nguồn", code: "Nguồn: " },
      ]
    : family === "social"
    ? [
        { label: "Tư liệu", title: "Nhãn tư liệu", code: "Tư liệu: " },
        { label: "→", title: "Quan hệ / diễn tiến", code: " → " },
        { label: "Mốc", title: "Mốc thời gian", code: "Thời gian: " },
        { label: "Nguồn", title: "Nguồn dữ liệu", code: "Nguồn: " },
      ]
    : family === "primary"
    ? [
        { label: "□", title: "Ô điền đáp án", code: "□" },
        { label: "✓", title: "Dấu hoàn thành", code: "✓" },
        { label: "→", title: "Mũi tên", code: " → " },
      ]
    : [
        { label: "Đơn vị", title: "Nhắc ghi đơn vị", code: " (đơn vị: …)" },
        { label: "Dữ kiện", title: "Nhãn dữ kiện", code: "Dữ kiện: " },
      ];
  const visibleMathSymbols = family === "stem" ? mathSymbols : family === "primary" ? mathSymbols.slice(0, 6) : [];

  const handleConfirmInsertImage = () => {
    if (!imgData) return;
    const marginStr =
      imgAlign === 'center' ? '8px auto'
      : imgAlign === 'left' ? '8px auto 8px 0'
      : '8px 0 8px auto';
    const imgTag = `<img src="${imgData}" style="max-width:${imgWidth}%; display:block; margin:${marginStr}; border-radius:8px;" />`;
    onInsert(imgTag);
    setShowImgModal(false);
    setImgData(null);
  };

  return (
    <div className="editor-toolbar" style={{ background: '#f1f5f9', border: '1px solid #cbd5e1', borderBottom: 'none', borderRadius: '10px 10px 0 0', padding: '6px 10px', display: 'flex', flexDirection: 'column', gap: '6px' }}>
      <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px', alignItems: 'center' }}>
        <div style={{ display: 'inline-flex', gap: '2px', background: '#fff', padding: '2px', borderRadius: '6px', border: '1px solid #cbd5e1' }}>
          {formats.map((item, idx) => (
            <button
              key={idx}
              type="button"
              onMouseDown={(event) => { event.preventDefault(); onBeforeAction?.(); }}
              onClick={() => item.command && onFormat ? onFormat(item.command, item.value) : onInsert(item.code || "")}
              style={{ background: 'transparent', border: 'none', borderRadius: '4px', padding: '3px 7px', fontSize: '12px', cursor: 'pointer', color: '#1e293b', ...item.style }}
              title={item.title}
            >
              {item.label}
            </button>
          ))}
        </div>

        <button
          type="button"
          onMouseDown={(event) => { event.preventDefault(); onBeforeAction?.(); }}
          onClick={() => setShowImgModal(true)}
          style={{ background: '#ecfdf5', border: '1px solid #6ee7b7', color: '#047857', borderRadius: '6px', padding: '4px 10px', fontSize: '12px', fontWeight: 700, cursor: 'pointer', display: 'inline-flex', alignItems: 'center', gap: '4px' }}
        >
          📷 Chèn ảnh (Size/Lề)
        </button>

        <div style={{ display: 'inline-flex', gap: '3px', background: '#fff', padding: '2px', borderRadius: '6px', border: '1px solid #cbd5e1' }}>
          {subjectSnippets.map((item) => (
            <button key={item.title} type="button" onMouseDown={(event) => { event.preventDefault(); onBeforeAction?.(); }} onClick={() => onInsert(item.code)} title={item.title} style={{ background: '#fff', border: 'none', borderRadius: '4px', padding: '3px 7px', fontSize: '11px', cursor: 'pointer', color: '#334155', fontWeight: 700 }}>{item.label}</button>
          ))}
        </div>

        <div style={{ display: 'inline-flex', flexWrap: 'wrap', gap: '3px', alignItems: 'center', marginLeft: 'auto' }}>
          {visibleMathSymbols.map((item, index) => {
            let html = item.display;
            try {
              html = katex.renderToString(item.display, { throwOnError: false });
            } catch {}
            return (
              <button
                key={index}
                type="button"
                onMouseDown={(event) => { event.preventDefault(); onBeforeAction?.(); }}
                onClick={() => onInsert(item.code)}
                style={{ background: '#fff', border: '1px solid #cbd5e1', borderRadius: '5px', padding: '2px 6px', fontSize: '12px', cursor: 'pointer', display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
                title={item.title || item.code}
                dangerouslySetInnerHTML={{ __html: html }}
              />
            );
          })}
        </div>
      </div>

      {showImgModal && (
        <div style={{ position: 'fixed', inset: 0, background: 'rgba(15,23,42,0.5)', zIndex: 999, display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '16px' }}>
          <div style={{ background: '#fff', borderRadius: '14px', width: '100%', maxWidth: '440px', padding: '20px', boxShadow: '0 20px 25px -5px rgba(0,0,0,0.15)' }}>
            <h3 style={{ margin: '0 0 14px', fontSize: '15px', fontWeight: 800, color: 'var(--n800)' }}>📷 Chèn Ảnh (Tùy chọn Kích thước & Vị trí)</h3>

            <label style={{ display: 'block', marginBottom: '14px' }}>
              <span style={{ fontSize: '13px', fontWeight: 700, display: 'block', marginBottom: '6px' }}>1. Chọn tệp ảnh từ máy tính</span>
              <input
                type="file"
                accept="image/*"
                onChange={(e) => {
                  const file = e.target.files?.[0];
                  if (!file) return;
                  const reader = new FileReader();
                  reader.onload = () => setImgData(String(reader.result));
                  reader.readAsDataURL(file);
                }}
                style={{ fontSize: '13px' }}
              />
            </label>

            {imgData && (
              <div style={{ textAlign: 'center', margin: '12px 0', padding: '10px', background: '#f8fafc', borderRadius: '8px', border: '1px dashed #cbd5e1' }}>
                <img src={imgData} style={{ maxWidth: `${imgWidth}%`, maxHeight: '160px', margin: imgAlign === 'center' ? '0 auto' : imgAlign === 'left' ? '0 auto 0 0' : '0 0 0 auto', display: 'block', borderRadius: '6px' }} />
              </div>
            )}

            <div style={{ marginBottom: '14px' }}>
              <span style={{ fontSize: '13px', fontWeight: 700, display: 'block', marginBottom: '6px' }}>2. Kích thước hiển thị: <b>{imgWidth}%</b> <small style={{ color: '#059669' }}>(Mặc định 60% chuẩn nhất)</small></span>
              <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                {[40, 60, 80, 100].map((w) => (
                  <button
                    key={w}
                    type="button"
                    onClick={() => setImgWidth(w)}
                    style={{ flex: 1, padding: '6px 0', border: '1px solid', borderColor: imgWidth === w ? '#10b981' : '#cbd5e1', background: imgWidth === w ? '#ecfdf5' : '#fff', color: imgWidth === w ? '#047857' : '#334155', borderRadius: '6px', fontSize: '12px', fontWeight: 700, cursor: 'pointer' }}
                  >
                    {w}% {w === 60 ? '★' : ''}
                  </button>
                ))}
              </div>
            </div>

            <div style={{ marginBottom: '20px' }}>
              <span style={{ fontSize: '13px', fontWeight: 700, display: 'block', marginBottom: '6px' }}>3. Vị trí căn lề:</span>
              <div style={{ display: 'flex', gap: '8px' }}>
                {(
                  [
                    { id: 'left', label: '⬅️ Trái' },
                    { id: 'center', label: '↔️ Giữa (Mặc định)' },
                    { id: 'right', label: '➡️ Phải' },
                  ] as const
                ).map((al) => (
                  <button
                    key={al.id}
                    type="button"
                    onClick={() => setImgAlign(al.id)}
                    style={{ flex: 1, padding: '6px 0', border: '1px solid', borderColor: imgAlign === al.id ? '#2563eb' : '#cbd5e1', background: imgAlign === al.id ? '#eff6ff' : '#fff', color: imgAlign === al.id ? '#1d4ed8' : '#334155', borderRadius: '6px', fontSize: '12px', fontWeight: 700, cursor: 'pointer' }}
                  >
                    {al.label}
                  </button>
                ))}
              </div>
            </div>

            <div style={{ display: 'flex', gap: '10px', justifyContent: 'flex-end' }}>
              <button
                type="button"
                onClick={() => { setShowImgModal(false); setImgData(null); }}
                style={{ padding: '8px 14px', border: '1px solid #cbd5e1', background: '#fff', borderRadius: '8px', cursor: 'pointer', fontSize: '13px' }}
              >
                Hủy
              </button>
              <button
                type="button"
                disabled={!imgData}
                onClick={handleConfirmInsertImage}
                style={{ padding: '8px 16px', border: 'none', background: imgData ? '#10b981' : '#cbd5e1', color: '#fff', fontWeight: 700, borderRadius: '8px', cursor: imgData ? 'pointer' : 'not-allowed', fontSize: '13px' }}
              >
                Chèn Ảnh
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

function RichTextField({
  value,
  onChange,
  family,
  profileId,
  placeholder,
  rows = 1,
  showToolbar = true,
  style,
}: {
  value: string;
  onChange: (value: string) => void;
  family: SubjectFamily;
  profileId?: string;
  placeholder?: string;
  rows?: number;
  showToolbar?: boolean;
  style?: React.CSSProperties;
}) {
  const editorRef = useRef<HTMLDivElement>(null);
  const savedRangeRef = useRef<Range | null>(null);

  useEffect(() => {
    const editor = editorRef.current;
    const nextHtml = sanitizeRichText(value);
    if (editor && editor.innerHTML !== nextHtml) editor.innerHTML = nextHtml;
  }, [value]);

  const saveSelection = () => {
    const editor = editorRef.current;
    const selection = window.getSelection();
    if (!editor || !selection || selection.rangeCount === 0) return;
    const range = selection.getRangeAt(0);
    if (editor.contains(range.commonAncestorContainer)) savedRangeRef.current = range.cloneRange();
  };

  const restoreSelection = () => {
    const editor = editorRef.current;
    if (!editor) return;
    editor.focus();
    const selection = window.getSelection();
    if (!selection) return;
    selection.removeAllRanges();
    if (savedRangeRef.current && editor.contains(savedRangeRef.current.commonAncestorContainer)) {
      selection.addRange(savedRangeRef.current);
      return;
    }
    const range = document.createRange();
    range.selectNodeContents(editor);
    range.collapse(false);
    selection.addRange(range);
  };

  const commit = () => {
    const editor = editorRef.current;
    if (editor) onChange(sanitizeRichText(editor.innerHTML));
  };

  const insertHtml = (snippet: string) => {
    restoreSelection();
    document.execCommand("insertHTML", false, snippet);
    commit();
    saveSelection();
  };

  const formatSelection = (command: string, value?: string) => {
    restoreSelection();
    document.execCommand(command, false, value);
    commit();
    saveSelection();
  };

  return (
    <div className={`rich-text-field ${showToolbar ? "rich-text-field-with-tools" : ""}`}>
      {showToolbar && <EditorToolbar family={family} profileId={profileId} onInsert={insertHtml} onFormat={formatSelection} onBeforeAction={saveSelection} />}
      <div
        ref={editorRef}
        contentEditable
        suppressContentEditableWarning
        data-placeholder={placeholder}
        onInput={commit}
        onBlur={saveSelection}
        style={{
          width: '100%',
          minHeight: `${Math.max(1, rows) * 24 + 18}px`,
          padding: '10px',
          overflowY: rows > 4 ? 'auto' : undefined,
          border: '1px solid var(--n300)',
          borderRadius: showToolbar ? '0 0 10px 10px' : '10px',
          outline: 'none',
          whiteSpace: 'pre-wrap',
          lineHeight: 1.5,
          ...style,
        }}
      />
    </div>
  );
}

export function QuestionEditor({
  quiz,
  setQuiz,
  selected,
  onAiSolve,
}: {
  quiz: QuizDocument;
  setQuiz: (q: QuizDocument) => void;
  selected: string;
  onAiSolve?: (question: Question, group?: QuestionGroup) => Promise<string>;
}) {
  const [activeToolId, setActiveToolId] = useState<string | null>(null);
  const [editingGroupId, setEditingGroupId] = useState<string | null>(null);
  const [aiSolving, setAiSolving] = useState(false);
  const [aiSolveError, setAiSolveError] = useState("");
  const q = quiz.questions.find((x) => x.id === selected);
  if (!q) return <div className="empty">Chọn một câu để sửa.</div>;
  const profile = getSubjectProfile(quiz.profile?.id);
  const literatureOpenReading = profile.id === "literature-thpt-v1" && q.sectionId === "reading" && q.type === "short-answer";
  const currentGroup = quiz.groups?.find((group) => group.id === q.groupId);
  const editingGroup = quiz.groups?.find((group) => group.id === editingGroupId);
  const update = (patch: Partial<Question>) =>
    setQuiz({
      ...quiz,
      questions: quiz.questions.map((x) =>
        x.id === q.id ? { ...x, ...patch } : x,
      ),
    });
  const assignGroup = (groupId: string) => {
    const groups = (quiz.groups || []).map((group) => ({
      ...group,
      questionIds: group.id === groupId
        ? [...new Set([...group.questionIds, q.id])]
        : group.questionIds.filter((questionId) => questionId !== q.id),
    }));
    setQuiz({
      ...quiz,
      groups,
      questions: quiz.questions.map((question) => question.id === q.id ? { ...question, groupId: groupId || undefined } : question),
    });
  };
  const assignSection = (sectionId: string) => {
    const sections = (quiz.sections || []).map((section) => ({
      ...section,
      questionIds: section.id === sectionId
        ? [...new Set([...section.questionIds, q.id])]
        : section.questionIds.filter((questionId) => questionId !== q.id),
    }));
    setQuiz({
      ...quiz,
      sections,
      questions: quiz.questions.map((question) => question.id === q.id ? { ...question, sectionId: sectionId || undefined } : question),
    });
  };
  const createGroup = () => {
    const id = uid("group");
    setQuiz({
      ...quiz,
      groups: [...(quiz.groups || []), { id, title: profile.family === "language" ? "Văn bản / dữ kiện chung" : "Dữ kiện chung", instruction: "Dùng dữ kiện sau để trả lời các câu trong chùm.", stimulus: [setText([], "Nhập đoạn dẫn, tư liệu, bảng hoặc giả thiết chung tại đây.")[0]], questionIds: [q.id], kind: profile.family === "language" ? "reading" : "shared-data" }],
      questions: quiz.questions.map((question) => question.id === q.id ? { ...question, groupId: id } : question),
    });
    setEditingGroupId(id);
  };
  const updateGroup = (groupId: string, patch: Partial<NonNullable<QuizDocument["groups"]>[number]>) => {
    setQuiz({ ...quiz, groups: (quiz.groups || []).map((group) => group.id === groupId ? { ...group, ...patch } : group) });
  };
  const setGroupMember = (groupId: string, questionId: string, included: boolean) => {
    const targetQuestion = quiz.questions.find((question) => question.id === questionId);
    const previousGroupId = targetQuestion?.groupId;
    setQuiz({
      ...quiz,
      groups: (quiz.groups || []).map((group) => {
        if (group.id === groupId) return { ...group, questionIds: included ? [...new Set([...group.questionIds, questionId])] : group.questionIds.filter((id) => id !== questionId) };
        if (included && group.id === previousGroupId) return { ...group, questionIds: group.questionIds.filter((id) => id !== questionId) };
        return group;
      }),
      questions: quiz.questions.map((question) => question.id === questionId ? { ...question, groupId: included ? groupId : question.groupId === groupId ? undefined : question.groupId } : question),
    });
  };
  const initializeProfileSections = () => {
    if (quiz.sections?.length) return;
    setQuiz({
      ...quiz,
      sections: profile.sections.map((template) => ({ id: uid("section"), title: template.title, instruction: template.instruction, questionIds: [] })),
    });
  };
  const changeType = (type: QuestionType) => {
    const patch: Partial<Question> = { type };
    if (type === "single-choice" && !q.choices)
      patch.choices = "ABCD"
        .split("")
        .map((label) => ({
          id: uid("c"),
          label: `${label}.`,
          content: [],
          isCorrect: null,
        }));
    if (type === "true-false" && !q.statements)
      patch.statements = "abcd".split("").map((label) => ({
        id: uid("s"),
        label,
        content: [],
      }));
    if (type === "short-answer" && !q.shortAnswer)
      patch.shortAnswer = { acceptedAnswers: [], caseSensitive: false };
    update(patch);
  };
  return (
    <div className="editor-form">
      <section className="subject-editor-assistant" style={{ marginBottom: '16px', padding: '14px', borderRadius: '14px', border: `1px solid ${profile.accent}33`, background: `${profile.accent}0d` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', gap: '12px', alignItems: 'flex-start' }}>
          <div><b style={{ color: profile.accent }}>{profile.icon} Trợ lý soạn {profile.label}</b><p style={{ margin: '4px 0 0', fontSize: '12px', color: 'var(--n600)' }}>{profile.description}</p></div>
          <div style={{ display: 'grid', justifyItems: 'end', gap: '5px' }}>
            <span style={{ whiteSpace: 'nowrap', padding: '4px 8px', borderRadius: '999px', background: '#fff', border: '1px solid var(--n200)', fontSize: '10px', fontWeight: 800 }}>Lớp {quiz.profile?.grade || profile.defaultGrade}</span>
            {!quiz.sections?.length && <button type="button" onClick={initializeProfileSections} style={{ border: 'none', background: 'transparent', color: profile.accent, fontSize: '10px', fontWeight: 800, cursor: 'pointer' }}>＋ Nạp khung phần thi</button>}
          </div>
        </div>
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '5px', marginTop: '9px' }}>
          {profile.editorSupports.map((tool) => <span key={tool} style={{ padding: '4px 7px', borderRadius: '7px', background: '#fff', border: '1px solid var(--n200)', fontSize: '10px', fontWeight: 700 }}>✓ {tool}</span>)}
        </div>
      </section>

      <div className="form-row">
        <label>
          Loại câu
          <select
            value={q.type}
            onChange={(e) => changeType(e.target.value as QuestionType)}
          >
            {Object.entries(TYPE_LABELS).filter(([value]) => profile.allowedQuestionTypes.includes(value as QuestionType)).map(([v, l]) => (
              <option key={v} value={v}>
                {l}
              </option>
            ))}
          </select>
        </label>
        <label>
          Độ tin cậy
          <select
            value={q.confidence}
            onChange={(e) =>
              update({ confidence: e.target.value as Question["confidence"] })
            }
          >
            <option value="high">Cao</option>
            <option value="medium">Vừa</option>
            <option value="low">Thấp</option>
          </select>
        </label>
      </div>

      <div className="form-row">
        <label>
          Phần thi
          <select
            value={q.sectionId || ""}
            onChange={(event) => assignSection(event.target.value)}
          >
            <option value="">Chưa gắn phần</option>
            {(quiz.sections || []).map((section) => <option key={section.id} value={section.id}>{section.title}</option>)}
          </select>
        </label>
        <label>
          Kỹ năng / chuyên đề
          <select value={q.skill || ""} onChange={(event) => update({ skill: event.target.value || undefined })}>
            <option value="">Chưa phân loại</option>
            {profile.skills.map((skill) => <option key={skill} value={skill}>{skill}</option>)}
          </select>
        </label>
      </div>

      <section className="group-editor" style={{ margin: '14px 0 18px', padding: '14px', border: '1px solid var(--n200)', borderRadius: '14px', background: '#f8fafc' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', gap: '10px', marginBottom: '9px' }}>
          <div><b>▣ Câu hỏi chùm / dữ kiện chung</b><small style={{ display: 'block', marginTop: '2px', color: 'var(--n500)' }}>Nội dung chung được soạn trong bảng riêng để mỗi câu chỉ còn phần hỏi và phương án.</small></div>
          <button type="button" onClick={() => currentGroup ? setEditingGroupId(currentGroup.id) : createGroup()} style={{ padding: '7px 10px', borderRadius: '8px', border: `1px solid ${profile.accent}`, background: '#fff', color: profile.accent, fontWeight: 800, cursor: 'pointer' }}>{currentGroup ? '▣ Mở bảng chùm' : '＋ Tạo chùm'}</button>
        </div>
        <label>
          Liên kết câu này với chùm
          <select value={q.groupId || ""} onChange={(event) => assignGroup(event.target.value)}>
            <option value="">Không dùng dữ kiện chung</option>
            {(quiz.groups || []).map((group) => <option value={group.id} key={group.id}>{group.title} · {group.questionIds.length} câu</option>)}
          </select>
        </label>
        {currentGroup && (
          <div style={{ marginTop: '10px', padding: '10px 11px', borderRadius: '10px', background: '#fff', border: '1px solid var(--n200)', display: 'flex', justifyContent: 'space-between', alignItems: 'center', gap: '10px' }}>
            <div><b style={{ fontSize: '13px' }}>{currentGroup.title}</b><small style={{ display: 'block', marginTop: '2px', color: 'var(--n500)' }}>Dùng cho {currentGroup.questionIds.length} câu · {currentGroup.questionIds.map((id) => quiz.questions.find((item) => item.id === id)?.number).filter(Boolean).join(', ')}</small></div>
            <button type="button" onClick={() => setEditingGroupId(currentGroup.id)} style={{ border: 'none', background: 'transparent', color: profile.accent, fontWeight: 800, cursor: 'pointer', whiteSpace: 'nowrap' }}>Mở bảng →</button>
          </div>
        )}
      </section>

      {editingGroup && (
        <div role="dialog" aria-modal="true" aria-label="Bảng dữ kiện chung" style={{ position: 'fixed', inset: 0, zIndex: 1200, background: 'rgba(15,23,42,0.52)', padding: '24px', display: 'grid', placeItems: 'center' }}>
          <section style={{ width: 'min(1080px, 100%)', maxHeight: 'calc(100vh - 48px)', overflow: 'auto', background: '#fff', borderRadius: '18px', boxShadow: '0 25px 60px rgba(15,23,42,0.28)' }}>
            <header style={{ padding: '18px 22px', borderBottom: '1px solid var(--n200)', display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '12px', position: 'sticky', top: 0, background: '#fff', zIndex: 1 }}>
              <div><span style={{ color: profile.accent, fontWeight: 900, fontSize: '12px', letterSpacing: '.04em' }}>DỮ KIỆN CHUNG</span><h3 style={{ margin: '3px 0 0', fontSize: '19px', color: 'var(--n800)' }}>{editingGroup.title}</h3></div>
              <button type="button" onClick={() => setEditingGroupId(null)} aria-label="Đóng bảng dữ kiện chung" style={{ width: '34px', height: '34px', borderRadius: '50%', border: '1px solid var(--n200)', background: '#fff', fontSize: '19px', cursor: 'pointer' }}>×</button>
            </header>
            <div style={{ padding: '22px', display: 'grid', gridTemplateColumns: 'minmax(0, 1.55fr) minmax(300px, .85fr)', gap: '22px', alignItems: 'start' }}>
              <div style={{ display: 'grid', gap: '12px' }}>
                <div style={{ display: 'grid', gridTemplateColumns: 'minmax(0, 1fr) minmax(0, 1fr)', gap: '12px' }}>
                  <label>Tiêu đề chùm<input value={editingGroup.title} onChange={(event) => updateGroup(editingGroup.id, { title: event.target.value })} /></label>
                  <label>Loại dữ kiện<input value={editingGroup.kind || ''} placeholder="Ví dụ: reading, experiment" onChange={(event) => updateGroup(editingGroup.id, { kind: event.target.value || undefined })} /></label>
                </div>
                <label>Chỉ dẫn chung<input value={editingGroup.instruction || ''} onChange={(event) => updateGroup(editingGroup.id, { instruction: event.target.value })} /></label>
                <label>
                  Nội dung chung / đoạn đọc / bảng dữ kiện
                  <RichTextField
                    family={profile.family}
                    profileId={profile.id}
                    rows={16}
                    value={textOf(editingGroup.stimulus)}
                    onChange={(value) => updateGroup(editingGroup.id, { stimulus: [...setText(editingGroup.stimulus, value), ...editingGroup.stimulus.filter((block) => block.kind !== 'paragraph')] })}
                    placeholder="Nhập đoạn dẫn, tư liệu, bảng hoặc giả thiết chung tại đây."
                    style={{ resize: 'vertical' } as React.CSSProperties}
                  />
                </label>
                <small style={{ color: 'var(--n500)' }}>Phần này chỉ chứa ngữ liệu dùng chung. Nội dung riêng và phương án vẫn được soạn ở từng câu.</small>
              </div>
              <aside style={{ border: '1px solid var(--n200)', borderRadius: '14px', overflow: 'hidden', background: '#f8fafc' }}>
                <div style={{ padding: '13px 14px', background: '#fff', borderBottom: '1px solid var(--n200)' }}><b>Các câu thuộc chùm</b><small style={{ display: 'block', marginTop: '2px', color: 'var(--n500)' }}>Chọn đúng những câu dùng chung ngữ liệu này.</small></div>
                <div style={{ maxHeight: '470px', overflow: 'auto' }}>
                  {quiz.questions.map((question) => {
                    const checked = editingGroup.questionIds.includes(question.id);
                    return <label key={question.id} style={{ display: 'grid', gridTemplateColumns: '24px 42px 1fr', gap: '8px', alignItems: 'center', padding: '10px 12px', borderBottom: '1px solid var(--n200)', background: checked ? `${profile.accent}0d` : 'transparent', cursor: 'pointer' }}><input type="checkbox" checked={checked} onChange={(event) => setGroupMember(editingGroup.id, question.id, event.target.checked)} /><b>Câu {question.number}</b><span style={{ fontSize: '12px', color: 'var(--n600)' }}>{TYPE_LABELS[question.type]}{question.sectionId ? ` · ${quiz.sections?.find((section) => section.id === question.sectionId)?.title || ''}` : ''}</span></label>;
                  })}
                </div>
              </aside>
            </div>
            <footer style={{ padding: '14px 22px', borderTop: '1px solid var(--n200)', display: 'flex', justifyContent: 'flex-end' }}><button type="button" onClick={() => setEditingGroupId(null)} style={{ padding: '9px 16px', border: 'none', borderRadius: '9px', background: profile.accent, color: '#fff', fontWeight: 800, cursor: 'pointer' }}>Xong</button></footer>
          </section>
        </div>
      )}

      <label>
        Nội dung câu hỏi
        <RichTextField
          family={profile.family}
          profileId={profile.id}
          rows={5}
          value={textOf(q.stem)}
          onChange={(value) => update({ stem: [...setText(q.stem, value), ...q.stem.filter((x) => x.kind !== "paragraph")] })}
        />
      </label>

      {q.stem.some((x) => x.kind === "math" && x.status === "unsupported") && (
        <div style={{ margin: '12px 0', padding: '12px 16px', background: '#fff1f2', borderRadius: '10px', border: '1px solid #fecdd3', color: '#be123c', fontSize: '13px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
          <span>⚠ Phát hiện công thức MathType OLE chưa được đọc. Hãy nhập mã LaTeX tương ứng vào ô nội dung ở trên.</span>
          <button
            onClick={() => update({ stem: q.stem.filter((x) => x.kind !== "math" || x.status !== "unsupported") })}
            style={{ background: '#be123c', color: '#fff', border: 'none', padding: '4px 10px', borderRadius: '6px', cursor: 'pointer', fontSize: '12px' }}
          >
            Xóa cảnh báo
          </button>
        </div>
      )}

      {/* DANH SÁCH ĐÁP ÁN TRẮC NGHIỆM ABCD */}
      {q.type === "single-choice" && (
        <div style={{ marginTop: '16px' }}>
          <div style={{ fontSize: '13px', fontWeight: 800, color: 'var(--g700)', marginBottom: '8px' }}>
            Các phương án trắc nghiệm:
          </div>
          {q.choices?.map((c, i) => (
            <div key={c.id} style={{ marginBottom: '8px' }}>
              <div className="option-edit">
                <input
                  type="radio"
                  name="correct"
                  checked={c.isCorrect === true}
                  onChange={() =>
                    update({
                      choices: q.choices!.map((x) => ({
                        ...x,
                        isCorrect: x.id === c.id,
                      })),
                    })
                  }
                  title="Đánh dấu đáp án đúng"
                />
                <b style={{ minWidth: '22px' }}>{c.label}</b>
                <RichTextField
                  family={profile.family}
                  profileId={profile.id}
                  showToolbar={activeToolId === c.id}
                  value={textOf(c.content)}
                  onChange={(value) => update({ choices: q.choices!.map((x, j) => j === i ? { ...x, content: setText(x.content, value) } : x) })}
                  placeholder={`Nhập phương án ${c.label}...`}
                  style={{ flex: 1, minHeight: '38px', padding: '8px 10px', borderRadius: '8px' }}
                />
                <button
                  type="button"
                  onClick={() => setActiveToolId(activeToolId === c.id ? null : c.id)}
                  style={{ background: activeToolId === c.id ? '#dcfce7' : '#fff', border: '1px solid #cbd5e1', borderRadius: '6px', padding: '4px 8px', fontSize: '12px', cursor: 'pointer', fontWeight: 700, color: activeToolId === c.id ? '#047857' : '#334155', flexShrink: 0 }}
                  title="Bật/Tắt công cụ định dạng & chèn công thức"
                >
                  📐 Công cụ
                </button>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* DANH SÁCH MỆNH ĐỀ ĐÚNG SAI a, b, c, d */}
      {q.type === "true-false" && (
        <div style={{ marginTop: '16px' }}>
          <div style={{ fontSize: '13px', fontWeight: 800, color: 'var(--g700)', marginBottom: '8px' }}>
            Các mệnh đề Đúng / Sai:
          </div>
          {q.statements?.map((s, i) => (
            <div key={s.id} style={{ marginBottom: '8px' }}>
              <div className="option-edit">
                <b style={{ minWidth: '24px' }}>{s.label})</b>
                <RichTextField
                  family={profile.family}
                  profileId={profile.id}
                  showToolbar={activeToolId === s.id}
                  value={textOf(s.content)}
                  onChange={(value) => update({ statements: q.statements!.map((x, j) => j === i ? { ...x, content: setText(x.content, value) } : x) })}
                  placeholder={`Nhập nội dung mệnh đề ${s.label})...`}
                  style={{ flex: 1, minHeight: '38px', padding: '8px 10px', borderRadius: '8px' }}
                />
                <select
                  value={s.correctValue === undefined ? "" : String(s.correctValue)}
                  onChange={(e) =>
                    update({
                      statements: q.statements!.map((x, j) =>
                        j === i
                          ? {
                              ...x,
                              correctValue:
                                e.target.value === ""
                                  ? undefined
                                  : e.target.value === "true",
                            }
                          : x,
                      ),
                    })
                  }
                >
                  <option value="">Chưa chọn</option>
                  <option value="true">Đúng</option>
                  <option value="false">Sai</option>
                </select>
                <button
                  type="button"
                  onClick={() => setActiveToolId(activeToolId === s.id ? null : s.id)}
                  style={{ background: activeToolId === s.id ? '#dcfce7' : '#fff', border: '1px solid #cbd5e1', borderRadius: '6px', padding: '4px 8px', fontSize: '12px', cursor: 'pointer', fontWeight: 700, color: activeToolId === s.id ? '#047857' : '#334155', flexShrink: 0 }}
                  title="Bật/Tắt công cụ định dạng & chèn công thức"
                >
                  📐 Công cụ
                </button>
              </div>
            </div>
          ))}
        </div>
      )}
      {q.type === "short-answer" && (literatureOpenReading ? (
        <div style={{ marginTop: '12px', padding: '12px 14px', borderRadius: '10px', border: '1px solid #fecdd3', background: '#fff1f2', color: '#9f1239', fontSize: '12px' }}>
          <b>✦ Câu Đọc hiểu mở</b><br />Không nhập một đáp án duy nhất. Hãy ghi các ý cần đạt, điều kiện chấp nhận cách diễn đạt tương đương và lời giải tham khảo ở phần bên dưới.
        </div>
      ) : (
        <div className="form-row">
          <label>
            Đáp án hợp lệ (cách nhau ;)
            <input
              value={q.shortAnswer?.acceptedAnswers.join("; ") || ""}
              onChange={(e) =>
                update({
                  shortAnswer: {
                    ...q.shortAnswer!,
                    acceptedAnswers: e.target.value
                      .split(";")
                      .map((x) => x.trim())
                      .filter(Boolean),
                  },
                })
              }
            />
          </label>
          <label>
            Sai số
            <input
              type="number"
              step="any"
              value={q.shortAnswer?.numericTolerance ?? 0}
              onChange={(e) =>
                update({
                  shortAnswer: {
                    ...q.shortAnswer!,
                    numericTolerance: Number(e.target.value),
                  },
                })
              }
            />
          </label>
        </div>
      ))}

      {/* SOẠN THẢO LỜI GIẢI / HƯỚNG DẪN GIẢI — sau nội dung và phương án */}
      <div style={{ marginTop: '20px', paddingTop: '16px', borderTop: '1px solid var(--n200)' }}>
        <div className="solution-heading-row">
          <div style={{ fontSize: '14px', fontWeight: 800, color: 'var(--g700)' }}>
            {profile.id === "literature-thpt-v1" ? "✦ Rubric chấm + lời giải tham khảo" : "💡 Lời giải chi tiết / Hướng dẫn giải"}
          </div>
          <div className="solution-actions">
            {onAiSolve && <button type="button" className="ai-solution-button" disabled={aiSolving} onClick={async () => {
              setAiSolving(true);
              setAiSolveError("");
              try {
                const generated = await onAiSolve(q, currentGroup);
                update({ solution: setSolutionText(generated) });
              } catch (error) {
                setAiSolveError(error instanceof Error ? error.message : "AI chưa tạo được lời giải.");
              } finally {
                setAiSolving(false);
              }
            }}>
              {aiSolving ? "🤖 AI đang giải…" : "🤖 AI giải chi tiết"}
            </button>}
            <small>Hoặc tự nhập bên dưới</small>
          </div>
        </div>
        {aiSolveError && <div className="ai-solution-error">{aiSolveError}</div>}
        <RichTextField
          family={profile.family}
          profileId={profile.id}
          rows={4}
          placeholder={profile.id === "literature-thpt-v1" ? "Nhập ý cần đạt, mức điểm, dàn ý hoặc lời giải tham khảo; không cần ép thành một đáp án duy nhất…" : "Nhập lời giải chi tiết (hỗ trợ công thức toán, định dạng & chèn ảnh)..."}
          value={solutionText(q.solution)}
          onChange={(value) => update({ solution: setSolutionText(value) })}
        />
      </div>

      <h3>
        Hình ảnh <small>— kéo thẻ ảnh sang câu khác ở cột trái</small>
      </h3>
      {q.stem
        .filter((x) => x.kind === "image")
        .map((img) => (
          <div
            className="image-edit"
            draggable
            onDragStart={(e) => {
              e.dataTransfer.effectAllowed = "move";
              e.dataTransfer.setData(
                "application/x-quiz-image",
                JSON.stringify({ questionId: q.id, blockId: img.id }),
              );
            }}
            key={img.id}
          >
            <span className="drag-handle">⠿</span>
            <img src={img.src} />
            <label>
              Độ rộng {img.width}%
              <input
                type="range"
                min="15"
                max="100"
                value={img.width}
                onChange={(e) =>
                  update({
                    stem: q.stem.map((x) =>
                      x.id === img.id
                        ? { ...img, width: Number(e.target.value) }
                        : x,
                    ),
                  })
                }
              />
            </label>
            <label>
              Căn
              <select
                value={img.align}
                onChange={(e) =>
                  update({
                    stem: q.stem.map((x) =>
                      x.id === img.id
                        ? { ...img, align: e.target.value as typeof img.align }
                        : x,
                    ),
                  })
                }
              >
                <option value="left">Trái</option>
                <option value="center">Giữa</option>
                <option value="right">Phải</option>
              </select>
            </label>
            <button
              onClick={() =>
                update({ stem: q.stem.filter((x) => x.id !== img.id) })
              }
            >
              Xóa
            </button>
          </div>
        ))}
      <label className="upload-small">
        + Thêm ảnh
        <input
          hidden
          type="file"
          accept="image/png,image/jpeg,image/gif,image/svg+xml,image/webp"
          onChange={(e) => {
            const f = e.target.files?.[0];
            if (!f) return;
            const reader = new FileReader();
            reader.onload = () =>
              update({
                stem: [
                  ...q.stem,
                  {
                    id: uid("img"),
                    kind: "image",
                    src: String(reader.result),
                    name: f.name,
                    alt: f.name,
                    width: 60,
                    align: "center",
                  },
                ],
              });
            reader.readAsDataURL(f);
          }}
        />
      </label>
    </div>
  );
}
