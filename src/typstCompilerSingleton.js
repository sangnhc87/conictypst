import { compilerWasmUrl, rendererWasmUrl } from './typstBundle.js';

let _compilerPromise = null;
let _rendererPromise = null;

export async function getTypstCompiler() {
  if (_compilerPromise) return _compilerPromise;
  _compilerPromise = (async () => {
    const { createTypstCompiler, loadFonts, FetchPackageRegistry } = await import(
      '@myriaddreamin/typst.ts/dist/esm/main.mjs'
    );
    const { withPackageRegistry, withAccessModel } = await import(
      '@myriaddreamin/typst.ts/dist/esm/options.init.mjs'
    );
    const { MemoryAccessModel } = await import(
      '@myriaddreamin/typst.ts/dist/esm/fs/memory.mjs'
    );

    const accessModel = new MemoryAccessModel();
    const packageRegistry = new FetchPackageRegistry(accessModel);

    const compiler = createTypstCompiler();
    await compiler.init({
      getModule: () => compilerWasmUrl,
      beforeBuild: [
        withAccessModel(accessModel),
        withPackageRegistry(packageRegistry),
        loadFonts([], { assets: ['text'] }),
      ],
    });
    return compiler;
  })();
  return _compilerPromise;
}

export async function getTypstRenderer() {
  if (_rendererPromise) return _rendererPromise;
  _rendererPromise = (async () => {
    const { createTypstRenderer } = await import(
      '@myriaddreamin/typst.ts/dist/esm/main.mjs'
    );
    const renderer = createTypstRenderer();
    await renderer.init({
      getModule: () => rendererWasmUrl,
    });
    return renderer;
  })();
  return _rendererPromise;
}
