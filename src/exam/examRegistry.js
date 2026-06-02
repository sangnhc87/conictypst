/**
 * examRegistry.js
 *
 * Auto-discovers every .typ file under:
 *   typst/exams/       — chuyên đề, luyện tập
 *   typst/De-Cac-So/   — đề thi thử các sở / tự chế
 *
 * No manual editing needed when files are added/removed —
 * the catalog is built automatically from the bundled file list.
 */

// ── Vite glob bundles (paths relative to this file: src/exam/) ──────────────
const _examFiles = import.meta.glob(
    '../../typst/exams/*.typ',
    { query: '?raw', import: 'default', eager: false },
);
const _deCacSoFiles = import.meta.glob(
    '../../typst/De-Cac-So/*.typ',
    { query: '?raw', import: 'default', eager: false },
);

// ── Build unified loader map: basename → lazy loader ────────────────────────
// Store folder alongside so we can tag entries.
function collectLoaders(globMap, folder) {
    return Object.entries(globMap).map(([modulePath, loader]) => {
        const basename = modulePath.replace(/^.*\//, '');
        return { basename, folder, loader };
    });
}

const _allEntries = [
    ...collectLoaders(_examFiles, 'exams'),
    ...collectLoaders(_deCacSoFiles, 'De-Cac-So'),
];

// Deduplicate by basename (exams/ wins over De-Cac-So/ on collision)
const _loaderMap = new Map();
for (const e of _allEntries) {
    if (!_loaderMap.has(e.basename)) _loaderMap.set(e.basename, e);
}

// ── Auto-generate catalog from discovered files ──────────────────────────────

function basenameToId(basename) {
    return basename.replace(/\.typ$/, '');
}

function basenameToTitle(basename) {
    return basename
        .replace(/\.typ$/, '')
        .replace(/[-_]/g, ' ');
}

function basenameToTags(basename, folder) {
    const tags = [];
    if (folder === 'De-Cac-So') tags.push('đề thi thử');
    if (/CD-/i.test(basename)) tags.push('chuyên đề');
    if (/THPT|thpt/i.test(basename)) tags.push('THPT');
    if (/2026/i.test(basename)) tags.push('2026');
    if (/HamSinh|GF/i.test(basename)) tags.push('hàm sinh');
    if (/Xac-Suat|XacSuat/i.test(basename)) tags.push('xác suất');
    if (/Oxyz/i.test(basename)) tags.push('Oxyz');
    return tags;
}

// Catalog is built once at module load time — no async needed.
export const EXAM_CATALOG = Array.from(_loaderMap.values()).map(({ basename, folder }) => ({
    id: basenameToId(basename),
    file: basename,
    title: basenameToTitle(basename),
    subject: 'Toán',
    grade: '12',
    duration: 90,
    tags: basenameToTags(basename, folder),
    folder,
    description: null,
}))
    // Sort: De-Cac-So first (most recent exams), then exams/ alphabetically
    .sort((a, b) => {
        if (a.folder !== b.folder) return a.folder === 'De-Cac-So' ? -1 : 1;
        return b.file.localeCompare(a.file, 'vi');
    });

// ────────────────────────────────────────────────────────────────────────────
// Loader
// ────────────────────────────────────────────────────────────────────────────

// ────────────────────────────────────────────────────────────────────────────
// Loader
// ────────────────────────────────────────────────────────────────────────────

/**
 * Load the raw Typst source for an exam.
 * @param {string} filename  e.g. "2026-Tự-Chế-Lần-1.typ"
 * @returns {Promise<string>}
 */
export async function loadExamSource(filename) {
    const entry = _loaderMap.get(filename);
    if (!entry) {
        throw new Error(
            `Exam file not bundled: "${filename}". ` +
            `Available: ${[..._loaderMap.keys()].join(', ')}`
        );
    }
    return entry.loader();
}

/**
 * Convenience: load by catalog id  (= basename without .typ).
 */
export async function loadExamById(id) {
    const entry = EXAM_CATALOG.find(e => e.id === id);
    if (!entry) throw new Error(`Exam id not found: "${id}"`);
    return { meta: entry, source: await loadExamSource(entry.file) };
}
