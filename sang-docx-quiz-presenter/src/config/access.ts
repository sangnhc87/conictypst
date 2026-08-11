export const ADMIN_EMAILS = new Set([
  "nguyensangnhc@gmail.com",
  "sangbeau@gmail.com",
]);

export const normalizeEmail = (email: string | null | undefined) => String(email || "").trim().toLowerCase();
export const isAdminEmail = (email: string | null | undefined) => ADMIN_EMAILS.has(normalizeEmail(email));
