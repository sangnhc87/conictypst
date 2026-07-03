# 📚 Thư Viện Bài Giảng Beamer - Web App

Hệ thống trình chiếu bài giảng Typst trực tuyến, hỗ trợ toàn bộ chương trình 3 Khối (10, 11, 12).

🌐 **Live URL:** https://beamer-gjv.pages.dev

---

## 🚀 Deploy lên Cloudflare Pages

Mỗi khi thêm bài giảng mới hoặc cập nhật giao diện, chạy lệnh sau từ thư mục gốc dự án:

```bash
cd web-app
npm run build && npx wrangler pages deploy dist --project-name beamer --commit-dirty=true
```

---

## ➕ Thêm bài giảng mới

### Bước 1: Copy file PDF vào thư mục
```
web-app/public/pdfs/ten-file.pdf
```

### Bước 2: Thêm 1 dòng vào `web-app/public/data.json`
```json
{
  "id": "12-1-1",
  "title": "Bài 1: Tên bài giảng",
  "grade": 12,
  "chapter": 1,
  "chapterTitle": "Chương 1: Tên chương",
  "lesson_num": 1,
  "file": "/pdfs/ten-file.pdf"
}
```

| Cột          | Ý nghĩa                          | Ví dụ          |
|--------------|----------------------------------|----------------|
| `grade`      | Khối lớp                         | `10`, `11`, `12` |
| `chapter`    | Số thứ tự Chương                 | `1`, `2`, `3`  |
| `chapterTitle` | Tên đầy đủ của Chương          | `"Chương 1: ..."` |
| `lesson_num` | Số thứ tự Bài (để sắp xếp đúng) | `1`, `2`, `10` |
| `file`       | Đường dẫn file PDF               | `"/pdfs/..."` hoặc `null` nếu chưa có |

### Bước 3: Deploy lại
```bash
cd web-app
npm run build && npx wrangler pages deploy dist --project-name beamer --commit-dirty=true
```

---

## 💻 Chạy thử trên máy local

```bash
cd web-app
npm run dev
```
Mở trình duyệt: http://localhost:5173

---

## ⌨️ Phím tắt khi trình chiếu

| Phím                    | Chức năng              |
|-------------------------|------------------------|
| `→` / `Space` / `Enter` | Sang slide tiếp theo   |
| `←` / `Backspace`       | Quay lại slide trước   |
| `F` hoặc `F11`          | Bật/Tắt toàn màn hình  |
| `Esc`                   | Thoát trình chiếu      |
| Chuột trái              | Sang slide tiếp theo   |
| Chuột phải              | Quay lại slide trước   |

---

## 🗂️ Cấu trúc thư mục

```
web-app/
├── public/
│   ├── pdfs/          ← Bỏ tất cả file PDF vào đây
│   └── data.json      ← Danh sách bài giảng (chỉnh sửa ở đây)
├── src/
│   ├── App.jsx        ← Logic chính
│   ├── Gallery.jsx    ← Trang thư viện (Tabs + Chương)
│   └── Presenter.jsx  ← Màn hình trình chiếu
└── dist/              ← Thư mục build (tự động tạo khi chạy npm run build)
```



Edited README.md

Mình đã ghi rõ toàn bộ hướng dẫn vào file [README.md](file:///Users/admin/conictypst/web-app/README.md) trong thư mục `web-app/` rồi nhé!

**Tóm tắt nhanh để nhớ — Mỗi lần muốn cập nhật và deploy:**

```bash
cd web-app
npm run build && npx wrangler pages deploy dist --project-name beamer --commit-dirty=true
```

File README này ghi đầy đủ:
- ✅ Lệnh deploy
- ✅ Cách thêm bài giảng mới (copy PDF + thêm 1 dòng vào `data.json`)
- ✅ Cách chạy thử local
- ✅ Bảng phím tắt khi trình chiếu
- ✅ Sơ đồ cấu trúc thư mục

Lần sau cần tìm lại, chỉ cần mở file `web-app/README.md` là có hết! 📖