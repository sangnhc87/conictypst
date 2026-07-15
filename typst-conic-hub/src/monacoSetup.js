import { loader } from '@monaco-editor/react'
import * as monaco from 'monaco-editor/esm/vs/editor/editor.api'
import EditorWorker from 'monaco-editor/esm/vs/editor/editor.worker?worker'
import 'monaco-editor/esm/vs/editor/contrib/suggest/browser/suggestController.js'

self.MonacoEnvironment = {
  getWorker() {
    return new EditorWorker()
  },
}

loader.config({ monaco })
