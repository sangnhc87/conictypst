import assert from 'node:assert/strict';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
    const page = await browser.newPage();
    await page.setRequestInterception(true);
    page.on('request', request => request.url().includes('/firebasejs/')
        ? request.respond({ status: 200, contentType: 'application/javascript', body: '' })
        : request.continue());
    await page.setUserAgent('Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 Mobile/15E148 Safari/604.1');
    await page.goto('http://localhost:8765/manifest.json');
    await page.setContent('<header><div>OMR</div><div></div></header>');
    await page.evaluate(() => {
        const calls = window.__authCalls = { popup: 0, redirect: 0, local: 0, session: 0, listeners: 0 };
        const authInstance = () => ({
            currentUser: null,
            setPersistence(mode) {
                calls[mode]++;
                return mode === 'local' ? Promise.reject(new Error('Storage unavailable')) : Promise.resolve();
            },
            onAuthStateChanged() { calls.listeners++; },
            getRedirectResult: () => Promise.resolve(null),
            signInWithPopup: async () => { calls.popup++; return { user: null }; },
            signInWithRedirect: async () => { calls.redirect++; throw new Error('Redirect must not run'); }
        });
        const apps = [];
        function firebaseAuth() {}
        firebaseAuth.Auth = { Persistence: { LOCAL: 'local', SESSION: 'session', NONE: 'none' } };
        firebaseAuth.GoogleAuthProvider = class { setCustomParameters() {} };
        window.firebase = {
            apps, auth: firebaseAuth,
            initializeApp(config, name) {
                const app = { name, auth: authInstance, functions: () => ({}) };
                apps.push(app);
                return app;
            }
        };
        const append = document.head.appendChild.bind(document.head);
        document.head.appendChild = element => {
            const result = append(element);
            if (element.tagName === 'SCRIPT' && element.src.includes('/firebasejs/')) {
                setTimeout(() => element.dispatchEvent(new Event('load')), 0);
            }
            return result;
        };
    });
    await page.addScriptTag({ path: new URL('./js/omr_cloud_sync.js', import.meta.url).pathname });
    await page.waitForFunction(() => window.__authCalls?.listeners === 2);
    await new Promise(resolve => setTimeout(resolve, 100));
    await page.click('#omrCloudButton');
    const calls = await page.evaluate(() => window.__authCalls);
    assert.equal(calls.popup, 1, 'mobile login should invoke popup');
    assert.equal(calls.redirect, 0, 'mobile login must not use cross-site redirect');
    assert.equal(calls.local, 2, 'both Firebase auth instances try local persistence');
    assert.equal(calls.session, 2, 'both auth instances fall back to session persistence');
    console.log(calls);
} finally {
    await browser.close();
}
