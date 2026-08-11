import { SANG_MATH_CATALOG } from './sangMathCatalog'
import { contextualSnippetText } from './questionSource'
import { MATH_SYMBOL_CATEGORIES } from './mathSymbols.js'
import { EMOJI_CATEGORIES } from './typstEmojis.js'

const TYPST_KEYWORDS = [
  'let', 'set', 'show', 'import', 'include', 'if', 'else', 'for', 'while',
  'break', 'continue', 'return', 'in', 'not', 'and', 'or', 'none', 'auto',
  'true', 'false', 'as', 'context'
]

const TYPST_BUILTINS = [
  'align', 'block', 'box', 'circle', 'columns', 'emph', 'figure', 'grid',
  'heading', 'image', 'link', 'list', 'outline', 'page', 'pagebreak', 'par',
  'place', 'raw', 'rect', 'rotate', 'scale', 'stack', 'strong', 'table', 'text',
  'math', 'calc', 'string', 'int', 'float', 'array', 'dict', 'bytes', 'label',
  'datetime', 'plugin', 'type', 'panic', 'assert', 'eval'
]

const TYPST_MATH_SNIPPETS = []
MATH_SYMBOL_CATEGORIES.concat(EMOJI_CATEGORIES).forEach(cat => {
  cat.symbols.forEach(sym => {
    const match = sym.snippet.match(/^[a-zA-Z_][\w-]*/)
    const id = match ? match[0] : null
    if (id && !TYPST_MATH_SNIPPETS.find(i => i.id === id)) {
      TYPST_MATH_SNIPPETS.push({
        id,
        name: sym.label,
        snippet: sym.snippet,
        description: `Ký hiệu / Toán học: ${sym.label} (${cat.label})`
      })
    }
  })
})

