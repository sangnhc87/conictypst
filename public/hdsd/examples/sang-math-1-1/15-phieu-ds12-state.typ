// Phiếu 12 câu Đúng/Sai. Đặt ds-12.typ trong cùng thư mục.
// Chỉ thay SBD và mã đề; giữ nguyên template để máy chấm nhận dạng.
#let ma-de = "0101"
#state("sbd").update("1001")
#state("made").update(ma-de)
#include "ds-12.typ"
