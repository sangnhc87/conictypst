import {
  __export,
  __publicField
} from "./chunk-UVKRO5ER.js";

// node_modules/@myriaddreamin/typst.ts/dist/esm/options.init.mjs
var options_init_exports = {};
__export(options_init_exports, {
  disableDefaultFontAssets: () => disableDefaultFontAssets,
  preloadFontAssets: () => preloadFontAssets,
  preloadRemoteFonts: () => preloadRemoteFonts,
  preloadSystemFonts: () => preloadSystemFonts,
  withAccessModel: () => withAccessModel,
  withPackageRegistry: () => withPackageRegistry
});
var BeforeBuildSymbol = Symbol("beforeBuild");
var _textFonts = [
  "LinLibertine_R.ttf",
  "LinLibertine_RB.ttf",
  "LinLibertine_RBI.ttf",
  "LinLibertine_RI.ttf",
  "NewCMMath-Book.otf",
  "NewCMMath-Regular.otf",
  "NewCM10-Regular.otf",
  "NewCM10-Bold.otf",
  "NewCM10-Italic.otf",
  "NewCM10-BoldItalic.otf",
  "DejaVuSansMono.ttf",
  "DejaVuSansMono-Bold.ttf",
  "DejaVuSansMono-Oblique.ttf",
  "DejaVuSansMono-BoldOblique.ttf"
];
var _cjkFonts = [
  "InriaSerif-Bold.ttf",
  "InriaSerif-BoldItalic.ttf",
  "InriaSerif-Italic.ttf",
  "InriaSerif-Regular.ttf",
  "Roboto-Regular.ttf",
  "NotoSerifCJKsc-Regular.otf"
];
var _emojiFonts = ["TwitterColorEmoji.ttf", "NotoColorEmoji.ttf"];
function disableDefaultFontAssets() {
  return preloadRemoteFonts([], { assets: false });
}
function preloadFontAssets(options) {
  return preloadRemoteFonts([], options);
}
function preloadRemoteFonts(userFonts, options) {
  var _a4, _b;
  const fonts = [...userFonts];
  if (options && (options == null ? void 0 : options.assets) !== false && ((_a4 = options == null ? void 0 : options.assets) == null ? void 0 : _a4.length) && ((_b = options == null ? void 0 : options.assets) == null ? void 0 : _b.length) > 0) {
    let assetUrlPrefix = options.assetUrlPrefix ?? "https://raw.githubusercontent.com/Myriad-Dreamin/typst/assets-fonts";
    if (assetUrlPrefix[assetUrlPrefix.length - 1] !== "/") {
      assetUrlPrefix += "/";
    }
    const prefix = (f) => f.map((font) => assetUrlPrefix + font);
    for (const asset of options.assets) {
      switch (asset) {
        case "text":
          fonts.push(...prefix(_textFonts));
          break;
        case "cjk":
          fonts.push(...prefix(_cjkFonts));
          break;
        case "emoji":
          fonts.push(...prefix(_emojiFonts));
          break;
      }
    }
  }
  const loader = async (_, { ref, builder }) => {
    if (options == null ? void 0 : options.fetcher) {
      ref.setFetcher(options.fetcher);
    }
    await ref.loadFonts(builder, fonts);
  };
  loader._preloadRemoteFontOptions = options;
  return loader;
}
function preloadSystemFonts({ byFamily }) {
  return async (_, { builder }) => {
    const t = performance.now();
    if ("queryLocalFonts" in window) {
      const fonts = await window.queryLocalFonts();
      byFamily = byFamily ?? [];
      for (const font of fonts) {
        if (!byFamily.includes(font.family)) {
          continue;
        }
        const data = await (await font.blob()).arrayBuffer();
        await builder.add_raw_font(new Uint8Array(data));
      }
    }
    const t2 = performance.now();
    console.log("preload system font time used:", t2 - t);
  };
}
function withPackageRegistry(packageRegistry) {
  return async (_, { builder }) => {
    return new Promise((resolve) => {
      builder.set_package_registry(packageRegistry, function(spec) {
        return packageRegistry.resolve(spec, this);
      });
      resolve();
    });
  };
}
function withAccessModel(accessModel) {
  return async (_, ctx) => {
    var _a4;
    if (ctx.alreadySetAccessModel) {
      throw new Error(`already set some assess model before: ${(_a4 = ctx.alreadySetAccessModel.constructor) == null ? void 0 : _a4.name}(${ctx.alreadySetAccessModel})`);
    }
    ctx.alreadySetAccessModel = accessModel;
    return new Promise((resolve) => {
      ctx.builder.set_access_model(accessModel, (path) => {
        const lastModified = accessModel.getMTime(path);
        if (lastModified) {
          return lastModified.getTime();
        }
        return 0;
      }, (path) => {
        return accessModel.isFile(path) || false;
      }, (path) => {
        return accessModel.getRealPath(path) || path;
      }, (path) => {
        return accessModel.readAll(path);
      });
      resolve();
    });
  };
}

// node_modules/@myriaddreamin/typst.ts/dist/esm/internal.types.mjs
var kObject = Symbol.for("reflexo-obj");
var TypstDefaultParams;
(function(TypstDefaultParams2) {
  TypstDefaultParams2[TypstDefaultParams2["PIXEL_PER_PT"] = 3] = "PIXEL_PER_PT";
})(TypstDefaultParams = TypstDefaultParams || (TypstDefaultParams = {}));

// node_modules/@myriaddreamin/typst.ts/dist/esm/render/canvas/view.mjs
var RenderView = class {
  constructor(pageInfos, container, options) {
    __publicField(this, "pageInfos");
    __publicField(this, "loadPageCount");
    __publicField(this, "imageScaleFactor");
    __publicField(this, "container");
    __publicField(this, "canvasList");
    __publicField(this, "textLayerList");
    __publicField(this, "commonList");
    __publicField(this, "textLayerParentList");
    __publicField(this, "semanticLayerList");
    this.pageInfos = pageInfos;
    this.imageScaleFactor = options.pixelPerPt ?? TypstDefaultParams.PIXEL_PER_PT;
    container.innerHTML = "";
    container.style.width = "100%";
    this.container = container;
    this.canvasList = new Array(this.loadPageCount);
    this.textLayerList = new Array(this.loadPageCount);
    this.commonList = new Array(this.loadPageCount);
    this.textLayerParentList = new Array(this.loadPageCount);
    this.semanticLayerList = new Array(this.loadPageCount);
    const createOver = (i, pageAst, commonDiv) => {
      const width = Math.ceil(pageAst.width) * this.imageScaleFactor;
      const height = Math.ceil(pageAst.height) * this.imageScaleFactor;
      const canvas = this.canvasList[i] = document.createElement("canvas");
      const semanticLayer = this.semanticLayerList[i] = document.createElement("div");
      const textLayer = this.textLayerList[i] = document.createElement("div");
      const textLayerParent = this.textLayerParentList[i] = document.createElement("div");
      const ctx = canvas.getContext("2d");
      if (ctx) {
        const canvasDiv = document.createElement("div");
        canvas.width = width;
        canvas.height = height;
        canvasDiv.appendChild(canvas);
        commonDiv.appendChild(canvasDiv);
        canvasDiv.style.position = "absolute";
      }
      {
        textLayerParent.appendChild(textLayer);
        textLayerParent.className = "typst-html-semantics";
        const containerWidth = container.offsetWidth;
        const originalScale = containerWidth / pageAst.width;
        textLayerParent.style.width = `${containerWidth}px`;
        textLayerParent.style.height = `${pageAst.height * originalScale}px`;
        textLayerParent.style.setProperty("--data-text-width", `${originalScale}px`);
        textLayerParent.style.setProperty("--data-text-height", `${originalScale}px`);
        commonDiv.classList.add("typst-page");
        commonDiv.classList.add("canvas");
        commonDiv.style.width = `${containerWidth}px`;
        commonDiv.style.height = `${height * originalScale}px`;
        commonDiv.style.position = "relative";
        semanticLayer.appendChild(textLayerParent);
        commonDiv.appendChild(semanticLayer);
      }
    };
    for (let i = 0; i < this.pageInfos.length; i++) {
      const pageAst = this.pageInfos[i];
      let commonDiv = void 0;
      commonDiv = this.commonList[i] = document.createElement("div");
      container.appendChild(commonDiv);
      createOver(i, pageAst, commonDiv);
    }
  }
  resetLayout() {
    for (let i = 0; i < this.pageInfos.length; i++) {
      const pageAst = this.pageInfos[i];
      const width = Math.ceil(pageAst.width) * this.imageScaleFactor;
      const height = Math.ceil(pageAst.height) * this.imageScaleFactor;
      const canvasDiv = this.canvasList[i].parentElement;
      if (!canvasDiv) {
        throw new Error(`canvasDiv is null for page ${i}, canvas list length ${this.canvasList.length}`);
      }
      const commonDiv = this.commonList[i];
      const textLayerParent = this.textLayerParentList[i];
      const containerWidth = this.container.offsetWidth;
      const originalScale = containerWidth / width;
      textLayerParent.style.width = `${containerWidth}px`;
      textLayerParent.style.height = `${height * originalScale}px`;
      commonDiv.style.width = `${containerWidth}px`;
      commonDiv.style.height = `${height * originalScale}px`;
      const currentScale = this.container.offsetWidth / width;
      canvasDiv.style.transformOrigin = "0px 0px";
      canvasDiv.style.transform = `scale(${currentScale})`;
    }
  }
};

