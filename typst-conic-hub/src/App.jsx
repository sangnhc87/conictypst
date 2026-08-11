import React, { Suspense, lazy, useEffect, useState } from 'react'
import { ECOSYSTEM_LINKS } from './ecosystem.js'
import { SANG_MATH_PACKAGE, SANG_MATH_VERSION } from './studio/packagePolicy.js'
import { PROJECT_TEMPLATES } from './studio/templates.js'
import { identityAuth, initAuthPersistence, signInWithGoogle } from './studio/firebaseSync.js'

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

function CloudUpgradeModal({ onClose }) {
  const [step, setStep] = useState('select')
  const [selectedPlan, setSelectedPlan] = useState(null)
  const [email, setEmail] = useState(identityAuth.currentUser?.email || '')
  const [order, setOrder] = useState(null)
  const [token, setToken] = useState('')
  const [error, setError] = useState('')
  const [isLoading, setIsLoading] = useState(false)

  const plans = [
    { id: 'hub-cloud-1y', name: '1 năm', price: 99000, desc: 'Linh hoạt để bắt đầu', tone: 'green' },
    { id: 'hub-cloud-2y', name: '2 năm', price: 179000, desc: 'Chỉ 89.500 đ/năm · tiết kiệm 19.000 đ', badge: 'ĐƯỢC CHỌN NHIỀU', tone: 'blend' },
    { id: 'hub-cloud-5y', name: '5 năm', price: 399000, desc: 'Chỉ 79.800 đ/năm · tiết kiệm 96.000 đ', badge: 'TIẾT KIỆM NHẤT', tone: 'orange' }
  ];

  const paymentApiUrl = import.meta.env.VITE_APP_MODE === 'public'
    ? 'https://sang-math-store.pages.dev'
    : 'http://localhost:5173'

  const choosePlan = plan => {
    setSelectedPlan(plan)
    setError('')
    setStep('email')
  }

  const createOrder = async event => {
    event.preventDefault()
    const normalizedEmail = email.trim().toLowerCase()
    if (!selectedPlan || !normalizedEmail.includes('@')) {
      setError('Vui lòng nhập đúng Gmail dùng để đăng nhập TypstConicHub.')
      return
    }

    setIsLoading(true)
    setError('')
    try {
      const response = await fetch(new URL('/api/orders', paymentApiUrl).href, {
        method: 'POST',
        headers: { 'content-type': 'application/json' },
        body: JSON.stringify({ email: normalizedEmail, items: [selectedPlan.id] }),
      })
      const data = await response.json()
      if (!response.ok || !data.order || !data.token) throw new Error(data.error || 'Không thể tạo mã thanh toán.')
      setEmail(normalizedEmail)
      setOrder(data.order)
      setToken(data.token)
      setStep('qr')
    } catch (reason) {
      setError(reason instanceof Error ? reason.message : 'Không thể tạo mã thanh toán.')
    } finally {
      setIsLoading(false)
    }
  }

  useEffect(() => {
    if (step !== 'qr' || !order?.id || !token) return undefined
    const timer = window.setInterval(async () => {
      try {
        const response = await fetch(new URL(`/api/orders/${encodeURIComponent(order.id)}?token=${encodeURIComponent(token)}`, paymentApiUrl).href, { cache: 'no-store' })
        if (!response.ok) return
        const data = await response.json()
        if (!['paid', 'completed'].includes(data.order?.status)) return
        window.clearInterval(timer)
        window.dispatchEvent(new CustomEvent('conic-pro-activated'))
        window.alert(`Đã nhận thanh toán. Quyền TypstConicHub Pro được cấp cho ${email}.`)
        onClose()
      } catch {
        // Tiếp tục kiểm tra; lỗi mạng tạm thời không làm mất đơn hàng.
      }
    }, 3000)
    return () => window.clearInterval(timer)
  }, [email, onClose, order?.id, paymentApiUrl, step, token])

  return (
    <div className="modal-backdrop" onClick={onClose} style={{
      position: 'fixed', top: 0, left: 0, right: 0, bottom: 0,
      backgroundColor: 'rgba(0,0,0,0.5)', zIndex: 9999,
      display: 'flex', alignItems: 'center', justifyContent: 'center'
    }}>
      <div className="modal-content" onClick={e => e.stopPropagation()} style={{
        backgroundColor: '#fff', padding: '2rem', borderRadius: '12px',
        maxWidth: '500px', width: '90%',
        color: '#1e293b'
      }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.5rem' }}>
          <h2 style={{ margin: 0, fontSize: '1.5rem', color: '#173f32' }}>
            {step === 'qr' ? 'Thanh toán TypstConicHub' : 'Mở Pro · đồng hành cùng dự án'}
          </h2>
          <button onClick={onClose} style={{ background: 'none', border: 'none', fontSize: '1.8rem', cursor: 'pointer', color: '#64748b' }}>×</button>
        </div>

        {step === 'select' && <>
            <div className="upgrade-story">
              <span className="upgrade-story__eyebrow">FREE VẪN SOẠN TỐT · PRO KHI BẠN THẬT SỰ CẦN</span>
              <p><b>Bạn không cần trả phí để bắt đầu.</b> Studio Free vẫn cho soạn Typst, xem trước và lưu dự án ngay trên máy.</p>
              <p>Khi muốn <b>chủ động lưu Cloud, tiếp tục trên nhiều máy và xuất Word nâng cao</b>, Pro giúp công việc liền mạch hơn. Mỗi lượt nâng cấp cũng góp phần duy trì máy chủ và những bản cập nhật tiếp theo cho cộng đồng giáo viên.</p>
              <div className="upgrade-benefits"><span>✓ Chỉ lưu Cloud khi bạn bấm</span><span>✓ Dùng đúng Gmail trên nhiều máy</span><span>✓ SePay tự xác nhận, không gửi biên lai</span></div>
            </div>
            
            <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
              {plans.map(plan => (
                <button className={`upgrade-plan upgrade-plan--${plan.tone}`} key={plan.id} onClick={() => choosePlan(plan)}>
                  <div>
                    <div className="upgrade-plan__name">
                      TypstConicHub Pro · {plan.name} {plan.badge && <small>{plan.badge}</small>}
                    </div>
                    <div className="upgrade-plan__desc">{plan.desc}</div>
                  </div>
                  <div className="upgrade-plan__price">{plan.price.toLocaleString('vi-VN')} đ <span>→</span></div>
                </button>
              ))}
            </div>
            <div style={{ marginTop: '1.5rem', fontSize: '0.85rem', color: '#94a3b8', textAlign: 'center', lineHeight: '1.4' }}>
              Chọn gói phù hợp với thời gian bạn dự định sử dụng; tính năng Pro của ba gói là như nhau.<br/>
              Quyền chỉ áp dụng cho TypstConicHub, không mở ConicGV, game, template hoặc Store.<br/>
              <b>Bản quyền / Support:</b> GV NGUYỄN VĂN SANG - THPT NGUYỄN HỮU CẢNH
            </div>
          </>}

        {step === 'email' && selectedPlan && (
          <form onSubmit={createOrder}>
            <p style={{ color: '#475569', lineHeight: 1.6 }}>
              Bạn chọn <b>{selectedPlan.name}</b> — <b>{selectedPlan.price.toLocaleString('vi-VN')} đ</b>. Nhập Gmail sẽ dùng đăng nhập TypstConicHub.
            </p>
            <input type="email" value={email} onChange={event => setEmail(event.target.value)} placeholder="giaovien@gmail.com" autoComplete="email" required style={{ width: '100%', boxSizing: 'border-box', padding: '0.8rem 0.9rem', border: '1px solid #cbd5e1', borderRadius: '8px', fontSize: '1rem', margin: '0.5rem 0 0.75rem' }} />
            <p style={{ margin: '0 0 1rem', color: '#64748b', fontSize: '0.86rem' }}>Quyền này chỉ áp dụng cho TypstConicHub. Hai tài khoản quản trị được hệ thống tự nhận toàn quyền, không cần thanh toán.</p>
            {error && <p style={{ color: '#dc2626', fontSize: '0.9rem' }}>{error}</p>}
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '0.75rem' }}>
              <button type="button" onClick={() => setStep('select')} style={{ padding: '0.75rem 1rem', border: 0, borderRadius: '8px', cursor: 'pointer' }}>Quay lại</button>
              <button type="submit" disabled={isLoading} style={{ padding: '0.75rem 1rem', border: 0, borderRadius: '8px', background: '#16a34a', color: '#fff', fontWeight: 700, cursor: 'pointer' }}>{isLoading ? 'Đang tạo QR…' : 'Tạo QR SePay'}</button>
            </div>
          </form>
        )}

        {step === 'qr' && order && (
          <div style={{ textAlign: 'center' }}>
            <p style={{ margin: 0, color: '#64748b' }}>{selectedPlan?.name}</p>
            <h3 style={{ margin: '0.4rem 0 1rem', fontSize: '1.8rem', color: '#16a34a' }}>{Number(order.total || selectedPlan?.price || 0).toLocaleString('vi-VN')} đ</h3>
            {order.qrUrl && <img src={order.qrUrl} alt="QR thanh toán SePay cho TypstConicHub" style={{ width: 'min(260px, 80vw)', border: '1px solid #e2e8f0', borderRadius: '12px' }} />}
            <div style={{ margin: '1rem 0', padding: '0.8rem', background: '#eff6ff', borderRadius: '8px' }}>
              <small style={{ color: '#64748b' }}>Nội dung chuyển khoản bắt buộc</small>
              <div style={{ marginTop: '0.35rem', color: '#1d4ed8', fontSize: '1.2rem', fontWeight: 800, userSelect: 'all' }}>{order.paymentCode}</div>
            </div>
            <p style={{ color: '#16a34a', fontWeight: 700 }}>Đang chờ SePay xác nhận tự động…</p>
            <p style={{ color: '#64748b', fontSize: '0.86rem' }}>Không sửa số tiền hoặc nội dung. Sau khi xác nhận, chỉ quyền TypstConicHub của {email} được nâng cấp.</p>
            <button type="button" onClick={() => { setStep('select'); setOrder(null); setToken('') }} style={{ padding: '0.7rem 1rem', border: 0, borderRadius: '8px', cursor: 'pointer' }}>Chọn gói khác</button>
          </div>
        )}

      </div>
    </div>
  )
}

