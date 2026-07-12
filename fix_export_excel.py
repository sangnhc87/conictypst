with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# Let's find both exportExcel functions and remove the first one.
start_idx1 = html.find('function exportExcel() {')
start_idx2 = html.find('function exportExcel() {', start_idx1 + 1)

if start_idx1 != -1 and start_idx2 != -1:
    # Find the end of the first exportExcel function
    # Assuming it ends before `function parseMst(raw)` or similar
    end_idx1 = html.find('function', start_idx1 + 1)
    # Actually it's safer to remove the SECOND one, which might be inside the block I injected? No, both are in the script.
    # Let's remove the first one using a very specific cut.
    # Wait, the first one goes from line 16610 to somewhere.
    # We can just split by lines and filter.
    lines = html.split('\n')
    out_lines = []
    in_dup_export = False
    brace_count = 0
    export_count = 0
    for line in lines:
        if 'function exportExcel() {' in line:
            export_count += 1
            if export_count == 1:
                in_dup_export = True
                brace_count = line.count('{') - line.count('}')
                continue
        if in_dup_export:
            brace_count += line.count('{')
            brace_count -= line.count('}')
            if brace_count <= 0:
                in_dup_export = False
            continue
        out_lines.append(line)
    
    with open('sang-math-omr/index.html', 'w') as f:
        f.write('\n'.join(out_lines))

