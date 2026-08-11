import assert from 'node:assert/strict';
import { access, readFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', 'dist-geo-conictypst');
const pages = [
  'index.html',
  'tikz-geogebra.html',
  'tikz-geogebra-3d.html',
  'cetz-geogebra.html',
  'cetz-geogebra-3d.html',
];

for (const page of pages) {
  const html = await readFile(path.join(root, page), 'utf8');
  assert.match(html, /ConicTypst/i, `${page} phải có nhận diện ConicTypst`);
  assert.doesNotMatch(html, /global-nav\.js/, `${page} không được dùng nav HDSD`);
}

const landing = await readFile(path.join(root, 'index.html'), 'utf8');
assert.match(landing, /Nguyễn Văn Sang/);
assert.match(landing, /10389821115/);
assert.match(landing, /\/tikz-geogebra-3d/);
assert.match(landing, /\/cetz-geogebra-3d/);

await access(path.join(root, 'typst', 'geometry.typ'));
await access(path.join(root, 'images', 'qr-donate.png'));
await access(path.join(root, 'copyright-guard.js'));
console.log('Geo2Code stage contract: OK');
