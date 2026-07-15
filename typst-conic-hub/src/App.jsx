import React, { Suspense, lazy, useEffect, useState } from 'react'
import { ECOSYSTEM_LINKS } from './ecosystem.js'
import { PROJECT_TEMPLATES } from './studio/templates.js'

const HubStudio = lazy(() => import('./studio/HubStudio.jsx'))

function Brand({ compact = false }) {
  return (
    <span className={`brand ${compact ? 'brand--compact' : ''}`}>
      <span className="brand__mark">C<span>•</span></span>
      <span className="brand__copy">
        <strong>TypstConicHub</strong>
        {!compact && <small>Sang Math Studio</small>}
      </span>
    </span>
  )
}

function ExternalArrow() {
  return <span aria-hidden="true">↗</span>
}

function UpdateNotice() {
  const [registration, setRegistration] = useState(null)

  useEffect(() => {
    const showUpdate = event => setRegistration(event.detail?.registration || null)
    window.addEventListener('conic-update-ready', showUpdate)
    return () => window.removeEventListener('conic-update-ready', showUpdate)
  }, [])

  if (!registration) return null

  const applyUpdate = async () => {
    const detail = { tasks: [] }
    window.dispatchEvent(new CustomEvent('conic-flush-save', { detail }))
    await Promise.allSettled(detail.tasks)
    registration.waiting?.postMessage({ type: 'SKIP_WAITING' })
  }

  return (
    <aside className="update-notice" role="status">
      <span className="update-notice__icon">↻</span>
      <span><b>TypstConicHub có bản mới</b><small>Dự án sẽ được lưu trước khi cập nhật.</small></span>
      <button type="button" onClick={applyUpdate}>Cập nhật ngay</button>
      <button type="button" className="update-notice__close" onClick={() => setRegistration(null)} aria-label="Để sau">×</button>
    </aside>
  )
}

