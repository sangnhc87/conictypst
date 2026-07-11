import re

with open('js/omr_engine.js', 'r') as f:
    content = f.read()

mcq_logic = """
        // MCQ OpenCV
        for (let q = 1; q <= template.numQ; q++) {
          const pts = template.mcq[q.toString()];
          if (pts) {
             const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 7);
             const maxCount = Math.max(...counts);
             const filled = counts.filter(c => c > 30).length;
             if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
             else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ/tẩy xóa`);
             
             if (maxCount > 30) { 
                 const idx = counts.indexOf(maxCount);
                 geminiAns.mcq[q.toString()] = OPTIONS[idx];
             }
          }
        }
"""
content = re.sub(r"// MCQ OpenCV.*?// TF OpenCV", mcq_logic + "\n        // TF OpenCV", content, flags=re.DOTALL)

with open('js/omr_engine.js', 'w') as f:
    f.write(content)
