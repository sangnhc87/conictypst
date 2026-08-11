"use client";

import { lazy, Suspense, useEffect, useMemo, useState } from "react";
import "./checkout.css";
import "./admin.css";
import "./platform.css";
const GameStudio = lazy(() => import("./GameStudio"));

type Product = {
  id: string;
  name: string;
  eyebrow: string;
  description: string;
  image: string;
  image2?: string;
  color: string;
  price: number;
  starter: boolean;
  active?: number | boolean;
  sort_order?: number;
  file_name?: string | null;
  file_size?: number | null;
  price_vnd?: number;
  product_type: "template" | "utility" | "game" | "account" | "latex";
  fulfillment_type: "download" | "web_access";
  access_model: "lifetime" | "subscription";
  access_days?: number | null;
  entitlement_key?: string | null;
  delivery_url?: string | null;
  badge?: string | null;
  featured?: number | boolean;
};

type Order = {
  id: string;
  paymentCode: string;
  email: string;
  items: Array<{ id: string; name: string; fulfillmentType?: "download" | "web_access" }>;
  total: number;
  status: "pending" | "paid" | "expired";
  expiresAt: string;
  paidAt?: string | null;
  paymentError?: string | null;
  qrUrl?: string | null;
  bank: { code: string; accountNumber: string; accountName: string };
};

const defaultProducts: Product[] = ([
  { id: "teal-pro", name: "Teal Pro", eyebrow: "Chuyên nghiệp", description: "Sắc xanh ngọc hiện đại, rõ ràng và cân bằng cho đề kiểm tra chính thức.", image: "/previews/teal-pro.png", color: "#0f766e" },
  { id: "aurora", name: "Aurora", eyebrow: "Nổi bật", description: "Dải màu chuyển sắc trẻ trung, phù hợp phiếu học tập và chuyên đề sáng tạo.", image: "/previews/aurora.png", color: "#7c3aed" },
  { id: "navy-gold", name: "Navy Gold", eyebrow: "Sang trọng", description: "Xanh navy phối vàng học thuật, lý tưởng cho đề thi thử và tài liệu cao cấp.", image: "/previews/navy-gold.png", color: "#b88a22" },
  { id: "lotus", name: "Lotus", eyebrow: "Thanh lịch", description: "Cảm hứng hoa sen Việt, mềm mại nhưng vẫn chuẩn mực và dễ đọc khi in.", image: "/previews/lotus.png", color: "#be185d" },
  { id: "ocean-hexagon", name: "Ocean Hexagon", eyebrow: "Cá tính", description: "Hình học lục giác và màu đại dương tạo nhận diện mạnh cho lớp học hiện đại.", image: "/previews/ocean-hexagon.png", color: "#0369a1" },
  { id: "hyperlink", name: "Hyperlink Tự Động", eyebrow: "Tương tác PDF", description: "Câu hỏi và mục lục có liên kết điều hướng trong PDF, mở nhanh đúng câu khi dạy hoặc chữa đề.", image: "/previews/hyperlink.png", color: "#2457d6" },
  { id: "beamer", name: "Beamer Teal Pro", eyebrow: "Trình chiếu 16:9", description: "Bài giảng trình chiếu chuyên dụng, đồng bộ màu sắc và công thức Toán rõ nét trên màn hình lớn.", image: "/previews/beamer.png", color: "#087f72" },
  { id: "draft-duplex", name: "Đề 70/30 — Nháp Đối Xứng", eyebrow: "In hai mặt chẵn–lẻ", description: "70% nội dung và 30% nháp: trang lẻ nháp bên phải, trang chẵn nháp bên trái để học sinh viết thuận tay khi in hai mặt.", image: "/previews/draft-duplex-odd.png", image2: "/previews/draft-duplex-even.png", color: "#0f766e" },
] as Array<Omit<Product, "price" | "starter" | "product_type" | "fulfillment_type" | "access_model">>).map((product, index) => ({
  ...product,
  price: 19000,
  starter: index < 5,
  product_type: "template",
  fulfillment_type: "download",
  access_model: "lifetime",
}));

const PRODUCT_TYPES = [
  { id: "all", label: "Tất cả" },
  { id: "template", label: "Mẫu tài liệu" },
  { id: "utility", label: "Tiện ích" },
  { id: "game", label: "Game giáo dục" },
  { id: "account", label: "Tài khoản" },
  { id: "latex", label: "LaTeX" },
] as const;

const productTypeLabel = (type: Product["product_type"]) => PRODUCT_TYPES.find((item) => item.id === type)?.label || "Sản phẩm số";

const money = (value: number) => new Intl.NumberFormat("vi-VN").format(value) + "đ";
const durationLabel = (days?: number | null) => {
  const value = Number(days || 0);
  if (value >= 365 && value % 365 === 0) return `${value / 365} năm`;
  return `${value || 30} ngày`;
};
const baseProductName = (name: string) => name.split(" · ")[0];
const uniqueProductCount = (items: Product[]) => new Set(items.map((product) => product.entitlement_key || product.id)).size;