// node_modules/@myriaddreamin/typst.ts/dist/esm/wasm.mjs
var once = (fn) => {
  let called = false;
  let res;
  return () => {
    if (called) {
      return res;
    }
    called = true;
    return res = fn();
  };
};
var LazyWasmModule = class {
  constructor(initFn) {
    __publicField(this, "wasmBin");
    __publicField(this, "initOnce");
    if (typeof initFn !== "function") {
      throw new Error("initFn is not a function");
    }
    this.initOnce = once(async () => {
      await initFn(this.wasmBin);
    });
  }
  async init(module) {
    this.wasmBin = module;
    await this.initOnce();
  }
};

// node_modules/idb/build/wrap-idb-value.js
var instanceOfAny = (object, constructors) => constructors.some((c) => object instanceof c);
var idbProxyableTypes;
var cursorAdvanceMethods;
function getIdbProxyableTypes() {
  return idbProxyableTypes || (idbProxyableTypes = [
    IDBDatabase,
    IDBObjectStore,
    IDBIndex,
    IDBCursor,
    IDBTransaction
  ]);
}
function getCursorAdvanceMethods() {
  return cursorAdvanceMethods || (cursorAdvanceMethods = [
    IDBCursor.prototype.advance,
    IDBCursor.prototype.continue,
    IDBCursor.prototype.continuePrimaryKey
  ]);
}
var cursorRequestMap = /* @__PURE__ */ new WeakMap();
var transactionDoneMap = /* @__PURE__ */ new WeakMap();
var transactionStoreNamesMap = /* @__PURE__ */ new WeakMap();
var transformCache = /* @__PURE__ */ new WeakMap();
var reverseTransformCache = /* @__PURE__ */ new WeakMap();
function promisifyRequest(request) {
  const promise = new Promise((resolve, reject) => {
    const unlisten = () => {
      request.removeEventListener("success", success);
      request.removeEventListener("error", error);
    };
    const success = () => {
      resolve(wrap(request.result));
      unlisten();
    };
    const error = () => {
      reject(request.error);
      unlisten();
    };
    request.addEventListener("success", success);
    request.addEventListener("error", error);
  });
  promise.then((value) => {
    if (value instanceof IDBCursor) {
      cursorRequestMap.set(value, request);
    }
  }).catch(() => {
  });
  reverseTransformCache.set(promise, request);
  return promise;
}
function cacheDonePromiseForTransaction(tx) {
  if (transactionDoneMap.has(tx))
    return;
  const done = new Promise((resolve, reject) => {
    const unlisten = () => {
      tx.removeEventListener("complete", complete);
      tx.removeEventListener("error", error);
      tx.removeEventListener("abort", error);
    };
    const complete = () => {
      resolve();
      unlisten();
    };
    const error = () => {
      reject(tx.error || new DOMException("AbortError", "AbortError"));
      unlisten();
    };
    tx.addEventListener("complete", complete);
    tx.addEventListener("error", error);
    tx.addEventListener("abort", error);
  });
  transactionDoneMap.set(tx, done);
}
var idbProxyTraps = {
  get(target, prop, receiver) {
    if (target instanceof IDBTransaction) {
      if (prop === "done")
        return transactionDoneMap.get(target);
      if (prop === "objectStoreNames") {
        return target.objectStoreNames || transactionStoreNamesMap.get(target);
      }
      if (prop === "store") {
        return receiver.objectStoreNames[1] ? void 0 : receiver.objectStore(receiver.objectStoreNames[0]);
      }
    }
    return wrap(target[prop]);
  },
  set(target, prop, value) {
    target[prop] = value;
    return true;
  },
  has(target, prop) {
    if (target instanceof IDBTransaction && (prop === "done" || prop === "store")) {
      return true;
    }
    return prop in target;
  }
};
function replaceTraps(callback) {
  idbProxyTraps = callback(idbProxyTraps);
}
function wrapFunction(func) {
  if (func === IDBDatabase.prototype.transaction && !("objectStoreNames" in IDBTransaction.prototype)) {
    return function(storeNames, ...args) {
      const tx = func.call(unwrap(this), storeNames, ...args);
      transactionStoreNamesMap.set(tx, storeNames.sort ? storeNames.sort() : [storeNames]);
      return wrap(tx);
    };
  }
  if (getCursorAdvanceMethods().includes(func)) {
    return function(...args) {
      func.apply(unwrap(this), args);
      return wrap(cursorRequestMap.get(this));
    };
  }
  return function(...args) {
    return wrap(func.apply(unwrap(this), args));
  };
}
function transformCachableValue(value) {
  if (typeof value === "function")
    return wrapFunction(value);
  if (value instanceof IDBTransaction)
    cacheDonePromiseForTransaction(value);
  if (instanceOfAny(value, getIdbProxyableTypes()))
    return new Proxy(value, idbProxyTraps);
  return value;
}
function wrap(value) {
  if (value instanceof IDBRequest)
    return promisifyRequest(value);
  if (transformCache.has(value))
    return transformCache.get(value);
  const newValue = transformCachableValue(value);
  if (newValue !== value) {
    transformCache.set(value, newValue);
    reverseTransformCache.set(newValue, value);
  }
  return newValue;
}
var unwrap = (value) => reverseTransformCache.get(value);

// node_modules/idb/build/index.js
var readMethods = ["get", "getKey", "getAll", "getAllKeys", "count"];
var writeMethods = ["put", "add", "delete", "clear"];
var cachedMethods = /* @__PURE__ */ new Map();
function getMethod(target, prop) {
  if (!(target instanceof IDBDatabase && !(prop in target) && typeof prop === "string")) {
    return;
  }
  if (cachedMethods.get(prop))
    return cachedMethods.get(prop);
  const targetFuncName = prop.replace(/FromIndex$/, "");
  const useIndex = prop !== targetFuncName;
  const isWrite = writeMethods.includes(targetFuncName);
  if (
    // Bail if the target doesn't exist on the target. Eg, getAll isn't in Edge.
    !(targetFuncName in (useIndex ? IDBIndex : IDBObjectStore).prototype) || !(isWrite || readMethods.includes(targetFuncName))
  ) {
    return;
  }
  const method = async function(storeName, ...args) {
    const tx = this.transaction(storeName, isWrite ? "readwrite" : "readonly");
    let target2 = tx.store;
    if (useIndex)
      target2 = target2.index(args.shift());
    return (await Promise.all([
      target2[targetFuncName](...args),
      isWrite && tx.done
    ]))[0];
  };
  cachedMethods.set(prop, method);
  return method;
}
replaceTraps((oldTraps) => ({
  ...oldTraps,
  get: (target, prop, receiver) => getMethod(target, prop) || oldTraps.get(target, prop, receiver),
  has: (target, prop) => !!getMethod(target, prop) || oldTraps.has(target, prop)
}));

// node_modules/@myriaddreamin/typst.ts/dist/esm/init.mjs
var ComponentBuilder = class {
  constructor() {
    __publicField(this, "loadedFonts", /* @__PURE__ */ new Set());
    __publicField(this, "fetcher", fetch);
  }
  setFetcher(fetcher) {
    this.fetcher = fetcher;
  }
  async loadFonts(builder, fonts) {
    const escapeImport = new Function("m", "return import(m)");
    const fetcher = this.fetcher || (this.fetcher = await async function() {
      const { fetchBuilder, FileSystemCache } = await escapeImport("node-fetch-cache");
      const cache = new FileSystemCache({
        /// By default, we don't have a complicated cache policy.
        cacheDirectory: ".cache/typst/fonts"
      });
      const cachedFetcher = fetchBuilder.withCache(cache);
      return function(input, init) {
        const timeout = setTimeout(() => {
          console.warn("font fetching is stucking:", input);
        }, 15e3);
        return cachedFetcher(input, init).finally(() => {
          clearTimeout(timeout);
        });
      };
    }());
    const fontsToLoad = fonts.filter((font) => {
      if (font instanceof Uint8Array) {
        return true;
      }
      if (this.loadedFonts.has(font)) {
        return false;
      }
      this.loadedFonts.add(font);
      return true;
    });
    const fontLists = await Promise.all(fontsToLoad.map(async (font) => {
      if (font instanceof Uint8Array) {
        await builder.add_raw_font(font);
        return;
      }
      return new Uint8Array(await (await fetcher(font)).arrayBuffer());
    }));
    for (const font of fontLists) {
      if (!font) {
        continue;
      }
      await builder.add_raw_font(font);
    }
  }
  async build(options, builder, hooks) {
    const buildCtx = { ref: this, builder, hooks };
    for (const fn of (options == null ? void 0 : options.beforeBuild) ?? []) {
      await fn(void 0, buildCtx);
    }
    if (hooks.latelyBuild) {
      hooks.latelyBuild(buildCtx);
    }
    const component = await builder.build();
    return component;
  }
};
async function buildComponent(options, gModule, Builder, hooks) {
  var _a4;
  await gModule.init((_a4 = options == null ? void 0 : options.getModule) == null ? void 0 : _a4.call(options));
  return await new ComponentBuilder().build(options, new Builder(), hooks);
}

