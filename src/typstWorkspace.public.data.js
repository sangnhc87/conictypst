export const rawWorkspaceFiles = import.meta.glob('../typst/**/*.typ', {
  eager: true,
  query: '?raw',
  import: 'default',
})

export const starterFilePathOrder = [
  '/typst/public-playground.typ',
  '/typst/main.typ',
  '/typst/bbt.typ',
  '/typst/g-bank.typ',
]

export const workspaceMode = 'public'
