import { contextBridge, ipcRenderer } from 'electron'

contextBridge.exposeInMainWorld('desktopApi', {
  getRuntimeInfo: () => ipcRenderer.invoke('desktop:get-runtime-info'),
  exportTypstDocxBundle: payload => ipcRenderer.invoke('desktop:export-typst-docx', payload),
})