export function registerTypstLanguage(monaco) {
  const alreadyRegistered = monaco.languages.getLanguages().some(language => language.id === 'typst')
  if (!alreadyRegistered) {
    monaco.languages.register({ id: 'typst', extensions: ['.typ'], aliases: ['Typst'] })

    monaco.languages.setMonarchTokensProvider('typst', {
      keywords: TYPST_KEYWORDS,
      builtins: TYPST_BUILTINS,
      tokenizer: {
        root: [
          [/^=+\s.*$/, 'keyword.heading'],
          [/\/\/.*$/, 'comment'],
          [/\/\*/, 'comment', '@comment'],
          [/```[a-zA-Z0-9_-]*\s*$/, 'string', '@rawblock'],
          [/`[^`\n]+`/, 'string'],
          [/\$[^$]+\$/, 'number.math'], 
          [/\$/, 'number.math', '@math'], 
          [/"/, { token: 'string.quote', bracket: '@open', next: '@string' }],
          [/#[a-zA-Z_][\w-]*/, { cases: { '@builtins': 'type', '@keywords': 'keyword', '@default': 'variable' } }],
          [/\b(?:let|set|show|import|include|if|else|for|while|break|continue|return|in|not|and|or|none|auto|true|false|as)\b/, 'keyword'],
          [/[0-9]+(?:\.[0-9]+)?(?:pt|mm|cm|em|%)?/, 'number'],
          [/\*[^*\n]+\*/, 'strong'],
          [/_[^_\n]+_/, 'emphasis'],
        ],
        comment: [
          [/[^/*]+/, 'comment'],
          [/\/\*/, 'comment', '@push'], 
          [/\*\//, 'comment', '@pop'],
          [/[/*]/, 'comment']
        ],
        string: [
          [/[^\\"]+/, 'string'],
          [/\\./, 'string.escape'],
          [/"/, { token: 'string.quote', bracket: '@close', next: '@pop' }]
        ],
        rawblock: [
          [/^```\s*$/, 'string', '@pop'],
          [/./, 'string']
        ],
        math: [
          [/\$/, 'number.math', '@pop'],
          [/[a-zA-Z][\w-]*/, 'variable'],
          [/[0-9]+(?:\.[0-9]+)?/, 'number'],
          [/[^$a-zA-Z0-9]+/, 'number.math']
        ]
      },
    })

    monaco.languages.setLanguageConfiguration('typst', {
      comments: { lineComment: '//', blockComment: ['/*', '*/'] },
      brackets: [['{', '}'], ['[', ']'], ['(', ')']],
      autoClosingPairs: [
        { open: '{', close: '}' }, { open: '[', close: ']' }, { open: '(', close: ')' },
        { open: '"', close: '"' }, { open: '$', close: '$' }, { open: '`', close: '`' }, { open: '*', close: '*' }, { open: '_', close: '_' }
      ],
      surroundingPairs: [
        { open: '{', close: '}' }, { open: '[', close: ']' }, { open: '(', close: ')' },
        { open: '"', close: '"' }, { open: '$', close: '$' }, { open: '`', close: '`' }, { open: '*', close: '*' }, { open: '_', close: '_' }
      ],
      indentationRules: {
        increaseIndentPattern: /^.*(\{[^}]*|\([^)]*|\[[^\]]*)$/,
        decreaseIndentPattern: /^\s*(\}|\)|\]).*$/
      },
      folding: {
        markers: {
          start: new RegExp('^\\s*//\\s*#?region\\b'),
          end: new RegExp('^\\s*//\\s*#?endregion\\b')
        }
      }
    })
    
    monaco.languages.registerFoldingRangeProvider('typst', {
      provideFoldingRanges: function(model) {
        const ranges = []
        const lines = model.getLinesContent()
        const headingStack = []
        
        for (let i = 0; i < lines.length; i++) {
          const line = lines[i]
          const headingMatch = line.match(/^(=+)\s/)
          if (headingMatch) {
            const level = headingMatch[1].length
            while (headingStack.length > 0 && headingStack[headingStack.length - 1].level >= level) {
              const prev = headingStack.pop()
              if (prev.line < i) { 
                ranges.push({ start: prev.line + 1, end: i, kind: monaco.languages.FoldingRangeKind.Region })
              }
            }
            headingStack.push({ level, line: i })
          }
          
          if (line.trim().startsWith('#exam-part')) {
            let j = i + 1
            while (j < lines.length && !lines[j].trim().startsWith('#exam-part') && !lines[j].trim().startsWith('=')) {
              j++
            }
            if (j - 1 > i) {
              ranges.push({ start: i + 1, end: j, kind: monaco.languages.FoldingRangeKind.Region })
            }
          }
        }
        
        while (headingStack.length > 0) {
          const prev = headingStack.pop()
          if (prev.line < lines.length - 1) {
            ranges.push({ start: prev.line + 1, end: lines.length, kind: monaco.languages.FoldingRangeKind.Region })
          }
        }
        
        return ranges
      }
    })
    
    monaco.languages.registerHoverProvider('typst', {
      provideHover: function(model, position) {
        const word = model.getWordAtPosition(position)
        if (!word) return null
        
        const catalogItem = SANG_MATH_CATALOG.find(i => i.id === word.word)
        if (catalogItem) {
          return {
            range: new monaco.Range(position.lineNumber, word.startColumn, position.lineNumber, word.endColumn),
            contents: [
              { value: `**Sang Math** \`#${catalogItem.signature}\`` },
              { value: catalogItem.description },
              { value: `*Gợi ý:* \`${catalogItem.snippet}\`` }
            ]
          }
        }
        
        const mathItem = TYPST_MATH_SNIPPETS.find(i => i.id === word.word)
        if (mathItem) {
          return {
            range: new monaco.Range(position.lineNumber, word.startColumn, position.lineNumber, word.endColumn),
            contents: [
              { value: `**Toán học** \`${mathItem.id}\`` },
              { value: mathItem.description }
            ]
          }
        }
        
        return null
      }
    })
    
    monaco.languages.registerColorProvider('typst', {
      provideDocumentColors(model) {
        const text = model.getValue();
        const colors = [];
        const regex = /rgb\(\s*(?:"|')#?([0-9a-fA-F]{3,8})(?:"|')\s*\)/g;
        let match;
        while ((match = regex.exec(text)) !== null) {
          const hex = match[1];
          let r = 0, g = 0, b = 0, a = 1;
          if (hex.length === 3) {
            r = parseInt(hex[0]+hex[0], 16) / 255;
            g = parseInt(hex[1]+hex[1], 16) / 255;
            b = parseInt(hex[2]+hex[2], 16) / 255;
          } else if (hex.length === 6) {
            r = parseInt(hex.substring(0,2), 16) / 255;
            g = parseInt(hex.substring(2,4), 16) / 255;
            b = parseInt(hex.substring(4,6), 16) / 255;
          } else if (hex.length === 8) {
            r = parseInt(hex.substring(0,2), 16) / 255;
            g = parseInt(hex.substring(2,4), 16) / 255;
            b = parseInt(hex.substring(4,6), 16) / 255;
            a = parseInt(hex.substring(6,8), 16) / 255;
          } else continue;
          
          colors.push({
            color: { red: r, green: g, blue: b, alpha: a },
            range: {
              startLineNumber: model.getPositionAt(match.index).lineNumber,
              startColumn: model.getPositionAt(match.index).column,
              endLineNumber: model.getPositionAt(match.index + match[0].length).lineNumber,
              endColumn: model.getPositionAt(match.index + match[0].length).column
            }
          });
        }
        return colors;
      },
      provideColorPresentations(model, colorInfo) {
        const c = colorInfo.color;
        const toHex = n => Math.round(n * 255).toString(16).padStart(2, '0');
        const hex = `${toHex(c.red)}${toHex(c.green)}${toHex(c.blue)}${c.alpha < 1 ? toHex(c.alpha) : ''}`;
        return [
          { label: `rgb("${hex}")`, textEdit: { range: colorInfo.range, text: `rgb("${hex}")` } }
        ];
      }
    })
  }

  if (!monaco.__conicTypstCompletionRegistered) {
    monaco.__conicTypstCompletionRegistered = true
    monaco.languages.registerCompletionItemProvider('typst', {
      triggerCharacters: ['#', '.', '('],
      provideCompletionItems(model, position) {
        const word = model.getWordUntilPosition(position)
        const lineBeforeCursor = model.getLineContent(position.lineNumber).slice(0, position.column - 1)
        const commandMatch = lineBeforeCursor.match(/#([a-zA-Z][\w-]*)$/)
        const typedCommand = String(commandMatch?.[1] || word.word || '').toLowerCase()
        const source = model.getValue()
        const offset = model.getOffsetAt(position)
        
        let startColumn = commandMatch ? position.column - commandMatch[0].length : word.startColumn
        if (!commandMatch && startColumn > 1) {
          const prefix = model.getValueInRange({
            startLineNumber: position.lineNumber,
            startColumn: startColumn - 1,
            endLineNumber: position.lineNumber,
            endColumn: startColumn,
          })
          if (prefix === '#') startColumn -= 1
        }
        
        const range = {
          startLineNumber: position.lineNumber,
          startColumn,
          endLineNumber: position.lineNumber,
          endColumn: word.endColumn,
        }

        const suggestions = []

        SANG_MATH_CATALOG.forEach((item, index) => {
          const directQuestion = ['tn', 'ds', 'tln', 'tl'].includes(item.id)
          const commonPriority = { tn: '00', ds: '01', tln: '02', tl: '03', 'exam-part': '04' }[item.id]
          suggestions.push({
            label: directQuestion ? { label: `#${item.id}`, description: item.name } : item.name,
            filterText: `${item.signature} ${item.id} ${item.name}`,
            kind: monaco.languages.CompletionItemKind.Snippet,
            detail: `Sang Math · ${item.signature}`,
            documentation: { value: `**${item.description}**\n\nCú pháp được chèn theo đúng ngữ cảnh của tệp hiện tại.` },
            insertText: contextualSnippetText(item, source, offset),
            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            range,
            preselect: item.id === typedCommand,
            sortText: item.id === typedCommand ? '0-exact' : commonPriority ? `1-${commonPriority}` : `2-${String(index).padStart(3, '0')}`,
          })
        })
        
        if (typedCommand || commandMatch) {
          const coreSnippets = [
            { id: 'let', snippet: 'let ${1:name} = ${2:value}' },
            { id: 'set', snippet: 'set ${1:rule}(${2:params})' },
            { id: 'show', snippet: 'show ${1:selector}: ${2:body}' },
            { id: 'import', snippet: 'import "${1:module}": ${2:*}' },
            { id: 'include', snippet: 'include "${1:file.typ}"' },
            { id: 'if', snippet: 'if ${1:condition} {\n\t${2:body}\n}' },
            { id: 'for', snippet: 'for ${1:item} in ${2:array} {\n\t${3:body}\n}' },
          ]
          coreSnippets.forEach(item => {
            suggestions.push({
              label: `#${item.id}`,
              filterText: item.id,
              kind: monaco.languages.CompletionItemKind.Keyword,
              detail: `Typst Keyword`,
              insertText: (commandMatch ? '' : '#') + item.snippet,
              insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
              range,
              sortText: `3-${item.id}`
            })
          })
        }

        TYPST_MATH_SNIPPETS.forEach(item => {
          suggestions.push({
            label: item.id,
            filterText: item.id,
            kind: monaco.languages.CompletionItemKind.Function,
            detail: item.name,
            documentation: { value: item.description },
            insertText: item.snippet,
            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            range,
            sortText: `4-${item.id}`
          })
        })

        return { suggestions }
      },
    })
  }
}
