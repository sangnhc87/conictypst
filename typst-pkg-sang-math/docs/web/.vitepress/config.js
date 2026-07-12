import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "Sang-Math v2.0",
  description: "Thư viện Hình Vẽ Toán Học Đa Năng cho Typst",
  themeConfig: {
    nav: [
      { text: 'Trang chủ', link: '/' },
      { text: 'Hướng dẫn', link: '/guide/introduction' }
    ],
    sidebar: [
      {
        text: 'Bắt đầu',
        items: [
          { text: 'Giới thiệu', link: '/guide/introduction' },
        ]
      },
      {
        text: 'Hình học Phẳng (2D)',
        items: [
          { text: 'Đường Conic', link: '/geometry-2d/conics' },
        ]
      },
      {
        text: 'Hình học Không Gian (3D)',
        items: [
          { text: 'Mặt tròn xoay', link: '/geometry-3d/revolution' },
          { text: 'Đường cong 3D', link: '/geometry-3d/curves-3d' },
        ]
      }
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/sang-math/typst-pkg' }
    ]
  }
})
