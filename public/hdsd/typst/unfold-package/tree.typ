#import "@preview/cetz:0.5.2"

// Lấy theme màu sắc
#let get-theme(name) = {
  if name == "blue" {
    return (
      root: (fill: rgb("e3f2fd"), stroke: 1pt + rgb("1e88e5"), radius: 3pt),
      node: (fill: white, stroke: 0.5pt + rgb("64b5f6"), radius: 2pt),
      leaf: (fill: white, stroke: 0.5pt + rgb("bbdefb"), radius: 2pt),
      edge: rgb("1e88e5"),
      lbl-fill: white,
      lbl-text: rgb("1565c0")
    )
  } else if name == "red" {
    return (
      root: (fill: rgb("ffebee"), stroke: 1pt + rgb("e53935"), radius: 3pt),
      node: (fill: white, stroke: 0.5pt + rgb("ef5350"), radius: 2pt),
      leaf: (fill: white, stroke: 0.5pt + rgb("ffcdd2"), radius: 2pt),
      edge: rgb("e53935"),
      lbl-fill: white,
      lbl-text: rgb("c62828")
    )
  } else if name == "green" {
    return (
      root: (fill: rgb("e8f5e9"), stroke: 1pt + rgb("43a047"), radius: 3pt),
      node: (fill: white, stroke: 0.5pt + rgb("66bb6a"), radius: 2pt),
      leaf: (fill: white, stroke: 0.5pt + rgb("c8e6c9"), radius: 2pt),
      edge: rgb("43a047"),
      lbl-fill: white,
      lbl-text: rgb("2e7d32")
    )
  } else if name == "orange" {
    return (
      root: (fill: rgb("fff3e0"), stroke: 1pt + rgb("fb8c00"), radius: 3pt),
      node: (fill: white, stroke: 0.5pt + rgb("ffa726"), radius: 2pt),
      leaf: (fill: white, stroke: 0.5pt + rgb("ffe0b2"), radius: 2pt),
      edge: rgb("fb8c00"),
      lbl-fill: white,
      lbl-text: rgb("ef6c00")
    )
  } else if name == "minimal" {
    return (
      root: (fill: none, stroke: none, radius: 0pt),
      node: (fill: none, stroke: none, radius: 0pt),
      leaf: (fill: none, stroke: none, radius: 0pt),
      edge: black,
      lbl-fill: white,
      lbl-text: black
    )
  } else {
    // default (gray/black)
    return (
      root: (fill: rgb("f5f5f5"), stroke: 1pt + rgb("616161"), radius: 3pt),
      node: (fill: white, stroke: 0.5pt + rgb("9e9e9e"), radius: 2pt),
      leaf: (fill: white, stroke: 0.5pt + rgb("e0e0e0"), radius: 2pt),
      edge: rgb("616161"),
      lbl-fill: white,
      lbl-text: black
    )
  }
}

