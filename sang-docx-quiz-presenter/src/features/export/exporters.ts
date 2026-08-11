import JSZip from "jszip";
import { saveAs } from "file-saver";
import katex from "katex";
import type { ContentBlock, Question, QuizDocument } from "../../models/quiz";
import { profileForQuiz } from "../../config/subjectProfiles";
import { sanitizeRichText } from "../../utils/richText";
import { choiceLayout } from "../../utils/choiceLayout";

const esc = (value: string) => String(value ?? "").replace(/[&<>"']/g, (character) => ({
  "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
})[character]!);

export const createTeacherKey = () => {
  const alphabet = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  const bytes = crypto.getRandomValues(new Uint8Array(12));
  const code = [...bytes].map((byte) => alphabet[byte % alphabet.length]).join("");
  return `GV-${code.slice(0, 4)}-${code.slice(4, 8)}-${code.slice(8)}`;
};

const math = (latex: string, displayMode: boolean) => {
  if (!latex.trim()) return '<span class="formula-missing">[Công thức cần kiểm tra]</span>';
  try {
    return katex.renderToString(latex, { displayMode, throwOnError: false, strict: "ignore" });
  } catch {
    return `<code class="formula-missing">${esc(latex)}</code>`;
  }
};

const decodeRichText = (value: string) => value
  .replace(/&amp;/g, "&")
  .replace(/&lt;/g, "<")
  .replace(/&gt;/g, ">")
  .replace(/&quot;/g, '"')
  .replace(/&#39;|&apos;/g, "'")
  .replace(/&nbsp;/g, " ");

const renderRichText = (value: string) => sanitizeRichText(decodeRichText(value))
  .replace(/\$\$([\s\S]*?)\$\$|\$([^$\n]+?)\$/g, (_match, displayLatex, inlineLatex) => math(displayLatex ?? inlineLatex ?? "", Boolean(displayLatex)))
  .replace(/\n/g, "<br />");

const renderBlocks = (blocks: ContentBlock[] = []) => blocks.map((block) => {
  if (block.kind === "paragraph") return `<p>${renderRichText(block.text)}</p>`;
  if (block.kind === "math") return `<div class="formula ${block.display ? "display" : "inline"}">${math(block.latex, block.display)}</div>`;
  if (block.kind === "image") return `<figure style="--image-width:${Math.max(20, Math.min(100, block.width))}%"><img src="${esc(block.src)}" alt="${esc(block.alt)}"><figcaption>${esc(block.caption || "")}</figcaption></figure>`;
  if (block.kind === "table") return `<div class="table-wrap"><table>${block.rows.map((row) => `<tr>${row.map((cell) => `<td>${esc(cell)}</td>`).join("")}</tr>`).join("")}</table></div>`;
  return `<ul>${block.items.map((item) => `<li>${esc(item)}</li>`).join("")}</ul>`;
}).join("");

const typeLabel = (type: Question["type"]) => ({
  "single-choice": "TRẮC NGHIỆM", "true-false": "ĐÚNG · SAI", "short-answer": "TRẢ LỜI NGẮN", essay: "TỰ LUẬN",
})[type];

const questionBody = (question: Question, index: number, profileId?: string) => {
  if (question.type === "single-choice") {
    const layout = choiceLayout(question, profileId);
    return `<div class="option-grid option-layout-${layout}" style="${layout === "stacked" ? "grid-template-columns:1fr" : ""}">${(question.choices || []).map((choice) => `<article class="option" data-choice="${esc(choice.label)}"><span class="option-label">${esc(choice.label)}</span><div>${renderBlocks(choice.content)}</div><i class="answer-tick">✓</i></article>`).join("")}</div>`;
  }
  if (question.type === "true-false") {
    return `<div class="tf-list">${(question.statements || []).map((statement, statementIndex) => `<article class="tf-row" data-statement="${statementIndex}"><span class="statement-label">${esc(statement.label)})</span><div class="statement-copy">${renderBlocks(statement.content)}</div><div class="tf-answer"><span data-value="true">Đúng</span><span data-value="false">Sai</span></div></article>`).join("")}</div>`;
  }
  if (question.type === "short-answer") {
    return `<div class="short-answer"><span>Đáp án của học sinh</span><div class="answer-line"></div><div class="answer-reveal" data-short="${index}"><small>ĐÁP ÁN</small><b></b></div></div>`;
  }
  return '<div class="essay-space"><span>Phân tích hướng giải và trình bày lập luận</span><i></i><i></i><i></i></div>';
};

const solutionHtml = (question: Question) => question.solution?.length
  ? `<div class="solution-head"><b>💡 Lời giải chi tiết</b></div>${question.solution.map((step, index) => `<div class="solution-step">${question.solution!.length > 1 ? `<span>${String(index + 1).padStart(2, "0")}</span>` : ''}<div>${renderBlocks(step.content)}</div></div>`).join("")}`
  : '<div class="solution-head"><b>Đề chưa kèm lời giải</b></div>';

