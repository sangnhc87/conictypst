import { useState, useEffect } from "react";
import { User, onAuthStateChanged } from "firebase/auth";
import { doc, onSnapshot, setDoc } from "firebase/firestore";
import { auth, signInWithGoogle, logout, db } from "../config/firebase";
import { defaultProfileForSubject } from "../config/subjectProfiles";
import { isAdminEmail } from "../config/access";

export type UserPreferences = {
  preferredSubject?: string;
  preferredProfileId?: string;
  onboardingComplete?: boolean;
  subscriptionProductId?: string;
  subscriptionPlanId?: string;
  subscriptionStatus?: string;
  subscriptionAccessEndsAt?: string;
  trialStartedAt?: string;
};

const firestoreDateToIso = (value: unknown) => {
  if (value && typeof value === "object" && "toDate" in value && typeof value.toDate === "function") {
    const date = value.toDate();
    return date instanceof Date && Number.isFinite(date.getTime()) ? date.toISOString() : undefined;
  }
  if (typeof value === "string" && Number.isFinite(new Date(value).getTime())) return new Date(value).toISOString();
  return undefined;
};

export function useAuth() {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);
  const [usageCount, setUsageCount] = useState<number>(0);
  const [userPreferences, setUserPreferences] = useState<UserPreferences>({});
  const [billingSubscription, setBillingSubscription] = useState<UserPreferences>({});
  const [userPreferencesReady, setUserPreferencesReady] = useState(false);

  useEffect(() => {
    let unsubDoc: (() => void) | undefined;
    let unsubBilling: (() => void) | undefined;
    const unsubscribe = onAuthStateChanged(auth, (currentUser) => {
      if (unsubDoc) unsubDoc();
      if (unsubBilling) unsubBilling();
      setUser(currentUser);
      setUserPreferencesReady(!currentUser);
      setUserPreferences({});
      setBillingSubscription({});
      if (currentUser) {
        void currentUser.getIdToken().then((idToken) => fetch("/api/user-heartbeat", {
          method: "POST",
          headers: { Authorization: `Bearer ${idToken}` },
        })).catch(() => {
          // The local Vite server does not serve Pages Functions; sign-in and
          // the editor should still work there. Production records the visit.
        });
        unsubDoc = onSnapshot(doc(db, "users", currentUser.uid), (snap) => {
          const data = snap.exists() ? snap.data() : {};
          setUsageCount(typeof data.aiImportCount === "number" ? data.aiImportCount : 0);
          setUserPreferences({
            preferredSubject: typeof data.preferredSubject === "string" ? data.preferredSubject : undefined,
            preferredProfileId: typeof data.preferredProfileId === "string" ? data.preferredProfileId : undefined,
            onboardingComplete: data.onboardingComplete === true,
            // Bản sao hiển thị; entitlement thật được server kiểm tra trong billingSubscriptions.
            subscriptionProductId: typeof data.subscriptionProductId === "string" ? data.subscriptionProductId : undefined,
            subscriptionPlanId: typeof data.subscriptionPlanId === "string" ? data.subscriptionPlanId : undefined,
            subscriptionStatus: typeof data.subscriptionStatus === "string" ? data.subscriptionStatus : undefined,
            subscriptionAccessEndsAt: firestoreDateToIso(data.subscriptionAccessEndsAt),
            trialStartedAt: firestoreDateToIso(data.trialStartedAt || data.subjectSelectedAt),
          });
          setUserPreferencesReady(true);
        }, () => {
          setUserPreferencesReady(true);
        });
        unsubBilling = onSnapshot(doc(db, "billingSubscriptions", currentUser.uid), (snap) => {
          const data = snap.exists() ? snap.data() : {};
          setBillingSubscription({
            subscriptionProductId: typeof data.subscriptionProductId === "string" ? data.subscriptionProductId : undefined,
            subscriptionPlanId: typeof data.subscriptionPlanId === "string" ? data.subscriptionPlanId : undefined,
            subscriptionStatus: typeof data.subscriptionStatus === "string" ? data.subscriptionStatus : undefined,
            subscriptionAccessEndsAt: firestoreDateToIso(data.subscriptionAccessEndsAt),
          });
        }, () => setBillingSubscription({}));
      } else {
        setUsageCount(0);
      }
      setLoading(false);
    });

    return () => {
      unsubscribe();
      if (unsubDoc) unsubDoc();
      if (unsubBilling) unsubBilling();
    };
  }, []);

  const isAdmin = isAdminEmail(user?.email);

  const savePreferredSubject = async (subject: string) => {
    if (!user) throw new Error("Bạn cần đăng nhập Gmail trước.");
    const preferredProfileId = defaultProfileForSubject(subject).id;
    await setDoc(doc(db, "users", user.uid), {
      preferredSubject: subject,
      preferredProfileId,
      onboardingComplete: true,
      subjectSelectedAt: new Date().toISOString(),
    }, { merge: true });
    setUserPreferences({ preferredSubject: subject, preferredProfileId, onboardingComplete: true });
  };
  
  // Calculate trial days left
  let daysLeft = 0;
  const effectivePreferences = { ...userPreferences, ...billingSubscription };
  const subscriptionEndsAt = effectivePreferences.subscriptionAccessEndsAt
    ? new Date(effectivePreferences.subscriptionAccessEndsAt).getTime()
    : 0;
  const subscriptionActive = Boolean(
    user && !isAdmin && effectivePreferences.subscriptionStatus === "active" && subscriptionEndsAt > Date.now(),
  );
  const isPaid = Boolean(isAdmin || subscriptionActive);
  if (isAdmin) {
    daysLeft = 999;
  } else if (subscriptionActive) {
    daysLeft = Math.max(0, Math.ceil((subscriptionEndsAt - Date.now()) / (1000 * 60 * 60 * 24)));
  } else if (user) {
    // The trial belongs to this app. Firebase Auth is shared by several
    // Conic products, so its global account creation time is not a valid
    // starting point for Trình Chiếu.
    const trialStartedAt = effectivePreferences.trialStartedAt
      ? new Date(effectivePreferences.trialStartedAt).getTime()
      : Date.now();
    const now = Date.now();
    const daysSinceCreation = Math.floor((now - trialStartedAt) / (1000 * 60 * 60 * 24));
    daysLeft = Math.max(0, 7 - daysSinceCreation);
  }

  return {
    user,
    isAdmin,
    isPaid,
    loading,
    daysLeft,
    usageCount,
    userPreferences: effectivePreferences,
    userPreferencesReady,
    savePreferredSubject,
    signInWithGoogle,
    logout,
  };
}
