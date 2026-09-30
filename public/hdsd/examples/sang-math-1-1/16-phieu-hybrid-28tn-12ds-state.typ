// Phiếu 28 TN + 12 Đúng/Sai. Đặt hybrid-28tn-12ds.typ trong cùng thư mục.
// Chỉ thay SBD và mã đề; giữ nguyên template để máy chấm nhận dạng.
#let ma-de = "0101"
#state("sbd").update("1001")
#state("made").update(ma-de)
#include "hybrid-28tn-12ds.typ"
