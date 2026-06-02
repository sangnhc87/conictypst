import fs from 'fs';
import { execSync } from 'child_process';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const dir = path.join(__dirname, 'ref_dir');
const stylesPath = path.join(dir, 'word', 'styles.xml');
let styles = fs.readFileSync(stylesPath, 'utf-8');

// Replace fonts → Times New Roman
styles = styles.replace(/w:asciiTheme="[^"]*"/g, 'w:ascii="Times New Roman"');
styles = styles.replace(/w:hAnsiTheme="[^"]*"/g, 'w:hAnsi="Times New Roman"');
styles = styles.replace(/w:eastAsiaTheme="[^"]*"/g, 'w:eastAsia="Times New Roman"');
styles = styles.replace(/w:cstheme="[^"]*"/g, 'w:cs="Times New Roman"');
styles = styles.replace(/w:ascii="Cambria"/g, 'w:ascii="Times New Roman"');
styles = styles.replace(/w:hAnsi="Cambria"/g, 'w:hAnsi="Times New Roman"');
styles = styles.replace(/w:cs="Cambria"/g, 'w:cs="Times New Roman"');
styles = styles.replace(/w:ascii="Calibri"/g, 'w:ascii="Times New Roman"');
styles = styles.replace(/w:hAnsi="Calibri"/g, 'w:hAnsi="Times New Roman"');

// Font size: 12pt (24 half-points) for Normal style
styles = styles.replace(/<w:sz w:val="22"\/>/g, '<w:sz w:val="24"/>');
styles = styles.replace(/<w:szCs w:val="22"\/>/g, '<w:szCs w:val="24"/>');

// CauHoi & OptionsLayout styles are already defined in styles.xml — no duplicate injection.

fs.writeFileSync(stylesPath, styles);
execSync('cd ref_dir && zip -r ../scripts/template.docx *');
console.log('Template created → scripts/template.docx');
