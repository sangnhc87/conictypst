const fs = require('fs');
const { execSync } = require('child_process');
const path = require('path');

// Step 1: Create default reference.docx
try {
  execSync('pandoc --print-default-data-file reference.docx > ref.docx');
  execSync('rm -rf ref_dir && unzip ref.docx -d ref_dir');
} catch (e) {
  console.log("Failed to extract default reference.docx", e);
  process.exit(1);
}

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

// Replace size to 12pt (24 half-points)
styles = styles.replace(/<w:sz w:val="22"\/>/g, '<w:sz w:val="24"/>');
styles = styles.replace(/<w:szCs w:val="22"\/>/g, '<w:szCs w:val="24"/>');

// Beautiful Heading 2 (for Câu 1)
// We will replace Heading 2 style properties
// Actually, creating custom styles in Word requires updating numbering and link definitions.
// But we can create a simple custom paragraph style.
const optionsStyle = `
  <w:style w:type="paragraph" w:customStyle="1" w:styleId="OptionsLayout">
    <w:name w:val="OptionsLayout"/>
    <w:basedOn w:val="Normal"/>
    <w:qFormat/>
    <w:pPr>
      <w:tabs>
        <w:tab w:val="left" w:pos="2835"/> <!-- 5cm (approx) -->
        <w:tab w:val="left" w:pos="5670"/> <!-- 10cm (approx) -->
        <w:tab w:val="left" w:pos="8505"/> <!-- 15cm (approx) -->
      </w:tabs>
    </w:pPr>
  </w:style>
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
styles = styles.replace('</w:styles>', optionsStyle + '</w:styles>');

fs.writeFileSync(stylesPath, styles);

// Re-zip
try {
  if (!fs.existsSync('../scripts')) fs.mkdirSync('../scripts');
  execSync('cd ref_dir && zip -r ../scripts/template.docx *');
  console.log("Template created at scripts/template.docx.");
} catch (e) {
  console.log("Failed to zip template", e);
}
