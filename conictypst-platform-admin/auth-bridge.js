(() => {
    'use strict';

    const DEFAULT_REGION = 'asia-southeast1';
    const TOKEN_REFRESH_WINDOW_MS = 5 * 60 * 1000;
    const REQUIRED_CONFIG_KEYS = ['apiKey', 'authDomain', 'projectId', 'appId'];

    window.ConicTypstAuthBridge = Object.freeze({ create: createBridge, isConfigBundle });

    function createBridge({ firebase, config, region = DEFAULT_REGION, onUser, onError, onStatus } = {}) {
        if (!firebase?.initializeApp || !firebase?.auth || !isConfigBundle(config)) {
            throw new Error('Cấu hình cầu nối Firebase chưa hợp lệ.');
        }

        const identityApp = getOrCreateApp(firebase, config.identity, 'ct-identity');
        const platformApp = getOrCreateApp(firebase, config.platform, 'ct-platform');
        const exchangeApp = getOrCreateApp(firebase, config.platform, 'ct-platform-exchange');
        const identityAuth = identityApp.auth();
        const platformAuth = platformApp.auth();
        const exchangeAuth = exchangeApp.auth();
        const functions = platformApp.functions(region);
        const exchangeFunctions = exchangeApp.functions(region);

        let started = false;
        let startPromise = null;
        let stopped = false;
        let sequence = 0;
        let syncChain = Promise.resolve();
        let lastIdentityUid = '';
        let lastIdentityExpiry = '';
        let bridgeReady = false;
        let unsubscribeIdentity = null;
        let unsubscribePlatform = null;

        const api = Object.freeze({
            identityAuth,
            platformAuth,
            functions,
            start,
            signIn,
            signOut,
            refresh,
            stop
        });
        return api;

        function start() {
            if (startPromise) return startPromise;
            startPromise = (async () => {
                if (started) return api;
                started = true;
                await Promise.all([
                    identityAuth.setPersistence(firebase.auth.Auth.Persistence.LOCAL),
                    platformAuth.setPersistence(firebase.auth.Auth.Persistence.LOCAL),
                    exchangeAuth.setPersistence(firebase.auth.Auth.Persistence.NONE)
                ]);
                await exchangeAuth.signOut();
                if (stopped) return api;

                unsubscribePlatform = platformAuth.onAuthStateChanged((user) => {
                    if (stopped) return;
                    if (user && bridgeReady && identityAuth.currentUser) emitUser(user);
                    if (!user && !identityAuth.currentUser) emitUser(null);
                });
                unsubscribeIdentity = identityAuth.onIdTokenChanged((user) => queueIdentitySync(user));
                identityAuth.getRedirectResult().catch((error) => reportError(error));
                return api;
            })().catch((error) => {
                startPromise = null;
                reportError(error);
                throw error;
            });
            return startPromise;
        }

        async function signIn({ loginHint = '' } = {}) {
            await start();
            const provider = new firebase.auth.GoogleAuthProvider();
            provider.setCustomParameters({
                prompt: 'select_account',
                ...(loginHint ? { login_hint: loginHint } : {})
            });
            try {
                return await identityAuth.signInWithPopup(provider);
            } catch (error) {
                if (['auth/popup-blocked', 'auth/operation-not-supported-in-this-environment'].includes(error?.code)) {
                    await identityAuth.signInWithRedirect(provider);
                    return null;
                }
                throw error;
            }
        }

        async function signOut() {
            sequence += 1;
            bridgeReady = false;
            lastIdentityUid = '';
            lastIdentityExpiry = '';
            await Promise.allSettled([
                platformAuth.signOut(),
                identityAuth.signOut(),
                exchangeAuth.signOut()
            ]);
            emitUser(null);
        }

        async function refresh() {
            const identityUser = identityAuth.currentUser;
            if (!identityUser) {
                await signOut();
                return null;
            }
            lastIdentityExpiry = '';
            await identityUser.getIdToken(true);
            return queueIdentitySync(identityUser);
        }

        function stop() {
            stopped = true;
            sequence += 1;
            unsubscribeIdentity?.();
            unsubscribePlatform?.();
            unsubscribeIdentity = null;
            unsubscribePlatform = null;
        }

        function queueIdentitySync(identityUser) {
            const requestedSequence = ++sequence;
            syncChain = syncChain
                .catch(() => undefined)
                .then(() => synchronizeIdentity(identityUser, requestedSequence));
            return syncChain;
        }

        async function synchronizeIdentity(identityUser, requestedSequence) {
            if (stopped || requestedSequence !== sequence) return null;
            if (!identityUser) {
                bridgeReady = false;
                lastIdentityUid = '';
                lastIdentityExpiry = '';
                await platformAuth.signOut().catch(() => undefined);
                if (!stopped && requestedSequence === sequence) emitUser(null);
                return null;
            }

            emitStatus('exchanging');
            try {
                let tokenResult = await identityUser.getIdTokenResult(false);
                const expiresAt = Date.parse(tokenResult.expirationTime || '');
                if (!Number.isFinite(expiresAt) || expiresAt - Date.now() <= TOKEN_REFRESH_WINDOW_MS) {
                    tokenResult = await identityUser.getIdTokenResult(true);
                }
                if (stopped || requestedSequence !== sequence) return null;

                const expiry = String(tokenResult.expirationTime || '');
                if (
                    bridgeReady
                    && platformAuth.currentUser
                    && lastIdentityUid === identityUser.uid
                    && lastIdentityExpiry === expiry
                ) {
                    emitUser(platformAuth.currentUser);
                    emitStatus('ready');
                    return platformAuth.currentUser;
                }

                const idToken = tokenResult.token || await identityUser.getIdToken(false);
                const exchangeResult = await exchangeFunctions.httpsCallable('ctExchangeConicgvToken')({ idToken });
                let customToken = exchangeResult?.data?.customToken;
                if (typeof customToken !== 'string' || customToken.length < 20) {
                    throw new Error('Máy chủ không trả về phiên đăng nhập hợp lệ.');
                }
                if (stopped || requestedSequence !== sequence) {
                    customToken = '';
                    return null;
                }

                const credential = await platformAuth.signInWithCustomToken(customToken);
                customToken = '';
                if (stopped || requestedSequence !== sequence) {
                    await platformAuth.signOut().catch(() => undefined);
                    return null;
                }

                lastIdentityUid = identityUser.uid;
                lastIdentityExpiry = expiry;
                bridgeReady = true;
                emitUser(credential.user);
                emitStatus('ready');
                return credential.user;
            } catch (error) {
                if (stopped || requestedSequence !== sequence) return null;
                bridgeReady = false;
                lastIdentityUid = '';
                lastIdentityExpiry = '';
                await platformAuth.signOut().catch(() => undefined);
                emitUser(null);
                emitStatus('error');
                reportError(error);
                return null;
            }
        }

        function emitUser(user) {
            if (typeof onUser === 'function') Promise.resolve(onUser(user)).catch(reportError);
        }

        function emitStatus(status) {
            if (typeof onStatus === 'function') onStatus(status);
        }

        function reportError(error) {
            if (typeof onError === 'function') onError(error);
        }
    }

    function isConfigBundle(value) {
        return Boolean(value)
            && typeof value === 'object'
            && isFirebaseConfig(value.identity)
            && isFirebaseConfig(value.platform)
            && value.identity.projectId !== value.platform.projectId;
    }

    function isFirebaseConfig(value) {
        return Boolean(value)
            && typeof value === 'object'
            && !Array.isArray(value)
            && REQUIRED_CONFIG_KEYS.every((key) => typeof value[key] === 'string' && value[key].trim());
    }

    function getOrCreateApp(firebase, config, name) {
        return firebase.apps.find((app) => app.name === name) || firebase.initializeApp(config, name);
    }
})();
