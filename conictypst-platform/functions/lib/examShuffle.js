'use strict';

const crypto = require('node:crypto');

function deterministicUnit(seed, counter) {
  const digest = crypto.createHash('sha256').update(`${seed}\u0000${counter}`).digest();
  return digest.readUInt32BE(0) / 0x100000000;
}

function deterministicShuffle(values, seed) {
  const result = [...values];
  let counter = 0;
  for (let index = result.length - 1; index > 0; index -= 1) {
    const target = Math.floor(deterministicUnit(seed, counter) * (index + 1));
    counter += 1;
    [result[index], result[target]] = [result[target], result[index]];
  }
  return result;
}

function buildAttemptPresentation(publicItems, policy, seed) {
  const originalItemIds = publicItems.map((item) => item.id);
  let itemOrder = originalItemIds;
  if (policy.shuffleQuestions) {
    // Giữ nguyên thứ tự các phần, chỉ đảo câu trong từng phần. Câu không khai
    // báo phần được xem như một nhóm chung để tương thích với đề cũ.
    const groups = [];
    for (const item of publicItems) {
      const section = String(item.section || '');
      const current = groups.at(-1);
      if (!current || current.section !== section) groups.push({ section, ids: [item.id] });
      else current.ids.push(item.id);
    }
    itemOrder = groups.flatMap((group, groupIndex) => deterministicShuffle(
      group.ids,
      `${seed}:questions:section:${groupIndex}:${group.section}`,
    ));
  }
  const optionOrders = {};
  for (const item of publicItems) {
    if (item.type !== 'tn') continue;
    const optionIds = item.options.map((option) => option.id);
    const hasIndependentOptionRenderers = item.supportsOptionShuffle === true
      || item.options.every((option) => ['contentSvg', 'contentText', 'content']
        .some((key) => Boolean(option[key])));
    optionOrders[item.id] = policy.shuffleOptions && hasIndependentOptionRenderers
      ? deterministicShuffle(optionIds, `${seed}:options:${item.id}`)
      : optionIds;
  }
  return { itemOrder, optionOrders };
}

function applyAttemptPresentation(publicItems, presentation = {}) {
  const itemById = new Map(publicItems.map((item) => [item.id, item]));
  const requestedOrder = Array.isArray(presentation.itemOrder) ? presentation.itemOrder : [];
  const validOrder = requestedOrder.length === publicItems.length
    && new Set(requestedOrder).size === publicItems.length
    && requestedOrder.every((itemId) => itemById.has(itemId));
  const itemOrder = validOrder ? requestedOrder : publicItems.map((item) => item.id);
  return itemOrder.map((itemId) => {
    const item = itemById.get(itemId);
    if (item.type !== 'tn') return { ...item };
    const optionById = new Map(item.options.map((option) => [option.id, option]));
    const requestedOptions = presentation.optionOrders?.[item.id];
    const validOptions = Array.isArray(requestedOptions)
      && requestedOptions.length === item.options.length
      && new Set(requestedOptions).size === item.options.length
      && requestedOptions.every((optionId) => optionById.has(optionId));
    const optionOrder = validOptions ? requestedOptions : item.options.map((option) => option.id);
    return { ...item, options: optionOrder.map((optionId) => ({ ...optionById.get(optionId) })) };
  });
}

module.exports = {
  applyAttemptPresentation,
  buildAttemptPresentation,
  deterministicShuffle,
};
