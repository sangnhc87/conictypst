export const PAYMENT_PLANS = Object.freeze({
  "1_YEAR": Object.freeze({
    id: "1_YEAR",
    label: "1 năm",
    amount: 149000,
    accessDays: 365,
  }),
  "2_YEAR": Object.freeze({
    id: "2_YEAR",
    label: "2 năm",
    amount: 249000,
    accessDays: 730,
  }),
  "5_YEAR": Object.freeze({
    id: "5_YEAR",
    label: "5 năm",
    amount: 499000,
    accessDays: 1825,
  }),
});

export const PRODUCT_ID = "docx-quiz-presenter";

export function resolvePaymentPlan(planId) {
  return PAYMENT_PLANS[String(planId || "").trim()] || null;
}
