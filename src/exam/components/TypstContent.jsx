/**
 * TypstContent.jsx
 *
 * Renders a Typst content source string to HTML with KaTeX math.
 * Instant — no WASM compilation required.
 *
 * Usage:
 *   <TypstContent src="[Cho $x > 0$ là số thực.]" />
 */
import React from 'react';
import { InlineMath, BlockMath } from 'react-katex';
import 'katex/dist/katex.min.css';
import { parseTypstContent } from '../engine/typstToHtml';

function MathError({ raw }) {
    return (
        <code className="text-xs text-amber-600 bg-amber-50 px-1 rounded font-mono">
            {raw}
        </code>
    );
}

/**
 * @param {object} props
 * @param {string}  props.src       Raw Typst content, e.g. "[Cho $f(x)$]"
 * @param {string=} props.className  Extra CSS classes for the wrapper
 * @param {string=} props.as         Wrapper element tag (default: "span")
 */
export default function TypstContent({ src, className, as: Tag = 'span' }) {
    if (!src) return null;

    const tokens = parseTypstContent(src);

    return (
        <Tag className={className}>
            {tokens.map((tok, i) => {
                if (tok.type === 'inlineMath') {
                    return (
                        <InlineMath
                            key={i}
                            math={tok.latex}
                            renderError={() => <MathError raw={tok.raw} />}
                        />
                    );
                }
                if (tok.type === 'displayMath') {
                    return (
                        <BlockMath
                            key={i}
                            math={tok.latex}
                            renderError={() => <MathError raw={tok.raw} />}
                        />
                    );
                }
                // type === 'text'
                return (
                    <span
                        key={i}
                        dangerouslySetInnerHTML={{ __html: tok.html }}
                    />
                );
            })}
        </Tag>
    );
}
