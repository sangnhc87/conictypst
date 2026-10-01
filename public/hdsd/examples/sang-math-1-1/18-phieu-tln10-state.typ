// Phiếu 10 câu trả lời ngắn. Đặt tln-10.typ trong cùng thư mục.
// Chỉ thay SBD và mã đề; giữ nguyên template để máy chấm nhận dạng.
#let ma-de = "0101"
#state("sbd").update("1001")
#state("made").update(ma-de)
#include "tln-10.typ"
