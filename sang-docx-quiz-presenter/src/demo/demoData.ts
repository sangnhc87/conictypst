import type { QuizDocument, ContentBlock } from '../models/quiz';
const p = (id:string,text:string):ContentBlock => ({ id, kind:'paragraph', text });
const m = (id:string,latex:string,display=false):ContentBlock => ({ id, kind:'math', latex, display, status:'native-math' as const });
export const demoQuiz: QuizDocument = {
  id:'demo', title:'Đề thi thử THPT Quốc gia – Toán 2026', sourceFileName:'de-thi-thu-toan-2026.docx', createdAt:new Date().toISOString(), warnings:[{id:'w1',type:'math',questionId:'q4',message:'Một công thức MathType OLE cần thay thế thủ công.'}],
  settings:{theme:'light',revealMode:'step',hideAnswersInitially:true,ratio:'16:9'}, questions:[
    {
      id:'q1',number:1,type:'single-choice',
      stem:[p('p1','Cho cấp số cộng $(u_n)$ có $u_1 = 3$, công sai $d = 4$. Giá trị của $u_6$ bằng:')],
      choices:[
        {id:'c0',label:'A',content:[p('ca0','$19$')],isCorrect:false},
        {id:'c1',label:'B',content:[p('ca1','$23$')],isCorrect:true},
        {id:'c2',label:'C',content:[p('ca2','$27$')],isCorrect:false},
        {id:'c3',label:'D',content:[p('ca3','$15$')],isCorrect:false},
      ],
      solution:[{id:'s1',content:[p('sp1','Áp dụng công thức: '),m('sm1','u_n = u_1 + (n-1)d'),p('sp2','. Ta có: '),m('sm2','u_6 = 3 + 5 \\cdot 4 = 23')]}],
      attachments:[],confidence:'high',warnings:[]
    },
    {
      id:'q2',number:2,type:'true-false',
      stem:[p('p2','Xét hàm số '),m('m2a','f(x) = x^3 - 3x'),p('p2b','. Trong các mệnh đề sau, mệnh đề nào đúng, mệnh đề nào sai?')],
      statements:[
        {id:'t0',label:'a',content:[p('tp0','Hàm số đồng biến trên khoảng '),m('tm0','(1;+\\infty)')],correctValue:true},
        {id:'t1',label:'b',content:[p('tp1','Hàm số có hai điểm cực trị tại '),m('tm1','x = \\pm 1')],correctValue:true},
        {id:'t2',label:'c',content:[p('tp2','Giá trị cực đại của hàm số bằng '),m('tm2','2')],correctValue:true},
        {id:'t3',label:'d',content:[p('tp3','Đồ thị hàm số cắt trục hoành tại đúng một điểm')],correctValue:false},
      ],
      attachments:[],confidence:'high',warnings:[]
    },
    {
      id:'q3',number:3,type:'short-answer',
      stem:[p('p3','Tính giá trị biểu thức '),m('m3a','P = C_{10}^3 + C_{10}^4',true)],
      shortAnswer:{acceptedAnswers:['330','330,0'],numericTolerance:0,caseSensitive:false},
      solution:[{id:'ss1',content:[p('sp3a','Tính từng tổ hợp: '),m('sm3a','C_{10}^3 = \\dfrac{10!}{3!\\,7!} = 120'),p('sp3b',', '),m('sm3b','C_{10}^4 = \\dfrac{10!}{4!\\,6!} = 210'),p('sp3c','. Suy ra '),m('sm3c','P = 120 + 210 = 330')]}],
      attachments:[],confidence:'high',warnings:[]
    },
    {id:'q4',number:4,type:'essay',stem:[p('p4','Chứng minh định lý Pythagore.'),{id:'img1',kind:'image',name:'tam-giac.svg',alt:'Tam giác vuông ABC',width:54,align:'center',src:'data:image/svg+xml;charset=utf-8,'+encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 360 190"><rect width="360" height="190" fill="#f8fafc"/><path d="M55 155H310L55 30Z" fill="none" stroke="#167d8d" stroke-width="5"/><path d="M55 135h20v20" fill="none" stroke="#f59e0b" stroke-width="4"/><text x="37" y="27">A</text><text x="35" y="178">B</text><text x="315" y="174">C</text></svg>')},{id:'m4',kind:'math',latex:'a^2+b^2=c^2',display:true,status:'mathtype-preview'},{id:'mu',kind:'math',latex:'',display:true,status:'unsupported'}],solution:[1,2,3].map((n)=>({id:`s${n+1}`,content:[p(`sp${n+1}`,['Dựng các hình vuông trên ba cạnh.','So sánh diện tích bằng phép cắt ghép.','Suy ra a² + b² = c².'][n-1])]})),attachments:[],confidence:'medium',warnings:['Công thức MathType cuối câu chưa đọc được.']}
  ]
};