const groupFor = (quiz: QuizDocument, question: Question) => quiz.groups?.find((group) => group.id === question.groupId);
const sectionFor = (quiz: QuizDocument, question: Question) => quiz.sections?.find((section) => section.id === question.sectionId);

const slide = (quiz: QuizDocument, question: Question, index: number, total: number) => {
  const group = groupFor(quiz, question);
  const section = sectionFor(quiz, question);
  const shared = group ? `<section class="shared-context"><header><b>▣ ${esc(group.title)}</b><small>DỮ KIỆN CHUNG · ${group.questionIds.length} CÂU</small></header>${group.instruction ? `<p class="shared-instruction">${esc(group.instruction)}</p>` : ""}${renderBlocks(group.stimulus)}</section>` : "";
  return `<section class="slide" data-index="${index}" aria-label="Câu ${question.number}">
  <div class="slide-chrome"><span>CONIC · AI LESSON STUDIO</span><span class="teacher-star" aria-hidden="true">◆</span><span>${String(index + 1).padStart(2, "0")} / ${String(total).padStart(2, "0")}</span></div>
  <main class="question-card">
    <header class="question-header"><div><span class="question-number">${String(question.number).padStart(2, "0")}</span><div><small>${esc(section?.title || typeLabel(question.type))}</small><h1>Câu ${question.number}</h1></div></div><span class="confidence ${question.confidence}">${question.confidence === "high" ? "Đã nhận diện" : question.confidence === "medium" ? "Nên đối chiếu" : "Cần kiểm tra"}</span></header>
    ${shared}<div class="stem">${renderBlocks(question.stem)}</div>${questionBody(question, index, quiz.profile?.id)}
    <aside class="solution-panel" data-solution="${index}"></aside>
  </main>
  <footer><span>← → chuyển câu</span><span><kbd>K</kbd> ám hiệu · <kbd>A</kbd> đáp án · <kbd>S</kbd> lời giải · <kbd>F</kbd> toàn màn hình</span></footer>
</section>`;
};

interface SecureQuestion {
  choice: string;
  statements: Array<boolean | null>;
  shortAnswers: string[];
  solution: string;
}

const bytesToBase64 = (bytes: Uint8Array) => {
  let binary = "";
  for (let index = 0; index < bytes.length; index += 0x8000) binary += String.fromCharCode(...bytes.subarray(index, index + 0x8000));
  return btoa(binary);
};

const encryptVault = async (quiz: QuizDocument, teacherKey: string) => {
  if (teacherKey.trim().length < 8) throw new Error("Khóa người dạy cần ít nhất 8 ký tự.");
  const payload: SecureQuestion[] = quiz.questions.map((question) => ({
    choice: question.choices?.find((choice) => choice.isCorrect)?.label || "",
    statements: (question.statements || []).map((statement) => statement.correctValue ?? null),
    shortAnswers: question.shortAnswer?.acceptedAnswers || [],
    solution: solutionHtml(question),
  }));
  const encoder = new TextEncoder();
  const salt = crypto.getRandomValues(new Uint8Array(16));
  const iv = crypto.getRandomValues(new Uint8Array(12));
  const material = await crypto.subtle.importKey("raw", encoder.encode(teacherKey), "PBKDF2", false, ["deriveKey"]);
  const key = await crypto.subtle.deriveKey({ name: "PBKDF2", salt, iterations: 250_000, hash: "SHA-256" }, material, { name: "AES-GCM", length: 256 }, false, ["encrypt"]);
  const ciphertext = await crypto.subtle.encrypt({ name: "AES-GCM", iv }, key, encoder.encode(JSON.stringify(payload)));
  return { salt: bytesToBase64(salt), iv: bytesToBase64(iv), data: bytesToBase64(new Uint8Array(ciphertext)) };
};

