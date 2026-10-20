// SMILES → toạ độ 2D → mã CeTZ (công thức khung hoặc mô hình quả cầu – que). Tự viết, không cần thư viện ngoài, chạy offline.
// Hỗ trợ: nguyên tử nhóm hữu cơ (B C N O P S F Cl Br I, chữ thường = thơm), [ngoặc] có điện tích/H, liên kết - = # :, nhánh ( ), vòng 1-9 và %nn.
// Bỏ qua lập thể (/ \ @). Bố cục: vòng đa giác đều, vòng ngưng tụ lật qua cạnh chung, mạch zigzag 120°.

const VAL = { B: [3], C: [4], N: [3, 5], O: [2], P: [3, 5], S: [2, 4, 6], F: [1], Cl: [1], Br: [1], I: [1] }
const ORGANIC = new Set(['B', 'C', 'N', 'O', 'P', 'S', 'F', 'Cl', 'Br', 'I'])

export function parseSmiles(src) {
  const s = String(src).replace(/\s+/g, '')
  const atoms = [], bonds = []
  const stack = []
  const ring = {}
  let prev = -1, pend = null, i = 0
  const addAtom = a => {
    a.idx = atoms.length
    atoms.push(a)
    if (prev >= 0) addBond(prev, a.idx, pend)
    pend = null; prev = a.idx
  }
  const addBond = (a, b, ord) => {
    const arom = atoms[a].arom && atoms[b].arom
    bonds.push({ a, b, order: ord ?? (arom ? 1.5 : 1) })
  }
  while (i < s.length) {
    const c = s[i]
    if (c === '(') { stack.push(prev); i++ }
    else if (c === ')') { prev = stack.pop() ?? -1; i++ }
    else if (c === '-') { pend = 1; i++ }
    else if (c === '=') { pend = 2; i++ }
    else if (c === '#') { pend = 3; i++ }
    else if (c === ':') { pend = 1.5; i++ }
    else if (c === '/' || c === '\\') { i++ }
    else if (c === '.') { prev = -1; i++ }
    else if (/[0-9%]/.test(c)) {
      let n
      if (c === '%') { n = s.slice(i + 1, i + 3); i += 3 } else { n = c; i++ }
      if (prev < 0) throw new Error('SMILES: số đóng vòng đứng sai chỗ')
      if (ring[n] != null) { addBond(ring[n].atom, prev, pend ?? ring[n].ord); delete ring[n] } else ring[n] = { atom: prev, ord: pend }
      pend = null
    } else if (c === '[') {
      const j = s.indexOf(']', i)
      if (j < 0) throw new Error('SMILES: thiếu ]')
      let t = s.slice(i + 1, j)
      i = j + 1
      t = t.replace(/^\d+/, '')
      const m = t.match(/^([A-Za-z][a-z]?)/)
      if (!m) throw new Error('SMILES: nguyên tử trong [ ] không hợp lệ')
      let el = m[1]
      let arom = false
      if (el === el.toLowerCase() && ['b', 'c', 'n', 'o', 'p', 's'].includes(el)) { arom = true; el = el.toUpperCase() } else if (el.length === 2 && !/^(Cl|Br|Na|Mg|Al|Si|Li|Ca|Fe|Cu|Zn|Ag|Ba|Mn|Cr|Co|Ni|Sn|Pb|He|Ne|Ar|Kr|Se|As|Sb|Bi|Hg|Au|Pt|Ti|Ga|Ge|Be|Sc|Rb|Sr|Cs|Cd|Ru|Rh|Pd|Os|Ir|Zr|Nb|Mo|Tc|Te|Xe|La|Ce)$/.test(el)) el = el[0]
      t = t.slice(el.length)
      t = t.replace(/@+/g, '')
      let h = 0
      const hm = t.match(/H(\d?)/)
      if (hm) { h = hm[1] === '' ? 1 : Number(hm[1]); t = t.replace(/H\d?/, '') }
      let ch = 0
      const cm = t.match(/([+-])(\d*)|(\++|-+)/)
      if (cm) {
        if (cm[1]) ch = (cm[1] === '+' ? 1 : -1) * (cm[2] === '' ? 1 : Number(cm[2]))
        else ch = (cm[3][0] === '+' ? 1 : -1) * cm[3].length
      }
      addAtom({ el, arom, charge: ch, h, bracket: true })
    } else {
      let el = c
      if (c === 'C' && s[i + 1] === 'l') { el = 'Cl'; i++ } else if (c === 'B' && s[i + 1] === 'r') { el = 'Br'; i++ }
      i++
      let arom = false
      if (['b', 'c', 'n', 'o', 'p', 's'].includes(el)) { arom = true; el = el.toUpperCase() }
      if (!ORGANIC.has(el)) throw new Error(`SMILES: không hiểu "${el}" (thử đặt trong [ ])`)
      addAtom({ el, arom, charge: 0, h: 0, bracket: false })
    }
  }
  if (!atoms.length) throw new Error('SMILES trống')
  // liên kết giữa hai nguyên tử thơm không ghi rõ = 1,5 (đã đặt); thêm hydro ngầm định
  const adj = atoms.map(() => [])
  bonds.forEach((b, k) => { adj[b.a].push({ to: b.b, k }); adj[b.b].push({ to: b.a, k }) })
  atoms.forEach((a, k) => {
    if (a.bracket) return
    let sum = 0
    for (const { k: bk } of adj[k]) sum += bonds[bk].order === 1.5 ? 1 : bonds[bk].order
    if (a.arom) sum += (a.el === 'C' || (a.el === 'N' && adj[k].length === 2)) ? 1 : 0
    const vs = VAL[a.el] || [0]
    const v = vs.find(x => x >= sum) ?? vs[vs.length - 1]
    a.h = Math.max(0, v - sum)
  })
  return { atoms, bonds, adj }
}

