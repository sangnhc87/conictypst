import test from "node:test";
import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";

test("Studio Storage chỉ dùng bucket riêng và vé HMAC", async () => {
  const source = await readFile(new URL("../src/worker.js", import.meta.url), "utf8");
  assert.equal(source.includes("r2.dev"), false);
  assert.equal(source.includes("R2_ACCESS_KEY"), false);
  assert.equal(source.includes("STUDIO_STORAGE_HMAC_SECRET"), true);
  assert.equal(source.includes("studio/users/${payload.uid}/"), true);
  assert.equal(source.includes("16 * 1024 * 1024"), true);
});
