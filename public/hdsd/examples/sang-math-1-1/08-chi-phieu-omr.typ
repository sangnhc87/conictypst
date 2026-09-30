// Tình huống 08: Chỉ in phiếu 12–4–6 ngang, không cần viết đề trong cùng file.
// Đặt 12-4-6ngang.typ trong cùng thư mục.
#let ma-de = "0101"
#state("sbd").update("1001") // Phiếu sáu cột sẽ tô 001001.
#state("made").update(ma-de)
#include "12-4-6ngang.typ"
