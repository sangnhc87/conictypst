const fs = require('fs');
let html = fs.readFileSync('rebuild_html.txt', 'utf8');
html = html.split('\n').slice(0, -2).join('\n') + '\n'; // remove the last 'const TEMPLATES = {' line
const script0 = fs.readFileSync('temp_script_0.js', 'utf8');
const script1 = fs.readFileSync('temp_script_1.js', 'utf8');
const tail = '\n</script>\n</body>\n</html>\n';

fs.writeFileSync('index.html', html + script0 + script1 + tail);
console.log('rebuilt index.html');
