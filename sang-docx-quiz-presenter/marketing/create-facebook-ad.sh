#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ASSETS="$ROOT/marketing/assets"
TEXT="$ROOT/marketing/text"
OUT="$ROOT/marketing/output"
FONT="/System/Library/Fonts/Supplemental/Arial.ttf"
FONT_BOLD="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
VOICE_TMP="/private/tmp/trinh-chieu-voice.aiff"
VOICE="$OUT/trinh-chieu-facebook-voiceover.wav"
VIDEO="$OUT/trinh-chieu-facebook-ad-44s.mp4"

mkdir -p "$OUT"

say -v Linh -r 175 -o "$VOICE_TMP" "$(tr '\n' ' ' < "$ROOT/marketing/voiceover.txt")"
ffmpeg -y -i "$VOICE_TMP" -ar 48000 -ac 2 "$VOICE" >/dev/null 2>&1

render_caption() {
  local caption_file="$1" color="$2" size="$3" width="$4" height="$5" output="$6"
  magick -background none -fill "$color" -font "$FONT_BOLD" -pointsize "$size" -size "${width}x${height}" "caption:@$caption_file" "$output"
}

render_text() {
  local text="$1" color="$2" size="$3" width="$4" height="$5" output="$6"
  magick -background none -fill "$color" -font "$FONT" -pointsize "$size" -size "${width}x${height}" "caption:$text" "$output"
}

render_panel_scene() {
  local number="$1" bg_a="$2" bg_b="$3" panel_bg="$4" border="$5" image="$6" caption_file="$7" caption_color="$8" caption_size="$9" subtext="${10}" sub_color="${11}" output="${12}"
  local base="/private/tmp/trinh-scene-${number}-base.png"
  local panel="/private/tmp/trinh-scene-${number}-panel.png"
  local image_scaled="/private/tmp/trinh-scene-${number}-image.png"
  local caption="/private/tmp/trinh-scene-${number}-caption.png"
  local sub="/private/tmp/trinh-scene-${number}-sub.png"

  magick -size 1080x1920 "gradient:${bg_a}-${bg_b}" "$base"
  magick -size 1010x610 "xc:${panel_bg}" -stroke "$border" -strokewidth 6 -fill none -draw 'roundrectangle 2,2 1008,608 26,26' "$panel"
  magick "$image" -resize '980x551>' -background none -gravity center -extent 980x551 "$image_scaled"
  magick "$base" "$panel" -geometry +35+455 -composite "$base"
  magick "$base" "$image_scaled" -geometry +50+485 -composite "$base"
  render_caption "$caption_file" "$caption_color" "$caption_size" 960 250 "$caption"
  magick "$base" "$caption" -geometry +62+90 -composite "$base"
  render_text "$subtext" "$sub_color" 27 960 80 "$sub"
  magick "$base" "$sub" -geometry +62+285 -composite "$output"
}

render_caption "$TEXT/scene-0.txt" '#ffffff' 70 980 260 /private/tmp/trinh-scene-0-caption.png
magick -size 1080x1920 "gradient:#071423-#102f44" /private/tmp/trinh-scene-0-base.png
magick "$ASSETS/logo.png" -resize 360x360 /private/tmp/trinh-scene-0-logo.png
magick /private/tmp/trinh-scene-0-base.png /private/tmp/trinh-scene-0-logo.png -gravity north -geometry +0+250 -composite /private/tmp/trinh-scene-0-base.png
magick /private/tmp/trinh-scene-0-base.png /private/tmp/trinh-scene-0-caption.png -gravity north -geometry +0+720 -composite /private/tmp/trinh-scene-0-base.png
render_text 'AI Lesson Studio' '#f5cf67' 30 900 70 /private/tmp/trinh-scene-0-brand.png
magick /private/tmp/trinh-scene-0-base.png /private/tmp/trinh-scene-0-brand.png -gravity north -geometry +0+1030 -composite /private/tmp/trinh-scene-0-base.png
render_text 'Giải pháp soạn đề và giảng dạy dành cho giáo viên' '#c7d8e8' 26 1000 70 /private/tmp/trinh-scene-0-sub.png
magick /private/tmp/trinh-scene-0-base.png /private/tmp/trinh-scene-0-sub.png -gravity north -geometry +0+1110 -composite "$OUT/scene-0.png"

