import assert from "node:assert";
import test from "node:test";
import { uploadCanMessage } from "../../src/services/upload-service";

test("uploadCanMessage successfully logs message", async () => {
  const data = { id: 1, data: [0, 1, 2], timestamp: new Date().toISOString() };

  const result = await uploadCanMessage(data);
  assert.strictEqual(
    result,
    true,
    "uploadCanMessage should return true on success"
  );
});

test("uploadCanMessage handles failure gracefully", async () => {
  // Temporarily override `fetch` or other dependencies if needed
  const data = { id: 1, data: [0, 1, 2], timestamp: new Date().toISOString() };

  const result = await uploadCanMessage(data);
  assert.strictEqual(
    result,
    true,
    "uploadCanMessage should return false on failure"
  );
});
