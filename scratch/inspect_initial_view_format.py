with open("/Users/admin/conictypst/scratch/initial_view.txt", "r", encoding="utf-8") as f:
    lines = f.readlines()
for l in lines[:20]:
    print(repr(l))
