import { useEffect, useState } from 'react';
import katex from 'katex';
import 'katex/dist/katex.min.css';
import { parseTypstContent, stripBlock } from '../../../src/exam/engine/typstToHtml.js';
import { decodeStructuredContent } from '../lib/structuredContent.js';

export default function QuestionRenderer({ item, number, value, onChange, disabled = false, reveal }) {
  const type = item.type;
  const publicData = item.public || item;
  const points = item.points ?? publicData.points;
  return (
    <article className="question-card">
      <header><span>Câu {number}</span><small>{typeLabel(type)} · {points ?? '—'} điểm</small></header>
      <RichContent svg={publicData.questionSvg || publicData.stemSvg || item.questionSvg} value={publicData.questionText || publicData.stemText || publicData.stem || item.stemText} alt={`Nội dung câu ${number}`} />
      {type === 'tn' && <ChoiceResponse options={publicData.options || []} value={value} onChange={onChange} disabled={disabled} reveal={reveal} />}
      {type === 'ds' && <TrueFalseResponse statements={publicData.statements || []} value={Array.isArray(value) ? value : []} onChange={onChange} disabled={disabled} reveal={reveal} />}
      {type === 'tln' && <ShortResponse value={value ?? ''} onChange={onChange} disabled={disabled} />}
      {type === 'tl' && <EssayResponse value={value ?? ''} onChange={onChange} disabled={disabled} />}
      {reveal?.solution && <div className="solution-box"><strong>Lời giải</strong><RichContent svg={typeof reveal.solution === 'object' ? reveal.solution.svg || reveal.solutionSvg : reveal.solutionSvg} value={typeof reveal.solution === 'string' ? reveal.solution : reveal.solution.text || reveal.solutionText} alt={`Lời giải câu ${number}`} /></div>}
    </article>
  );
}

function ChoiceResponse({ options, value, onChange, disabled, reveal }) {
  return <div className="choice-list">{options.map((option, index) => { const id = option.id || String.fromCharCode(65 + index); const label = option.label || String.fromCharCode(65 + index); const state = reveal ? (reveal.correctAnswer === id ? 'correct' : value === id ? 'wrong' : '') : ''; return <label key={id} className={`choice ${value === id ? 'is-selected' : ''} ${state ? `is-${state}` : ''}`}><input type="radio" name="choice" checked={value === id} disabled={disabled} onChange={() => onChange(id)} /><span>{label}</span><RichContent svg={option.svg || option.contentSvg} value={option.text || option.contentText || option.content} alt={`Phương án ${label}`} /></label>; })}</div>;
}

function TrueFalseResponse({ statements, value, onChange, disabled, reveal }) {
  return <div className="tf-list">{statements.map((statement, index) => { const id = statement.id || `s${index + 1}`; const label = statement.label || String.fromCharCode(97 + index); const selected = value[index]; const correct = Array.isArray(reveal?.correctAnswer) ? reveal.correctAnswer[index] : undefined; const set = (nextValue) => { const next = [...value]; while (next.length < statements.length) next.push(null); next[index] = nextValue; onChange(next); }; return <div key={id} className={`tf-row ${reveal && selected !== undefined && selected !== null && correct !== undefined ? selected === correct ? 'is-correct' : 'is-wrong' : ''}`}><span>{label})</span><RichContent svg={statement.svg || statement.contentSvg} value={statement.text || statement.contentText || statement.content} alt={`Mệnh đề ${label}`} /><div><button type="button" className={selected === true ? 'is-selected' : ''} disabled={disabled} onClick={() => set(true)}>Đúng</button><button type="button" className={selected === false ? 'is-selected' : ''} disabled={disabled} onClick={() => set(false)}>Sai</button></div></div>; })}</div>;
}

function ShortResponse({ value, onChange, disabled }) {
  return <label className="short-response"><span>Nhập đáp án</span><input value={value} disabled={disabled} maxLength="120" inputMode="decimal" autoComplete="off" placeholder="Ví dụ: -1,5 hoặc 3/4" onChange={(event) => onChange(event.target.value)} /><small>Có thể dùng dấu phẩy hoặc dấu chấm thập phân.</small></label>;
}

