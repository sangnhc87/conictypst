const jsdom = require('jsdom');
const dom = new jsdom.JSDOM(`
<script type="module">
import { $typst } from "https://cdn.jsdelivr.net/npm/@myriaddreamin/typst.ts@0.5.0-rc6/dist/esm/contrib/all-in-one-lite.bundle.js";
window.TYPST_INSTANCE = $typst;
</script>
`, { runScripts: "dangerously", resources: "usable" });
setTimeout(() => {
  console.log(dom.window.TYPST_INSTANCE ? Object.keys(dom.window.TYPST_INSTANCE) : 'none');
}, 5000);
