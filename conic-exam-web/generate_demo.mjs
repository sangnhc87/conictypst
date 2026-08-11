import puppeteer from 'puppeteer';
import fs from 'fs';
import path from 'path';

function getAllFiles(dirPath, arrayOfFiles) {
  const files = fs.readdirSync(dirPath);
  arrayOfFiles = arrayOfFiles || [];
  files.forEach(function(file) {
    if (fs.statSync(dirPath + "/" + file).isDirectory()) {
      if (file !== 'node_modules' && file !== '.git') {
        arrayOfFiles = getAllFiles(dirPath + "/" + file, arrayOfFiles);
      }
    } else {
      if (file.endsWith('.typ') || file.endsWith('.png') || file.endsWith('.jpg')) {
        arrayOfFiles.push(path.join(dirPath, "/", file));
      }
    }
  });
  return arrayOfFiles;
}

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  
  const rootPath = path.resolve('../typst');
  const allFiles = getAllFiles(rootPath);
  
  const filesPayload = {};
  for (const f of allFiles) {
    const rel = '/project/' + path.relative(rootPath, f).replace(/\\/g, '/');
    if (f.endsWith('.typ')) {
      filesPayload[rel] = { kind: 'text', content: fs.readFileSync(f, 'utf-8') };
    } else {
      filesPayload[rel] = { kind: 'binary', content: [...fs.readFileSync(f)] };
    }
  }
  
  await page.goto('http://localhost:5173/', { waitUntil: 'networkidle0' });
  
  const result = await page.evaluate(async (filesPayload) => {
    if (!window.__CONIC_PUBLISH_TYPST__) return { error: 'Not found' };
    try {
      const res = await window.__CONIC_PUBLISH_TYPST__({
        name: 'de-chinh-thuc-2026',
        entryPath: '/project/dethi/de-chinh-thuc-2026.typ',
        files: filesPayload
      });
      return { success: true, package: res.value };
    } catch(e) {
      return { error: e.message };
    }
  }, filesPayload);
  
  if (result.success) {
    fs.writeFileSync('public/demo-exam.json', JSON.stringify(result.package, null, 2));
    console.log('Successfully wrote public/demo-exam.json');
  } else {
    console.error('Error:', result.error);
  }
  await browser.close();
})();