function Landing({ onOpenStudio }) {
  const scrollTo = id => document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })

  return (
    <div className="landing">
      <header className="site-header">
        <a className="site-header__brand" href="#top" aria-label="TypstConicHub"><Brand /></a>
        <nav className="site-nav" aria-label="Điều hướng chính">
          <button type="button" onClick={() => scrollTo('features')}>Năng lực</button>
          <button type="button" onClick={() => scrollTo('templates')}>Mẫu soạn thảo</button>
          <button type="button" onClick={() => scrollTo('ecosystem')}>Hệ sinh thái</button>
        </nav>
        <div className="site-header__actions">
          <a className="button button--quiet account-button" href="https://admin-conictypst.pages.dev/account.html" target="_blank" rel="noreferrer" aria-label="Tài khoản ConicTypst">Tài khoản</a>
          <a className="button button--quiet hide-mobile" href="https://hdsd-conictypst.pages.dev/" target="_blank" rel="noreferrer">Hướng dẫn</a>
          <button className="button button--dark" type="button" onClick={() => onOpenStudio()}>Mở Studio <span>↗</span></button>
        </div>
      </header>

      <main id="top">
        <section className="hero">
          <div className="hero__glow hero__glow--one" />
          <div className="hero__glow hero__glow--two" />
          <div className="hero__copy">
            <div className="eyebrow"><span className="eyebrow__dot" /> Typst WASM · sang-math tích hợp</div>
            <h1>Soạn tài liệu Toán<br /><span>đẹp, nhanh và liền mạch.</span></h1>
            <p>Không gian Typst chuyên nghiệp dành cho giáo viên Việt Nam. Soạn thảo, xem trước, quản lý dự án và đi thẳng sang trộn đề, QR, phiếu OMR — mỗi module vẫn độc lập và an toàn.</p>
            <div className="hero__actions">
              <button className="button button--hero" type="button" onClick={() => onOpenStudio()}>Bắt đầu soạn thảo <span>→</span></button>
              <a className="button button--outline" href="https://hdsd-conictypst.pages.dev/ecosystem" target="_blank" rel="noreferrer">Khám phá hệ sinh thái</a>
            </div>
            <div className="hero__proof">
              <span><b>100%</b> chạy trên trình duyệt</span>
              <span><b>Tự lưu</b> trên thiết bị</span>
              <span><b>PDF · SVG · PNG</b> sẵn sàng xuất</span>
            </div>
          </div>

          <div className="hero-product" aria-label="Minh họa TypstConicHub Studio">
            <div className="hero-product__bar">
              <span className="window-dots"><i /><i /><i /></span>
              <span className="product-tab">main.typ <b>•</b></span>
              <span className="product-status"><i /> WASM sẵn sàng</span>
            </div>
            <div className="hero-product__body">
              <aside className="mock-files">
                <div className="mock-files__title">DỰ ÁN</div>
                <div className="mock-file is-active"><span>T</span> main.typ</div>
                <div className="mock-file"><span>T</span> data.typ</div>
                <div className="mock-file"><span>▦</span> images</div>
                <div className="mock-package"><i>✓</i><span><b>sang-math</b><small>1.0.0 · Universe</small></span></div>
              </aside>
              <div className="mock-code" aria-hidden="true">
                <ol>
                  <li><code><em>#import</em> <q>@preview/sang-math:1.0.0</q>: *</code></li>
                  <li><code /></li>
                  <li><code><em>#let</em> preset = exam-preset(</code></li>
                  <li><code>  theme: <q>teal-pro</q>,</code></li>
                  <li><code>  profile: <q>loigiai</q>,</code></li>
                  <li><code>)</code></li>
                  <li><code /></li>
                  <li><code><em>#tn</em>(</code></li>
                  <li><code>  [Đạo hàm của $f(x)$ là],</code></li>
                  <li><code>  ([$A$], <strong>True</strong>([$B$]), ...),</code></li>
                  <li><code>)</code></li>
                </ol>
              </div>
              <div className="mock-preview">
                <div className="mock-paper">
                  <div className="paper-top"><span>TRƯỜNG THPT SANG-MATH</span><b>ĐỀ KIỂM TRA</b></div>
                  <div className="paper-title">MÔN TOÁN 12</div>
                  <div className="paper-rule" />
                  <div className="paper-section">PHẦN I. TRẮC NGHIỆM</div>
                  <p><b>Câu 1.</b> Đạo hàm của hàm số <i>f(x) = x³ − 3x</i> là</p>
                  <div className="paper-options"><span>A. 3x</span><span className="is-answer">B. 3x² − 3</span><span>C. x²</span><span>D. 3x²</span></div>
                  <div className="paper-solution"><b>Lời giải.</b> Ta có f′(x) = 3x² − 3.</div>
                </div>
              </div>
            </div>
            <div className="hero-product__footer"><span>Ln 9, Col 24</span><span>Biên dịch 186 ms · Đã tự lưu</span></div>
          </div>
        </section>

        <section className="trust-strip">
          <span>TYPST</span><i /> <span>WEBASSEMBLY</span><i /> <span>MONACO EDITOR</span><i /> <span>SANG MATH</span><i /> <span>CONIC OMR</span>
        </section>

        <section id="features" className="section section--features">
          <div className="section-heading">
            <div><span className="section-kicker">MỘT STUDIO THỰC THỤ</span><h2>Tập trung vào nội dung.<br />Hệ thống lo phần còn lại.</h2></div>
            <p>Compiler chạy trong Web Worker riêng, dự án được lưu bằng IndexedDB và package chính thức được tải từ Typst Universe rồi lưu đệm cho lần dùng sau.</p>
          </div>
          <div className="feature-grid">
            <article className="feature-card feature-card--wide blue">
              <div className="feature-card__icon">⚡</div><span className="feature-card__tag">WASM WORKER</span>
              <h3>Preview tức thời,<br />giao diện vẫn mượt.</h3>
              <p>Chỉ đồng bộ tệp vừa thay đổi; compiler sống liên tục trong tiến trình nền và bỏ qua các kết quả biên dịch đã cũ.</p>
              <div className="compile-meter"><span><i /> Đang biên dịch main.typ</span><b>186 ms</b><div><i /></div></div>
            </article>
            <article className="feature-card green">
              <div className="feature-card__icon">◎</div><span className="feature-card__tag">LOCAL FIRST</span>
              <h3>Tự lưu thật,<br />không sợ mất bài.</h3>
              <p>Nội dung toàn bộ dự án, tệp ảnh và snapshot đều nằm trên thiết bị.</p>
              <div className="save-stack"><span>main.typ <i>Đã lưu</i></span><span>Bản trước khi chỉnh đề <i>09:42</i></span><span>Snapshot thủ công <i>Hôm nay</i></span></div>
            </article>
            <article className="feature-card orange">
              <div className="feature-card__icon">S</div><span className="feature-card__tag">TYPST UNIVERSE</span>
              <h3>sang-math<br />bản chính thức.</h3>
              <p>Mẫu và kho lệnh dùng đúng import công khai; dự án mang sang Typst CLI hoặc Typst.app không cần sửa đường dẫn.</p>
              <div className="package-chip"><span>✓</span><b>sang-math</b><small>v1.0.0 · @preview</small></div>
            </article>
            <article className="feature-card feature-card--wide violet">
              <div className="feature-card__icon">↗</div><span className="feature-card__tag">OPEN WORKFLOW</span>
              <h3>Một cú click sang đúng công cụ.</h3>
              <p>Bảng vẽ CeTZ chuyển mã trực tiếp vào Studio; HDSD, trộn đề và OMR vẫn chạy độc lập nhưng đi chung một quy trình.</p>
              <div className="workflow"><span>Vẽ CeTZ</span><i>→</i><span>Studio</span><i>→</i><span>QR Passport</span><i>→</i><span>OMR</span></div>
            </article>
          </div>
        </section>

        <section id="templates" className="section section--templates">
          <div className="section-heading section-heading--center"><div><span className="section-kicker">BẮT ĐẦU KHÔNG CẦN NHỚ LỆNH</span><h2>Chọn một điểm xuất phát đẹp.</h2></div><p>Mỗi mẫu là một dự án thật và có thể thay đổi hoàn toàn.</p></div>
          <div className="template-grid">
            {PROJECT_TEMPLATES.map((template, index) => (
              <button type="button" className={`template-card ${template.color}`} key={template.id} onClick={() => onOpenStudio(template.id)}>
                <span className="template-card__number">0{index + 1}</span>
                <div className="template-card__preview"><span>{template.label}</span><i /><i /><i /></div>
                <h3>{template.name}</h3><p>{template.description}</p><b>Dùng mẫu này <span>→</span></b>
              </button>
            ))}
          </div>
        </section>

        <section id="ecosystem" className="section section--ecosystem">
          <div className="ecosystem-intro"><span className="section-kicker">HỆ SINH THÁI MODULE ĐỘC LẬP</span><h2>Một cổng vào.<br /><em>Nhiều công cụ chuyên sâu.</em></h2><p>Mỗi module vẫn tự hoạt động và tự triển khai. TypstConicHub chỉ giúp người dùng tìm đúng bước tiếp theo.</p></div>
          <div className="ecosystem-list">
            {ECOSYSTEM_LINKS.map(link => (
              <a href={link.href} target="_blank" rel="noreferrer" className={`ecosystem-row ${link.accent}`} key={link.id}>
                <span className="ecosystem-row__icon">{link.icon}</span><span><b>{link.title}</b><small>{link.description}</small></span><ExternalArrow />
              </a>
            ))}
          </div>
        </section>

        <section className="final-cta">
          <div><span className="section-kicker">TYPSTCONICHUB</span><h2>Sẵn sàng viết tài liệu<br />Toán tiếp theo?</h2></div>
          <button className="button button--hero" type="button" onClick={() => onOpenStudio()}>Mở Studio ngay <span>→</span></button>
        </section>
      </main>

      <footer className="site-footer"><Brand /><p>Được xây dựng cho cộng đồng giáo viên Việt Nam.</p><span>ConicTypst · Sang Math · 2026</span></footer>
    </div>
  )
}