// Kekulé hoá: đổi liên kết thơm 1,5 thành 1/2 xen kẽ bằng ghép cặp tối đa; nếu không được để nguyên (vẽ đơn)
function kekulize(mol) {
  const { atoms, bonds, adj } = mol
  const need = atoms.map((a, k) => a.arom && (a.el === 'C' || (a.el === 'N' && adj[k].length === 2 && !a.h) || a.el === 'B') && adj[k].some(e => bonds[e.k].order === 1.5))
  const match = atoms.map(() => -1)
  const tryAtom = (u, seen) => {
    for (const { to, k } of adj[u]) {
      if (bonds[k].order !== 1.5 || !need[to] || seen.has(to)) continue
      seen.add(to)
      if (match[to] < 0 || tryAtom(match[to], seen)) { match[to] = u; match[u] = to; return true }
    }
    return false
  }
  for (let u = 0; u < atoms.length; u++) if (need[u] && match[u] < 0) tryAtom(u, new Set([u]))
  for (const b of bonds) if (b.order === 1.5) b.order = (match[b.a] === b.b && match[b.b] === b.a) ? 2 : 1
}

function findRings(mol) {
  const { atoms, adj } = mol
  const n = atoms.length
  const rings = []
  const seen = new Set()
  // với mỗi cạnh, tìm chu trình ngắn nhất chứa nó (BFS bỏ cạnh đó)
  const edges = mol.bonds.map((b, k) => [b.a, b.b, k])
  for (const [a, b, k] of edges) {
    const prev = new Array(n).fill(-2)
    prev[a] = -1
    const q = [a]
    for (let h = 0; h < q.length && prev[b] === -2; h++) {
      const u = q[h]
      for (const { to, k: bk } of adj[u]) if (bk !== k && prev[to] === -2) { prev[to] = u; q.push(to) }
    }
    if (prev[b] === -2) continue
    const path = []
    for (let x = b; x !== -1; x = prev[x]) path.push(x)
    if (path.length > 8) continue
    const key = [...path].sort((x, y) => x - y).join(',')
    if (!seen.has(key)) { seen.add(key); rings.push(path.reverse()) } // path: a ... b
  }
  return rings
}

