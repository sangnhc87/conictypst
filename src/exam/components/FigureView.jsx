/**
 * FigureView.jsx
 *
 * Renders a CeTZ figure (figSrc from question) to SVG via Typst WASM.
 * Uses compiler → vector artifact → renderer → SVG string pipeline.
 * Lazy — only starts compiling when mounted. Results are cached.
 */
import React, { useEffect, useState } from 'react';
import { getTypstCompiler, getTypstRenderer } from '../../typstCompilerSingleton';
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

    // figSrc is e.g. "cetz.canvas(length: 1cm, { ... })"
    // Wrap in # to call it as a Typst expression in markup mode
    const src = `${PAGE_HEADER}\n#${figSrc}\n`;

    const svg = await enqueue(async () => {
        const [compiler, renderer] = await Promise.all([
            getTypstCompiler(),
            getTypstRenderer(),
        ]);
        injectSys(compiler);
        compiler.addSource('/fig_render.typ', src);

        // Compile to vector artifact
        const compileResult = await compiler.compile({
            mainFilePath: '/fig_render.typ',
            format: 0, // CompileFormatEnum.vector → result is Uint8Array
        });

        if (!compileResult || !compileResult.result) {
            const diags = compileResult?.diagnostics;
            const msg = diags?.length
                ? diags.map(d => d.message || JSON.stringify(d)).join('\n')
                : 'Compile returned no result';
            throw new Error('Typst compile failed: ' + msg);
        }

        // Render vector → SVG string
        const session = await renderer.createModule(compileResult.result);
        const svgString = await renderer.renderSvg({ renderSession: session });
        return svgString;
    });

    _cache.set(figSrc, svg);
    return svg;
}

// ── Component ─────────────────────────────────────────────────────────────
export default function FigureView({ src, className = '' }) {
    const [phase, setPhase] = useState('idle');   // idle | loading | done | error
    const [svg,   setSvg]   = useState(null);
    const [errMsg, setErrMsg] = useState('');

    useEffect(() => {
        if (!src) return;
        // already cached — show instantly
        if (_cache.has(src)) { setSvg(_cache.get(src)); setPhase('done'); return; }

        let alive = true;
        setPhase('loading');
        compileFigure(src)
            .then(s  => { if (alive) { setSvg(s);    setPhase('done');  } })
            .catch(e => { if (alive) { setErrMsg(String(e)); setPhase('error'); } });
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
            <div className={`flex flex-col items-center justify-center rounded border border-dashed border-amber-300
                bg-amber-50 px-4 py-3 text-xs text-amber-600 my-3 ${className}`}>
                <span>⚠ Không thể tải hình vẽ</span>
                {errMsg && (
                    <details className="mt-1 text-[10px] text-amber-500 max-w-full">
                        <summary className="cursor-pointer">Chi tiết lỗi</summary>
                        <pre className="whitespace-pre-wrap break-all mt-1">{errMsg}</pre>
                    </details>
                )}
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
