import { app, BrowserWindow, dialog, ipcMain } from 'electron'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

import { exportTypstDocxBundle } from '../scripts/export_docx_bundle.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const projectRoot = path.resolve(__dirname, '..')

function sanitizeBaseName(value) {
  return String(value || 'typst-export')
    .replace(/\.typ$/i, '')
    .replace(/[^a-z0-9._-]+/gi, '_')
}

function createWindow() {
  const mainWindow = new BrowserWindow({
    width: 1480,
    height: 960,
    minWidth: 1180,
    minHeight: 760,
    autoHideMenuBar: true,
    title: 'ConicTypst Desktop',
    webPreferences: {
      contextIsolation: true,
      nodeIntegration: false,
      sandbox: false,
      preload: path.join(__dirname, 'preload.mjs'),
    },
  })

  if (process.env.VITE_DEV_SERVER_URL) {
    mainWindow.loadURL(process.env.VITE_DEV_SERVER_URL)
    return mainWindow
  }

  mainWindow.loadFile(path.join(projectRoot, 'dist', 'index.html'))
  return mainWindow
}

ipcMain.handle('desktop:get-runtime-info', () => ({
  isDesktop: true,
  platform: process.platform,
}))

ipcMain.handle('desktop:export-typst-docx', async (_event, payload) => {
  const { fileName, zipBuffer } = exportTypstDocxBundle(payload || {})
  const result = await dialog.showSaveDialog({
    title: 'Lưu gói DOCX',
    defaultPath: path.join(
      app.getPath('downloads'),
      `${sanitizeBaseName(payload?.sourceName)}_${fileName}`,
    ),
    filters: [{ name: 'ZIP Archive', extensions: ['zip'] }],
  })

  if (result.canceled || !result.filePath) {
    return { cancelled: true }
  }

  fs.writeFileSync(result.filePath, zipBuffer)
  return {
    cancelled: false,
    filePath: result.filePath,
  }
})

app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})