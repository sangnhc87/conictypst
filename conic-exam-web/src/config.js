export const APP_CONFIG = Object.freeze({
  region: import.meta.env.VITE_FIREBASE_REGION || 'asia-southeast1',
  ownerEmail: 'nguyensangnhc@gmail.com',
  productId: 'exam',
  priceLabel: '100.000đ / 12 tháng',
  identityFirebase: Object.freeze({
    apiKey: 'AIzaSyDwbd6q4EHUp_JouOD5K1a96yNxq_RTTfc',
    authDomain: 'conicgv.firebaseapp.com',
    projectId: 'conicgv',
    storageBucket: 'conicgv.firebasestorage.app',
    messagingSenderId: '777103975965',
    appId: '1:777103975965:web:00f564c7f00de09698c8f4',
  }),
  platformFirebase: Object.freeze({
    apiKey: 'AIzaSyAOjWhQD6DsrInCKgsfTKoZST6wHWavB_c',
    authDomain: 'conictypst-platform.firebaseapp.com',
    projectId: 'conictypst-platform',
    storageBucket: 'conictypst-platform.firebasestorage.app',
    messagingSenderId: '247634082918',
    appId: '1:247634082918:web:373969616934306f8441a7',
  }),
});