function EssayResponse({ value, onChange, disabled }) {
  return <label className="essay-response"><span>Bài làm tự luận</span><textarea value={value} disabled={disabled} maxLength="10000" rows="10" placeholder="Trình bày lời giải của em…" onChange={(event) => onChange(event.target.value)} /><small>Câu này được giáo viên chấm thủ công.</small></label>;
}

export function SvgContent({ svg, text, alt = '' }) {
  const [source, setSource] = useState('');
  useEffect(() => {
    let active = true;
    let revoke = null;
    setSource('');
    createSvgSource(svg).then((result) => {
      if (!active) {
        result?.revoke?.();
        return;
      }
      revoke = result?.revoke || null;
      setSource(result?.src || '');
    }).catch(() => { if (active) setSource(''); });
    return () => { active = false; revoke?.(); };
  }, [svg]);
  if (source) return <img className="typst-svg" src={source} alt={alt} />;
  return <div className="content-fallback">{String(text || '')}</div>;
}

export function RichContent({ svg, value, alt = '' }) {
  const structured = decodeStructuredContent(value);
  if (!structured) return <SvgContent svg={svg} text={value} alt={alt} />;
  return <div className="structured-content">{structured.sources.map((source, sourceIndex) => <StructuredSource key={sourceIndex} source={source} assets={structured.assets} alt={alt} />)}</div>;
}

function StructuredSource({ source, assets, alt }) {
  const clean = stripBlock(source);
  const parts = clean.split(/(@@CONIC_ASSET_\d+@@)/gu);
  return parts.map((part, index) => {
    const marker = part.match(/^@@CONIC_ASSET_(\d+)@@$/u);
    if (marker) return <SvgContent key={index} svg={assets[marker[1]]} alt={alt} />;
    return <TypstTokens key={index} source={part} />;
  });
}

function TypstTokens({ source }) {
  return parseTypstContent(source).map((token, index) => {
    if (token.type === 'inlineMath') return <MathToken key={index} token={token} displayMode={false} />;
    if (token.type === 'displayMath') return <MathToken key={index} token={token} displayMode />;
    return <span key={index} dangerouslySetInnerHTML={{ __html: token.html }} />;
  });
}

function MathToken({ token, displayMode }) {
  try {
    const html = katex.renderToString(token.latex, { displayMode, throwOnError: true, strict: false });
    const Element = displayMode ? 'div' : 'span';
    return <Element dangerouslySetInnerHTML={{ __html: html }} />;
  } catch (error) {
    return <code className="math-error" title={error.message}>{token.raw}</code>;
  }
}

async function createSvgSource(value) {
  if (!value) return null;
  if (typeof value === 'string' && value.startsWith('data:image/svg+xml')) return { src: value };
  let raw = typeof value === 'string' ? value : '';
  if (value && typeof value === 'object' && value.encoding === 'gzip-base64' && typeof value.data === 'string') {
    if (value.data.length > 1024 * 1024) throw new Error('Ảnh câu hỏi nén vượt giới hạn.');
    if (typeof DecompressionStream !== 'function') throw new Error('Trình duyệt chưa hỗ trợ giải nén đề Typst.');
    const binary = atob(value.data);
    const compressed = Uint8Array.from(binary, (character) => character.charCodeAt(0));
    const stream = new Blob([compressed]).stream().pipeThrough(new DecompressionStream('gzip'));
    raw = await new Response(stream).text();
  }
  if (raw.length > 1024 * 1024 || !/^\s*<svg[\s>]/iu.test(raw)) return null;
  const url = URL.createObjectURL(new Blob([sanitizeSvg(raw)], { type: 'image/svg+xml' }));
  return { src: url, revoke: () => URL.revokeObjectURL(url) };
}

function sanitizeSvg(raw) {
  return raw
    .replace(/<(?:script|foreignObject)\b[^>]*>[\s\S]*?<\/(?:script|foreignObject)>/giu, '')
    .replace(/\s+on[a-z]+\s*=\s*(?:"[^"]*"|'[^']*')/giu, '')
    .replace(/\s+(?:href|xlink:href)\s*=\s*(["'])(?!#|data:)[\s\S]*?\1/giu, '')
    .replace(/url\(\s*(["']?)https?:[\s\S]*?\1\s*\)/giu, 'none');
}

function typeLabel(type) {
  return ({ tn: 'Trắc nghiệm', ds: 'Đúng / Sai', tln: 'Trả lời ngắn', tl: 'Tự luận' })[type] || type;
}