#let build-tree(node, is-root: false, level: 0, start-pos: 0, node-step: 1.5, level-step: 4, dir: "right") = {
  let content = if type(node) == array { node.at(0) } else { node }
  
  let prob = none
  let custom-style = none
  let children-data = ()
  
  if type(node) == array {
    let start-idx = 1
    // Kiểm tra prob
    if not is-root and node.len() > 1 and type(node.at(1)) in (str, content) {
      prob = node.at(1)
      start-idx = 2
    }
    // Lọc các phần tử còn lại
    for i in range(start-idx, node.len()) {
      let item = node.at(i)
      if type(item) == dictionary {
        custom-style = item
      } else {
        children-data.push(item)
      }
    }
  }
  
  let depth-pos = level * level-step
  
  if children-data.len() == 0 {
    let cross-pos = start-pos
    let next-pos = if dir in ("right", "left") { start-pos - node-step } else { start-pos + node-step }
    
    let (x, y) = if dir == "right" { 
      (depth-pos, cross-pos) 
    } else if dir == "left" { 
      (-depth-pos, cross-pos) 
    } else if dir == "down" { 
      (cross-pos, -depth-pos) 
    } else { 
      (cross-pos, depth-pos) 
    }
    
    return ((content: content, prob: prob, custom-style: custom-style, x: x, y: y, children: (), is-leaf: true), next-pos)
  } else {
    let children = ()
    let current-pos = start-pos
    for c in children-data {
      let (child-node, next-pos) = build-tree(c, is-root: false, level: level + 1, start-pos: current-pos, node-step: node-step, level-step: level-step, dir: dir)
      children.push(child-node)
      current-pos = next-pos
    }
    
    let cross-pos = if dir in ("right", "left") {
      children.fold(0.0, (acc, c) => acc + c.y) / children.len()
    } else {
      children.fold(0.0, (acc, c) => acc + c.x) / children.len()
    }
    
    let (x, y) = if dir == "right" { 
      (depth-pos, cross-pos) 
    } else if dir == "left" { 
      (-depth-pos, cross-pos) 
    } else if dir == "down" { 
      (cross-pos, -depth-pos) 
    } else { 
      (cross-pos, depth-pos) 
    }
    
    return ((content: content, prob: prob, custom-style: custom-style, x: x, y: y, children: children, is-leaf: false), current-pos)
  }
}

#let draw-tree-nodes(node, name-prefix: "root", theme-colors: (:), root-style: none) = {
  import cetz.draw: *
  
  let base-style = if name-prefix == "root" { 
    if root-style != none { root-style } else { theme-colors.root } 
  } else if node.is-leaf {
    theme-colors.leaf
  } else {
    theme-colors.node
  }
  
  // Áp dụng custom-style nếu có
  let final-style = (:)
  for (k, v) in base-style {
    final-style.insert(k, v)
  }
  if node.custom-style != none {
    for (k, v) in node.custom-style {
      final-style.insert(k, v)
    }
  }
  
  if final-style.keys().contains("shape") and final-style.shape == "circle" {
    let r = final-style.at("radius", default: 0.5)
    let f = final-style.at("fill", default: none)
    let s = final-style.at("stroke", default: 1pt)
    circle((node.x, node.y), radius: r, fill: f, stroke: s, name: name-prefix)
    // Xoá shape và radius để tránh warning từ content
    let text-style = final-style
    let _ = text-style.remove("shape", default: none)
    let _ = text-style.remove("radius", default: none)
    let _ = text-style.remove("fill", default: none)
    let _ = text-style.remove("stroke", default: none)
    content(name-prefix, node.content, ..text-style)
  } else {
    // Mặc định luôn có frame rect và padding nếu chưa có
    if not final-style.keys().contains("frame") { final-style.insert("frame", "rect") }
    if not final-style.keys().contains("padding") { final-style.insert("padding", 4pt) }
    content((node.x, node.y), node.content, name: name-prefix, ..final-style)
  }
  
  for (i, child) in node.children.enumerate() {
    let child-name = name-prefix + "-" + str(i)
    draw-tree-nodes(child, name-prefix: child-name, theme-colors: theme-colors)
  }
}