function LoadingStudio() {
  return <div className="studio-loading"><Brand /><span /><p>Đang khởi động không gian soạn thảo…</p></div>
}

export default function App() {
  const [route, setRoute] = useState(() => window.location.hash.startsWith('#studio') ? 'studio' : 'home')
  const [requestedTemplate, setRequestedTemplate] = useState(() => new URLSearchParams(window.location.hash.split('?')[1] || '').get('template'))
  const [requestedBridge, setRequestedBridge] = useState(() => new URLSearchParams(window.location.hash.split('?')[1] || '').get('bridge'))

  useEffect(() => {
    const handleHash = () => {
      setRoute(window.location.hash.startsWith('#studio') ? 'studio' : 'home')
      const params = new URLSearchParams(window.location.hash.split('?')[1] || '')
      setRequestedTemplate(params.get('template'))
      setRequestedBridge(params.get('bridge'))
    }
    window.addEventListener('hashchange', handleHash)
    return () => window.removeEventListener('hashchange', handleHash)
  }, [])

  const openStudio = templateId => {
    const query = templateId ? `?template=${encodeURIComponent(templateId)}` : ''
    window.location.hash = `studio${query}`
  }

  if (route === 'studio') {
    return <><Suspense fallback={<LoadingStudio />}><HubStudio initialTemplateId={requestedTemplate} initialBridge={requestedBridge} onExit={() => { window.location.hash = '' }} /></Suspense><UpdateNotice /></>
  }

  return <><Landing onOpenStudio={openStudio} /><UpdateNotice /></>
}
