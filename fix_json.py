import re

with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# Update exportJSON
html = html.replace(
"""            const data = {
                studentList: studentList,
                gradeResults: gradeResults,
                examSessions: examSessions
            };""",
"""            const data = {
                studentList: studentList,
                gradeResults: gradeResults,
                examSessions: examSessions,
                masterAnswerKeys: window.masterAnswerKeys
            };"""
)

# Update importJSON
import_logic = """
                    if (data.studentList) studentList = data.studentList;
                    if (data.gradeResults) gradeResults = data.gradeResults;
                    if (data.examSessions) examSessions = data.examSessions;
                    if (data.masterAnswerKeys) window.masterAnswerKeys = data.masterAnswerKeys;

                    saveToStorage();
                    saveMasterAnswerKeys();
                    
                    // Rebuild UI
                    updateStudentTable();
                    updateResultsUI();
                    
                    // Rebuild activeMadeKey options
                    const sel = document.getElementById('activeMadeKey');
                    if (sel) {
                        sel.innerHTML = '<option value="default">Mặc định (Chung)</option>';
                        for (let made in window.masterAnswerKeys) {
                            if (made !== 'default') {
                                const opt = document.createElement('option');
                                opt.value = made;
                                opt.textContent = `Mã đề: ${made}`;
                                sel.appendChild(opt);
                            }
                        }
                    }
                    if (typeof switchAnswerKey === 'function') switchAnswerKey('default');
"""

# Replace the block inside importJSON
# Currently it looks like:
#                     if (data.studentList) studentList = data.studentList;
#                     if (data.gradeResults) gradeResults = data.gradeResults;
#                     if (data.examSessions) examSessions = data.examSessions;
#                     saveToStorage();
#                     updateStudentTable();
#                     updateResultsUI();

html = re.sub(
    r"if \(data\.studentList\).*?updateResultsUI\(\);",
    import_logic.strip(),
    html,
    flags=re.DOTALL
)

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)