#let draw-tree-edges(node, name-prefix: "root", edge-mark: ">", theme-colors: (:), prob-pos: 0.5, path-type: "straight", angled-labels: false) = {
  import cetz.draw: *
  
  for (i, child) in node.children.enumerate() {
    let child-name = name-prefix + "-" + str(i)
    
    // Custom edge color
    let edge-stroke = theme-colors.edge
    let mark-fill = theme-colors.edge
    
    if child.custom-style != none and child.custom-style.keys().contains("stroke") {
      edge-stroke = child.custom-style.stroke
      if type(edge-stroke) == color {
        mark-fill = edge-stroke
      } else if type(edge-stroke) == dictionary and "paint" in edge-stroke {
        mark-fill = edge-stroke.paint
      } else if type(edge-stroke) == stroke {
        mark-fill = edge-stroke.paint
      }
    }
    
    // Draw edge based on path-type
    if path-type == "orthogonal" {
      let mid-x = (node.x + child.x) / 2
      let mid-y = (node.y + child.y) / 2
      
      // Determine split point based on tree direction
      // If x is different but y is same (unlikely), or x is same...
      // Just check if dx > dy (horizontal tree) or dx < dy (vertical tree)
      // Actually, since we know node.x vs child.x, if node.x != child.x and node.y != child.y:
      // For horizontal tree, we usually go half x, then full y, then half x.
      // But CetZ line with 3 points does this easily.
      // Let's just use mid-x for horizontal trees, mid-y for vertical trees.
      let dx = calc.abs(child.x - node.x)
      let dy = calc.abs(child.y - node.y)
      if dx > dy {
        line(name-prefix, (mid-x, node.y), (mid-x, child.y), child-name, mark: (end: edge-mark, fill: mark-fill), stroke: edge-stroke, name: "edge-" + child-name)
      } else {
        line(name-prefix, (node.x, mid-y), (child.x, mid-y), child-name, mark: (end: edge-mark, fill: mark-fill), stroke: edge-stroke, name: "edge-" + child-name)
      }
    } else {
      line(name-prefix, child-name, mark: (end: edge-mark, fill: mark-fill), stroke: edge-stroke, name: "edge-" + child-name)
    }
    
    // Draw probability label
    if child.prob != none and child.prob != "" {
      let mx = node.x + (child.x - node.x) * prob-pos
      let my = node.y + (child.y - node.y) * prob-pos
      
      let lbl-text-col = theme-colors.lbl-text
      if child.custom-style != none and child.custom-style.keys().contains("stroke") {
        if type(child.custom-style.stroke) == color {
          lbl-text-col = child.custom-style.stroke
        } else if type(child.custom-style.stroke) == dictionary and "paint" in child.custom-style.stroke {
          lbl-text-col = child.custom-style.stroke.paint
        } else if type(child.custom-style.stroke) == stroke {
          lbl-text-col = child.custom-style.stroke.paint
        }
      }
      
      let lbl-angle = 0deg
      if angled-labels and path-type == "straight" {
        let dx = child.x - node.x
        let dy = child.y - node.y
        lbl-angle = calc.atan2(dx, dy)
        // Normalize angle to keep text upright
        if lbl-angle > 90deg and lbl-angle <= 270deg {
          lbl-angle -= 180deg
        } else if lbl-angle < -90deg and lbl-angle >= -270deg {
          lbl-angle += 180deg
        }
      }
      
      content((mx, my), box(fill: theme-colors.lbl-fill, inset: 1pt, text(size: 0.9em, fill: lbl-text-col, child.prob)), angle: lbl-angle)
    }
    
    draw-tree-edges(child, name-prefix: child-name, edge-mark: edge-mark, theme-colors: theme-colors, prob-pos: prob-pos, path-type: path-type, angled-labels: angled-labels)
  }
}

#let prob-tree(
  data,
  theme: "blue", // Các mẫu: "default", "blue", "red", "green", "orange", "minimal"
  dir: "right", // "right", "left", "down", "up"
  level-step: 4,
  node-step: 1.5,
  root-style: none,
  edge-mark: ">",
  prob-pos: 0.5,
  path-type: "straight", // "straight" or "orthogonal"
  angled-labels: false,
  scale: 1.4cm,
) = cetz.canvas(length: scale, {
  let theme-colors = get-theme(theme)
  
  // 1. Build tree structure with coordinates
  let (tree, _) = build-tree(data, is-root: true, level: 0, start-pos: 0, node-step: node-step, level-step: level-step, dir: dir)
  
  // 2. Draw nodes
  draw-tree-nodes(tree, name-prefix: "root", theme-colors: theme-colors, root-style: root-style)
  
  // 3. Draw edges and labels
  draw-tree-edges(tree, name-prefix: "root", edge-mark: edge-mark, theme-colors: theme-colors, prob-pos: prob-pos, path-type: path-type, angled-labels: angled-labels)
})
