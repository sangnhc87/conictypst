#!/usr/bin/env node
'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const enginePath = path.join(__dirname, 'js', 'omr_engine.js');
const sandbox = {
  window: {},
  console,
  setInterval,
  clearInterval,
};
vm.runInNewContext(fs.readFileSync(enginePath, 'utf8'), sandbox, {
  filename: enginePath,
});

const analyze = (counts, innerCounts = counts) =>
  sandbox.window.OmrEngine.analyzeBubbleColumn(counts, innerCounts);

{
  const result = analyze([55, 58, 176, 61], [4, 5, 82, 6]);
  assert.equal(result.selected, true);
  assert.equal(result.ambiguous, false);
  assert.equal(result.weak, false);
  assert.equal(result.maxIdx, 2);
}

{
  const result = analyze([61, 67, 91, 63], [2, 3, 28, 2]);
  assert.equal(result.selected, true);
  assert.equal(result.ambiguous, false);
  assert.equal(result.weak, true);
  assert.equal(result.maxIdx, 2);
}

{
  const result = analyze([62, 67, 65, 64], [2, 3, 2, 2]);
  assert.equal(result.selected, false);
  assert.equal(result.ambiguous, false);
}

{
  const result = analyze([54, 163, 151, 58], [3, 71, 64, 4]);
  assert.equal(result.selected, true);
  assert.equal(result.ambiguous, true);
  assert.equal(result.strongCount, 2);
}

{
  const result = analyze([52, 92, 87, 55], [2, 25, 23, 3]);
  assert.equal(result.selected, false);
  assert.equal(result.ambiguous, true);
}

{
  const result = analyze([]);
  assert.equal(result.selected, false);
  assert.equal(result.maxIdx, -1);
}

console.log('OMR quality classifier: all checks passed');
