(function (global) {
  'use strict';

  // Keep the legacy indexes for every existing bubble. The only new item is
  // digit 0 in column 1, appended at index 10 so old printed sheets and saved
  // coordinates remain compatible.
  const COLUMN_SYMBOLS = Object.freeze([
    Object.freeze(['-', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0']),
    Object.freeze([',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']),
    Object.freeze([',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']),
    Object.freeze(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])
  ]);

  function normalize(value) {
    return String(value ?? '')
      .trim()
      .replace(/[−–]/g, '-')
      .replace(/\./g, ',')
      .replace(/\s+/g, '');
  }

  function align(value) {
    const chars = Array.from(normalize(value)).slice(0, 4);
    return Array.from({ length: 4 }, (_, index) => chars[index] ?? null);
  }

  function bubbleIndex(symbol, columnIndex) {
    const symbols = COLUMN_SYMBOLS[columnIndex];
    if (!symbols || symbol === null || symbol === undefined || symbol === '') return -1;
    const normalized = symbol === '.' ? ',' : String(symbol);
    return symbols.indexOf(normalized);
  }

  function decodeBubble(index, columnIndex) {
    const symbols = COLUMN_SYMBOLS[columnIndex];
    if (!symbols || !Number.isInteger(index) || index < 0 || index >= symbols.length) return null;
    return symbols[index];
  }

  function upgradeTemplate(template) {
    if (!template || !template.tln) return template;

    Object.values(template.tln).forEach(tinfo => {
      if (!Array.isArray(tinfo) || tinfo.length < 2) return;
      if (!Array.isArray(tinfo[0]) || tinfo[0].length !== 10) return;
      if (!Array.isArray(tinfo[1]) || !Array.isArray(tinfo[1][1])) return;
      if (!Array.isArray(tinfo[0][0])) return;

      const zeroPoint = [tinfo[0][0][0], tinfo[1][1][1]];
      tinfo[0].push(zeroPoint);
    });

    template.tlnSchema = 2;
    return template;
  }

  function upgradeRegistry(registry) {
    if (!registry || typeof registry !== 'object') return registry;
    Object.values(registry).forEach(upgradeTemplate);
    return registry;
  }

  const codec = Object.freeze({
    COLUMN_SYMBOLS,
    normalize,
    align,
    bubbleIndex,
    decodeBubble,
    upgradeTemplate,
    upgradeRegistry
  });

  global.OmrTlnCodec = codec;
  if (typeof module !== 'undefined' && module.exports) module.exports = codec;
})(typeof window !== 'undefined' ? window : globalThis);
