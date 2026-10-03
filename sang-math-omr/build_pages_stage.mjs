import { createHash } from 'node:crypto';
import { access, cp, mkdir, readFile, readdir, rm, stat, writeFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import vm from 'node:vm';

const sourceRoot = path.dirname(fileURLToPath(import.meta.url));
const outputRoot = path.resolve(process.argv[2] || '/private/tmp/chamthi-conictypst-stage');

if (!outputRoot.startsWith('/private/tmp/chamthi-conictypst-')) {
    throw new Error('Thư mục stage phải nằm dưới /private/tmp/chamthi-conictypst-* để tránh xóa nhầm dữ liệu.');
}

const runtimeFiles = [
    '_headers',
    'index.html',
    'scan.html',
    'premium_styles.css',
    'manifest.json',
    'icon-192.png',
    'icon-512.png',
    'sw.js',
    'omr-admin.html',
    'opencv.js',
    'opencv.wasm',
    'js/copyright_guard.js',
    'js/gemini_grader.js',
    'js/tf_grader.js',
    'js/tln_codec.js',
    'js/omr_engine.js',
    'js/a4_scanner.js',
    'js/document_scan_store.js',
    'js/document_scanner_app.js',
    'js/omr_profiles.js',
    'js/preset_calibrations.js',
    'js/a4_scan_sheet.js',
    'js/a3_cut_sheet.js',
    'js/omr_db.js',
    'js/omr_cloud_sync.js',
];

async function copyFileFrom(root, relative, destinationRelative = relative) {
    const source = path.join(root, relative);
    await access(source);
    const destination = path.join(outputRoot, destinationRelative);
    await mkdir(path.dirname(destination), { recursive: true });
    await cp(source, destination);
}

async function walk(directory, prefix = '') {
    const output = [];
    for (const entry of await readdir(directory, { withFileTypes: true })) {
        const relative = path.join(prefix, entry.name);
        if (entry.isDirectory()) output.push(...await walk(path.join(directory, entry.name), relative));
        else if (entry.isFile()) output.push(relative);
        else throw new Error(`Stage không cho phép symlink: ${relative}`);
    }
    return output;
}

await rm(outputRoot, { recursive: true, force: true });
await mkdir(outputRoot, { recursive: true });

for (const relative of runtimeFiles) await copyFileFrom(sourceRoot, relative);
for (const directory of ['js/vendor', 'tfjs_model', 'templates']) {
    await cp(path.join(sourceRoot, directory), path.join(outputRoot, directory), { recursive: true });
}

// The four sample Classroom rosters are already public in its DEFAULT_DATA.
// Bundle only name, SBD and class so OMR can offer them without a cross-site login.
const classroomSource = await readFile(path.resolve(sourceRoot, '../public/hdsd/conic-classroom.js'), 'utf8');
const rosterStartMarker = 'const DEFAULT_DATA = ';
const rosterEndMarker = '\n  };\n\n  // State ứng dụng';
const rosterStart = classroomSource.indexOf(rosterStartMarker);
const rosterEnd = classroomSource.indexOf(rosterEndMarker, rosterStart);
if (rosterStart < 0 || rosterEnd < 0) throw new Error('Không tìm thấy DEFAULT_DATA của Conic Classroom.');
const defaultDataLiteral = classroomSource.slice(rosterStart + rosterStartMarker.length, rosterEnd + '\n  }'.length);
const defaultData = vm.runInNewContext(`(${defaultDataLiteral})`, Object.create(null), { timeout: 1000 });
const classroomStudents = (defaultData.classes || []).flatMap(cls => (cls.students || []).map(student => ({
    sbd: String(student.sbd || '').trim(),
    name: String(student.name || '').trim(),
    cls: String(cls.name || '').trim()
}))).filter(student => student.sbd && student.name && student.cls);
if (!classroomStudents.length) throw new Error('Danh sách mặc định Conic Classroom trống.');
await writeFile(path.join(outputRoot, 'classroom-roster.json'), JSON.stringify({
    source: 'conic-classroom-default',
    classes: [...new Set(classroomStudents.map(student => student.cls))],
    students: classroomStudents
}));

const serviceWorker = await readFile(path.join(outputRoot, 'sw.js'), 'utf8');
const cachedUrls = [...serviceWorker.matchAll(/['"]\.\/([^?'"]+)(?:\?[^'"]*)?['"]/g)].map(match => match[1]);
for (const relative of cachedUrls) await access(path.join(outputRoot, relative));

const files = (await walk(outputRoot)).sort();
const forbiddenNames = files.filter(file => /(^|\/)(\.env|R2\.md|wrangler\.|storage-worker|generate_class_47)/i.test(file));
if (forbiddenNames.length) throw new Error(`Stage chứa tệp bị cấm: ${forbiddenNames.join(', ')}`);

const forbiddenContent = /BEGIN (?:RSA |EC )?PRIVATE KEY|R2_SECRET_ACCESS_KEY|OMR_STORAGE_HMAC_SECRET\s*=/;
let totalBytes = 0;
const digest = createHash('sha256');
for (const relative of files) {
    const filename = path.join(outputRoot, relative);
    const info = await stat(filename);
    totalBytes += info.size;
    const bytes = await readFile(filename);
    digest.update(relative).update('\0').update(bytes);
    if (info.size <= 5 * 1024 * 1024 && forbiddenContent.test(bytes.toString('utf8'))) {
        throw new Error(`Stage có dấu hiệu chứa secret: ${relative}`);
    }
}

console.log(JSON.stringify({
    outputRoot,
    files: files.length,
    totalMiB: Number((totalBytes / 1024 / 1024).toFixed(2)),
    sha256: digest.digest('hex'),
    serviceWorkerAssets: cachedUrls.length,
}, null, 2));
