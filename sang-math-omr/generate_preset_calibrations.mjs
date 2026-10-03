import { execFileSync } from 'node:child_process';
import { readFileSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import puppeteer from 'puppeteer';

const sources = {
  'tn-40': 'tn-40.typ', 'tn-50': 'tn-50.typ', 'tn-60': 'tn-60.typ',
  'ds-12': 'ds-12.typ', 'tln-10': 'tln-10.typ', 'ds-20-ngang': 'ds-20-ngang.typ'
};
const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => window.TEMPLATES && window.OmrProfiles);
  const calibrated = {};
  for (const [id, file] of Object.entries(sources)) {
    const source = join(process.cwd(), 'sang-math-omr', 'templates', file);
    const svgPath = join(tmpdir(), `omr-calibration-${id}.svg`);
    execFileSync('typst', ['compile', '--format', 'svg', source, svgPath]);
    const svg = readFileSync(svgPath, 'utf8');
    calibrated[id] = await page.evaluate((type, markup) => {
      const host = document.createElement('div');
      host.style.cssText = 'position:fixed;left:-12000px;top:0;width:1000px;visibility:hidden';
      host.innerHTML = markup; document.body.appendChild(host);
      try { return _calibrateTemplateFromSvg(OmrProfiles.get(type), host.querySelector('svg')); }
      finally { host.remove(); }
    }, id, svg);
    console.log(id, calibrated[id].warp, calibrated[id].sbd[0][0]);
  }
  writeFileSync('sang-math-omr/js/preset_calibrations.js',
    `// Generated from the shipped Typst sheets by generate_preset_calibrations.mjs.\nwindow.OMR_PRESET_CALIBRATIONS = ${JSON.stringify(calibrated)};\n`);
} finally { await browser.close(); }
