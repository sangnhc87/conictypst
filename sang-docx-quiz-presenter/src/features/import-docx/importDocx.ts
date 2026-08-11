import DOMPurify from 'dompurify';
import { inspectDocx, shouldPreferStructuralHtml } from './docxInspector';
import { parseBiologyStructuredHtml, parseEnglishStructuredHtml, parseGeographyStructuredHtml, parseGdqpStructuredHtml, parseHistoryStructuredHtml, parseInformaticsStructuredHtml, parseLiteratureStructuredHtml, parsePhysicsStructuredHtml, parseProfileStructuredHtml, parseStructuredHtml } from '../question-parser/parser';
import { getSubjectProfile } from '../../config/subjectProfiles';
import type { ImageBlock, QuizDocument } from '../../models/quiz';
import { uid } from '../../models/quiz';
export const MAX_FILE_SIZE=80*1024*1024;
export type DocxAssessment = {
  risk: 'low' | 'high';
  score: number;
  reasons: string[];
  shouldUseCloudVerification: boolean;
};
const assessDocxImport = (inspection: Awaited<ReturnType<typeof inspectDocx>>, parsed: { questions: Array<{ number: number; type: string; choices?: unknown[]; warnings: string[] }>; warnings: Array<{ message: string }> }, usedStructuralRecovery: boolean): DocxAssessment => {
  let score = 0;
  const reasons: string[] = [];
  const markerNumbers = inspection.structure.blocks
    .map((block) => block.text.match(/^(?:(?:Câu|Bài|Question)\s*)?0*(\d+)\s*[.:)]\s+/iu)?.[1])
    .filter((value): value is string => Boolean(value));
  const expected = new Set(markerNumbers.map(Number));
  const actual = new Set(parsed.questions.map((question) => question.number));
  const missingQuestions = [...expected].filter((number) => !actual.has(number));
  if (!parsed.questions.length) {
    score += 5;
    reasons.push('Không tách được câu hỏi từ DOCX.');
  }
  if (missingQuestions.length) {
    score += 3;
    reasons.push(`Thiếu ${missingQuestions.length} câu so với số thứ tự trong Word.`);
  }
  if (usedStructuralRecovery) {
    score += 2;
    reasons.push('Word có nội dung bị bộ chuyển đổi HTML bỏ sót.');
  }
  const incompleteChoices = parsed.questions.filter((question) => question.type === 'single-choice' && (question.choices?.length || 0) < 4);
  if (incompleteChoices.length) {
    score += 2;
    reasons.push(`${incompleteChoices.length} câu trắc nghiệm chưa đủ bốn phương án.`);
  }
  if (inspection.oleCount && !inspection.mediaPlacements.some((placement) => placement.isOlePreview)) {
    score += 2;
    reasons.push('Có MathType/OLE không có ảnh xem trước.');
  }
  if (inspection.mediaPlacements.some((placement) => placement.questionNumber === undefined)) {
    score += 1;
    reasons.push('Có hình chưa gắn chắc chắn vào câu hỏi.');
  }
  if (inspection.structure.textBoxParagraphs && usedStructuralRecovery) {
    score += 1;
    reasons.push('Có textbox/floating text cần đối chiếu theo bố cục.');
  }
  return { risk: score >= 3 ? 'high' : 'low', score, reasons, shouldUseCloudVerification: score >= 3 };
};
const runWorker=(buffer:ArrayBuffer,onProgress:(n:number,s:string)=>void)=>new Promise<{html:string;messages:string[]}>((resolve,reject)=>{
  const worker=new Worker(new URL('../../workers/docx.worker.ts',import.meta.url),{type:'module'});
  worker.onmessage=e=>{if(e.data.type==='progress')onProgress(e.data.progress,e.data.message);else if(e.data.type==='done'){worker.terminate();resolve(e.data)}else if(e.data.type==='error'){worker.terminate();reject(new Error(e.data.message))}};
  worker.onerror=e=>{worker.terminate();reject(new Error(e.message))};worker.postMessage(buffer,[buffer]);
});
export async function importDocx(file:File,onProgress:(n:number,s:string)=>void,options?:{profileId?:string}){
  if(!file.name.toLowerCase().endsWith('.docx')) throw new Error('File không phải DOCX. Định dạng .doc cũ không được hỗ trợ.');
  if(file.size>MAX_FILE_SIZE) throw new Error('File quá lớn (tối đa 80 MB). Hãy giảm kích thước ảnh trong Word.');
  const bytes=await file.arrayBuffer();onProgress(8,'Đang kiểm tra cấu trúc DOCX…');
  const inspection=await inspectDocx(bytes.slice(0)); const converted=await runWorker(bytes,onProgress);
  // Use Mammoth for the normal path. If it dropped material text from tables
  // or floating text boxes, switch to the OOXML recovery stream instead of
  // silently producing a shuffled quiz.
  const usedStructuralRecovery = shouldPreferStructuralHtml(converted.html, inspection.structure);
  const sourceHtml = usedStructuralRecovery ? inspection.structure.html : converted.html;
  const profileId = options?.profileId;
  const formulaPreviewProfile = profileId === 'physics-thpt-v1' || profileId === 'biology-thpt-v1';
  const formulaPreviewSources = formulaPreviewProfile
    ? inspection.mediaPlacements.filter((placement) => placement.isOlePreview).map((placement) => inspection.images.find((asset) => asset.id === placement.assetId)?.src).filter((src): src is string => Boolean(src))
    : [];
  let formulaPreviewIndex = 0;
  const htmlSource = formulaPreviewProfile
    ? sourceHtml.replace(/<img\b([^>]*?)\bsrc=(['"])data:image\/x-wmf;[^'"]*\2([^>]*)>/giu, (tag, before, quote, after) => {
      const src = formulaPreviewSources[formulaPreviewIndex++];
      return src ? `<img${before}src=${quote}${src}${quote}${after}>` : tag;
    })
    : sourceHtml;
  const html=DOMPurify.sanitize(htmlSource,{FORBID_TAGS:['script','iframe','object','embed'],FORBID_ATTR:['onerror','onclick']});
  const parsed=profileId?.startsWith('english-')
    ? parseEnglishStructuredHtml(html, profileId)
    : profileId === 'history-thpt-v1'
    ? parseHistoryStructuredHtml(html, profileId)
    : profileId === 'geography-thpt-v1'
    ? parseGeographyStructuredHtml(html, profileId)
    : profileId === 'biology-thpt-v1'
    ? parseBiologyStructuredHtml(html, profileId)
    : profileId === 'physics-thpt-v1'
    ? parsePhysicsStructuredHtml(html, profileId)
    : profileId === 'gdqp-10-v1'
    ? parseGdqpStructuredHtml(html, profileId)
    : profileId === 'informatics-thpt-v1'
    ? parseInformaticsStructuredHtml(html, profileId)
    : profileId === 'literature-thpt-v1'
    ? parseLiteratureStructuredHtml(html, profileId)
    : profileId && profileId !== 'math-thpt-v1'
    ? parseProfileStructuredHtml(html, profileId)
    : parseStructuredHtml(html);
  const assessment = assessDocxImport(inspection, parsed, usedStructuralRecovery);
  const recoveryWarning = usedStructuralRecovery
    ? [{ id: uid('w'), type: 'parser' as const, message: `Đã phục hồi DOCX trực tiếp từ cấu trúc Word (${inspection.structure.tableCells} ô bảng, ${inspection.structure.textBoxParagraphs} đoạn textbox) vì bộ chuyển đổi HTML bỏ sót nội dung.` }]
    : [];
  const assessmentWarning = assessment.shouldUseCloudVerification
    ? [{ id: uid('w'), type: 'parser' as const, message: `DOCX có rủi ro cao (${assessment.reasons.join(' ')}) · nên dùng Mistral để đối chiếu cấu trúc.` }]
    : [];
  const rawWarnings=[...inspection.warnings.filter((warning) => !(formulaPreviewProfile && /^Đã chuyển .* từ WMF sang PNG/iu.test(warning.message))),...recoveryWarning,...assessmentWarning,...parsed.warnings,...converted.messages.map(message=>({id:uid('w'),type:'parser' as const,message}))];
  const warnings=rawWarnings.filter((warning, index, all) => all.findIndex((item) => item.type === warning.type && item.message === warning.message) === index);
  const questionFor=(number?:number, sectionId?:string)=>parsed.questions.find(q=>q.number===number && (!sectionId || q.sectionId===sectionId))||parsed.questions.find(q=>q.number===number)||parsed.questions[0];
  const appendMediaBlock = (q: NonNullable<ReturnType<typeof questionFor>>, block: ImageBlock, phase?: 'questions'|'answers'|'solutions') => {
    if (phase === 'solutions' && q.solution?.length) {
      q.solution.at(-1)!.content.push(block);
      return;
    }
    if ((profileId === 'physics-thpt-v1' || profileId === 'biology-thpt-v1') && phase === 'questions' && q.groupId) {
      parsed.groups?.find((group) => group.id === q.groupId)?.stimulus.push(block);
      return;
    }
    q.stem.push(block);
  };
  for(const placement of inspection.mathPlacements){const q=questionFor(placement.questionNumber, placement.sectionId);if(q&&!q.stem.some(x=>x.kind==='math'&&x.latex===placement.block.latex))q.stem.push(placement.block);}
  const profileImageWidth = getSubjectProfile(profileId).imageWidth || 84;
  const parsedImageSources = new Set([
    ...parsed.questions.flatMap((question) => question.stem.filter((block) => block.kind === 'image').map((block) => block.src)),
    ...(parsed.groups || []).flatMap((group) => group.stimulus.filter((block) => block.kind === 'image').map((block) => block.src)),
  ]);
  for(const placement of inspection.mediaPlacements){const asset=inspection.images.find(x=>x.id===placement.assetId),q=questionFor(placement.questionNumber, placement.sectionId);if(!asset||!q||parsedImageSources.has(asset.src))continue;const block: ImageBlock={id:uid('img'),kind:'image',src:asset.src,name:asset.name,alt:placement.isOlePreview?'Ảnh xem trước công thức MathType':asset.name,width:placement.isOlePreview?Math.min(profileImageWidth,52):profileImageWidth,align:'center',needsPositionReview:placement.questionNumber===undefined};appendMediaBlock(q, block, placement.phase);}
  if(parsed.questions.length&&inspection.oleCount&&!inspection.mediaPlacements.some(x=>x.isOlePreview)){const q=parsed.questions.at(-1)!;q.stem.push({id:uid('math'),kind:'math',latex:'',display:false,status:'unsupported'});q.warnings.push('MathType/OLE không có ảnh xem trước dùng được.');}
  const quiz:QuizDocument={id:uid('quiz'),title:file.name.replace(/\.docx$/i,''),sourceFileName:file.name,createdAt:new Date().toISOString(),questions:parsed.questions,warnings,sections:parsed.sections,groups:parsed.groups,settings:{theme:'light',revealMode:'step',hideAnswersInitially:true,ratio:'16:9'}};
  onProgress(100,'Hoàn tất');return {quiz,inspection,assessment,html};
}
