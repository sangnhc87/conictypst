#!/usr/bin/env python3
import os
import sys
import shutil
import tempfile
import zipfile
import subprocess
import glob
from pathlib import Path

def build_scorm(typst_file):
    typst_path = Path(typst_file).resolve()
    if not typst_path.exists():
        print(f"File not found: {typst_path}")
        return

    name = typst_path.stem
    zip_name = name + "-scorm.zip"
    zip_path = typst_path.parent / zip_name

    with tempfile.TemporaryDirectory() as temp_dir:
        temp_dir_path = Path(temp_dir)
        
        # Compile Typst to PNG instead of SVG to avoid rendering issues on K12Online
        subprocess.run(
            ["typst", "compile", "--root", "/Users/admin/conictypst", "--ppi", "144",
             str(typst_path), str(temp_dir_path / "slide-{p}.png")],
            check=True
        )
        
        pngs = list(temp_dir_path.glob("slide-*.png"))
        pngs.sort(key=lambda p: int(p.stem.split('-')[-1]))
        
        # Create index.html with Interactive Quiz
        print(f"Generating index.html for {name}...")
        import sys
        
        # Add parse and build paths
        sach_dir = str(Path("/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm").resolve())
        if sach_dir not in sys.path:
            sys.path.insert(0, sach_dir)
            
        from parse_typ import parse_file
        from build_scorm import build_quiz_html
        
        try:
            questions = parse_file(str(typst_path))
            print(f"Found {len(questions)} interactive questions.")
        except Exception as e:
            print(f"Warning: Failed to parse questions: {e}")
            questions = []
            
        quiz_html = build_quiz_html(name, questions)
        
        # Inject PNGs with a Slider
        num_slides = len(pngs)
        slides_html = '<style>\n'
        slides_html += '.slider-wrapper { position: relative; width: 100%; max-width: 900px; margin: 0 auto; text-align: center; }\n'
        slides_html += '.slide-img { max-width: 100%; display: none; box-shadow: 0 4px 12px rgba(0,0,0,0.15); border-radius: 8px; }\n'
        slides_html += '.slide-img.active { display: inline-block; }\n'
        slides_html += '.slider-controls { margin-top: 15px; display: flex; justify-content: center; gap: 20px; align-items: center; }\n'
        slides_html += '.btn-slider { padding: 10px 20px; background: #003087; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 16px; font-weight: bold; }\n'
        slides_html += '.btn-slider:disabled { background: #ccc; cursor: not-allowed; }\n'
        slides_html += '#slide-counter { font-weight: bold; font-size: 16px; color: #333; }\n'
        slides_html += '</style>\n'
        
        slides_html += '<div class="slides-container" style="margin-bottom: 40px; border-bottom: 2px solid #ccc; padding-bottom: 30px;">\n'
        slides_html += '  <h3 style="color: #003087; text-transform: uppercase; text-align: center; margin-bottom: 20px;">Phần 1: Ôn tập lý thuyết</h3>\n'
        slides_html += '  <div class="slider-wrapper">\n'
        
        for i, png in enumerate(pngs):
            active_class = " active" if i == 0 else ""
            slides_html += f'    <img id="slide-{i+1}" class="slide-img{active_class}" src="{png.name}">\n'
            
        slides_html += '    <div class="slider-controls">\n'
        slides_html += '      <button id="btn-prev" class="btn-slider" onclick="changeSlide(-1)" disabled>❮ Trước</button>\n'
        slides_html += f'      <span id="slide-counter">1 / {num_slides}</span>\n'
        slides_html += '      <button id="btn-next" class="btn-slider" onclick="changeSlide(1)">Sau ❯</button>\n'
        slides_html += '    </div>\n'
        slides_html += '  </div>\n'
        slides_html += '  <h3 style="color: #003087; text-transform: uppercase; text-align: center; margin-top: 40px;">Phần 2: Bài tập trắc nghiệm</h3>\n'
        
        slides_html += '  <script>\n'
        slides_html += '    let currentSlide = 1;\n'
        slides_html += f'    const totalSlides = {num_slides};\n'
        slides_html += '    function changeSlide(dir) {\n'
        slides_html += '       document.getElementById("slide-" + currentSlide).classList.remove("active");\n'
        slides_html += '       currentSlide += dir;\n'
        slides_html += '       if(currentSlide < 1) currentSlide = 1;\n'
        slides_html += '       if(currentSlide > totalSlides) currentSlide = totalSlides;\n'
        slides_html += '       document.getElementById("slide-" + currentSlide).classList.add("active");\n'
        slides_html += '       document.getElementById("slide-counter").innerText = currentSlide + " / " + totalSlides;\n'
        slides_html += '       document.getElementById("btn-prev").disabled = (currentSlide === 1);\n'
        slides_html += '       document.getElementById("btn-next").disabled = (currentSlide === totalSlides);\n'
        slides_html += '    }\n'
        slides_html += '  </script>\n'
        slides_html += '</div>\n'
        
        quiz_html = quiz_html.replace('<div id="quiz-container"></div>', slides_html + '<div id="quiz-container"></div>')
        
        (temp_dir_path / "index.html").write_text(quiz_html, encoding="utf-8")
        
        # Create imsmanifest.xml
        manifest = f"""<?xml version="1.0" encoding="UTF-8"?>
<manifest identifier="MANIFEST-BG-{name}" version="1.2"
  xmlns="http://www.imsproject.org/xsd/imscp_rootv1p1p2"
  xmlns:adlcp="http://www.adlnet.org/xsd/adlcp_rootv1p2"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.imsproject.org/xsd/imscp_rootv1p1p2 imscp_rootv1p1p2.xsd
    http://www.adlnet.org/xsd/adlcp_rootv1p2 adlcp_rootv1p2.xsd">
  <metadata><schema>ADL SCORM</schema><schemaversion>1.2</schemaversion></metadata>
  <organizations default="org1">
    <organization identifier="org1">
      <title>{name}</title>
      <item identifier="item1" identifierref="res1"><title>{name}</title></item>
    </organization>
  </organizations>
  <resources>
    <resource identifier="res1" type="webcontent" adlcp:scormtype="sco" href="index.html">
      <file href="index.html"/>
"""
        for png in pngs:
            manifest += f'      <file href="{png.name}"/>\n'
        manifest += """    </resource>
  </resources>
</manifest>"""
        (temp_dir_path / "imsmanifest.xml").write_text(manifest, encoding="utf-8")
        
        # Create ZIP
        print(f"Creating SCORM package: {zip_path.name}...")
        with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED) as zf:
            for f in temp_dir_path.iterdir():
                zf.write(f, f.name)
                
    print(f"Done! {zip_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python build_scorm_slides.py <file.typ>")
        sys.exit(1)
        
    for arg in sys.argv[1:]:
        for f in glob.glob(arg) if '*' in arg else [arg]:
            build_scorm(f)
