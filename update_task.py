with open("/Users/admin/.gemini/antigravity-ide/brain/bae4b825-805c-4d8d-810d-6792423200b7/task.md", "r") as f:
    content = f.read()

content = content.replace("`[ ]` Đề 1", "`[x]` Đề 1")
content = content.replace("`[ ]` Đề 2", "`[x]` Đề 2")
content = content.replace("`[ ]` Đề 3", "`[x]` Đề 3")
content = content.replace("`[ ]` Đề 4", "`[x]` Đề 4")
content = content.replace("`[ ]` Đề 5", "`[x]` Đề 5")
content = content.replace("`[ ]` Đề 6", "`[x]` Đề 6")
content = content.replace("`[/]` Xóa các câu hỏi logic", "`[x]` Xóa các câu hỏi logic")
content = content.replace("`[ ]` Sinh mới hoàn toàn Đề 7.", "`[/]` Sinh mới hoàn toàn Đề 7.")

with open("/Users/admin/.gemini/antigravity-ide/brain/bae4b825-805c-4d8d-810d-6792423200b7/task.md", "w") as f:
    f.write(content)