// node_modules/@myriaddreamin/typst.ts/dist/esm/contrib/dom/typst-doc.mjs
var PreviewMode;
(function(PreviewMode2) {
  PreviewMode2[PreviewMode2["Doc"] = 0] = "Doc";
  PreviewMode2[PreviewMode2["Slide"] = 1] = "Slide";
})(PreviewMode = PreviewMode || (PreviewMode = {}));
var TypstDocumentContext = class _TypstDocumentContext {
  constructor(opts) {
    __publicField(this, "hookedElem");
    __publicField(this, "kModule");
    __publicField(this, "opts");
    __publicField(this, "modes", []);
    /// Configuration fields
    /// enable partial rendering
    __publicField(this, "partialRendering", true);
    /// underlying renderer
    __publicField(this, "renderMode", "svg");
    __publicField(this, "r");
    /// preview mode
    __publicField(this, "previewMode", PreviewMode.Doc);
    /// whether this is a content preview
    __publicField(this, "isContentPreview", false);
    /// whether this content preview will mix outline titles
    __publicField(this, "isMixinOutline", false);
    /// background color
    __publicField(this, "backgroundColor", "black");
    /// default page color (empty string means transparent)
    __publicField(this, "pageColor", "white");
    /// pixel per pt
    __publicField(this, "pixelPerPt", 3);
    /// customized way to retrieving dom state
    __publicField(this, "retrieveDOMState");
    /// State fields
    /// whether svg is updating (in triggerSvgUpdate)
    __publicField(this, "isRendering", false);
    /// whether kModule is initialized
    __publicField(this, "moduleInitialized", false);
    /// patch queue for updating data.
    __publicField(this, "patchQueue", []);
    /// resources to dispose
    __publicField(this, "disposeList", []);
    /// canvas render ctoken
    __publicField(this, "canvasRenderCToken");
    /// There are two scales in this class: The real scale is to adjust the size
    /// of `hookedElem` to fit the svg. The virtual scale (scale ratio) is to let
    /// user zoom in/out the svg. For example:
    /// + the default value of virtual scale is 1, which means the svg is totally
    ///   fit in `hookedElem`.
    /// + if user set virtual scale to 0.5, then the svg will be zoomed out to fit
    ///   in half width of `hookedElem`. "real" current scale of `hookedElem`
    __publicField(this, "currentRealScale", 1);
    /// "virtual" current scale of `hookedElem`
    __publicField(this, "currentScaleRatio", 1);
    /// timeout for delayed viewport change
    __publicField(this, "vpTimeout");
    /// sampled by last render time.
    __publicField(this, "sampledRenderTime", 0);
    /// page to partial render
    __publicField(this, "partialRenderPage", 0);
    /// outline data
    __publicField(this, "outline");
    /// cursor position in form of [page, x, y]
    __publicField(this, "cursorPosition");
    // id: number = rnd++;
    /// Cache fields
    /// cached state of container, default to retrieve state from `this.hookedElem`
    __publicField(this, "cachedDOMState", {
      width: 0,
      height: 0,
      window: {
        innerWidth: 0,
        innerHeight: 0
      },
      boundingRect: {
        left: 0,
        top: 0,
        right: 0
      }
    });
    var _a4, _b;
    this.hookedElem = opts.hookedElem;
    this.kModule = opts.kModule;
    this.opts = opts || {};
    {
      const { renderMode, previewMode, isContentPreview, retrieveDOMState } = opts || {};
      this.partialRendering = false;
      this.renderMode = renderMode ?? this.renderMode;
      this.previewMode = previewMode ?? this.previewMode;
      this.isContentPreview = isContentPreview || false;
      this.retrieveDOMState = retrieveDOMState ?? (() => {
        return {
          width: this.hookedElem.offsetWidth,
          height: this.hookedElem.offsetHeight,
          window: {
            innerWidth: window.innerWidth,
            innerHeight: window.innerHeight
          },
          boundingRect: this.hookedElem.getBoundingClientRect()
        };
      });
      this.backgroundColor = getComputedStyle(document.documentElement).getPropertyValue("--typst-preview-background-color");
    }
    this.hookedElem.classList.add("hide-scrollbar-x");
    (_a4 = this.hookedElem.parentElement) == null ? void 0 : _a4.classList.add("hide-scrollbar-x");
    if (this.previewMode === PreviewMode.Slide) {
      this.hookedElem.classList.add("hide-scrollbar-y");
      (_b = this.hookedElem.parentElement) == null ? void 0 : _b.classList.add("hide-scrollbar-y");
    }
    this.installCtrlWheelHandler();
  }
  reset() {
    this.kModule.reset();
    this.moduleInitialized = false;
  }
  dispose() {
    const disposeList = this.disposeList;
    this.disposeList = [];
    disposeList.forEach((x) => x());
  }
  static derive(ctx, mode) {
    return ["rescale", "rerender", "postRender"].reduce((acc, x) => {
      acc[x] = ctx[`${x}$${mode}`].bind(ctx);
      console.assert(acc[x] !== void 0, `${x}$${mode} is undefined`);
      return acc;
    }, {});
  }
  registerMode(mode) {
    const facade = _TypstDocumentContext.derive(this, mode);
    this.modes.push([mode, facade]);
    if (mode === this.renderMode) {
      this.r = facade;
    }
  }
  installCtrlWheelHandler() {
    const factors = [
      0.1,
      0.2,
      0.3,
      0.4,
      0.5,
      0.6,
      0.7,
      0.8,
      0.9,
      1,
      1.1,
      1.3,
      1.5,
      1.7,
      1.9,
      2.1,
      2.4,
      2.7,
      3,
      3.3,
      3.7,
      4.1,
      4.6,
      5.1,
      5.7,
      6.3,
      7,
      7.7,
      8.5,
      9.4,
      10
    ];
    const wheelEventHandler = (event) => {
      var _a4, _b, _c, _d;
      if (event.ctrlKey) {
        event.preventDefault();
        this.cachedDOMState = this.retrieveDOMState();
        if (window.onresize !== null) {
          window.onresize = null;
        }
        const prevScaleRatio = this.currentScaleRatio;
        if (event.deltaY < 0) {
          if (this.currentScaleRatio >= factors.at(-1)) {
            return;
          } else {
            this.currentScaleRatio = factors.filter((x) => x > this.currentScaleRatio).at(0);
          }
        } else if (event.deltaY > 0) {
          if (this.currentScaleRatio <= factors.at(0)) {
            return;
          } else {
            this.currentScaleRatio = factors.filter((x) => x < this.currentScaleRatio).at(-1);
          }
        } else {
          return;
        }
        const scrollFactor = this.currentScaleRatio / prevScaleRatio;
        const scrollX = event.pageX * (scrollFactor - 1);
        const scrollY = event.pageY * (scrollFactor - 1);
        if (Math.abs(this.currentScaleRatio - 1) < 1e-5) {
          this.hookedElem.classList.add("hide-scrollbar-x");
          (_a4 = this.hookedElem.parentElement) == null ? void 0 : _a4.classList.add("hide-scrollbar-x");
          if (this.previewMode === PreviewMode.Slide) {
            this.hookedElem.classList.add("hide-scrollbar-y");
            (_b = this.hookedElem.parentElement) == null ? void 0 : _b.classList.add("hide-scrollbar-y");
          }
        } else {
          this.hookedElem.classList.remove("hide-scrollbar-x");
          (_c = this.hookedElem.parentElement) == null ? void 0 : _c.classList.remove("hide-scrollbar-x");
          if (this.previewMode === PreviewMode.Slide) {
            this.hookedElem.classList.remove("hide-scrollbar-y");
            (_d = this.hookedElem.parentElement) == null ? void 0 : _d.classList.remove("hide-scrollbar-y");
          }
        }
        const svg = this.hookedElem.firstElementChild;
        if (svg) {
          const scaleRatio = this.getSvgScaleRatio();
          const dataHeight = Number.parseFloat(svg.getAttribute("data-height"));
          const scaledHeight = Math.ceil(dataHeight * scaleRatio);
          this.hookedElem.style.height = `${scaledHeight * 2}px`;
        }
        window.scrollBy(scrollX, scrollY);
        this.addViewportChange();
        return false;
      }
    };
    if (this.renderMode !== "dom") {
      const vscodeAPI = typeof acquireVsCodeApi !== "undefined";
      if (vscodeAPI) {
        window.addEventListener("wheel", wheelEventHandler, {
          passive: false
        });
        this.disposeList.push(() => {
          window.removeEventListener("wheel", wheelEventHandler);
        });
      } else {
        document.body.addEventListener("wheel", wheelEventHandler, {
          passive: false
        });
        this.disposeList.push(() => {
          document.body.removeEventListener("wheel", wheelEventHandler);
        });
      }
    }
  }
  /// Get current scale from html to svg
  // Note: one should retrieve dom state before rescale
  getSvgScaleRatio() {
    const svg = this.hookedElem.firstElementChild;
    if (!svg) {
      return 0;
    }
    const container = this.cachedDOMState;
    const svgWidth = Number.parseFloat(svg.getAttribute("data-width") || svg.getAttribute("width") || "1");
    const svgHeight = Number.parseFloat(svg.getAttribute("data-height") || svg.getAttribute("height") || "1");
    this.currentRealScale = this.previewMode === PreviewMode.Slide ? Math.min(container.width / svgWidth, container.height / svgHeight) : container.width / svgWidth;
    return this.currentRealScale * this.currentScaleRatio;
  }
  processQueue(svgUpdateEvent) {
    const eventName = svgUpdateEvent[0];
    switch (eventName) {
      case "new":
      case "diff-v1": {
        if (eventName === "new") {
          this.reset();
        }
        this.kModule.manipulateData({
          action: "merge",
          data: svgUpdateEvent[1]
        });
        this.moduleInitialized = true;
        return true;
      }
      case "viewport-change": {
        if (!this.moduleInitialized) {
          console.log("viewport-change before initialization");
          return false;
        }
        return true;
      }
      default:
        console.log("svgUpdateEvent", svgUpdateEvent);
        return false;
    }
  }
  triggerUpdate() {
    if (this.isRendering) {
      return;
    }
    this.isRendering = true;
    const doUpdate = async () => {
      this.cachedDOMState = this.retrieveDOMState();
      if (this.patchQueue.length === 0) {
        this.isRendering = false;
        this.postprocessChanges();
        return;
      }
      try {
        let t0 = performance.now();
        const ctoken = this.canvasRenderCToken;
        if (ctoken) {
          await ctoken.cancel();
          await ctoken.wait();
          this.canvasRenderCToken = void 0;
          console.log("cancel canvas rendering");
        }
        let needRerender = false;
        while (this.patchQueue.length > 0) {
          needRerender = this.processQueue(this.patchQueue.shift()) || needRerender;
        }
        let t1 = performance.now();
        if (needRerender) {
          this.r.rescale();
          await this.r.rerender();
          this.r.rescale();
        }
        let t2 = performance.now();
        const d = (e, x, y) => `${e} ${(y - x).toFixed(2)} ms`;
        this.sampledRenderTime = t2 - t0;
        console.log([d("parse", t0, t1), d("rerender", t1, t2), d("total", t0, t2)].join(", "));
        requestAnimationFrame(doUpdate);
      } catch (e) {
        console.error(e);
        this.isRendering = false;
        this.postprocessChanges();
      }
    };
    requestAnimationFrame(doUpdate);
  }
  postprocessChanges() {
    this.r.postRender();
    if (this.previewMode === PreviewMode.Slide) {
      document.querySelectorAll(".typst-page-number-indicator").forEach((x) => {
        x.textContent = `${this.kModule.retrievePagesInfo().length}`;
      });
    }
  }
  addChangement(change) {
    if (change[0] === "new") {
      this.patchQueue.splice(0, this.patchQueue.length);
    }
    const pushChange = () => {
      this.vpTimeout = void 0;
      this.patchQueue.push(change);
      this.triggerUpdate();
    };
    if (this.vpTimeout !== void 0) {
      clearTimeout(this.vpTimeout);
    }
    if (change[0] === "viewport-change" && this.isRendering) {
      this.vpTimeout = setTimeout(pushChange, this.sampledRenderTime || 100);
    } else {
      pushChange();
    }
  }
  addViewportChange() {
    this.addChangement(["viewport-change", ""]);
  }
};
function provideDoc(Base) {
  return class TypstDocument {
    constructor(options) {
      __publicField(this, "impl");
      __publicField(this, "kModule");
      if (options.isContentPreview) {
        options.renderMode = "canvas";
      }
      this.kModule = options.kModule;
      this.impl = new Base(options);
      if (!this.impl.r) {
        throw new Error(`mode is not supported, ${options == null ? void 0 : options.renderMode}`);
      }
      if (options.isContentPreview) {
        this.impl.partialRendering = true;
        this.impl.pixelPerPt = 1;
        this.impl.isMixinOutline = true;
      }
    }
    dispose() {
      this.impl.dispose();
    }
    reset() {
      this.impl.reset();
    }
    addChangement(change) {
      this.impl.addChangement(change);
    }
    addViewportChange() {
      this.impl.addViewportChange();
    }
    setPageColor(color) {
      this.impl.pageColor = color;
      this.addViewportChange();
    }
    setPartialRendering(partialRendering) {
      this.impl.partialRendering = partialRendering;
    }
    setCursor(page, x, y) {
      this.impl.cursorPosition = [page, x, y];
    }
    setPartialPageNumber(page) {
      if (page <= 0 || page > this.kModule.retrievePagesInfo().length) {
        return false;
      }
      this.impl.partialRenderPage = page - 1;
      this.addViewportChange();
      return true;
    }
    getPartialPageNumber() {
      return this.impl.partialRenderPage + 1;
    }
    setOutineData(outline) {
      this.impl.outline = outline;
      this.addViewportChange();
    }
  };
}
function composeDoc(Base, ...mixins) {
  return mixins.reduce((acc, mixin) => mixin(acc), Base);
}

