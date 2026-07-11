import sys

with open('omr_sheet_a4.typ', 'r') as f:
    content = f.read()

# Import QR code
content = '#import "@preview/cades:0.3.1": qr-code\n' + content

# Add QR to info-phan1-box
target_info = '#align(center)[#text(size: 11pt, weight: "bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]]'
replacement_info = '#place(top + right, dx: 0pt, dy: -2pt)[#qr-code("TEMPLATE:A4_TULUAN", width: 1cm)]\n            #align(center)[#text(size: 11pt, weight: "bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]]'
content = content.replace(target_info, replacement_info)

# Add "Phần Tự Luận" at the end, right before the scale block closes.
target_end = '    )\n  ]\n]'

tuluan_box = '''    )
    
    #v(5pt)
    #let tuluan-box = block(
      stroke: 0.8pt + black,
      width: 100%,
      height: 120mm,
      [
        #block(inset: 4pt, [*PHẦN TỰ LUẬN*])
        #line(length: 100%, stroke: 0.8pt)
        #block(
          inset: 10pt,
          [
            // Dot lines
            #for i in range(18) {
              line(length: 100%, stroke: 0.5pt + luma(150), start: (0pt, i * 6mm), end: (100%, i * 6mm))
            }
          ]
        )
      ]
    )
    #tuluan-box
  ]
]'''

content = content.replace(target_end, tuluan_box)

with open('omr_sheet_a4.typ', 'w') as f:
    f.write(content)
