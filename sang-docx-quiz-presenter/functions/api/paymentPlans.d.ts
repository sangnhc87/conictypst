export type PaymentPlan = {
  id: string;
  label: string;
  amount: number;
  accessDays: number;
};

export declare const PAYMENT_PLANS: Readonly<Record<string, PaymentPlan>>;
export declare const PRODUCT_ID: string;
export declare function resolvePaymentPlan(planId: unknown): PaymentPlan | null;