export const htmlFor = async (quiz: QuizDocument, teacherKey: string) => {
  const vault = await encryptVault(quiz, teacherKey);
  return `<!doctype html><html lang="vi"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><meta name="color-scheme" content="light"><title>${esc(quiz.title)}</title>
<style>
:root{--forest:#073c35;--forest-2:#0b5548;--ink:#14352f;--paper:#fffdf8;--green:#20c86f;--green-dark:#087a50;--orange:#f97316;--orange-soft:#fff0e3;--line:#dce7df;--muted:#6c7d76;font-family:Inter,"Segoe UI",Arial,sans-serif;color:var(--ink);background:var(--forest);font-synthesis:none}*{box-sizing:border-box}body{margin:0;overflow:hidden;background:radial-gradient(circle at 75% -20%,#178067 0,var(--forest) 48%,#042b27 100%)}button{font:inherit}.deck{height:100vh}.slide{position:absolute;inset:0;display:grid;grid-template-rows:auto minmax(0,1fr) auto;gap:12px;padding:clamp(14px,2.5vh,28px) clamp(16px,3vw,48px);opacity:0;transform:translateX(5%);pointer-events:none;transition:opacity .42s ease,transform .55s cubic-bezier(.2,.8,.2,1)}.slide.active{opacity:1;transform:none;pointer-events:auto}.slide.previous{transform:translateX(-5%)}.slide-chrome,.slide>footer{display:flex;align-items:center;justify-content:space-between;color:#b8d6cb;font-size:clamp(10px,1vw,13px);letter-spacing:.13em}.slide>footer{letter-spacing:.02em}.teacher-star{opacity:0;color:var(--orange);filter:drop-shadow(0 0 8px var(--orange));transition:.25s}.teacher-mode .teacher-star{opacity:1;animation:pulse 1.8s infinite}.question-card{position:relative;width:min(1540px,100%);height:100%;margin:auto;padding:clamp(24px,4vh,58px) clamp(24px,4.2vw,72px);overflow:auto;border:1px solid rgba(255,255,255,.75);border-radius:clamp(16px,2vw,28px);background:linear-gradient(145deg,#fffdf8,#f7fcf8);box-shadow:0 42px 120px rgba(0,31,25,.45);scrollbar-width:thin}.question-card:before{content:"";position:absolute;inset:0 auto 0 0;width:8px;background:linear-gradient(var(--green),var(--orange))}.question-header{display:flex;align-items:center;justify-content:space-between;gap:20px;margin-bottom:clamp(18px,3vh,32px)}.question-header>div{display:flex;align-items:center;gap:16px}.question-header h1{margin:1px 0 0;font:750 clamp(24px,3vw,48px)/1 Georgia,serif;letter-spacing:-.035em}.question-header small{color:var(--orange);font-size:clamp(9px,.9vw,12px);font-weight:850;letter-spacing:.15em}.question-number{display:grid;place-items:center;width:clamp(50px,5.3vw,76px);aspect-ratio:1;color:white;border-radius:20px;background:linear-gradient(135deg,var(--green-dark),var(--green));box-shadow:0 10px 24px rgba(32,200,111,.25);font-size:clamp(18px,2vw,30px);font-weight:850}.confidence{padding:8px 12px;border-radius:999px;background:#e5f7ed;color:var(--green-dark);font-size:11px;font-weight:750}.confidence.low{background:var(--orange-soft);color:#b54b09}.stem{font:500 clamp(20px,2.15vw,36px)/1.55 Georgia,"Times New Roman",serif}.stem>p:first-child{margin-top:0}.stem p{margin:.42em 0}.formula{text-align:center;overflow:auto}.formula.inline{display:inline}.formula.display{margin:.65em auto;font-size:1.08em}.formula-missing{padding:3px 7px;color:#9c4e35;background:var(--orange-soft);border-radius:5px}math{font-family:"Cambria Math","STIX Two Math",serif}figure{width:var(--image-width);max-width:100%;margin:1em auto;text-align:center}figure img{display:block;max-width:100%;max-height:38vh;margin:auto;object-fit:contain}figcaption{margin-top:5px;color:var(--muted);font-size:12px}.table-wrap{overflow:auto}table{border-collapse:collapse;margin:12px auto;background:#fff}td{padding:9px 12px;border:1px solid var(--line)}.option-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:clamp(10px,1.4vw,18px);margin-top:clamp(16px,2.5vh,30px)}.option{position:relative;display:grid;grid-template-columns:auto 1fr auto;align-items:center;gap:14px;min-height:clamp(64px,8vh,100px);padding:13px 18px;border:1px solid var(--line);border-radius:16px;background:#fff;box-shadow:0 3px 12px rgba(7,60,53,.04);transition:transform .22s ease,border-color .22s ease,box-shadow .22s ease}.option:hover{transform:translateY(-3px);border-color:#91d8b0;box-shadow:0 14px 30px rgba(7,60,53,.12)}.option-label{display:grid;place-items:center;width:42px;height:42px;border:1px solid #cbd8d0;border-radius:12px;color:var(--green-dark);font-weight:850}.option p,.tf-row p{margin:.25em 0;font:500 clamp(16px,1.45vw,24px)/1.4 Georgia,serif}.answer-tick{display:none;color:var(--green-dark);font-size:24px}.show-answer .option.answer-revealed{border-color:var(--green);background:#effbf4;box-shadow:0 0 0 3px rgba(32,200,111,.16)}.show-answer .option.answer-revealed .option-label{color:white;border-color:var(--green-dark);background:var(--green-dark)}.show-answer .option.answer-revealed .answer-tick{display:block}.teacher-mode .option.teacher-cue:after{content:"";position:absolute;right:10px;top:10px;width:9px;height:9px;border-radius:50%;background:var(--orange);box-shadow:0 0 0 5px rgba(249,115,22,.13),0 0 18px var(--orange)}.tf-list{display:grid;gap:9px;margin-top:20px}.tf-row{display:grid;grid-template-columns:auto minmax(0,1fr) auto;align-items:center;gap:14px;padding:10px 14px;border-bottom:1px solid var(--line)}.statement-label{font-weight:850;color:var(--green-dark)}.tf-answer{display:flex;gap:6px}.tf-answer span{position:relative;padding:7px 11px;border:1px solid var(--line);border-radius:9px;color:var(--muted);font-size:13px}.show-answer .tf-answer .answer-revealed{color:white;border-color:var(--green-dark);background:var(--green-dark)}.teacher-mode .tf-answer .teacher-cue{border-color:var(--orange);box-shadow:0 0 0 3px rgba(249,115,22,.12)}.short-answer{margin-top:28px;padding:20px;border:1px dashed #a9c9b7;border-radius:16px;background:#f5fbf7}.short-answer>span{color:var(--muted);font-size:12px;font-weight:750;text-transform:uppercase;letter-spacing:.1em}.answer-line{height:36px;border-bottom:2px solid #aebcb4}.answer-reveal{display:none;align-items:center;gap:14px;margin-top:15px;color:var(--green-dark)}.answer-reveal small{letter-spacing:.12em}.answer-reveal b{font:700 clamp(20px,2vw,30px) Georgia,serif}.show-answer .answer-reveal{display:flex}.teacher-mode .short-answer{box-shadow:inset 0 -3px var(--orange)}.essay-space{display:grid;gap:24px;margin-top:24px;color:var(--muted)}.essay-space i{height:1px;background:#d6dfda}.solution-panel{display:none;margin-top:24px;padding:clamp(18px,2vw,28px);border:1px solid #c9e5d4;border-radius:18px;background:linear-gradient(135deg,#effaf4,#fff8f0)}.show-solution .solution-panel{display:block;animation:rise .35s ease}.solution-head{display:flex;flex-direction:column;margin-bottom:13px;color:var(--green-dark)}.solution-head span{color:var(--orange);font-size:10px;font-weight:850;letter-spacing:.15em}.solution-head b{font:700 23px Georgia,serif}.solution-step{display:grid;grid-template-columns:38px 1fr;gap:11px;padding:11px 0;border-top:1px solid #d8e9df}.solution-step>span{display:grid;place-items:center;width:31px;height:31px;border-radius:9px;color:white;background:linear-gradient(135deg,var(--green-dark),var(--green));font-weight:850}.solution-step p{margin:.25em 0;line-height:1.5}.controls{position:fixed;right:clamp(16px,3vw,40px);bottom:clamp(40px,5vh,64px);z-index:20;display:flex;gap:7px}.controls button{display:grid;place-items:center;min-width:44px;height:44px;padding:0 13px;color:white;border:1px solid rgba(255,255,255,.17);border-radius:12px;background:rgba(5,50,44,.88);box-shadow:0 10px 30px rgba(0,0,0,.22);cursor:pointer;backdrop-filter:blur(10px);transition:.22s}.controls button:hover{color:white;border-color:var(--orange);background:var(--orange);transform:translateY(-3px);box-shadow:0 14px 30px rgba(249,115,22,.3)}.controls #key{color:#ffd7b8;border-color:rgba(249,115,22,.45)}.progress{position:fixed;left:0;bottom:0;z-index:30;width:100%;height:5px;background:rgba(255,255,255,.1)}.progress i{display:block;height:100%;width:0;background:linear-gradient(90deg,var(--green),var(--orange));transition:width .35s ease}kbd{padding:2px 6px;border:1px solid #52766d;border-radius:5px;background:#0b4d43;color:#d5eee5;font:inherit}@keyframes rise{from{opacity:0;transform:translateY(10px)}}@keyframes pulse{50%{transform:scale(1.35);opacity:.55}}@media(max-width:800px){.option-grid{grid-template-columns:1fr}.slide{padding:10px}.slide-chrome,.slide>footer{padding-inline:4px}.slide>footer span:first-child{display:none}.question-card{padding:22px}.confidence{display:none}.tf-row{grid-template-columns:auto 1fr}.tf-answer{grid-column:2}.controls{bottom:42px}}@media print{body{overflow:visible;background:#fff}.slide{position:relative;display:grid;min-height:100vh;opacity:1;transform:none;page-break-after:always}.controls,.progress{display:none}}
.shared-context{margin:0 0 18px;padding:14px 18px;border:1px solid #bfdbfe;border-radius:16px;background:linear-gradient(135deg,#eff6ff,#f8fafc)}.shared-context header{display:flex;justify-content:space-between;gap:12px;color:#1d4ed8}.shared-context header small{color:#64748b;letter-spacing:.08em}.shared-context p{margin:.4em 0;line-height:1.5}.shared-instruction{font-weight:700;color:#475569}
</style></head><body><div class="deck">${quiz.questions.map((question, index) => slide(quiz, question, index, quiz.questions.length)).join("")}</div>
<div class="controls"><button id="prev" aria-label="Câu trước">←</button><button id="key" aria-label="Ám hiệu người dạy">K</button><button id="answer" aria-label="Hiện đáp án">A</button><button id="solution" aria-label="Hiện lời giải">S</button><button id="full" aria-label="Toàn màn hình">⛶</button><button id="next" aria-label="Câu sau">→</button></div><div class="progress"><i></i></div>
<script>const vault=${JSON.stringify(vault).replace(/</g, "\\u003c")},slides=[...document.querySelectorAll('.slide')],bar=document.querySelector('.progress i');let current=0,secure=null;const from64=s=>Uint8Array.from(atob(s),c=>c.charCodeAt(0));async function unlock(){if(secure)return true;const pass=prompt('Khóa người dạy · chỉ nhập khi học sinh không nhìn thấy');if(!pass)return false;try{const material=await crypto.subtle.importKey('raw',new TextEncoder().encode(pass),'PBKDF2',false,['deriveKey']),key=await crypto.subtle.deriveKey({name:'PBKDF2',salt:from64(vault.salt),iterations:250000,hash:'SHA-256'},material,{name:'AES-GCM',length:256},false,['decrypt']),plain=await crypto.subtle.decrypt({name:'AES-GCM',iv:from64(vault.iv)},key,from64(vault.data));secure=JSON.parse(new TextDecoder().decode(plain));hydrate();return true}catch{alert('Khóa chưa đúng. Dữ liệu đáp án vẫn đang được bảo vệ.');return false}}function hydrate(){slides.forEach((slide,index)=>{const data=secure[index]||{};slide.querySelectorAll('.teacher-cue,.answer-revealed').forEach(x=>x.classList.remove('teacher-cue','answer-revealed'));if(data.choice){const option=[...slide.querySelectorAll('[data-choice]')].find(x=>x.dataset.choice===data.choice);option?.classList.add('teacher-cue','answer-revealed')}for(const [i,value]of(data.statements||[]).entries()){if(value===null)continue;const row=slide.querySelector('[data-statement="'+i+'"]'),target=row?.querySelector('[data-value="'+value+'"]');target?.classList.add('teacher-cue','answer-revealed')}const short=slide.querySelector('[data-short] b');if(short)short.textContent=(data.shortAnswers||[]).join(' · ')||'Chưa có đáp án';const panel=slide.querySelector('[data-solution]');if(panel)panel.innerHTML=data.solution||''})}function show(next){current=Math.max(0,Math.min(slides.length-1,next));slides.forEach((slide,index)=>{slide.classList.toggle('active',index===current);slide.classList.toggle('previous',index<current)});bar.style.width=((current+1)/Math.max(slides.length,1)*100)+'%';history.replaceState(null,'','#cau-'+(current+1))}function move(value){show(current+value)}async function teacherCue(){if(await unlock())slides[current].classList.toggle('teacher-mode')}async function reveal(){if(await unlock())slides[current].classList.toggle('show-answer')}async function revealSolution(){if(await unlock())slides[current].classList.toggle('show-solution')}document.querySelector('#prev').onclick=()=>move(-1);document.querySelector('#next').onclick=()=>move(1);document.querySelector('#key').onclick=teacherCue;document.querySelector('#answer').onclick=reveal;document.querySelector('#solution').onclick=revealSolution;document.querySelector('#full').onclick=()=>document.fullscreenElement?document.exitFullscreen():document.documentElement.requestFullscreen();addEventListener('keydown',event=>{if(['ArrowRight','PageDown',' '].includes(event.key)){event.preventDefault();move(1)}else if(['ArrowLeft','PageUp'].includes(event.key)){event.preventDefault();move(-1)}else if(event.key.toLowerCase()==='k')teacherCue();else if(event.key.toLowerCase()==='a')reveal();else if(event.key.toLowerCase()==='s')revealSolution();else if(event.key.toLowerCase()==='f')document.querySelector('#full').click();else if(event.key==='Home')show(0);else if(event.key==='End')show(slides.length-1)});const hash=Number(location.hash.replace(/\D/g,''));show(Number.isFinite(hash)&&hash>0?hash-1:0);<\/script></body></html>`;
};

