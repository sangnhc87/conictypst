const assert = require('node:assert/strict');
require('./js/tln_codec.js');
const codec = globalThis.OmrTlnCodec;

const cases = new Map([
  ['5', ['5', null, null, null]],
  ['16', ['1', '6', null, null]],
  ['832', ['8', '3', '2', null]],
  ['0', ['0', null, null, null]],
  [0, ['0', null, null, null]],
  ['-2', ['-', '2', null, null]],
  ['4,5', ['4', ',', '5', null]],
  ['-2,3', ['-', '2', ',', '3']],
  ['61,5', ['6', '1', ',', '5']],
]);

for (const [answer, expected] of cases) {
  assert.deepEqual(codec.align(answer), expected, `Ánh xạ TLN ${answer}`);
}

assert.equal(codec.bubbleIndex('-', 0), 0);
assert.equal(codec.bubbleIndex('2', 0), 2);
assert.equal(codec.bubbleIndex('0', 0), 10);
assert.equal(codec.bubbleIndex(',', 1), 0);
assert.equal(codec.bubbleIndex('2', 1), 3);
assert.equal(codec.decodeBubble(10, 0), '0');
assert.equal(codec.decodeBubble(3, 1), '2');

const legacyTemplate = {
  tln: {
    1: [
      [[10, 10], [10, 30], [10, 40], [10, 50], [10, 60], [10, 70], [10, 80], [10, 90], [10, 100], [10, 110]],
      [[20, 20], [20, 25]],
      [],
      []
    ]
  }
};
codec.upgradeTemplate(legacyTemplate);
assert.equal(legacyTemplate.tln[1][0].length, 11);
assert.deepEqual(legacyTemplate.tln[1][0][10], [10, 25]);

console.log(`TLN codec OK: ${cases.size} alignment cases + indexes + template migration`);
