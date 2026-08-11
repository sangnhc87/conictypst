# Studio Storage Worker

Kho R2 riêng cho dự án Studio Cloud. Bucket không public; trình duyệt chỉ có thể
PUT/GET/DELETE bằng vé HMAC ngắn hạn do Firebase Functions cấp cho tài khoản
Studio đã được admin duyệt.

Triển khai lần đầu:

```sh
npx wrangler r2 bucket create sang-math-studio-private
npx wrangler secret put STUDIO_STORAGE_HMAC_SECRET --config typst-conic-hub/storage-worker/wrangler.jsonc
npx wrangler deploy --config typst-conic-hub/storage-worker/wrangler.jsonc
firebase functions:secrets:set STUDIO_STORAGE_HMAC_SECRET --project conictypst-platform
firebase deploy --only functions:studioGetProjects,functions:studioCreateUploadUrl,functions:studioCommitUpload,functions:studioCreateDownloadUrl,functions:studioDeleteProject,functions:studioCleanupExpiredUploads --project conictypst-platform
```

Hai secret phải có cùng giá trị ngẫu nhiên tối thiểu 32 ký tự.
