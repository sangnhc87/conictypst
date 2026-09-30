// Tình huống 14: Tô trước SBD/mã đề ở preset 40 câu trắc nghiệm.
// Đặt tn-40.typ trong cùng thư mục.
#let ma-de = "0234"
#state("sbd").update("12045") // Sáu cột: 012045.
#state("made").update(ma-de)
#include "tn-40.typ"
