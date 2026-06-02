target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace LaTeX \text{...} with Typst "..." in math mode
content = content.replace(r'\text{với }', ' "với " ')
content = content.replace(r'\text{ và }', ' " và " ')
content = content.replace(r'\text{với}', ' "với" ')
content = content.replace(r'\text{và}', ' "và" ')
content = content.replace(r'\text', ' ') # fallback

# Remove \quad, \Big, \Big[, \Big]
content = content.replace(r'\quad', ' ')
content = content.replace(r'\Big[', ' [ ')
content = content.replace(r'\Big]', ' ] ')
content = content.replace(r'\Big', ' ')

# Fix the specific lines from the compiler error
content = content.replace(r'(\text{với } b >= 2 \text{ và } a, c >= 0)', r'("với " b >= 2 " và " a, c >= 0)')
content = content.replace(r'(\text{với } b, c >= 2 \text{ và } a, d >= 0)', r'("với " b, c >= 2 " và " a, d >= 0)')
content = content.replace(r'(\text{với } y_i >= 0)', r'("với " y_i >= 0)')

# Clean up any remaining double backslashes in math blocks that might cause errors if they are not meant to be newlines
# Typst uses \ for newline in math.
# Let's check for "ext" and replace it if it was corrupted
content = content.replace(r'\ext', ' ')
content = content.replace(' ext ', ' ')

with open(target_file, 'w') as f:
    f.write(content)

print("Text in math cleaned up successfully!")
