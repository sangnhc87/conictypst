(() => {
    'use strict';

    const OWNER_EMAIL = 'nguyensangnhc@gmail.com';
    const FUNCTIONS_REGION = 'asia-southeast1';
    const PAGE_SIZE = 100;
    const GIB = 1024 ** 3;
    const DEFAULT_OMR_STORAGE_BYTES = 0;
    const ADMIN_PRODUCT_ORDER = ['hub', 'hdsd', 'omr'];
    const DEFAULT_PRODUCTS = Object.freeze({
        hub: {
            id: 'hub',
            name: 'ConicTypst Hub',
            shortName: 'HUB',
            description: 'Cổng trung tâm cho tài liệu, công cụ và hành trình sử dụng ConicTypst.',
            url: 'https://typstconichub.pages.dev/',
            accent: '#0f6cbd',
            soft: '#e0f2fe',
            defaultMonths: 12,
            defaultLimits: {}
        },
        hdsd: {
            id: 'hdsd',
            name: 'Kho hướng dẫn',
            shortName: 'HD',
            description: 'Hướng dẫn, ví dụ và học liệu giúp giáo viên làm chủ ConicTypst.',
            url: 'https://hdsd-conictypst.pages.dev/',
            accent: '#6d28d9',
            soft: '#ede9fe',
            defaultMonths: 12,
            defaultLimits: {}
        },
        omr: {
            id: 'omr',
            name: 'Sang Math OMR',
            shortName: 'OMR',
            description: 'Chấm phiếu bằng ảnh, PDF cả lớp và camera điện thoại với lưu trữ riêng tư.',
            url: 'https://chamthi-conictypst.pages.dev/',
            accent: '#0f766e',
            soft: '#ccfbf1',
            defaultMonths: 12,
            defaultLimits: { maxClasses: 10, maxStudents: 500, maxResults: 12000, storageBytes: 0, cloudImageEnabled: false, retentionDays: 365 }
        }
    });

    const state = {
        bridge: null,
        auth: null,
        functions: null,
        user: null,
        bootstrap: null,
        products: { ...DEFAULT_PRODUCTS },
        members: [],
        allSnapshot: [],
        pending: [],
        nextPageTokens: {},
        loadingMembers: false,
        initializedUid: null,
        searchTimer: null
    };
    const el = {};

    document.addEventListener('DOMContentLoaded', initialize);

    function initialize() {
        cacheElements();
        bindStaticEvents();
        renderProductCards();
        renderPending();
        renderMembers();
        renderSharedAccounts();
        renderAudit();

        const config = readFirebaseConfig();
        if (!config) {
            el.signInButton.disabled = true;
            el.configNotice.hidden = false;
            el.authMessage.textContent = 'Bản source đã sẵn sàng. Hãy thay __FIREBASE_CONFIG__ khi dựng bản triển khai.';
            return;
        }
        if (!window.firebase?.initializeApp || !window.ConicTypstAuthBridge?.create) {
            showAuthError('Không tải được thư viện Firebase. Vui lòng kiểm tra kết nối rồi tải lại trang.');
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
            'authGate', 'authMessage', 'signInButton', 'configNotice', 'adminApp', 'sidebar', 'menuButton',
            'sidebarBackdrop', 'adminAvatar', 'adminName', 'adminEmail', 'signOutButton', 'refreshButton',
            'platformHealth', 'statMembers', 'statMembersHint', 'statActive', 'statPending', 'statStorage',
            'statStorageHint', 'productGrid', 'pendingList', 'pendingBadge', 'navPendingBadge', 'memberBadge',
            'memberSearch', 'productFilter', 'statusFilter', 'memberTableBody', 'memberEmpty', 'memberCountText',
            'loadMoreButton', 'sharedAccountList', 'auditList', 'membershipDialog', 'membershipForm',
            'membershipEyebrow', 'membershipDialogTitle', 'membershipDialogSubtitle', 'membershipUid',
            'membershipProductId', 'membershipRevision', 'membershipAction', 'monthsField', 'membershipMonths',
            'accessEndsField', 'membershipAccessEndsAt', 'classesField', 'membershipMaxClasses', 'studentsField',
            'membershipMaxStudents', 'resultsField', 'membershipMaxResults', 'storageField', 'membershipStorageGiB',
            'membershipNote', 'membershipSubmit', 'deleteDialog', 'deleteForm', 'deleteDialogSubtitle', 'deleteUid',
            'deleteProductId', 'deleteRevision', 'deleteConfirmation', 'deleteNote', 'deleteSubmit', 'loadingOverlay',
            'loadingText', 'toastRegion'
        ].forEach((id) => { el[id] = document.getElementById(id); });
    }

    function bindStaticEvents() {
        el.signInButton.addEventListener('click', signIn);
        el.signOutButton.addEventListener('click', () => state.bridge?.signOut());
        el.refreshButton.addEventListener('click', () => loadDashboard(true));
        el.menuButton.addEventListener('click', toggleSidebar);
        el.sidebarBackdrop.addEventListener('click', closeSidebar);
        document.querySelectorAll('.nav-link').forEach((link) => link.addEventListener('click', () => {
            document.querySelectorAll('.nav-link').forEach((item) => item.classList.toggle('is-active', item === link));
            closeSidebar();
        }));
        document.querySelectorAll('[data-close-dialog]').forEach((button) => button.addEventListener('click', () => {
            document.getElementById(button.dataset.closeDialog)?.close();
        }));
        el.memberSearch.addEventListener('input', scheduleMemberReload);
        el.productFilter.addEventListener('change', () => loadMembers({ silent: true }));
        el.statusFilter.addEventListener('change', () => loadMembers({ silent: true }));
        el.loadMoreButton.addEventListener('click', () => loadMembers({ append: true, silent: true }));
        el.membershipForm.addEventListener('submit', submitMembershipDialog);
        el.deleteConfirmation.addEventListener('input', () => {
            el.deleteSubmit.disabled = el.deleteConfirmation.value.trim() !== 'XOA';
        });
        el.deleteForm.addEventListener('submit', submitDeleteDialog);
        [el.membershipDialog, el.deleteDialog].forEach((dialog) => dialog.addEventListener('click', (event) => {
            if (event.target === dialog) dialog.close();
        }));
        window.addEventListener('keydown', (event) => {
            if (event.key === 'Escape') closeSidebar();
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
        setButtonBusy(el.signInButton, true, 'Đang mở Google…');
        try {
            await state.bridge.signIn({ loginHint: OWNER_EMAIL });
        } catch (error) {
            showAuthError(readableError(error, 'Đăng nhập Google không thành công.'));
        } finally {
            setButtonBusy(el.signInButton, false);
        }
    }

    async function handleAuthState(user) {
        const email = normalizeEmail(user?.email);
        if (!user) {
            state.user = null;
            state.initializedUid = null;
            showAuthGate('Chỉ tài khoản chủ sở hữu nguyensangnhc@gmail.com được phép đăng nhập.');
            return;
        }
        if (email !== OWNER_EMAIL) {
            await state.bridge?.signOut().catch(() => undefined);
            showAuthError(`Tài khoản ${email || 'này'} không có quyền quản trị nền tảng.`);
            return;
        }

        state.user = user;
        el.authGate.hidden = true;
        el.adminApp.hidden = false;
        el.adminName.textContent = user.displayName || 'Nguyễn Sang';
        el.adminEmail.textContent = user.email || OWNER_EMAIL;
        setAvatar(el.adminAvatar, user.photoURL, user.displayName || user.email || 'NS');
        if (state.initializedUid !== user.uid) {
            state.initializedUid = user.uid;
            await loadDashboard();
        }
    }

    function showAuthGate(message) {
        el.adminApp.hidden = true;
        el.authGate.hidden = false;
        el.authMessage.classList.remove('is-error');
        el.authMessage.textContent = message;
        el.signInButton.hidden = false;
    }

    function showAuthError(message) {
        el.authMessage.textContent = message;
        el.authMessage.classList.add('is-error');
        el.signInButton.hidden = false;
    }

    async function loadDashboard(silent = false) {
        if (!state.functions || !state.user) return;
        if (!silent) showLoading('Đang tải toàn bộ hệ sinh thái…');
        setButtonBusy(el.refreshButton, true, 'Đang tải…');
        el.platformHealth.textContent = 'Đang đồng bộ';
        try {
            const [bootstrapResult, memberResult, pendingResult, auditResult] = await Promise.all([
                callFunction('ctAdminBootstrap', {}),
                fetchMemberPages(ADMIN_PRODUCT_ORDER, { status: 'all', search: '' }),
                callFunction('ctAdminListMembers', { productId: 'omr', status: 'pending', pageSize: PAGE_SIZE }),
                callFunction('ctAdminListAudit', {})
            ]);
            state.bootstrap = { ...(bootstrapResult || {}), audit: normalizeArray(auditResult?.items) };
            mergeProducts(state.bootstrap.products);
            state.members = memberResult.items;
            state.allSnapshot = [...state.members];
            state.nextPageTokens = memberResult.nextPageTokens;
            state.pending = normalizeItems(pendingResult).filter((member) => productIdOf(member) === 'omr');
            renderAll();
            el.platformHealth.textContent = state.bootstrap?.statuses?.platform || 'Hoạt động tốt';
            if (silent) showToast('Đã cập nhật dữ liệu mới nhất.', 'success');
        } catch (error) {
            el.platformHealth.textContent = 'Cần kiểm tra';
            showToast(readableError(error, 'Không tải được bảng điều khiển.'), 'error');
        } finally {
            hideLoading();
            setButtonBusy(el.refreshButton, false);
        }
    }

    async function loadMembers({ append = false, silent = false } = {}) {
        if (!state.functions || state.loadingMembers) return;
        state.loadingMembers = true;
        if (!silent) showLoading('Đang tải danh sách giáo viên…');
        setButtonBusy(el.loadMoreButton, true, 'Đang tải…');
        try {
            const productIds = el.productFilter.value === 'all' ? ADMIN_PRODUCT_ORDER : [el.productFilter.value];
            const requestedStatus = el.statusFilter.value || 'all';
            const status = requestedStatus === 'expired' ? 'all' : requestedStatus;
            const search = el.memberSearch.value.trim();
            const result = await fetchMemberPages(productIds, {
                status,
                search,
                pageTokens: append ? state.nextPageTokens : {}
            }, append);
            const incoming = requestedStatus === 'expired'
                ? result.items.filter((membership) => effectiveStatus(membership) === 'expired')
                : result.items;
            state.members = append ? mergeMemberships(state.members, incoming) : incoming;
            state.nextPageTokens = append ? { ...state.nextPageTokens, ...result.nextPageTokens } : result.nextPageTokens;
            if (requestedStatus === 'all' && !search && productIds.length === ADMIN_PRODUCT_ORDER.length) state.allSnapshot = [...state.members];
            renderMembers();
            renderSharedAccounts();
        } catch (error) {
            showToast(readableError(error, 'Không tải được danh sách giáo viên.'), 'error');
        } finally {
            state.loadingMembers = false;
            hideLoading();
            setButtonBusy(el.loadMoreButton, false);
        }
    }

    function scheduleMemberReload() {
        window.clearTimeout(state.searchTimer);
        state.searchTimer = window.setTimeout(() => loadMembers({ silent: true }), 320);
    }

    function mergeProducts(serverProducts) {
        const merged = { ...DEFAULT_PRODUCTS };
        normalizeArray(serverProducts).forEach((product) => {
            const id = String(product?.id || '').toLowerCase();
            if (!id) return;
            const fallback = DEFAULT_PRODUCTS[id] || {};
            merged[id] = {
                ...fallback,
                ...product,
                id,
                name: product.name || fallback.name || id,
                defaultLimits: { ...(fallback.defaultLimits || {}), ...(product.defaultLimits || {}) }
            };
        });
        state.products = merged;
    }

    function renderAll() {
        renderStats();
        renderProductCards();
        renderPending();
        renderMembers();
        renderSharedAccounts();
        renderAudit();
    }

    function renderStats() {
        const uniqueMembers = new Set(state.allSnapshot.map(uidOf).filter(Boolean));
        const activeMembers = new Set(state.allSnapshot.filter((item) => effectiveStatus(item) === 'active').map(uidOf).filter(Boolean));
        const omrRows = state.allSnapshot.filter((item) => productIdOf(item) === 'omr');
        const storageUsed = omrRows.reduce((sum, item) => sum + usageOf(item).storageBytes, 0);
        const storageLimit = omrRows.reduce((sum, item) => sum + limitsOf(item).storageBytes, 0);
        el.statMembers.textContent = formatNumber(uniqueMembers.size);
        el.statActive.textContent = formatNumber(activeMembers.size);
        el.statPending.textContent = formatNumber(state.pending.length);
        el.statStorage.textContent = formatBytes(storageUsed);
        el.statStorageHint.textContent = storageLimit ? `${formatBytes(storageLimit)} đã cấp` : 'giới hạn an toàn 5 GiB';
        el.pendingBadge.textContent = String(state.pending.length);
        el.navPendingBadge.textContent = String(state.pending.length);
        el.navPendingBadge.hidden = state.pending.length === 0;
    }

    function renderProductCards() {
        el.productGrid.replaceChildren();
        ADMIN_PRODUCT_ORDER.forEach((id) => {
            const product = state.products[id] || DEFAULT_PRODUCTS[id];
            const rows = state.allSnapshot.filter((item) => productIdOf(item) === id);
            const active = rows.filter((item) => effectiveStatus(item) === 'active').length;
            const pending = id === 'omr' ? state.pending.length : rows.filter((item) => effectiveStatus(item) === 'pending').length;
            el.productGrid.appendChild(createProductCard(product, active, pending));
        });
    }

    function createProductCard(product, active, pending) {
        const card = node('article', 'product-card');
        card.style.setProperty('--product-accent', safeColor(product.accent, DEFAULT_PRODUCTS[product.id]?.accent));
        card.style.setProperty('--product-soft', safeColor(product.soft, DEFAULT_PRODUCTS[product.id]?.soft));
        card.appendChild(node('div', 'product-accent'));
        const content = node('div', 'product-content');
        const head = node('div', 'product-head');
        const identity = node('div', 'product-identity');
        const logo = node('span', 'product-logo', product.shortName || String(product.name || product.id).slice(0, 3).toUpperCase());
        const copy = document.createElement('span');
        copy.append(node('strong', '', product.name || product.id), node('small', '', product.id === 'omr' ? 'Chấm thi & lưu trữ R2' : 'Nền tảng nội dung'));
        identity.append(logo, copy);
        const health = node('span', `health-pill${product.active === false ? ' health-pill--warning' : ''}`, product.active === false ? 'Tạm dừng' : 'Online');
        head.append(identity, health);
        const description = node('p', 'product-description', product.description || DEFAULT_PRODUCTS[product.id]?.description || 'Sản phẩm thuộc hệ sinh thái ConicTypst.');
        const stats = node('div', 'product-stats');
        stats.append(productStat('Đang dùng', formatNumber(active)), productStat('Chờ duyệt', formatNumber(pending)));
        const footer = node('div', 'product-footer');
        footer.append(node('span', '', 'Quyền và dữ liệu tách riêng'));
        const link = node('a', 'product-link', 'Mở website ↗');
        link.href = safeProductUrl(product.url || DEFAULT_PRODUCTS[product.id]?.url);
        link.target = '_blank';
        link.rel = 'noopener noreferrer';
        footer.appendChild(link);
        content.append(head, description, stats, footer);
        card.appendChild(content);
        return card;
    }

    function productStat(label, value) {
        const item = node('div', 'product-stat');
        item.append(node('small', '', label), node('strong', '', value));
        return item;
    }

    function renderPending() {
        el.pendingList.replaceChildren();
        if (!state.pending.length) {
            el.pendingList.appendChild(node('div', 'empty-inline', 'Không có yêu cầu OMR nào đang chờ. Hệ thống đã gọn gàng.'));
            return;
        }
        state.pending.forEach((membership) => {
            const card = node('article', 'pending-card');
            const head = node('div', 'pending-card-head');
            head.append(createPerson(membership), node('span', 'status-pill status-pill--pending', 'Chờ duyệt'));
            const meta = node('div', 'pending-meta');
            meta.append(
                node('span', 'meta-chip', `Yêu cầu ${formatDateTime(membership.requestedAt || membership.createdAt)}`),
                node('span', 'meta-chip', `UID: ${shortId(uidOf(membership))}`),
                node('span', 'meta-chip', `Thời hạn đề nghị: ${numberOr(membership.requestedMonths, membership.months, 12)} tháng`)
            );
            const actions = node('div', 'pending-actions');
            const approve = makeButton('Duyệt & cấp quyền', 'button button--primary button--small');
            approve.addEventListener('click', () => openMembershipDialog('approve', membership));
            actions.appendChild(approve);
            card.append(head, meta, actions);
            el.pendingList.appendChild(card);
        });
    }

    function renderMembers() {
        el.memberTableBody.replaceChildren();
        el.memberEmpty.hidden = state.members.length > 0;
        state.members.forEach((membership) => el.memberTableBody.appendChild(createMemberRow(membership)));
        el.memberBadge.textContent = formatNumber(state.members.length);
        el.memberCountText.textContent = `${formatNumber(state.members.length)} quyền thành viên đang hiển thị`;
        el.loadMoreButton.hidden = !Object.values(state.nextPageTokens).some(Boolean);
    }

    function createMemberRow(membership) {
        const productId = productIdOf(membership);
        const product = state.products[productId] || DEFAULT_PRODUCTS[productId] || { id: productId, name: productId };
        const status = effectiveStatus(membership);
        const row = document.createElement('tr');

        const personCell = document.createElement('td');
        personCell.dataset.label = 'Giáo viên';
        personCell.appendChild(createPerson(membership));

        const productCell = document.createElement('td');
        productCell.dataset.label = 'Sản phẩm';
        const tag = node('span', 'product-tag', product.name || productId);
        tag.style.setProperty('--tag-color', safeColor(product.accent, '#0f6cbd'));
        tag.style.setProperty('--tag-soft', safeColor(product.soft, '#e0f2fe'));
        productCell.appendChild(tag);

        const statusCell = document.createElement('td');
        statusCell.dataset.label = 'Trạng thái';
        const stack = node('div', 'status-stack');
        stack.append(node('span', `status-pill status-pill--${status}`, statusLabel(status)));
        stack.append(node('span', 'expiry-copy', expiryCopy(membership)));
        statusCell.appendChild(stack);

        const usageCell = document.createElement('td');
        usageCell.dataset.label = 'Hạn mức';
        usageCell.appendChild(createUsageCompact(membership));

        const actionCell = document.createElement('td');
        actionCell.dataset.label = 'Quản lý';
        actionCell.appendChild(createRowActions(membership));

        row.append(personCell, productCell, statusCell, usageCell, actionCell);
        return row;
    }

    function createRowActions(membership) {
        const status = effectiveStatus(membership);
        const actions = node('div', 'row-actions');
        if (status === 'pending') {
            const approve = makeButton('Duyệt', 'button button--primary button--small');
            approve.addEventListener('click', () => openMembershipDialog('approve', membership));
            actions.appendChild(approve);
        } else if (status === 'paused') {
            const resume = makeButton('Tiếp tục', 'button button--success button--small');
            resume.addEventListener('click', () => confirmDirectAction('resume', membership));
            actions.appendChild(resume);
        } else if (status === 'deletion_scheduled') {
            const cancel = makeButton('Hủy xóa', 'button button--success button--small');
            cancel.addEventListener('click', () => confirmDirectAction('cancel_delete', membership));
            actions.appendChild(cancel);
        } else {
            const extend = makeButton(status === 'expired' ? 'Gia hạn' : '+ Thời gian', 'button button--soft button--small');
            extend.addEventListener('click', () => openMembershipDialog('extend', membership));
            actions.appendChild(extend);
        }

        const menu = document.createElement('details');
        menu.className = 'action-menu';
        const summary = document.createElement('summary');
        summary.setAttribute('aria-label', 'Mở thêm thao tác');
        summary.textContent = '•••';
        const popover = node('div', 'action-popover');
        if (status !== 'pending') {
            if (productIdOf(membership) === 'omr') {
                popover.appendChild(menuAction('Điều chỉnh hạn mức', () => openMembershipDialog('update_limits', membership, menu)));
            }
            popover.append(
                menuAction('Đặt ngày hết hạn', () => openMembershipDialog('set_expiry', membership, menu)),
                menuAction(status === 'paused' ? 'Tiếp tục tài khoản' : 'Tạm dừng tài khoản', () => confirmDirectAction(status === 'paused' ? 'resume' : 'suspend', membership, menu))
            );
        }
        popover.appendChild(menuAction('Xóa quyền sản phẩm', () => openDeleteDialog(membership, menu), true));
        menu.append(summary, popover);
        actions.appendChild(menu);
        return actions;
    }

    function menuAction(label, handler, danger = false) {
        const button = document.createElement('button');
        button.type = 'button';
        button.textContent = label;
        if (danger) button.className = 'is-danger';
        button.addEventListener('click', handler);
        return button;
    }

    function createUsageCompact(membership) {
        const wrap = node('div', 'usage-compact');
        const productId = productIdOf(membership);
        if (productId !== 'omr') {
            const limits = limitsOf(membership);
            const label = Object.keys(limits.raw).length ? 'Có cấu hình riêng' : 'Theo mặc định sản phẩm';
            wrap.appendChild(node('span', 'expiry-copy', label));
            return wrap;
        }
        const limits = limitsOf(membership);
        const usage = usageOf(membership);
        wrap.append(
            usageLine('Lớp', usage.classes, limits.maxClasses, `${formatNumber(usage.classes)}/${formatNumber(limits.maxClasses)}`),
            usageLine('Kết quả', usage.results, limits.maxResults, `${formatNumber(usage.results)}/${formatNumber(limits.maxResults)}`),
            usageLine('R2', usage.storageBytes, limits.storageBytes, `${formatBytes(usage.storageBytes)}/${formatBytes(limits.storageBytes)}`)
        );
        return wrap;
    }

    function usageLine(label, used, limit, copy) {
        const item = node('div', 'usage-line');
        const line = node('div', 'usage-copy');
        line.append(node('span', '', label), node('strong', '', copy));
        const progress = node('div', 'progress');
        const bar = document.createElement('span');
        const percent = limit > 0 ? Math.min(100, Math.max(0, used / limit * 100)) : 0;
        bar.style.width = `${percent.toFixed(1)}%`;
        if (percent >= 95) bar.className = 'is-danger';
        else if (percent >= 80) bar.className = 'is-warning';
        progress.appendChild(bar);
        item.append(line, progress);
        return item;
    }

    function renderSharedAccounts() {
        el.sharedAccountList.replaceChildren();
        const grouped = new Map();
        state.allSnapshot.forEach((membership) => {
            const uid = uidOf(membership);
            if (!uid) return;
            const current = grouped.get(uid) || { profile: membership, memberships: [] };
            current.memberships.push(membership);
            grouped.set(uid, current);
        });
        const accounts = [...grouped.values()].sort((a, b) => displayName(a.profile).localeCompare(displayName(b.profile), 'vi'));
        if (!accounts.length) {
            el.sharedAccountList.appendChild(node('div', 'empty-inline', 'Tài khoản dùng chung sẽ xuất hiện sau khi backend trả danh sách giáo viên.'));
            return;
        }
        accounts.slice(0, 12).forEach((account) => {
            const card = node('article', 'shared-account-card');
            card.appendChild(createPerson(account.profile));
            const dots = node('div', 'membership-dots');
            account.memberships.forEach((membership) => {
                const id = productIdOf(membership);
                const product = state.products[id] || DEFAULT_PRODUCTS[id] || { name: id };
                const tag = node('span', `status-pill status-pill--${effectiveStatus(membership)}`, product.name);
                dots.appendChild(tag);
            });
            card.appendChild(dots);
            el.sharedAccountList.appendChild(card);
        });
    }

    function renderAudit() {
        el.auditList.replaceChildren();
        const events = normalizeArray(state.bootstrap?.audit || state.bootstrap?.recentAudit);
        if (!events.length) {
            const placeholder = node('div', 'audit-placeholder');
            placeholder.append(
                node('span', '', '≡'),
                node('strong', '', 'Chưa có thao tác quản trị'),
                node('p', '', 'Lịch sử duyệt, tạm dừng, gia hạn và xóa sẽ tự động xuất hiện tại đây.')
            );
            el.auditList.appendChild(placeholder);
            return;
        }
        events.slice(0, 20).forEach((event) => {
            const item = node('article', 'audit-item');
            item.append(node('span', 'audit-dot', actionGlyph(event.action)));
            const copy = node('div', 'audit-copy');
            copy.append(node('strong', '', auditTitle(event)), node('span', '', event.reason || event.note || `Mutation ${shortId(event.mutationId)}`));
            item.append(copy, node('time', 'audit-time', formatDateTime(event.createdAt || event.at)));
            el.auditList.appendChild(item);
        });
    }

    function openMembershipDialog(action, membership, menu) {
        if (menu) menu.open = false;
        const productId = productIdOf(membership) || 'omr';
        const product = state.products[productId] || DEFAULT_PRODUCTS[productId] || { name: productId, defaultLimits: {} };
        const limits = limitsOf(membership);
        const defaults = product.defaultLimits || {};
        const titles = {
            approve: 'Duyệt và cấp quyền',
            extend: 'Gia hạn thời gian sử dụng',
            update_limits: 'Điều chỉnh hạn mức',
            set_expiry: 'Đặt ngày hết hạn'
        };
        el.membershipForm.reset();
        el.membershipUid.value = uidOf(membership);
        el.membershipProductId.value = productId;
        el.membershipRevision.value = String(revisionOf(membership));
        el.membershipAction.value = action;
        el.membershipDialogTitle.textContent = titles[action] || 'Cập nhật quyền';
        el.membershipDialogSubtitle.textContent = `${displayName(membership)} · ${product.name}`;
        el.membershipEyebrow.textContent = String(product.name || productId).toUpperCase();
        el.membershipMonths.value = String(numberOr(membership.requestedMonths, membership.months, product.defaultMonths, 12));
        el.membershipAccessEndsAt.value = dateInputValue(membership.accessEndsAt);
        el.membershipMaxClasses.value = String(numberOr(limits.maxClasses, defaults.maxClasses, 10));
        el.membershipMaxStudents.value = String(numberOr(limits.maxStudents, defaults.maxStudents, 500));
        el.membershipMaxResults.value = String(Math.max(12000, numberOr(limits.maxResults, defaults.maxResults, 12000)));
        el.membershipStorageGiB.value = String(roundTo(numberOr(limits.storageBytes, defaults.storageBytes, productId === 'omr' ? DEFAULT_OMR_STORAGE_BYTES : 0) / GIB, 2));
        el.membershipNote.value = '';

        const isOmr = productId === 'omr';
        const showMonths = ['approve', 'extend'].includes(action);
        const showLimits = ['approve', 'update_limits'].includes(action) && isOmr;
        el.monthsField.hidden = !showMonths;
        el.membershipMonths.required = showMonths;
        el.accessEndsField.hidden = action !== 'set_expiry';
        el.membershipAccessEndsAt.required = action === 'set_expiry';
        [el.classesField, el.studentsField, el.resultsField, el.storageField].forEach((field) => { field.hidden = !showLimits; });
        el.membershipSubmit.textContent = action === 'approve' ? 'Duyệt quyền' : action === 'extend' ? 'Gia hạn' : 'Lưu thay đổi';
        showDialog(el.membershipDialog);
    }

    async function submitMembershipDialog(event) {
        event.preventDefault();
        const action = el.membershipAction.value;
        const productId = el.membershipProductId.value;
        const payload = {};
        try {
            if (['approve', 'extend'].includes(action)) payload.months = validInteger(el.membershipMonths.value, 1, 120);
            if (action === 'set_expiry') payload.accessEndsAt = endOfVietnamDayIso(el.membershipAccessEndsAt.value);
            if (['approve', 'update_limits'].includes(action) && productId === 'omr') {
                const storageBytes = Math.round(validNumber(el.membershipStorageGiB.value, 0, 10) * GIB);
                payload.limits = {
                    maxClasses: validInteger(el.membershipMaxClasses.value, 1, 100),
                    maxStudents: validInteger(el.membershipMaxStudents.value, 1, 10000),
                    maxResults: validInteger(el.membershipMaxResults.value, 1, 100000),
                    storageBytes,
                    cloudImageEnabled: storageBytes > 0,
                    retentionDays: Math.trunc(numberOr(limitsForDialog(productId).retentionDays, 365))
                };
            }
        } catch (error) {
            showToast(error.message || 'Thông tin chưa hợp lệ.', 'error');
            return;
        }
        await applyMembershipAction({
            action,
            uid: el.membershipUid.value,
            productId,
            expectedRevision: numberOr(el.membershipRevision.value, 0),
            payload,
            reason: el.membershipNote.value.trim(),
            button: el.membershipSubmit,
            successMessage: actionSuccessMessage(action)
        });
    }

    async function confirmDirectAction(action, membership, menu) {
        if (menu) menu.open = false;
        const descriptions = {
            suspend: 'tạm dừng',
            resume: 'tiếp tục',
            cancel_delete: 'hủy lịch xóa của'
        };
        if (!window.confirm(`Xác nhận ${descriptions[action] || action} quyền ${productName(productIdOf(membership))} của ${displayName(membership)}?`)) return;
        await applyMembershipAction({
            action,
            uid: uidOf(membership),
            productId: productIdOf(membership),
            expectedRevision: revisionOf(membership),
            payload: {},
            reason: '',
            successMessage: actionSuccessMessage(action)
        });
    }

    function openDeleteDialog(membership, menu) {
        if (menu) menu.open = false;
        el.deleteForm.reset();
        el.deleteUid.value = uidOf(membership);
        el.deleteProductId.value = productIdOf(membership);
        el.deleteRevision.value = String(revisionOf(membership));
        el.deleteDialogSubtitle.textContent = `${displayName(membership)} · ${productName(productIdOf(membership))}`;
        el.deleteSubmit.disabled = true;
        showDialog(el.deleteDialog);
    }

    async function submitDeleteDialog(event) {
        event.preventDefault();
        if (el.deleteConfirmation.value.trim() !== 'XOA') {
            showToast('Hãy gõ chính xác XOA để xác nhận.', 'error');
            return;
        }
        await applyMembershipAction({
            action: 'schedule_delete',
            uid: el.deleteUid.value,
            productId: el.deleteProductId.value,
            expectedRevision: numberOr(el.deleteRevision.value, 0),
            payload: {},
            reason: el.deleteNote.value.trim(),
            button: el.deleteSubmit,
            successMessage: 'Đã lên lịch xóa quyền sản phẩm.'
        });
    }

    async function applyMembershipAction({ action, uid, productId, expectedRevision, payload, reason, button, successMessage }) {
        if (!uid || !productId) {
            showToast('Thiếu UID hoặc mã sản phẩm.', 'error');
            return;
        }
        const mutationId = createMutationId();
        if (button) setButtonBusy(button, true, 'Đang xử lý…');
        else showLoading('Đang áp dụng thay đổi…');
        try {
            await callFunction('ctAdminApplyMembershipAction', {
                mutationId,
                productId,
                uid,
                action,
                expectedRevision,
                payload: payload || {},
                reason: reason || ''
            });
            el.membershipDialog.close();
            el.deleteDialog.close();
            showToast(successMessage || 'Đã cập nhật quyền thành viên.', 'success');
            await loadDashboard(true);
        } catch (error) {
            showToast(readableError(error, `Không thể thực hiện thao tác ${action}.`), 'error');
        } finally {
            if (button) setButtonBusy(button, false);
            else hideLoading();
        }
    }

    async function callFunction(name, payload) {
        const result = await state.functions.httpsCallable(name)(payload);
        return result?.data || {};
    }

    function normalizeItems(result) {
        if (Array.isArray(result)) return result.filter(Boolean);
        return normalizeArray(result?.items || result?.members || result?.memberships);
    }

    async function fetchMemberPages(productIds, filters, appendOnlyWithToken = false) {
        const requests = productIds
            .filter((productId) => !appendOnlyWithToken || filters.pageTokens?.[productId])
            .map(async (productId) => {
                const payload = {
                    productId,
                    status: filters.status || 'all',
                    search: filters.search || '',
                    pageSize: PAGE_SIZE
                };
                if (filters.pageTokens?.[productId]) payload.pageToken = filters.pageTokens[productId];
                const result = await callFunction('ctAdminListMembers', payload);
                return { productId, items: normalizeItems(result), nextPageToken: result?.nextPageToken || null };
            });
        const pages = await Promise.all(requests);
        const nextPageTokens = Object.fromEntries(productIds.map((productId) => [productId, null]));
        pages.forEach((page) => { nextPageTokens[page.productId] = page.nextPageToken; });
        return { items: pages.flatMap((page) => page.items), nextPageTokens };
    }

    function mergeMemberships(current, incoming) {
        const map = new Map(current.map((item) => [`${uidOf(item)}:${productIdOf(item)}`, item]));
        incoming.forEach((item) => map.set(`${uidOf(item)}:${productIdOf(item)}`, item));
        return [...map.values()];
    }

    function productIdOf(value) {
        return String(value?.productId || value?.product?.id || value?.applicationId || '').trim().toLowerCase();
    }

    function uidOf(value) {
        return String(value?.uid || value?.userId || value?.memberUid || '').trim();
    }

    function revisionOf(value) {
        return Math.max(0, Math.trunc(numberOr(value?.revision, value?.version, 0)));
    }

    function displayName(value) {
        return String(value?.displayName || value?.name || value?.teacherName || value?.email || 'Giáo viên').trim();
    }

    function limitsOf(membership) {
        const raw = membership?.limits && typeof membership.limits === 'object' ? membership.limits : {};
        return {
            raw,
            maxClasses: numberOr(raw.maxClasses, membership?.maxClasses, 10),
            maxStudents: numberOr(raw.maxStudents, membership?.maxStudents, 500),
            maxResults: Math.max(12000, numberOr(raw.maxResults, membership?.maxResults, 12000)),
            storageBytes: raw.cloudImageEnabled === true
                ? numberOr(raw.storageBytes, raw.storageQuotaBytes, raw.r2QuotaBytes, membership?.storageBytes, membership?.storageQuotaBytes, DEFAULT_OMR_STORAGE_BYTES)
                : 0,
            cloudImageEnabled: raw.cloudImageEnabled === true,
            retentionDays: numberOr(raw.retentionDays, 365)
        };
    }

    function limitsForDialog(productId) {
        const uid = el.membershipUid.value;
        const membership = state.members.find((item) => uidOf(item) === uid && productIdOf(item) === productId)
            || state.pending.find((item) => uidOf(item) === uid && productIdOf(item) === productId);
        return limitsOf(membership || {});
    }

    function usageOf(membership) {
        const raw = membership?.usage && typeof membership.usage === 'object' ? membership.usage : {};
        return {
            classes: numberOr(raw.classes, raw.classCount, membership?.classCount, 0),
            students: numberOr(raw.students, raw.studentCount, membership?.studentCount, 0),
            results: numberOr(raw.results, raw.resultCount, membership?.resultCount, 0),
            storageBytes: numberOr(raw.storageBytes, raw.r2Bytes, raw.usedBytes, membership?.usedStorageBytes, 0)
        };
    }

    function effectiveStatus(membership) {
        const raw = String(membership?.status || 'pending').toLowerCase();
        if (['suspended', 'suspend', 'inactive'].includes(raw)) return 'paused';
        if (['delete_pending', 'scheduled_delete', 'deletion_scheduled'].includes(raw)) return 'deletion_scheduled';
        if (raw === 'active' && isPast(membership?.accessEndsAt)) return 'expired';
        if (['active', 'pending', 'paused', 'expired', 'deletion_scheduled'].includes(raw)) return raw;
        return 'pending';
    }

    function statusLabel(status) {
        return ({
            active: 'Đang sử dụng',
            pending: 'Chờ duyệt',
            paused: 'Tạm dừng',
            expired: 'Hết hạn',
            deletion_scheduled: 'Chờ xóa'
        })[status] || status;
    }

    function expiryCopy(membership) {
        if (effectiveStatus(membership) === 'deletion_scheduled') {
            return `Xóa dự kiến: ${formatDate(membership.deleteAfter || membership.deleteAt || membership.deletionScheduledAt)}`;
        }
        return membership?.accessEndsAt ? `Hết hạn: ${formatDate(membership.accessEndsAt)}` : 'Chưa đặt ngày hết hạn';
    }

    function createPerson(value) {
        const person = node('div', 'person');
        const avatar = node('span', 'person-avatar', initials(displayName(value)));
        const photoURL = value?.photoURL || value?.avatarUrl;
        if (isSafeAvatarUrl(photoURL)) {
            const image = document.createElement('img');
            image.alt = '';
            image.referrerPolicy = 'no-referrer';
            image.src = photoURL;
            image.addEventListener('error', () => image.remove(), { once: true });
            avatar.appendChild(image);
        }
        const copy = node('span', 'person-copy');
        copy.append(node('strong', '', displayName(value)), node('span', '', normalizeEmail(value?.email) || 'Chưa có email'));
        if (uidOf(value)) copy.appendChild(node('small', '', `UID ${shortId(uidOf(value))}`));
        person.append(avatar, copy);
        return person;
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

    function showDialog(dialog) {
        if (typeof dialog.showModal === 'function') dialog.showModal();
        else dialog.setAttribute('open', '');
    }

    function toggleSidebar() {
        const isOpen = el.adminApp.classList.toggle('is-menu-open');
        el.menuButton.setAttribute('aria-expanded', String(isOpen));
        el.sidebarBackdrop.hidden = !isOpen;
    }

    function closeSidebar() {
        el.adminApp.classList.remove('is-menu-open');
        el.menuButton.setAttribute('aria-expanded', 'false');
        el.sidebarBackdrop.hidden = true;
    }

    function showLoading(message) {
        el.loadingText.textContent = message || 'Đang xử lý…';
        el.loadingOverlay.hidden = false;
    }

    function hideLoading() {
        el.loadingOverlay.hidden = true;
    }

    function showToast(message, type = '') {
        const toast = node('div', `toast${type ? ` toast--${type}` : ''}`, message);
        el.toastRegion.appendChild(toast);
        window.setTimeout(() => toast.remove(), type === 'error' ? 6500 : 3800);
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

    function actionSuccessMessage(action) {
        return ({
            approve: 'Đã duyệt và cấp quyền sản phẩm.',
            suspend: 'Đã tạm dừng quyền sản phẩm.',
            resume: 'Đã tiếp tục quyền sản phẩm.',
            extend: 'Đã gia hạn thời gian sử dụng.',
            set_expiry: 'Đã đặt ngày hết hạn mới.',
            update_limits: 'Đã cập nhật hạn mức.',
            cancel_delete: 'Đã hủy lịch xóa.'
        })[action] || 'Đã cập nhật quyền thành viên.';
    }

    function readableError(error, fallback = 'Có lỗi xảy ra. Vui lòng thử lại.') {
        const code = String(error?.code || '').replace(/^functions\//, '');
        const map = {
            unauthenticated: 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
            'permission-denied': 'Tài khoản này không có quyền quản trị.',
            'failed-precondition': 'Dữ liệu vừa thay đổi trên thiết bị khác. Hãy làm mới rồi thử lại.',
            aborted: 'Có thay đổi đồng thời. Hệ thống đã ngăn ghi đè nhầm; hãy làm mới.',
            'resource-exhausted': 'Đã chạm hạn mức an toàn. Hãy kiểm tra quota trước khi cấp thêm.',
            'invalid-argument': 'Thông tin gửi lên chưa hợp lệ.'
        };
        return map[code] || error?.message || fallback;
    }

    function createMutationId() {
        if (window.crypto?.randomUUID) return window.crypto.randomUUID();
        const bytes = new Uint8Array(16);
        window.crypto?.getRandomValues?.(bytes);
        bytes[6] = (bytes[6] & 0x0f) | 0x40;
        bytes[8] = (bytes[8] & 0x3f) | 0x80;
        const hex = [...bytes].map((byte) => byte.toString(16).padStart(2, '0')).join('');
        return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-${hex.slice(12, 16)}-${hex.slice(16, 20)}-${hex.slice(20)}`;
    }

    function endOfVietnamDayIso(value) {
        if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) throw new Error('Ngày hết hạn chưa hợp lệ.');
        return new Date(`${value}T23:59:59.999+07:00`).toISOString();
    }

    function dateInputValue(value) {
        const date = toDate(value);
        if (!date) return '';
        const vn = new Date(date.getTime() + 7 * 60 * 60 * 1000);
        return vn.toISOString().slice(0, 10);
    }

    function formatDate(value) {
        const date = toDate(value);
        return date ? new Intl.DateTimeFormat('vi-VN', { day: '2-digit', month: '2-digit', year: 'numeric', timeZone: 'Asia/Ho_Chi_Minh' }).format(date) : '—';
    }

    function formatDateTime(value) {
        const date = toDate(value);
        return date ? new Intl.DateTimeFormat('vi-VN', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit', timeZone: 'Asia/Ho_Chi_Minh' }).format(date) : 'chưa rõ thời gian';
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

    function productName(id) {
        return state.products[id]?.name || DEFAULT_PRODUCTS[id]?.name || id;
    }

    function actionGlyph(action) {
        return ({ approve: '✓', suspend: 'Ⅱ', resume: '▶', extend: '+', update_limits: '↕', schedule_delete: '×' })[action] || '•';
    }

    function auditTitle(event) {
        const action = String(event?.action || 'update');
        const names = { approve: 'Duyệt quyền', suspend: 'Tạm dừng', resume: 'Tiếp tục', extend: 'Gia hạn', update_limits: 'Đổi hạn mức', schedule_delete: 'Lên lịch xóa' };
        return `${names[action] || 'Cập nhật'} · ${event.email || event.uid || 'thành viên'} · ${productName(event.productId)}`;
    }

    function safeProductUrl(value) {
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

    function safeColor(value, fallback = '#0f6cbd') {
        return /^#[0-9a-f]{6}$/i.test(String(value || '')) ? value : fallback;
    }

    function normalizeEmail(value) {
        return String(value || '').trim().toLowerCase();
    }

    function normalizeArray(value) {
        return Array.isArray(value) ? value.filter(Boolean) : [];
    }

    function numberOr(...values) {
        for (const value of values) {
            const number = Number(value);
            if (Number.isFinite(number)) return number;
        }
        return 0;
    }

    function validInteger(value, min, max) {
        const number = Math.trunc(Number(value));
        if (!Number.isFinite(number) || number < min || number > max) throw new Error(`Giá trị phải từ ${min} đến ${max}.`);
        return number;
    }

    function validNumber(value, min, max) {
        const number = Number(value);
        if (!Number.isFinite(number) || number < min || number > max) throw new Error(`Giá trị phải từ ${min} đến ${max}.`);
        return number;
    }

    function roundTo(value, digits) {
        const factor = 10 ** digits;
        return Math.round(value * factor) / factor;
    }

    function formatNumber(value) {
        return new Intl.NumberFormat('vi-VN').format(numberOr(value, 0));
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

    function initials(value) {
        const parts = String(value || 'GV').trim().split(/\s+/).filter(Boolean);
        return (parts.length > 1 ? `${parts[0][0]}${parts.at(-1)[0]}` : parts[0]?.slice(0, 2) || 'GV').toUpperCase();
    }

    function initialsDataUrl(value) {
        const text = String(value || 'NS').replace(/[^A-ZÀ-Ỹ0-9]/gi, '').slice(0, 2);
        const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="96" height="96"><rect width="96" height="96" rx="48" fill="#e0f2fe"/><text x="48" y="58" text-anchor="middle" font-family="Arial,sans-serif" font-size="30" font-weight="700" fill="#075985">${text}</text></svg>`;
        return `data:image/svg+xml;charset=utf-8,${encodeURIComponent(svg)}`;
    }

    function shortId(value) {
        const string = String(value || '—');
        return string.length > 12 ? `${string.slice(0, 6)}…${string.slice(-4)}` : string;
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
