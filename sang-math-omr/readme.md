# Sang Math OMR

Production: https://chamthi-conictypst.pages.dev/

## Quét và chấm một tờ A4 bằng điện thoại

1. Chọn loại phiếu, lớp và đáp án trong tab **Chấm thi**.
2. Bấm **📷 QUÉT A4 · TỰ CHẤM** và cho phép truy cập camera.
3. Đặt trọn tờ giấy trong khung, trên nền dễ phân biệt với mép giấy. Giữ máy yên khoảng một giây khi viền giấy hiện lên. Hệ thống tự chụp, làm phẳng phối cảnh và đưa ảnh vào bộ chấm.
4. Nếu camera video mờ, bấm **Camera máy · nét cao** hoặc nút chụp tròn. Ảnh chụp tay cũng được làm phẳng khi nhận ra viền A4.
5. Với nhiều tờ, mở **App quét cả lớp → PDF A4**. Camera tự bắt viền giấy khi đứng yên và đủ nét; có thể chụp tay hoặc nhập ảnh. Xem, sửa bốn góc, đổi thứ tự từng trang, rồi tải PDF hoặc đưa PDF sang màn hình chấm.

Tờ giấy cần nằm trọn trong ảnh, không bị che góc hoặc phản sáng mạnh. Nếu không nhận được viền A4, vẫn có thể chụp tay và dùng ảnh gốc để chấm theo marker của phiếu.

## Xem và sửa bài theo đợt

Mỗi lần bấm **Chấm từ ảnh** tạo một đợt riêng. Mở **Bài đã chấm**, chọn lớp ở đầu màn hình, rồi chọn một thẻ **Đợt 1**, **Đợt 2**… ngay bên dưới; mặc định màn hình mở đợt mới nhất của lớp. Thẻ **Tất cả đợt** cho biết tổng số bài khi cần xem chung. Hai lần chấm cùng một PDF cũ chưa lưu mã đợt vẫn được tách khi chuỗi trang quay lại trang 1. Tìm bằng tên/SBD/số trang và lọc **Cần rà soát** trong đợt đang chọn. Bấm **Xem / sửa** để đối chiếu ảnh gốc với ảnh đã chấm, sửa mã đề hoặc từng đáp án, rồi **Lưu sửa và tính lại điểm**. Nếu học sinh quên tô SBD, nhập tên trong ô tìm học sinh và chọn đúng dòng có SBD/lớp. Với các đợt mới, nút **Đọc lại ảnh bài này** chạy lại bộ nhận dạng cho riêng trang đó. Ảnh gốc được giữ trên thiết bị đã chấm; các bài cũ chưa có ảnh gốc vẫn sửa đáp án và tính lại điểm được. Xuất CSV/Excel hoặc đồng bộ từ màn hình này dùng đợt/lớp đang chọn.

Ở **Chấm Bài → Bước 2**, có thể nhập **Tên đợt chấm** trước khi chấm; để trống thì tên tự lấy ngày giờ và tên tệp. Trong **Bài đã chấm**, chọn một đợt rồi bấm **Đổi tên đợt** hoặc **Xoá đợt này**. Nút xoá yêu cầu xác nhận và xoá toàn bộ bài, ảnh cùng kết quả đồng bộ của đợt được chọn. Các dòng có ghi chú nét tô hiện nền xanh ngọc nhạt để dễ tìm.

Trong **Đáp Án Đúng** hoặc **Phân Tích Từng Câu**, chọn **Theo phiếu** để xem I.1, II.1, III.1… hoặc **Liên tục** để xem C1–C22. Lựa chọn áp dụng cho nhãn đáp án, thống kê, màn sửa bài và chi tiết câu sai; mã đáp án và điểm không đổi.

Khi sửa đáp án của một mã đề hoặc lưu thang điểm, các bài đã chấm bằng mẫu phiếu tương ứng được tính lại ngay. Thang điểm được lưu riêng cho từng mẫu; đổi mẫu rồi quay lại vẫn giữ thang điểm đã đặt.

