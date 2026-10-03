/* Formative checks and SCORM 1.2 progress; works offline without an LMS. */
(() => {
  'use strict';
  const lesson = JSON.parse(document.getElementById('lesson-data').textContent);
  const questions = Object.values(lesson.sections).flatMap(section => section.questions);
  const byId = new Map(questions.map(question => [question.id, question]));
  const storageKey = `sang-math:${lesson.lesson_id}`;
  const api = findApi(window);
  let initialized = false;
  if (api) {
    try { initialized = String(api.LMSInitialize('')).toLowerCase() === 'true'; } catch (_) { /* local preview */ }
  }

  function findApi(start) {
    const seen = new Set();
    for (const origin of [start, safeOpener(start)]) {
      let current = origin;
      for (let depth = 0; current && depth < 8 && !seen.has(current); depth++) {
        seen.add(current);
        try {
          if (current.API && typeof current.API.LMSInitialize === 'function') return current.API;
          if (current.parent === current) break;
          current = current.parent;
        } catch (_) { break; }
      }
    }
    return null;
  }

  function safeOpener(win) {
    try { return win.opener; } catch (_) { return null; }
  }

  function readProgress() {
    let raw = '';
    if (initialized) {
      try { raw = api.LMSGetValue('cmi.suspend_data') || ''; } catch (_) { /* fallback */ }
    }
    if (!initialized) {
      try { raw = localStorage.getItem(storageKey) || ''; } catch (_) { /* private mode */ }
    }
    try {
      const parsed = JSON.parse(raw);
      return new Set((parsed.done || []).filter(id => byId.has(id)));
    } catch (_) { return new Set(); }
  }

  const done = readProgress();
  const progress = document.getElementById('progress');
  const progressLabel = document.getElementById('progress-label');

  function updateProgress() {
    progress.value = done.size;
    progressLabel.textContent = `${done.size}/${questions.length} câu hoàn thành`;
  }

  function saveProgress(sectionId) {
    const data = JSON.stringify({done: [...done].sort()});
    if (!initialized) {
      try { localStorage.setItem(storageKey, data); } catch (_) { /* private mode */ }
      return;
    }
    try {
      api.LMSSetValue('cmi.suspend_data', data);
      api.LMSSetValue('cmi.core.lesson_location', sectionId);
      api.LMSSetValue('cmi.core.score.min', '0');
      api.LMSSetValue('cmi.core.score.max', '100');
      api.LMSSetValue('cmi.core.score.raw', String(Math.round(done.size * 100 / questions.length)));
      api.LMSSetValue('cmi.core.lesson_status', done.size === questions.length ? 'passed' : 'incomplete');
      api.LMSCommit('');
    } catch (_) { /* the lesson remains usable if an LMS call fails */ }
  }

  function element(tag, className, content) {
    const node = document.createElement(tag);
    if (className) node.className = className;
    if (content !== undefined) node.textContent = content;
    return node;
  }

  function makeInput(question, index) {
    const kind = question.type;
    if (kind === 'single' || kind === 'multi') {
      const options = element('div', 'options');
      question.options.forEach((option, i) => {
        const label = element('label', 'option');
        const input = document.createElement('input');
        input.type = kind === 'single' ? 'radio' : 'checkbox';
        input.name = question.id;
        input.value = String(i);
        label.append(input, element('span', 'option-letter', String.fromCharCode(65 + i)), element('span', '', option));
        options.append(label);
      });
      return options;
    }
    if (kind === 'number') {
      const label = element('label', 'numeric-label', 'Đáp số');
      const input = document.createElement('input');
      input.type = 'text';
      input.inputMode = 'decimal';
      input.autocomplete = 'off';
      input.setAttribute('aria-label', `Đáp số câu ${index + 1}`);
      input.placeholder = 'Nhập một số';
      label.append(input);
      return label;
    }
    const pair = element('div', 'coordinate-input');
    for (const coordinate of ['x', 'y']) {
      const label = element('label', '', coordinate + ' = ');
      const input = document.createElement('input');
      input.type = 'text';
      input.inputMode = 'decimal';
      input.autocomplete = 'off';
      input.setAttribute('aria-label', `Tọa độ ${coordinate} câu ${index + 1}`);
      input.placeholder = coordinate;
      label.append(input);
      pair.append(label);
    }
    return pair;
  }

  function readNumber(input) {
    const value = input.value.trim().replace(',', '.').replace(/\s+/g, '');
    if (!/^[+-]?(?:\d+\.?\d*|\.\d+)$/.test(value)) return null;
    const parsed = Number(value);
    return Number.isFinite(parsed) ? parsed : null;
  }

  function check(question, card) {
    const kind = question.type;
    const inputs = [...card.querySelectorAll('input')];
    if (kind === 'single' || kind === 'multi') {
      const selected = inputs.filter(input => input.checked).map(input => Number(input.value)).sort((a, b) => a - b);
      if (!selected.length) return {correct: false, empty: true, detail: 'Hãy chọn ít nhất một phương án.'};
      const expected = kind === 'single' ? [question.answer] : [...question.answer].sort((a, b) => a - b);
      return {correct: selected.length === expected.length && selected.every((value, i) => value === expected[i])};
    }
    const values = inputs.map(readNumber);
    if (values.some(value => value === null)) return {correct: false, empty: true, detail: 'Hãy nhập đủ số hợp lệ. Có thể dùng dấu phẩy hoặc dấu chấm thập phân.'};
    if (kind === 'number') return {correct: Math.abs(values[0] - question.answer) <= question.tolerance + 1e-9};
    if (kind === 'point_exact') return {correct: values.every((value, i) => Math.abs(value - question.answer[i]) <= question.tolerance + 1e-9)};
    const [x, y] = values;
    if (question.answer.integer && (!Number.isInteger(x) || !Number.isInteger(y))) {
      return {correct: false, detail: 'Số lượng sản phẩm phải là số nguyên.'};
    }
    for (const bound of question.answer.constraints) {
      const difference = bound.a * x + bound.b * y - bound.c;
      const valid = bound.op === '<' ? difference < -1e-9 : difference <= 1e-9;
      if (!valid) return {correct: false, detail: `Điểm này chưa thỏa điều kiện ${bound.label}.`};
    }
    return {correct: true};
  }

  function renderQuestion(question, index, sectionId) {
    const card = element('article', 'question-card');
    card.dataset.question = question.id;
    const heading = element('div', 'question-heading');
    heading.append(element('span', 'question-number', `Câu ${index + 1}`), element('span', 'level', question.level));
    const prompt = element('p', 'question-prompt', question.prompt);
    const input = makeInput(question, index);
    const controls = element('div', 'controls');
    const checkButton = element('button', 'check-button', 'Kiểm tra');
    checkButton.type = 'button';
    const hintButton = element('button', 'hint-button', 'Gợi ý');
    hintButton.type = 'button';
    hintButton.setAttribute('aria-expanded', 'false');
    const hint = element('p', 'hint hidden', question.hint);
    const feedback = element('p', 'feedback');
    feedback.setAttribute('role', 'status');
    controls.append(checkButton, hintButton);
    card.append(heading, prompt, input, controls, hint, feedback);

    function master() {
      card.classList.add('mastered');
      checkButton.disabled = true;
      card.querySelectorAll('input').forEach(item => { item.disabled = true; });
      feedback.className = 'feedback correct';
      feedback.textContent = `Đúng rồi. ${question.explanation}`;
    }

    if (done.has(question.id)) {
      master();
      feedback.textContent = 'Đã hoàn thành đúng. ' + question.explanation;
    }
    checkButton.addEventListener('click', () => {
      const result = check(question, card);
      if (result.correct) {
        done.add(question.id);
        master();
        updateProgress();
        saveProgress(sectionId);
      } else {
        feedback.className = 'feedback incorrect';
        feedback.textContent = result.empty ? result.detail : `${result.detail ? result.detail + ' ' : ''}Chưa đúng. ${question.explanation} Bạn có thể sửa và thử lại.`;
      }
    });
    hintButton.addEventListener('click', () => {
      hint.classList.toggle('hidden');
      hintButton.setAttribute('aria-expanded', String(!hint.classList.contains('hidden')));
    });
    return card;
  }

  for (const [sectionId, section] of Object.entries(lesson.sections)) {
    const container = document.querySelector(`[data-questions="${sectionId}"]`);
    section.questions.forEach((question, index) => container.append(renderQuestion(question, index, sectionId)));
  }
  updateProgress();
  for (const link of document.querySelectorAll('[data-nav]')) {
    link.addEventListener('click', () => saveProgress(link.dataset.nav));
  }
  window.addEventListener('pagehide', () => {
    if (!initialized) return;
    try { api.LMSSetValue('cmi.core.exit', 'suspend'); api.LMSCommit(''); api.LMSFinish(''); } catch (_) { /* LMS handles its own session */ }
  });
})();
