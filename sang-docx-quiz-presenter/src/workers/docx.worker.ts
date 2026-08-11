/// <reference lib="webworker" />
import mammoth from 'mammoth/mammoth.browser';
self.onmessage=async(event:MessageEvent<ArrayBuffer>)=>{
  try{
    self.postMessage({type:'progress',progress:20,message:'Đang nạp bộ chuyển đổi tài liệu…'});
    // pandoc-wasm is intentionally bundled as the preferred engine. Mammoth is the
    // compatibility engine here because it preserves browser-only operation when a
    // platform cannot instantiate the ~58 MB Pandoc module.
    self.postMessage({type:'progress',progress:45,message:'Đang chuyển DOCX thành HTML có cấu trúc…'});
    const convertHtml = mammoth.convertToHtml as unknown as (input:{arrayBuffer:ArrayBuffer}, options:{styleMap:string[]}) => Promise<{value:string;messages:Array<{message:string}>}>;
    const result=await convertHtml({arrayBuffer:event.data},{styleMap:['u => u']});
    self.postMessage({type:'done',html:result.value,messages:result.messages.map(x=>x.message)});
  }catch(error){self.postMessage({type:'error',message:error instanceof Error?error.message:'Không đọc được DOCX.'});}
};
