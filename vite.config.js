import { fileURLToPath } from 'node:url'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import wasm from 'vite-plugin-wasm'
import topLevelAwait from 'vite-plugin-top-level-await'
import tailwindcss from '@tailwindcss/vite'

import fs from 'node:fs'
import path from 'node:path'
import { execSync } from 'node:child_process'
import { getMockMacros, injectLayouts } from './scripts/docx_backend.js'

const appMode = process.env.VITE_APP_MODE === 'private' ? 'private' : 'public'
const workspaceDataAlias = fileURLToPath(
  new URL(`./src/typstWorkspace.${appMode}.data.js`, import.meta.url),
)

function typstExportPlugin() {
  return {
    name: 'typst-export-plugin',
    configureServer(server) {
      server.middlewares.use('/api/export-figs', (req, res) => {
        if (req.method !== 'POST') return
        
        let body = ''
        req.on('data', chunk => { body += chunk.toString() })
        
        req.on('end', () => {
          try {
            const data = JSON.parse(body)
            const content = data.content
            
            function extractBlocks(text, keyword) {
              const blocks = [];
              let startIndex = 0;
              while ((startIndex = text.indexOf(keyword, startIndex)) !== -1) {
                let blockStart = startIndex;
                if (startIndex > 0 && text[startIndex - 1] === '#') {
                   blockStart = startIndex - 1;
                } else {
                   text = text.substring(0, startIndex) + '#' + text.substring(startIndex);
                   startIndex++; 
                   blockStart = startIndex - 1;
                }
                let openParenIndex = text.indexOf('(', startIndex + keyword.length);
                let openBracketIndex = text.indexOf('[', startIndex + keyword.length);
                if (openParenIndex === -1 && openBracketIndex === -1) {
                  startIndex += keyword.length;
                  continue;
                }
                let closestParen = Math.min(openParenIndex === -1 ? Infinity : openParenIndex, openBracketIndex === -1 ? Infinity : openBracketIndex);
                if (closestParen - (startIndex + keyword.length) > 5) {
                  startIndex += keyword.length;
                  continue;
                }
                openParenIndex = closestParen;
                let stack = [];
                let endIndex = -1;
                let inString = false;
                let inComment = false;
                for (let i = openParenIndex; i < text.length; i++) {
                  const char = text[i];
                  const nextChar = text[i + 1];
                  if (char === '"' && text[i - 1] !== '\\') inString = !inString;
                  if (inString) continue;
                  if (char === '/' && nextChar === '/') inComment = true;
                  if (inComment && char === '\n') inComment = false;
                  if (char === '/' && nextChar === '*') inComment = true;
                  if (inComment && char === '*' && nextChar === '/') inComment = false;
                  if (inComment) continue;
                  if (char === '(' || char === '{' || char === '[') stack.push(char);
                  else if (char === ')' || char === '}' || char === ']') {
                    const last = stack.pop();
                    if (
                      (char === ')' && last !== '(') ||
                      (char === '}' && last !== '{') ||
                      (char === ']' && last !== '[')
                    ) {
                      break;
                    }
                    if (stack.length === 0) { endIndex = i; break; }
                  }
                }
                if (endIndex !== -1) {
                  blocks.push(text.substring(blockStart, endIndex + 1));
                  startIndex = endIndex + 1;
                } else {
                  startIndex += keyword.length;
                }
              }
              return blocks;
            }

            const cetzBlocks = extractBlocks(content, 'cetz.canvas');
            const bbtBlocks = extractBlocks(content, 'bbt');
            const allBlocks = [...cetzBlocks, ...bbtBlocks];
            
            if (allBlocks.length === 0) {
              res.setHeader('Content-Type', 'application/json')
              return res.end(JSON.stringify({ success: false, error: 'Không tìm thấy hình CeTZ hoặc BBT nào.' }))
            }
            
            let imports = '';
            const importLines = content.split('\n').filter(line => line.trim().startsWith('#import'));
            importLines.forEach(line => {
              let finalLine = line;
              if (line.includes('sang-exam.typ')) finalLine = '#import "/typst/sang-exam.typ": *';
              else if (line.includes('bbt.typ')) finalLine = '#import "/typst/bbt.typ": *';
              else if (line.includes('math-sym.typ')) finalLine = '#import "/typst/math-sym.typ": *';
              imports += finalLine + '\n';
            });
            
            let tempContent = `${imports}
#set page(width: auto, height: auto, margin: 10pt)
#show math.equation: set text(fill: black)

${allBlocks.join('\n#pagebreak()\n')}
`;
            const tempDir = path.join(process.cwd(), '.temp_api_figs');
            if (fs.existsSync(tempDir)) fs.rmSync(tempDir, { recursive: true, force: true });
            fs.mkdirSync(tempDir);
            const tempTypstFile = path.join(tempDir, 'export.typ');
            fs.writeFileSync(tempTypstFile, tempContent);
            const outDir = path.join(tempDir, 'figs');
            fs.mkdirSync(outDir);
            const outputPattern = path.join(outDir, 'fig-{p}.png');
            try {
              execSync(`typst compile "${tempTypstFile}" "${outputPattern}" --root . --font-path src/assets/fonts --font-path fonts`, { encoding: 'utf-8' });
            } catch (typstError) {
              throw new Error(`Typst compile error: ${typstError.stderr || typstError.stdout || typstError.message}`);
            }
            const zipPath = path.join(tempDir, 'figures.zip');
            execSync(`zip -r -j "${zipPath}" "${outDir}"`, { encoding: 'utf-8' });
            const zipBuffer = fs.readFileSync(zipPath);
            fs.rmSync(tempDir, { recursive: true, force: true });
            
            res.setHeader('Content-Type', 'application/zip')
            res.setHeader('Content-Disposition', 'attachment; filename="figures.zip"')
            res.end(zipBuffer)
          } catch (error) {
          res.statusCode = 500;
          res.setHeader('Content-Type', 'application/json');
          res.end(JSON.stringify({ success: false, error: error.message }));
        }
      });
    });

    server.middlewares.use('/api/export-docx', (req, res) => {
      if (req.method !== 'POST') return;
      let body = '';
      req.on('data', chunk => { body += chunk.toString(); });
      req.on('end', () => {
        try {
          const data = JSON.parse(body);
          if (!data.content) {
            throw new Error('Không có nội dung file.');
          }
          let text = data.content;
          
          function extractBlocksForDocx(content, keyword) {
            const extracted = [];
            let sIdx = 0;
            while ((sIdx = content.indexOf(keyword, sIdx)) !== -1) {
              let blockStart = sIdx;
              let hasHash = false;
              if (sIdx > 0 && content[sIdx - 1] === '#') {
                blockStart = sIdx - 1;
                hasHash = true;
              }
              let openParenIndex = content.indexOf('(', sIdx + keyword.length);
              let openBracketIndex = content.indexOf('[', sIdx + keyword.length);
              if (openParenIndex === -1 && openBracketIndex === -1) {
                sIdx += keyword.length;
                continue;
              }
              let closestParen = Math.min(openParenIndex === -1 ? Infinity : openParenIndex, openBracketIndex === -1 ? Infinity : openBracketIndex);
              if (closestParen - (sIdx + keyword.length) > 5) {
                sIdx += keyword.length;
                continue;
              }
              openParenIndex = closestParen;
              let stack = [];
              let endIndex = -1;
              let inString = false;
              let inComment = false;
              for (let i = openParenIndex; i < content.length; i++) {
                const char = content[i];
                const nextChar = content[i + 1];
                if (char === '"' && content[i - 1] !== '\\\\') inString = !inString;
                if (inString) continue;
                if (char === '/' && nextChar === '/') inComment = true;
                if (inComment && char === '\n') inComment = false;
                if (char === '/' && nextChar === '*') inComment = true;
                if (inComment && char === '*' && nextChar === '/') inComment = false;
                if (inComment) continue;
                if (char === '(' || char === '{' || char === '[') stack.push(char);
                else if (char === ')' || char === '}' || char === ']') {
                  const last = stack[stack.length - 1];
                  if ((char === ')' && last === '(') || 
                      (char === '}' && last === '{') || 
                      (char === ']' && last === '[')) {
                    stack.pop();
                  } else {
                    break;
                  }
                  if (stack.length === 0) { endIndex = i; break; }
                }
              }
              if (endIndex !== -1) {
                extracted.push({ text: content.substring(blockStart, endIndex + 1), hasHash });
                sIdx = endIndex + 1;
              } else {
                sIdx += keyword.length;
              }
            }
            return extracted;
          }

          const cetzBlocks = extractBlocksForDocx(text, 'cetz.canvas');
          const bbtBlocks = extractBlocksForDocx(text, 'bbt');
          const allBlocks = [...cetzBlocks, ...bbtBlocks];

          let strippedContent = text.split('\n')
            .filter(line => !line.trim().startsWith('#import'))
            .filter(line => !line.trim().startsWith('#let accent'))
            .filter(line => !line.trim().startsWith('#let mode'))
            .join('\n');
          strippedContent = strippedContent.replace(/#show:\s*thpt-school-exam\.with\([\s\S]*?\n\)/g, '');
          strippedContent = strippedContent.replace(/#let\s+\(tn,\s*ds,\s*tln,\s*tl\)\s*=\s*exam-mode\([\s\S]*?\)/g, '');

          // Delay layout injection until after images are replaced

          const tempDir = path.join(process.cwd(), '.temp_api_docx');
          if (fs.existsSync(tempDir)) fs.rmSync(tempDir, { recursive: true, force: true });
          fs.mkdirSync(tempDir);
          
          if (allBlocks.length > 0) {
            const outDir = path.join(tempDir, 'figs');
            fs.mkdirSync(outDir);
            let imports = '';
            const importLines = text.split('\n').filter(line => line.trim().startsWith('#import'));
            importLines.forEach(line => {
              let finalLine = line;
              if (line.includes('sang-exam.typ')) finalLine = '#import "/typst/sang-exam.typ": *';
              else if (line.includes('bbt.typ')) finalLine = '#import "/typst/bbt.typ": *';
              else if (line.includes('math-sym.typ')) finalLine = '#import "/typst/math-sym.typ": *';
              imports += finalLine + '\n';
            });
            const tempContent = `${imports}
#set page(width: auto, height: auto, margin: 10pt)
#show math.equation: set text(fill: black)

${allBlocks.map(b => (b.hasHash ? b.text : '#' + b.text)).join('\n#pagebreak()\n')}`;
            
            const tempTypstFile = path.join(tempDir, 'export.typ');
            fs.writeFileSync(tempTypstFile, tempContent);
            const outputPattern = path.join(outDir, 'fig-{p}.png');
            try {
              execSync(`typst compile "${tempTypstFile}" "${outputPattern}" --root . --font-path src/assets/fonts --font-path fonts`, { encoding: 'utf-8' });
            } catch (typstError) {}
            allBlocks.forEach((block, index) => {
              const figName = `figs/fig-${index + 1}.png`;
              const replaceWith = block.hasHash ? `#image("${figName}")` : `image("${figName}")`;
              if (strippedContent.indexOf(block.text) === -1) {
                console.log("NOT FOUND BLOCK:", index, block.text.substring(0, 100).replace(/\n/g, '\\n'));
              }
              strippedContent = strippedContent.replace(block.text, replaceWith);
            });
          }
          
          // Inject Layouts now that images are replaced
          strippedContent = injectLayouts(strippedContent);

          const modes = ['hocsinh', 'loigiai', 'dapan'];
          const fileNames = {
            'hocsinh': 'De_HocSinh.docx',
            'loigiai': 'De_LoiGiai.docx',
            'dapan': 'De_DapAn.docx'
          };

          for (const mode of modes) {
            const mockMacros = getMockMacros(mode);
            const finalTypst = mockMacros + strippedContent;
            const pandocTypstFile = path.join(tempDir, `pandoc_${mode}.typ`);
            fs.writeFileSync(pandocTypstFile, finalTypst);
            
            try {
              const referenceDoc = path.join(process.cwd(), 'scripts', 'template.docx');
              const luaFilter = path.join(process.cwd(), 'scripts', 'tabs.lua');
              execSync(`pandoc pandoc_${mode}.typ -o "${fileNames[mode]}" --reference-doc="${referenceDoc}" --lua-filter="${luaFilter}"`, { cwd: tempDir, encoding: 'utf-8' });
            } catch (pandocError) {
              throw new Error(`Pandoc error on ${mode}: ${pandocError.stderr || pandocError.message}`);
            }
          }

          const zipPath = path.join(tempDir, 'export.zip');
          execSync(`zip -j "${zipPath}" *.docx`, { cwd: tempDir, encoding: 'utf-8' });
          const zipBuffer = fs.readFileSync(zipPath);
          fs.rmSync(tempDir, { recursive: true, force: true });
          
          res.setHeader('Content-Type', 'application/zip');
          res.setHeader('Content-Disposition', 'attachment; filename="export.zip"');
          res.end(zipBuffer);
        } catch (error) {
          res.statusCode = 500;
          res.setHeader('Content-Type', 'application/json');
          res.end(JSON.stringify({ success: false, error: error.message }));
        }
      });
    });
  }
  }
}

export default defineConfig({
  plugins: [tailwindcss(), react(), wasm(), topLevelAwait(), typstExportPlugin()],
  resolve: {
    alias: {
      '@typst-workspace-data': workspaceDataAlias,
    },
  },
  optimizeDeps: {
    exclude: [
      '@myriaddreamin/typst.ts',
      '@myriaddreamin/typst-ts-web-compiler',
      '@myriaddreamin/typst-ts-renderer',
    ],
  },
  server: {
    headers: {
      'Cross-Origin-Opener-Policy': 'same-origin',
      'Cross-Origin-Embedder-Policy': 'require-corp',
    },
  },
  build: {
    target: 'esnext',
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (id.endsWith('.wasm')) return
          if (id.includes('react')) return 'vendor-react'
          if (id.includes('@monaco-editor')) return 'vendor-monaco'
          if (id.includes('@myriaddreamin')) return 'vendor-typst'
        },
      },
    },
  },
})
