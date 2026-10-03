#import "style.typ": lesson-theme
#show: lesson-theme
#let id = sys.inputs.at("section", default: "01")
#let section = if id == "01" {
  include "sections/01-mo-hinh-va-nghiem.typ"
} else if id == "02" {
  include "sections/02-bieu-dien-mien-nghiem.typ"
} else if id == "03" {
  include "sections/03-dinh-va-toi-uu.typ"
} else if id == "04" {
  include "sections/04-mo-hinh-va-van-dung.typ"
} else {
  panic("Mã tiết học không tồn tại: " + id)
}
#section
