import fs from 'fs';
import JSZip from 'jszip';

async function updateStyle() {
  const filePath = 'scripts/template.docx';
  const data = fs.readFileSync(filePath);
  const zip = await JSZip.loadAsync(data);
  let stylesXml = await zip.file('word/styles.xml').async('string');
  
  // Update OptionsLayout
  // We need to inject <w:ind w:left="400" w:hanging="283"/> inside <w:pPr> of OptionsLayout
  
  const optionsLayoutRegex = /(<w:style[^>]*w:styleId="OptionsLayout"[^>]*>.*?<w:pPr>)(.*?)(<\/w:pPr>)/s;
  if (optionsLayoutRegex.test(stylesXml)) {
    stylesXml = stylesXml.replace(optionsLayoutRegex, (match, start, inner, end) => {
      // Remove any existing w:ind
      inner = inner.replace(/<w:ind[^>]*\/>/g, '');
      return start + inner + '<w:ind w:left="400" w:hanging="283"/>' + end;
    });
    console.log("Updated OptionsLayout");
  } else {
    console.log("OptionsLayout not found or no pPr");
  }

  // Update OptionsLayout1x4
  const optionsLayout1x4Regex = /(<w:style[^>]*w:styleId="OptionsLayout1x4"[^>]*>.*?<w:pPr>)(.*?)(<\/w:pPr>)/s;
  if (optionsLayout1x4Regex.test(stylesXml)) {
    stylesXml = stylesXml.replace(optionsLayout1x4Regex, (match, start, inner, end) => {
      inner = inner.replace(/<w:ind[^>]*\/>/g, '');
      return start + inner + '<w:ind w:left="400" w:hanging="283"/>' + end;
    });
    console.log("Updated OptionsLayout1x4");
  }

  zip.file('word/styles.xml', stylesXml);
  
  const newZip = await zip.generateAsync({ type: 'nodebuffer', compression: 'DEFLATE' });
  fs.writeFileSync(filePath, newZip);
  fs.writeFileSync('typst-conic-hub/public/runtime/template.docx', newZip);
  console.log("Saved template.docx");
}
updateStyle();
