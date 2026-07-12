import os
import sys
import subprocess
import shutil
from pathlib import Path

def run_command(cmd, desc):
    print(f"[*] {desc}...")
    res = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"[!] Error during {desc}:\n{res.stderr}")
        sys.exit(1)
    return res.stdout

import argparse

def main():
    parser = argparse.ArgumentParser(description="Convert Typst presentation to video with TTS")
    parser.add_argument("input_typ", help="Input Typst file (.typ)")
    parser.add_argument("script_txt", nargs='?', help="Input TTS script file (.txt) (optional, auto-generates if missing)")
    parser.add_argument("output_mp4", nargs='?', help="Output MP4 file (optional)")
    parser.add_argument("--voice", "-v", default=None, help="TTS voice to use (default depends on engine)")
    parser.add_argument("--tts-engine", "-e", default="edge", choices=["edge", "fpt", "gcp"], help="TTS engine to use (default: edge)")
    args = parser.parse_args()

    typ_file = Path(args.input_typ).resolve()
    
    if args.script_txt:
        txt_file = Path(args.script_txt).resolve()
    else:
        txt_file = typ_file.with_suffix('.txt')
    
    if args.output_mp4:
        out_file = Path(args.output_mp4).resolve()
    else:
        out_file = typ_file.with_suffix('.mp4')

    if not typ_file.exists():
        print(f"[!] File not found: {typ_file}")
        sys.exit(1)
    
    if not txt_file.exists() and not args.script_txt:
        print(f"[*] Script file {txt_file.name} not found. Auto-generating using math_to_speech...")
        try:
            sys.path.append(str(Path(__file__).parent))
            import math_to_speech
            import tts_engines
            with open(typ_file, 'r', encoding='utf-8') as f:
                content = f.read()
            script_lines = math_to_speech.extract_touying_script(content)
            with open(txt_file, 'w', encoding='utf-8') as f:
                for line in script_lines:
                    f.write(line + '\n')
            print(f"[*] Auto-generated {len(script_lines)} lines of TTS script.")
        except Exception as e:
            print(f"[!] Failed to auto-generate script: {e}")
            sys.exit(1)
            
    if not txt_file.exists():
        print(f"[!] File not found: {txt_file}")
        sys.exit(1)

    work_dir = typ_file.parent / ".touying_tmp"
    if work_dir.exists():
        shutil.rmtree(work_dir)
    work_dir.mkdir(parents=True)

    pdf_file = work_dir / "presentation.pdf"

    # 1. Compile Typst
    # Try compiling with root set to project base if it exists
    project_root = "/Users/admin/conictypst"
    run_command(f"typst compile --root {project_root} {typ_file} {pdf_file}", "Compiling Typst to PDF")

    # 2. Extract PDF to Images
    run_command(f"pdftoppm -png {pdf_file} {work_dir}/slide", "Extracting PDF pages to images")

    # pdftoppm outputs files like slide-1.png or slide-01.png
    images = sorted(list(work_dir.glob("slide-*.png")))
    num_pages = len(images)
    print(f"[*] Extracted {num_pages} pages.")

    # 3. Read TTS script
    with open(txt_file, "r", encoding="utf-8") as f:
        lines = [line.strip() for line in f if not line.strip().startswith("//")]
    
    # We map lines to pages. If lines < num_pages, pad with empty strings.
    while len(lines) < num_pages:
        lines.append("")

    voice = args.voice
    engine = args.tts_engine
    
    # Import tts_engines globally now
    sys.path.append(str(Path(__file__).parent))
    import tts_engines
    
    clips = []
    
    # 4. Generate TTS and Combine
    for i, img in enumerate(images):
        page_num = i + 1
        text = lines[i]
        clip_path = work_dir / f"clip_{page_num:03d}.mp4"
        
        print(f"[*] Processing slide {page_num}/{num_pages}...")
        
        if text:
            # Generate Audio
            audio_path = work_dir / f"audio_{page_num:03d}.mp3"
            
            try:
                tts_engines.generate_audio(text, audio_path, engine=engine, voice=voice)
            except Exception as e:
                print(f"[!] {e}")
                sys.exit(1)
            
            # Combine Image and Audio
            # We add a slight padding to the audio so it doesn't cut off abruptly
            # -shortest will end the video when the audio ends
            # scale=-2:1080 ensures width is even (required by x264)
            ffmpeg_cmd = (
                f"ffmpeg -y -loop 1 -framerate 30 -i {img} -i {audio_path} "
                f"-c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p "
                f"-vf 'scale=-2:1080' -shortest {clip_path}"
            )
            run_command(ffmpeg_cmd, f"Rendering video for slide {page_num}")
        else:
            # No text, just hold the slide for 0.5 seconds
            ffmpeg_cmd = (
                f"ffmpeg -y -loop 1 -framerate 30 -i {img} -t 0.5 "
                f"-c:v libx264 -tune stillimage -pix_fmt yuv420p "
                f"-vf 'scale=-2:1080' {clip_path}"
            )
            run_command(ffmpeg_cmd, f"Rendering silent video for slide {page_num}")
            
        clips.append(clip_path)

    # 5. Concatenate
    concat_list = work_dir / "concat.txt"
    with open(concat_list, "w", encoding="utf-8") as f:
        for clip in clips:
            # Escape path for ffmpeg concat
            f.write(f"file '{clip.name}'\n")

    run_command(
        f"ffmpeg -y -f concat -safe 0 -i {concat_list} -c copy {out_file}",
        "Concatenating all clips"
    )

    print(f"\n[+] Success! Video saved to: {out_file}")
    
    # Cleanup
    shutil.rmtree(work_dir)

if __name__ == "__main__":
    main()
