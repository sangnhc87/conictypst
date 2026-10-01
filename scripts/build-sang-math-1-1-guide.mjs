import fs from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import JSZip from 'jszip';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const gallery = path.join(root, 'public/hdsd/examples/sang-math-1-1');
const output = path.join(root, 'public/hdsd/downloads/sang-math-1.1.0-preview-examples.zip');
const check = process.argv.includes('--check');
const fixedDate = new Date('2026-01-01T00:00:00.000Z');
const manifest = JSON.parse(await fs.readFile(path.join(gallery, 'manifest.json'), 'utf8'));
if (manifest.version !== '1.1.0-preview' || manifest.compiler !== '0.15.0') {
  throw new Error('Unexpected guide manifest version/compiler');
}
if (!Array.isArray(manifest.examples) || manifest.examples.length !== 10) {
  throw new Error('Guide manifest needs ten QR and OMR copy-ready examples');
}

const omrAssets = ['12-4-6ngang.typ', 'ds-12.typ', 'hybrid-28tn-12ds.typ', 'thptqg-toan-2025.typ', 'tln-10.typ', 'tn-40.typ', 'tn-50.typ', 'tn-60.typ'];
for (const file of omrAssets) {
  const source = await fs.readFile(path.join(root, 'sang-math-omr/templates', file));
  const target = path.join(gallery, file);
  if (check) {
    const copy = await fs.readFile(target);
    if (!source.equals(copy)) throw new Error(`${file} differs from sang-math-omr/templates`);
  } else {
    await fs.writeFile(target, source);
  }
}

const files = new Map();
const seenExampleFiles = new Set();
const add = async (source, destination) => {
  files.set(destination, await fs.readFile(path.join(root, source)));
};
const visit = async (directory, prefix) => {
  const entries = await fs.readdir(path.join(root, directory), { withFileTypes: true });
  for (const entry of entries) {
    const source = `${directory}/${entry.name}`;
    if (entry.isDirectory()) await visit(source, `${prefix}/${entry.name}`);
    else if (entry.name.endsWith('.typ')) await add(source, `${prefix}/${entry.name}`);
  }
};
await visit('typst-pkg-sang-math', 'typst-packages/local/sang-math/1.1.0');
for (const file of ['typst.toml', 'LICENSE', 'README.md', 'CHANGELOG.md', 'RELEASE.md', 'PROMPT_AI_TAO_DE.md', 'examples/README.md']) {
  await add(`typst-pkg-sang-math/${file}`, `typst-packages/local/sang-math/1.1.0/${file}`);
}
for (const example of manifest.examples) {
  if (!/^[0-9]{2}-[\w-]+\.typ$/.test(example.file)) throw new Error(`Unsafe example filename: ${example.file}`);
  if (seenExampleFiles.has(example.file)) throw new Error(`Duplicate example filename: ${example.file}`);
  seenExampleFiles.add(example.file);
  if (!Array.isArray(example.requires)) throw new Error(`Missing requires list: ${example.file}`);
  await add(`public/hdsd/examples/sang-math-1-1/${example.file}`, `examples/sang-math-1-1/${example.file}`);
  for (const dependency of example.requires ?? []) {
    const resolved = path.posix.normalize(`examples/sang-math-1-1/${dependency}`);
    if (!resolved.startsWith('examples/') && !resolved.startsWith('typst/')) {
      throw new Error(`Unsafe example dependency: ${dependency}`);
    }
    await fs.access(path.join(root, 'public/hdsd', resolved));
  }
}
for (const file of omrAssets) await add(`public/hdsd/examples/sang-math-1-1/${file}`, `examples/sang-math-1-1/${file}`);
await add('public/hdsd/examples/sang-math-1-1/manifest.json', 'examples/sang-math-1-1/manifest.json');
files.set('README.txt', Buffer.from(`SANG-MATH 1.1.0 — BO MAU PREVIEW CUA PR #3\n\n` +
  `Ban 1.1.0 chua phat hanh tren Typst Universe. Khong dung @preview/sang-math:1.1.0.\n` +
  `Cai Typst 0.15.0 hoac moi hon, giai nen ZIP, mo terminal tai thu muc nay.\n\n` +
  `Vi du:\n` +
  `typst compile --root . --package-path ./typst-packages examples/sang-math-1-1/01-legacy-bon-dang.typ 01.pdf\n` +
  `typst compile --root . --package-path ./typst-packages examples/sang-math-1-1/02-qr-va-phieu-12-4-6.typ 02.pdf\n\n` +
  `Moi file .typ co the copy/sua va bien dich. 12-4-6ngang.typ va tn-40.typ can nam cung thu muc voi mau include.\n` +
  `De van go truc tiep bang #tn/#ds/#tln/#tl; #sang-omr-qr tao QR dap an.\n` +
  `Tam phieu co state: 12-4-6ngang, ds-12, hybrid-28tn-12ds, thptqg-toan-2025, tln-10, tn-40, tn-50, tn-60.\n` +
  `Package co the tu dong tai @preview/cetz:0.5.2 va @preview/cades:0.3.1 neu may chua co cache.\n`, 'utf8'));

const zip = new JSZip();
for (const [name, content] of [...files.entries()].sort(([a], [b]) => a.localeCompare(b, 'en'))) {
  zip.file(name, content, { date: fixedDate, createFolders: false, unixPermissions: 0o644 });
}
const bytes = await zip.generateAsync({ type: 'nodebuffer', compression: 'DEFLATE', compressionOptions: { level: 9 }, platform: 'UNIX', streamFiles: false });
if (check) {
  const committed = await fs.readFile(output);
  if (!bytes.equals(committed)) throw new Error('Guide ZIP is stale; run npm run build:sang-math-guide');
  console.log(`Guide ZIP verified: ${manifest.examples.length} examples, ${files.size} files, ${bytes.length} bytes`);
} else {
  await fs.mkdir(path.dirname(output), { recursive: true });
  await fs.writeFile(output, bytes);
  console.log(`Guide ZIP built: ${manifest.examples.length} examples, ${files.size} files, ${bytes.length} bytes`);
}
