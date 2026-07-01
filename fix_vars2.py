import re
import glob

files = glob.glob('typst/giao-an/**/*.typ', recursive=True)

for f in files:
    if "modules" in f: continue
    
    with open(f, 'r') as file:
        content = file.read()
        
    # Replace LaTeX-style backslash macros that might be in the files
    # Only replace if they are actually used
    content = re.sub(r'\\cdot\b', 'dot', content)
    content = re.sub(r'\bcdot\b', 'dot', content)
    content = re.sub(r'\\circ\b', 'degree', content)
    content = re.sub(r'\bcirc\b', 'degree', content)
    content = re.sub(r'\\setminus\b', 'without', content)
    content = re.sub(r'\bsetminus\b', 'without', content)
    content = re.sub(r'\bsect\b', 'inter', content)
    content = re.sub(r'\\sect\b', 'inter', content)
    
    # Fix the \overrightarrow issue (usually it should just be vec)
    content = re.sub(r'\\overrightarrow\s*\{([^}]+)\}', r'vec(\1)', content)
    content = re.sub(r'\boverrightarrow\s*\{([^}]+)\}', r'vec(\1)', content)
    
    # Fix overline( \( ... \) ) to overline( ( ... ) )
    content = re.sub(r'overline\(\s*\\\((.*?)\\\)\s*\)', r'overline((\1))', content)
    
    # ABC and OB variables in khoi-10
    content = re.sub(r'\bABC\b', '"ABC"', content)
    content = re.sub(r'\bOB\b', '"OB"', content)
    content = re.sub(r'\bOA\b', '"OA"', content)
    content = re.sub(r'\bCB\b', '"CB"', content)

    # Some variables like og might be from \log or log
    content = re.sub(r'\\log\b', 'log', content)
    content = re.sub(r'\bog\b', 'log', content) # if it became og somehow
    
    with open(f, 'w') as file:
        file.write(content)
