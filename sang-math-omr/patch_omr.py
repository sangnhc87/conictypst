import re

with open('js/omr_engine.js', 'r') as f:
    content = f.read()

# Add warnings array
content = content.replace("let geminiAns = { mcq: {}, tf: {}, tln: {}, sbd: '?', made: '?' };", 
                          "let geminiAns = { mcq: {}, tf: {}, tln: {}, sbd: '?', made: '?' };\n        let warnings = [];")

# We will inject SBD and MADE processing logic before MCQ
sbd_made_logic = """
        // SBD
        if (template.sbd) {
            let str = "";
            for (let col = 0; col < template.sbd.length; col++) {
                const counts = window.OmrEngine.readBubbleCol(threshWarped, template.sbd[col], 7);
                const maxCount = Math.max(...counts);
                const filled = counts.filter(c => c > 30).length;
                if (filled > 1) warnings.push(`SBD cột ${col+1} tô nhiều ô`);
                else if (maxCount > 30 && maxCount < 100) warnings.push(`SBD cột ${col+1} tô mờ/tẩy xóa`);
                str += maxCount > 30 ? counts.indexOf(maxCount).toString() : "?";
            }
            geminiAns.sbd = str;
        }
        
        // MADE
        if (template.made) {
            let str = "";
            for (let col = 0; col < template.made.length; col++) {
                const counts = window.OmrEngine.readBubbleCol(threshWarped, template.made[col], 7);
                const maxCount = Math.max(...counts);
                const filled = counts.filter(c => c > 30).length;
                if (filled > 1) warnings.push(`Mã đề cột ${col+1} tô nhiều ô`);
                else if (maxCount > 30 && maxCount < 100) warnings.push(`Mã đề cột ${col+1} tô mờ/tẩy xóa`);
                str += maxCount > 30 ? counts.indexOf(maxCount).toString() : "?";
            }
            geminiAns.made = str;
        }
"""
content = content.replace("// MCQ OpenCV", sbd_made_logic + "\n        // MCQ OpenCV")

# Add warnings to return object
content = content.replace("sbd: geminiAns.sbd || '?',", "sbd: geminiAns.sbd || '?',\n          warnings: warnings,")

with open('js/omr_engine.js', 'w') as f:
    f.write(content)