function Landing({ onOpenStudio, onOpenUpgrade }) {
  const [showAllTemplates, setShowAllTemplates] = useState(false)
  const scrollTo = id => document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })

  return (
    <div className="landing">
      <header className="site-header">
        <a className="site-header__brand" href="#top" aria-label="TypstConicHub"><Brand /></a>
        <nav className="site-nav" aria-label="Điều hướng chính">
          <button type="button" onClick={() => scrollTo('features')}>Studio có gì</button>
          <button type="button" onClick={() => scrollTo('templates')}>Mẫu bắt đầu</button>
          <button type="button" onClick={() => scrollTo('pro')}>Khi nào cần Pro?</button>
        </nav>
        <div className="site-header__actions">
          <button className="button upgrade-button" onClick={onOpenUpgrade}><span>✦</span> Ủng hộ &amp; mở Pro</button>
          <a className="button button--quiet account-button" href="https://admin-conictypst.pages.dev/account.html" target="_blank" rel="noreferrer" aria-label="Kiểm tra tài khoản và quyền Typst">Quyền của tôi</a>
          <a className="button button--quiet hide-mobile" href="https://hdsd-conictypst.pages.dev/" target="_blank" rel="noreferrer">Hướng dẫn</a>
          <button className="button button--dark" type="button" onClick={() => onOpenStudio()}>Đăng nhập &amp; mở Studio <span>↗</span></button>
        </div>
      </header>

      <main id="top">
        <section className="hero">
          <div className="hero__glow hero__glow--one" />
          <div className="hero__glow hero__glow--two" />
          <div className="hero__copy">
            <div className="eyebrow"><span className="eyebrow__dot" /> Studio Typst dành cho giáo viên Toán</div>
            <h1>Từ ý tưởng đến<br /><span>tài liệu đẹp như bản in.</span></h1>
            <p>Mở mẫu, thay nội dung và thấy kết quả ngay bên cạnh. TypstConicHub gom soạn thảo, hình ảnh, công thức, xuất bản và quản lý dự án vào một không gian dễ làm quen.</p>
            <div className="hero__actions">
              <button className="button button--hero" type="button" onClick={() => onOpenStudio()}>Đăng nhập &amp; soạn miễn phí <span>→</span></button>
              <button className="button button--outline" type="button" onClick={() => scrollTo('templates')}>Chọn một mẫu đẹp</button>
            </div>
            <div className="hero__proof">
              <span><b>Đăng nhập Google miễn phí</b> để bắt đầu</span>
              <span><b>Tự lưu</b> trên thiết bị của bạn</span>
              <span><b>Mở · lưu ZIP</b> khi đổi máy</span>
            </div>
          </div>

          <div className="hero-showcase">
            <span className="showcase-note showcase-note--speed"><b>186 ms</b><small>Xem trước tức thời</small></span>
            <span className="showcase-note showcase-note--privacy"><b>Local-first</b><small>Dữ liệu ở bên bạn</small></span>
            <div className="hero-product" aria-label="Minh họa TypstConicHub Studio">
            <div className="hero-product__bar">
              <span className="window-dots"><i /><i /><i /></span>
              <span className="product-tab">main.typ <b>•</b></span>
              <span className="product-status"><i /> Trình biên dịch sẵn sàng</span>
            </div>
            <div className="hero-product__body">
              <aside className="mock-files">
                <div className="mock-files__title">DỰ ÁN</div>
                <div className="mock-file is-active"><span>T</span> main.typ</div>
                <div className="mock-file"><span>T</span> data.typ</div>
                <div className="mock-file"><span>▦</span> images</div>
                <div className="mock-package"><i>✓</i><span><b>sang-math</b><small>{SANG_MATH_VERSION} · Universe</small></span></div>
              </aside>
              <div className="mock-code" aria-hidden="true">
                <ol>
                  <li><code><em>#import</em> <q>{SANG_MATH_PACKAGE}</q>: *</code></li>
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
          </div>
        </section>

        <section className="trust-strip">
          <span>ĐỀ KIỂM TRA</span><i /> <span>GIÁO ÁN</span><i /> <span>PHIẾU HỌC TẬP</span><i /> <span>SLIDE CHỮA BÀI</span><i /> <span>TÀI LIỆU TOÁN</span>
        </section>

        <section id="features" className="section section--features">
          <div className="section-heading">
            <div><span className="section-kicker">ÍT THAO TÁC HƠN · NHIỀU THỜI GIAN DẠY HƠN</span><h2>Một luồng làm việc<br />từ soạn đến xuất bản.</h2></div>
            <p>Không phải ghép nhiều công cụ rời rạc. Mỗi tính năng được đặt đúng nơi giáo viên cần, với kết quả nhìn thấy ngay.</p>
          </div>
          <div className="feature-grid">
            <article className="feature-card feature-card--wide blue">
              <div className="feature-card__icon">01</div><span className="feature-card__tag">GÕ ĐẾN ĐÂU · THẤY ĐẾN ĐÓ</span>
              <h3>Không còn biên dịch<br />rồi dò từng lỗi nhỏ.</h3>
              <p>Bản in thay đổi ngay cạnh vùng soạn. Bạn giữ mạch suy nghĩ cho nội dung thay vì chuyển qua lại giữa nhiều cửa sổ.</p>
              <div className="compile-meter"><span><i /> Đang biên dịch main.typ</span><b>186 ms</b><div><i /></div></div>
            </article>
            <article className="feature-card green">
              <div className="feature-card__icon">02</div><span className="feature-card__tag">AN TÂM SOẠN THẢO</span>
              <h3>Tự lưu trên máy.<br />Dữ liệu thuộc về bạn.</h3>
              <p>Đăng nhập miễn phí để giữ phiên làm việc an toàn. Khi đổi máy, tải ZIP xuống rồi mở lại; Cloud chỉ lưu khi người dùng Pro chủ động bấm.</p>
              <div className="save-stack"><span>main.typ <i>Đã lưu</i></span><span>Bản trước khi chỉnh đề <i>09:42</i></span><span>Snapshot thủ công <i>Hôm nay</i></span></div>
            </article>
            <article className="feature-card orange">
              <div className="feature-card__icon">03</div><span className="feature-card__tag">MẪU TOÁN SẴN SÀNG</span>
              <h3>Không bắt đầu<br />từ một trang trắng.</h3>
              <p>Mẫu, kho lệnh và sang-math đã kết nối sẵn. Chọn cấu trúc phù hợp, sửa nội dung rồi xuất bản.</p>
              <div className="package-chip"><span>✓</span><b>sang-math</b><small>v{SANG_MATH_VERSION} · @preview</small></div>
            </article>
            <article className="feature-card feature-card--wide violet">
              <div className="feature-card__icon">04</div><span className="feature-card__tag">MỘT NỘI DUNG · NHIỀU ĐẦU RA</span>
              <h3>Soạn một lần.<br />Dùng cho cả dạy và in.</h3>
              <p>Giữ cùng một bộ câu hỏi cho đề A4, slide Beamer và PDF. Không phải sao chép rồi sửa lại từng phiên bản.</p>
              <div className="workflow"><span>Soạn câu hỏi</span><i>→</i><span>Đề A4</span><i>↔</i><span>Beamer 16:9</span><i>→</i><span>PDF</span></div>
            </article>
          </div>
        </section>

        <section id="templates" className="section section--templates">
            <div className="section-heading section-heading--center"><div><span className="section-kicker">ĐĂNG NHẬP MỘT LẦN · BẮT ĐẦU NGAY</span><h2>Chọn một mẫu đẹp. Bắt đầu theo cách của bạn.</h2></div><p>Mở mẫu, thay nội dung và thấy kết quả ngay — mọi thành phần đều có thể chỉnh sửa.</p></div>
          <div className="template-grid">
            {PROJECT_TEMPLATES.slice(0, showAllTemplates ? PROJECT_TEMPLATES.length : 3).map((template, index) => (
              <button type="button" className={`template-card ${template.color}`} key={template.id} onClick={() => onOpenStudio(template.id)}>
                <span className="template-card__number">0{index + 1}</span>
                <div className="template-card__preview"><span>{template.label}</span><i /><i /><i /></div>
                <h3>{template.name}</h3><p>{template.description}</p><b>Dùng mẫu này <span>→</span></b>
              </button>
            ))}
          </div>
          {PROJECT_TEMPLATES.length > 3 && <div className="template-grid__more"><button type="button" className="button button--outline" onClick={() => setShowAllTemplates(value => !value)}>{showAllTemplates ? 'Thu gọn mẫu' : `Xem thêm ${PROJECT_TEMPLATES.length - 3} mẫu`} <span>{showAllTemplates ? '↑' : '↓'}</span></button></div>}
        </section>

        <section id="pro" className="section section--pro">
          <div className="pro-story">
            <div className="pro-story__copy">
              <span className="section-kicker">FREE TRƯỚC · PRO KHI THẬT SỰ CẦN</span>
              <h2>Bạn chỉ nên nâng cấp khi thời gian tiết kiệm được đáng giá hơn chi phí.</h2>
              <p>Bản Free vẫn đủ để soạn, xem trước, lưu trên máy và xuất tài liệu. Pro dành cho lúc công việc đã cần liền mạch hơn — đồng thời giúp dự án tiếp tục được duy trì và cải tiến cho giáo viên.</p>
              <button className="button button--hero" type="button" onClick={onOpenUpgrade}>Xem quyền Pro &amp; các gói <span>→</span></button>
            </div>
            <div className="pro-story__panel">
              <div className="pro-price"><span>TypstConicHub Pro</span><b>từ 99.000đ</b><small>cho 1 năm sử dụng</small></div>
              <div className="pro-value-list">
                <div><span>☁</span><p><b>Cloud theo nút bấm</b><small>Chỉ đồng bộ khi chính bạn yêu cầu.</small></p></div>
                <div><span>↔</span><p><b>Tiếp tục trên nhiều máy</b><small>Đăng nhập đúng Gmail đã được cấp quyền.</small></p></div>
                <div><span>W</span><p><b>Xuất Word nâng cao</b><small>Công thức thành Equation, hình được đưa vào tài liệu.</small></p></div>
              </div>
              <p className="pro-story__promise">Không quảng cáo. Không tự động tải dữ liệu lên Cloud. Không gộp quyền với ConicGV hoặc Store.</p>
            </div>
          </div>
        </section>

        <section id="ecosystem" className="section section--ecosystem">
          <div className="ecosystem-intro"><span className="section-kicker">CÁC CÔNG CỤ ĐỘC LẬP</span><h2>Cần việc khác?<br /><em>Đi đúng công cụ.</em></h2><p>Các liên kết dưới đây là sản phẩm riêng, có tài khoản và quyền sử dụng riêng. Gói TypstConicHub Pro không tự mở ConicGV, game hay sản phẩm Store.</p></div>
          <div className="ecosystem-list">
            {ECOSYSTEM_LINKS.map(link => (
              <a href={link.href} target="_blank" rel="noreferrer" className={`ecosystem-row ${link.accent}`} key={link.id}>
                <span className="ecosystem-row__icon">{link.icon}</span><span><b>{link.title}</b><small>{link.description}</small></span><ExternalArrow />
              </a>
            ))}
          </div>
        </section>

        <section className="final-cta">
          <div><span className="section-kicker">KHÔNG CẦN CÀI ĐẶT · ĐĂNG NHẬP MIỄN PHÍ</span><h2>Tài liệu đẹp tiếp theo<br />có thể bắt đầu ngay bây giờ.</h2></div>
          <button className="button button--hero" type="button" onClick={() => onOpenStudio()}>Đăng nhập &amp; mở Studio <span>→</span></button>
        </section>
      </main>

      <footer className="site-footer"><Brand /><p>Được xây dựng cho cộng đồng giáo viên Việt Nam.</p><span>ConicTypst · Sang Math · 2026</span></footer>
    </div>
  )
}

