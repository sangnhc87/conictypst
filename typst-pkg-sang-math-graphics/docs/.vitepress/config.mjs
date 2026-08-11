import { defineConfig } from 'vitepress'
import { katex } from '@mdit/plugin-katex'

export default defineConfig({
    title: 'Sang Math Graphics',
    description: 'Package vẽ hình Toán phức tạp trong Typst',
    lang: 'vi-VN',
    base: '/sang-math-graphics/',
    markdown: {
        config: (md) => {
            console.log('[config] katex type:', typeof katex)
            md.use(katex)
            console.log('[config] applied katex plugin')
        },
    },
    themeConfig: {
        search: {
            provider: 'local',
        },
        nav: [
            { text: 'Hướng dẫn', link: '/guide' },
            { text: 'Chuyên đề', link: '/topics/geometry-2d' },
            { text: 'Live', link: '/topics/live' },
            { text: 'API', link: '/api' },
        ],
        sidebar: {
            '/topics/': [
                {
                    text: 'Chuyên đề',
                    items: [
                        { text: 'Hình học phẳng', link: '/topics/geometry-2d' },
                        { text: 'Hình học không gian', link: '/topics/geometry-3d' },
                        { text: 'Ứng dụng Giải tích', link: '/topics/calculus' },
                        { text: 'Xác suất - Thống kê', link: '/topics/probability' },
                        { text: 'Hình mẫu từ tài liệu', link: '/topics/samples' },
                        { text: 'Live Preview', link: '/topics/live' },
                        { text: 'GitHub Pages', link: '/topics/github-pages' },
                    ],
                },
            ],
            '/': [
                {
                    text: 'Bắt đầu',
                    items: [
                        { text: 'Hướng dẫn sử dụng', link: '/guide' },
                        { text: 'API Reference', link: '/api' },
                    ],
                },
            ],
        },
        socialLinks: [
            { icon: 'github', link: 'https://github.com/sangnhc87/conictypst/tree/main/typst-pkg-sang-math-graphics' },
        ],
    },
})
