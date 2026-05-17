import fs from 'fs';
import path from 'path';
import { execSync } from 'child_process';

const inputFile = process.argv[2];

if (!inputFile || !fs.existsSync(inputFile)) {
  console.error('Vui lòng cung cấp đường dẫn đến file .typ hợp lệ.');
  console.error('Sử dụng: node scripts/export-figs.js <đường-dẫn-file.typ>');
  process.exit(1);
}

const content = fs.readFileSync(inputFile, 'utf-8');

// Hàm tìm và trích xuất các block dựa trên từ khóa và cân bằng dấu ngoặc
function extractBlocks(text, keyword) {
  const blocks = [];
  let startIndex = 0;

  while ((startIndex = text.indexOf(keyword, startIndex)) !== -1) {
    // Nếu keyword có dấu '#' ở trước, lấy luôn dấu '#' (ví dụ #cetz.canvas)
    let blockStart = startIndex;
    if (startIndex > 0 && text[startIndex - 1] === '#') {
      blockStart = startIndex - 1;
    } else {
       // Thêm # vào trước nếu chưa có để nó là 1 command hợp lệ trong typst
       text = text.substring(0, startIndex) + '#' + text.substring(startIndex);
       startIndex++; 
       blockStart = startIndex - 1;
    }

    // Tìm dấu '(' đầu tiên sau keyword
    let openParenIndex = text.indexOf('(', startIndex + keyword.length);
    let openBracketIndex = text.indexOf('[', startIndex + keyword.length);
    // Cho phép gọi bằng bbt[...] (content block) hoặc bbt(...)
    if (openParenIndex === -1 && openBracketIndex === -1) {
      startIndex += keyword.length;
      continue;
    }
    
    // Nếu khoảng cách từ keyword đến dấu ngoặc quá xa, bỏ qua (ví dụ bbt.typ)
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

      // Xử lý chuỗi
      if (char === '"' && text[i - 1] !== '\\') {
        inString = !inString;
      }

      if (inString) continue;

      // Xử lý comment
      if (char === '/' && nextChar === '/') {
        inComment = true;
      }
      if (inComment && char === '\n') {
        inComment = false;
      }
      if (char === '/' && nextChar === '*') {
        inComment = true;
      }
      if (inComment && char === '*' && nextChar === '/') {
        inComment = false;
      }

      if (inComment) continue;

      if (char === '(' || char === '{' || char === '[') {
        stack.push(char);
      } else if (char === ')' || char === '}' || char === ']') {
        const last = stack.pop();
        if (
          (char === ')' && last !== '(') ||
          (char === '}' && last !== '{') ||
          (char === ']' && last !== '[')
        ) {
          // Lỗi ngoặc
          console.warn(`Lỗi cân bằng ngoặc tại dòng chứa ${keyword}`);
          break;
        }

        if (stack.length === 0) {
          endIndex = i;
          break;
        }
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

console.log('Đang trích xuất mã CeTZ và Bảng Biến Thiên...');
const cetzBlocks = extractBlocks(content, 'cetz.canvas');
const bbtBlocks = extractBlocks(content, 'bbt');

const allBlocks = [...cetzBlocks, ...bbtBlocks];

if (allBlocks.length === 0) {
  console.log('Không tìm thấy hình vẽ CeTZ hoặc Bảng biến thiên nào trong file.');
  process.exit(0);
}

console.log(`Tìm thấy ${allBlocks.length} hình vẽ. Bắt đầu xuất ảnh...`);

// Đọc file gốc để lấy các câu lệnh import
let imports = '';
const importLines = content.split('\n').filter(line => line.trim().startsWith('#import'));
importLines.forEach(line => {
  // Thay thế đường dẫn relative
  let finalLine = line;
  if (line.includes('sang-exam.typ')) {
    finalLine = '#import "/typst/sang-exam.typ": *';
  } else if (line.includes('bbt.typ')) {
    finalLine = '#import "/typst/bbt.typ": *';
  } else if (line.includes('math-sym.typ')) {
    finalLine = '#import "/typst/math-sym.typ": *';
  }
  imports += finalLine + '\n';
});

// Nội dung file tạm
let tempContent = `${imports}
#set page(width: auto, height: auto, margin: 10pt)
#show math.equation: set text(fill: black)

${allBlocks.join('\n#pagebreak()\n')}
`;

const tempDir = path.join(process.cwd(), '.temp_figs');
if (!fs.existsSync(tempDir)) {
  fs.mkdirSync(tempDir);
}

const tempTypstFile = path.join(tempDir, 'export.typ');
fs.writeFileSync(tempTypstFile, tempContent);

// Tạo thư mục xuất ảnh
const outDir = path.join(process.cwd(), 'exported_figs');
if (!fs.existsSync(outDir)) {
  fs.mkdirSync(outDir);
}

const outputPattern = path.join(outDir, 'fig-{p}.png');

try {
  console.log('Đang biên dịch ảnh bằng Typst...');
  execSync(`typst compile "${tempTypstFile}" "${outputPattern}" --root . --font-path src/assets/fonts --font-path fonts`, { stdio: 'inherit' });
  console.log(`\\nHoàn thành! Các ảnh được lưu tại thư mục: ${outDir}`);
} catch (error) {
  console.error('Lỗi khi biên dịch Typst:', error.message);
} finally {
  // Xóa file tạm
  fs.unlinkSync(tempTypstFile);
  fs.rmdirSync(tempDir);
}
