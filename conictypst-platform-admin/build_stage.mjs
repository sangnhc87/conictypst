#!/usr/bin/env node

import { createHash } from 'node:crypto';
import { copyFile, lstat, mkdir, readFile, readdir, realpath, rm, writeFile } from 'node:fs/promises';
import { dirname, isAbsolute, join, relative, resolve, sep } from 'node:path';
import { fileURLToPath } from 'node:url';

const SOURCE_DIR = dirname(fileURLToPath(import.meta.url));
const DEFAULT_DESTINATION = '/private/tmp/conictypst-platform-admin-stage';
const PLACEHOLDER = '__FIREBASE_CONFIG__';
const DEPLOY_ALLOWLIST = Object.freeze([
    'index.html',
    'account.html',
    'admin.css',
    'auth-bridge.js',
    'admin.js',
    'account.js',
    '_headers'
]);
const REQUIRED_CONFIG_KEYS = Object.freeze(['apiKey', 'authDomain', 'projectId', 'appId']);

const destination = resolveDestination(process.argv[2] || process.env.ADMIN_STAGE_DIR || DEFAULT_DESTINATION);
await assertSafeSource();
await prepareDestination(destination);

const firebaseConfig = parseFirebaseConfig(process.env.FIREBASE_CONFIG_JSON);
const manifest = [];
for (const file of DEPLOY_ALLOWLIST) {
    const source = join(SOURCE_DIR, file);
    const target = join(destination, file);
    const stat = await lstat(source);
    if (!stat.isFile() || stat.isSymbolicLink()) throw new Error(`Nguồn không phải file thường: ${file}`);
    let bytes;
    if (file.endsWith('.html')) {
        let text = await readFile(source, 'utf8');
        if (!text.includes(PLACEHOLDER)) throw new Error(`${file} thiếu placeholder Firebase bắt buộc.`);
        if (firebaseConfig) text = text.replaceAll(PLACEHOLDER, serializeForHtml(firebaseConfig));
        bytes = Buffer.from(text, 'utf8');
        await writeFile(target, bytes, { flag: 'wx', mode: 0o644 });
    } else {
        await copyFile(source, target, 0);
        bytes = await readFile(target);
    }
    scanForForbiddenContent(file, bytes.toString('utf8'));
    manifest.push({ file, bytes: bytes.length, sha256: createHash('sha256').update(bytes).digest('hex') });
}

const outputFiles = (await readdir(destination)).sort();
const expectedFiles = [...DEPLOY_ALLOWLIST].sort();
if (JSON.stringify(outputFiles) !== JSON.stringify(expectedFiles)) {
    throw new Error(`Stage chứa file ngoài allowlist: ${outputFiles.join(', ')}`);
}

const unresolved = [];
for (const file of ['index.html', 'account.html']) {
    if ((await readFile(join(destination, file), 'utf8')).includes(PLACEHOLDER)) unresolved.push(file);
}
if (process.env.REQUIRE_FIREBASE_CONFIG === '1' && unresolved.length) {
    throw new Error(`Production build còn placeholder Firebase: ${unresolved.join(', ')}`);
}

process.stdout.write(`${JSON.stringify({
    destination,
    firebaseConfigured: unresolved.length === 0,
    warning: unresolved.length ? 'Chưa đặt FIREBASE_CONFIG_JSON; stage chỉ dùng để xem source, đăng nhập sẽ bị khóa.' : undefined,
    files: manifest
}, null, 2)}\n`);

function resolveDestination(value) {
    const resolved = resolve(isAbsolute(value) ? value : join(process.cwd(), value));
    const forbidden = new Set(['/', resolve(SOURCE_DIR), resolve(dirname(SOURCE_DIR))]);
    if (forbidden.has(resolved) || resolved.length < 12) throw new Error(`Thư mục stage không an toàn: ${resolved}`);
    if (resolved.startsWith(`${resolve(SOURCE_DIR)}${sep}`)) throw new Error('Không được tạo stage bên trong source.');
    return resolved;
}

async function assertSafeSource() {
    const sourceReal = await realpath(SOURCE_DIR);
    for (const file of DEPLOY_ALLOWLIST) {
        const targetReal = await realpath(join(SOURCE_DIR, file));
        if (!targetReal.startsWith(`${sourceReal}${sep}`)) throw new Error(`File thoát khỏi source: ${file}`);
    }
}

async function prepareDestination(target) {
    await rm(target, { recursive: true, force: true });
    await mkdir(target, { recursive: false, mode: 0o755 });
}

function parseFirebaseConfig(raw) {
    if (!raw?.trim()) return null;
    let config;
    try {
        config = JSON.parse(raw);
    } catch (error) {
        throw new Error(`FIREBASE_CONFIG_JSON không phải JSON hợp lệ: ${error.message}`);
    }
    if (!config || typeof config !== 'object' || Array.isArray(config)) throw new Error('FIREBASE_CONFIG_JSON phải là một object.');
    if (!config.identity || !config.platform || config.identity.projectId === config.platform.projectId) {
        throw new Error('Firebase config phải có hai project tách biệt: identity và platform.');
    }
    return {
        identity: cleanFirebaseConfig(config.identity, 'identity'),
        platform: cleanFirebaseConfig(config.platform, 'platform')
    };
}

function cleanFirebaseConfig(config, label) {
    if (!config || typeof config !== 'object' || Array.isArray(config)) throw new Error(`Firebase config ${label} phải là object.`);
    const missing = REQUIRED_CONFIG_KEYS.filter((key) => !String(config[key] || '').trim());
    if (missing.length) throw new Error(`Firebase config ${label} thiếu: ${missing.join(', ')}`);
    const allowedKeys = new Set(['apiKey', 'authDomain', 'projectId', 'storageBucket', 'messagingSenderId', 'appId', 'measurementId']);
    const clean = {};
    for (const [key, value] of Object.entries(config)) {
        if (!allowedKeys.has(key)) throw new Error(`Firebase config ${label} có trường không được phép: ${key}`);
        clean[key] = String(value);
    }
    return clean;
}

function serializeForHtml(config) {
    return JSON.stringify(config).replaceAll('<', '\\u003c').replaceAll('>', '\\u003e').replaceAll('&', '\\u0026');
}

function scanForForbiddenContent(file, content) {
    const rules = [
        [/-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/, 'private key'],
        [/\b(?:AWS_SECRET_ACCESS_KEY|CLOUDFLARE_API_TOKEN|FIREBASE_PRIVATE_KEY)\s*[:=]\s*["'][^"']+/i, 'secret assignment'],
        [/\b(?:AKIA|ASIA)[A-Z0-9]{16}\b/, 'AWS access key']
    ];
    for (const [pattern, label] of rules) {
        if (pattern.test(content)) throw new Error(`${file} chứa ${label}; dừng build.`);
    }
}
