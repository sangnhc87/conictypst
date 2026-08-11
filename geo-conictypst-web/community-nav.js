(() => {
  'use strict';

  const current = location.pathname.replace(/\.html$/, '');
  const links = [
    ['TikZ 2D', '/tikz-geogebra'],
    ['TikZ 3D', '/tikz-geogebra-3d'],
    ['CeTZ 2D', '/cetz-geogebra'],
    ['CeTZ 3D', '/cetz-geogebra-3d'],
  ];

  const style = document.createElement('style');
  style.textContent = `
    .geo-community-nav{box-sizing:border-box;min-height:58px;flex:0 0 58px;display:flex;align-items:center;justify-content:space-between;gap:18px;padding:0 max(18px,calc((100% - 1500px)/2));border-bottom:1px solid rgba(148,163,184,.28);background:#f8fcfa;color:#10231e;font-family:Inter,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;position:relative;z-index:10001}
    .geo-community-brand{display:flex;align-items:center;gap:9px;color:#10231e!important;text-decoration:none!important;white-space:nowrap}
    .geo-community-mark{width:34px;height:34px;display:grid;place-items:center;border-radius:10px;background:linear-gradient(135deg,#047857,#0d9488 68%,#f97316);color:#fff;font-weight:900;font-size:12px}
    .geo-community-brand strong,.geo-community-brand small{display:block}.geo-community-brand strong{font-size:13px}.geo-community-brand small{color:#64748b;font-size:9px;margin-top:1px}
    .geo-community-links{display:flex;align-items:center;gap:6px}.geo-community-links a{min-height:34px;display:flex;align-items:center;padding:0 11px;border-radius:999px;color:#52655f!important;text-decoration:none!important;font-size:11px;font-weight:800;white-space:nowrap}
    .geo-community-links a:hover{background:#eaf7f1;color:#047857!important}.geo-community-links a.is-active{background:#047857;color:#fff!important}
    .geo-community-home{border:1px solid #f1c7a9!important;background:#fff7ed;color:#b94a0b!important}
    @media(max-width:720px){.geo-community-nav{padding:0 10px}.geo-community-brand small{display:none}.geo-community-links a{display:none}.geo-community-links a.is-active,.geo-community-links .geo-community-home{display:flex;padding:0 9px}.geo-community-brand strong{font-size:12px}}
  `;
  document.head.append(style);

  const nav = document.createElement('header');
  nav.className = 'geo-community-nav';
  nav.innerHTML = `
    <a class="geo-community-brand" href="/">
      <span class="geo-community-mark">G²</span>
      <span><strong>Geo2Code</strong><small>by ConicTypst</small></span>
    </a>
    <nav class="geo-community-links" aria-label="Chuyển công cụ">
      ${links.map(([label, href]) => `<a href="${href}"${current === href ? ' class="is-active" aria-current="page"' : ''}>${label}</a>`).join('')}
      <a class="geo-community-home" href="/#ung-ho">♡ Ủng hộ</a>
    </nav>
  `;
  document.body.prepend(nav);
})();