// node_modules/@myriaddreamin/typst.ts/dist/esm/contrib/dom/typst-cancel.mjs
var TypstCancellationToken = class {
  constructor() {
    __publicField(this, "isCancellationRequested", false);
    __publicField(this, "_onCancelled");
    __publicField(this, "_onCancelledResolveResolved");
    let resolveT = void 0;
    let resolveX = void 0;
    this._onCancelled = new Promise((resolve) => {
      resolveT = resolve;
      if (resolveX) {
        resolveX(resolve);
      }
    });
    this._onCancelledResolveResolved = new Promise((resolve) => {
      resolveX = resolve;
      if (resolveT) {
        resolve(resolveT);
      }
    });
  }
  async cancel() {
    await this._onCancelledResolveResolved;
    this.isCancellationRequested = true;
  }
  isCancelRequested() {
    return this.isCancellationRequested;
  }
  async consume() {
    (await this._onCancelledResolveResolved)();
  }
  wait() {
    return this._onCancelled;
  }
};

// node_modules/@myriaddreamin/typst.ts/dist/esm/dom.mjs
var animationFrame = () => new Promise((resolve) => requestAnimationFrame(resolve));
var TrackMode;
(function(TrackMode2) {
  TrackMode2[TrackMode2["Doc"] = 0] = "Doc";
  TrackMode2[TrackMode2["Pages"] = 1] = "Pages";
})(TrackMode || (TrackMode = {}));
var RepaintStage;
(function(RepaintStage2) {
  RepaintStage2[RepaintStage2["Layout"] = 0] = "Layout";
  RepaintStage2[RepaintStage2["Svg"] = 1] = "Svg";
  RepaintStage2[RepaintStage2["Semantics"] = 2] = "Semantics";
  RepaintStage2[RepaintStage2["PrepareCanvas"] = 3] = "PrepareCanvas";
  RepaintStage2[RepaintStage2["Canvas"] = 4] = "Canvas";
})(RepaintStage || (RepaintStage = {}));
function provideDomDoc(Base) {
  return class DomDocument extends Base {
    constructor(...args) {
      super(...args);
      /// The template element for creating DOM by string.
      __publicField(this, "tmpl", document.createElement("template"));
      /// The stub element for replacing an invisible element.
      __publicField(this, "stub", this.createElement("<stub></stub>"));
      /// Typescript side of lib.
      __publicField(this, "plugin");
      /// Rust side of kernel.
      __publicField(this, "docKernel");
      /// The element to track.
      __publicField(this, "resourceHeader");
      /// Expected exact state of the current DOM.
      /// Initially it is empty meaning no any page is rendered.
      __publicField(this, "pages", []);
      /// The virtual scale of the document.
      __publicField(this, "domScale", 1);
      /// Track mode.
      __publicField(this, "track_mode", TrackMode.Doc);
      /// Current executing task.
      __publicField(this, "current_task");
      /// The currently maintained viewport.
      __publicField(this, "viewport");
      this.registerMode("dom");
      this.disposeList.push(() => {
        this.dispose();
      });
      this.plugin = this.opts.renderer;
      if (this.opts.domScale !== void 0) {
        if (this.opts.domScale <= 0) {
          throw new Error("domScale must be positive");
        }
        this.domScale = this.opts.domScale;
      }
    }
    dispose() {
      for (const page of this.pages) {
        page.dispose();
      }
      if (this.docKernel) {
        this.docKernel.free();
      }
    }
    createElement(tmpl) {
      this.tmpl.innerHTML = tmpl;
      return this.tmpl.content.firstElementChild;
    }
    async mountDom(pixelPerPt) {
      console.log("mountDom", pixelPerPt);
      if (this.docKernel) {
        throw new Error("already mounted");
      }
      this.hookedElem.innerHTML = `<svg class="typst-svg-resources" viewBox="0 0 0 0" width="0" height="0" style="opacity: 0; position: absolute;"></svg>`;
      this.resourceHeader = this.hookedElem.querySelector(".typst-svg-resources");
      this.docKernel = await this.plugin.renderer.mount_dom(this.kModule[kObject], this.hookedElem);
      this.docKernel.bind_functions({
        populateGlyphs: (data) => {
          let svg = this.createElement(data);
          console.log("populateGlyphs", svg);
          let content = svg.firstElementChild;
          this.resourceHeader.append(content);
        }
      });
    }
    async cancelAnyway$dom() {
      console.log("cancelAnyway$dom");
      if (this.current_task) {
        const task = this.current_task;
        this.current_task = void 0;
        await task.cancel();
      }
    }
    retrieveDOMPages() {
      return Array.from(this.hookedElem.querySelectorAll(".typst-dom-page"));
    }
    // doesn't need to postRender
    postRender$dom() {
    }
    // doesn't need to rescale
    rescale$dom() {
    }
    getDomViewport(cachedWindow, cachedBoundingRect) {
      const left = cachedBoundingRect.left;
      const top = -cachedBoundingRect.top;
      const right = cachedBoundingRect.right;
      const bottom = cachedWindow.innerHeight - cachedBoundingRect.top;
      const rect = {
        x: 0,
        y: top / this.domScale,
        width: Math.max(right - left, 0) / this.domScale,
        height: Math.max(bottom - top, 0) / this.domScale
      };
      if (rect.width <= 0 || rect.height <= 0) {
        rect.x = rect.y = rect.width = rect.height = 0;
      }
      return rect;
    }
    // fast mode
    async rerender$dom() {
      const domState = this.retrieveDOMState();
      const { x, y, width, height } = this.getDomViewport(domState.window, domState.boundingRect);
      let dirty = await this.docKernel.relayout(x, y, width, height);
      if (!dirty) {
        return;
      }
      const cancel = new TypstCancellationToken();
      this.doRender$dom(cancel);
      this.current_task = cancel;
    }
    async doRender$dom(ctx) {
      const condOrExit = (needFrame, cb) => {
        if (needFrame && !ctx.isCancelRequested() && cb) {
          return cb();
        }
      };
      const pages = this.retrieveDOMPages().map((page) => {
        const { innerWidth, innerHeight } = window;
        const browserBBox = page.getBoundingClientRect();
        return {
          inWindow: !(browserBBox.left > innerWidth || browserBBox.right < 0 || browserBBox.top > innerHeight || browserBBox.bottom < 0),
          page
        };
      });
      const renderPage = async (i) => {
        await animationFrame();
        if (ctx.isCancelRequested()) {
          console.log("cancel stage", RepaintStage.Layout, i);
          return void 0;
        }
        const page = pages[i].page;
        const browserBBox = page.getBoundingClientRect();
        const v = this.getDomViewport(window, browserBBox);
        const needCalc = (stage) => this.docKernel.need_repaint(i, v.x, v.y, v.width, v.height, stage);
        const repaint = (stage) => this.docKernel.repaint(i, v.x, v.y, v.width, v.height, stage);
        const calc = (stage) => {
          if (ctx.isCancelRequested()) {
            return void 0;
          }
          return condOrExit(needCalc(stage), () => repaint(stage));
        };
        await calc(RepaintStage.Layout);
        const wScale = (browserBBox.width ? Number.parseFloat(page.getAttribute("data-width")) / browserBBox.width : 1) * this.domScale;
        const hScale = (browserBBox.height ? Number.parseFloat(page.getAttribute("data-height")) / browserBBox.height : 1) * this.domScale;
        v.x *= wScale;
        v.y *= hScale;
        v.y -= 100;
        v.width *= wScale;
        v.height *= hScale;
        v.height += 200;
        await calc(RepaintStage.Svg);
        await calc(RepaintStage.Semantics);
        if (ctx.isCancelRequested()) {
          console.log("cancel stage", RepaintStage.Semantics, i);
          return void 0;
        }
        if (needCalc(RepaintStage.PrepareCanvas)) {
          const calcCanvasAfterPreparing = async () => {
            await repaint(RepaintStage.PrepareCanvas);
            if (ctx.isCancelRequested()) {
              return void 0;
            }
            return calc(RepaintStage.Canvas);
          };
          calcCanvasAfterPreparing();
        } else {
          await calc(RepaintStage.Canvas);
        }
      };
      const renderPages = async (inWindow) => {
        for (let idx = 0; idx < pages.length; ++idx) {
          if (ctx.isCancelRequested()) {
            console.log("cancel page", RepaintStage.Layout, idx);
            return;
          }
          if (pages[idx].inWindow === inWindow) {
            await renderPage(idx);
          }
        }
      };
      this.cancelAnyway$dom();
      await renderPages(true);
      await renderPages(false);
      if (ctx.isCancelRequested()) {
        return;
      }
      console.log("finished", RepaintStage.Layout);
    }
  };
}
var TypstDomDocument = class extends provideDoc(composeDoc(TypstDocumentContext, provideDomDoc)) {
};

