import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useRef,
  useState,
} from 'react';
import { initializeApp, getApp, getApps } from 'firebase/app';
import {
  browserLocalPersistence,
  browserSessionPersistence,
  getAuth,
  getIdTokenResult,
  getRedirectResult,
  GoogleAuthProvider,
  onIdTokenChanged,
  setPersistence,
  signInWithCustomToken,
  signInWithPopup,
  signInWithRedirect,
  signOut as firebaseSignOut,
} from 'firebase/auth';
import { getFunctions, httpsCallable } from 'firebase/functions';
import { APP_CONFIG } from '../config';
import { createApi } from '../lib/api';
import { clearOfflineUser } from '../lib/offline';

const AuthContext = createContext(null);

function appNamed(name, config) {
  return getApps().some((app) => app.name === name) ? getApp(name) : initializeApp(config, name);
}

const identityApp = appNamed('conic-exam-identity', APP_CONFIG.identityFirebase);
const platformApp = appNamed('conic-exam-platform', APP_CONFIG.platformFirebase);
const identityAuth = getAuth(identityApp);
const platformAuth = getAuth(platformApp);
const platformFunctions = getFunctions(platformApp, APP_CONFIG.region);
const exchangeToken = httpsCallable(platformFunctions, 'ctExchangeConicgvToken');
const api = createApi(platformFunctions);

export function AuthProvider({ children }) {
  const [identityUser, setIdentityUser] = useState(null);
  const [user, setUser] = useState(null);
  const [account, setAccount] = useState(null);
  const [status, setStatus] = useState('booting');
  const [error, setError] = useState('');
  const syncSequence = useRef(0);

  const refreshAccount = useCallback(async () => {
    if (!platformAuth.currentUser) {
      setAccount(null);
      return null;
    }
    const next = await api.getAccount();
    setAccount(next);
    return next;
  }, []);

  useEffect(() => {
    let active = true;
    Promise.all([
      setPersistence(identityAuth, browserLocalPersistence),
      setPersistence(platformAuth, browserSessionPersistence),
      getRedirectResult(identityAuth).catch(() => null),
    ]).catch((cause) => {
      if (active) setError(cause?.message || 'Không thể khởi tạo đăng nhập.');
    });

    const unsubscribe = onIdTokenChanged(identityAuth, async (nextIdentityUser) => {
      const sequence = ++syncSequence.current;
      if (!active) return;
      setIdentityUser(nextIdentityUser);
      setError('');

      if (!nextIdentityUser) {
        const previousPlatformUid = platformAuth.currentUser?.uid;
        if (previousPlatformUid) await clearOfflineUser(previousPlatformUid);
        await firebaseSignOut(platformAuth).catch(() => undefined);
        if (!active || sequence !== syncSequence.current) return;
        setUser(null);
        setAccount(null);
        setStatus('anonymous');
        return;
      }

      setStatus('exchanging');
      try {
        const tokenResult = await getIdTokenResult(nextIdentityUser, false);
        const response = await exchangeToken({ idToken: tokenResult.token });
        const customToken = response?.data?.customToken;
        if (typeof customToken !== 'string' || customToken.length < 20) {
          throw new Error('Máy chủ không cấp được phiên đăng nhập Conic Exam.');
        }
        const credential = await signInWithCustomToken(platformAuth, customToken);
        if (!active || sequence !== syncSequence.current) return;
        setUser(credential.user);
        setStatus('loading-account');
        await refreshAccount();
        if (!active || sequence !== syncSequence.current) return;
        setStatus('ready');
      } catch (cause) {
        if (!active || sequence !== syncSequence.current) return;
        await firebaseSignOut(platformAuth).catch(() => undefined);
        setUser(null);
        setAccount(null);
        setError(cause?.message || 'Không thể đồng bộ tài khoản ConicTypst.');
        setStatus('error');
      }
    });

    return () => {
      active = false;
      syncSequence.current += 1;
      unsubscribe();
    };
  }, [refreshAccount]);

  const signIn = useCallback(async () => {
    setError('');
    const provider = new GoogleAuthProvider();
    provider.setCustomParameters({ prompt: 'select_account' });
    try {
      await signInWithPopup(identityAuth, provider);
    } catch (cause) {
      if (['auth/popup-blocked', 'auth/operation-not-supported-in-this-environment'].includes(cause?.code)) {
        await signInWithRedirect(identityAuth, provider);
        return;
      }
      setError(cause?.message || 'Không thể đăng nhập Google.');
      throw cause;
    }
  }, []);

  const signOut = useCallback(async () => {
    syncSequence.current += 1;
    setStatus('booting');
    const previousPlatformUid = platformAuth.currentUser?.uid;
    if (previousPlatformUid) await clearOfflineUser(previousPlatformUid);
    await Promise.allSettled([firebaseSignOut(platformAuth), firebaseSignOut(identityAuth)]);
    setIdentityUser(null);
    setUser(null);
    setAccount(null);
    setStatus('anonymous');
  }, []);

  const value = useMemo(() => ({
    identityUser,
    user,
    account,
    status,
    error,
    api,
    signIn,
    signOut,
    refreshAccount,
    setError,
  }), [account, error, identityUser, refreshAccount, signIn, signOut, status, user]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const value = useContext(AuthContext);
  if (!value) throw new Error('useAuth phải nằm trong AuthProvider.');
  return value;
}

export function examMembership(account) {
  return account?.memberships?.find((membership) => membership.productId === APP_CONFIG.productId) || null;
}
