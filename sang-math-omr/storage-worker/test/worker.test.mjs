import test from "node:test";
import assert from "node:assert/strict";

test("storage worker source contains no public bucket fallback", async () => {
  const source = await import("node:fs/promises").then((fs) => fs.readFile(new URL("../src/worker.js", import.meta.url), "utf8"));
  assert.equal(source.includes("r2.dev"), false);
  assert.equal(source.includes("R2_ACCESS_KEY"), false);
  assert.equal(source.includes("OMR_STORAGE_HMAC_SECRET"), true);
});