export const exportHtml = async (quiz: QuizDocument, teacherKey: string) =>
  saveAs(new Blob([await htmlFor(quiz, teacherKey)], { type: "text/html;charset=utf-8" }), "bai-trinh-chieu.html");

export const exportJson = (quiz: QuizDocument) =>
  saveAs(new Blob([JSON.stringify(quiz, null, 2)], { type: "application/json" }), "quiz-data.json");

export const exportZip = async (quiz: QuizDocument, teacherKey: string) => {
  const zip = new JSZip();
  zip.file("index.html", await htmlFor(quiz, teacherKey));
  zip.file("README.txt", "Mở index.html để trình chiếu. Đáp án/lời giải đã mã hóa AES-GCM; bấm K và nhập khóa người dạy. Hình được nhúng để không mất khi đổi máy. quiz-data.json không nằm trong gói học sinh; hãy xuất JSON riêng để lưu bản biên tập.");
  saveAs(await zip.generateAsync({ type: "blob" }), "bai-trinh-chieu-bao-mat.zip");
};

// ==========================================
// EXPORT TYPST (.typ) CHUẨN SANG-MATH:1.0.4
// ==========================================
export const typstFor = (quiz: QuizDocument): string => {
  const blocksToTypst = (blocks: ContentBlock[]) =>
    blocks
      .map((b) => {
        if (b.kind === "paragraph") return b.text;
        if (b.kind === "math") return b.display ? `\n$ ${b.latex} $\n` : `$${b.latex}$`;
        if (b.kind === "image") return `\n#image("${b.name || 'image.png'}", width: ${b.width}%)\n`;
        return "";
      })
      .join(" ");

  const singleChoiceQuestions = quiz.questions.filter((q) => q.type === "single-choice");
  const trueFalseQuestions = quiz.questions.filter((q) => q.type === "true-false");
  const shortAnswerQuestions = quiz.questions.filter((q) => q.type === "short-answer");
  const essayQuestions = quiz.questions.filter((q) => q.type === "essay");
  const blocksForQuestion = (question: Question) => [...(groupFor(quiz, question)?.stimulus || []), ...question.stem];
  const profile = profileForQuiz(quiz);
  const subjectLabel = profile.label || "Toán THPT";

  const lines: string[] = [
    `// ĐỀ THI TỰ ĐỘNG XUẤT TỪ CONIC AI LESSON STUDIO CHUẨN SANG-MATH:1.0.4`,
    `#import "@preview/sang-math:1.0.4": *`,
    ``,
    `#let preset = exam-preset(`,
    `  theme: "teal-pro",`,
    `  profile: "loigiai",`,
    `  opt-style: "plain",`,
    `  q-label-style: "plain",`,
    `  two-columns: false,`,
    `  answer-key: false,`,
    `)`,
    `#let (tn, ds, tln, tl) = exam-mode(..preset.question, show-hyperlink: true)`,
    ``,
    `#show: sang-setup.with(math-color: preset.accent)`,
    `#show: exam-theme.with(`,
    `  theme: preset.theme,`,
    `  school: "${subjectLabel.toUpperCase().replace(/"/g, '\\"')}",`,
    `  exam-title: "${(quiz.title || `ĐỀ THI ${subjectLabel}`).replace(/"/g, '\\"')}",`,
    `  subject: "${subjectLabel.toUpperCase().replace(/"/g, '\\"')}",`,
    `  duration: "${profile.examDuration || "90 phút"}",`,
    `  code: "101",`,
    `  ..preset.template,`,
    `)`,
    ``,
  ];

  const renderSolution = (q: Question) => {
    if (!q.solution?.length) return "";
    return `,\n  loigiai: [\n    ${q.solution.map((step, idx) => `*Bước ${idx + 1}:* ${blocksToTypst(step.content)}`).join("\n    ")}\n  ]`;
  };

  if (singleChoiceQuestions.length) {
    lines.push(`#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án], count: ${singleChoiceQuestions.length})`);
    singleChoiceQuestions.forEach((q) => {
      const choicesStr = (q.choices || [])
        .map((c) => (c.isCorrect ? `True([${blocksToTypst(c.content)}])` : `[${blocksToTypst(c.content)}]`))
        .join(", ");
      lines.push(`#tn([${blocksToTypst(blocksForQuestion(q))}], (${choicesStr})${renderSolution(q)})\n`);
    });
  }

  if (trueFalseQuestions.length) {
    lines.push(`#exam-part([PHẦN II. Câu trắc nghiệm Đúng - Sai], count: ${trueFalseQuestions.length})`);
    trueFalseQuestions.forEach((q) => {
      const statementsStr = (q.statements || [])
        .map((s) => (s.correctValue === true ? `True([${blocksToTypst(s.content)}])` : `[${blocksToTypst(s.content)}]`))
        .join(",\n    ");
      lines.push(`#ds([${blocksToTypst(blocksForQuestion(q))}],\n  (\n    ${statementsStr}\n  )${renderSolution(q)}\n)\n`);
    });
  }

  if (shortAnswerQuestions.length) {
    lines.push(`#exam-part([PHẦN III. Câu trả lời ngắn], count: ${shortAnswerQuestions.length})`);
    shortAnswerQuestions.forEach((q) => {
      const ans = q.shortAnswer?.acceptedAnswers?.join(" / ") || "";
      lines.push(`#tln([${blocksToTypst(blocksForQuestion(q))}], [${ans}]${renderSolution(q)})\n`);
    });
  }

  if (essayQuestions.length) {
    lines.push(`#exam-part([PHẦN IV. Tự luận], count: ${essayQuestions.length})`);
    essayQuestions.forEach((q) => {
      lines.push(`#tl([${blocksToTypst(blocksForQuestion(q))}]${renderSolution(q)})\n`);
    });
  }

  return lines.join("\n");
};

