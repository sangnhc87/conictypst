"use client";

import { useMemo, useState } from "react";

type Product = {
  id: string;
  name: string;
  eyebrow: string;
  description: string;
  image: string;
  color: string;
};

const products: Product[] = [
  { id: "teal-pro", name: "Teal Pro", eyebrow: "Chuyên nghiệp", description: "Sắc xanh ngọc hiện đại, rõ ràng và cân bằng cho đề kiểm tra chính thức.", image: "/previews/teal-pro.png", color: "#0f766e" },
  { id: "aurora", name: "Aurora", eyebrow: "Nổi bật", description: "Dải màu chuyển sắc trẻ trung, phù hợp phiếu học tập và chuyên đề sáng tạo.", image: "/previews/aurora.png", color: "#7c3aed" },
  { id: "navy-gold", name: "Navy Gold", eyebrow: "Sang trọng", description: "Xanh navy phối vàng học thuật, lý tưởng cho đề thi thử và tài liệu cao cấp.", image: "/previews/navy-gold.png", color: "#b88a22" },
  { id: "lotus", name: "Lotus", eyebrow: "Thanh lịch", description: "Cảm hứng hoa sen Việt, mềm mại nhưng vẫn chuẩn mực và dễ đọc khi in.", image: "/previews/lotus.png", color: "#be185d" },
  { id: "ocean-hexagon", name: "Ocean Hexagon", eyebrow: "Cá tính", description: "Hình học lục giác và màu đại dương tạo nhận diện mạnh cho lớp học hiện đại.", image: "/previews/ocean-hexagon.png", color: "#0369a1" },
];

const money = (value: number) => new Intl.NumberFormat("vi-VN").format(value) + "đ";

