import os
import unicodedata

exams_dir = "/Users/admin/conictypst/typst/exams"
files_on_disk = os.listdir(exams_dir)

# Normalize all disk filenames to NFC and NFD
disk_nfc = {unicodedata.normalize('NFC', f): f for f in files_on_disk}
disk_nfd = {unicodedata.normalize('NFD', f): f for f in files_on_disk}

target_key = "Xác-Suât-Đối Kháng.typ"
target_nfc = unicodedata.normalize('NFC', target_key)
target_nfd = unicodedata.normalize('NFD', target_key)

print(f"Target NFC: {repr(target_nfc)}")
print(f"Target NFD: {repr(target_nfd)}")

print("\nMatching in disk NFC keys:")
for k in disk_nfc:
    if "Đối Kháng" in k or "Đối Kháng" in k or "Kháng" in k or "Kháng" in k:
        print(f"Disk NFC: {repr(k)} -> Original: {repr(disk_nfc[k])}")

print("\nMatching in disk NFD keys:")
for k in disk_nfd:
    if "Đối Kháng" in k or "Đối Kháng" in k or "Kháng" in k or "Kháng" in k:
        print(f"Disk NFD: {repr(k)} -> Original: {repr(disk_nfd[k])}")
