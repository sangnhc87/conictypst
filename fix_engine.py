import re

with open('sang-math-omr/js/omr_engine.js', 'r') as f:
    js = f.read()

# Currently the code has:
#       const expectedMCQ = fullAnswers.mcq || {};
#       const expectedTF = fullAnswers.tf || {};
#       const expectedTLN = fullAnswers.tln || {};
# It is located around line 450.

# We need to replace it with:
#       const parsedMade = geminiAns.made && geminiAns.made !== '?' ? geminiAns.made.trim() : 'default';
#       const activeKey = fullAnswers[parsedMade] || fullAnswers['default'] || { mcq:{}, tf:{}, tln:{} };
#       const expectedMCQ = activeKey.mcq || {};
#       const expectedTF = activeKey.tf || {};
#       const expectedTLN = activeKey.tln || {};

repl = """      const parsedMade = geminiAns.made && geminiAns.made !== '?' ? geminiAns.made.trim() : 'default';
      const activeKey = fullAnswers[parsedMade] || fullAnswers['default'] || { mcq:{}, tf:{}, tln:{} };
      const expectedMCQ = activeKey.mcq || {};
      const expectedTF = activeKey.tf || {};
      const expectedTLN = activeKey.tln || {};"""

js = re.sub(
    r"const expectedMCQ = fullAnswers\.mcq \|\| \{\};\s*const expectedTF = fullAnswers\.tf \|\| \{\};\s*const expectedTLN = fullAnswers\.tln \|\| \{\};",
    repl,
    js
)

with open('sang-math-omr/js/omr_engine.js', 'w') as f:
    f.write(js)