export function layout(mol) {
  kekulize(mol)
  const { atoms, adj } = mol
  const n = atoms.length
  const pos = new Array(n).fill(null)
  const rings = findRings(mol).map(r => ({ atoms: r, placed: false, c: null }))
  const ringsOf = atoms.map((_, k) => rings.filter(r => r.atoms.includes(k)))
  const turn = new Array(n).fill(1)
  const ang = (a, b) => Math.atan2(pos[b][1] - pos[a][1], pos[b][0] - pos[a][0])
  const TWO = Math.PI * 2
  const norm = t => { t %= TWO; return t < 0 ? t + TWO : t }
  const R = k => 1 / (2 * Math.sin(Math.PI / k))
  const clear = (p, skip) => pos.every((q, j) => !q || j === skip || Math.hypot(q[0] - p[0], q[1] - p[1]) > 0.7)

  const placeRingAround = (ring, c, startAtom, startAng, dir) => {
    const k = ring.atoms.length
    const o = ring.atoms.indexOf(startAtom)
    for (let j = 0; j < k; j++) {
      const at = ring.atoms[(o + j) % k]
      const t = startAng + dir * j * TWO / k
      if (!pos[at]) pos[at] = [c[0] + R(k) * Math.cos(t), c[1] + R(k) * Math.sin(t)]
    }
    ring.placed = true; ring.c = c
  }
  const placeFused = ring => {
    // tìm cạnh chung với phần đã đặt
    const k = ring.atoms.length
    for (let j = 0; j < k; j++) {
      const u = ring.atoms[j], v = ring.atoms[(j + 1) % k]
      if (pos[u] && pos[v]) {
        const mid = [(pos[u][0] + pos[v][0]) / 2, (pos[u][1] + pos[v][1]) / 2]
        const dx = pos[v][0] - pos[u][0], dy = pos[v][1] - pos[u][1]
        let nx = -dy, ny = dx
        // hướng ra xa tâm vòng đã đặt chứa cạnh (hoặc trọng tâm các nguyên tử đã đặt)
        const other = rings.find(r => r.placed && r !== ring && r.atoms.includes(u) && r.atoms.includes(v))
        const ref = other ? other.c : [mid[0] - nx, mid[1] - ny]
        if ((mid[0] - ref[0]) * nx + (mid[1] - ref[1]) * ny < 0) { nx = -nx; ny = -ny }
        const L = Math.hypot(nx, ny) || 1
        const ap = R(k) * Math.cos(Math.PI / k)
        const c = [mid[0] + nx / L * ap, mid[1] + ny / L * ap]
        const au = Math.atan2(pos[u][1] - c[1], pos[u][0] - c[0]), av = Math.atan2(pos[v][1] - c[1], pos[v][0] - c[0])
        let d = norm(av - au); const dir = d < Math.PI ? 1 : -1
        placeRingAround(ring, c, u, au, dir)
        return true
      }
    }
    return false
  }
  const rcenter = a => { const r = ringsOf[a].find(x => x.placed); return r ? r.c : null }

  // nguyên tử đầu tiên
  const start = 0
  if (ringsOf[start].length) {
    const r = ringsOf[start][0]
    placeRingAround(r, [0, 0], start, Math.PI, 1)
    pos[start] = [R(r.atoms.length) * Math.cos(Math.PI), R(r.atoms.length) * Math.sin(Math.PI)]
  } else pos[start] = [0, 0]

  const queue = [start]
  const done = new Set()
  const processAtom = a => {
    // vòng ngưng tụ kế bên
    for (const r of ringsOf[a]) if (!r.placed) placeFused(r)
    const un = adj[a].map(e => e.to).filter(b => !pos[b])
    if (!un.length) return
    const placedN = adj[a].map(e => e.to).filter(b => pos[b])
    const E = placedN.map(b => ang(a, b))
    const rc = rcenter(a)
    const triple = (adj[a].some(e => mol.bonds[e.k].order === 3) || adj[a].filter(e => mol.bonds[e.k].order === 2).length >= 2) && adj[a].length === 2
    let dirs = []
    if (rc && E.length >= 1 && !triple) {
      const out = Math.atan2(pos[a][1] - rc[1], pos[a][0] - rc[0])
      if (un.length === 1) dirs = [out]
      else if (un.length === 2) dirs = [out + Math.PI / 3, out - Math.PI / 3]
      else dirs = un.map((_, i) => out + (i - (un.length - 1) / 2) * Math.PI / 2.2)
    } else if (!E.length) {
      dirs = un.map((_, i) => i * (TWO / Math.max(un.length, 2)))
      if (un.length === 1) dirs = [0]
    } else if (E.length === 1) {
      const back = E[0]
      const th = back + Math.PI
      if (triple) dirs = [th]
      else if (un.length === 1) {
        const t = -turn[a]
        const cand = [th + t * Math.PI / 3, th - t * Math.PI / 3]
        let pick = cand[0], tt = t
        const tryP = d => [pos[a][0] + Math.cos(d), pos[a][1] + Math.sin(d)]
        if (!clear(tryP(cand[0]), a)) { pick = cand[1]; tt = -t }
        dirs = [pick]; turn[un[0]] = tt
      } else if (un.length === 2) {
        // nhánh lớn hơn tiếp tục zigzag của mạch chính, nhánh nhỏ (vd. =O) rẽ ra phía kia
        const size = b => { const seen = new Set([a, b]); const st = [b]; let c = 0; while (st.length) { const x = st.pop(); c++; for (const e of adj[x]) if (!seen.has(e.to)) { seen.add(e.to); st.push(e.to) } } return c }
        const t = -turn[a]
        const big = size(un[0]) >= size(un[1]) ? 0 : 1
        dirs = [0, 0]
        dirs[big] = th + t * Math.PI / 3; dirs[1 - big] = th - t * Math.PI / 3
        turn[un[big]] = t; turn[un[1 - big]] = -t
      } else dirs = [th + Math.PI / 2, th, th - Math.PI / 2].slice(0, un.length)
    } else {
      // nhiều láng giềng đã đặt: đặt vào khoảng trống lớn nhất
      const sorted = E.map(norm).sort((x, y) => x - y)
      const gaps = sorted.map((x, i) => { const nx = i + 1 < sorted.length ? sorted[i + 1] : sorted[0] + TWO; return { g: nx - x, mid: x + (nx - x) / 2 } }).sort((x, y) => y.g - x.g)
      dirs = un.map((_, i) => gaps[Math.min(i, gaps.length - 1)].mid)
      if (un.length === 1) dirs = [gaps[0].mid]
    }
    un.forEach((b, i) => {
      if (pos[b]) return
      const d = dirs[i]
      const p = [pos[a][0] + Math.cos(d), pos[a][1] + Math.sin(d)]
      const rb = ringsOf[b].find(r => !r.placed)
      if (rb) {
        // vòng gắn qua một liên kết đơn: đặt b rồi đặt cả vòng, tâm nằm tiếp theo hướng liên kết
        pos[b] = p
        const k = rb.atoms.length
        const c = [p[0] + Math.cos(d) * R(k), p[1] + Math.sin(d) * R(k)]
        placeRingAround(rb, c, b, Math.atan2(p[1] - c[1], p[0] - c[0]), 1)
      } else pos[b] = p
      queue.push(b)
    })
  }
  // chạy BFS; sau đó xử lý các thành phần rời
  for (let guard = 0; guard < n * 4; guard++) {
    while (queue.length) { const a = queue.shift(); if (done.has(a)) continue; done.add(a); processAtom(a) }
    // đặt nốt nguyên tử đã có toạ độ (trong vòng) mà chưa xử lý
    const nxt = pos.findIndex((p, k) => p && !done.has(k))
    if (nxt >= 0) { queue.push(nxt); continue }
    const free = pos.findIndex(p => !p)
    if (free < 0) break
    const maxX = Math.max(...pos.filter(Boolean).map(p => p[0]))
    pos[free] = [maxX + 1.6, 0]; queue.push(free)
  }
  mol.rings = rings
  return pos
}

