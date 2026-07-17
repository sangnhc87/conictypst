#import "../lib.typ": step, reset-step

#set page(width: 12cm, height: auto, margin: 12mm)
#set text(size: 11pt)
#set par(leading: 0.65em)

= Step spacing contract

#reset-step()
Nội dung ngay trước bước mặc định.
#step[Bước mặc định có khoảng cách thoáng hơn]
Nội dung ngay sau bước mặc định.

#step(above: 0.8em, below: 0.8em)[Bước tùy chỉnh khoảng cách]
Nội dung ngay sau bước tùy chỉnh.
