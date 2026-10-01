(() => {
  'use strict';
  const base = 'examples/sang-math-1-1/';
  const gallery = document.getElementById('sm11-gallery');
  const filters = document.getElementById('sm11-filters');
  const search = document.getElementById('sm11-search');
  const count = document.getElementById('sm11-count');
  const toast = document.getElementById('sm11-toast');
  let examples = [];
  let selectedCategory = 'Tất cả';
  let toastTimer;

  function announce(message) {
    toast.textContent = message;
    toast.classList.add('is-visible');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => toast.classList.remove('is-visible'), 2500);
  }

  async function copyText(value) {
    try {
      if (navigator.clipboard?.writeText) await navigator.clipboard.writeText(value);
      else {
        const field = document.createElement('textarea');
        field.value = value;
        field.style.position = 'fixed';
        field.style.opacity = '0';
        document.body.append(field);
        field.select();
        if (!document.execCommand('copy')) throw new Error('copy failed');
        field.remove();
      }
      announce('Đã copy code');
    } catch {
      announce('Không copy tự động được; hãy chọn và copy code trong khung.');
    }
  }

  for (const button of document.querySelectorAll('[data-copy-target]')) {
    button.addEventListener('click', () => {
      const target = document.getElementById(button.dataset.copyTarget);
      if (target) copyText(target.textContent.trim());
    });
  }

  const normalized = value => value.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  function make(tag, className, content) {
    const node = document.createElement(tag);
    if (className) node.className = className;
    if (content != null) node.textContent = content;
    return node;
  }

  function makeCard(example) {
    const article = make('article', 'sm11-card');
    article.append(make('div', 'sm11-card-kicker', example.id + ' / ' + example.category));
    article.append(make('h3', '', example.title));
    article.append(make('p', '', example.summary));
    article.append(make('p', 'sm11-card-result', 'Kết quả: ' + example.result));
    if (example.requires.length) {
      const deps = make('p', 'sm11-card-deps', 'Cần kèm: ');
      example.requires.forEach((file, index) => {
        if (index) deps.append(document.createTextNode(' · '));
        const link = make('a', '', file);
        link.href = base + file;
        link.download = file.split('/').at(-1);
        deps.append(link);
      });
      article.append(deps);
    }
    if (example.note) article.append(make('p', 'sm11-card-deps', example.note));
    const actions = make('div', 'sm11-card-actions');
    const copy = make('button', '', 'Copy code');
    copy.type = 'button';
    copy.addEventListener('click', () => copyText(example.code));
    const download = make('a', '', 'Tải file .typ');
    download.href = base + example.file;
    download.download = example.file;
    actions.append(copy, download);
    article.append(actions);
    const details = make('details');
    const summary = make('summary', '', 'Xem toàn bộ ' + example.file);
    const pre = make('pre');
    const code = make('code', '', example.code);
    pre.append(code);
    details.append(summary, pre);
    article.append(details);
    return article;
  }

  function render() {
    const term = normalized(search.value.trim());
    const visible = examples.filter(example =>
      (selectedCategory === 'Tất cả' || example.category === selectedCategory) &&
      normalized([example.title, example.category, example.summary, example.file].join(' ')).includes(term)
    );
    gallery.replaceChildren(...visible.map(makeCard));
    count.textContent = visible.length + '/' + examples.length + ' file mẫu · code là file .typ đầy đủ, không cắt ngắn';
  }

  function renderFilters() {
    const categories = ['Tất cả', ...new Set(examples.map(example => example.category))];
    filters.replaceChildren(...categories.map(category => {
      const button = make('button', '', category);
      button.type = 'button';
      button.setAttribute('aria-pressed', String(category === selectedCategory));
      button.addEventListener('click', () => {
        selectedCategory = category;
        for (const item of filters.querySelectorAll('button')) {
          item.setAttribute('aria-pressed', String(item.textContent === category));
        }
        render();
      });
      return button;
    }));
  }

  search.addEventListener('input', render);
  (async () => {
    const manifestResponse = await fetch(base + 'manifest.json');
    if (!manifestResponse.ok) throw new Error('HTTP ' + manifestResponse.status);
    const manifest = await manifestResponse.json();
    examples = await Promise.all(manifest.examples.map(async example => {
      const response = await fetch(base + example.file);
      if (!response.ok) throw new Error(example.file + ': HTTP ' + response.status);
      return { ...example, code: await response.text() };
    }));
    renderFilters();
    render();
  })().catch(error => {
    count.textContent = 'Không tải được thư viện mẫu. Hãy tải ZIP để lấy toàn bộ file.';
    console.error('sang-math guide:', error);
  });
})();
