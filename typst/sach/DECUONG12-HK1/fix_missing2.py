import os
import re
import glob

base_dir = "/Users/admin/conictypst/typst/sach/DECUONG12-HK1"
chapters = ["chuong-01", "chuong-02", "chuong-03"]

for chapter in chapters:
    chap_dir = os.path.join(base_dir, chapter)
    typ_files = glob.glob(os.path.join(chap_dir, "bai*.typ"))
    for filepath in typ_files:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # We need to find #tn( ... ) or #ds( ... )
        # and ensure they have True( in the options list.
        # It's tricky to parse. Let's rely on the previous check_missing.py logic!
        pass
