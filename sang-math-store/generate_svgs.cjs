const fs = require("fs");
const path = require("path");

const svgs = {
  "olympia.svg": `
<svg width="800" height="600" viewBox="0 0 800 600" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#1e293b" />
      <stop offset="100%" stop-color="#0f172a" />
    </linearGradient>
    <linearGradient id="mountain" x1="50%" y1="0%" x2="50%" y2="100%">
      <stop offset="0%" stop-color="#38bdf8" />
      <stop offset="100%" stop-color="#0369a1" />
    </linearGradient>
    <linearGradient id="star" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#fde047" />
      <stop offset="100%" stop-color="#eab308" />
    </linearGradient>
    <filter id="glow" x="-20%" y="-20%" width="140%" height="140%">
      <feGaussianBlur stdDeviation="15" result="blur" />
      <feComposite in="SourceGraphic" in2="blur" operator="over" />
    </filter>
  </defs>
  <rect width="800" height="600" fill="url(#bg)" />
  <path d="M400 200 L600 500 L200 500 Z" fill="url(#mountain)" />
  <path d="M400 200 L500 500 L300 500 Z" fill="#0ea5e9" opacity="0.5" />
  <g filter="url(#glow)">
    <path d="M400 120 L425 180 L490 180 L435 220 L455 285 L400 245 L345 285 L365 220 L310 180 L375 180 Z" fill="url(#star)" />
  </g>
</svg>`,

  "vong-quay.svg": `
<svg width="800" height="600" viewBox="0 0 800 600" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg2" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#0f172a" />
      <stop offset="100%" stop-color="#020617" />
    </linearGradient>
  </defs>
  <rect width="800" height="600" fill="url(#bg2)" />
  <g transform="translate(400, 300)">
    <circle cx="0" cy="0" r="180" fill="#cbd5e1" stroke="#475569" stroke-width="15" />
    <path d="M0,0 L0,-180 A180,180 0 0,1 180,0 Z" fill="#ef4444" />
    <path d="M0,0 L180,0 A180,180 0 0,1 0,180 Z" fill="#3b82f6" />
    <path d="M0,0 L0,180 A180,180 0 0,1 -180,0 Z" fill="#10b981" />
    <path d="M0,0 L-180,0 A180,180 0 0,1 0,-180 Z" fill="#f59e0b" />
    <circle cx="0" cy="0" r="40" fill="#ffffff" stroke="#94a3b8" stroke-width="10" />
    <path d="M-15,-60 L15,-60 L0,-100 Z" fill="#ffffff" />
  </g>
</svg>`,

  "bang-diem.svg": `
<svg width="800" height="600" viewBox="0 0 800 600" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg3" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#14532d" />
      <stop offset="100%" stop-color="#064e3b" />
    </linearGradient>
    <linearGradient id="panel" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" stop-color="#000000" />
      <stop offset="100%" stop-color="#111827" />
    </linearGradient>
  </defs>
  <rect width="800" height="600" fill="url(#bg3)" />
  <rect x="150" y="150" width="500" height="300" rx="30" fill="url(#panel)" stroke="#4ade80" stroke-width="8" />
  <text x="400" y="280" font-family="monospace" font-size="120" font-weight="bold" fill="#4ade80" text-anchor="middle">100</text>
  <text x="250" y="380" font-family="sans-serif" font-size="40" font-weight="bold" fill="#facc15" text-anchor="middle">ĐỘI A</text>
  <text x="550" y="380" font-family="sans-serif" font-size="40" font-weight="bold" fill="#facc15" text-anchor="middle">ĐỘI B</text>
  <path d="M400,320 L400,420" stroke="#374151" stroke-width="5" stroke-dasharray="10,10" />
</svg>`,

  "dong-ho.svg": `
<svg width="800" height="600" viewBox="0 0 800 600" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg4" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#7c2d12" />
      <stop offset="100%" stop-color="#451a03" />
    </linearGradient>
  </defs>
  <rect width="800" height="600" fill="url(#bg4)" />
  <circle cx="400" cy="320" r="160" fill="#f8fafc" stroke="#f59e0b" stroke-width="20" />
  <rect x="375" y="100" width="50" height="40" rx="10" fill="#cbd5e1" />
  <rect x="350" y="80" width="100" height="20" rx="10" fill="#ef4444" />
  <path d="M400 320 L400 200" stroke="#0f172a" stroke-width="12" stroke-linecap="round" />
  <path d="M400 320 L470 320" stroke="#dc2626" stroke-width="8" stroke-linecap="round" />
  <circle cx="400" cy="320" r="15" fill="#0f172a" />
</svg>`,

  "bong-da.svg": `
<svg width="800" height="600" viewBox="0 0 800 600" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg5" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#166534" />
      <stop offset="100%" stop-color="#14532d" />
    </linearGradient>
  </defs>
  <rect width="800" height="600" fill="url(#bg5)" />
  <rect x="100" y="150" width="600" height="300" rx="20" fill="none" stroke="#ffffff" stroke-width="10" opacity="0.7" />
  <path d="M400 150 L400 450" stroke="#ffffff" stroke-width="10" opacity="0.7" />
  <circle cx="400" cy="300" r="60" fill="none" stroke="#ffffff" stroke-width="10" opacity="0.7" />
  <circle cx="280" cy="300" r="45" fill="#ffffff" />
  <path d="M250 280 L290 260 L310 290 L290 320 L250 310 Z" fill="#000000" />
</svg>`,

  "rung-chuong.svg": `
<svg width="800" height="600" viewBox="0 0 800 600" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg6" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#4c1d95" />
      <stop offset="100%" stop-color="#2e1065" />
    </linearGradient>
    <linearGradient id="gold" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#fde047" />
      <stop offset="100%" stop-color="#ca8a04" />
    </linearGradient>
    <filter id="glow2" x="-20%" y="-20%" width="140%" height="140%">
      <feGaussianBlur stdDeviation="20" result="blur" />
      <feComposite in="SourceGraphic" in2="blur" operator="over" />
    </filter>
  </defs>
  <rect width="800" height="600" fill="url(#bg6)" />
  <g filter="url(#glow2)">
    <path d="M400 180 C480 180 500 280 520 380 L280 380 C300 280 320 180 400 180 Z" fill="url(#gold)" />
    <path d="M400 150 C380 150 380 180 400 180 C420 180 420 150 400 150 Z" fill="url(#gold)" />
    <path d="M370 380 Q400 420 430 380 Z" fill="#854d0e" />
  </g>
</svg>`
};

const dir = path.join(__dirname, "public", "previews");
for (const [name, content] of Object.entries(svgs)) {
  fs.writeFileSync(path.join(dir, name), content.trim());
}
console.log("SVGs created!");
