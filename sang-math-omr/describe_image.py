import sys
import base64
import json
import urllib.request
import os

api_key = os.environ.get("GEMINI_API_KEY", "")
if not api_key:
    # Try to find a key or just say we can't
    print("No GEMINI_API_KEY found.")
    sys.exit(0)

image_path = sys.argv[1]
with open(image_path, "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read()).decode('utf-8')

url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key={api_key}"
data = {
    "contents": [
        {
            "parts": [
                {"text": "Describe this OMR template layout in detail. How are the questions arranged? How many columns? How are the bubbles (Đ, S or numbers) laid out for each question? Is it compact? How many questions in one row?"},
                {
                    "inline_data": {
                        "mime_type": "image/png",
                        "data": encoded_string
                    }
                }
            ]
        }
    ]
}

req = urllib.request.Request(url, data=json.dumps(data).encode('utf-8'), headers={'Content-Type': 'application/json'})
try:
    with urllib.request.urlopen(req) as response:
        result = json.loads(response.read().decode())
        print(result['candidates'][0]['content']['parts'][0]['text'])
except Exception as e:
    print(f"Error: {e}")
