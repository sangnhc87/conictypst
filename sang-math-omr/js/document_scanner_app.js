(function () {
  'use strict';
  const byId = id => document.getElementById(id);
  const state = {
    ready: false, stream: null, timer: null, busy: false, capturing: false,
    analysis: document.createElement('canvas'), lastCorners: null, stable: 0,
    waitingForRemoval: false, missingFrames: 0, pages: [], thumbUrls: [],
    cropSource: null, cropPoints: null, cropExistingId: null, dragging: -1,
    pendingImports: [], importing: false
  };
  const video = byId('scanVideo');
  const overlay = byId('liveOverlay');
  const cropCanvas = byId('cropCanvas');
  const status = message => { byId('scanStatus').textContent = message; };
  const notice = message => { byId('exportStatus').textContent = message; };
  const makeCanvas = (width, height) => {
    const canvas = document.createElement('canvas');
    canvas.width = width; canvas.height = height;
    return canvas;
  };
  const canvasBlob = (canvas, quality = .88) => new Promise((resolve, reject) =>
    canvas.toBlob(blob => blob ? resolve(blob) : reject(new Error('Không nén được ảnh trang.')), 'image/jpeg', quality));
  const readDataUrl = blob => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = () => reject(reader.error);
    reader.readAsDataURL(blob);
  });
  async function canvasFromBlob(blob, maxEdge = 3000) {
    const bitmap = await createImageBitmap(blob);
    const scale = Math.min(1, maxEdge / Math.max(bitmap.width, bitmap.height));
    const canvas = makeCanvas(Math.round(bitmap.width * scale), Math.round(bitmap.height * scale));
    canvas.getContext('2d', { alpha: false }).drawImage(bitmap, 0, 0, canvas.width, canvas.height);
    bitmap.close();
    return canvas;
  }
  function updateButtons() {
    const hasPages = state.pages.length > 0;
    byId('pageCount').textContent = state.pages.length;
    for (const id of ['downloadPdf', 'gradePdf', 'clearPages']) byId(id).disabled = !hasPages;
    byId('manualShutter').disabled = !state.stream || !state.ready;
  }
  function renderQueue() {
    state.thumbUrls.forEach(url => URL.revokeObjectURL(url));
    state.thumbUrls = [];
    const queue = byId('scanQueue');
    queue.replaceChildren();
    if (!state.pages.length) {
      const empty = document.createElement('div');
      empty.className = 'queue-empty';
      empty.textContent = 'Chưa có trang. Mỗi phiếu A4 sau khi quét sẽ xuất hiện ở đây để xem lại, sửa góc hoặc đổi thứ tự.';
      queue.appendChild(empty);
    }
    state.pages.forEach((page, index) => {
      const item = document.createElement('div'); item.className = 'scan-item';
      const img = document.createElement('img');
      const url = URL.createObjectURL(page.blob); state.thumbUrls.push(url); img.src = url;
      img.alt = `Trang ${index + 1}`;
      const meta = document.createElement('div'); meta.className = 'meta';
      const title = document.createElement('strong'); title.textContent = `Trang ${index + 1}`;
      const info = document.createElement('small');
      info.textContent = `${page.width} × ${page.height} px · ${(page.blob.size / 1024).toFixed(0)} KB`;
      const actions = document.createElement('div'); actions.className = 'actions';
      const action = (text, handler, warn = false) => {
        const button = document.createElement('button'); button.type = 'button';
        button.className = `page-action${warn ? ' warn' : ''}`; button.textContent = text;
        button.onclick = handler; actions.appendChild(button);
      };
      action('↑', () => movePage(index, -1)); action('↓', () => movePage(index, 1));
      action('Sửa góc', () => editPage(page)); action('Xóa', () => removePage(page), true);
      meta.append(title, info, actions); item.append(img, meta); queue.appendChild(item);
    });
    updateButtons();
  }
  async function persistOrder() {
    await Promise.all(state.pages.map((page, index) => {
      page.order = index;
      return window.OmrDocumentScanStore.savePage(page);
    }));
  }
  async function movePage(index, direction) {
    const target = index + direction;
    if (target < 0 || target >= state.pages.length) return;
    [state.pages[index], state.pages[target]] = [state.pages[target], state.pages[index]];
    renderQueue();
    try { await persistOrder(); } catch { notice('Không lưu được thứ tự mới; hãy xuất PDF trước khi đóng trang.'); }
  }
  async function removePage(page) {
    if (!confirm('Xóa trang này khỏi PDF đang quét?')) return;
    state.pages = state.pages.filter(item => item.id !== page.id);
    renderQueue();
    try { await window.OmrDocumentScanStore.deletePage(page.id); await persistOrder(); }
    catch { notice('Trang đã bỏ khỏi danh sách hiện tại nhưng chưa lưu được thay đổi vào thiết bị.'); }
  }
  async function saveRectified(canvas, sourceBlob, existingId = null) {
    const mode = byId('scanMode').value;
    let output = canvas;
    if (mode === 'gray') {
      output = makeCanvas(canvas.width, canvas.height);
      const context = output.getContext('2d', { alpha: false });
      context.filter = 'grayscale(1) contrast(1.08)';
      context.drawImage(canvas, 0, 0);
    }
    const blob = await canvasBlob(output);
    const previous = state.pages.find(page => page.id === existingId);
    const page = {
      id: existingId || crypto.randomUUID(), order: previous?.order ?? state.pages.length,
      createdAt: previous?.createdAt || Date.now(), width: output.width, height: output.height,
      blob, sourceBlob: sourceBlob || previous?.sourceBlob || blob
    };
    if (previous) Object.assign(previous, page);
    else state.pages.push(page);
    renderQueue();
    try { await window.OmrDocumentScanStore.savePage(page); }
    catch { notice('Bộ nhớ thiết bị đang đầy. Trang vẫn còn trong phiên này; hãy xuất PDF ngay.'); }
    status(`Đã quét ${state.pages.length} trang · nhấc phiếu cũ ra để quét tiếp.`);
  }
  function drawOverlay(corners, color = '#39dfad') {
    const context = overlay.getContext('2d');
    context.clearRect(0, 0, overlay.width, overlay.height);
    if (!corners) return;
    context.beginPath();
    context.moveTo(corners[0].x, corners[0].y);
    corners.slice(1).forEach(point => context.lineTo(point.x, point.y));
    context.closePath();
    context.fillStyle = '#19d9a520'; context.fill();
    context.strokeStyle = color; context.lineWidth = 3; context.stroke();
    corners.forEach(point => {
      context.beginPath(); context.arc(point.x, point.y, 6, 0, Math.PI * 2);
      context.fillStyle = color; context.fill();
    });
  }
  function closeCorners(left, right) {
    if (!left || !right) return false;
    const limit = Math.max(state.analysis.width, state.analysis.height) * .017;
    return left.every((point, index) =>
      Math.hypot(point.x - right[index].x, point.y - right[index].y) < limit);
  }
  async function inspectFrame() {
    if (state.busy || state.capturing || !state.ready || !state.stream || video.readyState < 2) return;
    state.busy = true;
    try {
      const analysis = state.analysis;
      const scale = Math.min(1, 820 / video.videoWidth);
      analysis.width = Math.round(video.videoWidth * scale);
      analysis.height = Math.round(video.videoHeight * scale);
      analysis.getContext('2d', { alpha: false }).drawImage(video, 0, 0, analysis.width, analysis.height);
      if (overlay.width !== analysis.width || overlay.height !== analysis.height) {
        overlay.width = analysis.width; overlay.height = analysis.height;
      }
      const found = window.OmrA4Scanner.detect(analysis);
      const ratio = found ? Math.max(found.width, found.height) / Math.max(1, Math.min(found.width, found.height)) : 0;
      const a3Phach = byId('scanProfile')?.value === 'a3-phach';
      const valid = found && found.fraction >= .27 && ratio >= 1.24 && ratio <= (a3Phach ? 1.90 : 1.72);
      if (!valid) {
        drawOverlay(null); state.lastCorners = null; state.stable = 0;
        if (state.waitingForRemoval && ++state.missingFrames >= 3) {
          state.waitingForRemoval = false; state.missingFrames = 0;
        }
        status(state.waitingForRemoval ? 'Nhấc phiếu vừa quét ra để quét tờ tiếp theo.' :
          (a3Phach ? 'Căn riêng phần OMR đã cắt phách và gấp lại, đủ bốn mép giấy.' :
          'Căn toàn bộ trang A4 trên nền tối, tránh bóng và giữ điện thoại song song.'));
        return;
      }
      drawOverlay(found.points, state.waitingForRemoval ? '#ffc371' : '#39dfad');
      if (state.waitingForRemoval) { state.missingFrames = 0; status('Nhấc phiếu vừa quét ra để tránh quét trùng.'); return; }
      state.stable = closeCorners(found.points, state.lastCorners) ? state.stable + 1 : 1;
      state.lastCorners = found.points;
      const focus = window.OmrA4Scanner.focusScore?.(analysis) ?? 100;
      if (focus < 38) { status('Ảnh hơi mờ: chạm lấy nét, tăng sáng và giữ máy đứng yên.'); state.stable = 0; return; }
      status(`Đã nhận ${a3Phach ? 'phần OMR A3' : 'trang A4'} · giữ yên ${Math.min(state.stable, 4)}/4`);
      if (state.stable >= 4) {
        state.capturing = true;
        await captureFrame(found.points);
        state.waitingForRemoval = true;
        state.stable = 0;
      }
    } catch (error) { status(`Không quét được khung hình: ${error.message || error}`); }
    finally { state.busy = false; state.capturing = false; }
  }
  async function captureFrame(corners = state.lastCorners) {
    const source = makeCanvas(video.videoWidth, video.videoHeight);
    source.getContext('2d', { alpha: false }).drawImage(video, 0, 0);
    const sourceBlob = await canvasBlob(source, .94);
    byId('cameraStage').classList.add('flash');
    setTimeout(() => byId('cameraStage').classList.remove('flash'), 90);
    navigator.vibrate?.(35);
    if (!corners) return openCrop(source, null, null);
    try {
      const mapped = corners.map(point => ({
        x: point.x * source.width / state.analysis.width,
        y: point.y * source.height / state.analysis.height
      }));
      await saveRectified(window.OmrA4Scanner.rectify(source, mapped, 1600), sourceBlob);
    } catch (error) {
      status('Cần chỉnh góc thủ công trước khi lưu trang này.');
      openCrop(source, null, null);
    }
  }
  async function continueImports() {
    if (state.importing || byId('cropDialog').classList.contains('open')) return;
    state.importing = true;
    try {
      while (state.pendingImports.length) {
        const file = state.pendingImports.shift();
        try {
          const source = await canvasFromBlob(file);
          const sourceBlob = await canvasBlob(source, .94);
          const found = window.OmrA4Scanner.detect(source);
          if (!found) {
            openCrop(source, sourceBlob, null);
            notice(`${file.name}: hãy chỉnh bốn góc rồi lưu để tiếp tục các ảnh còn lại.`);
            return;
          }
          await saveRectified(window.OmrA4Scanner.rectify(source, found.points, 1600), sourceBlob);
        } catch (error) { notice(`${file.name}: ${error.message || error}`); }
      }
    } finally { state.importing = false; }
  }
  async function importImages(files) {
    if (!state.ready) return notice('Đang tải bộ xử lý ảnh. Hãy thử lại sau ít giây.');
    state.pendingImports.push(...Array.from(files || []).slice(0, 200 - state.pages.length - state.pendingImports.length));
    await continueImports();
  }
  function renderCrop() {
    const canvas = cropCanvas, context = canvas.getContext('2d');
    context.drawImage(state.cropSource, 0, 0, canvas.width, canvas.height);
    const points = state.cropPoints;
    context.beginPath(); context.moveTo(points[0].x, points[0].y);
    points.slice(1).forEach(point => context.lineTo(point.x, point.y)); context.closePath();
    context.fillStyle = '#12c8a526'; context.fill();
    context.strokeStyle = '#08a77d'; context.lineWidth = 3; context.stroke();
    points.forEach((point, index) => {
      context.beginPath(); context.arc(point.x, point.y, 11, 0, Math.PI * 2);
      context.fillStyle = 'white'; context.fill();
      context.strokeStyle = '#057c67'; context.lineWidth = 3; context.stroke();
      context.fillStyle = '#075947'; context.font = 'bold 11px sans-serif';
      context.textAlign = 'center'; context.textBaseline = 'middle';
      context.fillText(String(index + 1), point.x, point.y);
    });
  }
  function openCrop(source, sourceBlob = null, existingId = null) {
    state.cropSource = source;
    state.cropSourceBlob = sourceBlob;
    state.cropExistingId = existingId;
    const scale = Math.min(1, 720 / source.width, 900 / source.height);
    cropCanvas.width = Math.round(source.width * scale);
    cropCanvas.height = Math.round(source.height * scale);
    const marginX = cropCanvas.width * .08, marginY = cropCanvas.height * .08;
    state.cropPoints = [
      { x: marginX, y: marginY }, { x: cropCanvas.width - marginX, y: marginY },
      { x: cropCanvas.width - marginX, y: cropCanvas.height - marginY },
      { x: marginX, y: cropCanvas.height - marginY }
    ];
    renderCrop(); byId('cropDialog').classList.add('open');
  }
  async function editPage(page) {
    try { openCrop(await canvasFromBlob(page.sourceBlob || page.blob), page.sourceBlob, page.id); }
    catch (error) { notice(`Không mở được ảnh gốc: ${error.message || error}`); }
  }
  function cropPointer(event) {
    const box = cropCanvas.getBoundingClientRect();
    return { x: (event.clientX - box.left) * cropCanvas.width / box.width,
      y: (event.clientY - box.top) * cropCanvas.height / box.height };
  }
  cropCanvas.addEventListener('pointerdown', event => {
    const point = cropPointer(event);
    const distances = state.cropPoints.map(corner => Math.hypot(corner.x - point.x, corner.y - point.y));
    const nearest = distances.indexOf(Math.min(...distances));
    if (distances[nearest] > 45) return;
    state.dragging = nearest; cropCanvas.setPointerCapture(event.pointerId);
  });
  cropCanvas.addEventListener('pointermove', event => {
    if (state.dragging < 0) return;
    const point = cropPointer(event);
    state.cropPoints[state.dragging] = {
      x: Math.max(0, Math.min(cropCanvas.width - 1, point.x)),
      y: Math.max(0, Math.min(cropCanvas.height - 1, point.y))
    };
    renderCrop();
  });
  cropCanvas.addEventListener('pointerup', () => { state.dragging = -1; });
  cropCanvas.addEventListener('pointercancel', () => { state.dragging = -1; });
  byId('cancelCrop').onclick = () => {
    byId('cropDialog').classList.remove('open');
    continueImports();
  };
  byId('acceptCrop').onclick = async () => {
    const button = byId('acceptCrop'); button.disabled = true;
    try {
      const corners = state.cropPoints.map(point => ({
        x: point.x * state.cropSource.width / cropCanvas.width,
        y: point.y * state.cropSource.height / cropCanvas.height
      }));
      const output = window.OmrA4Scanner.rectify(state.cropSource, corners, 1600);
      await saveRectified(output, state.cropSourceBlob || await canvasBlob(state.cropSource, .94), state.cropExistingId);
      byId('cropDialog').classList.remove('open');
      continueImports();
    } catch (error) { notice(`Không căn được trang: ${error.message || error}`); }
    finally { button.disabled = false; }
  };
  async function startCamera() {
    if (state.stream) return stopCamera();
    try {
      if (!navigator.mediaDevices?.getUserMedia) throw new Error('Trình duyệt không hỗ trợ camera. Hãy mở bằng HTTPS trong Chrome hoặc Safari.');
      state.stream = await navigator.mediaDevices.getUserMedia({ video: {
        facingMode: { ideal: 'environment' }, width: { ideal: 2560 }, height: { ideal: 1920 }, frameRate: { ideal: 30 }
      }, audio: false });
      video.srcObject = state.stream; await video.play();
      byId('cameraStage').style.aspectRatio = `${video.videoWidth} / ${video.videoHeight}`;
      byId('cameraEmpty').hidden = true;
      byId('cameraResolution').textContent = `${video.videoWidth} × ${video.videoHeight} px`;
      byId('startCamera').textContent = 'Tắt camera';
      const track = state.stream.getVideoTracks()[0];
      const capabilities = track.getCapabilities?.() || {};
      if (capabilities.focusMode?.includes?.('continuous'))
        track.applyConstraints({ advanced: [{ focusMode: 'continuous' }] }).catch(() => {});
      if (capabilities.torch) byId('torchButton').hidden = false;
      state.timer = setInterval(inspectFrame, 260);
      status(state.ready ? 'Đưa trọn trang A4 vào khung để tự quét.' : 'Camera đã mở; đang tải bộ nhận dạng A4…');
    } catch (error) { status(`Không mở được camera: ${error.message || error}`); stopCamera(); }
    updateButtons();
  }
  function stopCamera() {
    clearInterval(state.timer); state.timer = null;
    state.stream?.getTracks().forEach(track => track.stop());
    state.stream = null; video.srcObject = null;
    byId('cameraEmpty').hidden = false; byId('torchButton').hidden = true;
    byId('startCamera').textContent = 'Mở camera';
    state.lastCorners = null; state.stable = 0; state.waitingForRemoval = false;
    drawOverlay(null); status('Camera đã tắt. Có thể mở lại để quét tiếp.');
    updateButtons();
  }
  async function buildPdf() {
    if (!state.pages.length) throw new Error('Chưa có trang để xuất.');
    if (!window.jspdf?.jsPDF) throw new Error('Bộ tạo PDF chưa tải xong.');
    const { jsPDF } = window.jspdf;
    let pdf = null;
    for (let index = 0; index < state.pages.length; index++) {
      const page = state.pages[index];
      const landscape = page.width > page.height;
      const orientation = landscape ? 'landscape' : 'portrait';
      const width = landscape ? 297 : 210, height = landscape ? 210 : 297;
      if (!pdf) pdf = new jsPDF({ orientation, unit: 'mm', format: 'a4', compress: true });
      else pdf.addPage('a4', orientation);
      const dataUrl = await readDataUrl(page.blob);
      pdf.addImage(dataUrl, 'JPEG', 0, 0, width, height, `scan-${index}`, 'FAST');
      notice(`Đang tạo PDF: trang ${index + 1}/${state.pages.length}…`);
      await new Promise(resolve => setTimeout(resolve, 0));
    }
    return pdf.output('blob');
  }
  function pdfFilename() {
    const base = (byId('pdfName').value || 'Phieu-scan-ca-lop')
      .normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/đ/g, 'd')
      .replace(/[^A-Za-z0-9_-]+/g, '-').replace(/^-|-$/g, '').slice(0, 70);
    return `${base || 'Phieu-scan-ca-lop'}.pdf`;
  }
  byId('downloadPdf').onclick = async () => {
    const button = byId('downloadPdf'); button.disabled = true;
    try {
      const blob = await buildPdf(), url = URL.createObjectURL(blob);
      const link = document.createElement('a'); link.href = url; link.download = pdfFilename();
      document.body.appendChild(link); link.click(); link.remove();
      setTimeout(() => URL.revokeObjectURL(url), 60000);
      notice(`Đã tạo PDF ${state.pages.length} trang (${(blob.size / 1024 / 1024).toFixed(1)} MB).`);
    } catch (error) { notice(`Không xuất được PDF: ${error.message || error}`); }
    finally { updateButtons(); }
  };
  byId('gradePdf').onclick = async () => {
    const button = byId('gradePdf'); button.disabled = true;
    try {
      const blob = await buildPdf();
      await window.OmrDocumentScanStore.saveHandoff(blob, pdfFilename());
      location.href = './index.html?scanPdf=1';
    } catch (error) { notice(`Không chuyển sang chấm được: ${error.message || error}. Hãy tải PDF rồi nạp vào trang chấm.`); updateButtons(); }
  };
  byId('clearPages').onclick = async () => {
    if (!confirm(`Xóa toàn bộ ${state.pages.length} trang đã quét trên thiết bị này?`)) return;
    state.pages = []; renderQueue();
    try { await window.OmrDocumentScanStore.clearPages(); }
    catch { notice('Đã xóa phiên hiện tại nhưng bộ nhớ thiết bị chưa cập nhật.'); }
  };
  byId('startCamera').onclick = startCamera;
  byId('manualShutter').onclick = async () => {
    if (state.capturing || !state.stream) return;
    state.capturing = true;
    try { await captureFrame(); state.waitingForRemoval = true; }
    catch (error) { status(`Chụp chưa thành công: ${error.message || error}`); }
    finally { state.capturing = false; }
  };
  byId('torchButton').onclick = async () => {
    const track = state.stream?.getVideoTracks()[0];
    if (!track) return;
    const enabled = !byId('torchButton').classList.contains('on');
    try {
      await track.applyConstraints({ advanced: [{ torch: enabled }] });
      byId('torchButton').classList.toggle('on', enabled);
      byId('torchButton').textContent = enabled ? 'Tắt đèn' : 'Đèn pin';
    } catch { status('Camera này không bật được đèn pin.'); }
  };
  byId('importButton').onclick = () => byId('importImages').click();
  byId('importImages').onchange = async event => {
    await importImages(event.target.files);
    event.target.value = '';
  };
  window.onDocumentOpenCvReady = () => {
    const loaded = window.cv;
    const ready = target => { window.cv = target; state.ready = true; status('Đã sẵn sàng tự nhận trang A4.'); updateButtons(); };
    if (loaded?.then) loaded.then(ready).catch(() => status('Không tải được bộ nhận dạng A4.'));
    else if (typeof loaded?.imread === 'function') ready(loaded);
    else if (loaded) loaded.onRuntimeInitialized = () => ready(loaded);
  };
  window.addEventListener('beforeunload', stopCamera);
  window.OmrDocumentScanner = Object.freeze({ buildPdf, importImages, state });
  byId('scanProfile')?.addEventListener('change', () => {
    const a3Phach = byId('scanProfile').value === 'a3-phach';
    byId('scanTip').textContent = a3Phach
      ? 'Sau khi thu bài, đối chiếu mã phách ở bài và dải tên, cắt dải tên; gấp A3 ở giữa. Chỉ quét mặt có ô tô và đủ 8 mốc đen. Mỗi bài một trang PDF; giữ phần tự luận và dải phách riêng để chấm, ghép điểm.'
      : 'Giữ camera song song mặt giấy, đủ sáng, tránh bóng tay. Sau khi quét, hãy nhấc phiếu cũ ra khỏi khung trước khi đặt phiếu tiếp theo. Trang tự luận nên để trong PDF riêng khi chấm OMR.';
  });
  window.OmrDocumentScanStore.listPages().then(pages => {
    state.pages = (pages || []).sort((a, b) => a.order - b.order);
    renderQueue();
    if (state.pages.length) notice(`Đã khôi phục ${state.pages.length} trang quét trên thiết bị.`);
  }).catch(() => notice('Không lưu được phiên quét trên thiết bị; hãy xuất PDF trước khi đóng trang.'));
  updateButtons();
})();