export default function Home() {
  const [cart, setCart] = useState<string[]>([]);
  const [checkoutOpen, setCheckoutOpen] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);
  const isCombo = cart.length === products.length;
  const total = isCombo ? 79000 : cart.length * 19000;
  const selected = useMemo(() => products.filter((product) => cart.includes(product.id)), [cart]);

  const toggle = (id: string) => setCart((current) => current.includes(id) ? current.filter((item) => item !== id) : [...current, id]);
  const chooseCombo = () => { setCart(products.map((product) => product.id)); setCheckoutOpen(true); };

  return (
    <main>
      <header className="nav-shell">
        <a className="brand" href="#top" aria-label="Sang Math Store">
          <span className="brand-mark">S</span><span><b>Sang Math</b><small>Template Store</small></span>
        </a>
        <button className="menu-button" onClick={() => setMenuOpen(!menuOpen)} aria-label="Mở menu">☰</button>
        <nav className={menuOpen ? "nav-links open" : "nav-links"}>
          <a href="#templates">Kho mẫu</a><a href="#how">Cách mua</a><a href="#faq">Hỏi đáp</a>
        </nav>
        <button className="cart-button" onClick={() => setCheckoutOpen(true)}><span>Giỏ mẫu</span><b>{cart.length}</b></button>
      </header>

      <section className="hero" id="top">
        <div className="hero-copy">
          <div className="pill">Template Typst dành cho giáo viên Toán</div>
          <h1>Đề đẹp hơn.<br/><em>Soạn nhanh hơn.</em></h1>
          <p>Chọn một thiết kế, thay nội dung và xuất PDF chuyên nghiệp. Không cần căn chỉnh thủ công từng trang.</p>
          <div className="hero-actions"><a className="primary" href="#templates">Xem 5 mẫu thiết kế</a><button className="secondary" onClick={chooseCombo}>Lấy combo 79.000đ</button></div>
          <div className="trust-row"><span>✓ File Typst chỉnh sửa được</span><span>✓ PDF mẫu xem trước</span><span>✓ Nhận file sau thanh toán</span></div>
        </div>
        <div className="hero-stage" aria-label="Xem trước các template Sang Math">
          <div className="paper paper-back"><img src="/previews/aurora.png" alt="Mẫu Aurora" /></div>
          <div className="paper paper-mid"><img src="/previews/navy-gold.png" alt="Mẫu Navy Gold" /></div>
          <div className="paper paper-front"><img src="/previews/teal-pro.png" alt="Mẫu Teal Pro" /></div>
          <div className="price-stamp"><small>chỉ từ</small><b>19K</b><span>/ mẫu</span></div>
        </div>
      </section>

      <section className="strip"><span>THIẾT KẾ CHUẨN IN A4</span><i>✦</i><span>HỖ TRỢ 4 DẠNG CÂU HỎI</span><i>✦</i><span>DỄ ĐỔI MÀU & THÔNG TIN</span><i>✦</i><span>DÙNG VỚI SANG-MATH</span></section>

      <section className="templates" id="templates">
        <div className="section-heading"><div><span className="kicker">Bộ sưu tập mở bán</span><h2>Chọn phong cách của bạn</h2></div><p>Mỗi mẫu là một hệ thiết kế hoàn chỉnh: đầu trang, nhãn câu, đáp án, màu chủ đạo và chân trang đồng bộ.</p></div>
        <div className="product-grid">
          {products.map((product, index) => {
            const active = cart.includes(product.id);
            return <article className={active ? "product-card selected" : "product-card"} key={product.id} style={{"--accent": product.color} as React.CSSProperties}>
              <div className="product-preview"><span className="number">0{index + 1}</span><img src={product.image} alt={`Xem trước template ${product.name}`} /><span className="preview-tag">Xem trước</span></div>
              <div className="product-info"><div><span className="product-eyebrow">{product.eyebrow}</span><h3>{product.name}</h3></div><strong>{money(19000)}</strong></div>
              <p>{product.description}</p>
              <button onClick={() => toggle(product.id)}>{active ? "✓ Đã thêm vào giỏ" : "Chọn mẫu này"}</button>
            </article>;
          })}
        </div>
      </section>

      <section className="combo-section">
        <div className="combo-copy"><span className="kicker light">Lựa chọn tiết kiệm nhất</span><h2>Trọn bộ 5 phong cách.<br/>Chỉ <em>79.000đ</em></h2><p>Mua lẻ 95.000đ — lấy combo tiết kiệm 16.000đ. Bạn có đủ phong cách cho đề 15 phút, giữa kỳ, thi thử và phiếu chuyên đề.</p><button onClick={chooseCombo}>Chọn combo 5 mẫu <span>→</span></button></div>
        <div className="combo-stack">{products.map((product, index) => <img key={product.id} src={product.image} alt="" style={{"--i": index} as React.CSSProperties}/>)}</div>
      </section>

      <section className="how" id="how"><span className="kicker">Nhanh và rõ ràng</span><h2>Ba bước để có mẫu</h2><div className="steps"><div><b>01</b><h3>Chọn thiết kế</h3><p>Mua một mẫu 19.000đ hoặc chọn combo 5 mẫu giá 79.000đ.</p></div><div><b>02</b><h3>Quét QR</h3><p>Nhập email nhận file và thanh toán bằng ứng dụng ngân hàng.</p></div><div><b>03</b><h3>Nhận & chỉnh sửa</h3><p>Hệ thống gửi file Typst, PDF mẫu và hướng dẫn vào email của bạn.</p></div></div></section>

      <section className="faq" id="faq"><div><span className="kicker">Câu hỏi thường gặp</span><h2>Mua một lần,<br/>dùng lâu dài.</h2></div><div className="faq-list"><details open><summary>Tôi nhận được những file gì?</summary><p>Bạn nhận mã nguồn Typst chỉnh sửa được, PDF xem trước và hướng dẫn thay thông tin trường, tên đề, màu sắc.</p></details><details><summary>Tôi có cần biết lập trình không?</summary><p>Không. Bạn chỉ cần thay phần chữ và câu hỏi theo vị trí đã đánh dấu trong mẫu.</p></details><details><summary>Có dùng lại cho nhiều đề được không?</summary><p>Có. Một mẫu có thể dùng lại cho các đề của chính bạn. Không được bán lại hoặc chia sẻ file nguồn.</p></details></div></section>

      <footer><a className="brand footer-brand" href="#top"><span className="brand-mark">S</span><span><b>Sang Math</b><small>Template Store</small></span></a><p>Template Toán học đẹp, thực dụng và dễ chỉnh sửa cho giáo viên Việt Nam.</p><span>© 2026 Nguyễn Văn Sang</span></footer>

      {cart.length > 0 && <div className="floating-cart"><span><b>{cart.length} mẫu</b><small>{isCombo ? "Đã áp dụng giá combo" : "Thêm đủ 5 mẫu để nhận giá 79.000đ"}</small></span><strong>{money(total)}</strong><button onClick={() => setCheckoutOpen(true)}>Thanh toán</button></div>}

      {checkoutOpen && <div className="modal-backdrop" onClick={() => setCheckoutOpen(false)}><section className="checkout" onClick={(event) => event.stopPropagation()} role="dialog" aria-modal="true" aria-label="Thanh toán"><button className="close" onClick={() => setCheckoutOpen(false)}>×</button><span className="kicker">Đơn hàng của bạn</span><h2>{isCombo ? "Combo 5 mẫu Sang Math" : cart.length ? `${cart.length} mẫu thiết kế` : "Chưa chọn mẫu"}</h2>{selected.length > 0 ? <><ul>{selected.map((item) => <li key={item.id}><span style={{background: item.color}}></span>{item.name}<b>{money(isCombo ? 15800 : 19000)}</b></li>)}</ul><div className="checkout-total"><span>Tổng thanh toán</span><strong>{money(total)}</strong></div><label>Email nhận file<input type="email" placeholder="giaovien@example.com" /></label><button className="pay-button" disabled>Tiếp tục đến mã QR</button><p className="setup-note">Chức năng thanh toán sẽ hoạt động sau khi kết nối tài khoản payOS hoặc SePay của chủ cửa hàng.</p></> : <><p>Hãy chọn ít nhất một mẫu trước khi thanh toán.</p><a className="primary full" href="#templates" onClick={() => setCheckoutOpen(false)}>Xem kho mẫu</a></>}</section></div>}
    </main>
  );
}
