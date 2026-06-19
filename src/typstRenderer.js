import { getTypstCompiler, getTypstRenderer } from './typstCompilerSingleton';

// Import raw content of system files so WASM can use them
import mathSymSource from './typst-system/math-sym.typ?raw';
import sangExamSource from './typst-system/sang-exam.typ?raw';
import bbtSource from './typst-system/bbt.typ?raw';
import geometrySource from './typst-system/geometry.typ?raw';
import themdepSource from './typst-system/themdep.typ?raw';

export function extractTypstBlocks(text) {
    const blocks = [];
    // Match both `#cetz.canvas(` and bare `cetz.canvas(` (used in fig: or #let)
    const prefixes = [
        '#cetz.canvas(', 'cetz.canvas(',
        '#canvas(',
        '#bbtv2(', '#bxd(', '#bbbt(', '#bbt-opt(', '#auto-bbt('
    ];
    let currentIndex = 0;

    while (currentIndex < text.length) {
        let foundIdx = -1;
        let matchedPrefix = '';
        for (const prefix of prefixes) {
            const idx = text.indexOf(prefix, currentIndex);
            if (idx !== -1 && (foundIdx === -1 || idx < foundIdx)) {
                foundIdx = idx;
                matchedPrefix = prefix;
            }
        }

        if (foundIdx === -1) break;

        let openCount = 1;
        let searchIdx = foundIdx + matchedPrefix.length;
        let inString = false;
        let escapeNext = false;

        while (searchIdx < text.length && openCount > 0) {
            const char = text[searchIdx];
            if (escapeNext) {
                escapeNext = false;
            } else if (char === '\\') {
                escapeNext = true;
            } else if (char === '"') {
                inString = !inString;
            } else if (!inString) {
                if (char === '(') openCount++;
                else if (char === ')') openCount--;
            }
            searchIdx++;
        }

        if (openCount === 0) {
            let fullBlock = text.substring(foundIdx, searchIdx);
            // Normalize: if block starts with bare `cetz.canvas(` (no #), add #
            if (!fullBlock.startsWith('#')) {
                fullBlock = '#' + fullBlock;
            }
            blocks.push({
                start: foundIdx,
                end: searchIdx,
                code: fullBlock,
                prefix: matchedPrefix
            });
            currentIndex = searchIdx;
        } else {
            currentIndex = foundIdx + matchedPrefix.length;
        }
    }
    return blocks;
}

export async function compileTypstToPngBuffer(blockObj) {
    const compiler = await getTypstCompiler();

    // Add ALL system files to Virtual File System
    compiler.addSource('/math-sym.typ', mathSymSource);
    compiler.addSource('/sang-exam.typ', sangExamSource);
    compiler.addSource('/bbt.typ', bbtSource);
    compiler.addSource('/geometry.typ', geometrySource);
    compiler.addSource('/themdep.typ', themdepSource);

    // Detect block type for smart wrapper
    const code = blockObj.code;
    const isCetz = code.includes('cetz.canvas');
    const isBbt = /#bbtv2\(|#bxd\(|#bbbt\(|#bbt-opt\(|#auto-bbt\(/.test(code);

    // Build the wrapper — import everything a block might need
    let imports = '';
    if (isCetz) {
        imports += `#import "@preview/cetz:0.5.2": *
`;
        imports += `#import "@preview/cetz-plot:0.1.1": *
`;
    }
    imports += `#import "/math-sym.typ": *
#import "/sang-exam.typ": *
#import "/bbt.typ": *
#import "/geometry.typ": *
#import "/themdep.typ": *
`;

    // Page setup: auto size with padding, white background
    const wrapper = `${imports}#set page(width: auto, height: auto, margin: 12pt, fill: white)
#set text(font: "New Computer Modern", size: 10pt)
#set par(leading: 0.3em)
${code}`;

    compiler.addSource('/tmp_fig.typ', wrapper);

    // Compile to vector artifact, then render to SVG
    const compileResult = await compiler.compile({ 
        mainFilePath: '/tmp_fig.typ',
        format: 0 
    });
    if (!compileResult || !compileResult.result) {
        throw new Error('Typst compile failed for figure');
    }
    const renderer = await getTypstRenderer();
    const session = await renderer.createModule(compileResult.result);
    const svgString = await renderer.renderSvg({ renderSession: session });

    // Render SVG to PNG ArrayBuffer
    return new Promise((resolve, reject) => {
        const img = new Image();
        const svgBlob = new Blob([svgString], { type: 'image/svg+xml;charset=utf-8' });
        const URL = window.URL || window.webkitURL || window;
        const blobURL = URL.createObjectURL(svgBlob);

        img.onload = () => {
            const canvas = document.createElement('canvas');
            const scale = 3; // 300dpi scaling for crisp Word rendering
            canvas.width = img.width * scale;
            canvas.height = img.height * scale;
            const ctx = canvas.getContext('2d');
            ctx.scale(scale, scale);
            ctx.drawImage(img, 0, 0);

            canvas.toBlob((blob) => {
                const reader = new FileReader();
                reader.onloadend = () => {
                    resolve({
                        buffer: reader.result,
                        width: img.width,
                        height: img.height
                    });
                };
                reader.onerror = reject;
                reader.readAsArrayBuffer(blob);
                URL.revokeObjectURL(blobURL);
            }, 'image/png');
        };
        img.onerror = (e) => {
            URL.revokeObjectURL(blobURL);
            reject(e);
        };
        img.src = blobURL;
    });
}
