import unicodedata

filepath = "/Users/admin/conictypst/scratch/generate_cleaned_includes.py"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# The target NFD filename on disk is 'Xác-Suât-XTổng-Đối Kháng.typ'
# The key currently in generate_cleaned_includes.py is 'Xác-Suât-Đối Kháng.typ'
old_key = unicodedata.normalize('NFD', 'Xác-Suât-Đối Kháng.typ')
new_key = unicodedata.normalize('NFD', 'Xác-Suât-XTổng-Đối Kháng.typ')

print(f"Old key: {repr(old_key)}")
print(f"New key: {repr(new_key)}")

if old_key in content:
    content = content.replace(old_key, new_key)
    print("Key replaced successfully!")
else:
    # Let's try raw replacement just in case of different normalizations in Python source
    # We can match by NFC or NFD
    old_key_nfc = unicodedata.normalize('NFC', old_key)
    new_key_nfc = unicodedata.normalize('NFC', new_key)
    if old_key_nfc in content:
        content = content.replace(old_key_nfc, new_key_nfc)
        print("Key (NFC) replaced successfully!")
    else:
        # Fallback to direct substring replacement
        content = content.replace("Xác-Suât-Đối Kháng.typ", "Xác-Suât-XTổng-Đối Kháng.typ")
        print("Fallback replacement done!")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)
