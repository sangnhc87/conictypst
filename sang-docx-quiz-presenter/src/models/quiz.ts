export type QuestionType = 'single-choice' | 'true-false' | 'short-answer' | 'essay';
export type Confidence = 'high' | 'medium' | 'low';
export type MathStatus = 'native-math' | 'omml-converted' | 'mathtype-preview' | 'manual-latex' | 'unsupported';
export type Alignment = 'left' | 'center' | 'right';

export interface ParagraphBlock { id: string; kind: 'paragraph'; text: string }
export interface MathBlock { id: string; kind: 'math'; latex: string; display: boolean; status: MathStatus }
export interface ImageBlock { id: string; kind: 'image'; src: string; name: string; alt: string; caption?: string; width: number; align: Alignment; needsPositionReview?: boolean }
export interface TableBlock { id: string; kind: 'table'; rows: string[][] }
export interface ListBlock { id: string; kind: 'list'; items: string[] }
export type ContentBlock = ParagraphBlock | MathBlock | ImageBlock | TableBlock | ListBlock;
// null means the source did not provide a reliable answer key yet.
export interface Choice { id: string; label: string; content: ContentBlock[]; isCorrect: boolean | null }
export interface TrueFalseStatement { id: string; label: string; content: ContentBlock[]; correctValue?: boolean }
export interface ShortAnswerConfig { acceptedAnswers: string[]; numericTolerance?: number; caseSensitive: boolean }
export interface SolutionStep { id: string; content: ContentBlock[] }
export interface MediaAsset { id: string; name: string; src: string; mimeType: string }
export interface QuizSection { id: string; title: string; instruction?: string; questionIds: string[] }
export interface QuestionGroup { id: string; title: string; instruction?: string; stimulus: ContentBlock[]; questionIds: string[]; kind?: string }
export interface QuizProfileRef { id: string; version: string; subject: string; grade: string; label: string; language: 'vi'|'en'|'mixed' }
export interface Question { id: string; number: number; type: QuestionType; title?: string; stem: ContentBlock[]; choices?: Choice[]; statements?: TrueFalseStatement[]; shortAnswer?: ShortAnswerConfig; solution?: SolutionStep[]; attachments: MediaAsset[]; confidence: Confidence; warnings: string[]; isAiGenerated?: boolean; sectionId?: string; groupId?: string; skill?: string; format?: string }
export interface ImportWarning { id: string; type: 'math'|'media'|'parser'|'security'; questionId?: string; message: string }
export interface PresentationSettings { theme: 'light'|'dark'; revealMode: 'all'|'step'; hideAnswersInitially: boolean; ratio: '16:9' }
export interface QuizDocument { id: string; title: string; sourceFileName: string; createdAt: string; questions: Question[]; warnings: ImportWarning[]; settings: PresentationSettings; profile?: QuizProfileRef; sections?: QuizSection[]; groups?: QuestionGroup[] }
export const uid = (prefix = 'id') => `${prefix}-${crypto.randomUUID?.() ?? Math.random().toString(36).slice(2)}`;
