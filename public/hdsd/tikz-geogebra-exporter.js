(function (root) {
  'use strict';

  const EPS = 1e-9;
  const DEFAULT_BOUNDS = { xmin: -8, xmax: 8, ymin: -5, ymax: 5 };
  const GREEK = {
    α: '\\alpha', β: '\\beta', γ: '\\gamma', δ: '\\delta', ε: '\\varepsilon',
    ζ: '\\zeta', η: '\\eta', θ: '\\theta', ι: '\\iota', κ: '\\kappa',
    λ: '\\lambda', μ: '\\mu', ν: '\\nu', ξ: '\\xi', π: '\\pi',
    ρ: '\\rho', σ: '\\sigma', τ: '\\tau', υ: '\\upsilon', φ: '\\varphi',
    χ: '\\chi', ψ: '\\psi', ω: '\\omega',
    Γ: '\\Gamma', Δ: '\\Delta', Θ: '\\Theta', Λ: '\\Lambda', Ξ: '\\Xi',
    Π: '\\Pi', Σ: '\\Sigma', Φ: '\\Phi', Ψ: '\\Psi', Ω: '\\Omega',
  };

  function number(value, fallback = 0) {
    const parsed = Number.parseFloat(value);
    return Number.isFinite(parsed) ? parsed : fallback;
  }

  function boolAttr(node, name, fallback = false) {
    if (!node || !node.hasAttribute(name)) return fallback;
    return node.getAttribute(name) === 'true';
  }

  function cleanNumber(value, digits) {
    if (!Number.isFinite(value)) return '0';
    const factor = 10 ** digits;
    const rounded = Math.round(value * factor) / factor;
    if (Math.abs(rounded) < 1 / factor) return '0';
    return String(rounded);
  }

  function texText(value) {
    return String(value ?? '')
      .replace(/\\/g, '\\textbackslash{}')
      .replace(/([#$%&_{}])/g, '\\$1')
      .replace(/\^/g, '\\textasciicircum{}')
      .replace(/~/g, '\\textasciitilde{}');
  }

  function texMathLabel(value) {
    let output = '';
    for (const char of String(value ?? '')) {
      if (GREEK[char]) output += GREEK[char];
      else if (char === '′') output += "'";
      else if (char === '″') output += "''";
      else if (/[\p{L}\p{N}_{}'()+\-]/u.test(char)) output += char;
      else output += `\\text{${texText(char)}}`;
    }
    return output || '\\bullet';
  }

  function safeName(label, index, used) {
    const ascii = String(label ?? '')
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/[^A-Za-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '');
    const base = `ggb-${ascii || `point-${index + 1}`}`;
    let candidate = base;
    let suffix = 2;
    while (used.has(candidate)) candidate = `${base}-${suffix++}`;
    used.add(candidate);
    return candidate;
  }

  function attrs(node, prefix, limit = 50) {
    const values = [];
    if (!node) return values;
    for (let index = 0; index < limit; index += 1) {
      const value = node.getAttribute(`${prefix}${index}`);
      if (value !== null && value !== '') values.push(value);
    }
    return values;
  }

  function child(node, selector) {
    return node ? node.querySelector(selector) : null;
  }

  function commandMap(document) {
    const map = new Map();
    document.querySelectorAll('construction > command').forEach(command => {
      const name = command.getAttribute('name') || '';
      const inputs = attrs(child(command, 'input'), 'a');
      const outputs = attrs(child(command, 'output'), 'a');
      outputs.forEach((label, outputIndex) => {
        map.set(label, { name, inputs, outputs, outputIndex });
      });
    });
    return map;
  }

  function viewBounds(document, api) {
    if (api && typeof api.getValue === 'function') {
      try {
        const xmin = number(api.getValue('x(Corner(1))'), NaN);
        const xmax = number(api.getValue('x(Corner(2))'), NaN);
        const ymin = number(api.getValue('y(Corner(1))'), NaN);
        const ymax = number(api.getValue('y(Corner(3))'), NaN);
        if ([xmin, xmax, ymin, ymax].every(Number.isFinite) && xmax > xmin && ymax > ymin) {
          return { xmin, xmax, ymin, ymax };
        }
      } catch (_) {
        // Fall through to the XML view.
      }
    }

    const view = document.querySelector('euclidianView');
    const system = child(view, 'coordSystem');
    const size = child(view, 'size');
    if (system && size) {
      const width = number(size.getAttribute('width'), 800);
      const height = number(size.getAttribute('height'), 600);
      const xZero = number(system.getAttribute('xZero'), width / 2);
      const yZero = number(system.getAttribute('yZero'), height / 2);
      const scale = number(system.getAttribute('scale'), 50) || 50;
      const xScale = number(system.getAttribute('xscale'), scale) || scale;
      const yScale = number(system.getAttribute('yscale'), scale) || scale;
      return {
        xmin: -xZero / xScale,
        xmax: (width - xZero) / xScale,
        ymin: -(height - yZero) / yScale,
        ymax: yZero / yScale,
      };
    }
    return { ...DEFAULT_BOUNDS };
  }

  function viewPreferences(document) {
    const view = document.querySelector('euclidianView');
    const settings = child(view, 'evSettings');
    const grid = child(view, 'grid');
    const axes = [...(view?.querySelectorAll(':scope > axis') || [])];
    return {
      axes: boolAttr(settings, 'axes', true),
      grid: boolAttr(settings, 'grid', false),
      distX: Math.abs(number(grid?.getAttribute('distX'), 1)) || 1,
      distY: Math.abs(number(grid?.getAttribute('distY'), 1)) || 1,
      xAxis: axes.find(axis => axis.getAttribute('id') === '0'),
      yAxis: axes.find(axis => axis.getAttribute('id') === '1'),
    };
  }

  function clipParametric(point, direction, bounds, start = -Infinity, end = Infinity) {
    let low = start;
    let high = end;
    const slabs = [
      [point.x, direction.x, bounds.xmin, bounds.xmax],
      [point.y, direction.y, bounds.ymin, bounds.ymax],
    ];
    for (const [origin, delta, minimum, maximum] of slabs) {
      if (Math.abs(delta) < EPS) {
        if (origin < minimum || origin > maximum) return null;
        continue;
      }
      let first = (minimum - origin) / delta;
      let second = (maximum - origin) / delta;
      if (first > second) [first, second] = [second, first];
      low = Math.max(low, first);
      high = Math.min(high, second);
      if (low > high) return null;
    }
    return {
      a: { x: point.x + low * direction.x, y: point.y + low * direction.y },
      b: { x: point.x + high * direction.x, y: point.y + high * direction.y },
    };
  }

  function distance(a, b) {
    return Math.hypot(a.x - b.x, a.y - b.y);
  }

  function angleOf(center, point) {
    return Math.atan2(point.y - center.y, point.x - center.x) * 180 / Math.PI;
  }

  function normalizedArc(start, end, reflex = false) {
    let finish = end;
    while (finish < start) finish += 360;
    if (!reflex && finish - start > 180) finish -= 360;
    if (reflex && finish - start < 180) finish += 360;
    return [start, finish];
  }

  function conicFromMatrix(element) {
    const matrix = child(element, 'matrix');
    if (!matrix) return null;
    const a = number(matrix.getAttribute('A0'), NaN);
    const c = number(matrix.getAttribute('A1'), NaN);
    const f = number(matrix.getAttribute('A2'), NaN);
    const b = number(matrix.getAttribute('A3'), NaN);
    const d = number(matrix.getAttribute('A4'), NaN);
    const e = number(matrix.getAttribute('A5'), NaN);
    if (![a, b, c, d, e, f].every(Number.isFinite)) return null;

    const determinant = a * c - b * b;
    if (Math.abs(determinant) < EPS) return { kind: 'parabola', coefficients: { a, b, c, d, e, f } };

    const cx = (b * e - c * d) / determinant;
    const cy = (b * d - a * e) / determinant;
    const constant = f + d * cx + e * cy;
    const trace = a + c;
    const delta = Math.sqrt(Math.max(0, (a - c) ** 2 + 4 * b ** 2));
    const eigen1 = (trace + delta) / 2;
    const eigen2 = (trace - delta) / 2;
    const rotation = .5 * Math.atan2(2 * b, a - c) * 180 / Math.PI;
    const radius1Sq = -constant / eigen1;
    const radius2Sq = -constant / eigen2;

    if (radius1Sq > EPS && radius2Sq > EPS) {
      return {
        kind: 'ellipse',
        center: { x: cx, y: cy },
        radius1: Math.sqrt(radius1Sq),
        radius2: Math.sqrt(radius2Sq),
        rotation,
      };
    }
    if (radius1Sq * radius2Sq < -EPS) {
      const alongFirst = radius1Sq > 0;
      return {
        kind: 'hyperbola',
        center: { x: cx, y: cy },
        a: Math.sqrt(Math.abs(alongFirst ? radius1Sq : radius2Sq)),
        b: Math.sqrt(Math.abs(alongFirst ? radius2Sq : radius1Sq)),
        rotation: rotation + (alongFirst ? 0 : 90),
      };
    }
    return null;
  }

  function exportTikz(xmlString, configuration = {}) {
    const Parser = configuration.DOMParser || root.DOMParser;
    if (!Parser) throw new Error('DOMParser is required to read GeoGebra XML.');
    const document = new Parser().parseFromString(xmlString, 'application/xml');
    if (document.querySelector('parsererror')) throw new Error('Dữ liệu GeoGebra không hợp lệ.');

    const api = configuration.api || null;
    const options = {
      simple: configuration.simple !== false,
      labels: configuration.labels !== false,
      clip: configuration.clip !== false,
      axes: Boolean(configuration.axes),
      grid: Boolean(configuration.grid),
      precision: Math.min(6, Math.max(1, number(configuration.precision, 3))),
    };
    const fmt = value => cleanNumber(value, options.precision);
    const bounds = viewBounds(document, api);
    const view = viewPreferences(document);
    const commands = commandMap(document);
    const elements = [...document.querySelectorAll('construction > element')];
    const warnings = [];
    const usedNames = new Set();
    const points = new Map();
    const colors = new Map();
    const coordinateLines = [];
    const backgroundLines = [];
    const fillLines = [];
    const strokeLines = [];
    const pointLines = [];
    const labelLines = [];
    let visibleCount = 0;

    function colorName(rgb) {
      const key = `${rgb.r},${rgb.g},${rgb.b}`;
      if (key === '0,0,0') return 'black';
      if (!colors.has(key)) colors.set(key, `ggbcolor${colors.size + 1}`);
      return colors.get(key);
    }

    function pointFor(label) {
      return points.get(label) || null;
    }

    function coordinate(point) {
      return `(${fmt(point.x)},${fmt(point.y)})`;
    }

    function ref(label) {
      const point = pointFor(label);
      return point ? `(${point.name})` : null;
    }

    function styleFor(element, { fill = false, arrow = '' } = {}) {
      const colorNode = child(element, 'objColor');
      let rgb = {
        r: number(colorNode?.getAttribute('r'), 0),
        g: number(colorNode?.getAttribute('g'), 0),
        b: number(colorNode?.getAttribute('b'), 0),
      };
      if (options.simple) rgb = { r: 0, g: 0, b: 0 };
      const name = colorName(rgb);
      const line = child(element, 'lineStyle');
      const thickness = number(line?.getAttribute('thickness'), 5);
      const lineType = line?.getAttribute('type') || '0';
      const alpha = Math.max(0, Math.min(1, number(colorNode?.getAttribute('alpha'), 0)));
      const values = [`draw=${name}`, `line width=${fmt(options.simple ? .8 : Math.max(.25, thickness * .16))}pt`];
      if (lineType === '10' || lineType === '15') values.push('dashed');
      else if (lineType === '20') values.push('dotted');
      else if (lineType === '25' || lineType === '30') values.push('dash dot');
      if (arrow) values.push(arrow);
      if (fill && alpha > 0) values.push(`fill=${name}`, `fill opacity=${fmt(alpha)}`);
      return `[${values.join(', ')}]`;
    }

    function addPath(element, path, fill = false) {
      if (fill && number(child(element, 'objColor')?.getAttribute('alpha'), 0) > 0) {
        fillLines.push(`  \\filldraw${styleFor(element, { fill: true })} ${path};`);
      } else {
        strokeLines.push(`  \\draw${styleFor(element)} ${path};`);
      }
    }

    function addCoordinatesPlot(element, segments) {
      segments.filter(segment => segment.length >= 2).forEach(segment => {
        const rows = [];
        for (let index = 0; index < segment.length; index += 6) {
          rows.push(`    ${segment.slice(index, index + 6).map(coordinate).join(' ')}`);
        }
        strokeLines.push(`  \\draw${styleFor(element)} plot[smooth] coordinates {\n${rows.join('\n')}\n  };`);
      });
    }

    elements.forEach((element, index) => {
      if (element.getAttribute('type') !== 'point') return;
      const label = element.getAttribute('label') || `P${index + 1}`;
      const coords = child(element, 'coords');
      if (!coords) return;
      const z = number(coords.getAttribute('z'), 1);
      if (Math.abs(z) < EPS) return;
      const point = {
        x: number(coords.getAttribute('x')) / z,
        y: number(coords.getAttribute('y')) / z,
        name: safeName(label, index, usedNames),
        label,
      };
      points.set(label, point);
    });

    points.forEach(point => {
      coordinateLines.push(`  \\coordinate (${point.name}) at ${coordinate(point)};`);
    });

    if (options.grid) {
      const dx = Math.max(.05, view.distX);
      const dy = Math.max(.05, view.distY);
      backgroundLines.push(
        `  \\draw[xstep=${fmt(dx)}, ystep=${fmt(dy)}, help lines, color=gray!28, line width=.25pt] ` +
        `${coordinate({ x: bounds.xmin, y: bounds.ymin })} grid ${coordinate({ x: bounds.xmax, y: bounds.ymax })};`,
      );
    }
    if (options.axes) {
      if (bounds.ymin <= 0 && bounds.ymax >= 0) {
        backgroundLines.push(
          `  \\draw[-{Stealth[length=4pt]}, color=black!72, line width=.55pt] ` +
          `(${fmt(bounds.xmin)},0) -- (${fmt(bounds.xmax)},0) node[below left] {$x$};`,
        );
      }
      if (bounds.xmin <= 0 && bounds.xmax >= 0) {
        backgroundLines.push(
          `  \\draw[-{Stealth[length=4pt]}, color=black!72, line width=.55pt] ` +
          `(0,${fmt(bounds.ymin)}) -- (0,${fmt(bounds.ymax)}) node[below left] {$y$};`,
        );
      }
    }

    const processedPolygons = new Set();
    const unsupported = new Set();

    elements.forEach(element => {
      const label = element.getAttribute('label') || '';
      const type = element.getAttribute('type') || '';
      const show = child(element, 'show');
      if (!boolAttr(show, 'object', false)) return;
      visibleCount += 1;
      const showLabel = options.labels && boolAttr(show, 'label', false);
      const command = commands.get(label);

      if (api && /^Integral(Between)?$/i.test(command?.name || '')) {
        const between = /Between/i.test(command.name);
        const firstFunction = command.inputs[0];
        const secondFunction = between ? command.inputs[1] : null;
        const lowerInput = command.inputs[between ? 2 : 1];
        const upperInput = command.inputs[between ? 3 : 2];
        const evaluate = expression => {
          const direct = Number(expression);
          if (Number.isFinite(direct)) return direct;
          try {
            return number(api.getValue(expression), NaN);
          } catch (_) {
            return NaN;
          }
        };
        const lower = evaluate(lowerInput);
        const upper = evaluate(upperInput);
        const sample = functionLabel => {
          const values = [];
          for (let index = 0; index <= 90; index += 1) {
            const x = lower + (upper - lower) * index / 90;
            let y = NaN;
            try {
              y = number(api.getValue(`${functionLabel}(${x})`), NaN);
            } catch (_) {
              y = NaN;
            }
            if (!Number.isFinite(y)) return [];
            values.push({ x, y });
          }
          return values;
        };
        if (Number.isFinite(lower) && Number.isFinite(upper) && upper > lower) {
          const top = sample(firstFunction);
          const bottom = secondFunction
            ? sample(secondFunction).reverse()
            : [{ x: upper, y: 0 }, { x: lower, y: 0 }];
          if (top.length > 1 && bottom.length > 1) {
            const path = [...top, ...bottom].map(coordinate).join(' -- ');
            addPath(element, `${path} -- cycle`, true);
          } else {
            unsupported.add('miền tích phân gián đoạn');
          }
        } else {
          unsupported.add('miền tích phân');
        }
        return;
      }

      if (type === 'point') {
        const point = pointFor(label);
        if (!point) return;
        const colorNode = child(element, 'objColor');
        const rgb = options.simple ? { r: 0, g: 0, b: 0 } : {
          r: number(colorNode?.getAttribute('r'), 0),
          g: number(colorNode?.getAttribute('g'), 0),
          b: number(colorNode?.getAttribute('b'), 0),
        };
        const color = colorName(rgb);
        const radius = options.simple ? 1.15 : Math.max(.8, number(child(element, 'pointSize')?.getAttribute('val'), 5) * .28);
        const pointStyle = child(element, 'pointStyle')?.getAttribute('val') || '0';
        if (pointStyle === '1') {
          pointLines.push(`  \\draw[draw=${color}, line width=.7pt] (${point.name}) +(-${fmt(radius)}pt,-${fmt(radius)}pt) -- +(${fmt(radius)}pt,${fmt(radius)}pt) +(-${fmt(radius)}pt,${fmt(radius)}pt) -- +(${fmt(radius)}pt,-${fmt(radius)}pt);`);
        } else if (pointStyle === '2') {
          pointLines.push(`  \\draw[draw=${color}, line width=.7pt] (${point.name}) circle[radius=${fmt(radius)}pt];`);
        } else {
          pointLines.push(`  \\fill[${color}] (${point.name}) circle[radius=${fmt(radius)}pt];`);
        }
        if (showLabel) {
          const offset = child(element, 'labelOffset');
          const dx = offset ? number(offset.getAttribute('x')) / 38 : .18;
          const dy = offset ? -number(offset.getAttribute('y')) / 38 : .2;
          labelLines.push(
            `  \\node[inner sep=1pt] at ($(${point.name})+(${fmt(dx)},${fmt(dy)})$) {$${texMathLabel(label)}$};`,
          );
        }
        return;
      }

      if (type === 'segment') {
        if (command?.name === 'Polygon') return;
        if (command?.name === 'Segment') {
          const first = ref(command.inputs[0]);
          const second = ref(command.inputs[1]);
          if (first && second) strokeLines.push(`  \\draw${styleFor(element)} ${first} -- ${second};`);
        }
        return;
      }

      if (type === 'vector') {
        if (command?.name === 'Vector') {
          const first = command.inputs.length > 1 ? ref(command.inputs[0]) : '(0,0)';
          const second = ref(command.inputs.at(-1));
          if (first && second) strokeLines.push(`  \\draw${styleFor(element, { arrow: '-{Stealth[length=5pt]}' })} ${first} -- ${second};`);
        }
        return;
      }

      if (type === 'line' || type === 'ray') {
        let first = command ? pointFor(command.inputs[0]) : null;
        let second = command ? pointFor(command.inputs[1]) : null;
        let direction = first && second ? { x: second.x - first.x, y: second.y - first.y } : null;
        if (!first || !direction || Math.hypot(direction.x, direction.y) < EPS) {
          const coords = child(element, 'coords');
          const a = number(coords?.getAttribute('x'), NaN);
          const b = number(coords?.getAttribute('y'), NaN);
          const c = number(coords?.getAttribute('z'), NaN);
          if ([a, b, c].every(Number.isFinite) && Math.hypot(a, b) > EPS) {
            first = Math.abs(b) > Math.abs(a) ? { x: 0, y: -c / b } : { x: -c / a, y: 0 };
            direction = { x: -b, y: a };
          }
        }
        if (first && direction) {
          const clipped = clipParametric(first, direction, bounds, type === 'ray' ? 0 : -Infinity, Infinity);
          if (clipped) strokeLines.push(`  \\draw${styleFor(element)} ${coordinate(clipped.a)} -- ${coordinate(clipped.b)};`);
        }
        return;
      }

      if (type === 'polyline') {
        const coordinates = (command?.inputs || []).map(ref).filter(Boolean);
        if (coordinates.length >= 2) strokeLines.push(`  \\draw${styleFor(element)} ${coordinates.join(' -- ')};`);
        return;
      }

      if (type === 'polygon') {
        if (processedPolygons.has(label)) return;
        processedPolygons.add(label);
        let pointLabels = command?.inputs || [];
        if (pointLabels.length === 3 && Number.isFinite(Number(pointLabels[2]))) {
          const first = pointFor(pointLabels[0]);
          const second = pointFor(pointLabels[1]);
          const sides = Math.round(Number(pointLabels[2]));
          if (first && second && sides >= 3 && sides <= 100) {
            // GeoGebra's Polygon(A,B,n) uses the regular polygon on the
            // left-hand side of the directed edge A→B.
            const dx = second.x - first.x;
            const dy = second.y - first.y;
            const side = Math.hypot(dx, dy);
            const step = (2 * Math.PI) / sides;
            const vertices = [first, second];
            for (let vertexIndex = 2; vertexIndex < sides; vertexIndex += 1) {
              const previous = vertices[vertexIndex - 1];
              const prior = vertices[vertexIndex - 2];
              const vx = previous.x - prior.x;
              const vy = previous.y - prior.y;
              vertices.push({
                x: previous.x + vx * Math.cos(step) - vy * Math.sin(step),
                y: previous.y + vx * Math.sin(step) + vy * Math.cos(step),
              });
            }
            addPath(element, `${vertices.map(coordinate).join(' -- ')} -- cycle`, true);
            return;
          }
          pointLabels = command.outputs.filter(output => points.has(output));
        }
        const coordinates = pointLabels.map(ref).filter(Boolean);
        if (coordinates.length >= 3) addPath(element, `${coordinates.join(' -- ')} -- cycle`, true);
        return;
      }

      if (type === 'conic') {
        const conic = conicFromMatrix(element);
        if (conic?.kind === 'ellipse') {
          const path = `${coordinate(conic.center)} ellipse [x radius=${fmt(conic.radius1)}, y radius=${fmt(conic.radius2)}, rotate=${fmt(conic.rotation)}]`;
          addPath(element, path, true);
        } else if (conic?.kind === 'hyperbola') {
          const extent = Math.max(bounds.xmax - bounds.xmin, bounds.ymax - bounds.ymin);
          const limit = Math.max(1.5, Math.acosh(Math.max(1.01, extent / Math.max(conic.a, .1))));
          const rotation = conic.rotation * Math.PI / 180;
          const rotate = point => ({
            x: conic.center.x + point.x * Math.cos(rotation) - point.y * Math.sin(rotation),
            y: conic.center.y + point.x * Math.sin(rotation) + point.y * Math.cos(rotation),
          });
          const branches = [-1, 1].map(sign => {
            const values = [];
            for (let index = 0; index <= 80; index += 1) {
              const t = -limit + 2 * limit * index / 80;
              values.push(rotate({ x: sign * conic.a * Math.cosh(t), y: conic.b * Math.sinh(t) }));
            }
            return values;
          });
          addCoordinatesPlot(element, branches);
        } else if (command?.name === 'Circle') {
          const center = pointFor(command.inputs[0]);
          const through = pointFor(command.inputs[1]);
          const radius = through && center ? distance(center, through) : number(command.inputs[1], NaN);
          if (center && Number.isFinite(radius)) addPath(element, `${ref(command.inputs[0])} circle[radius=${fmt(radius)}]`, true);
        } else if (conic?.kind === 'parabola') {
          // In the principal frame the equation is
          //   λ s² + 2 dₛ s + 2 dₜ t + f = 0.
          // The null eigenvector is the parabola axis; sample s and solve t.
          const { a, b, c, d, e, f } = conic.coefficients;
          const trace = a + c;
          const uLength = Math.hypot(a, b) > EPS ? Math.hypot(a, b) : Math.hypot(b, c);
          const ux = Math.hypot(a, b) > EPS ? a / uLength : b / uLength;
          const uy = Math.hypot(a, b) > EPS ? b / uLength : c / uLength;
          const vx = -uy;
          const vy = ux;
          const ds = d * ux + e * uy;
          const dt = d * vx + e * vy;
          if (Math.abs(trace) > EPS && Math.abs(dt) > EPS) {
            const span = Math.hypot(bounds.xmax - bounds.xmin, bounds.ymax - bounds.ymin) * 1.5;
            const samples = 180;
            const segments = [];
            let current = [];
            for (let sampleIndex = 0; sampleIndex <= samples; sampleIndex += 1) {
              const s = -span + (2 * span * sampleIndex) / samples;
              const t = -(trace * s * s + 2 * ds * s + f) / (2 * dt);
              const point = { x: ux * s + vx * t, y: uy * s + vy * t };
              const valid = Number.isFinite(point.x) && Number.isFinite(point.y)
                && point.x >= bounds.xmin - span && point.x <= bounds.xmax + span
                && point.y >= bounds.ymin - span && point.y <= bounds.ymax + span;
              if (!valid) {
                if (current.length >= 2) segments.push(current);
                current = [];
              } else {
                current.push(point);
              }
            }
            if (current.length >= 2) segments.push(current);
            addCoordinatesPlot(element, segments);
          } else {
            unsupported.add('parabola suy biến');
          }
        } else {
          unsupported.add('conic');
        }
        return;
      }

      if (['conicpart', 'arc', 'sector', 'semicircle'].includes(type)) {
        const center = pointFor(command?.inputs[0]);
        const startPoint = pointFor(command?.inputs[1]);
        const endPoint = pointFor(command?.inputs[2]);
        if (command?.name === 'Semicircle') {
          const first = pointFor(command.inputs[0]);
          const second = pointFor(command.inputs[1]);
          if (first && second) {
            const centerPoint = { x: (first.x + second.x) / 2, y: (first.y + second.y) / 2 };
            const radius = distance(first, second) / 2;
            const start = angleOf(centerPoint, first);
            addPath(element, `${coordinate(first)} arc[start angle=${fmt(start)}, end angle=${fmt(start + 180)}, radius=${fmt(radius)}]`, false);
          }
          return;
        }
        if (center && startPoint && endPoint) {
          const radius = distance(center, startPoint);
          const reflex = boolAttr(child(element, 'forceReflexAngle'), 'val', false);
          const [startAngle, endAngle] = normalizedArc(angleOf(center, startPoint), angleOf(center, endPoint), reflex);
          const arc = `${coordinate(startPoint)} arc[start angle=${fmt(startAngle)}, end angle=${fmt(endAngle)}, radius=${fmt(radius)}]`;
          if (/Sector/i.test(command?.name || '') || type === 'sector') {
            addPath(element, `${coordinate(center)} -- ${arc} -- cycle`, true);
          } else {
            addPath(element, arc, false);
          }
        } else {
          unsupported.add('cung đặc biệt');
        }
        return;
      }

      if (type === 'angle') {
        const a = pointFor(command?.inputs[0]);
        const vertex = pointFor(command?.inputs[1]);
        const c = pointFor(command?.inputs[2]);
        if (a && vertex && c) {
          const firstVector = { x: a.x - vertex.x, y: a.y - vertex.y };
          const secondVector = { x: c.x - vertex.x, y: c.y - vertex.y };
          const firstLength = Math.hypot(firstVector.x, firstVector.y);
          const secondLength = Math.hypot(secondVector.x, secondVector.y);
          if (firstLength > EPS && secondLength > EPS) {
            const dot = firstVector.x * secondVector.x + firstVector.y * secondVector.y;
            const cosine = Math.max(-1, Math.min(1, dot / (firstLength * secondLength)));
            const radius = Math.max(.24, number(child(element, 'arcSize')?.getAttribute('val'), 30) / 75);
            const start = angleOf(vertex, a);
            const [startAngle, endAngle] = normalizedArc(start, angleOf(vertex, c), boolAttr(child(element, 'forceReflexAngle'), 'val', false));
            if (Math.abs(cosine) < .015) {
              const u = { x: firstVector.x / firstLength * radius, y: firstVector.y / firstLength * radius };
              const v = { x: secondVector.x / secondLength * radius, y: secondVector.y / secondLength * radius };
              const p1 = { x: vertex.x + u.x, y: vertex.y + u.y };
              const p2 = { x: vertex.x + u.x + v.x, y: vertex.y + u.y + v.y };
              const p3 = { x: vertex.x + v.x, y: vertex.y + v.y };
              addPath(element, `${coordinate(p1)} -- ${coordinate(p2)} -- ${coordinate(p3)}`, false);
            } else {
              const arcStart = {
                x: vertex.x + radius * Math.cos(startAngle * Math.PI / 180),
                y: vertex.y + radius * Math.sin(startAngle * Math.PI / 180),
              };
              addPath(element, `${coordinate(arcStart)} arc[start angle=${fmt(startAngle)}, end angle=${fmt(endAngle)}, radius=${fmt(radius)}]`, false);
            }
          }
        }
        return;
      }

      if (type === 'text') {
        let value = '';
        try {
          value = api?.getValueString?.(label) || '';
        } catch (_) {
          value = '';
        }
        value ||= child(element, 'textString')?.getAttribute('val') || child(element, 'text')?.getAttribute('val') || '';
        if (!value) return;
        const isLatex = child(element, 'isLaTeX')?.getAttribute('val') === 'true';
        let location = null;
        try {
          const x = api?.getXcoord?.(label);
          const y = api?.getYcoord?.(label);
          if (Number.isFinite(x) && Number.isFinite(y)) location = { x, y };
        } catch (_) {
          location = null;
        }
        const start = child(element, 'startPoint');
        if (!location && start?.getAttribute('exp')) location = pointFor(start.getAttribute('exp'));
        if (!location && start?.hasAttribute('x')) {
          const z = number(start.getAttribute('z'), 1) || 1;
          location = { x: number(start.getAttribute('x')) / z, y: number(start.getAttribute('y')) / z };
        }
        if (!location) location = { x: 0, y: 0 };
        labelLines.push(`  \\node[anchor=west] at ${coordinate(location)} {${isLatex ? `$${value}$` : texText(value)}};`);
        return;
      }

      if (type === 'function' && api && typeof api.getValue === 'function') {
        const samples = 180;
        const margin = (bounds.ymax - bounds.ymin) * 2;
        const segments = [];
        let current = [];
        for (let index = 0; index <= samples; index += 1) {
          const x = bounds.xmin + (bounds.xmax - bounds.xmin) * index / samples;
          let y = NaN;
          try {
            y = number(api.getValue(`${label}(${x})`), NaN);
          } catch (_) {
            y = NaN;
          }
          const valid = Number.isFinite(y) && y >= bounds.ymin - margin && y <= bounds.ymax + margin;
          const jump = current.length && Math.abs(y - current.at(-1).y) > (bounds.ymax - bounds.ymin) * .8;
          if (!valid || jump) {
            if (current.length >= 2) segments.push(current);
            current = valid ? [{ x, y }] : [];
          } else {
            current.push({ x, y });
          }
        }
        if (current.length >= 2) segments.push(current);
        addCoordinatesPlot(element, segments);
        return;
      }

      if (!['numeric', 'boolean', 'list', 'button', 'image'].includes(type)) unsupported.add(type || 'không xác định');
    });

    if (unsupported.size) {
      warnings.push(`Chưa chuyển đổi hoàn toàn: ${[...unsupported].join(', ')}.`);
    }

    const colorDefinitions = [...colors.entries()].map(([rgb, name]) => {
      const [r, g, b] = rgb.split(',');
      return `\\definecolor{${name}}{RGB}{${r},${g},${b}}`;
    });
    const header = [
      '% GeoGebra → TikZ thuần · ConicTypst',
      '% Preamble: \\usepackage{tikz}',
      '%           \\usetikzlibrary{arrows.meta,calc}',
      ...colorDefinitions,
      '\\begin{tikzpicture}[line cap=round, line join=round, >=Stealth]',
    ];
    const body = [];
    if (options.clip) body.push(`  \\clip ${coordinate({ x: bounds.xmin, y: bounds.ymin })} rectangle ${coordinate({ x: bounds.xmax, y: bounds.ymax })};`);
    body.push(...backgroundLines, ...coordinateLines);
    if (coordinateLines.length && (fillLines.length || strokeLines.length)) body.push('');
    body.push(...fillLines, ...strokeLines);
    if ((fillLines.length || strokeLines.length) && (pointLines.length || labelLines.length)) body.push('');
    body.push(...pointLines, ...labelLines);
    const code = [...header, ...body, '\\end{tikzpicture}', ''].join('\n');

    return {
      code,
      count: visibleCount,
      warnings,
      bounds,
      supported: visibleCount - unsupported.size,
    };
  }

  root.TikzGeoGebraExporter = {
    exportTikz,
    helpers: { cleanNumber, texText, texMathLabel, clipParametric, conicFromMatrix },
  };
})(typeof window !== 'undefined' ? window : globalThis);
