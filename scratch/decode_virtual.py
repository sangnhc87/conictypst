import re
import json

path = "/Users/admin/conictypst/scratch/reconstructed_virtual.typ"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# We look for substrings that start with " and end with " (potentially spanning multiple lines, or containing \n)
# Since the escaped string has literal \n and \", let's find them.
# An escaped string in python/JSON starts with " and ends with " and doesn't have unescaped newlines.
# But here, it might have been written across lines or have actual newlines too.
# Let's see: in line 2520:
# 2520: "    Tính toán liên tiếp theo khối 3 bước:\n    - Với $n=1$ ($1 equiv 1 mod 3$): $a_1 = a_0+c_0 = 1$; $b_1 = 1$; $c_1 = 0$.\n    - Với $n=2$ ($2 equiv 2 mod 3$): $a_2 = a_1+b_1 = 2$; $b_2 = 1$; $c_2 = 1$.\n    - Với $n=3$ ($3 equiv 0 mod 3$): $a_3 = 2 a_2 = 4$; $b_3 = 2$; $c_3 = 2$.\n    Bằng phương pháp quy nạp toán học, ta suy ra công thức nghiệm tổng quát cho $a_n$ (số tập con có tổng chia hết cho 3):\n    - Nếu $n = 3m$: $a_n = frac(1, 3) (2^(3m) + 2 dot 2^m) = frac(1, 3) (2^n + 2^(n/3 + 1))$.\n    - Nếu $n = 3m+1$: $a_n = frac(1, 3) (2^(3m+1) + 2^m) = frac(1, 3) (2^n + 2^((n-1)/3))$.\n    - Nếu $n = 3m+2$: $a_n = frac(1, 3) (2^(3m+2) + 2^(m+1)) = frac(1, 3) (2^n + 2^((n-2)/3 + 1)) = frac(1, 3) (2^n + 2^((n+1)/3))$.\n \n    *Cách 2 (Sử dụng hàm sinh và kỹ thuật lọc căn đơn vị - Roots of unity filter):*\n    Hàm sinh cho tổng các phần tử của tập con của $S$ là:\n    $ f(x) = product_(j=1)^n (1 + x^j) $\n    Hệ số của $x^k$ trong khai triển của $f(x)$ chính là số tập con của $S$ có tổng các phần tử bằng $k$. Ta cần tính tổng các hệ số của $x^k$ với $k equiv 0 mod 3$."

# Let's find any occurrences of double-quoted strings that contain "\n" (literal backslash n) and replace them with their decoded counterparts.
# We can find them using a regex that matches " ... " where the content has \n.
# Let's do a regex search for: "([^"]*?\\n[^"]*?)"
# Wait, let's write a python function to find and decode JSON-encoded substrings.

def decode_escaped_strings(text):
    # Regex to match a JSON string: starts with ", ends with " (with possible escaped quotes inside)
    # pattern: "([^"\\]*(?:\\.[^"\\]*)*)"
    pattern = r'"([^"\\]*(?:\\.[^"\\]*)*)"'
    
    def repl(match):
        full_match = match.group(0)
        # Try to parse it as a JSON string
        try:
            decoded = json.loads(full_match)
            print(f"Decoded successfully: {full_match[:50]}...")
            return decoded
        except Exception as e:
            # If it's not valid JSON, leave it as is
            return full_match
            
    return re.sub(pattern, repl, text)

decoded_content = decode_escaped_strings(content)

# Also let's check for literal \n (backslash n) in the text outside quotes, just in case.
# Wait, if there are literal \n, let's look at lines 2011 and 2020:
# 2011: "    Sử dụng kỹ thuật lọc căn đơn vị với $epsilon = e^(i 2 pi / 9)$ (căn bậc 9 của đơn vị):\n ... "
# Yes, they also have quotes and \n!
# Let's save the decoded content.
with open(path, "w", encoding="utf-8") as f:
    f.write(decoded_content)

print("Decoding complete.")
