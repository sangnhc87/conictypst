const CDN = 'https://cdn.jsdelivr.net/npm/@myriaddreamin';
const TYPST_VERSION = '0.7.0-rc2';
const COMPILER_WASM = `${CDN}/typst-ts-web-compiler@${TYPST_VERSION}/pkg/typst_ts_web_compiler_bg.wasm`;
const TYPST_TS_ESM = `${CDN}/typst.ts@${TYPST_VERSION}/dist/esm/main.mjs`;
const TYPST_INIT_ESM = `${CDN}/typst.ts@${TYPST_VERSION}/dist/esm/options.init.mjs`;
const TYPST_MEMORY_ESM = `${CDN}/typst.ts@${TYPST_VERSION}/dist/esm/fs/memory.mjs`;

import(TYPST_TS_ESM).then(async ({ createTypstCompiler, FetchPackageRegistry, loadFonts }) => {
    const { withAccessModel, withPackageRegistry } = await import(TYPST_INIT_ESM);
    const { MemoryAccessModel } = await import(TYPST_MEMORY_ESM);
    const accessModel = new MemoryAccessModel();
    const packageRegistry = new FetchPackageRegistry(accessModel);
    
    const compilerWrapper = await import(`${CDN}/typst-ts-web-compiler@${TYPST_VERSION}/pkg/typst_ts_web_compiler.mjs`);
    const compiler = createTypstCompiler();
    await compiler.init({
        getModule: () => COMPILER_WASM,
        getWrapper: () => compilerWrapper,
        beforeBuild: [
            withAccessModel(accessModel),
            withPackageRegistry(packageRegistry),
            loadFonts([], { assets: ['text'] })
        ]
    });
    
    compiler.addSource('/main.typ', '#set page("a4"); Hello World');
    const result = await compiler.compile({ mainFilePath: '/main.typ', format: 0 });
    console.log("Result:", result);
});
