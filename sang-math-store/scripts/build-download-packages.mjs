import { cp, mkdir, readFile, rm, writeFile } from "node:fs/promises";
import { execFileSync } from "node:child_process";
import { join, resolve } from "node:path";

const root = resolve(import.meta.dirname, "../..");
const storeRoot = resolve(import.meta.dirname, "..");
const staging = join(storeRoot, ".download-packages");
const output = join(storeRoot, ".download-zips");
await rm(staging, { recursive: true, force: true });
await rm(output, { recursive: true, force: true });
await mkdir(staging, { recursive: true });
await mkdir(output, { recursive: true });

const themeReadme = (name, theme) => `# Sang Math — ${name}\n\nMở \`main.typ\` bằng Typst hoặc VS Code có plugin Typst.\n\n- Theme đang bật: \`${theme}\`\n- Sửa nhanh trường, tên đề, thời lượng và câu hỏi trong file.\n- Biên dịch bằng \`typst compile main.typ\`.\n\nFile này dành cho người mua sử dụng cá nhân; không đăng lại hoặc bán lại mã nguồn.\n`;
const themeSource = (await readFile(resolve(root, "typst-pkg-sang-math/examples/copy-ready/01-de-15-phut.typ"), "utf8")).replaceAll("@preview/sang-math:1.0.2", "@preview/sang-math:1.0.1");
for (const [id, theme] of [["teal-pro", "teal-pro"], ["aurora", "aurora"], ["navy-gold", "navy-gold"], ["lotus", "lotus"], ["ocean-hexagon", "ocean"]]) {
  let content = themeSource.replace('#let theme = "teal-pro"', `#let theme = "${theme}"`);
  if (id === "ocean-hexagon") content = content.replace('#let preset = exam-preset(theme: theme, profile: profile)', '#let preset = exam-preset(theme: theme, profile: profile, opt-style: "hexagon")');
  const dir = join(staging, id);
  await mkdir(dir, { recursive: true });
  await writeFile(join(dir, "main.typ"), content, "utf8");
  await writeFile(join(dir, "README.md"), themeReadme(id, theme), "utf8");
  execFileSync("zip", ["-qr", join(output, `${id}.zip`), "."], { cwd: dir });
}

let hyperlink = await readFile(resolve(root, "sang-math-user-guide-examples-v2/examples/05_full_hyperlink_de_thi_mau.typ"), "utf8");
hyperlink = hyperlink.replace('#import "../lib.typ": *', '#import "sang-math/sang-exam.typ": *\n#import "sang-math/exam-templates.typ": *');
hyperlink = hyperlink.replace('#import "05_data_de_thi_mau.typ": make-questions', '#import "data.typ": make-questions');
const hyperlinkDir = join(staging, "hyperlink");
await mkdir(hyperlinkDir, { recursive: true });
await writeFile(join(hyperlinkDir, "main.typ"), hyperlink, "utf8");
const hyperlinkData = (await readFile(resolve(root, "sang-math-user-guide-examples-v2/examples/05_data_de_thi_mau.typ"), "utf8")).replace('#import "../lib.typ": *', '#import "sang-math/sang-exam.typ": *\n#import "sang-math/exam-templates.typ": *');
await writeFile(join(hyperlinkDir, "data.typ"), hyperlinkData, "utf8");
const hyperlinkEngineDir = join(hyperlinkDir, "sang-math");
await mkdir(hyperlinkEngineDir, { recursive: true });
for (const file of ["sang-exam.typ", "exam-templates.typ"]) {
  await cp(resolve(root, "sang-math-user-guide-examples-v2", file), join(hyperlinkEngineDir, file));
}
await writeFile(join(hyperlinkDir, "README.md"), themeReadme("Hyperlink Tự Động", "navy-gold + show-hyperlink"), "utf8");
execFileSync("zip", ["-qr", join(output, "hyperlink.zip"), "."], { cwd: hyperlinkDir });

const beamerDir = join(staging, "beamer");
await mkdir(beamerDir, { recursive: true });
let beamer = await readFile(resolve(root, "sang-math-user-guide-examples-v2/examples/11-slide-beamer.typ"), "utf8");
beamer = beamer.replace('#import "../../typst-pkg-submit/sang-beamer.typ": *', '#import "sang-beamer.typ": *');
await writeFile(join(beamerDir, "main.typ"), beamer, "utf8");
await cp(resolve(root, "typst-pkg-submit/sang-beamer.typ"), join(beamerDir, "sang-beamer.typ"));
await cp(resolve(root, "typst-pkg-submit/sang-exam.typ"), join(beamerDir, "sang-exam.typ"));
await writeFile(join(beamerDir, "README.md"), themeReadme("Beamer Teal Pro", "Touying 16:9"), "utf8");
execFileSync("zip", ["-qr", join(output, "beamer.zip"), "."], { cwd: beamerDir });

const draftDir = join(staging, "draft-duplex");
await mkdir(draftDir, { recursive: true });
let draft = await readFile(resolve(root, "typst-pkg-sang-math/examples/copy-ready/07-de-70-30-nhap-in-hai-mat.typ"), "utf8");
draft = draft.replace('#import "@preview/sang-math:1.0.2": layout-draft', '#import "print-layouts.typ": layout-draft');
await writeFile(join(draftDir, "main.typ"), draft, "utf8");
await cp(resolve(root, "typst-pkg-sang-math/print-layouts.typ"), join(draftDir, "print-layouts.typ"));
await writeFile(join(draftDir, "README.md"), themeReadme("Đề 70/30 — Nháp Đối Xứng", "layout-draft"), "utf8");
execFileSync("zip", ["-qr", join(output, "draft-duplex.zip"), "."], { cwd: draftDir });

console.log(`Created ${output}`);