function LoadingStudio() {
  return <div className="studio-loading"><Brand /><span /><p>Đang khởi động không gian soạn thảo…</p></div>
}

function StudioLoginGate({ onLogin, onBack, busy, error }) {
  return (
    <main className="studio-login-gate">
      <div className="studio-login-card">
        <Brand />
        <span className="studio-login-card__eyebrow">MỘT TÀI KHOẢN · MỌI DỰ ÁN CỦA BẠN</span>
        <h1>Đăng nhập để mở Studio</h1>
        <p>Đăng nhập Google miễn phí, không cần thẻ. Bản Free vẫn soạn thảo và lưu trên thiết bị; Cloud và xuất Word chỉ mở khi bạn chủ động nâng cấp.</p>
        {error && <div className="studio-login-card__error" role="alert">{error}</div>}
        <button type="button" className="button button--hero studio-login-card__google" onClick={onLogin} disabled={busy}>
          <span className="google-g">G</span>{busy ? 'Đang mở Google…' : 'Đăng nhập bằng Google'} <span>→</span>
        </button>
        <button type="button" className="button button--outline studio-login-card__back" onClick={onBack}>Về trang giới thiệu</button>
        <small>Không tự động tải tài liệu lên Cloud. Bạn luôn kiểm soát việc lưu và xuất dữ liệu.</small>
      </div>
    </main>
  )
}

