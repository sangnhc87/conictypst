#!/bin/bash
echo "Building Khối 11 SCORM packages..."
for file in $(find typst/bai-giang-beamer-scorm -name "scorm-11-*.typ"); do
    echo "Processing $file"
    python3 ./typst-to-scorm.py "$file"
done
echo "All done!"
