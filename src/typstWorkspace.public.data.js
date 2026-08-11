// The public Pages build keeps a small starter workspace. The desktop/private
// build still exposes the complete Typst tree; excluding the repository-wide
// lesson archive here keeps the single public JS asset under Cloudflare's
// 25 MiB file limit.
export const rawWorkspaceFiles = import.meta.glob('../typst/{public-playground.typ,main.typ,bbt.typ,g-bank.typ}', {
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
