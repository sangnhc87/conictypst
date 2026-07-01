import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Fix lt-tn
content = re.sub(
    r'(#let lt-tn.*?)context \{\s+let s = _lec-style\.get\(\)\s+(let q-n.*?)\s+slide\(title: none\)\[\s+// Header\s+(#grid[\s\S]*?)// Lời giải \(\S+\)\s+#if loigiai != none \{\s+pause\s+(v\(0\.3em\)\s+block[\s\S]*?)\}\s+\]\s+\}',
    r'''\1slide(title: none)[
    #context {
      let s = _lec-style.get()
      \2
      // Header
      \3
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        \4
      }
    }
  ]
}''',
    content, flags=re.DOTALL
)

# Fix lt-ds
content = re.sub(
    r'(#let lt-ds.*?)context \{\s+let s = _lec-style\.get\(\)\s+(let q-n.*?)\s+slide\(title: none\)\[\s+(#grid[\s\S]*?)\s+#for \(i, stmt\) in statements\.enumerate\(\) \{([\s\S]*?)(grid\([\s\S]*?)(?:below: 6pt,\s*)([\s\S]*?)\)\s+\}\s+#if loigiai != none \{\s+pause\s+(v\(0\.2em\)\s+block[\s\S]*?)\}\s+\]\s+\}',
    r'''\1slide(title: none)[
    #context {
      let s = _lec-style.get()
      \2
      \3
      for (i, stmt) in statements.enumerate() {
        \4
        block(below: 6pt)[
          \5
          \6
          )
        ]
      }
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        \7
      }
    }
  ]
}''',
    content, flags=re.DOTALL
)

# Fix lt-tln
content = re.sub(
    r'(#let lt-tln.*?)context \{\s+let s = _lec-style\.get\(\)\s+(let q-n.*?)\s+slide\(title: none\)\[\s+(#grid[\s\S]*?)\s+#pause\s+(#align[\s\S]*?)\s+#if loigiai != none \{\s+pause\s+(v\(0\.3em\)\s+block[\s\S]*?)\}\s+\]\s+\}',
    r'''\1slide(title: none)[
    #context {
      let s = _lec-style.get()
      \2
      \3
    }
    #pause
    #context {
      let s = _lec-style.get()
      \4
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        \5
      }
    }
  ]
}''',
    content, flags=re.DOTALL
)

with open("typst/giao-an/modules/lecture-beamer.typ", "w", encoding="utf-8") as f:
    f.write(content)

print("Touying bugs fixed.")
