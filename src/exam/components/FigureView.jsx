/**
 * FigureView.jsx
 *
 * Renders a CeTZ figure (figSrc from question) to SVG via Typst WASM.
 * Lazy — only starts compiling when mounted. Results are cached.
 */
import React, { useEffect, useState } from 'react';
import { getTypstCompiler } from '../../typstCompilerSingleton';
import sangExamSource   from '../../typst-system/sang-exam.typ?raw';
import mathSymSource    from '../../typst-system/math-sym.typ?raw';
import bbtSource        from '../../typst-system/bbt.typ?raw';
import geometrySource   from '../../typst-system/geometry.typ?raw';

// ── Cache ─────────────────────────────────────────────────────────────────
const _cache = new Map();
let   _sysLoaded = false;

const PAGE_HEADER = `\
#import "@preview/cetz:0.5.2": *
#import "@preview/cetz-plot:0.1.1": *
#import "/sang-exam.typ": *
#import "/math-sym.typ": *
#import "/bbt.typ": *
#import "/geometry.typ": *
#set page(width: auto, height: auto, margin: (x: 6pt, y: 6pt), fill: white)
#set text(font: "New Computer Modern", size: 10pt, lang: "vi")
`;

function injectSys(compiler) {
    if (_sysLoaded) return;
    compiler.addSource('/sang-exam.typ', sangExamSource);
    compiler.addSource('/math-sym.typ',  mathSymSource);
    compiler.addSource('/bbt.typ',       bbtSource);
    compiler.addSource('/geometry.typ',  geometrySource);
    _sysLoaded = true;
}

let _queue = Promise.resolve();
function enqueue(fn) {
    _queue = _queue.then(fn).catch(fn);
    return _queue;
}

async function compileFigure(figSrc) {
    const cached = _cache.get(figSrc);
    if (cached) return cached;

    const src = `${PAGE_HEADER}\n#${figSrc}\n`;

    const svg = await enqueue(async () => {
        const compiler = await getTypstCompiler();
        injectSys(compiler);
        compiler.addSource('/fig_render.typ', src);
        return await compiler.svg({ mainFilePath: '/fig_render.typ' });
    });

    _cache.set(figSrc, svg);
    return svg;
}

// ── Component ─────────────────────────────────────────────────────────────
export default function FigureView({ src, className = '' }) {
    const [phase, setPhase] = useState('idle');   // idle | loading | done | error
    const [svg,   setSvg]   = useState(null);

    useEffect(() => {
        if (!src) return;
        // already cached — show instantly
        if (_cache.has(src)) { setSvg(_cache.get(src)); setPhase('done'); return; }

        let alive = true;
        setPhase('loading');
        compileFigure(src)
            .then(s  => { if (alive) { setSvg(s);    setPhase('done');  } })
            .catch(() => { if (alive) { setPhase('error'); } });
        return () => { alive = false; };
    }, [src]);

    if (!src) return null;

    if (phase === 'done' && svg) {
        return (
            <div
                className={`flex justify-center overflow-x-auto my-3 ${className}`}
                dangerouslySetInnerHTML={{ __html: svg }}
            />
        );
    }

    if (phase === 'error') {
        return (
            <div className={`flex items-center justify-center rounded border border-dashed border-amber-300
                bg-amber-50 px-4 py-3 text-xs text-amber-600 my-3 ${className}`}>
                ⚠ Không thể tải hình vẽ
            </div>
        );
    }

    // loading / idle
    return (
        <div className={`flex items-center justify-center gap-2 rounded border border-dashed border-gray-200
            bg-gray-50 px-4 py-5 text-xs text-gray-400 my-3 ${className}`}>
            <svg className="h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none">
                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"/>
                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8z"/>
            </svg>
            Đang vẽ hình…
        </div>
    );
}