function Store() {
  const [cart, setCart] = useState<string[]>([]);
  const [cartDismissed, setCartDismissed] = useState(false);
  const [products, setProducts] = useState<Product[]>(defaultProducts);
  const [comboPrice, setComboPrice] = useState(79000);
  const [checkoutOpen, setCheckoutOpen] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);
  const [email, setEmail] = useState("");
  const [order, setOrder] = useState<Order | null>(null);
  const [orderToken, setOrderToken] = useState("");
  const [paying, setPaying] = useState(false);
  const [checkoutError, setCheckoutError] = useState("");
  const [copied, setCopied] = useState("");
  const [activeType, setActiveType] = useState<(typeof PRODUCT_TYPES)[number]["id"]>("all");
  const activeStarterIds = products.filter((product) => product.starter && product.product_type === "template").map((product) => product.id);
  const hasStarterCombo = activeStarterIds.length >= 2 && activeStarterIds.every((id) => cart.includes(id));
  const extraCount = cart.filter((id) => !activeStarterIds.includes(id)).length;
  const regularTotal = products.filter((product) => cart.includes(product.id)).reduce((sum, product) => sum + product.price, 0);
  const starterTotal = products.filter((product) => product.starter && cart.includes(product.id)).reduce((sum, product) => sum + product.price, 0);
  const total = hasStarterCombo ? comboPrice + regularTotal - starterTotal : regularTotal;
  const minimumPrice = products.length ? Math.min(...products.map((product) => product.price)) : 0;
  const selected = useMemo(() => products.filter((product) => cart.includes(product.id)), [cart, products]);
  const requiresGmail = selected.some((product) => product.fulfillment_type === "web_access");
  const visibleProducts = useMemo(() => {
    const filtered = activeType === "all" ? products : products.filter((product) => product.product_type === activeType);
    const seen = new Set<string>();
    return filtered.filter((product) => {
      if (!product.entitlement_key) return true;
      if (seen.has(product.entitlement_key)) return false;
      seen.add(product.entitlement_key);
      return true;
    });
  }, [activeType, products]);
  const availableTypes = useMemo(() => PRODUCT_TYPES.filter((type) => type.id === "all" || products.some((product) => product.product_type === type.id)), [products]);

  const toggle = (id: string) => { resetOrder(); setCart((current) => current.includes(id) ? current.filter((item) => item !== id) : [...current, id]); setCartDismissed(false); };
  const selectPlan = (plan: Product) => {
    resetOrder();
    const siblingIds = new Set(products.filter((item) => item.entitlement_key && item.entitlement_key === plan.entitlement_key).map((item) => item.id));
    setCart((current) => current.includes(plan.id)
      ? current.filter((id) => !siblingIds.has(id))
      : [...current.filter((id) => !siblingIds.has(id)), plan.id]);
    setCartDismissed(false);
  };
  const chooseCombo = () => { resetOrder(); setCart(activeStarterIds); setCheckoutOpen(true); setCartDismissed(false); };

  const resetOrder = () => {
    setOrder(null);
    setOrderToken("");
    setCheckoutError("");
    localStorage.removeItem("sang-math-pending-order");
  };

  const refreshOrder = async (id: string, token: string) => {
    const response = await fetch(`/api/orders/${encodeURIComponent(id)}?token=${encodeURIComponent(token)}`, { cache: "no-store" });
    if (!response.ok) throw new Error("Không thể kiểm tra trạng thái đơn hàng.");
    const data = await response.json() as { order: Order };
    setOrder(data.order);
    setEmail(data.order.email);
    setCart(data.order.items.map((item) => item.id));
    return data.order;
  };

  useEffect(() => {
    void fetch("/api/catalog", { cache: "no-store" }).then(async (response) => {
      if (!response.ok) return;
      const data = await response.json() as { products: Array<Product & { price_vnd?: number }>; comboPrice: number };
      setProducts(data.products.map((product) => ({
        ...product,
        price: Number(product.price ?? product.price_vnd ?? 19000),
        starter: Boolean(product.starter),
        product_type: product.product_type || "template",
        fulfillment_type: product.fulfillment_type || "download",
        access_model: product.access_model || "lifetime",
      })));
      setComboPrice(Number(data.comboPrice) || 79000);
    }).catch(() => undefined);
  }, []);

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const requestedProduct = params.get("buy");
    if (!requestedProduct) return;
    setCart([requestedProduct]);
    const requestedEmail = params.get("email");
    if (requestedEmail) setEmail(requestedEmail.trim().toLowerCase());
    setActiveType("account");
    setCheckoutOpen(true);
  }, []);

  useEffect(() => {
    const saved = localStorage.getItem("sang-math-pending-order");
    if (!saved) return;
    try {
      const { id, token } = JSON.parse(saved) as { id: string; token: string };
      if (!id || !token) return;
      setOrderToken(token);
      void refreshOrder(id, token).then((restored) => {
        if (restored.status !== "expired") setCheckoutOpen(true);
      }).catch(() => localStorage.removeItem("sang-math-pending-order"));
    } catch {
      localStorage.removeItem("sang-math-pending-order");
    }
  }, []);

  useEffect(() => {
    if (!order || order.status !== "pending" || !orderToken) return;
    const timer = window.setInterval(() => {
      void refreshOrder(order.id, orderToken).catch(() => undefined);
    }, 3000);
    return () => window.clearInterval(timer);
  }, [order?.id, order?.status, orderToken]);

  const createOrder = async () => {
    setCheckoutError("");
    setPaying(true);
    try {
      const response = await fetch("/api/orders", {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({ email, items: cart }),
      });
      const data = await response.json() as { order?: Order; token?: string; error?: string };
      if (!response.ok || !data.order || !data.token) throw new Error(data.error || "Không thể tạo đơn hàng.");
      setOrder(data.order);
      setOrderToken(data.token);
      localStorage.setItem("sang-math-pending-order", JSON.stringify({ id: data.order.id, token: data.token }));
    } catch (error) {
      setCheckoutError(error instanceof Error ? error.message : "Không thể tạo đơn hàng.");
    } finally {
      setPaying(false);
    }
  };

  const copy = async (value: string, field: string) => {
    await navigator.clipboard.writeText(value);
    setCopied(field);
    window.setTimeout(() => setCopied(""), 1500);
  };

  return (
    <main>
      <header className="nav-shell">
        <a className="brand" href="#top" aria-label="Sang Math Store">
          <span className="brand-mark">S</span><span><b>Sang Math</b><small>Template Store</small></span>
        </a>
        <button className="menu-button" onClick={() => setMenuOpen(!menuOpen)} aria-label="Mở menu">☰</button>
        <nav className={menuOpen ? "nav-links open" : "nav-links"}>
          <a href="#products">Sản phẩm</a><a href="#roadmap">Hệ sinh thái</a><a href="#how">Cách mua</a><a href="#faq">Hỏi đáp</a>
        </nav>
        <button className="cart-button" onClick={() => { setCheckoutError(""); setCheckoutOpen(true); }}><span>Giỏ hàng</span><b>{cart.length}</b></button>
      </header>

      <section className="hero" id="top">
        <div className="hero-copy">
          <div className="pill">Hệ sinh thái công cụ dành cho giáo viên</div>
          <h1>Dạy học hay hơn.<br/><em>Làm việc nhẹ hơn.</em></h1>
          <p>Mẫu tài liệu, tiện ích web và trò chơi giáo dục thực dụng. Chọn sản phẩm, chuyển khoản và nhận quyền sử dụng tự động.</p>
          <div className="hero-actions"><a className="primary" href="#products">Xem {uniqueProductCount(products)} sản phẩm đang bán</a>{activeStarterIds.length >= 2 && <button className="secondary" onClick={chooseCombo}>Lấy combo {money(comboPrice)}</button>}</div>
          <div className="trust-row"><span>✓ Giá nhỏ, dùng thật</span><span>✓ Giao tự động 24/7</span><span>✓ Gói rõ thời hạn</span></div>
        </div>
        <div className="hero-stage" aria-label="Xem trước các template Sang Math">
          <div className="paper paper-back"><img src="/previews/aurora.png" alt="Mẫu Aurora" /></div>
          <div className="paper paper-mid"><img src="/previews/navy-gold.png" alt="Mẫu Navy Gold" /></div>
          <div className="paper paper-front"><img src="/previews/teal-pro.png" alt="Mẫu Teal Pro" /></div>
          <div className="price-stamp"><small>chỉ từ</small><b>{Math.round(minimumPrice / 1000)}K</b><span>/ mẫu</span></div>
        </div>
      </section>

      <section className="strip"><span>MẪU TÀI LIỆU</span><i>✦</i><span>TIỆN ÍCH 19K</span><i>✦</i><span>GAME GIÁO DỤC</span><i>✦</i><span>CÔNG CỤ LATEX</span><i>✦</i><span>GIAO TỰ ĐỘNG 24/7</span></section>

      <section className="templates" id="products">
        <div className="section-heading"><div><span className="kicker">Kho sản phẩm số</span><h2>Chọn đúng công cụ cho công việc</h2></div><p>Hôm nay là các bộ mẫu Typst đã hoàn thiện. Khung cửa hàng đã sẵn sàng mở rộng sang tiện ích, game giáo dục, tài khoản và LaTeX mà vẫn dùng chung một luồng thanh toán.</p></div>
        <div className="catalog-tabs" aria-label="Lọc loại sản phẩm">
          {availableTypes.map((type) => <button key={type.id} className={activeType === type.id ? "active" : ""} onClick={() => setActiveType(type.id)}>{type.label}<span>{uniqueProductCount(type.id === "all" ? products : products.filter((product) => product.product_type === type.id))}</span></button>)}
        </div>
        <div className="products-container">
          {availableTypes.filter((type) => type.id !== "all" && (activeType === "all" || activeType === type.id)).map((type) => {
            const typeProducts = visibleProducts.filter((p) => p.product_type === type.id);
            if (typeProducts.length === 0) return null;
            return (
              <div key={type.id} className="product-group">
                {activeType === "all" && <h3 className="group-heading">{type.label}</h3>}
                <div className="product-grid">
                  {typeProducts.map((product, index) => {
                    const plans = product.entitlement_key
                      ? products.filter((item) => item.entitlement_key === product.entitlement_key).sort((a, b) => Number(a.access_days || 0) - Number(b.access_days || 0))
                      : [product];
                    const active = plans.some((plan) => cart.includes(plan.id));
                    const isPlanGroup = plans.length > 1;
                    return <article className={active ? "product-card selected" : "product-card"} key={product.id} style={{"--accent": product.color} as React.CSSProperties}>
                      <div className={product.image2 ? "product-preview paired" : "product-preview"}><span className="number">{String(index + 1).padStart(2, "0")}</span>{product.badge && product.product_type !== "game" && <span className="product-badge">{product.badge}</span>}<img src={product.image} alt={`Xem trước ${product.name} trang lẻ`} />{product.image2 && <img src={product.image2} alt={`Xem trước ${product.name} trang chẵn`} />}{product.product_type === "template" && <span className="preview-tag">{product.image2 ? "Chẵn · Lẻ" : "Tải sau khi mua"}</span>}</div>
                      <div className="product-info"><div><span className="product-eyebrow">{isPlanGroup ? "Game giáo dục" : product.eyebrow}</span><h3>{isPlanGroup ? baseProductName(product.name) : product.name}</h3></div><strong>{isPlanGroup ? `Từ ${money(Math.min(...plans.map((plan) => plan.price)))}` : money(product.price)}</strong></div>
                      <p className="product-meta">{productTypeLabel(product.product_type)} · {product.access_model === "subscription" ? durationLabel(product.access_days) : "Dùng lâu dài"}</p>
                      <p>{product.description}</p>
                      {isPlanGroup && <div className="plan-options">{plans.map((plan) => <button key={plan.id} className={cart.includes(plan.id) ? "active" : ""} onClick={() => selectPlan(plan)}><span>{durationLabel(plan.access_days)}</span><b>{money(plan.price)}</b>{plan.access_days === 730 && <small>Phổ biến</small>}</button>)}</div>}
                      {isPlanGroup || product.product_type === "game" || product.product_type === "utility" ? (
                        <div className="game-actions">
                          {(product.product_type === "game" || product.product_type === "utility") && <a href={`/games/${product.entitlement_key || product.id}/`} className="play-btn">{product.product_type === "utility" ? "Dùng thử ngay" : "Chơi thử ngay"}</a>}
                          <button onClick={() => { if (isPlanGroup && !active) selectPlan(plans[0]); else if (isPlanGroup && active) { const siblingIds = new Set(plans.map(p => p.id)); setCart(current => current.filter(id => !siblingIds.has(id))); } else if (!isPlanGroup) toggle(product.id); }} className="buy-btn">{active ? "✓ Đã thêm vào giỏ" : (isPlanGroup ? "Thêm vào giỏ" : "Chọn sản phẩm này")}</button>
                        </div>
                      ) : (
                        <button onClick={() => toggle(product.id)}>{active ? "✓ Đã thêm vào giỏ" : "Chọn sản phẩm này"}</button>
                      )}
                    </article>;
                  })}
                </div>
              </div>
            );
          })}
        </div>
      </section>

      {activeStarterIds.length >= 2 && <section className="combo-section">
        <div className="combo-copy"><span className="kicker light">Lựa chọn tiết kiệm nhất</span><h2>Trọn bộ {activeStarterIds.length} phong cách.<br/>Chỉ <em>{money(comboPrice)}</em></h2><p>Lấy combo để có đủ phong cách cho đề 15 phút, giữa kỳ, thi thử và phiếu chuyên đề.</p><button onClick={chooseCombo}>Chọn combo {activeStarterIds.length} mẫu <span>→</span></button></div>
        <div className="combo-stack">{products.filter((product) => product.starter).map((product, index) => <img key={product.id} src={product.image} alt="" style={{"--i": index} as React.CSSProperties}/>)}</div>
      </section>}

      <section className="ecosystem" id="roadmap"><div><span className="kicker">Một nền tảng, nhiều gian hàng</span><h2>Khung đã sẵn cho chặng đường dài.</h2><p>Mỗi dòng sản phẩm có cách trình bày riêng, nhưng dùng chung danh mục, đơn hàng, thanh toán tự động và lịch sử mua. Khi thêm game hoặc tiện ích mới, bạn quản lý ngay trong cùng trang Admin.</p></div><div className="ecosystem-grid"><article><b>01</b><h3>Mẫu & tài liệu</h3><p>Typst, Beamer, PDF tương tác và bộ LaTeX tải về.</p></article><article><b>02</b><h3>Tiện ích giáo viên</h3><p>Công cụ nhỏ 19k, mở trên web ngay sau thanh toán.</p></article><article><b>03</b><h3>13 game giáo dục</h3><p>Một kho câu hỏi dùng chung; nhập nhanh bằng Word, Excel, CSV hoặc soạn trực tiếp.</p></article><article><b>04</b><h3>Quyền truy cập</h3><p>Tài khoản và gói sử dụng có thời hạn, quản lý tập trung.</p></article></div></section>

      <section className="how" id="how"><span className="kicker">Nhanh và rõ ràng</span><h2>Ba bước để nhận sản phẩm</h2><div className="steps"><div><b>01</b><h3>Chọn sản phẩm</h3><p>Chọn mẫu, tiện ích hoặc combo phù hợp với công việc của bạn.</p></div><div><b>02</b><h3>Quét QR</h3><p>Quét đúng mã QR đã có sẵn số tiền và nội dung chuyển khoản riêng.</p></div><div><b>03</b><h3>Nhận ngay lập tức</h3><p>SePay xác nhận giao dịch tự động, nút tải file hoặc mở tiện ích xuất hiện ngay — không cần chờ duyệt.</p></div></div></section>

      <section className="faq" id="faq"><div><span className="kicker">Câu hỏi thường gặp</span><h2>Dùng thử trước,<br/>chọn gói sau.</h2></div><div className="faq-list"><details open><summary>Game được dùng thử như thế nào?</summary><p>Mỗi Gmail được kích hoạt một lượt dùng thử full tính năng trong 24 giờ cho từng game. Sau đó có thể chọn gói 1, 2 hoặc 5 năm.</p></details><details><summary>Dữ liệu game có bị mất khi hết gói?</summary><p>Không. Dữ liệu vẫn nằm trong IndexedDB trên máy và trong file ZIP bạn đã xuất; chỉ quyền mở Studio trực tuyến tạm dừng.</p></details><details><summary>Tôi có cần biết lập trình không?</summary><p>Không. Bạn nhập câu hỏi, công thức KaTeX, hình ảnh và màu sắc trực tiếp trên giao diện.</p></details></div></section>

      <footer><a className="brand footer-brand" href="#top"><span className="brand-mark">S</span><span><b>Sang Math</b><small>Teacher Tools Store</small></span></a><p>Sản phẩm số nhỏ gọn, thực dụng và dễ dùng cho giáo viên Việt Nam.</p><span>© 2026 Nguyễn Văn Sang</span></footer>

      {cart.length > 0 && !cartDismissed && <div className="floating-cart"><button className="close-cart-btn" onClick={() => setCartDismissed(true)} aria-label="Ẩn giỏ hàng">Ẩn</button><span><b>{cart.length} sản phẩm</b><small>{hasStarterCombo ? "Đã áp dụng giá combo mẫu gốc" : "Thanh toán tự động, giao file hoặc cấp quyền ngay"}</small></span><strong>{money(total)}</strong><button onClick={() => setCheckoutOpen(true)}>Thanh toán</button></div>}

      {checkoutOpen && <div className="modal-backdrop" onClick={() => setCheckoutOpen(false)}><section className="checkout" onClick={(event) => event.stopPropagation()} role="dialog" aria-modal="true" aria-label="Thanh toán"><button className="close" onClick={() => setCheckoutOpen(false)}>×</button>
        {!order && <><span className="kicker">Đơn hàng của bạn</span><h2>{hasStarterCombo && !extraCount ? `Combo ${activeStarterIds.length} mẫu Sang Math` : cart.length ? `${cart.length} sản phẩm` : "Chưa chọn sản phẩm"}</h2>{selected.length > 0 ? <><ul>{selected.map((item) => <li key={item.id}><span style={{background: item.color}}></span>{item.name}<b>{money(item.price)}</b><button className="remove-item" onClick={() => toggle(item.id)} aria-label="Xóa" title="Bỏ khỏi giỏ">Xóa</button></li>)}</ul>{hasStarterCombo && <p className="combo-applied">✓ Đã áp dụng giá combo tự động</p>}<div className="checkout-total"><span>Tổng thanh toán</span><strong>{money(total)}</strong></div><label>{requiresGmail ? "Gmail nhận quyền sử dụng theo gói đã chọn" : "Email lưu cùng đơn hàng"}<input type="email" value={email} onChange={(event) => setEmail(event.target.value)} placeholder={requiresGmail ? "giaovien@gmail.com" : "giaovien@example.com"} autoComplete="email" /></label>{requiresGmail && <p className="gmail-note">Quyền được tự động cấp cho đúng Gmail này. Dữ liệu game vẫn chỉ lưu trên máy và trong ZIP của bạn.</p>}{checkoutError && <p className="checkout-error">{checkoutError}</p>}<button className="pay-button active" onClick={createOrder} disabled={paying || !email}>{paying ? "Đang tạo mã QR…" : "Tạo mã QR thanh toán"}</button><p className="setup-note">Mã QR ghi sẵn đúng số tiền và nội dung. Sau khi chuyển khoản, hệ thống tự cấp file tải hoặc quyền sử dụng.</p></> : <><p>Hãy chọn ít nhất một sản phẩm trước khi thanh toán.</p><a className="primary full" href="#products" onClick={() => setCheckoutOpen(false)}>Xem kho sản phẩm</a></>}</>}

        {order?.status === "pending" && <div className="payment-panel"><span className="kicker">Thanh toán tự động</span><h2>Quét QR để nhận file</h2>{order.qrUrl && <img className="payment-qr" src={order.qrUrl} alt={`QR thanh toán ${money(order.total)}`} />}<div className="payment-field"><span>Số tiền</span><strong>{money(order.total)}</strong><button onClick={() => copy(String(order.total), "amount")}>{copied === "amount" ? "Đã chép" : "Sao chép"}</button></div><div className="payment-field"><span>Nội dung bắt buộc</span><strong>{order.paymentCode}</strong><button onClick={() => copy(order.paymentCode, "code")}>{copied === "code" ? "Đã chép" : "Sao chép"}</button></div><p className="bank-line">{order.bank.code} · {order.bank.accountNumber} · {order.bank.accountName}</p><div className="waiting"><i></i><span><b>Đang chờ ngân hàng xác nhận</b><small>Trang tự kiểm tra mỗi 3 giây, bạn không cần gửi biên lai.</small></span></div>{order.paymentError && <p className="checkout-error">{order.paymentError}</p>}<p className="setup-note">Đừng sửa số tiền hoặc nội dung chuyển khoản. Mã thanh toán có hiệu lực trong 24 giờ.</p></div>}

        {order?.status === "paid" && <div className="paid-panel"><div className="paid-check">✓</div><span className="kicker">Đã nhận thanh toán</span><h2>Sản phẩm của bạn đã sẵn sàng</h2><p>Giao dịch đã được xác nhận tự động. Bạn có thể tải file hoặc mở tiện ích ngay bên dưới.</p>{order.paymentError && <p className="checkout-error">{order.paymentError}</p>}<div className="download-list">{order.items.map((item) => { const isWeb = item.fulfillmentType === "web_access"; return <a key={item.id} href={`/${isWeb ? "api/access" : "api/download"}/${encodeURIComponent(order.id)}/${encodeURIComponent(item.id)}?token=${encodeURIComponent(orderToken)}`} target={isWeb ? "_blank" : undefined} rel={isWeb ? "noreferrer" : undefined}>{isWeb ? "Mở" : "Tải"} {item.name}<span>{isWeb ? "↗" : "↓"}</span></a>; })}</div><button className="new-order" onClick={resetOrder}>Mua thêm sản phẩm khác</button><p className="setup-note">Liên kết đơn được lưu trên trình duyệt này để bạn có thể truy cập lại.</p></div>}

        {order?.status === "expired" && <div className="expired-panel"><span className="kicker">Mã QR đã hết hạn</span><h2>Tạo lại đơn hàng</h2><p>Đơn chưa được thanh toán trong 24 giờ. Bạn có thể tạo mã mới với cùng các mẫu đã chọn.</p><button className="pay-button active" onClick={resetOrder}>Tạo đơn mới</button></div>}
      </section></div>}
    </main>
  );
}

