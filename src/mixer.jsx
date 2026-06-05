// Standalone entry point cho trang Trộn Đề
// Không import bất kỳ thứ gì liên quan đến Typst WASM compiler
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import ExamShuffler from './ExamShuffler.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <ExamShuffler />
  </StrictMode>,
)
