def restore(filepath):
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.read().split('\n')
        for i, line in enumerate(lines):
            if '- loigiai: [' in line:
                lines[i] = line.replace('- loigiai: [', '  loigiai: [')
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))
    except Exception as e:
        print(e)
restore('de03A.typ')
restore('de02A.typ')