function Admin() {
  const [adminKey, setAdminKey] = useState(() => sessionStorage.getItem("sang-math-admin-key") || "");
  const [draftKey, setDraftKey] = useState("");
  const [adminProducts, setAdminProducts] = useState<Product[]>([]);
  const [adminComboPrice, setAdminComboPrice] = useState(79000);
  const [adminStatus, setAdminStatus] = useState("");
  const [adminError, setAdminError] = useState("");

  const loadAdmin = async (key: string) => {
    setAdminError("");
    const response = await fetch("/api/admin/catalog", { headers: { "x-admin-key": key }, cache: "no-store" });
    const data = await response.json() as { products?: Product[]; comboPrice?: number; error?: string };
    if (!response.ok || !data.products) throw new Error(data.error || "Không thể mở quản trị.");
    setAdminProducts(data.products.map((product) => ({
      ...product,
      price: Number(product.price_vnd || product.price || 0),
      starter: Boolean(product.starter),
      active: Boolean(product.active),
      product_type: product.product_type || "template",
      fulfillment_type: product.fulfillment_type || "download",
      access_model: product.access_model || "subscription",
    })));
    setAdminComboPrice(Number(data.comboPrice) || 79000);
    setAdminKey(key);
    sessionStorage.setItem("sang-math-admin-key", key);
  };

  useEffect(() => {
    if (adminKey) void loadAdmin(adminKey).catch((error) => { setAdminError(error.message); setAdminKey(""); sessionStorage.removeItem("sang-math-admin-key"); });
  }, []);

  const updateAdminProduct = (index: number, field: keyof Product, value: unknown) => {
    setAdminProducts((current) => current.map((product, productIndex) => productIndex === index ? { ...product, [field]: value } : product));
  };

  const saveAdmin = async () => {
    setAdminStatus("Đang lưu…"); setAdminError("");
    const response = await fetch("/api/admin/catalog", {
      method: "PUT",
      headers: { "content-type": "application/json", "x-admin-key": adminKey },
      body: JSON.stringify({ comboPrice: adminComboPrice, products: adminProducts.map((product, index) => ({ ...product, price_vnd: product.price, sort_order: product.sort_order || index + 1 })) }),
    });
    const data = await response.json() as { error?: string };
    if (!response.ok) { setAdminStatus(""); setAdminError(data.error || "Không thể lưu."); return; }
    setAdminStatus("Đã lưu và cập nhật giá trên Store.");
    window.setTimeout(() => setAdminStatus(""), 2500);
    await loadAdmin(adminKey);
  };

  const uploadZip = async (index: number, file: File) => {
    const product = adminProducts[index];
    setAdminStatus(`Đang nạp ${file.name}…`); setAdminError("");
    const form = new FormData(); form.append("file", file);
    const response = await fetch(`/api/admin/upload/${encodeURIComponent(product.id)}`, { method: "POST", headers: { "x-admin-key": adminKey }, body: form });
    const data = await response.json() as { error?: string; fileName?: string; fileSize?: number };
    if (!response.ok) { setAdminStatus(""); setAdminError(data.error || "Không thể nạp file."); return; }
    updateAdminProduct(index, "file_name", data.fileName || file.name);
    updateAdminProduct(index, "file_size", data.fileSize || file.size);
    setAdminStatus(`Đã nạp ${file.name} vào kho riêng.`);
    await loadAdmin(adminKey);
  };

  const addProduct = () => setAdminProducts((current) => [...current, {
    id: `san-pham-moi-${Date.now().toString(36)}`, name: "Sản phẩm mới", eyebrow: "Tiện ích giáo viên", description: "Mô tả ngắn, nêu rõ sản phẩm giúp giáo viên tiết kiệm thời gian như thế nào.", image: "/previews/teal-pro.png", color: "#0f766e", price: 19000, price_vnd: 19000, starter: false, active: false, sort_order: current.length + 1, product_type: "utility", fulfillment_type: "download", access_model: "lifetime", featured: false,
  }]);

  if (!adminKey) return <main className="admin-page"><section className="admin-login"><span className="brand-mark">S</span><span className="kicker">Sang Math Store</span><h1>Quản trị cửa hàng</h1><p>Đăng nhập để đổi giá, bật/tắt mẫu và nạp file ZIP giao tự động.</p><input type="password" value={draftKey} onChange={(event) => setDraftKey(event.target.value)} placeholder="Mật khẩu quản trị" onKeyDown={(event) => { if (event.key === "Enter") void loadAdmin(draftKey).catch((error) => setAdminError(error.message)); }} />{adminError && <p className="admin-error">{adminError}</p>}<button onClick={() => void loadAdmin(draftKey).catch((error) => setAdminError(error.message))}>Đăng nhập</button><a href="/">← Về cửa hàng</a></section></main>;

  return <main className="admin-page">
    <header className="admin-header"><div><span className="kicker">Sang Math Store</span><h1>Kho sản phẩm & giá bán</h1><p>Quản lý mẫu, tiện ích, game, tài khoản và công cụ LaTeX trong cùng một nơi.</p></div><div><a href="/" target="_blank">Mở Store ↗</a><button onClick={() => { sessionStorage.removeItem("sang-math-admin-key"); setAdminKey(""); }}>Đăng xuất</button></div></header>
    <section className="admin-toolbar"><label>Giá combo mẫu<input type="number" min="0" step="1000" value={adminComboPrice} onChange={(event) => setAdminComboPrice(Number(event.target.value))} /></label><button className="admin-add" onClick={addProduct}>+ Thêm sản phẩm</button><button className="admin-save" onClick={saveAdmin}>Lưu tất cả</button></section>
    {adminStatus && <p className="admin-success">{adminStatus}</p>}{adminError && <p className="admin-error wide">{adminError}</p>}
    <section className="admin-grid">{adminProducts.map((product, index) => <article className="admin-card" key={`${product.id}-${index}`}>
      <div className="admin-card-top"><img src={product.image} alt="" /><div><label className="switch"><input type="checkbox" checked={Boolean(product.active)} onChange={(event) => updateAdminProduct(index, "active", event.target.checked)} /><span></span>{product.active ? "Đang bán" : "Đang ẩn"}</label><label className="switch"><input type="checkbox" checked={Boolean(product.featured)} onChange={(event) => updateAdminProduct(index, "featured", event.target.checked)} /><span></span>Nổi bật</label>{product.product_type === "template" && <label className="switch"><input type="checkbox" checked={product.starter} onChange={(event) => updateAdminProduct(index, "starter", event.target.checked)} /><span></span>Trong combo</label>}</div></div>
      <div className="admin-fields">
        <label>Mã sản phẩm<input value={product.id} onChange={(event) => updateAdminProduct(index, "id", event.target.value.toLowerCase().replace(/[^a-z0-9-]/g, "-"))} /></label>
        <label>Tên sản phẩm<input value={product.name} onChange={(event) => updateAdminProduct(index, "name", event.target.value)} /></label>
        <label>Loại sản phẩm<select value={product.product_type} onChange={(event) => updateAdminProduct(index, "product_type", event.target.value)}><option value="template">Mẫu tài liệu</option><option value="utility">Tiện ích</option><option value="game">Game giáo dục</option><option value="account">Tài khoản/quyền truy cập</option><option value="latex">LaTeX</option></select></label>
        <label>Cách giao<select value={product.fulfillment_type} onChange={(event) => updateAdminProduct(index, "fulfillment_type", event.target.value)}><option value="download">Tải file ZIP</option><option value="web_access">Mở tiện ích web</option></select></label>
        <label>Kiểu sử dụng<select value={product.access_model} onChange={(event) => updateAdminProduct(index, "access_model", event.target.value)}><option value="lifetime">Không thời hạn (file tải)</option><option value="subscription">Có thời hạn</option></select></label>
        {product.access_model === "subscription" && <label>Số ngày sử dụng<input type="number" min="1" max="3650" value={product.access_days || 30} onChange={(event) => updateAdminProduct(index, "access_days", Number(event.target.value))} /></label>}
        {product.fulfillment_type === "web_access" && <label>Mã quyền chung<input value={product.entitlement_key || product.id} onChange={(event) => updateAdminProduct(index, "entitlement_key", event.target.value.toLowerCase().replace(/[^a-z0-9-]/g, "-"))} /></label>}
        <label>Nhãn ngắn<input value={product.eyebrow} onChange={(event) => updateAdminProduct(index, "eyebrow", event.target.value)} /></label>
        <label>Huy hiệu<input value={product.badge || ""} placeholder="Mới / Bán chạy" onChange={(event) => updateAdminProduct(index, "badge", event.target.value)} /></label>
        <label>Giá bán<input type="number" min="0" step="1000" value={product.price} onChange={(event) => updateAdminProduct(index, "price", Number(event.target.value))} /></label>
        <label>Thứ tự<input type="number" value={product.sort_order || index + 1} onChange={(event) => updateAdminProduct(index, "sort_order", Number(event.target.value))} /></label>
        <label className="wide">Mô tả<textarea value={product.description} onChange={(event) => updateAdminProduct(index, "description", event.target.value)} /></label>
        <label className="wide">Ảnh xem trước (URL)<input value={product.image} onChange={(event) => updateAdminProduct(index, "image", event.target.value)} /></label>
        {product.fulfillment_type === "web_access" && <label className="wide">Đường dẫn mở sau thanh toán (HTTPS)<input value={product.delivery_url || ""} placeholder="https://..." onChange={(event) => updateAdminProduct(index, "delivery_url", event.target.value)} /></label>}
        <label>Màu nhận diện<input type="color" value={product.color} onChange={(event) => updateAdminProduct(index, "color", event.target.value)} /></label>
      </div>
      {product.fulfillment_type === "download" && <div className="admin-upload"><span><b>{product.file_name || "Chưa nạp ZIP"}</b><small>{product.file_size ? `${Math.ceil(product.file_size / 1024)} KB` : "File sẽ được giao sau thanh toán"}</small></span><label>Nạp ZIP mới<input type="file" accept=".zip,application/zip" onChange={(event) => { const file = event.target.files?.[0]; if (file) void uploadZip(index, file); }} /></label></div>}
    </article>)}</section>
    <footer className="admin-footer"><button onClick={addProduct}>+ Thêm sản phẩm khác</button><button className="admin-save" onClick={saveAdmin}>Lưu tất cả thay đổi</button></footer>
  </main>;
}

export default function Home() {
  if (window.location.pathname.startsWith("/games/")) return <Suspense fallback={<main className="game-loading"><div></div><h1>Đang mở kho game…</h1></main>}><GameStudio /></Suspense>;
  return window.location.pathname.startsWith("/admin") ? <Admin /> : <Store />;
}