// node_modules/@myriaddreamin/typst.ts/dist/esm/renderer.mjs
var _a;
_a = kObject;
var RenderSession = class {
  /**
   * @internal
   */
  constructor(plugin, o) {
    __publicField(this, "plugin");
    /**
     * @internal
     */
    __publicField(this, _a);
    this.plugin = plugin;
    this[kObject] = o;
  }
  /**
   * @deprecated set in {@link RenderToCanvasOptions} instead
   *
   * Set the background color of the Typst document.
   * @param {string} t - The background color in format of `^#?[0-9a-f]{6}$`
   *
   * Note: Default to `#ffffff`.
   *
   * Note: Only available in canvas rendering mode.
   */
  set backgroundColor(t) {
    if (t !== void 0) {
      this[kObject].background_color = t;
    }
  }
  /**
   * Get the background color of the Typst document.
   *
   * Note: Default to `#ffffff`.
   *
   * Note: Only available in canvas rendering mode.
   */
  get backgroundColor() {
    return this[kObject].background_color;
  }
  /**
   * Set the pixel per point scale up the canvas panel.
   *
   * Note: Default to `3`.
   *
   * Note: Only available in canvas rendering mode.
   */
  set pixelPerPt(t) {
    if (t !== void 0) {
      this[kObject].pixel_per_pt = t;
    }
  }
  /**
   * @deprecated set in {@link RenderToCanvasOptions} instead
   *
   * Get the pixel per point scale up the canvas panel.
   *
   * Note: Default to `3`.
   *
   * Note: Only available in canvas rendering mode.
   */
  get pixelPerPt() {
    return this[kObject].pixel_per_pt;
  }
  /**
   * Reset state
   */
  reset() {
    this.plugin.resetSession(this);
  }
  /**
   * @deprecated
   * use {@link docWidth} instead
   */
  get doc_width() {
    return this[kObject].doc_width;
  }
  get docWidth() {
    return this[kObject].doc_width;
  }
  /**
   * @deprecated
   * use {@link docHeight} instead
   */
  get doc_height() {
    return this[kObject].doc_height;
  }
  get docHeight() {
    return this[kObject].doc_height;
  }
  retrievePagesInfo() {
    const pages_info = this[kObject].pages_info;
    const pageInfos = [];
    const pageCount = pages_info.page_count;
    for (let i = 0; i < pageCount; i++) {
      const pageAst = pages_info.page(i);
      pageInfos.push({
        pageOffset: pageAst.page_off,
        width: pageAst.width_pt,
        height: pageAst.height_pt
      });
    }
    return pageInfos;
  }
  getSourceLoc(path) {
    return this[kObject].source_span(path);
  }
  /**
   * See {@link TypstRenderer#renderSvg} for more details.
   */
  renderSvg(options) {
    return this.plugin.renderSvg({
      renderSession: this,
      ...options
    });
  }
  /**
   * See {@link TypstRenderer#renderToSvg} for more details.
   */
  renderToSvg(options) {
    return this.plugin.renderToSvg({
      renderSession: this,
      ...options
    });
  }
  /**
   * See {@link TypstRenderer#renderCanvas} for more details.
   */
  renderCanvas(options) {
    return this.plugin.renderCanvas({
      renderSession: this,
      ...options
    });
  }
  /**
   * See {@link TypstRenderer#manipulateData} for more details.
   */
  manipulateData(opts) {
    this.plugin.manipulateData({
      renderSession: this,
      ...opts
    });
  }
  /**
   * See {@link TypstRenderer#renderSvgDiff} for more details.
   */
  renderSvgDiff(opts) {
    return this.plugin.renderSvgDiff({
      renderSession: this,
      ...opts
    });
  }
  /**
   * @deprecated
   * use {@link getSourceLoc} instead
   */
  get_source_loc(path) {
    return this[kObject].source_span(path);
  }
  /**
   * @deprecated
   * use {@link renderSvgDiff} instead
   */
  render_in_window(rect_lo_x, rect_lo_y, rect_hi_x, rect_hi_y) {
    return this[kObject].render_in_window(rect_lo_x, rect_lo_y, rect_hi_x, rect_hi_y);
  }
  /**
   * @deprecated
   * use {@link manipulateData} instead
   */
  merge_delta(data) {
    this.plugin.manipulateData({
      renderSession: this,
      action: "merge",
      data
    });
  }
};
var ManageStatus;
(function(ManageStatus2) {
  ManageStatus2[ManageStatus2["Delete"] = 0] = "Delete";
  ManageStatus2[ManageStatus2["New"] = 1] = "New";
  ManageStatus2[ManageStatus2["Update"] = 2] = "Update";
})(ManageStatus || (ManageStatus = {}));
var _a2;
_a2 = kObject;
var TypstWorker = class {
  /**
   * @internal
   */
  constructor(plugin, o) {
    __publicField(this, "plugin");
    /**
     * @internal
     */
    __publicField(this, _a2);
    /**
     * @internal
     */
    __publicField(this, "managedCanvasElemList", /* @__PURE__ */ new Map());
    /**
     * @internal
     */
    __publicField(this, "canvasCounter", Math.random());
    this.plugin = plugin;
    this[kObject] = o;
  }
  /**
   * See {@link TypstRenderer#manipulateData} for more details.
   */
  manipulateData(action, data) {
    return this[kObject].manipulate_data(action, data);
  }
  /**
   * You must submit all canvas in pages to ensure synchronization with the background worker
   *
   * See {@link TypstRenderer#renderCanvas} for more details.
   */
  renderCanvas(canvasElemList) {
    const m = this.managedCanvasElemList;
    for (const [_, elem] of m) {
      elem[0] = ManageStatus.Delete;
    }
    for (const elem of canvasElemList) {
      const canvas = elem.canvas;
      let elemId = canvas.dataset.manageId;
      let action = ManageStatus.Update;
      if (!elemId) {
        elemId = this.canvasCounter.toFixed(5);
        this.canvasCounter += 1;
        canvas.dataset.manageId = elemId;
        action = ManageStatus.New;
      }
      let prev = m.get(elemId);
      if (prev && prev[0] !== ManageStatus.Delete) {
        throw new Error("cannot update a canvas for two times in batch");
      }
      m.set(elemId, [action, { ...elem }]);
    }
    const entries = Array.from(m.entries());
    const actions = new Uint8Array(entries.length);
    const elements = new Array(entries.length);
    const options = entries.map(([key, [action, elem]], index) => {
      if (!action) {
        m.delete(key);
      }
      actions[index] = action;
      elements[index] = elem.canvas;
      return this.plugin.canvasOptionsToRust(elem);
    });
    return this[kObject].render_canvas(actions, elements, options);
  }
  async retrievePagesInfo() {
    const pages_info = await this[kObject].get_pages_info();
    console.log(pages_info);
    const pageInfos = [];
    const pageCount = pages_info.page_count;
    for (let i = 0; i < pageCount; i++) {
      const pageAst = pages_info.page(i);
      pageInfos.push({
        pageOffset: pageAst.page_off,
        width: pageAst.width_pt,
        height: pageAst.height_pt
      });
    }
    return pageInfos;
  }
};
var gRendererModule = (module) => new LazyWasmModule(async (bin) => {
  return await module.default(bin);
});
function createTypstRenderer() {
  return new TypstRendererDriver();
}
function createTypstSvgRenderer() {
  return new TypstRendererDriver();
}
async function rendererBuildInfo() {
  const renderModule = await import("./wasm-pack-shim-WWOKHW27.js");
  return renderModule.renderer_build_info();
}
var warnOnceCanvasSet = true;
var TypstRendererDriver = class {
  constructor() {
    __publicField(this, "renderer");
    __publicField(this, "rendererJs");
  }
  async init(options) {
    var _a4;
    this.rendererJs = await (((_a4 = options == null ? void 0 : options.getWrapper) == null ? void 0 : _a4.call(options)) || import("./wasm-pack-shim-WWOKHW27.js"));
    const TypstRendererBuilder = this.rendererJs.TypstRendererBuilder;
    this.renderer = await buildComponent(options, gRendererModule(this.rendererJs), TypstRendererBuilder, {});
  }
  loadGlyphPack(_pack) {
    return Promise.resolve();
  }
  createOptionsToRust(options) {
    const rustOptions = new this.rendererJs.CreateSessionOptions();
    if (options.format !== void 0) {
      rustOptions.format = options.format;
    }
    if (options.artifactContent !== void 0) {
      rustOptions.artifact_content = options.artifactContent;
    }
    return rustOptions;
  }
  canvasOptionsToRust(options) {
    const rustOptions = new this.rendererJs.RenderPageImageOptions();
    if (options.pageOffset === void 0) {
      throw new Error("pageOffset is required in reflexo v0.5.0");
    } else {
      rustOptions.page_off = options.pageOffset;
    }
    if (options.cacheKey !== void 0) {
      rustOptions.cache_key = options.cacheKey;
    }
    if (options.backgroundColor !== void 0) {
      rustOptions.background_color = options.backgroundColor;
    }
    if (options.pixelPerPt !== void 0) {
      rustOptions.pixel_per_pt = options.pixelPerPt;
    }
    if (options.dataSelection !== void 0) {
      let encoded = 0;
      if (options.dataSelection.body) {
        encoded |= 1 << 0;
      } else if (options.canvas && warnOnceCanvasSet) {
        warnOnceCanvasSet = false;
        console.warn("dataSelection.body is not set but providing canvas for body");
      }
      if (options.dataSelection.text || options.dataSelection.annotation) {
        console.error("dataSelection.text and dataSelection.annotation are deprecated");
      }
      if (options.dataSelection.semantics) {
        encoded |= 1 << 3;
      }
      rustOptions.data_selection = encoded;
    }
    return rustOptions;
  }
  retrievePagesInfoFromSession(session) {
    return session.retrievePagesInfo();
  }
  /**
   * Render a Typst document to canvas.
   */
  renderCanvas(options) {
    return this.withinOptionSession(options, async (sessionRef) => {
      return this.renderer.render_page_to_canvas(sessionRef[kObject], options.canvas || void 0, this.canvasOptionsToRust(options));
    });
  }
  // async renderPdf(artifactContent: string): Promise<Uint8Array> {
  // return this.renderer.render_to_pdf(artifactContent);
  // }
  async inAnimationFrame(fn) {
    return new Promise((resolve, reject) => {
      requestAnimationFrame(() => {
        try {
          resolve(fn());
        } catch (e) {
          reject(e);
        }
      });
    });
  }
  async renderDisplayLayer(session, canvasList, options) {
    const pages_info = session[kObject].pages_info;
    const page_count = pages_info.page_count;
    const doRender = async (i, page_off) => {
      const canvas = canvasList[i];
      const ctx = canvas.getContext("2d");
      if (!ctx) {
        throw new Error("canvas context is null");
      }
      return await this.renderCanvas({
        ...options,
        canvas: ctx,
        renderSession: session,
        pageOffset: page_off
      });
    };
    const t = performance.now();
    const textContentList = await (async () => {
      const results = [];
      for (let i = 0; i < page_count; i++) {
        results.push(await this.inAnimationFrame(() => doRender(i, i)));
      }
      return results;
    })();
    const t2 = performance.now();
    console.log(`display layer used: render = ${(t2 - t).toFixed(1)}ms`);
    return textContentList;
  }
  renderTextLayer(layerList, textSourceList) {
    const t2 = performance.now();
    layerList.forEach((layer, i) => {
      layer.innerHTML = textSourceList[i].htmlSemantics[0];
    });
    const t3 = performance.now();
    console.log(`text layer used: render = ${(t3 - t2).toFixed(1)}ms`);
  }
  async render(options) {
    if ("format" in options) {
      if (options.format !== "vector") {
        const artifactFormats = ["serde_json", "js", "ir"];
        if (artifactFormats.includes(options.format)) {
          throw new Error(`deprecated format ${options.format}, please use vector format`);
        }
      }
    }
    return this.renderToCanvas(options);
  }
  async renderDom(options) {
    if ("format" in options) {
      if (options.format !== "vector") {
        const artifactFormats = ["serde_json", "js", "ir"];
        if (artifactFormats.includes(options.format)) {
          throw new Error(`deprecated format ${options.format}, please use vector format`);
        }
      }
    }
    return this.withinOptionSession(options, async (sessionRef) => {
      const t = new TypstDomDocument({
        ...options,
        renderMode: "dom",
        hookedElem: options.container,
        kModule: sessionRef,
        renderer: this
      });
      t;
      await t.impl.mountDom(options.pixelPerPt);
      return t;
    });
  }
  async renderToCanvas(options) {
    let session;
    let renderPageResults;
    const mountContainer = options.container;
    mountContainer.style.visibility = "hidden";
    const doRenderDisplayLayer = async (canvasList, resetLayout) => {
      try {
        renderPageResults = await this.renderDisplayLayer(session, canvasList, options);
        resetLayout();
      } finally {
        mountContainer.style.visibility = "visible";
      }
    };
    return this.withinOptionSession(options, async (sessionRef) => {
      session = sessionRef;
      if (session[kObject].pages_info.page_count === 0) {
        throw new Error(`No page found in session`);
      }
      if (options.pixelPerPt !== void 0 && options.pixelPerPt <= 0) {
        throw new Error("Invalid typst.RenderOptions.pixelPerPt, should be a positive number " + options.pixelPerPt);
      }
      let backgroundColor = options.backgroundColor;
      if (backgroundColor !== void 0) {
        if (!/^#[0-9a-f]{6}$/.test(backgroundColor)) {
          throw new Error("Invalid typst.backgroundColor color for matching ^#?[0-9a-f]{6}$ " + backgroundColor);
        }
      }
      session.pixelPerPt = options.pixelPerPt ?? TypstDefaultParams.PIXEL_PER_PT;
      session.backgroundColor = backgroundColor ?? "#ffffff";
      const t = performance.now();
      const pageView = new RenderView(this.retrievePagesInfoFromSession(session), mountContainer, options);
      const t2 = performance.now();
      console.log(`layer used: retrieve = ${(t2 - t).toFixed(1)}ms`);
      await doRenderDisplayLayer(pageView.canvasList, () => pageView.resetLayout());
      this.renderTextLayer(pageView.textLayerList, renderPageResults);
      return;
    });
  }
  createModule(b) {
    return Promise.resolve(new RenderSession(this, this.renderer.create_session(b && this.createOptionsToRust({
      format: "vector",
      artifactContent: b
    }))));
  }
  async createWorkerV0(worker) {
    return new TypstWorker(this, await this.renderer.create_worker(worker));
  }
  workerBridge() {
    return this.renderer.create_worker_bridge();
  }
  renderSvg(options, container) {
    if (options instanceof RenderSession || container) {
      throw new Error("removed api, please use renderToSvg({ renderSession, container }) instead");
    }
    return this.withinOptionSession(options, async (sessionRef) => {
      let parts = void 0;
      if (options.data_selection) {
        parts = 0;
        if (options.data_selection.body) {
          parts |= 1 << 0;
        }
        if (options.data_selection.defs) {
          parts |= 1 << 1;
        }
        if (options.data_selection.css) {
          parts |= 1 << 2;
        }
        if (options.data_selection.js) {
          parts |= 1 << 3;
        }
      }
      return Promise.resolve(this.renderer.svg_data(sessionRef[kObject], parts));
    });
  }
  renderSvgDiff(options) {
    if (!options.window) {
      return this.renderer.render_svg_diff(options.renderSession[kObject], 0, 0, 1e33, 1e33);
    }
    return this.renderer.render_svg_diff(options.renderSession[kObject], options.window.lo.x, options.window.lo.y, options.window.hi.x, options.window.hi.y);
  }
  renderToSvg(options) {
    return this.withinOptionSession(options, async (sessionRef) => {
      return Promise.resolve(this.renderer.render_svg(sessionRef[kObject], options.container));
    });
  }
  getCustomV1(options) {
    return Promise.resolve(this.renderer.get_customs(options.renderSession[kObject]));
  }
  resetSession(session) {
    return this.renderer.reset(session[kObject]);
  }
  manipulateData(opts) {
    return this.renderer.manipulate_data(opts.renderSession[kObject], opts.action ?? "reset", opts.data);
  }
  withinOptionSession(options, fn) {
    function isRenderByContentOption(options2) {
      return "artifactContent" in options2;
    }
    if ("renderSession" in options) {
      return fn(options.renderSession);
    }
    if (isRenderByContentOption(options)) {
      return this.runWithSession(options, fn);
    }
    throw new Error("Invalid render options, should be one of RenderByContentOptions|RenderBySessionOptions");
  }
  async runWithSession(arg1, arg2) {
    let options = arg1;
    let fn = arg2;
    if (!arg2) {
      options = void 0;
      fn = arg1;
    }
    const session = this.renderer.create_session(
      /* moved */
      options && this.createOptionsToRust(options)
    );
    try {
      const res = await fn(new RenderSession(this, session));
      session.free();
      return res;
    } catch (e) {
      session.free();
      throw e;
    }
  }
};

