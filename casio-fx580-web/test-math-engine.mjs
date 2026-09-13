import assert from 'node:assert';
import { Fraction } from './src/engine/fraction.js';
import { Complex } from './src/engine/complex.js';
import { Memory } from './src/engine/memory.js';
import { Evaluator } from './src/engine/evaluator.js';
import { Solver } from './src/engine/solver.js';
import { TableGenerator } from './src/engine/table.js';
import { Calculus } from './src/engine/calculus.js';

console.log("=== BẮT ĐẦU KIỂM THỬ CASIO FX-580VN X MATH ENGINE ===");

// 1. Phân số chính xác
const f1 = new Fraction(1n, 3n);
const f2 = new Fraction(1n, 6n);
const fSum = f1.add(f2);
assert.strictEqual(fSum.toString(), "1/2", "Phân số 1/3 + 1/6 phải bằng 1/2");
console.log("✓ Test 1: Phân số chính xác (1/3 + 1/6 = 1/2) PASS");

// 2. Phân tích thừa số nguyên tố (FACT)
const fact60 = Calculus.factorize(60);
assert.strictEqual(fact60, "2^2 × 3 × 5", "60 = 2^2 × 3 × 5");
console.log("✓ Test 2: Phân tích thừa số nguyên tố 60 PASS");

// 3. Giải phương trình bậc 2
const quadRes = Solver.solveQuadratic(1, -5, 6);
assert.strictEqual(quadRes.roots.length, 2);
const r1 = quadRes.roots[0].re;
const r2 = quadRes.roots[1].re;
assert(Math.abs(r1 - 3) < 1e-9 || Math.abs(r1 - 2) < 1e-9);
assert(Math.abs(r2 - 3) < 1e-9 || Math.abs(r2 - 2) < 1e-9);
assert.strictEqual(quadRes.vertex.x, 2.5);
assert.strictEqual(quadRes.vertex.y, -0.25);
console.log("✓ Test 3: Giải PT bậc 2 (x^2 - 5x + 6 = 0) và cực trị đỉnh Parabol PASS");

// 4. Giải hệ phương trình bậc nhất 2 ẩn
// 2x + 3y = 8
// 3x - y = 1
// Nghiệm: x = 1, y = 2
const linRes = Solver.solveLinearSystem([[2, 3], [3, -1]], [8, 1]);
assert.strictEqual(linRes[0], 1);
assert.strictEqual(linRes[1], 2);
console.log("✓ Test 4: Giải hệ phương trình 2 ẩn PASS");

// 5. Đạo hàm và Tích phân
const mem = new Memory();
const ev = new Evaluator(mem);
const deriv = ev.evaluate("d/dx(x^2 + 3*x, 2)");
assert.strictEqual(deriv.number, 7);
console.log("✓ Test 5: Đạo hàm d/dx(x^2 + 3x)|x=2 = 7 PASS");

const integ = ev.evaluate("∫(x^2, 0, 3)");
assert.strictEqual(integ.number, 9);
console.log("✓ Test 6: Tích phân ∫_0^3 x^2 dx = 9 PASS");

// 6. Test chế độ TABLE đúng với ảnh chụp của người dùng!
// Hàm: (x+3)*sqrt(10-x^2) - (x^2 - x - 12)
// Với x = -5, 10 - (-5)^2 = -15 < 0 -> ERROR!
const tableFn = (xVal) => ev.evaluate("(x+3)*sqrt(10-x^2) - (x^2 - x - 12)", { x: xVal }).number;
const tableRows = TableGenerator.generate(tableFn, null, -5, -3.965, 0.345);

assert.strictEqual(tableRows[0].x, -5);
assert.strictEqual(tableRows[0].fx, "ERROR", "Tại x = -5 phải báo ERROR vì ngoài TXĐ");
assert.strictEqual(tableRows[1].x, -4.655);
assert.strictEqual(tableRows[1].fx, "ERROR", "Tại x = -4.655 phải báo ERROR");
assert.strictEqual(tableRows[2].x, -4.31);
assert.strictEqual(tableRows[2].fx, "ERROR", "Tại x = -4.31 phải báo ERROR");
assert.strictEqual(tableRows[3].x, -3.965);
assert.strictEqual(tableRows[3].fx, "ERROR", "Tại x = -3.965 phải báo ERROR");

console.log("✓ Test 7: Tái hiện chuẩn xác 100% kết quả TABLE trong ảnh của người dùng! PASS");

console.log("\n===> TẤT CẢ CÁC BÀI KIỂM THỬ TOÁN HỌC ĐỀU VƯỢT QUA HOÀN TOÀN! <===");
