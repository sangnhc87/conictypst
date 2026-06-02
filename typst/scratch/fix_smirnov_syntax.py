target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace the bold markdown syntax and Den math variable
old_line_1 = r"Do đó, để **có đúng 2 viên bi phát sáng**, điều kiện bắt buộc là phải có **đúng 1 khối cùng màu có độ dài bằng 2**, còn tất cả các viên bi khác của mọi màu đều đứng cô lập"
new_line_1 = r"Do đó, để *có đúng 2 viên bi phát sáng*, điều kiện bắt buộc là phải có *đúng 1 khối cùng màu có độ dài bằng 2*, còn tất cả các viên bi khác của mọi màu đều đứng cô lập"

old_line_2 = r"Giả sử ta xếp 8 chữ $D$ (Đỏ), 5 chữ $X$ (Xanh) và 3 chữ $Den$ (Đen)."
new_line_2 = r"Giả sử ta xếp 8 chữ $D$ (Đỏ), 5 chữ $X$ (Xanh) và 3 chữ \"Den\" (Đen)."

if old_line_1 in content:
    content = content.replace(old_line_1, new_line_1)
    print("Fixed bold formatting warning.")
else:
    print("Target line 1 not found.")

if old_line_2 in content:
    content = content.replace(old_line_2, new_line_2)
    print("Fixed Den variable error.")
else:
    print("Target line 2 not found.")

with open(target_file, 'w') as f:
    f.write(content)

print("Syntax fix complete!")
