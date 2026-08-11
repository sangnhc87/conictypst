const A4_WIDTH_TWIPS = 11906
const A4_HEIGHT_TWIPS = 16838
const PAGE_MARGIN_TWIPS = 360
const MAX_IMAGE_WIDTH_PX = 746
const MAX_IMAGE_HEIGHT_PX = 1060

function canvasToBlob(canvas) {
  return new Promise((resolve, reject) => {
    canvas.toBlob(blob => {
      if (blob) resolve(blob)
      else reject(new Error('Không đọc được trang preview để đưa vào Word'))
    }, 'image/png')
  })
}

export async function createRenderedDocx(canvases, title = 'Tài liệu Typst') {
  if (!canvases?.length) throw new Error('Preview chưa có trang để xuất Word')
  const {
    AlignmentType,
    Document,
    ImageRun,
    Packer,
    Paragraph,
  } = await import('docx')

  const children = []
  for (let index = 0; index < canvases.length; index += 1) {
    const canvas = canvases[index]
    const blob = await canvasToBlob(canvas)
    const bytes = new Uint8Array(await blob.arrayBuffer())
    const scale = Math.min(
      1,
      MAX_IMAGE_WIDTH_PX / Math.max(1, canvas.width),
      MAX_IMAGE_HEIGHT_PX / Math.max(1, canvas.height),
    )
    children.push(new Paragraph({
      pageBreakBefore: index > 0,
      alignment: AlignmentType.CENTER,
      spacing: { before: 0, after: 0, line: 240 },
      children: [new ImageRun({
        data: bytes,
        type: 'png',
        transformation: {
          width: Math.max(1, Math.round(canvas.width * scale)),
          height: Math.max(1, Math.round(canvas.height * scale)),
        },
        altText: {
          title: `${title} — trang ${index + 1}`,
          description: `Trang ${index + 1} được kết xuất từ TypstConicHub`,
          name: `typst-page-${index + 1}.png`,
        },
      })],
    }))
  }

  const document = new Document({
    title,
    description: 'Tài liệu được kết xuất cục bộ bằng TypstConicHub',
    sections: [{
      properties: {
        page: {
          size: { width: A4_WIDTH_TWIPS, height: A4_HEIGHT_TWIPS },
          margin: {
            top: PAGE_MARGIN_TWIPS,
            right: PAGE_MARGIN_TWIPS,
            bottom: PAGE_MARGIN_TWIPS,
            left: PAGE_MARGIN_TWIPS,
          },
        },
      },
      children,
    }],
  })
  return Packer.toBlob(document)
}