render_panel_scene 1 '#f4f8fc' '#dceaf5' '#ffffff' '#d9e6f0' "$ASSETS/landing.png" "$TEXT/scene-1.txt" '#0b2237' 58 'Word · PDF · Ảnh chụp' '#c66b27' "$OUT/scene-1.png"
render_panel_scene 2 '#fff8f4' '#f9e5e0' '#ffffff' '#f0cfc5' "$ASSETS/literature-profile.png" "$TEXT/scene-2.txt" '#8f2141' 55 'Đề chính thức · 120 phút · hướng dẫn chấm mở' '#76515b' "$OUT/scene-2.png"
render_panel_scene 3 '#edf4fb' '#dbeaf5' '#ffffff' '#c9dced' "$ASSETS/editor-literature.png" "$TEXT/scene-3.txt" '#124a72' 58 'Văn bản nguồn · rubric · lời giải · trình chiếu' '#4b6478' "$OUT/scene-3.png"
render_panel_scene 4 '#071b2d' '#123f54' '#102e43' '#36c5d7' "$ASSETS/presentation-literature.png" "$TEXT/scene-4.txt" '#ffffff' 62 'Bật lên là dạy được' '#81e8ed' "$OUT/scene-4.png"
render_panel_scene 5 '#fffaf1' '#f9eacb' '#ffffff' '#ead9ad' "$ASSETS/literature-sample.png" "$TEXT/scene-5.txt" '#6d4c14' 58 'Anh · Toán · Lý · Hóa · Sinh · Sử · Địa · Văn' '#80683b' "$OUT/scene-5.png"

render_caption "$TEXT/scene-6.txt" '#ffffff' 54 960 250 /private/tmp/trinh-scene-6-caption.png
magick -size 1080x1920 "gradient:#071423-#102f44" /private/tmp/trinh-scene-6-base.png
magick "$ASSETS/logo.png" -resize 300x300 /private/tmp/trinh-scene-6-logo.png
magick /private/tmp/trinh-scene-6-base.png /private/tmp/trinh-scene-6-logo.png -gravity north -geometry +0+260 -composite /private/tmp/trinh-scene-6-base.png
magick /private/tmp/trinh-scene-6-base.png /private/tmp/trinh-scene-6-caption.png -gravity north -geometry +0+820 -composite /private/tmp/trinh-scene-6-base.png
render_text 'Dành cho giáo viên muốn tiết kiệm thời gian và dạy học đẹp hơn' '#c7d8e8' 25 1000 80 /private/tmp/trinh-scene-6-sub.png
magick /private/tmp/trinh-scene-6-base.png /private/tmp/trinh-scene-6-sub.png -gravity north -geometry +0+1030 -composite /private/tmp/trinh-scene-6-base.png
render_text 'trinhchieu.pages.dev' '#f5cf67' 34 900 80 /private/tmp/trinh-scene-6-url.png
magick /private/tmp/trinh-scene-6-base.png /private/tmp/trinh-scene-6-url.png -gravity north -geometry +0+1130 -composite "$OUT/scene-6.png"

ffmpeg -y \
  -loop 1 -t 4 -i "$OUT/scene-0.png" \
  -loop 1 -t 7 -i "$OUT/scene-1.png" \
  -loop 1 -t 7 -i "$OUT/scene-2.png" \
  -loop 1 -t 7 -i "$OUT/scene-3.png" \
  -loop 1 -t 7 -i "$OUT/scene-4.png" \
  -loop 1 -t 6 -i "$OUT/scene-5.png" \
  -loop 1 -t 6 -i "$OUT/scene-6.png" \
  -i "$VOICE" \
  -f lavfi -i "aevalsrc=0.035*sin(2*PI*196*t)+0.022*sin(2*PI*261.63*t)+0.014*sin(2*PI*392*t)+0.008*sin(2*PI*4*t):s=48000:d=44" \
  -filter_complex "
    [0:v]fps=30,trim=duration=4,setpts=PTS-STARTPTS[s0];
    [1:v]fps=30,trim=duration=7,setpts=PTS-STARTPTS[s1];
    [2:v]fps=30,trim=duration=7,setpts=PTS-STARTPTS[s2];
    [3:v]fps=30,trim=duration=7,setpts=PTS-STARTPTS[s3];
    [4:v]fps=30,trim=duration=7,setpts=PTS-STARTPTS[s4];
    [5:v]fps=30,trim=duration=6,setpts=PTS-STARTPTS[s5];
    [6:v]fps=30,trim=duration=6,setpts=PTS-STARTPTS[s6];
    [s0][s1][s2][s3][s4][s5][s6]concat=n=7:v=1:a=0,setpts=PTS-STARTPTS,format=yuv420p[v];
    [7:a]aresample=48000,volume=1.0[voice];
    [8:a]aresample=48000,pan=stereo|c0=c0|c1=c0,volume=0.16,afade=t=in:st=0:d=1,afade=t=out:st=41:d=3[music];
    [voice][music]amix=inputs=2:duration=longest:dropout_transition=2,alimiter=limit=0.95,aresample=48000[a]
  " \
  -map "[v]" -map "[a]" -t 44 \
  -c:v libx264 -preset medium -crf 20 -pix_fmt yuv420p -r 30 \
  -c:a aac -b:a 192k -ar 48000 -movflags +faststart "$VIDEO"

cp "$ROOT/marketing/captions.srt" "$OUT/trinh-chieu-facebook-ad.srt"
echo "Created: $VIDEO"
echo "Created: $VOICE"
