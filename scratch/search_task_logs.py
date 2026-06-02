import os

files = [
    "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/tasks/task-272.log",
    "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/tasks/task-238.log"
]

target = "Bảng tính toán đóng góp chi tiết"
out_path = "/Users/admin/conictypst/scratch/restored_from_task_log.txt"

found = False

for path in files:
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
            if target in content:
                print(f"Found target in {path}")
                pos = content.find(target)
                # print 3000 chars after the target
                snippet = content[pos:pos+3000]
                with open(out_path, "w", encoding="utf-8") as out:
                    out.write(snippet)
                print("Saved snippet to", out_path)
                found = True
                break

if not found:
    print("Could not find target in task logs.")
