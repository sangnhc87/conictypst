import { expect, test } from "@playwright/test";

test("mở demo, sửa câu và xem trước cập nhật", async ({ page }) => {
  await page.goto("/");
  await expect(page).toHaveTitle(/Conic AI Lesson Studio/);
  await page.getByRole("button", { name: "Mở bài demo" }).click();
  await expect(page.getByText("BIÊN TẬP")).toBeVisible();
  await expect(page.getByText("XEM TRƯỚC TRỰC TIẾP")).toBeVisible();
  await expect(page.locator(".slide-preview")).toContainText("Cho cấp số cộng");
  const editor = page.locator('label:has-text("Nội dung câu hỏi") [contenteditable="true"]');
  await editor.fill("Nội dung kiểm thử giao diện trực tiếp");
  await expect(page.locator(".slide-preview")).toContainText("Nội dung kiểm thử giao diện trực tiếp");
});

test("trình chiếu và bộ xuất hiện diện", async ({ page }) => {
  await page.goto("/");
  await page.getByRole("button", { name: "Mở bài demo" }).click();
  await expect(page.getByRole("button", { name: "Xuất HTML" })).toBeVisible();
  await expect(page.getByRole("button", { name: "Xuất ZIP" })).toBeVisible();
  await page.getByRole("button", { name: /Trình chiếu/ }).click();
  await expect(page.locator(".deck-shell")).toBeVisible();
  await expect(page.getByRole("button", { name: /✕ Thoát/ })).toBeVisible();
  await expect(page.locator(".deck-dot")).toHaveCount(4);
});