Phiếu 12-4-6 ngang scan nhỏ trong trang A4 vẫn có thể cho nét tô nhạt. Khi một cột trả lời ngắn chỉ có một ô nổi bật, hệ thống ghi chú nét tô nhạt nhưng không đưa cả bài vào hàng chờ. Các trường hợp thiếu SBD, tô nhiều ô hoặc trả lời ngắn không hợp lệ vẫn bắt buộc rà soát.

## Phiếu 12-4-6 chuẩn A4

Trong **Sinh Phiếu**, chọn **Phiếu 12-4-6 chuẩn A4** rồi mở **Chỉnh chữ trên phiếu** để sửa tiêu đề, nhãn thông tin, các dòng hướng dẫn in/quét. Tên trường và kỳ thi ở ngay phía trên. Bản xem trước, nút **Tải PDF**, **Tải PNG**, **Sinh Code Typst** và file `.typ` cùng dùng cấu hình chữ này; chữ được lưu trên trình duyệt đang dùng. Nút PDF trên thẻ mẫu cũng tạo lại phiếu theo nội dung hiện tại, không tải bản tĩnh cũ. Nếu trình biên dịch Typst chưa tải được, hãy dùng `.typ` để biên dịch trên máy; ứng dụng không tự thay bằng PDF mẫu sai nội dung.

Chọn **có tự luận** hoặc **không tự luận** trước khi tải PDF. Bản có tự luận gồm trang OMR và một trang giấy viết; bản xem trước chỉ hiện trang OMR. Khi chấm tự động chỉ đưa trang OMR vào PDF cả lớp. In trang OMR trên một tờ A4 ở tỷ lệ 100%, không co giãn hoặc ghép nhiều trang. Phiếu có 8 mốc định vị ở góc và giữa cạnh; bộ chấm đã thử căn lại khi tối đa 2 mốc mất hoặc mờ, nếu 6 mốc còn lại đủ rõ và đúng hình học. Ô ghi số là hình vuông và tách khỏi hàng tô; học sinh vẫn phải tô kín ô tròn tương ứng. Khi scan, để trọn cả trang trong ảnh, ưu tiên 300 dpi. Phiếu nào có ô tô hoặc mã định danh mơ hồ phải được kiểm tra trước khi chốt điểm.

Kho mẫu đã được so hình học bản Typst đang phát hành với bộ đọc OMR. TN-40, TN-50, TN-60, ĐS-12, ĐS-20 ngang và TLN-10 đã hiệu chuẩn lại từ bản in thực tế. Phiếu THPTQG 12-4-6 dọc đã thử cả hai lựa chọn tự luận; phiếu 12-4-6 chuẩn A4 đã thử các tình huống thẳng, lệch phối cảnh, giảm độ phân giải và mờ 1–2 mốc. A3 Cắt Phách và TLN-10 ngang đang tạm ngưng vì bản in hiện tại chồng hoặc cắt ô tô; cần thiết kế lại trước khi dùng.

## Phiếu A3 cắt phách mới · hai mặt

Trong tab **Sinh phiếu**, chọn **A3 cắt phách · 2 mặt**. Tải PDF mẫu 16 TN, 2 Đ/S, 4 TLN để in thử **một bài duy nhất; không photocopy làm phiếu cả lớp vì mã phách sẽ trùng**. Để in cả lớp, chọn 0–24 TN, 0–4 Đ/S, 0–4 TLN (cần ít nhất một câu), mã phách đầu và số bản in rồi bấm **Tạo PDF cả lớp**. Nếu thiết bị không tải được bộ biên dịch Typst trong trình duyệt, tải file `.typ` dự phòng và chạy `typst compile ten-file.typ phieu.pdf`. Mỗi bản in gồm hai trang A3 và một mã phách sáu chữ số riêng; tối đa 100 bản trong một file. Phiếu có sẵn phần tự luận ở nửa trái mặt trước và cả mặt sau.

