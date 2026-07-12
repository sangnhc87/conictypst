import re

with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

# 1. Update fill: _light_orange (or whatever) to fill: none in main functions
# cone, frustum, cylinder, box3, prism, pyramid, net
for func in ["cone", "frustum", "cylinder", "box3", "prism", "pyramid", "net"]:
    content = re.sub(rf'#let {func}\((.*?)(fill:\s*)[^\,]+(.*?)\)\s*=', rf'#let {func}(\1\2none\3) =', content, flags=re.DOTALL)

# 2. Update _solid_* functions to use stroke: black, fill: none
for func in ["cone", "frustum", "cylinder", "box", "prism", "pyramid"]:
    content = re.sub(rf'#let _solid_{func}\((.*?)(stroke:\s*)_blue(.*?)(fill:\s*)[^\,\)]+(.*?)\)\s*=', rf'#let _solid_{func}(\1\2black\3\4none\5) =', content, flags=re.DOTALL)
    # just in case fill was already none but stroke was _blue
    content = re.sub(rf'#let _solid_{func}\((.*?)(stroke:\s*)_blue(.*?)\)\s*=', rf'#let _solid_{func}(\1\2black\3) =', content, flags=re.DOTALL)

# 3. Modify stroke thickness of dashed lines.
# search for `thickness: 1pt` inside dashed lines and replace with `thickness: 1.5pt`
content = content.replace('thickness: 1pt', 'thickness: 1.5pt')

# 4. We want the 3D stroke to be black and 2D stroke to be _blue.
# But in `cone`, it just passes `stroke: stroke` to both.
# Let's change the default `stroke: black` in main functions as well,
# but for `_net_*` we change `stroke: _blue` and in main functions we pass `stroke: _blue`?
# Actually, the easiest way is to modify the `_net_*` functions to use `1.5pt + _blue` if stroke is black, or just use stroke.
# Let's just pass `stroke: stroke` but we change `stroke` in main functions to `black`. Wait, if we change `stroke: black` then 2D nets will be black.
# We should change main functions to:
# #let cone(..., stroke: black, stroke_net: _blue, ...)
# And pass stroke_net to _net_cone? That changes the API slightly but perfectly solves it.
# Wait, let's keep the API the same, but if the user doesn't provide a stroke, it defaults to black. For the net, if no stroke is provided, it uses _blue.
# Let's just leave `stroke: black` for solids and `stroke: _blue` for nets.
# In `cone`, `stroke` is passed to both. Let's just update `cone` to not pass `stroke` if we want default, but `cone` takes `stroke: black`.

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)

print("Updated unfold.typ")
