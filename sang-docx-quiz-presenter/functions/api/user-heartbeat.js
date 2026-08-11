import { fail, json } from "./_shared.js";
import { commitFirestore, errorResponse, getFirestoreDocument, updateWrite, verifyFirebaseUser } from "./firebaseServer.js";

// Firestore rules intentionally keep the user collection server-written. This
// small heartbeat creates/updates the app profile whenever a user signs in so
// the admin dashboard can show real activity even before the first AI import.
export async function onRequestPost({ request, env }) {
  try {
    const account = await verifyFirebaseUser(request, env);
    const now = new Date();
    const authCreatedAt = Number(account.createdAt);
    const existingDocument = await getFirestoreDocument(`users/${account.uid}`, env);
    const existing = existingDocument?.data || {};
    const existingTrialStartedAt = new Date(existing.trialStartedAt || existing.subjectSelectedAt || "");
    const trialStartedAt = Number.isFinite(existingTrialStartedAt.getTime()) ? existingTrialStartedAt : now;
    await commitFirestore([
      updateWrite(`users/${account.uid}`, {
        email: account.email,
        displayName: account.displayName,
        photoURL: account.photoURL,
        authCreatedAt: Number.isFinite(authCreatedAt) && authCreatedAt > 0
          ? new Date(authCreatedAt)
          : undefined,
        // This is app-specific. Do not use Firebase's global account creation
        // time because the same Firebase project serves other products.
        trialStartedAt,
        lastSeenAt: now,
        appId: "sang-docx-quiz-presenter",
      }, env),
    ], env);
    return json({ ok: true, lastSeenAt: now.toISOString() });
  } catch (error) {
    const result = errorResponse(error, "Không ghi nhận được phiên đăng nhập.");
    return fail(result.message, result.status);
  }
}
