// Phiếu 50 câu trắc nghiệm. Đặt tn-50.typ trong cùng thư mục.
// Chỉ thay SBD và mã đề; giữ nguyên template để máy chấm nhận dạng.
#let ma-de = "0101"
#state("sbd").update("1001")
#state("made").update(ma-de)
#include "tn-50.typ"
