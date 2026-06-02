import pypdf

reader = pypdf.PdfReader("/Users/admin/conictypst/typst/exams/CD-TongHop-TatCa-ChuyenDe.pdf")
print("Total Pages:", len(reader.pages))
print("PDF Version:", reader.pdf_header)
