# Microservice Pandoc Cloud Run cho ConicTypst

Dịch vụ chạy Pandoc native trên Google Cloud Run để chuyển đổi tài liệu Typst sang Microsoft Word (`.docx`), xuất công thức toán học thành **Office Math (OMML)** chuẩn 100% có thể chỉnh sửa trực tiếp, giữ nguyên hình ảnh và bảng biểu.

## 1. Cách deploy lên Google Cloud Run

Yêu cầu đã cài đặt `gcloud` CLI và đăng nhập:

```bash
cd services/pandoc-cloudrun
chmod +x deploy.sh
./deploy.sh
```

Hoặc dùng lệnh trực tiếp:
```bash
gcloud run deploy pandoc-docx-service \
  --source . \
  --region asia-southeast1 \
  --allow-unauthenticated \
  --min-instances 0 \
  --max-instances 5
```

Sau khi deploy, bạn sẽ nhận được một URL có dạng:
`https://pandoc-docx-service-xxxx-as.a.run.app`

## 2. Các API Endpoint

- `GET /health`: Kiểm tra trạng thái và phiên bản Pandoc native.
- `POST /convert`: Nhận JSON:
  ```json
  {
    "typstCode": "= Tiêu đề\nCông thức: $x = (-b +- sqrt(b^2 - 4a c)) / (2a)$",
    "images": {
      "fig-1.png": "data:image/png;base64,..."
    }
  }
  ```
  Trả về stream binary file `.docx`.
