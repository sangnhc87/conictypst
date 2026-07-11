import re

with open("js/omr_engine.js", "r") as f:
    js = f.read()

# 1. MCQ
js = js.replace("if (template.tf) totalScore += 0.25;", "if (template.scoring && template.scoring.mcq) totalScore += template.scoring.mcq.points;\n          else totalScore += 10.0 / template.numQ;")

# 2. TF
tf_replace = """if (correctClauses > 0 && template.scoring && template.scoring.tf) {
             totalScore += template.scoring.tf.points[correctClauses - 1];
          } else {
             if (correctClauses === 1) totalScore += 0.1;
             else if (correctClauses === 2) totalScore += 0.25;
             else if (correctClauses === 3) totalScore += 0.5;
             else if (correctClauses === 4) totalScore += 1.0;
          }"""
js = js.replace("""if (correctClauses === 1) totalScore += 0.1;
          else if (correctClauses === 2) totalScore += 0.25;
          else if (correctClauses === 3) totalScore += 0.5;
          else if (correctClauses === 4) totalScore += 1.0;""", tf_replace)

# 3. TLN
js = js.replace("totalScore += 0.5;", "if (template.scoring && template.scoring.tln) totalScore += template.scoring.tln.points;\n               else totalScore += 0.5;")

with open("js/omr_engine.js", "w") as f:
    f.write(js)
print("omr_engine.js patched!")