// node_modules/@myriaddreamin/typst.ts/dist/esm/fs/fetch.mjs
var FetchAccessModel = class {
  constructor(root, options) {
    __publicField(this, "root");
    __publicField(this, "fullyCached");
    __publicField(this, "mTimes", /* @__PURE__ */ new Map());
    __publicField(this, "mRealPaths", /* @__PURE__ */ new Map());
    __publicField(this, "mData", /* @__PURE__ */ new Map());
    this.root = root;
    if (root.endsWith("/")) {
      this.root = this.root.slice(0, this.root.length - 1);
    }
    if (options == null ? void 0 : options.polyfillHeadRequest) {
    }
    this.fullyCached = !!(options == null ? void 0 : options.fullyCached);
  }
  reset() {
    this.mTimes.clear();
    this.mRealPaths.clear();
    this.mData.clear();
  }
  resolvePath(path) {
    return this.root + path;
  }
  insertFile(path, data, mtime) {
    this.mTimes.set(path, mtime);
    this.mData.set(path, data);
  }
  removeFile(path) {
    this.mTimes.delete(path);
    this.mData.delete(path);
  }
  async getPreloadScript() {
    const snapshot = [];
    snapshot.push("((async () => {");
    snapshot.push(`const snapshot = {  root: '', mTimes: new Map(),  mRealPaths: new Map(),  mData: [],};`);
    snapshot.push(`const runFetch = async (path) => {`);
    snapshot.push(`  const res = await fetch(snapshot.root + path);`);
    snapshot.push(`  const buffer = await res.arrayBuffer();`);
    snapshot.push(`  return [path, new Uint8Array(buffer)];`);
    snapshot.push(`};`);
    snapshot.push(`snapshot.root = ${JSON.stringify(this.root)};`);
    snapshot.push(`snapshot.mTimes = new Map([${[...this.mTimes.entries()].map(([k, v]) => `[${JSON.stringify(k)}, ${(v == null ? void 0 : v.getTime()) || "undefined"}]`).join(", ")}]);`);
    snapshot.push(`snapshot.mRealPaths = new Map([${[...this.mRealPaths.entries()].map(([k, v]) => `[${JSON.stringify(k)}, ${JSON.stringify(v)}]`).join(", ")}]);`);
    const dataEntries = await Promise.all([...this.mData.entries()].map(async ([k, v]) => {
      k = JSON.stringify(k);
      return v ? `runFetch(${k})` : `Promise.resolve([${k}, undefined])`;
    }));
    snapshot.push(`snapshot.mData = await Promise.all([${dataEntries.join(", ")}]);`);
    snapshot.push(`return snapshot;`);
    snapshot.push("})())");
    return snapshot.join("\n");
  }
  getLastModified(path) {
    const request = new XMLHttpRequest();
    request.open("HEAD", path, false);
    request.send(null);
    if (request.status === 200) {
      return request.getResponseHeader("Last-Modified");
    }
    return null;
  }
  getMTimeInternal(path) {
    const lastModified = this.getLastModified(this.resolvePath(path));
    if (lastModified) {
      return new Date(lastModified);
    }
    return void 0;
  }
  getMTime(path) {
    if (path.startsWith("/@memory/")) {
      if (this.mTimes.has(path)) {
        return this.mTimes.get(path);
      }
      return void 0;
    }
    if (!this.fullyCached) {
      return this.getMTimeInternal(path);
    }
    if (this.mTimes.has(path)) {
      return this.mTimes.get(path);
    }
    const mTime = this.getMTimeInternal(path);
    this.mTimes.set(path, mTime);
    return mTime;
  }
  // todo: isFile
  isFile() {
    return true;
  }
  // todo: getRealPath
  getRealPath(path) {
    return path;
  }
  readAllInternal(path) {
    const request = new XMLHttpRequest();
    request.overrideMimeType("text/plain; charset=x-user-defined");
    request.open("GET", this.resolvePath(path), false);
    request.send(null);
    if (request.status === 200 && (request.response instanceof String || typeof request.response === "string")) {
      return Uint8Array.from(request.response, (c) => c.charCodeAt(0));
    }
    return void 0;
  }
  readAll(path) {
    if (path.startsWith("/@memory/")) {
      if (this.mData.has(path)) {
        return this.mData.get(path);
      }
      return void 0;
    }
    if (!this.fullyCached) {
      return this.readAllInternal(path);
    }
    if (this.mData.has(path)) {
      return this.mData.get(path);
    }
    const data = this.readAllInternal(path);
    this.mData.set(path, data);
    return data;
  }
};

