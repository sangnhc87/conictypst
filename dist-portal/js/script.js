document.addEventListener('DOMContentLoaded', () => {
    const courseGrid = document.getElementById('course-grid');
    const courseCount = document.getElementById('course-count');
    const searchInput = document.getElementById('search-input');
    const navItems = document.querySelectorAll('.nav-item');
    const themeBtn = document.getElementById('theme-btn');
    const currentCategoryLabel = document.getElementById('current-category');

    let allCourses = [];
    let currentFilter = 'all';
    let searchQuery = '';

    // Load Data
    fetch('data.json')
        .then(response => response.json())
        .then(data => {
            allCourses = data;
            renderCourses();
        })
        .catch(error => {
            console.error('Error loading courses:', error);
            courseGrid.innerHTML = `
                <div class="empty-state">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    <p>Lỗi tải dữ liệu bài giảng. Hãy đảm bảo bạn đang chạy trên HTTP server.</p>
                </div>
            `;
            courseCount.textContent = "0 bài giảng";
        });

    // Render Courses
    function renderCourses() {
        // Filter by grade
        let filtered = allCourses;
        if (currentFilter !== 'all') {
            filtered = filtered.filter(c => c.grade === currentFilter);
        }

        // Filter by search
        if (searchQuery.trim() !== '') {
            const query = searchQuery.toLowerCase();
            filtered = filtered.filter(c => 
                c.title.toLowerCase().includes(query) || 
                c.chapter.toLowerCase().includes(query)
            );
        }

        courseCount.textContent = `${filtered.length} bài giảng`;

        if (filtered.length === 0) {
            courseGrid.innerHTML = `
                <div class="empty-state">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <p>Không tìm thấy bài giảng nào phù hợp.</p>
                </div>
            `;
            return;
        }

        courseGrid.innerHTML = filtered.map(course => {
            let thumbClass = 'thumb-default';
            let iconClass = 'fa-book';
            if (course.grade.includes('10')) { thumbClass = 'thumb-10'; iconClass = 'fa-square-root-variable'; }
            if (course.grade.includes('11')) { thumbClass = 'thumb-11'; iconClass = 'fa-chart-line'; }
            if (course.grade.includes('12')) { thumbClass = 'thumb-12'; iconClass = 'fa-shapes'; }

            return `
                <div class="course-card">
                    <div class="card-thumbnail ${thumbClass}">
                        <i class="fa-solid ${iconClass}"></i>
                        <span class="grade-badge">${course.grade}</span>
                    </div>
                    <div class="card-content">
                        <div class="card-chapter">${course.chapter}</div>
                        <h3 class="card-title">${course.title}</h3>
                        <div class="card-action">
                            <a href="${course.url}" target="_blank" class="play-btn">
                                <i class="fa-solid fa-play"></i> Trình chiếu
                            </a>
                        </div>
                    </div>
                </div>
            `;
        }).join('');
    }

    // Search event
    searchInput.addEventListener('input', (e) => {
        searchQuery = e.target.value;
        renderCourses();
    });

    // Filter event
    navItems.forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            navItems.forEach(nav => nav.classList.remove('active'));
            item.classList.add('active');
            
            currentFilter = item.getAttribute('data-grade');
            currentCategoryLabel.textContent = item.textContent.trim();
            renderCourses();
        });
    });

    // Theme Toggle
    themeBtn.addEventListener('click', () => {
        const body = document.documentElement;
        if (body.getAttribute('data-theme') === 'dark') {
            body.removeAttribute('data-theme');
            themeBtn.innerHTML = '<i class="fa-solid fa-moon"></i> <span>Dark Mode</span>';
        } else {
            body.setAttribute('data-theme', 'dark');
            themeBtn.innerHTML = '<i class="fa-solid fa-sun"></i> <span>Light Mode</span>';
        }
    });
});
