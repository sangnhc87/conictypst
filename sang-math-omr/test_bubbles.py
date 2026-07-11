import json

with open("bubbles_a4.json", "r") as f:
    bubbles = json.load(f)

print(f"Total bubbles: {len(bubbles)}")

# Filter out bubbles that might belong to the QR code or text
filtered = [b for b in bubbles if b[1] > 200]
print(f"Bubbles with y > 200: {len(filtered)}")

# Filter out dots from the dotted line in Tự Luận
# Tự luận starts at a larger Y value. Wait, A4 is 2120 tall. Tự Luận might be y > 1200.
filtered2 = [b for b in filtered if b[1] < 1200]
print(f"Bubbles with 200 < y < 1200: {len(filtered2)}")
