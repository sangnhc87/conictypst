import assert from 'node:assert/strict';
import test from 'node:test';
import { detectTypstEntry, typstFileTree } from '../src/lib/typstProject.js';
import { extractQuestionCalls, parseQuestionSources, prepareEntrySource, rewriteBundledRuntimeImports } from '../src/publisher/collector.js';
import { decodeStructuredContent, encodeStructuredContent } from '../src/lib/structuredContent.js';
import { typstMathToLatex } from '../../src/exam/engine/typstToHtml.js';
import katex from 'katex';

const text = content => ({ kind: 'text', content });

test('tự chọn file đề thay vì module thư viện', () => {
  const files = {
    '/project/sang-exam.typ': text('#let tn = none'),
    '/project/de-thi.typ': text('#let make-questions(tn: tn) = [#tn([Câu], ())]'),
  };
  assert.equal(detectTypstEntry(files), '/project/de-thi.typ');
});

test('ưu tiên main.typ và tạo cây thư mục ổn định', () => {
  const files = {
    '/project/assets/logo.png': { kind: 'binary', content: new Uint8Array() },
    '/project/chapters/data.typ': text(''),
    '/project/main.typ': text('Hello'),
  };
  assert.equal(detectTypstEntry(files), '/project/main.typ');
  const tree = typstFileTree(files);
  assert.deepEqual(tree.children.map(item => [item.name, item.kind]), [
    ['assets', 'folder'], ['chapters', 'folder'], ['main.typ', 'file'],
  ]);
});

test('một file đề cũ tự dùng runtime sang-math thay cho import ở thư mục cha', () => {
  const source = [
    '#import "../sang-exam.typ": *',
    '#import "../bbt.typ": *',
    '#import "@preview/cetz:0.5.2"',
    '#import "../math-sym.typ": *',
  ].join('\n');
  const rewritten = rewriteBundledRuntimeImports(source);
  assert.equal((rewritten.match(/@preview\/sang-math:1\.0\.1/gu) || []).length, 1);
  assert.doesNotMatch(rewritten, /"\.\.\/(?:sang-exam|bbt|math-sym)\.typ"/u);
  assert.match(rewritten, /@preview\/cetz:0\.5\.2/u);
});

test('tự cắt câu hỏi trực tiếp và bỏ qua khai báo giao diện của file nguồn', () => {
  const source = `
    #set page("a4")
    #show: body => body
    // #tn([Câu giả], (True([A]), [B]))
    #let helper(x) = [Giá trị #(x)]
    #exam-part([Phần I])
    #tn([#helper(1)], (True([A]), [B]), loigiai: [Có (ngoặc) trong nội dung])
    #ds([Câu 2], (True([a]), [b], True([c]), [d]))
  `;
  assert.deepEqual(extractQuestionCalls(source).map(item => item.name), ['exam-part', 'tn', 'ds']);
  const prepared = prepareEntrySource(source);
  assert.equal(prepared.factory, 'conic-auto-questions');
  assert.equal(prepared.mode, 'automatic');
  assert.match(prepared.source, /#let conic-auto-questions/u);
});

test('bỏ comment cấu hình đầu lời gọi và chỉ tách hình phức tạp thành tài sản SVG', () => {
  const source = `#tn(
    // cols: 2,
    // row-gutter: 2em,
    [Giải phương trình $tfrac(1, x) = 2$ #align(center)[#cetz.canvas({})]],
    (True([$x = 1/2$]), [$x = 2$]),
    loigiai: [Dùng #bbt("x") để xét.],
  )`;
  const parsed = parseQuestionSources(source);
  assert.equal(parsed[0].stemSource.startsWith('[Giải phương trình'), true);
  const prepared = prepareEntrySource(source);
  assert.equal(prepared.webQuestions[0].stemSource.includes('// cols'), false);
  assert.match(prepared.webQuestions[0].stemSource, /@@CONIC_ASSET_0@@/u);
  assert.match(prepared.webQuestions[0].solutionSource, /@@CONIC_ASSET_1@@/u);
  assert.equal(prepared.assets.length, 2);
});

test('gói nội dung có cấu trúc chỉ mang theo các tài sản được tham chiếu', () => {
  const encoded = encodeStructuredContent(['[Câu $x^2$]', '@@CONIC_ASSET_1@@'], [
    { encoding: 'gzip-base64', data: 'unused' },
    { encoding: 'gzip-base64', data: 'used' },
  ]);
  const decoded = decodeStructuredContent(encoded);
  assert.deepEqual(decoded.sources, ['[Câu $x^2$]', '@@CONIC_ASSET_1@@']);
  assert.deepEqual(decoded.assets, { 1: { encoding: 'gzip-base64', data: 'used' } });
});

test('đổi các lệnh phân số và phần trăm Typst sang KaTeX', () => {
  assert.match(typstMathToLatex('dfrac(a, b)'), /\\dfrac\{a\}\{b\}/u);
  assert.match(typstMathToLatex('tfrac(a, b)'), /\\tfrac\{a\}\{b\}/u);
  assert.match(typstMathToLatex('80%'), /80\\%/u);
});

test('chuyển cases, heva và hoac của sang-math thành hệ KaTeX cân bằng', () => {
  const samples = [
    ['cases(x = frac(1, 2), y = text("với mọi x"))', /\\begin\{cases\}/u],
    ['heva(x > 0, 160 - 2x > 0)', /\\begin\{cases\}/u],
    ['hoac(x = 1, x = -1)', /\\left\[\\begin\{array\}\{l\}/u],
    ['heva(x = 1, hoac(y = 2, y = 3))', /\\begin\{cases\}.*\\left\[/u],
  ];
  for (const [source, expected] of samples) {
    const latex = typstMathToLatex(source);
    assert.match(latex, expected);
    assert.doesNotMatch(latex, /\b(?:cases|heva|hoac)\(/u);
    assert.doesNotThrow(() => katex.renderToString(latex, { throwOnError: true, strict: false }));
  }
});

test('fig: cetz.canvas không có dấu # vẫn được biên dịch thành SVG riêng', () => {
  const source = '#tn([Câu có hình], (True([A]), [B]), fig: cetz.canvas(length: 1cm, {}))';
  const prepared = prepareEntrySource(source);
  assert.equal(prepared.assets.length, 1);
  assert.match(prepared.assets[0], /^#cetz\.canvas/u);
  assert.equal(prepared.webQuestions[0].figureSource, '@@CONIC_ASSET_0@@');
});

test('bbtv2 và bảng biến thiên tên tùy biến được tách thành SVG', () => {
  const source = `#tn([
    Cho hàm số có bảng biến thiên:
    #align(center)[#bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($+$, $"||"$, $+$),
      v-vals: ($-2$, ($+oo$, $-oo$), $-2$),
    )]
    Đường tiệm cận đứng là?
  ], (True([$x=1$]), [$y=-2$]))`;
  const prepared = prepareEntrySource(source);
  assert.equal(prepared.assets.length, 1);
  assert.match(prepared.assets[0], /#align\(center\)\[#bbtv2/u);
  assert.match(prepared.webQuestions[0].stemSource, /@@CONIC_ASSET_0@@/u);
  assert.doesNotMatch(prepared.webQuestions[0].stemSource, /x-vals/u);
});
