export const rawWorkspaceFiles = import.meta.glob([
  '../typst/public-playground.typ',
  '../typst/bbt.typ',
  '../typst/g-bank.typ',
], {
  eager: true,
  query: '?raw',
  import: 'default',
})

export const starterFilePathOrder = [
  '/typst/public-playground.typ',
  '/typst/bbt.typ',
  '/typst/g-bank.typ',
]

export const workspaceMode = 'public'