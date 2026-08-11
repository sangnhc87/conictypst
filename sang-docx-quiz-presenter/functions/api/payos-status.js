import { fail, json } from "./_shared.js";
import { errorResponse, getFirestoreDocument, verifyFirebaseUser } from "./firebaseServer.js";

export async function onRequestGet({ request, env }) {
  try {
    const account = await verifyFirebaseUser(request, env);
    const orderCode = new URL(request.url).searchParams.get("orderCode");
    if (!/^\d{6,20}$/.test(String(orderCode || ""))) return fail("Mã đơn hàng không hợp lệ.", 400);
    const orderDocument = await getFirestoreDocument(`paymentOrders/${Number(orderCode)}`, env);
    if (!orderDocument) return fail("Không tìm thấy đơn hàng.", 404);
    const order = orderDocument.data;
    if (order.uid !== account.uid) return fail("Bạn không có quyền xem đơn hàng này.", 403);
    const subscription = await getFirestoreDocument(`billingSubscriptions/${account.uid}`, env);
    const accessEndsAt = subscription?.data?.subscriptionAccessEndsAt || null;
    return json({
      ok: true,
      status: order.status,
      planId: order.planId || null,
      accessEndsAt,
      subscriptionActive: subscription?.data?.subscriptionStatus === "active"
        && accessEndsAt
        && new Date(accessEndsAt).getTime() > Date.now(),
    });
  } catch (error) {
    const result = errorResponse(error);
    return fail(result.message, result.status);
  }
}
