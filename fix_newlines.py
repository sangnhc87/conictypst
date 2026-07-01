import glob

for f in glob.glob("typst/**/*.typ", recursive=True):
    try:
        with open(f, 'r', encoding='utf-8') as file:
            content = file.read()
        if r'\n' in content:
            content = content.replace(r'\n', '\n')
            with open(f, 'w', encoding='utf-8') as file:
                file.write(content)
    except Exception as e:
        print(f"Skipping {f}: {e}")