export const exportTypst = (quiz: QuizDocument) =>
  saveAs(new Blob([typstFor(quiz)], { type: "text/plain;charset=utf-8" }), `${(quiz.title || "de-thi").replace(/\s+/g, "-")}.typ`);

// ==========================================
// EXPORT LaTeX THEO CẤU TRÚC ex_test.sty
// ==========================================
// ex_test.sty dùng \choice, \choiceTF, \shortans và môi trường ex. Ảnh được
// giữ lại dưới dạng ghi chú/khung thay thế để file .tex luôn biên dịch được;
// người dùng chỉ cần đặt file ảnh cùng thư mục rồi thay tên trong khung nếu cần.
const texEscape = (value: string) => String(value ?? "")
  .replace(/\\/g, "\\textbackslash{}")
  .replace(/([{}%&#_$])/g, "\\$1")
  .replace(/\^/g, "\\textasciicircum{}")
  .replace(/~/g, "\\textasciitilde{}");

const texInlineBlock = (block: ContentBlock): string => {
  if (block.kind === "paragraph") return texEscape(block.text);
  if (block.kind === "math") return block.display ? `\\[\n${block.latex}\n\\]` : `$${block.latex}$`;
  if (block.kind === "image") {
    const name = texEscape(block.name || "image.png");
    return `\\begin{center}\\fbox{\\parbox{0.82\\linewidth}{\\centering Hình ảnh: \\texttt{${name}}\\\\\\smallskip\\emph{Đặt ảnh cùng thư mục với tệp .tex để chèn lại.}}}\\end{center}`;
  }
  if (block.kind === "table") {
    const columnCount = Math.max(1, ...block.rows.map((row) => row.length));
    const columns = "|" + "c|".repeat(columnCount);
    const rows = block.rows.map((row) => `${row.map(texEscape).join(" & ")} \\\\ \\hline`).join("\n");
    return `\\begin{center}\\begin{tabular}{${columns}}\\hline\n${rows}\n\\end{tabular}\\end{center}`;
  }
  return `\\begin{itemize}\n${block.items.map((item) => `\\item ${texEscape(item)}`).join("\n")}\n\\end{itemize}`;
};

const texBlocks = (blocks: ContentBlock[] = []) => blocks.map(texInlineBlock).join("\n\n");

const texSolution = (question: Question) => {
  if (!question.solution?.length) return "";
  const steps = question.solution.map((step, index) => `\\textbf{Bước ${index + 1}.} ${texBlocks(step.content)}`).join("\n\n");
  return `\n\\loigiai{\n${steps}\n}`;
};

const texQuestion = (quiz: QuizDocument, question: Question) => {
  const shared = groupFor(quiz, question);
  const stem = texBlocks([...(shared?.stimulus || []), ...question.stem]);
  if (question.type === "single-choice") {
    const choices = (question.choices || []).map((choice) => {
      const content = texBlocks(choice.content);
      return `{${choice.isCorrect ? "\\True " : ""}${content}}`;
    });
    return `\\begin{ex}\n${stem}\n\\choice${choices.join("")}\n${texSolution(question)}\n\\end{ex}`;
  }
  if (question.type === "true-false") {
    const statements = (question.statements || []).map((statement) => {
      const content = texBlocks(statement.content);
      return `{${statement.correctValue === true ? "\\True " : ""}${content}}`;
    });
    return `\\begin{ex}\n${stem}\n\\choiceTF${statements.join("")}\n${texSolution(question)}\n\\end{ex}`;
  }
  if (question.type === "short-answer") {
    const answer = question.shortAnswer?.acceptedAnswers?.[0] || "";
    return `\\begin{ex}\n${stem}\n\\shortans{${texEscape(answer)}}\n${texSolution(question)}\n\\end{ex}`;
  }
  return `\\begin{ex}\n${stem}\n${texSolution(question)}\n\\end{ex}`;
};

export const exTestFor = (quiz: QuizDocument): string => {
  const title = texEscape(quiz.title || "ĐỀ THI");
  return `% !TeX program = pdflatex
% Tệp được xuất từ Conic AI Lesson Studio theo cấu trúc ex_test.sty.
% Hãy đặt ex_test.sty (và các ảnh cần dùng) cùng thư mục trước khi biên dịch.
\\documentclass[12pt,a4paper]{article}
\\usepackage[utf8]{vietnam}
\\usepackage[T5]{fontenc}
\\usepackage{lmodern}
\\usepackage{amsmath,amssymb}
\\usepackage{graphicx}
\\usepackage[margin=1.5cm]{geometry}
\\usepackage[loigiai]{ex_test}
\\begin{document}
\\begin{center}
  {\\Large\\bfseries ${title}}\\par
  \\medskip
  \\textit{Sinh tự động từ ${texEscape(quiz.sourceFileName || "tài liệu nhập vào")}}
\\end{center}
\\bigskip

${quiz.questions.map((question) => texQuestion(quiz, question)).join("\n\n\\bigskip\n\n")}

\\end{document}
`;
};

export const exportExTest = (quiz: QuizDocument) =>
  saveAs(new Blob([exTestFor(quiz)], { type: "text/x-tex;charset=utf-8" }), `${(quiz.title || "de-thi").replace(/\s+/g, "-")}-ex-test.tex`);

// ==========================================
// EXPORT DOCX WITH NATIVE WORD MATH EQUATIONS (MathML -> OMML)
// ==========================================
export const docxHtmlFor = (quiz: QuizDocument): string => {
  const latexToDocxMath = (latex: string, displayMode: boolean = false): string => {
    if (!latex) return "";
    try {
      // MS Word natively converts MathML (<math xmlns="http://www.w3.org/1998/Math/MathML">)
      // into native Word Equation objects (m:oMath)
      const mathml = katex.renderToString(latex, { output: "mathml", displayMode, throwOnError: false });
      return mathml;
    } catch {
      return `<span>${esc(latex)}</span>`;
    }
  };

  const processTextWithMath = (text: string): string => {
    if (!text) return "";
    return sanitizeRichText(decodeRichText(text))
      .replace(/\$\$([\s\S]*?)\$\$|\$([^$\n]+?)\$/g, (_match, displayLatex, inlineLatex) => {
        const latex = displayLatex ?? inlineLatex ?? "";
        return displayLatex
          ? `<p style="text-align:center;margin:8px 0;">${latexToDocxMath(latex, true)}</p>`
          : latexToDocxMath(latex, false);
      })
      .replace(/\n/g, "<br />");
  };

  const renderDocxBlocks = (blocks: ContentBlock[]) =>
    blocks
      .map((b) => {
        if (b.kind === "paragraph") return processTextWithMath(b.text);
        if (b.kind === "math") return `<div style="text-align:center;margin:8px 0;">${latexToDocxMath(b.latex, true)}</div>`;
        if (b.kind === "image") return `<div style="text-align:center;margin:12px 0;"><img src="${esc(b.src)}" style="max-width:450px;height:auto;" /></div>`;
        return "";
      })
      .join("");

  return `<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta charset="utf-8">
<title>${esc(quiz.title || `ĐỀ THI ${quiz.profile?.label || "MÔN TOÁN"}`)}</title>
<!--[if gte mso 9]>
<xml>
 <w:WordDocument>
  <w:View>Print</w:View>
  <w:Zoom>100</w:Zoom>
  <w:DoNotOptimizeForCurrentState/>
 </w:WordDocument>
</xml>
<![endif]-->
<style>
@page { size: A4; margin: 2cm 2cm 2cm 2cm; }
body { font-family: "Times New Roman", Times, serif; font-size: 12pt; line-height: 1.5; color: #000; }
h1 { text-align: center; font-size: 16pt; font-weight: bold; margin-bottom: 20pt; text-transform: uppercase; }
.cau { margin-bottom: 14pt; text-align: justify; }
.stem { margin-bottom: 6pt; }
.options-table { width: 100%; margin-top: 4pt; margin-bottom: 10pt; border-collapse: collapse; }
.options-table td { padding: 4pt 6pt; vertical-align: top; border: none; font-size: 12pt; }
.pa { margin-left: 18pt; margin-bottom: 4pt; }
.shared-context { margin: 12pt 0; padding: 10pt; border: 1pt solid #93c5fd; background: #eff6ff; }
.shared-context h2 { margin: 0 0 5pt; font-size: 13pt; color: #1d4ed8; }
</style>
</head>
<body>
<h1>${esc(quiz.title || `ĐỀ THI ${quiz.profile?.label || "MÔN TOÁN"}`)}</h1>
${quiz.questions
  .map(
    (q, questionIndex) => {
      const group = groupFor(quiz, q);
      const firstInGroup = group && quiz.questions.findIndex((question) => question.groupId === group.id) === questionIndex;
      return `${firstInGroup ? `<div class="shared-context"><h2>▣ ${esc(group.title)}</h2>${group.instruction ? `<p><i>${esc(group.instruction)}</i></p>` : ""}${renderDocxBlocks(group.stimulus)}</div>` : ""}
<div class="cau">
  <div class="stem"><b>Câu ${q.number}:</b> ${renderDocxBlocks(q.stem)}</div>
  ${
    q.type === "single-choice" && q.choices && q.choices.length === 4
      ? `<table class="options-table">
          <tr>
            <td style="width:25%;"><b>A.</b> ${renderDocxBlocks(q.choices[0].content)}</td>
            <td style="width:25%;"><b>B.</b> ${renderDocxBlocks(q.choices[1].content)}</td>
            <td style="width:25%;"><b>C.</b> ${renderDocxBlocks(q.choices[2].content)}</td>
            <td style="width:25%;"><b>D.</b> ${renderDocxBlocks(q.choices[3].content)}</td>
          </tr>
         </table>`
      : q.type === "single-choice" && q.choices
      ? q.choices.map((c) => `<div class="pa"><b>${esc(c.label)}.</b> ${renderDocxBlocks(c.content)}</div>`).join("")
      : q.type === "true-false" && q.statements
      ? q.statements.map((s) => `<div class="pa"><b>${esc(s.label)})</b> ${renderDocxBlocks(s.content)}</div>`).join("")
      : ""
  }
</div>`;
    },
  )
  .join("")}
</body>
</html>`;
};

export const exportDocx = (quiz: QuizDocument) =>
  saveAs(new Blob([docxHtmlFor(quiz)], { type: "application/msword;charset=utf-8" }), `${(quiz.title || "de-thi").replace(/\s+/g, "-")}.doc`);
