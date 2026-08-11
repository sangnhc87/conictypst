import React from 'react';
import katex from 'katex';
import type { ContentBlock } from '../models/quiz';
import { sanitizeRichText } from '../utils/richText';

function renderTextWithMath(text: string) {
  if (!text) return null;
  // Decode HTML entities có thể còn sót từ OCR
  const decoded = text
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&nbsp;/g, " ");

  // Nội dung rich-text do giáo viên soạn được lưu trong paragraph.text.
  // Sanitise trước, sau đó mới chèn HTML KaTeX do chính ứng dụng sinh ra.
  const safeHtml = sanitizeRichText(decoded);
  const withMath = safeHtml.replace(/\$\$([\s\S]*?)\$\$|\$([^$\n]+?)\$/g, (_match, displayLatex, inlineLatex) => {
    const latex = displayLatex ?? inlineLatex ?? '';
    return katex.renderToString(latex, { displayMode: Boolean(displayLatex), throwOnError: false, strict: 'ignore' });
  });
  return <span dangerouslySetInnerHTML={{ __html: withMath.replace(/\n/g, '<br />') }} />;
}

export function ContentRenderer({ blocks }: { blocks: ContentBlock[] }) {
  const grouped: (ContentBlock | ContentBlock[])[] = [];
  let currentGroup: ContentBlock[] = [];

  for (const block of blocks) {
    const isInline = block.kind === 'paragraph' || (block.kind === 'math' && !block.display);
    if (isInline) {
      currentGroup.push(block);
    } else {
      if (currentGroup.length) {
        grouped.push(currentGroup);
        currentGroup = [];
      }
      grouped.push(block);
    }
  }
  if (currentGroup.length) grouped.push(currentGroup);

  return (
    <>
      {grouped.map((item, index) => {
        if (Array.isArray(item)) {
          return (
            <p key={index} style={{ margin: '6px 0', lineHeight: 1.6 }}>
              {item.map((block, i) => {
                if (block.kind === 'paragraph') {
                  return <React.Fragment key={block.id || i}>{renderTextWithMath(block.text)} </React.Fragment>;
                }
                if (block.kind === 'math') {
                  if (block.status === 'unsupported') {
                    return <span key={block.id || i} className="unsupported">⚠ [MathType]</span>;
                  }
                  return (
                    <span
                      key={block.id || i}
                      className="math"
                      dangerouslySetInnerHTML={{
                        __html: katex.renderToString(block.latex || '?', { displayMode: false, throwOnError: false, strict: 'ignore' }),
                      }}
                    />
                  );
                }
                return null;
              })}
            </p>
          );
        }
        const block = item;
        if (block.kind === 'math') {
          return block.status === 'unsupported' ? (
            <div key={block.id} className="unsupported">⚠ Không đọc được công thức MathType này. Hãy tải ảnh thay thế hoặc nhập LaTeX thủ công.</div>
          ) : (
            <div
              key={block.id}
              className="math display"
              style={{ margin: '12px 0', textAlign: 'center' }}
              dangerouslySetInnerHTML={{
                __html: katex.renderToString(block.latex || '?', { displayMode: true, throwOnError: false, strict: 'ignore' }),
              }}
            />
          );
        }
        if (block.kind === 'image') {
          return (
            <figure key={block.id} style={{ textAlign: block.align || 'center', margin: '12px 0' }}>
              <img src={block.src} alt={block.alt} style={{ maxWidth: '100%', width: `${block.width || 76}%`, borderRadius: 8, imageRendering: '-webkit-optimize-contrast' }} />
              {block.caption && <figcaption style={{ fontSize: 13, color: '#666', marginTop: 4 }}>{block.caption}</figcaption>}
            </figure>
          );
        }
        if (block.kind === 'list') {
          return (
            <ul key={block.id} style={{ paddingLeft: 20, margin: '8px 0' }}>
              {block.items.map((x, i) => (
                <li key={i}>{renderTextWithMath(x)}</li>
              ))}
            </ul>
          );
        }
        if (block.kind === 'table') {
          return (
            <table key={block.id} style={{ width: '100%', borderCollapse: 'collapse', margin: '12px 0' }}>
              <tbody>
                {block.rows.map((r, i) => (
                  <tr key={i}>
                    {r.map((c, j) => (
                      <td key={j} style={{ border: '1px solid #ddd', padding: '6px 10px' }}>{renderTextWithMath(c)}</td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          );
        }
        return null;
      })}
    </>
  );
}