Với các mẫu khác trong **Sinh Phiếu**, nút **Tải PDF** và **Tải PNG** nằm cạnh tiêu đề **Xem Trước**. PDF được dựng từ cấu hình đang chọn khi Typst trong trình duyệt sẵn sàng; 12-4-6 ngang và A3 cắt phách có PDF mẫu dự phòng nếu bộ biên dịch chưa tải được. Trong **Tô Phiếu**, bấm **Bắt Đầu Tô Phiếu**, đợi báo hoàn tất rồi tải **PNG** hoặc **PDF** bằng hai nút hiện dưới form.

In A3 ngang, **hai mặt, tỉ lệ 100%, lật cạnh dài**; in thử một tờ để kiểm tra mặt sau, nếp gấp và đường cắt. Mã phách in sẵn trên bài làm và dải tên; học sinh chỉ ghi tên, lớp, SBD vào dải phách bên phải. Sau khi thu bài, đối chiếu hai mã, cắt dải tên và giữ riêng theo quy trình bảo mật của kỳ thi. Phần bài làm còn mã phách nhưng không còn tên/SBD.

Để chấm OMR, gấp bài theo nếp giữa để phần ô tô nằm trên cùng. Mở **App quét cả lớp → PDF**, chọn **A3 đã cắt phách · gấp phần OMR**, rồi quét **chỉ phần có ô tô**; không đưa mặt tự luận hay dải tên vào PDF chấm tự động. Mỗi bài tạo một trang PDF. Bộ chấm đọc tám mốc định vị, mã phách đã in và đáp án; bản in thẳng, ảnh scan co về kích thước A4 và ảnh chụp lệch phối cảnh đã được kiểm bằng mẫu tổng hợp ở cả cấu hình 16-2-4 và 24-4-4. Nếu mốc hoặc nét tô quá mờ vẫn cần quét lại/rà soát; không thể hứa chính xác tuyệt đối với mọi bản in thực tế.

Trong **Bài đã chấm**, các bài `Pxxxxxx` nằm trong hàng **Cần rà soát** cho tới khi ghép tên. Mở **Xem / sửa**, đối chiếu mã phách với dải tên, tìm học sinh theo tên rồi nhập SBD; ứng dụng giữ mã phách gốc bên cạnh SBD và tính lại điểm khi lưu. Chỉ các bài đã ghép SBD và xác nhận mới đưa vào xuất điểm theo lớp. Khi đọc lại ảnh, mã phách mới phải trùng mã đã lưu; nếu không, hệ thống dừng để kiểm tra.

## Đăng nhập và đồng bộ trên điện thoại

Bấm **☁ Đăng nhập**, chọn tài khoản Google trong cửa sổ mới. Nếu trình duyệt nhúng trong Zalo/Facebook chặn cửa sổ, mở liên kết trực tiếp bằng Safari hoặc Chrome. Lần tải SDK đầu tiên trên mạng chậm có thể cần chạm **Đăng nhập Google** lần thứ hai sau thông báo sẵn sàng. Chấm thi trên máy vẫn dùng được khi chưa đăng nhập.

## Kiểm thử

Chạy server HTTP cho thư mục này ở cổng 8765, rồi chạy:

```bash
node sang-math-omr/test_auto_a4.mjs
node sang-math-omr/test_a4_scan_sheet.mjs
node sang-math-omr/test_a4_text_editor.mjs
node sang-math-omr/test_a3_cut_sheet.mjs
node sang-math-omr/test_vertical_variants.mjs
node sang-math-omr/test_preset_audit.mjs
node sang-math-omr/test_document_scanner.mjs
node sang-math-omr/test_auto_rescore.mjs
node sang-math-omr/test_batch_history.mjs
node sang-math-omr/test_batch_controls_downloads.mjs
node sang-math-omr/test_mobile_auth.mjs
```

Các kiểm thử dùng Chrome headless và ảnh mẫu của dự án. Luồng Google OAuth đã được xác nhận đến màn hình đăng nhập Google trên production; việc nhập tài khoản thật và xác minh dữ liệu đồng bộ giữa hai thiết bị cần kiểm tra bằng tài khoản của người dùng.