const sym = { C: 'C' }
function atomLabel(a, h, flip) {
  const el = a.el
  let t = el
  if (h > 0 && el !== 'C') t = flip ? (h === 1 ? 'H' + el : `H${h}` + el) : (h === 1 ? el + 'H' : el + `H${h}`)
  if (a.charge) t += `^${Math.abs(a.charge) === 1 ? '' : Math.abs(a.charge)}${a.charge > 0 ? '+' : '-'}`
  return t
}
const f = v => String(Math.round(v * 1000) / 1000)

/** Công thức khung: trả về chuỗi lệnh CeTZ. opts: { len (cm), ghiC (ghi CH3 ở đầu mạch) } */
export function skeletonCode(smiles, { len = 0.9, ghiC = true } = {}) {
  const mol = parseSmiles(smiles)
  const pos = layout(mol)
  const { atoms, bonds, adj } = mol
  const xs = pos.map(p => p[0]), ys = pos.map(p => p[1])
  const cx = (Math.min(...xs) + Math.max(...xs)) / 2, cy = (Math.min(...ys) + Math.max(...ys)) / 2
  const pts = pos.map(p => `(${f((p[0] - cx) * len)}, ${f((p[1] - cy) * len)})`)
  const lbl = []
  atoms.forEach((a, k) => {
    const hasBond = adj[k].length > 0
    let t = null
    if (a.el !== 'C' || a.charge || !hasBond) {
      const nb = adj[k].map(e => e.to)
      const flip = nb.length === 1 && pos[nb[0]][0] > pos[k][0] + 0.2
      t = atomLabel(a, a.h, flip)
    } else if (ghiC && adj[k].length === 1 && a.h >= 1) {
      const nb = adj[k][0].to
      const flip = pos[nb][0] > pos[k][0] + 0.2
      const body = a.h === 1 ? 'CH' : `CH${a.h}`
      t = flip ? (a.h === 1 ? 'HC' : `H${a.h}C`) : body
    }
    if (t) lbl.push(`"${k}": ${JSON.stringify(t)}`)
  })
  const bl = bonds.map(b => {
    const o = b.order === 1.5 ? 1 : b.order
    if (o === 2) {
      const r = (mol.rings || []).find(rg => rg.placed && rg.atoms.includes(b.a) && rg.atoms.includes(b.b))
      if (r) {
        const dx = pos[b.b][0] - pos[b.a][0], dy = pos[b.b][1] - pos[b.a][1]
        const mx = (pos[b.a][0] + pos[b.b][0]) / 2, my = (pos[b.a][1] + pos[b.b][1]) / 2
        // pháp tuyến (-dy, dx) trùng khớp quy ước trong khung(): nx = -uy, ny = ux
        const side = ((-dy) * (r.c[0] - mx) + dx * (r.c[1] - my)) >= 0 ? 1 : -1
        return `(${b.a}, ${b.b}, 2, ${side})`
      }
    }
    return `(${b.a}, ${b.b}, ${o})`
  }).join(', ')
  return `khung((${pts.join(', ')}${pts.length === 1 ? ',' : ''}), (${bl}${bonds.length === 1 ? ',' : ''}), lbls: (${lbl.length ? lbl.join(', ') : ':'}), w: 1.3pt)`
}

