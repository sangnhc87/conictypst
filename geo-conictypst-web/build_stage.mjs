import { cp, copyFile, mkdir, readFile, rm, writeFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const sourceRoot = path.dirname(fileURLToPath(import.meta.url));
const repositoryRoot = path.resolve(sourceRoot, '..');
const hdsdRoot = path.join(repositoryRoot, 'public', 'hdsd');
const outputRoot = path.resolve(process.argv[2] || path.join(repositoryRoot, 'dist-geo-conictypst'));

const ownFiles = [
  'index.html',
  'site.css',
  'site.js',
  'community-nav.js',
  '_headers',
  'robots.txt',
  'sitemap.xml',
  'og.png',
];

const sharedFiles = [
  'tikz-geogebra.html',
  'tikz-geogebra-3d.html',
  'cetz-geogebra.html',
  'cetz-geogebra-3d.html',
  'tikz-geogebra.css',
  'tikz-geogebra.js',
  'tikz-geogebra-exporter.js',
  'dashboard.css',
  'ggb-templates.js',
  'ggb-template-ui.js',
  'playground.js',
  'copyright-guard.js',
];

await rm(outputRoot, { recursive: true, force: true });
await mkdir(outputRoot, { recursive: true });

for (const file of ownFiles) {
  await copyFile(path.join(sourceRoot, file), path.join(outputRoot, file));
}

for (const file of sharedFiles) {
  const input = path.join(hdsdRoot, file);
  const output = path.join(outputRoot, file);
  if (file.endsWith('.html')) {
    let html = await readFile(input, 'utf8');
    html = html
      .replaceAll('global-nav.js', 'community-nav.js')
      .replaceAll('https://hdsd-conictypst.pages.dev/tikz-geogebra', 'https://geo-conictypst.pages.dev/tikz-geogebra');
    await writeFile(output, html);
  } else {
    await copyFile(input, output);
  }
}

await cp(path.join(hdsdRoot, 'typst'), path.join(outputRoot, 'typst'), { recursive: true });
await mkdir(path.join(outputRoot, 'images'), { recursive: true });
await copyFile(
  path.join(hdsdRoot, 'images', 'qr-donate.png'),
  path.join(outputRoot, 'images', 'qr-donate.png'),
);

console.log(`Geo2Code stage ready: ${outputRoot}`);
