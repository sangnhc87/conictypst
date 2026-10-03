#!/bin/bash
echo "Preparing dist-portal..."
rm -rf dist-portal
mkdir -p dist-portal
cp -r portal/* dist-portal/

# Copy the SCORM presentations
mkdir -p dist-portal/typst/bai-giang-beamer-scorm
# Find all SCORM zip files and extract them into dist-portal
find typst/bai-giang-beamer-scorm -type f -name "*-scorm.zip" | while read zippath; do
  # Extract dir relative to project root, e.g., typst/bai-giang-beamer-scorm/chuong1-luong-giac
  dirpath=$(dirname "$zippath")
  # Extract filename without extension, e.g., scorm-11-bai-1-goc-luong-giac-scorm
  basename=$(basename "$zippath" .zip)
  
  # Target directory where this package should be served from
  target_dir="dist-portal/$dirpath/$basename"
  
  mkdir -p "$target_dir"
  unzip -q "$zippath" -d "$target_dir"
done

echo "Running wrangler pages deploy..."
npx wrangler pages deploy dist-portal --project-name portal-baigiang --branch main