function friendlyAuthError(error) {
  const code = error?.code || ''
  if (code === 'auth/unauthorized-domain') return 'Tên miền này chưa được bật trong Firebase Authentication. Hãy thêm typstconichub.pages.dev vào Authorized domains.'
  if (code === 'auth/network-request-failed') return 'Chưa kết nối được dịch vụ Google. Hãy kiểm tra mạng rồi bấm đăng nhập lại.'
  if (code === 'auth/web-storage-unsupported') return 'Trình duyệt đang chặn dữ liệu đăng nhập. Hãy cho phép cookie và thử lại.'
  if (code === 'auth/too-many-requests') return 'Google tạm thời giới hạn số lần thử. Vui lòng chờ một chút rồi thử lại.'
  return error?.message || 'Không thể mở đăng nhập Google. Vui lòng thử lại.'
}

export default function App() {
  const [route, setRoute] = useState(() => window.location.hash.startsWith('#studio') ? 'studio' : 'home')
  const [requestedTemplate, setRequestedTemplate] = useState(() => new URLSearchParams(window.location.hash.split('?')[1] || '').get('template'))
  const [requestedBridge, setRequestedBridge] = useState(() => new URLSearchParams(window.location.hash.split('?')[1] || '').get('bridge'))
  const [showUpgrade, setShowUpgrade] = useState(false)
  const [identityUser, setIdentityUser] = useState(() => identityAuth.currentUser)
  const [identityLoading, setIdentityLoading] = useState(true)
  const [loginBusy, setLoginBusy] = useState(false)
  const [loginError, setLoginError] = useState('')

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

  useEffect(() => {
    let mounted = true
    // Listen immediately. Redirect recovery/persistence can be slow in Safari
    // and embedded browsers; neither should hold the whole Studio on a splash
    // screen when Firebase already restored the Gmail session.
    const unsubscribe = identityAuth.onIdTokenChanged(user => {
      if (!mounted) return
      setIdentityUser(user)
      setIdentityLoading(false)
    })
    void initAuthPersistence().catch(() => undefined)

    // Never leave the user on an endless bootstrap screen if a browser blocks
    // Firebase storage/network initialization. The login gate can still retry.
    const safetyTimer = window.setTimeout(() => {
      if (!mounted) return
      setIdentityUser(identityAuth.currentUser)
      setIdentityLoading(false)
    }, 3500)

    return () => { mounted = false; window.clearTimeout(safetyTimer); unsubscribe() }
  }, [])

  const loginToStudio = async () => {
    if (loginBusy) return
    setLoginBusy(true)
    setLoginError('')
    try {
      await signInWithGoogle()
    } catch (error) {
      setLoginError(friendlyAuthError(error))
    } finally {
      setLoginBusy(false)
    }
  }

  const openStudio = templateId => {
    const query = templateId ? `?template=${encodeURIComponent(templateId)}` : ''
    window.location.hash = `studio${query}`
  }

  if (route === 'studio') {
    if (identityLoading) return <LoadingStudio />
    if (!identityUser) return <><StudioLoginGate onLogin={loginToStudio} onBack={() => { window.location.hash = '' }} busy={loginBusy} error={loginError} /><UpdateNotice /></>
    return <>{showUpgrade && <CloudUpgradeModal onClose={() => setShowUpgrade(false)} />}<Suspense fallback={<LoadingStudio />}><HubStudio initialTemplateId={requestedTemplate} initialBridge={requestedBridge} onExit={() => { window.location.hash = '' }} onUpgrade={() => setShowUpgrade(true)} /></Suspense><UpdateNotice /></>
  }

  return <>{showUpgrade && <CloudUpgradeModal onClose={() => setShowUpgrade(false)} />}<Landing onOpenStudio={openStudio} onOpenUpgrade={() => setShowUpgrade(true)} /><UpdateNotice /></>
}
