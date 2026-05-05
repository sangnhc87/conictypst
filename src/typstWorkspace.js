import { rawWorkspaceFiles, starterFilePathOrder, workspaceMode } from '@typst-workspace-data'

function normalizeWorkspacePath(modulePath) {
  const relativePath = modulePath.replace(/^\.\.\/typst\//, '')
  return `/typst/${relativePath}`
}

function createFolderNode(path, name) {
  return {
    type: 'folder',
    path,
    name,
    children: [],
  }
}

function sortTree(node) {
  node.children.sort((left, right) => {
    if (left.type !== right.type) return left.type === 'folder' ? -1 : 1
    return left.name.localeCompare(right.name)
  })

  for (const child of node.children) {
    if (child.type === 'folder') sortTree(child)
  }

  return node
}

const sortedWorkspaceEntries = Object.entries(rawWorkspaceFiles)
  .map(([modulePath, content]) => [normalizeWorkspacePath(modulePath), content])
  .sort(([leftPath], [rightPath]) => leftPath.localeCompare(rightPath))

export const initialWorkspaceFiles = Object.fromEntries(sortedWorkspaceEntries)

export const starterFilePaths = starterFilePathOrder.filter(filePath => filePath in initialWorkspaceFiles)

export const defaultEntryPath =
  (initialWorkspaceFiles['/typst/public-playground.typ'] && '/typst/public-playground.typ') ||
  (initialWorkspaceFiles['/typst/playground.typ'] && '/typst/playground.typ') ||
  (initialWorkspaceFiles['/typst/main.typ'] && '/typst/main.typ') ||
  starterFilePaths[0] ||
  Object.keys(initialWorkspaceFiles)[0] ||
  '/typst/main.typ'

export const defaultOpenTabs = [
  defaultEntryPath,
  ...starterFilePaths,
].filter((filePath, index, filePaths) => filePaths.indexOf(filePath) === index)

const expandedFolders = new Set(['/typst'])
for (const filePath of Object.keys(initialWorkspaceFiles)) {
  const segments = filePath.split('/').filter(Boolean)
  let currentPath = ''
  for (const segment of segments.slice(0, -1)) {
    currentPath += `/${segment}`
    expandedFolders.add(currentPath)
  }
}

export const defaultExpandedFolderPaths = [...expandedFolders].sort((left, right) => left.localeCompare(right))

export { workspaceMode }

export function createFileTree(filePaths) {
  const root = createFolderNode('/typst', 'typst')
  const folderLookup = new Map([[root.path, root]])

  for (const filePath of [...filePaths].sort((left, right) => left.localeCompare(right))) {
    const segments = filePath.split('/').filter(Boolean).slice(1)
    let currentFolderPath = root.path
    let currentFolderNode = root

    segments.forEach((segment, index) => {
      const currentPath = `${currentFolderPath}/${segment}`
      const isFile = index === segments.length - 1

      if (isFile) {
        currentFolderNode.children.push({
          type: 'file',
          path: currentPath,
          name: segment,
        })
        return
      }

      if (!folderLookup.has(currentPath)) {
        const folderNode = createFolderNode(currentPath, segment)
        currentFolderNode.children.push(folderNode)
        folderLookup.set(currentPath, folderNode)
      }

      currentFolderNode = folderLookup.get(currentPath)
      currentFolderPath = currentPath
    })
  }

  return sortTree(root)
}

export function getFileName(filePath) {
  return filePath.split('/').pop() || filePath
}

export function stripWorkspaceRoot(filePath) {
  if (filePath === '/typst') return 'typst'
  return filePath.replace(/^\/typst\//, '')
}