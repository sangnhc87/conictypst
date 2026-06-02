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

// Normalize all style sizes to 12pt (24 half-points)
styles = styles.replace(/<w:sz w:val="\d+"\/>/g, '<w:sz w:val="24"/>');
styles = styles.replace(/<w:szCs w:val="\d+"\/>/g, '<w:szCs w:val="24"/>');

// Set a stable default line spacing similar to the direct DOCX exporter in stexgv.
styles = styles.replace(
  /<w:pPrDefault>\s*<w:pPr>\s*<w:spacing w:after="200" \/>\s*<\/w:pPr>\s*<\/w:pPrDefault>/,
  '<w:pPrDefault><w:pPr><w:spacing w:after="200" w:line="300" w:lineRule="auto"/></w:pPr></w:pPrDefault>'
);

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
      <w:spacing w:before="0" w:after="80" w:line="300" w:lineRule="auto"/>
      <w:tabs>
        <w:tab w:val="left" w:pos="4536"/>
      </w:tabs>
    </w:pPr>
  </w:style>
  <w:style w:type="paragraph" w:customStyle="1" w:styleId="OptionsLayout1x4">
    <w:name w:val="OptionsLayout1x4"/>
    <w:basedOn w:val="Normal"/>
    <w:qFormat/>
    <w:pPr>
      <w:spacing w:before="0" w:after="80" w:line="300" w:lineRule="auto"/>
      <w:tabs>
        <w:tab w:val="left" w:pos="2268"/>
        <w:tab w:val="left" w:pos="4536"/>
        <w:tab w:val="left" w:pos="6804"/>
      </w:tabs>
    </w:pPr>
  </w:style>
  <w:style w:type="paragraph" w:customStyle="1" w:styleId="CauHoi">
    <w:name w:val="CauHoi"/>
    <w:basedOn w:val="Normal"/>
    <w:qFormat/>
    <w:pPr>
      <w:spacing w:before="200" w:after="60" w:line="300" w:lineRule="auto"/>
      <w:ind w:left="504" w:hanging="504"/>
    </w:pPr>
  </w:style>
  <w:style w:type="paragraph" w:customStyle="1" w:styleId="CenteredImage">
    <w:name w:val="CenteredImage"/>
    <w:basedOn w:val="Normal"/>
    <w:qFormat/>
    <w:pPr>
      <w:spacing w:before="40" w:after="80" w:line="300" w:lineRule="auto"/>
      <w:jc w:val="center"/>
    </w:pPr>
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
