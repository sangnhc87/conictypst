/// <reference types="vite/client" />
declare module 'file-saver';
declare module 'pandoc-wasm';
declare module 'mammoth/mammoth.browser' {
  export interface MammothMessage { message: string }
  export function convertToHtml(input: { arrayBuffer: ArrayBuffer }): Promise<{ value: string; messages: MammothMessage[] }>;
  const mammoth: { convertToHtml: typeof convertToHtml };
  export default mammoth;
}
