export class DisplayRenderer {
  constructor(container) {
    this.container = container;
  }

  // Cập nhật thanh trạng thái
  updateStatusBar(state) {
    const el = this.container.querySelector('.lcd-status-bar');
    if (!el) return;

    el.querySelector('.st-shift')?.classList.toggle('active', state.shift);
    el.querySelector('.st-alpha')?.classList.toggle('active', state.alpha);
    el.querySelector('.st-mem')?.classList.toggle('active', state.hasMem);
    el.querySelector('.st-sto')?.classList.toggle('active', state.sto);

    const unitEl = el.querySelector('.st-angle');
    if (unitEl) {
      unitEl.textContent = state.angleUnit === 'DEG' ? 'D' : state.angleUnit === 'RAD' ? 'R' : 'G';
      unitEl.classList.add('active');
    }

    el.querySelector('.st-math')?.classList.toggle('active', true);
  }

  // Render màn hình tính toán chuẩn (Mode 1 COMP)
  renderCalcScreen(inputStr, cursorPos, resultObj, isFracView = false) {
    const screenEl = this.container.querySelector('.lcd-main-screen');
    if (!screenEl) return;

    let beforeCursor = inputStr.slice(0, cursorPos);
    let afterCursor = inputStr.slice(cursorPos);

    const formatExpr = (s) => {
      return s
        .replace(/sqrt\(/g, '√(')
        .replace(/cbrt\(/g, '∛(')
        .replace(/\*/g, '×')
        .replace(/\//g, '÷')
        .replace(/-/g, '−')
        .replace(/pi/g, 'π');
    };

    const formattedBefore = formatExpr(beforeCursor);
    const formattedAfter = formatExpr(afterCursor);

    const inputHtml = `
      <div class="lcd-input-line">
        <span class="expr-text">${formattedBefore}</span><span class="lcd-cursor"></span><span class="expr-text">${formattedAfter}</span>
      </div>
    `;

    let resultHtml = '';
    if (resultObj) {
      if (resultObj.error) {
        resultHtml = `<div class="lcd-error-text">${resultObj.error}</div>`;
      } else if (resultObj.fact) {
        resultHtml = `<div class="lcd-result-text" style="font-size:15px;">${resultObj.fact}</div>`;
      } else if (resultObj.solve) {
        resultHtml = `
          <div class="lcd-solve-res" style="font-size:13px; font-weight:800; text-align:right;">
            <div>x = ${resultObj.solve.x}</div>
            <div style="font-size:10px; color:#2c3a27;">L - R = ${resultObj.solve.lMinusR}</div>
          </div>
        `;
      } else if (resultObj.calcPrompt) {
        resultHtml = `<div class="lcd-result-text" style="font-size:16px;">${resultObj.calcPrompt}</div>`;
      } else if (isFracView && resultObj.fraction && !resultObj.fraction.isInteger()) {
        resultHtml = `
          <div class="lcd-fraction-view">
            <span class="frac-top">${resultObj.fraction.n}</span>
            <span class="frac-line"></span>
            <span class="frac-bottom">${resultObj.fraction.d}</span>
          </div>
        `;
      } else {
        resultHtml = `<div class="lcd-result-text">${resultObj.formatted || resultObj.number}</div>`;
      }
    }

    screenEl.innerHTML = `
      ${inputHtml}
      <div class="lcd-result-area">${resultHtml}</div>
    `;
  }

  // Render màn hình Bảng giá trị (Mode 7 TABLE) y hệt ảnh mẫu của người dùng
  renderTableScreen(tableRows, selectedRowIndex = 0, selectedCol = 'fx') {
    const screenEl = this.container.querySelector('.lcd-main-screen');
    if (!screenEl) return;

    let rowsHtml = '';
    tableRows.forEach((row, idx) => {
      const isRowSel = idx === selectedRowIndex;
      rowsHtml += `
        <tr class="${isRowSel ? 'row-selected' : ''}">
          <td class="col-num">${row.index}</td>
          <td class="col-x ${isRowSel && selectedCol === 'x' ? 'cell-focused' : ''}">${row.x}</td>
          <td class="col-fx ${isRowSel && selectedCol === 'fx' ? 'cell-focused' : ''}">${row.fx}</td>
          ${row.gx !== null ? `<td class="col-gx ${isRowSel && selectedCol === 'gx' ? 'cell-focused' : ''}">${row.gx}</td>` : ''}
        </tr>
      `;
    });

    const hasG = tableRows.length > 0 && tableRows[0].gx !== null;
    const curRow = tableRows[selectedRowIndex] || { x: 0, fx: '', gx: '' };
    const curVal = selectedCol === 'x' ? curRow.x : selectedCol === 'gx' ? curRow.gx : curRow.fx;

    screenEl.innerHTML = `
      <div class="lcd-table-view">
        <div class="table-scroll-container">
          <table class="casio-table">
            <thead>
              <tr>
                <th class="col-num"></th>
                <th class="col-x">x</th>
                <th class="col-fx">f(x)</th>
                ${hasG ? `<th class="col-gx">g(x)</th>` : ''}
              </tr>
            </thead>
            <tbody>
              ${rowsHtml}
            </tbody>
          </table>
        </div>
        <div class="table-bottom-bar">
          <span class="table-detail-val">${curVal}</span>
        </div>
      </div>
    `;

    const selEl = screenEl.querySelector('.row-selected');
    if (selEl) {
      selEl.scrollIntoView({ block: 'nearest' });
    }
  }

  // Render màn hình Giải phương trình (Mode 8 EQUATION)
  renderEquationResult(result) {
    const screenEl = this.container.querySelector('.lcd-main-screen');
    if (!screenEl) return;

    let contentHtml = '';
    if (result.error) {
      contentHtml = `<div class="lcd-error-text">${result.error}</div>`;
    } else if (result.roots) {
      let rootsHtml = result.roots.map((r, i) => `
        <div class="eq-root-item">
          <span class="root-label">x${i + 1} = </span>
          <span class="root-val">${r.toString()}</span>
        </div>
      `).join('');

      let vertexHtml = '';
      if (result.vertex) {
        vertexHtml = `
          <div class="eq-vertex-section">
            <div class="vertex-title">Parabola ${result.vertex.type}:</div>
            <div>X = ${result.vertex.x}</div>
            <div>Y = ${result.vertex.y}</div>
          </div>
        `;
      }

      contentHtml = `
        <div class="eq-result-container">
          ${rootsHtml}
          ${vertexHtml}
        </div>
      `;
    } else if (result.linearRoots) {
      const labels = ['x', 'y', 'z', 't'];
      const rootsHtml = result.linearRoots.map((v, i) => `
        <div class="eq-root-item">
          <span class="root-label">${labels[i]} = </span>
          <span class="root-val">${v}</span>
        </div>
      `).join('');
      contentHtml = `<div class="eq-result-container">${rootsHtml}</div>`;
    }

    screenEl.innerHTML = contentHtml;
  }

  // Render Menu Setup các chế độ Mode
  renderMenu(menuItems, onSelect) {
    const screenEl = this.container.querySelector('.lcd-main-screen');
    if (!screenEl) return;

    let itemsHtml = menuItems.map(item => `
      <div class="menu-item" data-code="${item.code}">
        <span class="menu-num">${item.num}:</span>
        <span class="menu-title">${item.title}</span>
      </div>
    `).join('');

    screenEl.innerHTML = `
      <div class="lcd-menu-grid">
        <div class="menu-header">MENU SETUP</div>
        <div class="menu-list">${itemsHtml}</div>
      </div>
    `;
  }

  // Render Menu OPTN (Options)
  renderOptn(optnItems) {
    const screenEl = this.container.querySelector('.lcd-main-screen');
    if (!screenEl) return;

    let itemsHtml = optnItems.map(item => `
      <div class="menu-item">
        <span class="menu-num">${item.num}:</span>
        <span class="menu-title">${item.title}</span>
      </div>
    `).join('');

    screenEl.innerHTML = `
      <div class="lcd-menu-grid">
        <div class="menu-header" style="color:#1d4ed8;">OPTION MENU</div>
        <div class="menu-list">${itemsHtml}</div>
      </div>
    `;
  }
}
