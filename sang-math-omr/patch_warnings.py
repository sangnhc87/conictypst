import re

with open('js/omr_engine.js', 'r', encoding='utf-8') as f:
    content = f.read()

# Patch TF
old_tf = """                const cD = window.OmrEngine.readBubbleCol(threshWarped, [pair[0]], 9)[0];
                const cS = window.OmrEngine.readBubbleCol(threshWarped, [pair[1]], 9)[0];
                if (cD > 30 || cS > 30) {
                  geminiAns.tf[q][lbl] = cD > cS ? 'Đ' : 'S';
                }"""
new_tf = """                const cD = window.OmrEngine.readBubbleCol(threshWarped, [pair[0]], 9)[0];
                const cS = window.OmrEngine.readBubbleCol(threshWarped, [pair[1]], 9)[0];
                if (cD > 30 && cS > 30) warnings.push(`Câu ${q} ý ${lbl} tô nhiều ô`);
                else if (Math.max(cD, cS) > 30 && Math.max(cD, cS) < 100) warnings.push(`Câu ${q} ý ${lbl} tô mờ/tẩy xóa`);
                if (cD > 30 || cS > 30) {
                  geminiAns.tf[q][lbl] = cD > cS ? 'Đ' : 'S';
                }"""
content = content.replace(old_tf, new_tf)

# Patch TLN 1
old_tln1 = """                  const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                  const maxCount = Math.max(...counts);
                  if (maxCount > 30) {"""
new_tln1 = """                  const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                  const maxCount = Math.max(...counts);
                  const filled = counts.filter(c => c > 30).length;
                  if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
                  else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ`);
                  if (maxCount > 30) {"""
content = content.replace(old_tln1, new_tln1)

# Patch TLN 2
old_tln2 = """                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const maxCount = Math.max(...counts);
                    if (maxCount > 30) ansStr += DIGITS[counts.indexOf(maxCount)];"""
new_tln2 = """                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const maxCount = Math.max(...counts);
                    const filled = counts.filter(c => c > 30).length;
                    if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
                    else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ`);
                    if (maxCount > 30) ansStr += DIGITS[counts.indexOf(maxCount)];"""
content = content.replace(old_tln2, new_tln2)

# Patch TLN 3
old_tln3 = """                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const maxCount = Math.max(...counts);
                    if (maxCount > 30) fracStr += DIGITS[counts.indexOf(maxCount)];"""
new_tln3 = """                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const maxCount = Math.max(...counts);
                    const filled = counts.filter(c => c > 30).length;
                    if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
                    else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ`);
                    if (maxCount > 30) fracStr += DIGITS[counts.indexOf(maxCount)];"""
content = content.replace(old_tln3, new_tln3)


with open('js/omr_engine.js', 'w', encoding='utf-8') as f:
    f.write(content)
