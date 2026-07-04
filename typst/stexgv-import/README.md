# STEXGV -> Typst bridge

Thu muc nay la dau ra tu `scripts/stexgv-typst-bridge.mjs`.

## Chay nhanh

```bash
npm run stexgv:import
npm run stexgv:mix -- --compile
```

Lenh tren tao:

- `stexgv-bank.json`: snapshot day du tu kho STEXGV, gom ID, slot, type, topic, source, latex goc va noi dung da chuyen doi an toan.
- `stexgv-stats.json`: thong ke so cau theo slot, trang thai va loi import.
- `stexgv-bank.typ`: registry Typst dung truc tiep voi `build-exam-plan`.
- `stexgv-mix-demo.typ`: demo tron de 22 slot, 2 ma de.
- `../../output/stexgv-mix-demo.pdf`: PDF demo neu chay them `--compile`.

## Trang thai cau hoi

- `ready`: cau khong con dau hieu lenh LaTeX/TikZ dac thu sau buoc chuyen doi tu dong.
- `review`: cau da vao he ID va tron de duoc, nhung van can soat lai vi co TikZ, `tkz-tab`, moi truong LaTeX dac biet hoac lenh rieng cua STEXGV.

Ban co the dung toan bo bank ngay voi `status: none`, hoac chi lay nhom sach hon bang `status: "ready"`.
