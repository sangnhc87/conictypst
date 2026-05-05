export const rawWorkspaceFiles = import.meta.glob('../typst/**/*.typ', {
  eager: true,
  query: '?raw',
  import: 'default',
})

export const starterFilePathOrder = [
  '/typst/playground.typ',
  '/typst/main.typ',
  '/typst/exams/de-01.typ',
  '/typst/sang-exam.typ',
  '/typst/sang-beamer.typ',
]

export const workspaceMode = 'private'