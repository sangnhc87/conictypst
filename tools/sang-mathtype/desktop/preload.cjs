const { contextBridge, ipcRenderer, webUtils } = require('electron')

contextBridge.exposeInMainWorld('wordBridge', {
  insert: payload => ipcRenderer.invoke('word:insert', payload),
  replace: payload => ipcRenderer.invoke('word:replace', payload),
  readSelection: near => ipcRenderer.invoke('word:read', near),
  list: scope => ipcRenderer.invoke('word:list', scope),
  many: items => ipcRenderer.invoke('word:many', items),
  onSelection: cb => ipcRenderer.on('word:selection', (_e, alt) => cb(alt)),
  onSelected: cb => ipcRenderer.on('word:selected', (_e, alt) => cb(alt)),
  toolsRead: scope => ipcRenderer.invoke('tools:read', scope),
  toolsApply: (ops, layout) => ipcRenderer.invoke('tools:apply', ops, layout),
  toolsTables: scope => ipcRenderer.invoke('tools:tables', scope),
  docPath: () => ipcRenderer.invoke('tools:docpath'),
})

contextBridge.exposeInMainWorld('examBridge', {
  env: () => ipcRenderer.invoke('exam:env'),
  pick: () => ipcRenderer.invoke('exam:pick'),
  pathForFile: file => webUtils.getPathForFile(file),
  pickDir: () => ipcRenderer.invoke('exam:pickDir'),
  analyze: file => ipcRenderer.invoke('exam:analyze', file),
  run: req => ipcRenderer.invoke('exam:run', req),
  history: () => ipcRenderer.invoke('exam:history'),
  getSettings: () => ipcRenderer.invoke('exam:settings:get'),
  setSettings: next => ipcRenderer.invoke('exam:settings:set', next),
  reveal: p => ipcRenderer.invoke('exam:reveal', p),
  open: p => ipcRenderer.invoke('exam:open', p),
})
