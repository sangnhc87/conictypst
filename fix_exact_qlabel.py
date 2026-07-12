with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# I see a duplicate exportExcel(). This happened in my very first attempt yesterday where I added a new exportExcel but didn't remove the old one.
# Let's remove the first one which is around line 16610 (which I probably injected earlier).
# Wait, let's just do a clean git reset. Wait, I already did git reset.
# If I did git reset and it STILL has two exportExcels, it means it was in the source code before my modifications.
