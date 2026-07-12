import os
import subprocess
import time
import urllib.request
import urllib.parse
import urllib.error
import json
import ssl
import base64
from pathlib import Path

# Manual dotenv parser to avoid dependencies
def load_env():
    env_path = Path('.env')
    if env_path.exists():
        with open(env_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    if '=' in line:
                        key, val = line.split('=', 1)
                        key = key.strip()
                        val = val.strip().strip("'").strip('"')
                        os.environ[key] = val

load_env()

def generate_edge_tts(text, output_path, voice="vi-VN-NamMinhNeural"):
    """Sử dụng Edge-TTS qua dòng lệnh"""
    safe_text = text.replace("'", "'\\''")
    cmd = f"python3 -m edge_tts --voice {voice} --text '{safe_text}' --write-media {output_path}"
    res = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if res.returncode != 0:
        raise Exception(f"Edge TTS Error: {res.stderr}")

def generate_fpt_tts(text, output_path, voice="minhquang"):
    """
    Sử dụng FPT.AI TTS.
    voice: minhquang (Nam miền Nam), banmai (Nữ miền Bắc), etc.
    """
    # Fix cho loi SSL tren macOS
    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE

    api_key = os.environ.get("FPT_API_KEY")
    if not api_key:
        raise ValueError("Missing FPT_API_KEY in .env file")
        
    url = "https://api.fpt.ai/hmi/tts/v5"
    headers = {
        "api-key": api_key,
        "voice": voice,
        "Content-Type": "application/x-www-form-urlencoded"
    }
    
    # 1. Gửi request để lấy link âm thanh
    data = text.encode('utf-8')
    req = urllib.request.Request(url, data=data, headers=headers, method="POST")
    try:
        with urllib.request.urlopen(req, context=ctx) as response:
            res_body = response.read().decode('utf-8')
            res_json = json.loads(res_body)
            if res_json.get("error") != 0:
                raise Exception(f"FPT API Error: {res_json.get('message')}")
            audio_url = res_json.get("async")
    except urllib.error.HTTPError as e:
        raise Exception(f"FPT API HTTP Error: {e.code} - {e.read().decode('utf-8')}")

    # 2. Polling chờ file âm thanh sẵn sàng
    max_retries = 15
    for _ in range(max_retries):
        time.sleep(1.5)
        try:
            req_audio = urllib.request.Request(audio_url, headers={"api-key": api_key})
            with urllib.request.urlopen(req_audio, context=ctx) as response:
                with open(output_path, 'wb') as f:
                    f.write(response.read())
            return
        except urllib.error.HTTPError as e:
            if e.code == 404:
                continue # Chưa gen xong, thử lại
            else:
                raise Exception(f"FPT Audio download failed: {e.code}")
    raise Exception("FPT TTS Timeout: Cannot download audio after 15 seconds")

def generate_gcp_tts(text, output_path, voice="vi-VN-Standard-B"):
    """
    Sử dụng Google Cloud TTS.
    voice: vi-VN-Standard-B, vi-VN-Standard-D, vi-VN-Wavenet-B (Nam), v.v.
    """
    # Fix cho loi SSL tren macOS
    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE

    api_key = os.environ.get("GCP_API_KEY")
    if not api_key:
        raise ValueError("Missing GCP_API_KEY in .env file")

    url = f"https://texttospeech.googleapis.com/v1/text:synthesize?key={api_key}"
    data = {
        "input": {"text": text},
        "voice": {"languageCode": "vi-VN", "name": voice},
        "audioConfig": {"audioEncoding": "MP3"}
    }
    
    req = urllib.request.Request(url, data=json.dumps(data).encode('utf-8'), headers={"Content-Type": "application/json"}, method="POST")
    try:
        with urllib.request.urlopen(req, context=ctx) as response:
            res_body = response.read().decode('utf-8')
            res_json = json.loads(res_body)
            audio_content = res_json.get("audioContent")
            if audio_content:
                with open(output_path, 'wb') as f:
                    f.write(base64.b64decode(audio_content))
            else:
                raise Exception("No audioContent in GCP response")
    except urllib.error.HTTPError as e:
        raise Exception(f"GCP API HTTP Error: {e.code} - {e.read().decode('utf-8')}")

def generate_audio(text, output_path, engine="edge", voice=None):
    """Router function to call the appropriate TTS engine"""
    if engine == "edge":
        v = voice if voice else "vi-VN-NamMinhNeural"
        generate_edge_tts(text, output_path, voice=v)
    elif engine == "fpt":
        v = voice if voice else "minhquang"
        generate_fpt_tts(text, output_path, voice=v)
    elif engine == "gcp":
        v = voice if voice else "vi-VN-Standard-B"
        generate_gcp_tts(text, output_path, voice=v)
    else:
        raise ValueError(f"Unknown TTS engine: {engine}")
