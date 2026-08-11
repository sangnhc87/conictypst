import puppeteer from 'puppeteer';
import fs from 'fs';

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  
  page.on('console', msg => {
    console.log('BROWSER CONSOLE:', msg.text());
  });

  const fileContent = fs.readFileSync('../typst/dethi/de-chinh-thuc-2026.typ', 'utf-8');
  
  await page.goto('http://localhost:5173/', { waitUntil: 'networkidle0' });
  
  const result = await page.evaluate(async (content) => {
    if (!window.__CONIC_PUBLISH_TYPST__) return { error: 'Not found' };
    try {
      const res = await window.__CONIC_PUBLISH_TYPST__({
        name: 'de-chinh-thuc-2026',
        entryPath: '/project/de-chinh-thuc-2026.typ',
        files: {
          '/project/de-chinh-thuc-2026.typ': {
            kind: 'text',
            content: content
          }
        }
      });
      return { success: true, package: res.value };
    } catch(e) {
      return { error: e.message, stack: e.stack };
    }
  }, fileContent);
  
  if (result.success) {
    fs.writeFileSync('public/demo-exam.json', JSON.stringify(result.package, null, 2));
    console.log('Successfully wrote public/demo-exam.json');
  } else {
    console.error('Error:', result.error);
    console.error('Stack:', result.stack);
  }
  await browser.close();
})();
