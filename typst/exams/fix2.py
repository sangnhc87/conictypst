with open("gen_mulogarit_detailed_solutions.py", "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace('{rt}', '{r t}')
text = text.replace('{kt}', '{k t}')
text = text.replace('{-kt}', '{-k t}')
text = text.replace('^14"C"', '""^14"C"')
text = text.replace('^circ C', 'degree "C"')
text = text.replace('^circ "C"', 'degree "C"')

with open("gen_mulogarit_detailed_solutions.py", "w", encoding="utf-8") as f:
    f.write(text)
