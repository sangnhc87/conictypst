(() => {
    'use strict';

    const OWNER_EMAILS = new Set(['nguyensangnhc@gmail.com', 'sangbeau@gmail.com']);
    const OWNER_EMAIL = 'nguyensangnhc@gmail.com';
    const FUNCTIONS_REGION = 'asia-southeast1';
    const PRODUCT_ORDER = ['hub', 'hdsd', 'omr'];
    const PRODUCTS = Object.freeze({
        hub: {
            id: 'hub',
            name: 'ConicTypst Hub',
            shortName: 'HUB',
            description: 'Cổng trung tâm kết nối tài liệu, công cụ và các dịch vụ ConicTypst.',
            url: 'https://typstconichub.pages.dev/',
            accent: '#0f6cbd',
            soft: '#e0f2fe',
            accessMode: 'public'
        },
        hdsd: {
            id: 'hdsd',
            name: 'Kho hướng dẫn',
            shortName: 'HD',
            description: 'Ví dụ, tài liệu và hướng dẫn sử dụng ConicTypst dành cho giáo viên.',
            url: 'https://hdsd-conictypst.pages.dev/',
            accent: '#6d28d9',
            soft: '#ede9fe',
            accessMode: 'authenticated'
        },
        omr: {
            id: 'omr',
            name: 'Sang Math OMR',
            shortName: 'OMR',
            description: 'Chấm ảnh, PDF cả lớp, đồng bộ kết quả và xem lại bài trên mọi thiết bị.',
            url: 'https://chamthi-conictypst.pages.dev/',
            accent: '#0f766e',
            soft: '#ccfbf1',
            accessMode: 'approval'
        }
    });

    const state = {
        bridge: null,
        auth: null,
        functions: null,
        user: null,
        account: null,
        products: { ...PRODUCTS },
        memberships: new Map(),
        loadedUid: null
    };
    const el = {};

    document.addEventListener('DOMContentLoaded', initialize);

    function initialize() {
        cacheElements();
        bindEvents();
        renderProducts();
        const config = readFirebaseConfig();
        if (!config) {
            el.accountSignInButton.disabled = true;
            el.accountConfigNotice.hidden = false;
            el.accountAuthMessage.textContent = 'Bản source đã sẵn sàng. Hãy thay __FIREBASE_CONFIG__ khi dựng bản triển khai.';
            return;
        }
        if (!window.firebase?.initializeApp || !window.ConicTypstAuthBridge?.create) {
            showAuthError('Không tải được Firebase. Vui lòng kiểm tra kết nối rồi tải lại trang.');
            return;
        }
        try {
            state.bridge = window.ConicTypstAuthBridge.create({
                firebase,
                config,
                region: FUNCTIONS_REGION,
                onUser: handleAuthState,
                onError: (error) => showAuthError(readableError(error, 'Không tạo được phiên ConicTypst ID.'))
            });
            state.auth = state.bridge.platformAuth;
            state.functions = state.bridge.functions;
            state.bridge.start().catch((error) => showAuthError(readableError(error, 'Không khởi động được đăng nhập chung.')));
        } catch (error) {
            showAuthError(readableError(error, 'Cấu hình Firebase chưa hợp lệ.'));
        }
    }

    function cacheElements() {
        [
            'accountAuthGate', 'accountAuthMessage', 'accountSignInButton', 'accountConfigNotice', 'accountApp',
            'accountSignOutButton', 'accountRefreshButton', 'accountTopAvatar', 'accountAvatar', 'accountName',
            'accountEmail', 'adminPortalLink', 'accountProductGrid', 'accountSummaryChip', 'requestDialog',
            'requestForm', 'requestDialogTitle', 'requestDialogSubtitle', 'requestProductId', 'requestReason',
            'requestCloseButton', 'requestCancelButton', 'requestSubmitButton', 'accountLoadingOverlay',
            'accountLoadingText', 'accountToastRegion'
        ].forEach((id) => { el[id] = document.getElementById(id); });
    }

    function bindEvents() {
        el.accountSignInButton.addEventListener('click', signIn);
        el.accountSignOutButton.addEventListener('click', () => state.bridge?.signOut());
        el.accountRefreshButton.addEventListener('click', () => loadAccount(true));
        el.requestCloseButton.addEventListener('click', () => el.requestDialog.close());
        el.requestCancelButton.addEventListener('click', () => el.requestDialog.close());
        el.requestForm.addEventListener('submit', submitRequest);
        el.requestDialog.addEventListener('click', (event) => {
            if (event.target === el.requestDialog) el.requestDialog.close();
        });
    }

    function readFirebaseConfig() {
        const raw = String(document.getElementById('firebaseConfig')?.textContent || '').trim();
        if (!raw || raw === '__FIREBASE_CONFIG__') return null;
        try {
            const config = JSON.parse(raw);
            if (!window.ConicTypstAuthBridge?.isConfigBundle(config)) return null;
            return config;
        } catch (_error) {
            return null;
        }
    }

    async function signIn() {
        if (!state.bridge) return;
        setButtonBusy(el.accountSignInButton, true, 'Đang mở Google…');
        try {
            await state.bridge.signIn();
        } catch (error) {
            showAuthError(readableError(error, 'Đăng nhập Google không thành công.'));
        } finally {
            setButtonBusy(el.accountSignInButton, false);
        }
    }

    async function handleAuthState(user) {
        if (!user) {
            state.user = null;
            state.loadedUid = null;
            el.accountApp.hidden = true;
            el.accountAuthGate.hidden = false;
            el.accountAuthMessage.textContent = 'Đăng nhập để xem quyền sử dụng, thời hạn và gửi yêu cầu cho sản phẩm anh/chị cần.';
            el.accountAuthMessage.classList.remove('is-error');
            return;
        }
        state.user = user;
        el.accountAuthGate.hidden = true;
        el.accountApp.hidden = false;
        el.accountName.textContent = user.displayName || 'Giáo viên';
        el.accountEmail.textContent = user.email || '—';
        setAvatar(el.accountAvatar, user.photoURL, user.displayName || user.email || 'GV');
        setAvatar(el.accountTopAvatar, user.photoURL, user.displayName || user.email || 'GV');
        el.adminPortalLink.hidden = !OWNER_EMAILS.has(normalizeEmail(user.email));
        if (state.loadedUid !== user.uid) {
            state.loadedUid = user.uid;
            await loadAccount();
        }
    }

    async function loadAccount(silent = false) {
        if (!state.functions || !state.user) return;
        if (!silent) showLoading('Đang tải quyền của tài khoản…');
        setButtonBusy(el.accountRefreshButton, true, '…');
        try {
            const data = await callFunction('ctGetAccount', {});
            state.account = data.profile || data.account || data.user || {};
            state.memberships = normalizeMemberships(data);
            mergeProducts(data.products);
            el.adminPortalLink.hidden = !Boolean(data.isAdmin || data.admin?.isOwner || OWNER_EMAILS.has(normalizeEmail(state.user.email)));
            if (state.account.displayName) el.accountName.textContent = state.account.displayName;
            if (state.account.email) el.accountEmail.textContent = state.account.email;
            renderProducts();
            if (silent) showToast('Đã cập nhật quyền mới nhất.', 'success');
        } catch (error) {
            showToast(readableError(error, 'Không tải được thông tin tài khoản.'), 'error');
        } finally {
            hideLoading();
            setButtonBusy(el.accountRefreshButton, false);
        }
    }

    function normalizeMemberships(data) {
        const list = Array.isArray(data?.memberships)
            ? data.memberships
            : Array.isArray(data?.products)
                ? data.products.filter((item) => item?.status || item?.membership)
                : Object.entries(data?.memberships || {}).map(([productId, value]) => ({ productId, ...(value || {}) }));
        const map = new Map();
        list.filter(Boolean).forEach((item) => {
            const membership = item.membership && typeof item.membership === 'object' ? { ...item, ...item.membership } : item;
            const id = String(membership.productId || membership.id || '').toLowerCase();
            if (PRODUCT_ORDER.includes(id)) map.set(id, { ...membership, productId: id });
        });
        return map;
    }

    function mergeProducts(serverProducts) {
        const merged = { ...PRODUCTS };
        if (Array.isArray(serverProducts)) {
            serverProducts.forEach((product) => {
                const id = String(product?.id || product?.productId || '').toLowerCase();
                if (!PRODUCT_ORDER.includes(id)) return;
                merged[id] = { ...PRODUCTS[id], ...product, id };
            });
        }
        state.products = merged;
    }

    function renderProducts() {
        el.accountProductGrid.replaceChildren();
        let activeCount = 0;
        let pendingCount = 0;
        PRODUCT_ORDER.forEach((id) => {
            const product = state.products[id] || PRODUCTS[id];
            const membership = state.memberships.get(id) || defaultMembership(product);
            const status = effectiveStatus(membership);
            if (status === 'active' || status === 'public') activeCount += 1;
            if (status === 'pending') pendingCount += 1;
            el.accountProductGrid.appendChild(createProductCard(product, membership, status));
        });
        el.accountSummaryChip.textContent = `${activeCount} đang dùng${pendingCount ? ` · ${pendingCount} chờ duyệt` : ''}`;
    }

    function createProductCard(product, membership, status) {
        const card = document.createElement('article');
        card.className = 'account-product-card';
        card.style.setProperty('--account-product-accent', safeColor(product.accent, '#0f6cbd'));
        card.style.setProperty('--account-product-soft', safeColor(product.soft, '#e0f2fe'));

        const head = node('div', 'account-product-head');
        const logo = node('span', 'account-product-logo', product.shortName || product.id.toUpperCase());
        const title = node('div', 'account-product-title');
        title.append(node('h3', '', product.name), node('span', `status-pill status-pill--${statusClass(status)}`, statusLabel(status)));
        head.append(logo, title);

        const description = node('p', 'account-product-description', product.description || PRODUCTS[product.id]?.description);
        const detail = node('div', 'account-membership-detail');
        detail.append(detailItem('Thời hạn', accessCopy(membership, status)));
        if (product.id === 'omr' && membership?.limits) detail.append(detailItem('Lưu trữ', storageCopy(membership.limits)));
        detail.append(detailItem(
            'Phạm vi',
            membership?.accessMode === 'authenticated' || product.accessMode === 'authenticated'
                ? 'Đăng nhập là sử dụng · không cần duyệt'
                : status === 'active'
                ? 'Quyền riêng đã được cấp'
                : status === 'public'
                    ? 'Nội dung công khai, không cần duyệt'
                    : 'Dữ liệu tách theo sản phẩm'
        ));

        const footer = node('div', 'account-product-actions');
        const productUrl = safeProductUrl(product.url);
        if (status === 'active' || status === 'public') {
            const open = node('a', 'button button--primary button--small', productUrl === '#' ? 'Sắp ra mắt' : 'Mở sản phẩm ↗');
            open.href = productUrl;
            if (productUrl !== '#') {
                open.target = '_blank';
                open.rel = 'noopener noreferrer';
            } else {
                open.setAttribute('aria-disabled', 'true');
            }
            footer.appendChild(open);
        } else if (status === 'pending') {
            const pending = makeButton('Đã gửi · đang chờ duyệt', 'button button--soft button--small');
            pending.disabled = true;
            footer.appendChild(pending);
        } else if (status === 'paused' || status === 'deletion_scheduled') {
            const paused = makeButton(status === 'deletion_scheduled' ? 'Quyền đang chờ xóa' : 'Quyền đang tạm dừng', 'button button--soft button--small');
            paused.disabled = true;
            footer.appendChild(paused);
        } else {
            const request = makeButton(status === 'expired' ? 'Yêu cầu gia hạn' : 'Gửi yêu cầu sử dụng', 'button button--primary button--small');
            request.addEventListener('click', () => openRequestDialog(product));
            footer.appendChild(request);
        }
        if (productUrl !== '#' && !['active', 'public'].includes(status)) {
            const publicLink = node('a', 'account-public-link', 'Xem website công khai ↗');
            publicLink.href = productUrl;
            publicLink.target = '_blank';
            publicLink.rel = 'noopener noreferrer';
            footer.appendChild(publicLink);
        }
        card.append(head, description, detail, footer);
        return card;
    }

    function defaultMembership(product) {
        if (product?.accessMode === 'authenticated') {
            return { productId: product.id, status: 'active', accessMode: 'authenticated', autoGranted: true };
        }
        if (product?.accessMode === 'public') {
            return { productId: product.id, status: 'public', accessMode: 'public', autoGranted: true };
        }
        return { productId: product?.id || '', status: 'none', accessMode: 'approval' };
    }

    function detailItem(label, value) {
        const item = node('div', 'account-detail-item');
        item.append(node('small', '', label), node('strong', '', value));
        return item;
    }

    function openRequestDialog(product) {
        el.requestForm.reset();
        el.requestProductId.value = product.id;
        el.requestDialogTitle.textContent = `Yêu cầu ${product.name}`;
        el.requestDialogSubtitle.textContent = 'Quản trị viên sẽ kiểm tra Gmail, nhu cầu và cấp thời hạn phù hợp.';
        showDialog(el.requestDialog);
        window.setTimeout(() => el.requestReason.focus(), 50);
    }

    async function submitRequest(event) {
        event.preventDefault();
        const productId = el.requestProductId.value;
        const reason = el.requestReason.value.trim();
        if (!PRODUCT_ORDER.includes(productId) || reason.length < 5) {
            showToast('Vui lòng mô tả ngắn nhu cầu sử dụng.', 'error');
            return;
        }
        setButtonBusy(el.requestSubmitButton, true, 'Đang gửi…');
        try {
            await callFunction('ctRequestProductAccess', { productId, note: reason });
            el.requestDialog.close();
            showToast('Đã gửi yêu cầu. Anh/chị có thể kiểm tra trạng thái ngay tại trang này.', 'success');
            await loadAccount(true);
        } catch (error) {
            showToast(readableError(error, 'Không gửi được yêu cầu sử dụng.'), 'error');
        } finally {
            setButtonBusy(el.requestSubmitButton, false);
        }
    }

    async function callFunction(name, payload) {
        const result = await state.functions.httpsCallable(name)(payload);
        return result?.data || {};
    }

    function effectiveStatus(membership) {
        const raw = String(membership?.status || 'none').toLowerCase();
        if (['approved', 'enabled'].includes(raw)) return 'active';
        if (['requested', 'awaiting_approval'].includes(raw)) return 'pending';
        if (['suspended', 'inactive'].includes(raw)) return 'paused';
        if (raw === 'active' && isPast(membership?.accessEndsAt)) return 'expired';
        if (['active', 'public', 'pending', 'paused', 'expired', 'rejected', 'none', 'deletion_scheduled'].includes(raw)) return raw;
        return 'none';
    }

    function statusClass(status) {
        if (status === 'public') return 'active';
        if (status === 'none' || status === 'rejected' || status === 'deletion_scheduled') return 'expired';
        return status;
    }

    function statusLabel(status) {
        return ({
            active: 'Đang sử dụng',
            public: 'Truy cập công khai',
            pending: 'Chờ quản trị duyệt',
            paused: 'Tạm dừng',
            expired: 'Đã hết hạn',
            deletion_scheduled: 'Đang chờ xóa',
            rejected: 'Chưa được cấp',
            none: 'Chưa yêu cầu'
        })[status] || 'Chưa yêu cầu';
    }

    function accessCopy(membership, status) {
        if (membership?.accessMode === 'authenticated') return 'Tự động trong phiên đăng nhập';
        if (status === 'public') return 'Không giới hạn phần công khai';
        if (status === 'pending') return `Gửi ${formatDate(membership.requestedAt || membership.createdAt)}`;
        if (status === 'deletion_scheduled') return `Xóa sau ${formatDate(membership.deleteAfter)}`;
        if (membership?.accessEndsAt) return `Đến ${formatDate(membership.accessEndsAt)}`;
        if (status === 'active') return 'Theo quyền quản trị đã cấp';
        return 'Chưa có thời hạn';
    }

    function storageCopy(limits) {
        const bytes = numberOr(limits.storageBytes, limits.storageQuotaBytes, limits.r2QuotaBytes, 0);
        return bytes ? formatBytes(bytes) : 'Theo gói được cấp';
    }

    function showAuthError(message) {
        el.accountAuthMessage.textContent = message;
        el.accountAuthMessage.classList.add('is-error');
    }

    function showLoading(message) {
        el.accountLoadingText.textContent = message || 'Đang xử lý…';
        el.accountLoadingOverlay.hidden = false;
    }

    function hideLoading() {
        el.accountLoadingOverlay.hidden = true;
    }

    function showToast(message, type = '') {
        const toast = node('div', `toast${type ? ` toast--${type}` : ''}`, message);
        el.accountToastRegion.appendChild(toast);
        window.setTimeout(() => toast.remove(), type === 'error' ? 6500 : 4000);
    }

    function showDialog(dialog) {
        if (typeof dialog.showModal === 'function') dialog.showModal();
        else dialog.setAttribute('open', '');
    }

    function setButtonBusy(button, busy, label) {
        if (!button) return;
        if (busy) {
            if (!button.dataset.originalLabel) button.dataset.originalLabel = button.textContent;
            button.disabled = true;
            if (label) button.textContent = label;
        } else {
            button.disabled = false;
            if (button.dataset.originalLabel) button.textContent = button.dataset.originalLabel;
            delete button.dataset.originalLabel;
        }
    }

    function setAvatar(image, photoURL, name) {
        const fallback = initialsDataUrl(initials(name));
        image.src = isSafeAvatarUrl(photoURL) ? photoURL : fallback;
        image.referrerPolicy = 'no-referrer';
        image.onerror = () => {
            image.onerror = null;
            image.src = fallback;
        };
    }

    function readableError(error, fallback = 'Có lỗi xảy ra. Vui lòng thử lại.') {
        const code = String(error?.code || '').replace(/^functions\//, '');
        const map = {
            unauthenticated: 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
            'permission-denied': 'Tài khoản chưa được phép thực hiện thao tác này.',
            'already-exists': 'Yêu cầu này đã được gửi và đang chờ duyệt.',
            'failed-precondition': 'Trạng thái vừa thay đổi. Hãy làm mới rồi thử lại.',
            'resource-exhausted': 'Hệ thống đang giới hạn yêu cầu. Vui lòng thử lại sau.',
            'invalid-argument': 'Thông tin gửi lên chưa hợp lệ.'
        };
        return map[code] || error?.message || fallback;
    }

    function safeProductUrl(value) {
        if (!value) return '#';
        try {
            const url = new URL(value);
            return url.protocol === 'https:' && url.hostname.endsWith('.pages.dev') ? url.href : '#';
        } catch (_error) {
            return '#';
        }
    }

    function isSafeAvatarUrl(value) {
        if (!value) return false;
        try {
            const url = new URL(value);
            return url.protocol === 'https:' && ['googleusercontent.com', 'ggpht.com'].some((host) => url.hostname === host || url.hostname.endsWith(`.${host}`));
        } catch (_error) {
            return false;
        }
    }

    function safeColor(value, fallback) {
        return /^#[0-9a-f]{6}$/i.test(String(value || '')) ? value : fallback;
    }

    function formatDate(value) {
        const date = toDate(value);
        return date ? new Intl.DateTimeFormat('vi-VN', { day: '2-digit', month: '2-digit', year: 'numeric', timeZone: 'Asia/Ho_Chi_Minh' }).format(date) : '—';
    }

    function toDate(value) {
        if (!value) return null;
        if (typeof value?.toDate === 'function') return value.toDate();
        if (typeof value === 'object' && Number.isFinite(value.seconds)) return new Date(value.seconds * 1000);
        const date = new Date(value);
        return Number.isNaN(date.getTime()) ? null : date;
    }

    function isPast(value) {
        const date = toDate(value);
        return date ? date.getTime() < Date.now() : false;
    }

    function formatBytes(value) {
        const bytes = Math.max(0, numberOr(value, 0));
        if (bytes < 1024) return `${Math.round(bytes)} B`;
        const units = ['KiB', 'MiB', 'GiB', 'TiB'];
        let amount = bytes;
        let unit = -1;
        do { amount /= 1024; unit += 1; } while (amount >= 1024 && unit < units.length - 1);
        return `${amount >= 10 ? amount.toFixed(1) : amount.toFixed(2)} ${units[unit]}`;
    }

    function numberOr(...values) {
        for (const value of values) {
            const number = Number(value);
            if (Number.isFinite(number)) return number;
        }
        return 0;
    }

    function normalizeEmail(value) {
        return String(value || '').trim().toLowerCase();
    }

    function initials(value) {
        const parts = String(value || 'GV').trim().split(/\s+/).filter(Boolean);
        return (parts.length > 1 ? `${parts[0][0]}${parts.at(-1)[0]}` : parts[0]?.slice(0, 2) || 'GV').toUpperCase();
    }

    function initialsDataUrl(value) {
        const text = String(value || 'GV').replace(/[^A-ZÀ-Ỹ0-9]/gi, '').slice(0, 2);
        const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="128" height="128"><rect width="128" height="128" rx="64" fill="#e0f2fe"/><text x="64" y="77" text-anchor="middle" font-family="Arial,sans-serif" font-size="40" font-weight="700" fill="#075985">${text}</text></svg>`;
        return `data:image/svg+xml;charset=utf-8,${encodeURIComponent(svg)}`;
    }

    function node(tag, className = '', text = '') {
        const element = document.createElement(tag);
        if (className) element.className = className;
        if (text !== undefined && text !== null && text !== '') element.textContent = String(text);
        return element;
    }

    function makeButton(label, className) {
        const button = node('button', className, label);
        button.type = 'button';
        return button;
    }
})();