// node_modules/@myriaddreamin/typst.ts/dist/esm/fs/memory.mjs
var MemoryAccessModel = class {
  constructor() {
    __publicField(this, "mTimes", /* @__PURE__ */ new Map());
    __publicField(this, "mData", /* @__PURE__ */ new Map());
  }
  reset() {
    this.mTimes.clear();
    this.mData.clear();
  }
  insertFile(path, data, mtime) {
    this.mTimes.set(path, mtime);
    this.mData.set(path, data);
  }
  removeFile(path) {
    this.mTimes.delete(path);
    this.mData.delete(path);
  }
  getMTime(path) {
    if (!path.startsWith("/@memory/")) {
      return void 0;
    }
    if (this.mTimes.has(path)) {
      return this.mTimes.get(path);
    }
    return void 0;
  }
  isFile() {
    return true;
  }
  getRealPath(path) {
    return path;
  }
  readAll(path) {
    if (!path.startsWith("/@memory/")) {
      return void 0;
    }
    if (this.mData.has(path)) {
      return this.mData.get(path);
    }
    return void 0;
  }
};

// node_modules/@myriaddreamin/typst.ts/dist/esm/fs/package.mjs
var FetchPackageRegistry = class {
  constructor(am) {
    __publicField(this, "am");
    __publicField(this, "cache", /* @__PURE__ */ new Map());
    this.am = am;
  }
  resolvePath(path) {
    return `https://packages.typst.org/preview/${path.name}-${path.version}.tar.gz`;
  }
  pullPackageData(path) {
    const request = new XMLHttpRequest();
    request.overrideMimeType("text/plain; charset=x-user-defined");
    request.open("GET", this.resolvePath(path), false);
    request.send(null);
    if (request.status === 200 && (request.response instanceof String || typeof request.response === "string")) {
      return Uint8Array.from(request.response, (c) => c.charCodeAt(0));
    }
    return void 0;
  }
  resolve(spec, context) {
    if (spec.namespace !== "preview") {
      return void 0;
    }
    const path = this.resolvePath(spec);
    if (this.cache.has(path)) {
      return this.cache.get(path)();
    }
    const data = this.pullPackageData(spec);
    if (!data) {
      return void 0;
    }
    const previewDir = `/@memory/fetch/packages/preview/${spec.namespace}/${spec.name}/${spec.version}`;
    const entries = [];
    context.untar(data, (path2, data2, mtime) => {
      entries.push([previewDir + "/" + path2, data2, new Date(mtime)]);
    });
    const cacheClosure = () => {
      for (const [path2, data2, mtime] of entries) {
        this.am.insertFile(path2, data2, mtime);
      }
      return previewDir;
    };
    this.cache.set(path, cacheClosure);
    return cacheClosure();
  }
};

