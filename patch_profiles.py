with open("sang-math-omr/js/omr_profiles.js", "r") as f:
    content = f.read()

if "'a3-cat-phach'" not in content:
    content = content.replace(
        "    '12-4-6ngang': { id: '12-4-6ngang'",
        "    'a3-cat-phach': { id: 'a3-cat-phach', name: 'A3 Cắt Phách', mcq: 12, tf: 2, tln: 4, paper: 'a3', version: 2 },\n    '12-4-6ngang': { id: '12-4-6ngang'",
        1
    )
    with open("sang-math-omr/js/omr_profiles.js", "w") as f:
        f.write(content)
    print("Patched omr_profiles.js")
else:
    print("Already patched")
