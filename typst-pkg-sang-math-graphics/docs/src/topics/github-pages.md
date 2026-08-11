# Triển khai GitHub Pages riêng

Package `sang-math-graphics` có workflow deploy riêng, **không ảnh hưởng** đến các GitHub Pages đang có trong repo.

## Cách hoạt động

- Workflow: `.github/workflows/deploy-sang-math-graphics.yml`
- Chỉ chạy khi có thay đổi trong thư mục `typst-pkg-sang-math-graphics/`
- Build website từ `docs/src/` và deploy thư mục `docs/src/.vitepress/dist/`

## URL

Với repository hiện tại `sangnhc87/conictypst`, package sẽ deploy tại:

```
https://sangnhc87.github.io/conictypst/sang-math-graphics/
```

Nhờ `base: '/sang-math-graphics/'` trong `docs/.vitepress/config.mjs`.

## Lưu ý quan trọng

- Không sửa `base` nếu bạn muốn deploy cùng repo với các page khác.
- Các page khác trong repo không bị ghi đè vì workflow này chỉ upload thư mục con.
- Nếu repo đã có workflow deploy toàn bộ repo, bạn nên để workflow này chạy riêng hoặc tắt auto-deploy cho thư mục package.