// node_modules/@myriaddreamin/typst.ts/dist/esm/compiler.mjs
var _a3;
_a3 = kObject;
var IncrementalServer = class {
  /**
   * @internal
   */
  constructor(s) {
    /**
     * @internal
     */
    __publicField(this, _a3);
    this[kObject] = s;
  }
  /**
   * Reset the incremental server to the initial state.
   */
  reset() {
    this[kObject].reset();
  }
  /**
   * Return current result.
   */
  current() {
    return this[kObject].current();
  }
  /**
   * Also attach the debug info to the result.
   */
  setAttachDebugInfo(enable) {
    this[kObject].set_attach_debug_info(enable);
  }
};
var gCompilerModule = new LazyWasmModule(async (bin) => {
  const module = await import("./wasm-pack-shim-TD4HBA2F.js");
  return await module.default(bin);
});
function createTypstCompiler() {
  return new TypstCompilerDriver();
}
var TypstCompilerDriver = class {
  constructor() {
    __publicField(this, "compiler");
    __publicField(this, "compilerJs");
  }
  async init(options) {
    var _a4, _b, _c, _d;
    this.compilerJs = await import("./wasm-pack-shim-TD4HBA2F.js");
    const TypstCompilerBuilder = this.compilerJs.TypstCompilerBuilder;
    const compilerOptions = { ...options || {} };
    const hasPreloadRemoteFonts = (_a4 = compilerOptions.beforeBuild) == null ? void 0 : _a4.some((fn) => fn._preloadRemoteFontOptions !== void 0);
    const hasSpecifiedAssets = (_b = compilerOptions.beforeBuild) == null ? void 0 : _b.some((fn) => {
      var _a5;
      return ((_a5 = fn._preloadRemoteFontOptions) == null ? void 0 : _a5.assets) !== void 0;
    });
    const hasDisableAssets = (_c = compilerOptions.beforeBuild) == null ? void 0 : _c.some((fn) => {
      var _a5;
      return ((_a5 = fn._preloadRemoteFontOptions) == null ? void 0 : _a5.assets) === false;
    });
    if (!hasPreloadRemoteFonts || !hasSpecifiedAssets && !hasDisableAssets) {
      (_d = compilerOptions.beforeBuild) == null ? void 0 : _d.push(preloadRemoteFonts([], {
        assets: ["text"]
      }));
    }
    this.compiler = await buildComponent(options, gCompilerModule, TypstCompilerBuilder, {});
  }
  compile(options) {
    return new Promise((resolve) => {
      if ("incrementalServer" in options) {
        resolve(this.compiler.incr_compile(options.mainFilePath, convertInputs(options.inputs), options.incrementalServer[kObject], getDiagnosticsArg(options.diagnostics)));
        return;
      }
      resolve(this.compiler.compile(options.mainFilePath, convertInputs(options.inputs), options.format || "vector", getDiagnosticsArg(options.diagnostics)));
    });
  }
  query(options) {
    return new Promise((resolve) => {
      resolve(JSON.parse(this.compiler.query(options.mainFilePath, convertInputs(options.inputs), options.selector, options.field)));
    });
  }
  getSemanticTokenLegend() {
    return new Promise((resolve) => {
      resolve(this.compiler.get_semantic_token_legend());
    });
  }
  getSemanticTokens(opts) {
    return new Promise((resolve) => {
      this.compiler.reset();
      resolve(this.compiler.get_semantic_tokens(opts.offsetEncoding || "utf-16", opts.mainFilePath, opts.resultId));
    });
  }
  async withIncrementalServer(f) {
    const srv = new IncrementalServer(this.compiler.create_incr_server());
    try {
      return await f(srv);
    } finally {
      srv[kObject].free();
    }
  }
  async getAst(mainFilePath) {
    return this.compiler.get_ast(mainFilePath);
  }
  async reset() {
    await new Promise((resolve) => {
      this.compiler.reset();
      resolve(void 0);
    });
  }
  addSource(path, source) {
    if (arguments.length > 2) {
      throw new Error("use of addSource(path, source, isMain) is deprecated, please use addSource(path, source) instead");
    }
    this.compiler.add_source(path, source);
  }
  mapShadow(path, content) {
    this.compiler.map_shadow(path, content);
  }
  unmapShadow(path) {
    this.compiler.unmap_shadow(path);
  }
  resetShadow() {
    this.compiler.reset_shadow();
  }
  renderPageToCanvas() {
    throw new Error("Please use the api TypstRenderer.renderToCanvas in v0.4.0");
  }
};
function convertInputs(inputs) {
  return inputs ? Object.entries(inputs) : void 0;
}
function getDiagnosticsArg(diagnostics) {
  switch (diagnostics) {
    case "none":
      return 1;
    case "unix":
      return 2;
    case "full":
      return 3;
    default:
      return 0;
  }
}
export {
  FetchAccessModel,
  FetchPackageRegistry,
  MemoryAccessModel,
  RenderView,
  createTypstCompiler,
  createTypstRenderer,
  createTypstSvgRenderer,
  options_init_exports as initOptions,
  preloadRemoteFonts,
  preloadSystemFonts,
  rendererBuildInfo
};
//# sourceMappingURL=@myriaddreamin_typst__ts.js.map
