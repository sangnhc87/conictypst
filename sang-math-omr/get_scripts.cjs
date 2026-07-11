const fs = require('fs');
const html = fs.readFileSync('index.html', 'utf8');
const scripts = html.match(/<script>([\s\S]*?)<\/script>/g);
scripts.forEach((s, i) => {
  fs.writeFileSync(`temp_script_${i}.js`, s.replace(/<\/?script>/g, ''));
});
