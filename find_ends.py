def find_example_3_ends():
    with open("typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
        content = f.read()

    import re
    pattern = r'#example-box\(n:\s*"3 \(Khó - Giải bằng 2 cách\)"\)\['
    matches = list(re.finditer(pattern, content))
    print(f"Found {len(matches)} matches.")
    
    for idx, match in enumerate(matches):
        start_idx = match.start()
        # Find matching bracket
        bracket_count = 1
        curr_idx = match.end()
        while bracket_count > 0 and curr_idx < len(content):
            char = content[curr_idx]
            if char == '[':
                bracket_count += 1
            elif char == ']':
                bracket_count -= 1
            curr_idx += 1
        
        end_idx = curr_idx
        # Print lines around the end
        snippet = content[end_idx-50:end_idx+50]
        print(f"Match {idx+1}: starts at {start_idx}, ends at {end_idx}. Snippet: {repr(snippet)}")

if __name__ == "__main__":
    find_example_3_ends()
