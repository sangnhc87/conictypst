const fs = require('fs');
const { execSync } = require('child_process');
const path = require('path');

const dir = 'ref_dir';
const stylesPath = path.join(dir, 'word', 'styles.xml');
let styles = fs.readFileSync(stylesPath, 'utf-8');

// Replace fonts
styles = styles.replace(/w:asciiTheme="[^"]*"/g, 'w:ascii="Times New Roman"');
styles = styles.replace(/w:hAnsiTheme="[^"]*"/g, 'w:hAnsi="Times New Roman"');
styles = styles.replace(/w:eastAsiaTheme="[^"]*"/g, 'w:eastAsia="Times New Roman"');
styles = styles.replace(/w:cstheme="[^"]*"/g, 'w:cs="Times New Roman"');

styles = styles.replace(/w:ascii="Cambria"/g, 'w:ascii="Times New Roman"');
styles = styles.replace(/w:hAnsi="Cambria"/g, 'w:hAnsi="Times New Roman"');
styles = styles.replace(/w:cs="Cambria"/g, 'w:cs="Times New Roman"');

styles = styles.replace(/w:ascii="Calibri"/g, 'w:ascii="Times New Roman"');
styles = styles.replace(/w:hAnsi="Calibri"/g, 'w:hAnsi="Times New Roman"');

// Replace size to 12pt (24 half-points) for Normal style and others.
styles = styles.replace(/<w:sz w:val="22"\/>/g, '<w:sz w:val="24"/>');
styles = styles.replace(/<w:szCs w:val="22"\/>/g, '<w:szCs w:val="24"/>');

// Create a custom style for "CauHoi"
// We will inject it before the end of styles: </w:styles>
const cauHoiStyle = `
  <w:style w:type="paragraph" w:customStyle="1" w:styleId="CauHoi">
    <w:name w:val="CauHoi"/>
    <w:basedOn w:val="Normal"/>
    <w:qFormat/>
    <w:pPr>
      <w:spacing w:before="240" w:after="120"/>
    </w:pPr>
    <w:rPr>
      <w:b/>
      <w:color w:val="1A5276"/>
    </w:rPr>
  </w:style>
`;
styles = styles.replace('</w:styles>', cauHoiStyle + '</w:styles>');

fs.writeFileSync(stylesPath, styles);
execSync('cd ref_dir && zip -r ../template.docx *');
console.log("Template created.");
