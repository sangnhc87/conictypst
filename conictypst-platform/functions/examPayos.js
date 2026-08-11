const { https } = require('firebase-functions/v2');
const { getFirestore, FieldValue } = require('firebase-admin/firestore');
const { PayOS } = require('@payos/node');
const { reduceMembershipAction } = require('./lib/membership');

const REGION = 'asia-southeast1';

// NOTE: Use the exam site URL
const SITE_URL = 'https://thi-conictypst.pages.dev';

// Định cấu hình các gói cước cơ bản của Conic Exam
const PLANS = {
  'exam-basic-1y': { amount: 299000, months: 12, label: '1 nam' },
  'exam-pro-2y': { amount: 499000, months: 24, label: '2 nam' },
  'exam-vip-5y': { amount: 999000, months: 60, label: '5 nam' },
};

function getPayosClient() {
  return new PayOS({
    clientId: process.env.PAYOS_CLIENT_ID,
    apiKey: process.env.PAYOS_API_KEY,
    checksumKey: process.env.PAYOS_CHECKSUM_KEY,
  });
}

// 1) Tạo link thanh toán
exports.examCreatePayment = https.onCall(
  { region: REGION, cors: true },
  async (request) => {
    if (!request.auth) {
      throw new https.HttpsError('unauthenticated', 'Cần đăng nhập để thanh toán.');
    }
    const uid = request.auth.uid;
    const email = request.auth.token.email || '';
    const planId = request.data?.planId;
    const plan = PLANS[planId];
    if (!plan) {
      throw new https.HttpsError('invalid-argument', 'Gói cước không hợp lệ.');
    }

    const db = getFirestore();
    const orderCode = Number(
      `${Math.floor(Date.now() / 1000)}${Math.floor(Math.random() * 900 + 100)}`
    );
    const ref = db.collection('examPayments').doc(String(orderCode));

    await ref.set({
      orderCode,
      uid,
      email,
      planId,
      amount: plan.amount,
      months: plan.months,
      status: 'pending',
      createdAt: FieldValue.serverTimestamp(),
    });

    const payos = getPayosClient();
    try {
      const link = await payos.paymentRequests.create({
        orderCode,
        amount: plan.amount,
        description: `EXAM ${plan.label}`, // Tối đa 25 ký tự
        returnUrl: `${SITE_URL}/teacher/payment/success?orderCode=${orderCode}`,
        cancelUrl: `${SITE_URL}/teacher/payment/cancel?orderCode=${orderCode}`,
      });
      await ref.set({ paymentLinkId: link.paymentLinkId || null }, { merge: true });
      return { checkoutUrl: link.checkoutUrl, orderCode };
    } catch (err) {
      console.error('PayOS create error:', err);
      await ref.set(
        { status: 'error', error: String(err?.message || err) },
        { merge: true }
      );
      throw new https.HttpsError('internal', 'Không tạo được link thanh toán. Vui lòng thử lại.');
    }
  }
);

// 2) Webhook xử lý thanh toán tự động
exports.examPayosWebhook = https.onRequest(
  { region: REGION },
  async (req, res) => {
    if (req.method !== 'POST') {
      res.status(405).send('Method Not Allowed');
      return;
    }

    const payos = getPayosClient();
    let data;
    try {
      data = payos.webhooks.verify(req.body);
    } catch (err) {
      console.error('PayOS webhook signature invalid:', err?.message || err);
      res.status(400).json({ error: 'invalid signature' });
      return;
    }

    const orderCode = data.orderCode;
    const db = getFirestore();
    const ref = db.collection('examPayments').doc(String(orderCode));
    
    await db.runTransaction(async (transaction) => {
      const snap = await transaction.get(ref);
      if (!snap.exists) {
        console.log('Webhook cho orderCode không tồn tại:', orderCode);
        return;
      }

      const payment = snap.data();
      if (payment.status === 'paid') return; // Idempotent

      if (data.code !== '00') {
        transaction.set(ref, { 
          status: 'failed', 
          webhookCode: data.code, 
          updatedAt: FieldValue.serverTimestamp() 
        }, { merge: true });
        return;
      }

      if (Number(data.amount) !== Number(payment.amount)) {
        console.error(`Amount mismatch order ${orderCode}`);
        transaction.set(ref, { 
          status: 'amount_mismatch', 
          paidAmount: data.amount, 
          updatedAt: FieldValue.serverTimestamp() 
        }, { merge: true });
        return;
      }

      // Xử lý gia hạn / cấp quyền
      const memberRef = db.collection('products').doc('exam').collection('members').doc(payment.uid);
      const memberSnap = await transaction.get(memberRef);
      const currentMember = memberSnap.exists ? memberSnap.data() : null;
      
      const now = new Date();
      // Dummy product cho exam
      const dummyProduct = {
        id: 'exam',
        defaultMonths: 1,
        defaultLimits: {
          storageBytes: 1073741824, // 1GB
          maxClasses: 10,
          maxStudents: 200, // Theo cấu hình gói 299k
          maxResults: 10000,
          maxPublishedExams: 200,
          maxActiveAssignments: 10,
          maxAttemptsPerYear: 5000,
          retentionDays: 180,
          cloudImageEnabled: true,
        }
      };

      const action = (currentMember && ['active', 'suspended'].includes(currentMember.status)) 
        ? 'extend' 
        : 'approve';
        
      const reduced = reduceMembershipAction({
        action,
        current: currentMember,
        payload: { months: payment.months },
        actorUid: 'payos_webhook',
        now,
        product: dummyProduct,
        targetProfile: { uid: payment.uid, email: payment.email }
      });

      const patch = { ...reduced.patch };
      for (const field of reduced.deleteFields) {
        patch[field] = FieldValue.delete();
      }

      transaction.set(memberRef, patch, { merge: true });
      transaction.set(ref, {
        status: 'paid',
        paidAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      }, { merge: true });
    });

    res.status(200).json({ received: true });
  }
);

// 3) API cho Frontend kiểm tra trạng thái
exports.examGetPaymentStatus = https.onCall(
  { region: REGION, cors: true },
  async (request) => {
    if (!request.auth) {
      throw new https.HttpsError('unauthenticated', 'Cần đăng nhập.');
    }
    const orderCode = request.data?.orderCode;
    if (!orderCode) {
      throw new https.HttpsError('invalid-argument', 'Thiếu orderCode.');
    }
    const db = getFirestore();
    const snap = await db.collection('examPayments').doc(String(orderCode)).get();
    if (!snap.exists) return { status: 'not_found' };
    const p = snap.data();
    if (p.uid !== request.auth.uid) {
      throw new https.HttpsError('permission-denied', 'Không có quyền xem.');
    }
    return { status: p.status, planId: p.planId, months: p.months };
  }
);
