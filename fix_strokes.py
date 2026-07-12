import re

with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

# Replace all _net_* calls to pass the custom net stroke
for func in ["cone", "frustum", "cylinder", "box", "prism", "pyramid"]:
    content = re.sub(rf'_net_{func}\((.*?)stroke:\s*stroke(.*?)\)', rf'_net_{func}(\1stroke: if stroke == black {{ 1.5pt + _blue }} else {{ stroke }}\2)', content)

# But wait, in the main functions like `cone()`, there are calls to `_solid_cone`.
# They pass `stroke: stroke`. If `stroke` is `black`, it gets passed as `black`.
# In `_solid_cone`, it does `1.5pt + stroke` which works.
# Let's make sure _solid_* also gets passed correctly.
# Oh, we don't need to change _solid_*.

# Also need to make sure the 2D path uses 2pt.
# In `CD-PhangHoa`, 2D path is 2pt. Let's find where path_color is used in 2D.
# It is used in `line(..cur, stroke: 1.5pt + path_color)` inside `_net_*`.
# Let's replace `1.5pt + path_color` with `2pt + path_color` in _net_* functions.
# Note: we shouldn't replace it in _solid_* functions, only _net_* functions.
# To do this safely, we can just find all `1.5pt + path_color` in the file. Wait, in _solid_* it's also `1.5pt + path_color`.
# Let's write a targeted replace.

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)

print("Fixed strokes.")