/** Mô hình quả cầu – que (có hiđro tường minh). */
export function ballStickCode(smiles, { len = 1.3 } = {}) {
  const mol = parseSmiles(smiles)
  const pos = layout(mol)
  const { atoms, bonds, adj } = mol
  const all = atoms.map((a, k) => ({ el: a.el, p: pos[k].slice() }))
  const bl = bonds.map(b => [b.a, b.b, b.order === 1.5 ? 1 : b.order])
  atoms.forEach((a, k) => {
    if (!a.h) return
    const E = adj[k].map(e => Math.atan2(pos[e.to][1] - pos[k][1], pos[e.to][0] - pos[k][0]))
    const TWO = Math.PI * 2
    const sorted = E.map(t => ((t % TWO) + TWO) % TWO).sort((x, y) => x - y)
    const dirs = []
    for (let i = 0; i < a.h; i++) {
      if (!sorted.length) { dirs.push(i * TWO / a.h); continue }
      // khoảng trống lớn nhất (tính cả các hiđro đã thêm)
      const cur = [...sorted, ...dirs.map(t => ((t % TWO) + TWO) % TWO)].sort((x, y) => x - y)
      let best = 0, bm = 0
      cur.forEach((x, j) => { const nx = j + 1 < cur.length ? cur[j + 1] : cur[0] + TWO; if (nx - x > best) { best = nx - x; bm = x + (nx - x) / 2 } })
      dirs.push(bm)
    }
    dirs.forEach(t => {
      all.push({ el: 'H', p: [pos[k][0] + Math.cos(t) * 0.75, pos[k][1] + Math.sin(t) * 0.75] })
      bl.push([k, all.length - 1, 1])
    })
  })
  const xs = all.map(a => a.p[0]), ys = all.map(a => a.p[1])
  const cx = (Math.min(...xs) + Math.max(...xs)) / 2, cy = (Math.min(...ys) + Math.max(...ys)) / 2
  const at = all.map(a => `(${JSON.stringify(a.el)}, ${f((a.p[0] - cx) * len)}, ${f((a.p[1] - cy) * len)})`)
  return `mo-hinh((${at.join(', ')}${at.length === 1 ? ',' : ''}), (${bl.map(b => `(${b.join(', ')})`).join(', ')}${bl.length === 1 ? ',' : ''}))`
}
