'use strict';

const ACCESS_MODES = Object.freeze(['public', 'authenticated', 'approval']);

function assertAccessMode(product) {
  if (!product || !ACCESS_MODES.includes(product.accessMode)) {
    throw new Error(`accessMode không hợp lệ cho sản phẩm ${product?.id || 'không xác định'}.`);
  }
  return product.accessMode;
}

function automaticMembership(product, profile) {
  const accessMode = assertAccessMode(product);
  if (accessMode === 'approval') return null;
  return {
    ...profile,
    productId: product.id,
    status: accessMode === 'public' ? 'public' : 'active',
    accessMode,
    autoGranted: true,
    hasAccess: true,
    limits: { ...product.defaultLimits },
  };
}

function approvalRequired(product) {
  return assertAccessMode(product) === 'approval';
}

module.exports = {
  ACCESS_MODES,
  approvalRequired,
  assertAccessMode,
  automaticMembership,
};
