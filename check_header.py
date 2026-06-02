from app import _typst_extract_header_info

sample_content = """#set document(title: "Synthetic Test Title", author: "Synthetic Author")
#let project(title: "", authors: (), body) = {
  set document(author: authors, title: title)
  body
}
#show: project.with(
  title: "Synthetic Project Title",
  authors: ("Synthetic Project Author",),
)
"""

result = _typst_extract_header_info(sample_content)
print(result)
