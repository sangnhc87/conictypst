import { describe, expect, it } from "vitest";
import { PAYMENT_PLANS, resolvePaymentPlan } from "../../functions/api/paymentPlans.js";

describe("payment plans", () => {
  it("keeps prices and access periods on the server catalog", () => {
    expect(PAYMENT_PLANS["1_YEAR"]).toMatchObject({ amount: 149000, accessDays: 365 });
    expect(PAYMENT_PLANS["2_YEAR"]).toMatchObject({ amount: 249000, accessDays: 730 });
    expect(PAYMENT_PLANS["5_YEAR"]).toMatchObject({ amount: 499000, accessDays: 1825 });
  });

  it("rejects unknown plans instead of accepting a client supplied price", () => {
    expect(resolvePaymentPlan("custom-price")).toBeNull();
    expect(resolvePaymentPlan("1_YEAR")?.amount).toBe(149000);
  });
});
