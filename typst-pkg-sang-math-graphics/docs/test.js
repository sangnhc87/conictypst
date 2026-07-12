import puppeteer from 'puppeteer';

(async () => {
  const browser = await puppeteer.launch({ args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  page.on('console', msg => console.log('PAGE LOG:', msg.text()));
  page.on('pageerror', err => console.log('PAGE ERROR:', err.stack));
  
  console.log('Navigating...');
  await page.goto('http://localhost:5175/topics/live.html', { waitUntil: 'networkidle2' });
  console.log('Waiting for init...');
  await new Promise(r => setTimeout(r, 2000));

  console.log('Setting code and clicking render...');
  await page.evaluate(() => {
    const textarea = document.querySelector('textarea');
    if (textarea) {
        textarea.value = `#import "@preview/cetz:0.3.2": *
#canvas({ draw.circle((0,0)) })`;
        textarea.dispatchEvent(new Event('input', { bubbles: true }));
    }
    const btn = document.querySelector('.btn-render');
    if (btn) btn.click();
  });
  
  await new Promise(r => setTimeout(r, 2000));
  
  const errorText = await page.evaluate(() => {
    const errEl = document.querySelector('.error');
    return errEl ? errEl.textContent : 'No error displayed';
  });
  console.log('Error displayed in UI:', errorText);

  console.log('Done.');
  await browser.close();
})();
