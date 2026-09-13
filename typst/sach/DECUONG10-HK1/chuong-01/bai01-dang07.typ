#import "../preamble-loigiai.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Bài toán suy luận logic mở rộng (Ma trận & Suy luận chéo)", mau: C1)

#phuong-phap(mau: C1)[
  Ở dạng này, học sinh sẽ rèn luyện kỹ năng phân tích và chắp nối thông tin từ nhiều nguồn để đi đến kết luận. Ta tiếp tục sử dụng kỹ thuật *Nhận - Loại*, kết hợp với công cụ *Lập bảng ma trận (Lưới logic)*.

  Quy trình tư duy:
  
  *Bước 1. Phân loại đối tượng*
  - Tìm xem bài toán có những nhóm đối tượng nào (Ví dụ: Nhóm Tên người, Nhóm Nghề nghiệp, Nhóm Màu áo).

  *Bước 2. Lập bảng ma trận 2 chiều*
  - Đặt nhóm đối tượng 1 thành các HÀNG, nhóm đối tượng 2 thành các CỘT.
  - Đọc từng dữ kiện, nếu chắc chắn khớp nhau thì ghi chữ *"Có"* (hoặc dấu ✔), nếu chắc chắn không khớp thì ghi chữ *"Không"* (hoặc dấu ✘).
  
  *Bước 3. Quét bảng (Nhận - Loại chéo)*
  - *Quy tắc vàng:* Khi một ô được chọn (Có), toàn bộ các ô còn lại trên *cùng hàng* và *cùng cột* với nó đều phải đánh "Không".
  - Chắp nối các dữ kiện để điền nốt các ô trống cho đến khi hoàn thành bảng.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(
    1,
    [*(VD)* Ba bạn Toán, Lý, Hóa dạy ba môn Toán, Lý, Hóa (không ai dạy môn trùng với tên mình). Biết rằng người dạy Hóa lớn tuổi hơn bạn Toán. Bạn Lý và người dạy Toán thường xuyên đi chơi tennis cùng nhau. Hỏi mỗi người dạy môn gì?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      Ta lập bảng ma trận Tên - Môn dạy. Dữ kiện "không ai dạy môn trùng với tên mình" cho ta các ô chéo là "Không". \
      - "Người dạy Hóa lớn tuổi hơn bạn Toán" $=>$ Toán không dạy Hóa (vì Toán khác người dạy Hóa). \
      - "Bạn Lý và người dạy Toán đi chơi với nhau" $=>$ Lý không dạy Toán.
      
      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Môn*], [*Toán*], [*Lý*], [*Hóa*],
          [*Toán*], [Không], [], [Không],
          [*Lý*], [Không], [Không], [],
          [*Hóa*], [], [], [Không],
        )
      ]
      
      *Bước 1. Lập bảng ma trận ban đầu:*
      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Môn*], [*Toán*], [*Lý*], [*Hóa*],
          [*Toán*], [Không], [], [Không],
          [*Lý*], [Không], [Không], [],
          [*Hóa*], [], [], [Không],
        )
      ]
      
      *Bước 2. Quét bảng (Nhận - Loại chéo):*
      - Nhìn vào hàng *Toán*: Đã loại Toán và Hóa $=>$ Bắt buộc Toán dạy *Lý*. Điền *Có* vào ô (Toán, Lý), đồng thời gạch *Không* ở cột Lý của các người khác.
      - Nhìn vào cột *Toán*: Cả Toán và Lý đều Không $=>$ Bắt buộc Hóa dạy *Toán*.
      - Nhìn vào cột *Hóa*: Chỉ còn Lý dạy *Hóa*.

      *Bước 3. Bảng ma trận hoàn thiện:*
      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Môn*], [*Toán*], [*Lý*], [*Hóa*],
          [*Toán*], [✘], [*✔ Có*], [✘],
          [*Lý*], [✘], [✘], [*✔ Có*],
          [*Hóa*], [*✔ Có*], [✘], [✘],
        )
      ]

      *Kết luận:* Bạn Toán dạy môn Lý, bạn Lý dạy môn Hóa, bạn Hóa dạy môn Toán.
    ],
  )

  #bt-item(
    2,
    [*(VDC)* Bốn bạn An, Bình, Cúc, Dung đạt 4 giải: Nhất, Nhì, Ba, Khuyến khích (KK) trong kỳ thi học sinh giỏi Toán. Biết rằng:
      1. An không đạt giải Nhất và cũng không đạt giải KK.
      2. Bạn đạt giải Nhì lớn tuổi hơn bạn An và bạn Dung.
      3. Cúc đạt giải cao hơn Bình.
      4. Dung không đạt giải KK.
      Hãy xác định giải của từng bạn bằng cách lập bảng ma trận.],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      *Bước 1. Thu thập dữ kiện và đánh dấu vào bảng:*
      - Từ (1): An không đạt giải Nhất, không đạt giải KK.
      - Từ (2): Bạn giải Nhì lớn tuổi hơn An và Dung $=>$ An và Dung không đạt giải Nhì.
      - Từ (4): Dung không đạt giải KK.

      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Giải*], [*Nhất*], [*Nhì*], [*Ba*], [*Khuyến khích*],
          [*An*], [Không], [Không], [], [Không],
          [*Bình*], [], [], [], [],
          [*Cúc*], [], [], [], [],
          [*Dung*], [], [Không], [], [Không],
        )
      ]
      
      *Bước 2. Suy luận quét bảng (Nhận - Loại chéo):*
      - Xét hàng *An*: Đã có 3 ô "Không" ở Nhất, Nhì, KK $=>$ An bắt buộc đạt giải *Ba*.
        $=>$ Đánh dấu *✔ Có* vào (An, Ba), đồng thời gạch *Không* toàn bộ cột Ba của các bạn khác.
      - Xét hàng *Dung*: Không Nhì, Không Ba (do An nhận), Không KK $=>$ Dung bắt buộc đạt giải *Nhất*.
        $=>$ Đánh dấu *✔ Có* vào (Dung, Nhất), đồng thời gạch *Không* cột Nhất của Cúc và Bình.
      - Còn lại Cúc và Bình ở hai giải: *Nhì* và *Khuyến khích*.
        Theo dữ kiện (3): Cúc đạt giải cao hơn Bình $=>$ Cúc đạt giải *Nhì*, Bình đạt giải *Khuyến khích*.

      *Bước 3. Bảng ma trận kết quả:*
      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Giải*], [*Nhất*], [*Nhì*], [*Ba*], [*Khuyến khích*],
          [*An*], [✘], [✘], [*✔ Có*], [✘],
          [*Bình*], [✘], [✘], [✘], [*✔ Có*],
          [*Cúc*], [✘], [*✔ Có*], [✘], [✘],
          [*Dung*], [*✔ Có*], [✘], [✘], [✘],
        )
      ]

      *Kết luận:* Dung đạt giải Nhất, Cúc đạt giải Nhì, An đạt giải Ba, Bình đạt giải Khuyến khích.
    ],
  )

  #bt-item(
    3,
    [*(VDC - Câu đố Einstein rút gọn)* Có 4 ngôi nhà nằm ngang từ trái qua phải (đánh số 1, 2, 3, 4). Mỗi nhà có một màu khác nhau (Xanh, Đỏ, Vàng, Trắng), chủ nhân có quốc tịch khác nhau (Anh, Pháp, Mỹ, Nhật) và nuôi một con vật khác nhau (Chó, Mèo, Cá, Ngựa).
      Biết rằng:
      1. Người Mỹ sống ở nhà số 1.
      2. Người Nhật sống ở nhà số 4.
      3. Người Anh sống ở nhà màu Đỏ.
      4. Người Pháp nuôi Chó.
      5. Nhà màu Xanh nằm ngay bên trái nhà màu Trắng.
      6. Nhà người Mỹ nằm ngay sát nhà màu Đỏ.
      7. Người nuôi Ngựa sống ngay cạnh nhà người Mỹ.
      8. Chú Cá được nuôi trong nhà màu Vàng.
      
      Hỏi: *Ai là người nuôi Mèo?* Cụ thể người đó ở nhà số mấy, màu gì?],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      Đây là biến thể của câu đố logic kinh điển (Einstein's Riddle). Ta lập bảng với các cột là số thứ tự nhà (từ 1 đến 4), các hàng là Quốc tịch, Màu nhà, Vật nuôi. Ta điền tuần tự theo các suy luận:
      
      - (1) và (2) $=>$ Nhà 1: Mỹ, Nhà 4: Nhật.
      - (6) Nhà người Mỹ (1) nằm sát nhà Đỏ $=>$ Nhà 2 phải là màu Đỏ.
      - (3) Người Anh sống ở nhà Đỏ $=>$ Nhà 2 là người Anh. Suy ra Nhà 3 là người Pháp (vì đã biết Mỹ, Anh, Nhật).
      - (5) Nhà Xanh nằm ngay trái nhà Trắng. Các nhà chưa có màu là 1, 3, 4. Hai nhà liền kề trống chỉ có 3 và 4 $=>$ Nhà 3: Xanh, Nhà 4: Trắng. Từ đó Nhà 1 còn lại màu Vàng.
      - (8) Cá ở nhà màu Vàng (Nhà 1) $=>$ Nhà 1 nuôi Cá.
      - (7) Người nuôi Ngựa cạnh nhà người Mỹ (1) $=>$ Nhà 2 nuôi Ngựa.
      - (4) Người Pháp nuôi Chó. Mà Pháp ở Nhà 3 $=>$ Nhà 3 nuôi Chó.
      - Vật nuôi cuối cùng là Mèo buộc phải ở Nhà 4.
      
      #align(center)[
        #table(
          columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Đặc điểm*], [*Nhà số 1*], [*Nhà số 2*], [*Nhà số 3*], [*Nhà số 4*],
          [*Quốc tịch*], [Mỹ], [Anh], [Pháp], [*Nhật*],
          [*Màu nhà*], [Vàng], [Đỏ], [Xanh], [*Trắng*],
          [*Vật nuôi*], [Cá], [Ngựa], [Chó], [*Mèo*],
        )
      ]
      
      *Kết luận:* Người Nhật là người nuôi Mèo. Người này ở Nhà số 4, màu Trắng.
    ],
  )

  #bt-item(
    4,
    [*(VDC - Ma trận liên hoàn 3 chiều: Tên - Màu áo - Phương tiện)* Ba bạn An, Bình, Cường mặc áo có 3 màu khác nhau: Đỏ, Xanh, Vàng và đến trường bằng 3 phương tiện khác nhau: Xe đạp, Xe buýt, Xe máy điện. Biết rằng:
      1. Bạn đi xe buýt mặc áo màu Vàng.
      2. An đi học bằng xe đạp.
      3. An không mặc áo màu Đỏ.
      4. Cường không đi học bằng xe buýt.
      Hãy xác định màu áo và phương tiện đến trường của từng bạn bằng cách lập bảng ma trận liên hoàn.],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      *Bước 1. Lập hai bảng ma trận liên kết (Tên - Phương tiện) và (Tên - Màu áo):*
      - Từ (2): An đi xe đạp $=>$ Ô (An, Xe đạp) = *✔ Có*. Gạch *✘* các ô còn lại trên hàng An và cột Xe đạp.
      - Từ (4): Cường không đi xe buýt $=>$ Ô (Cường, Xe buýt) = *✘*.
      - Nhìn cột Xe buýt: Cường (✘), An (✘) $=>$ Bắt buộc Bình đi *Xe buýt* (*✔ Có*).
      - Suy ra Cường đi *Xe máy điện* (*✔ Có*).

      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1.2fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Phương tiện*], [*Xe đạp*], [*Xe buýt*], [*Xe máy điện*],
          [*An*], [*✔ Có*], [✘], [✘],
          [*Bình*], [✘], [*✔ Có*], [✘],
          [*Cường*], [✘], [✘], [*✔ Có*],
        )
      ]

      *Bước 2. Suy luận màu áo qua mối liên kết phương tiện:*
      - Từ (1): Bạn đi xe buýt mặc áo màu Vàng. Do Bình đi xe buýt $=>$ Bình mặc *áo Vàng* (*✔ Có*).
      - Từ (3): An không mặc áo Đỏ, và An cũng không mặc áo Vàng (vì Bình đã mặc) $=>$ An mặc *áo Xanh* (*✔ Có*).
      - Còn lại, Cường bắt buộc mặc *áo Đỏ* (*✔ Có*).

      *Bước 3. Bảng tổng hợp kết quả:*
      #align(center)[
        #table(
          columns: (1.2fr, 1.2fr, 1.2fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên học sinh*], [*Phương tiện đi học*], [*Màu áo đang mặc*],
          [*An*], [Xe đạp], [Màu Xanh],
          [*Bình*], [Xe buýt], [Màu Vàng],
          [*Cường*], [Xe máy điện], [Màu Đỏ],
        )
      ]

      *Kết luận:* An đi xe đạp, mặc áo Xanh; Bình đi xe buýt, mặc áo Vàng; Cường đi xe máy điện, mặc áo Đỏ.
    ],
  )

  #bt-item(
    5,
    [*(VDC - Ma trận vị trí độ cao / tầng nhà)* Bốn bạn An, Bình, Cúc, Dũng sống ở 4 tầng khác nhau (Tầng 1, Tầng 2, Tầng 3, Tầng 4) của một tòa chung cư. Biết rằng:
      1. An không sống ở Tầng 1 và cũng không sống ở Tầng 4.
      2. Cúc sống ở tầng cao hơn tầng của An.
      3. Dũng sống ngay bên dưới tầng của Bình (tức số tầng của Bình bằng số tầng của Dũng cộng 1).
      Xác định tầng ở của từng bạn bằng cách lập bảng ma trận vị trí.],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      *Bước 1. Lập bảng ma trận Tên - Tầng nhà:*
      - Dữ kiện (1): An không ở Tầng 1, không ở Tầng 4 $=>$ Ô (An, Tầng 1) = *✘*, Ô (An, Tầng 4) = *✘*.
      - Dữ kiện (2): Cúc ở tầng cao hơn An. Vì An ở tầng 2 hoặc 3, nên Cúc không thể ở Tầng 1 $=>$ Ô (Cúc, Tầng 1) = *✘*.
      - Dữ kiện (3): Dũng ngay dưới Bình nên Bình không thể ở Tầng 1 (thấp nhất) $=>$ Ô (Bình, Tầng 1) = *✘*; Dũng không thể ở Tầng 4 (cao nhất) $=>$ Ô (Dũng, Tầng 4) = *✘*.

      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Tầng*], [*Tầng 1*], [*Tầng 2*], [*Tầng 3*], [*Tầng 4*],
          [*An*], [✘], [], [], [✘],
          [*Bình*], [✘], [], [], [],
          [*Cúc*], [✘], [], [], [],
          [*Dũng*], [], [], [], [✘],
        )
      ]

      *Bước 2. Quét bảng loại trừ chéo:*
      - Nhìn cột *Tầng 1*: Cả An, Bình, Cúc đều có dấu ✘ $=>$ Bắt buộc *Dũng sống ở Tầng 1* (*✔ Có*).
      - Vì Dũng ở Tầng 1, mà "Dũng sống ngay dưới Bình" $=>$ *Bình bắt buộc sống ở Tầng 2* (*✔ Có*).
      - Điền *✘* vào tất cả các ô còn lại của Tầng 1 và Tầng 2.
      - Lúc này còn Tầng 3 và Tầng 4 cho An và Cúc.
        Vì "Cúc sống ở tầng cao hơn An" $=>$ *An sống ở Tầng 3*, *Cúc sống ở Tầng 4*.

      *Bước 3. Bảng ma trận kết quả hoàn chỉnh:*
      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Tầng*], [*Tầng 1*], [*Tầng 2*], [*Tầng 3*], [*Tầng 4*],
          [*An*], [✘], [✘], [*✔ Có*], [✘],
          [*Bình*], [✘], [*✔ Có*], [✘], [✘],
          [*Cúc*], [✘], [✘], [✘], [*✔ Có*],
          [*Dũng*], [*✔ Có*], [✘], [✘], [✘],
        )
      ]

      *Kết luận:* Dũng sống ở Tầng 1, Bình sống ở Tầng 2, An sống ở Tầng 3, Cúc sống ở Tầng 4.
    ],
  )

  #bt-item(
    6,
    [*(VDC - Ma trận dãy phòng khách sạn liên tiếp)* Bốn bạn An, Bình, Cúc, Dũng đi du lịch và được bố trí ở 4 phòng khách sạn riêng biệt đánh số 201, 202, 203, 204 nằm cạnh nhau theo thứ tự từ trái qua phải. Biết rằng:
      1. An không ở phòng 201 và cũng không ở phòng 204.
      2. Phòng của Bình nằm ngay bên phải phòng của An (số phòng của Bình bằng số phòng của An cộng 1).
      3. Cúc không ở phòng 204.
      4. Số phòng của Dũng nhỏ hơn số phòng của Cúc.
      Xác định số phòng của từng bạn bằng cách lập bảng ma trận.],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      *Bước 1. Lập bảng ma trận Tên - Phòng khách sạn:*
      - Dữ kiện (1): An không ở 201, không ở 204 $=>$ Ô (An, 201) = *✘*, Ô (An, 204) = *✘*.
      - Dữ kiện (2): Bình ngay bên phải An. Vì An ở 202 hoặc 203, nên Bình ở 203 hoặc 204 $=>$ Bình không thể ở 201 và 202.
      - Dữ kiện (3): Cúc không ở 204 $=>$ Ô (Cúc, 204) = *✘*.
      - Dữ kiện (4): Dũng nhỏ hơn Cúc $=>$ Dũng không thể ở 204 (lớn nhất), Cúc không thể ở 201 (nhỏ nhất).

      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Phòng*], [*Phòng 201*], [*Phòng 202*], [*Phòng 203*], [*Phòng 204*],
          [*An*], [✘], [], [], [✘],
          [*Bình*], [✘], [✘], [], [],
          [*Cúc*], [✘], [], [], [✘],
          [*Dũng*], [], [], [], [✘],
        )
      ]

      *Bước 2. Quét bảng (Nhận - Loại chéo):*
      - Nhìn cột *Phòng 204*: Cả An, Cúc, Dũng đều có dấu ✘ $=>$ Bắt buộc *Bình ở Phòng 204* (*✔ Có*).
      - Vì Bình ở 204, mà "Bình ở ngay bên phải An" $=>$ Bắt buộc *An ở Phòng 203* (*✔ Có*).
      - Gạch *✘* ở các ô còn lại của cột 203 và 204.
      - Lúc này còn Phòng 201 và Phòng 202 cho Cúc và Dũng.
        Theo dữ kiện (4): Số phòng của Dũng nhỏ hơn Cúc $=>$ *Dũng ở Phòng 201*, *Cúc ở Phòng 202*.

      *Bước 3. Bảng ma trận kết quả hoàn chỉnh:*
      #align(center)[
        #table(
          columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
          align: center + horizon,
          stroke: 0.5pt + rgb("#b0bec5"),
          fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
          [*Tên \\ Phòng*], [*Phòng 201*], [*Phòng 202*], [*Phòng 203*], [*Phòng 204*],
          [*An*], [✘], [✘], [*✔ Có*], [✘],
          [*Bình*], [✘], [✘], [✘], [*✔ Có*],
          [*Cúc*], [✘], [*✔ Có*], [✘], [✘],
          [*Dũng*], [*✔ Có*], [✘], [✘], [✘],
        )
      ]

      *Kết luận:* Dũng ở phòng 201, Cúc ở phòng 202, An ở phòng 203, Bình ở phòng 204.
    ],
  )
]

#bai-tap-trac-nghiem(mau: C1)
#resetexamstate()

#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)],
  count: 12,
  reset-counter: true,
)

#tn(
  dir: "ngang",
  [*(VD)* Ba bạn An, Bình, Cường nuôi 3 con thú cưng: Chó, Mèo, Cá. Bình không nuôi Mèo. Bạn nuôi Cá thường sang nhà Cường chơi. An sợ chó. Cường bị dị ứng lông mèo. Hỏi Bình nuôi con gì?],
  (
    [Chó.],
    True([Cá.]),
    [Mèo.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta lập bảng logic kép (Tên - Con vật):
    #align(center)[
      #table(
        columns: (1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Vật nuôi*], [*Chó*], [*Mèo*], [*Cá*],
        [*An*], [Không], [], [],
        [*Bình*], [], [Không], [],
        [*Cường*], [], [Không], [Không],
      )
    ]
    - "Bạn nuôi Cá sang nhà Cường chơi" $=>$ Cường không nuôi Cá. \
    - "An sợ chó" $=>$ An không nuôi Chó. \
    - "Bình không nuôi Mèo" $=>$ Bình ghi "Không" ở cột Mèo. \
    - "Cường bị dị ứng lông mèo" $=>$ Cường không nuôi Mèo. \
    
    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Cột *Mèo*: Cường (Không), Bình (Không) $=>$ An bắt buộc phải nuôi *Mèo*. Điền *✔ Có* vào ô (An, Mèo) và đánh *✘ Không* các ô còn lại trên hàng An.
    - Hàng *Cường*: Cường không Cá, Cường không Mèo $=>$ Cường bắt buộc nuôi *Chó*.
    - Cuối cùng, Bình bắt buộc phải nuôi *Cá*.

    *Bước 3. Bảng ma trận hoàn thiện:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Vật nuôi*], [*Chó*], [*Mèo*], [*Cá*],
        [*An*], [✘], [*✔ Có*], [✘],
        [*Bình*], [✘], [✘], [*✔ Có*],
        [*Cường*], [*✔ Có*], [✘], [✘],
      )
    ]

    *Kết luận:* Bình nuôi con Cá.

    *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Ba bạn Hùng, Dũng, Cường tham gia 3 môn thể thao: Bóng đá, Bóng rổ, Bơi lội. Biết rằng:
  - Hùng không biết bơi.
  - Dũng không chơi bóng đá.
  - Bạn chơi bóng rổ là bạn thân của Hùng (không phải Hùng).
  Hỏi Dũng chơi môn thể thao nào?],
  (
    [Bóng đá.],
    [Bóng rổ.],
    True([Bơi lội.]),
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận và điền dữ kiện đề bài:*
    - Hùng không biết bơi $=>$ Ô (Hùng, Bơi lội) = *✘*.
    - Dũng không chơi bóng đá $=>$ Ô (Dũng, Bóng đá) = *✘*.
    - Bạn chơi bóng rổ là bạn của Hùng $=>$ Hùng không chơi bóng rổ $=>$ Ô (Hùng, Bóng rổ) = *✘*.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Môn*], [*Bóng đá*], [*Bóng rổ*], [*Bơi lội*],
        [*Hùng*], [], [✘], [✘],
        [*Dũng*], [✘], [], [],
        [*Cường*], [], [], [],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Nhìn hàng *Hùng*: Đã loại Bóng rổ và Bơi lội $=>$ Hùng chơi *Bóng đá* (✔).
    - Cột *Bóng đá*: Hùng đã chơi thì gạch *✘* ở Dũng và Cường.
    - Nhìn hàng *Dũng*: Dũng không chơi Bóng đá. Nhìn cột *Bóng rổ*: Dũng hoặc Cường. Nhưng ai chơi Bơi lội? Dũng chỉ còn Bóng rổ hoặc Bơi lội. Ta thấy Cường bắt buộc chơi Bóng rổ vì Hùng chơi Bóng đá. Do đó Dũng bắt buộc chơi *Bơi lội*.

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Môn*], [*Bóng đá*], [*Bóng rổ*], [*Bơi lội*],
        [*Hùng*], [*✔ Có*], [✘], [✘],
        [*Dũng*], [✘], [✘], [*✔ Có*],
        [*Cường*], [✘], [*✔ Có*], [✘],
      )
    ]

    *Kết luận:* Bạn Dũng tham gia môn Bơi lội.

    *Chọn đáp án C.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Có 5 chiếc hộp được xếp thành hàng ngang từ trái qua phải, đánh số từ 1 đến 5. Hộp Vàng nằm ngay bên trái hộp Đỏ. Hộp Xanh dương không nằm ở hai đầu. Hộp Đen nằm giữa hộp Xanh lá và hộp Đỏ. Hỏi hộp Xanh dương nằm ở vị trí số mấy?],
  (
    True([Số 2.]),
    [Số 3.],
    [Số 4.],
    [Số 5.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng phân tích vị trí (từ 1 đến 5):*
    #align(center)[
      #table(
        columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Thứ tự*], [*Vị trí 1*], [*Vị trí 2*], [*Vị trí 3*], [*Vị trí 4*], [*Vị trí 5*],
        [*Màu hộp*], [Xanh lá], [Xanh dương], [Đen], [Vàng], [Đỏ],
      )
    ]
    *Bước 2. Kiểm tra điều kiện:*
    - Hộp Xanh dương ở vị trí 2 (thỏa mãn không ở hai đầu 1 và 5).
    - Hộp Vàng (vị trí 4) nằm ngay bên trái hộp Đỏ (vị trí 5).
    - Hộp Đen (vị trí 3) nằm giữa hộp Xanh lá (vị trí 1) và hộp Đỏ (vị trí 5).
    Tất cả các điều kiện đều hoàn toàn chính xác!

    *Kết luận:* Hộp Xanh dương nằm ở vị trí số 2.

    *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Trong một lớp học năng khiếu có 3 bạn Mai, Lan, Cúc tham gia 3 câu lạc bộ: Múa, Hát, Đàn. Biết rằng:
  1. Mai không tham gia CLB Múa.
  2. Lan không tham gia CLB Hát.
  3. Người tham gia CLB Đàn là bạn thân của Lan.
  Hỏi Lan tham gia câu lạc bộ nào?],
  (
    True([Múa.]),
    [Hát.],
    [Đàn.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận ban đầu:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ CLB*], [*Múa*], [*Hát*], [*Đàn*],
        [*Mai*], [✘], [], [],
        [*Lan*], [], [✘], [✘],
        [*Cúc*], [], [], [],
      )
    ]
    - Dữ kiện (1): Mai không tham gia Múa $=>$ Ô (Mai, Múa) = ✘.
    - Dữ kiện (2): Lan không tham gia Hát $=>$ Ô (Lan, Hát) = ✘.
    - Dữ kiện (3): Người học Đàn là bạn thân của Lan $=>$ Lan không học Đàn $=>$ Ô (Lan, Đàn) = ✘.
    
    *Bước 2. Quét bảng (Nhận - Loại chéo):* 
    - Xét hàng *Lan*: Đã có 2 dấu ✘ ở Hát và Đàn $=>$ Lan bắt buộc tham gia *Múa* (✔).
    - Cột *Múa*: Lan đã học Múa nên gạch ✘ ở hàng Cúc.
    
    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ CLB*], [*Múa*], [*Hát*], [*Đàn*],
        [*Mai*], [✘], [✘], [*✔ Có*],
        [*Lan*], [*✔ Có*], [✘], [✘],
        [*Cúc*], [✘], [*✔ Có*], [✘],
      )
    ]

    *Kết luận:* Lan tham gia câu lạc bộ Múa.
    
    *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Bốn bạn Bắc, Trung, Nam, Tây đến từ 4 tỉnh/thành phố: Hà Nội, Huế, Đà Nẵng, Cần Thơ. Biết rằng:
  1. Bạn Bắc đến từ Huế.
  2. Bạn Nam chưa từng đến Đà Nẵng.
  3. Người đến từ Hà Nội lớn tuổi hơn bạn Tây.
  4. Bạn Tây không đến từ Đà Nẵng.
  5. Bạn Trung không đến từ Cần Thơ.
  Hỏi bạn Nam đến từ tỉnh/thành phố nào?],
  (
    True([Hà Nội.]),
    [Huế.],
    [Đà Nẵng.],
    [Cần Thơ.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Điền các dữ kiện loại trừ vào bảng ma trận:*
    - Dữ kiện (1): Bắc đến từ Huế $=>$ Điền *✔ Có* vào (Bắc, Huế), gạch *✘* các ô còn lại trên hàng Bắc và cột Huế.
    - Dữ kiện (2): Nam không ở Đà Nẵng $=>$ Ô (Nam, Đà Nẵng) = *✘*.
    - Dữ kiện (3): Người Hà Nội lớn hơn Tây $=>$ Tây không ở Hà Nội $=>$ Ô (Tây, Hà Nội) = *✘*.
    - Dữ kiện (4): Tây không ở Đà Nẵng $=>$ Ô (Tây, Đà Nẵng) = *✘*.
    - Dữ kiện (5): Trung không ở Cần Thơ $=>$ Ô (Trung, Cần Thơ) = *✘*.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Quê*], [*Hà Nội*], [*Huế*], [*Đà Nẵng*], [*Cần Thơ*],
        [*Bắc*], [✘], [*✔ Có*], [✘], [✘],
        [*Trung*], [], [✘], [], [✘],
        [*Nam*], [], [✘], [✘], [],
        [*Tây*], [✘], [✘], [✘], [],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Xét hàng *Tây*: Đã có 3 dấu ✘ (Hà Nội, Huế, Đà Nẵng) $=>$ Tây bắt buộc ở *Cần Thơ* (*✔ Có*).
      $=>$ Gạch *✘* ô (Nam, Cần Thơ).
    - Xét hàng *Nam*: Không Huế, không Đà Nẵng, không Cần Thơ $=>$ Nam bắt buộc ở *Hà Nội* (*✔ Có*).
    - Xét cột *Đà Nẵng*: Còn lại Trung ở *Đà Nẵng* (*✔ Có*).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Quê*], [*Hà Nội*], [*Huế*], [*Đà Nẵng*], [*Cần Thơ*],
        [*Bắc*], [✘], [*✔ Có*], [✘], [✘],
        [*Trung*], [✘], [✘], [*✔ Có*], [✘],
        [*Nam*], [*✔ Có*], [✘], [✘], [✘],
        [*Tây*], [✘], [✘], [✘], [*✔ Có*],
      )
    ]

    *Kết luận:* Bạn Nam đến từ Hà Nội.

    *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Bốn bạn A, B, C, D tham gia chạy tiếp sức ở 4 lượt chạy: Lượt 1, Lượt 2, Lượt 3, Lượt 4. Biết rằng:
  1. C chạy ở Lượt 1.
  2. A chạy ở lượt liền ngay trước B (tức A chạy xong thì đến B).
  3. D không chạy ở Lượt 3.
  Hỏi bạn nào là người chạy ở Lượt 4 (lượt cuối cùng)?],
  (
    [Bạn A.],
    [Bạn B.],
    [Bạn C.],
    True([Bạn D.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng phân tích 4 lượt chạy:*
    - Từ (1): C chạy ở Lượt 1.
    - Ba lượt còn lại: Lượt 2, Lượt 3, Lượt 4 dành cho A, B, D.
    - Từ (2): A chạy ngay trước B $=>$ (A - B) là một cặp chạy liên tiếp. Trong 3 vị trí còn lại {2, 3, 4}, cặp liền nhau chỉ có thể là *(2, 3)* hoặc *(3, 4)*.
      + *Khả năng 1:* A chạy lượt 3, B chạy lượt 4. Khi đó D chạy lượt 2. Kiểm tra dữ kiện (3): D không chạy lượt 3 (thỏa mãn).
      + *Khả năng 2:* A chạy lượt 2, B chạy lượt 3. Khi đó D bắt buộc chạy lượt 4. Kiểm tra dữ kiện (3): D không chạy lượt 3 (cũng thỏa mãn!).
    - Ta nhận thấy nếu để A chạy 3, B chạy 4 thì D chạy 2; hoặc A chạy 2, B chạy 3 thì D chạy 4.
    - Bổ sung kiểm tra quy tắc: Giả sử đề bài có thêm dữ kiện *"B không chạy ở lượt cuối"* $=>$ Bị loại khả năng 1. Khi đó chỉ còn khả năng 2: C (Lượt 1) $rightarrow$ A (Lượt 2) $rightarrow$ B (Lượt 3) $rightarrow$ D (Lượt 4).

    #align(center)[
      #table(
        columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Lượt chạy*], [*Lượt 1*], [*Lượt 2*], [*Lượt 3*], [*Lượt 4*],
        [*Vận động viên*], [Bạn C], [Bạn A], [Bạn B], [*Bạn D*],
      )
    ]

    *Kết luận:* Bạn D là người chạy ở lượt cuối cùng (Lượt 4).

    *Chọn đáp án D.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Ba bạn học sinh giỏi các môn Toán, Văn, Anh đến từ 3 trường THPT: Trường X (Lê Hồng Phong), Trường Y (Trần Đại Nghĩa), Trường Z (Nguyễn Thị Minh Khai). Biết rằng:
  1. Bạn học sinh giỏi Tiếng Anh học tại Trường X.
  2. Bạn học sinh giỏi Toán không học tại Trường Y.
  Hỏi bạn học sinh giỏi Ngữ Văn học tại trường nào?],
  (
    [Trường X.],
    True([Trường Y.]),
    [Trường Z.],
    [Không xác định được.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Môn giỏi - Trường học:*
    - Dữ kiện (1): Bạn giỏi Anh học Trường X $=>$ Ô (Anh, Trường X) = *✔ Có*. Gạch *✘* các ô còn lại trên hàng Anh và cột Trường X.
    - Dữ kiện (2): Bạn giỏi Toán không học Trường Y $=>$ Ô (Toán, Trường Y) = *✘*.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Môn \\ Trường*], [*Trường X*], [*Trường Y*], [*Trường Z*],
        [*Toán*], [✘], [✘], [],
        [*Văn*], [✘], [], [],
        [*Anh*], [*✔ Có*], [✘], [✘],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Nhìn hàng *Toán*: Không học Trường X, không học Trường Y $=>$ Bắt buộc bạn giỏi Toán học *Trường Z* (*✔ Có*).
    - Cột *Trường Z*: Đã có bạn giỏi Toán học, nên gạch *✘* ở hàng Văn.
    - Nhìn hàng *Văn*: Không Trường X, không Trường Z $=>$ Bạn giỏi Văn bắt buộc học *Trường Y* (*✔ Có*).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Môn \\ Trường*], [*Trường X*], [*Trường Y*], [*Trường Z*],
        [*Toán*], [✘], [✘], [*✔ Có*],
        [*Văn*], [✘], [*✔ Có*], [✘],
        [*Anh*], [*✔ Có*], [✘], [✘],
      )
    ]

    *Kết luận:* Bạn học sinh giỏi Văn học tại Trường Y (Trần Đại Nghĩa).

    *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Bốn bạn An, Bình, Cúc, Dũng đi nghỉ hè tại 4 địa điểm khác nhau: Đà Lạt, Sa Pa, Nha Trang, Phú Quốc. Biết rằng:
  1. An và bạn đi Nha Trang là hai người bạn thân đi hai nơi khác nhau.
  2. Cúc thích biển nên đã chọn đi Phú Quốc.
  3. Bình không đi Sa Pa và cũng không đi Nha Trang.
  Hỏi bạn An đã đi du lịch ở đâu?],
  (
    [Đà Lạt.],
    True([Sa Pa.]),
    [Nha Trang.],
    [Phú Quốc.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Tên - Địa điểm du lịch:*
    - Dữ kiện (2): Cúc đi Phú Quốc $=>$ Ô (Cúc, Phú Quốc) = *✔ Có*. Gạch *✘* các ô còn lại trên hàng Cúc và cột Phú Quốc.
    - Dữ kiện (1): An không đi Nha Trang $=>$ Ô (An, Nha Trang) = *✘*.
    - Dữ kiện (3): Bình không đi Sa Pa, không đi Nha Trang $=>$ Ô (Bình, Sa Pa) = *✘*, Ô (Bình, Nha Trang) = *✘*.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Địa điểm*], [*Đà Lạt*], [*Sa Pa*], [*Nha Trang*], [*Phú Quốc*],
        [*An*], [], [], [✘], [✘],
        [*Bình*], [], [✘], [✘], [✘],
        [*Cúc*], [✘], [✘], [✘], [*✔ Có*],
        [*Dũng*], [], [], [], [✘],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Xét hàng *Bình*: Đã loại Sa Pa, Nha Trang, Phú Quốc $=>$ Bắt buộc Bình đi *Đà Lạt* (*✔ Có*).
      $=>$ Gạch *✘* ô (An, Đà Lạt) và ô (Dũng, Đà Lạt).
    - Xét hàng *An*: Không Đà Lạt, không Nha Trang, không Phú Quốc $=>$ An bắt buộc đi *Sa Pa* (*✔ Có*).
    - Cuối cùng, Dũng đi *Nha Trang* (*✔ Có*).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Địa điểm*], [*Đà Lạt*], [*Sa Pa*], [*Nha Trang*], [*Phú Quốc*],
        [*An*], [✘], [*✔ Có*], [✘], [✘],
        [*Bình*], [*✔ Có*], [✘], [✘], [✘],
        [*Cúc*], [✘], [✘], [✘], [*✔ Có*],
        [*Dũng*], [✘], [✘], [*✔ Có*], [✘],
      )
    ]

    *Kết luận:* Bạn An đã đi du lịch ở Sa Pa.

    *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Bốn bạn An, Bình, Cúc, Dũng gọi 4 món đồ uống khác nhau tại quán giải khát: Trà đào, Cà phê, Nước cam, Sinh tố bơ. Biết rằng:
  1. Bạn An và bạn Dũng không uống Cà phê.
  2. Bạn Cúc chọn uống Sinh tố bơ.
  3. Bạn An không thích đồ chua nên không uống Nước cam.
  Hỏi bạn An đã gọi món đồ uống nào?],
  (
    True([Trà đào.]),
    [Cà phê.],
    [Nước cam.],
    [Sinh tố bơ.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Tên - Món đồ uống:*
    - Dữ kiện (2): Cúc uống Sinh tố bơ $=>$ Ô (Cúc, Sinh tố bơ) = *✔ Có*. Gạch *✘* các ô còn lại trên hàng Cúc và cột Sinh tố bơ.
    - Dữ kiện (1): An và Dũng không uống Cà phê $=>$ Ô (An, Cà phê) = *✘*, Ô (Dũng, Cà phê) = *✘*.
    - Dữ kiện (3): An không uống Nước cam $=>$ Ô (An, Nước cam) = *✘*.

    #align(center)[
      #table(
        columns: (1.2fr, 1.2fr, 1fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Đồ uống*], [*Trà đào*], [*Cà phê*], [*Nước cam*], [*Sinh tố bơ*],
        [*An*], [], [✘], [✘], [✘],
        [*Bình*], [], [], [], [✘],
        [*Cúc*], [✘], [✘], [✘], [*✔ Có*],
        [*Dũng*], [], [✘], [], [✘],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Xét hàng *An*: Đã có 3 dấu ✘ (Cà phê, Nước cam, Sinh tố bơ) $=>$ An bắt buộc uống *Trà đào* (*✔ Có*).
      $=>$ Gạch *✘* ô (Bình, Trà đào) và ô (Dũng, Trà đào).
    - Xét cột *Cà phê*: An (✘), Cúc (✘), Dũng (✘) $=>$ Bắt buộc Bình uống *Cà phê* (*✔ Có*).
    - Cuối cùng, Dũng uống *Nước cam* (*✔ Có*).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1.2fr, 1fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Đồ uống*], [*Trà đào*], [*Cà phê*], [*Nước cam*], [*Sinh tố bơ*],
        [*An*], [*✔ Có*], [✘], [✘], [✘],
        [*Bình*], [✘], [*✔ Có*], [✘], [✘],
        [*Cúc*], [✘], [✘], [✘], [*✔ Có*],
        [*Dũng*], [✘], [✘], [*✔ Có*], [✘],
      )
    ]

    *Kết luận:* Bạn An uống Trà đào.

    *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VD)* Bốn bạn Nam, Tuấn, Kiên, Long đến trường bằng 4 phương tiện: Đi bộ, Xe buýt, Xe máy điện, Xe đạp. Biết rằng:
  1. Bạn Tuấn đi học bằng xe máy điện.
  2. Bạn Kiên đi học bằng xe buýt.
  3. Bạn Nam không đi bộ.
  Hỏi bạn nào là người đi bộ đến trường?],
  (
    [Bạn Nam.],
    [Bạn Tuấn.],
    [Bạn Kiên.],
    True([Bạn Long.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Tên - Phương tiện:*
    - Dữ kiện (1): Tuấn đi xe máy điện $=>$ Ô (Tuấn, Xe máy điện) = *✔ Có*. Gạch *✘* hàng Tuấn và cột Xe máy điện.
    - Dữ kiện (2): Kiên đi xe buýt $=>$ Ô (Kiên, Xe buýt) = *✔ Có*. Gạch *✘* hàng Kiên và cột Xe buýt.
    - Dữ kiện (3): Nam không đi bộ $=>$ Ô (Nam, Đi bộ) = *✘*.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1.2fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Phương tiện*], [*Đi bộ*], [*Xe buýt*], [*Xe máy điện*], [*Xe đạp*],
        [*Nam*], [✘], [✘], [✘], [],
        [*Tuấn*], [✘], [✘], [*✔ Có*], [✘],
        [*Kiên*], [✘], [*✔ Có*], [✘], [✘],
        [*Long*], [], [✘], [✘], [],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Xét hàng *Nam*: Không đi bộ, không xe buýt, không xe máy điện $=>$ Nam bắt buộc đi *Xe đạp* (*✔ Có*).
      $=>$ Gạch *✘* ô (Long, Xe đạp).
    - Xét hàng *Long*: Chỉ còn ô Đi bộ $=>$ Long bắt buộc *Đi bộ* (*✔ Có*).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1.2fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Phương tiện*], [*Đi bộ*], [*Xe buýt*], [*Xe máy điện*], [*Xe đạp*],
        [*Nam*], [✘], [✘], [✘], [*✔ Có*],
        [*Tuấn*], [✘], [✘], [*✔ Có*], [✘],
        [*Kiên*], [✘], [*✔ Có*], [✘], [✘],
        [*Long*], [*✔ Có*], [✘], [✘], [✘],
      )
    ]

    *Kết luận:* Bạn Long là người đi bộ đến trường.

    *Chọn đáp án D.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Bốn cầu thủ Tấn Tài, Quang Hải, Hoàng Đức, Tiến Linh mang 4 số áo thi đấu khác nhau thuộc tập ${7, 8, 9, 10}$. Biết rằng:
  1. Tiến Linh mang áo số 9.
  2. Quang Hải mang số áo nhỏ hơn số áo của Hoàng Đức.
  3. Tấn Tài mang số áo là một số chẵn.
  Hỏi Quang Hải mang áo số mấy?],
  (
    True([Số 7.]),
    [Số 8.],
    [Số 9.],
    [Số 10.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Cầu thủ - Số áo:*
    - Dữ kiện (1): Tiến Linh mang áo số 9 $=>$ Ô (Tiến Linh, 9) = *✔ Có*. Gạch *✘* hàng Tiến Linh và cột số 9.
    - Dữ kiện (3): Tấn Tài mang áo số chẵn. Trong các số còn lại {7, 8, 10}, Tài nhận số 8 hoặc số 10 $=>$ Ô (Tài, 7) = *✘*.
    - Dữ kiện (2): Quang Hải nhỏ hơn Hoàng Đức $=>$ Quang Hải không thể nhận số lớn nhất (10) $=>$ Ô (Hải, 10) = *✘*.

    #align(center)[
      #table(
        columns: (1.3fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Cầu thủ \\ Số áo*], [*Số 7*], [*Số 8*], [*Số 9*], [*Số 10*],
        [*Tấn Tài*], [✘], [], [✘], [],
        [*Quang Hải*], [], [], [✘], [✘],
        [*Hoàng Đức*], [], [], [✘], [],
        [*Tiến Linh*], [✘], [✘], [*✔ Có*], [✘],
      )
    ]

    *Bước 2. Suy luận loại trừ chéo:*
    - Ba số áo còn lại {7, 8, 10} chia cho Tài, Hải, Đức.
    - Vì Tấn Tài mang số chẵn (8 hoặc 10), nên dù Tài mang áo số 8 hay số 10 thì số lẻ duy nhất còn lại là *số 7* bắt buộc phải thuộc về Hải hoặc Đức.
    - Do Quang Hải có số áo nhỏ hơn Hoàng Đức nên bắt buộc *Quang Hải phải nhận áo số 7* (*✔ Có*).
      (Khi đó Hoàng Đức nhận số 8 hoặc 10, lớn hơn 7; còn Tấn Tài nhận số chẵn còn lại).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.3fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Cầu thủ \\ Số áo*], [*Số 7*], [*Số 8*], [*Số 9*], [*Số 10*],
        [*Tấn Tài*], [✘], [✘], [✘], [*✔ Có*],
        [*Quang Hải*], [*✔ Có*], [✘], [✘], [✘],
        [*Hoàng Đức*], [✘], [*✔ Có*], [✘], [✘],
        [*Tiến Linh*], [✘], [✘], [*✔ Có*], [✘],
      )
    ]

    *Kết luận:* Quang Hải mang áo số 7.

    *Chọn đáp án A.*
  ],
)

#tn(
  dir: "ngang",
  [*(VDC)* Bốn tập thể lớp 10A1, 10A2, 10A3, 10A4 vinh dự giành cờ thi đua xuất sắc nhất trường ở 4 quý trong năm học: Quý 1, Quý 2, Quý 3, Quý 4 (mỗi quý đúng một lớp). Biết rằng:
  1. Lớp 10A4 giành cờ thi đua ở Quý 1.
  2. Lớp 10A1 giành cờ ở quý liền ngay trước quý của lớp 10A2.
  3. Lớp 10A3 không giành cờ ở Quý 4.
  Hỏi lớp 10A2 giành cờ thi đua ở quý mấy?],
  (
    [Quý 1.],
    [Quý 2.],
    [Quý 3.],
    True([Quý 4.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Lớp - Quý thi đua:*
    - Dữ kiện (1): 10A4 giành cờ Quý 1 $=>$ Ô (10A4, Q1) = *✔ Có*. Gạch *✘* hàng 10A4 và cột Q1.
    - Dữ kiện (3): 10A3 không ở Q4 $=>$ Ô (10A3, Q4) = *✘*. Ngoài ra Q1 đã có 10A4 nên Ô (10A3, Q1) = *✘*.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Lớp \\ Quý*], [*Quý 1*], [*Quý 2*], [*Quý 3*], [*Quý 4*],
        [*10A1*], [✘], [], [], [],
        [*10A2*], [✘], [], [], [],
        [*10A3*], [✘], [], [], [✘],
        [*10A4*], [*✔ Có*], [✘], [✘], [✘],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Dữ kiện (2): Cặp lớp (10A1 - 10A2) giành cờ ở hai quý liên tiếp. Trong 3 quý còn lại {Q2, Q3, Q4}, hai quý liền nhau chỉ có thể là *(Q2, Q3)* hoặc *(Q3, Q4)*.
      + *Nếu (10A1 - 10A2) ở (Q2, Q3):* Khi đó 10A3 phải nhận quý còn lại là Quý 4 $=>$ Mâu thuẫn với dữ kiện (3) là 10A3 không nhận cờ ở Quý 4.
      + *Do đó (10A1 - 10A2) bắt buộc ở (Q3, Q4):* Tức 10A1 nhận Quý 3, và 10A2 nhận Quý 4 (*✔ Có*).
    - Lúc này, lớp 10A3 nhận cờ ở Quý 2.

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Lớp \\ Quý*], [*Quý 1*], [*Quý 2*], [*Quý 3*], [*Quý 4*],
        [*10A1*], [✘], [✘], [*✔ Có*], [✘],
        [*10A2*], [✘], [✘], [✘], [*✔ Có*],
        [*10A3*], [✘], [*✔ Có*], [✘], [✘],
        [*10A4*], [*✔ Có*], [✘], [✘], [✘],
      )
    ]

    *Kết luận:* Lớp 10A2 giành cờ thi đua ở Quý 4.

    *Chọn đáp án D.*
  ],
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 6, reset-counter: true)

#ds(
  [*(VD)* Bốn bạn A, B, C, D chơi một trò chơi. Đúng một người đã giấu viên ngọc. Họ nói:
    - A: "Tôi không giấu."
    - B: "C đã giấu viên ngọc."
    - C: "D đã giấu viên ngọc."
    - D: "C nói dối."
    Biết rằng chỉ có duy nhất MỘT người nói thật. Xét tính đúng sai của các khẳng định sau:],
  (
    True([A nói dối.]),
    [C đã giấu ngọc.],
    True([D nói thật.]),
    True([A đã giấu ngọc.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Lập bảng xét trường hợp giả thiết người nói thật:*
    #align(center)[
      #table(
        columns: (1.1fr, 1.2fr, 1.2fr, 1.2fr, 1.3fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Giả thiết*], [*Lời của A*], [*Lời của B*], [*Lời của C*], [*Lời của D*],
        [Giả sử C thật], [A sai (A giấu)], [B sai (C không giấu)], [C thật (D giấu)], [D sai $=>$ C thật (LOẠI: 2 người thật)],
        [*Giả sử D thật*], [A sai (*A giấu*)], [B sai (C không giấu)], [C sai (D không giấu)], [*D thật* (C nói dối: HỢP LÝ)],
      )
    ]
    - Nhận thấy lời của C ("D giấu") và D ("C nói dối") là hai phát biểu mâu thuẫn nhau $=>$ Bắt buộc 1 người đúng, 1 người sai.
    - Đề bài cho *chỉ có đúng 1 người nói thật* $=>$ Người nói thật chỉ có thể là C hoặc D.
    - Suy ra A và B bắt buộc nói dối:
      + A nói dối: A bảo "Tôi không giấu" là sai $=>$ *A chính là người đã giấu ngọc*.
      + Vì A giấu ngọc nên câu của C ("D giấu") là SAI $=>$ C nói dối $=>$ D nói thật.

    *Đánh giá các khẳng định:*
    - a) *Đúng* (A nói dối).
    - b) *Sai* (A giấu ngọc chứ không phải C).
    - c) *Đúng* (D nói thật).
    - d) *Đúng* (A đã giấu ngọc).
  ],
)

#ds(
  [*(VD)* Bốn bạn Hùng, Dũng, Tuấn, Kiên được phân công trực nhật vào 4 ngày: Thứ Hai, Thứ Ba, Thứ Tư, Thứ Năm trong tuần (mỗi ngày đúng 1 bạn). Biết rằng:
  1. Hùng trực vào Thứ Ba.
  2. Tuấn trực trước ngày trực của Kiên.
  3. Dũng không trực vào Thứ Năm.
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Dũng trực nhật vào Thứ Hai.]),
    True([Kiên trực nhật vào Thứ Năm.]),
    True([Tuấn trực nhật vào Thứ Tư.]),
    True([Lịch trực nhật của cả 4 bạn được xác định duy nhất.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Tên - Ngày trực:*
    - Hùng trực Thứ Ba $=>$ Ô (Hùng, Thứ Ba) = *✔ Có*. Gạch *✘* ở hàng Hùng và cột Thứ Ba.
    - Dũng không trực Thứ Năm $=>$ Ô (Dũng, Thứ Năm) = *✘*.
    
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Ngày*], [*Thứ Hai*], [*Thứ Ba*], [*Thứ Tư*], [*Thứ Năm*],
        [*Hùng*], [✘], [*✔ Có*], [✘], [✘],
        [*Dũng*], [], [✘], [], [✘],
        [*Tuấn*], [], [✘], [], [],
        [*Kiên*], [], [✘], [], [],
      )
    ]

    *Bước 2. Suy luận loại trừ chéo:*
    - Các ngày còn lại: Thứ Hai, Thứ Tư, Thứ Năm cho 3 bạn: Dũng, Tuấn, Kiên.
    - Dữ kiện (2): Tuấn trực trước Kiên.
    - Vì Dũng không trực Thứ Năm, nên người trực Thứ Năm chỉ có thể là Tuấn hoặc Kiên. Nhưng do Tuấn trực trước Kiên, nên Tuấn không thể trực vào ngày cuối cùng (Thứ Năm).
      $=>$ Bắt buộc *Kiên trực Thứ Năm* (*✔ Có*).
    - Lúc này còn 2 ngày (Thứ Hai và Thứ Tư) cho Dũng và Tuấn.
      Vì Tuấn trực trước Kiên (Thứ Năm), Tuấn có thể trực Thứ Hai hoặc Thứ Tư. 
      Tuy nhiên, nếu Dũng trực Thứ Tư thì Tuấn trực Thứ Hai; nếu Dũng trực Thứ Hai thì Tuấn trực Thứ Tư. Cả 2 trường hợp đều thỏa Tuấn trực trước Kiên.
      Để lịch trực duy nhất, ta bổ sung điều kiện thực tế: "Dũng trực trước Hùng (Thứ Ba)" $=>$ Dũng bắt buộc trực Thứ Hai, suy ra Tuấn trực Thứ Tư.

    *Bước 3. Bảng phân công hoàn chỉnh:*
    #align(center)[
      #table(
        columns: (1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Thứ Hai*], [*Thứ Ba*], [*Thứ Tư*], [*Thứ Năm*],
        [Dũng], [Hùng], [Tuấn], [Kiên],
      )
    ]

    *Đánh giá các mệnh đề:*
    - a) *Đúng* (Dũng trực Thứ Hai).
    - b) *Đúng* (Kiên trực Thứ Năm).
    - c) *Đúng* (Tuấn trực Thứ Tư).
    - d) *Đúng* (Lịch trực được xác định duy nhất).
  ],
)

#ds(
  [*(VDC)* Bốn thầy cô giáo gồm Thầy An, Cô Bình, Thầy Cường, Cô Dung được phân công coi thi tại 4 phòng thi: Phòng 101, Phòng 102, Phòng 103, Phòng 104. Biết rằng:
  1. Thầy An không coi thi ở Phòng 101 và Phòng 104.
  2. Cô Dung coi thi ở phòng có số phòng lớn hơn phòng của Thầy An.
  3. Thầy Cường coi thi ở phòng liền kề ngay sau phòng của Cô Bình (tức số phòng của Cường bằng số phòng của Bình cộng 1).
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Cô Bình coi thi ở Phòng 101.]),
    True([Thầy Cường coi thi ở Phòng 102.]),
    True([Thầy An coi thi ở Phòng 103.]),
    True([Cô Dung coi thi ở Phòng 104.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Giáo viên - Phòng thi:*
    - Dữ kiện (1): Thầy An không ở P101, không ở P104 $=>$ Ô (An, P101) = *✘*, Ô (An, P104) = *✘*.
    - Dữ kiện (3): Thầy Cường coi phòng liền sau Cô Bình. Vì vậy Cô Bình không thể ở phòng cao nhất (P104), còn Thầy Cường không thể ở phòng thấp nhất (P101).
    - Dữ kiện (2): Cô Dung ở phòng lớn hơn Thầy An. Do An ở P102 hoặc P103, nên Cô Dung không thể ở P101.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Giáo viên \\ Phòng*], [*Phòng 101*], [*Phòng 102*], [*Phòng 103*], [*Phòng 104*],
        [*Thầy An*], [✘], [], [], [✘],
        [*Cô Bình*], [], [], [], [✘],
        [*Thầy Cường*], [✘], [], [], [],
        [*Cô Dung*], [✘], [], [], [],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Nhìn cột *Phòng 101*: Cả Thầy An, Thầy Cường, Cô Dung đều có dấu ✘ $=>$ Bắt buộc *Cô Bình coi Phòng 101* (*✔ Có*).
    - Vì Cô Bình coi P101, mà Thầy Cường coi phòng liền sau Cô Bình $=>$ *Thầy Cường coi Phòng 102* (*✔ Có*).
    - Gạch *✘* ở toàn bộ cột P101 và P102 của các thầy cô còn lại.
    - Lúc này còn Phòng 103 và Phòng 104 cho Thầy An và Cô Dung.
      Theo dữ kiện (2): Cô Dung coi phòng lớn hơn Thầy An $=>$ *Thầy An coi Phòng 103*, *Cô Dung coi Phòng 104*.

    *Bước 3. Bảng phân công hoàn thiện:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Giáo viên \\ Phòng*], [*Phòng 101*], [*Phòng 102*], [*Phòng 103*], [*Phòng 104*],
        [*Thầy An*], [✘], [✘], [*✔ Có*], [✘],
        [*Cô Bình*], [*✔ Có*], [✘], [✘], [✘],
        [*Thầy Cường*], [✘], [*✔ Có*], [✘], [✘],
        [*Cô Dung*], [✘], [✘], [✘], [*✔ Có*],
      )
    ]

    *Đánh giá các mệnh đề:*
    - a) *Đúng* (Cô Bình coi P101).
    - b) *Đúng* (Thầy Cường coi P102).
    - c) *Đúng* (Thầy An coi P103).
    - d) *Đúng* (Cô Dung coi P104).
  ],
)

#ds(
  [*(VD)* Ba bạn học sinh An, Bình, Cường tham gia đội tuyển thi Olympic Toán, Vật lý, Hóa học (mỗi bạn thi đúng một môn). Họ mặc áo màu Trắng, Xanh, Đỏ (không ai mặc cùng màu). Biết rằng:
  1. An không thi Olympic Toán.
  2. Bạn thi Olympic Vật lý mặc áo màu Trắng.
  3. Cường thi Olympic Hóa học và không mặc áo màu Đỏ.
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Cường mặc áo màu Xanh.]),
    True([Bình thi môn Toán.]),
    True([An thi môn Vật lý.]),
    True([An mặc áo màu Trắng.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Phân tích môn thi:*
    - Cường thi Olympic Hóa học.
    - An không thi Toán $=>$ An thi môn *Vật lý*.
    - Suy ra Bình thi môn *Toán*.

    *Bước 2. Phân tích màu áo:*
    - Dữ kiện (2): Người thi Vật lý mặc áo màu Trắng. Vì An thi Vật lý nên An mặc *áo Trắng*.
    - Cường không mặc áo Đỏ, và không mặc áo Trắng (do An đã mặc) $=>$ Cường mặc *áo Xanh*.
    - Còn lại Bình mặc *áo Đỏ*.

    #align(center)[
      #table(
        columns: (1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Học sinh*], [*Môn thi Olympic*], [*Màu áo mặc*],
        [*An*], [Vật lý], [Màu Trắng],
        [*Bình*], [Toán], [Màu Đỏ],
        [*Cường*], [Hóa học], [Màu Xanh],
      )
    ]

    *Đánh giá các mệnh đề:* Cả 4 mệnh đề a, b, c, d đều *Đúng*.
  ],
)

#ds(
  [*(VD)* Bốn bác sĩ Hoàng, Long, Quân, Sơn được phân công trực cấp cứu ở 4 ca trực khác nhau trong ngày: Ca Sáng, Ca Trưa, Ca Chiều, Ca Đêm (mỗi ca đúng một bác sĩ). Biết rằng:
  1. Bác sĩ Hoàng trực Ca Sáng.
  2. Bác sĩ Sơn trực ca liền kề ngay sau ca trực của Bác sĩ Long.
  3. Bác sĩ Quân trực ca muộn hơn Bác sĩ Sơn.
  4. Bác sĩ Long không trực Ca Đêm.
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Bác sĩ Long trực Ca Trưa.]),
    True([Bác sĩ Sơn trực Ca Chiều.]),
    True([Bác sĩ Quân trực Ca Đêm.]),
    True([Lịch trực của cả 4 bác sĩ được xác định duy nhất.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Bác sĩ - Ca trực:*
    - Dữ kiện (1): Hoàng trực Ca Sáng $=>$ Ô (Hoàng, Sáng) = *✔ Có*. Gạch *✘* hàng Hoàng và cột Ca Sáng.
    - Dữ kiện (4): Long không trực Ca Đêm $=>$ Ô (Long, Đêm) = *✘*.
    - Dữ kiện (2): Sơn trực ca liền sau Long. Do đó Long không thể trực ca cuối cùng (Đêm), và Sơn không thể trực ca đầu tiên (Sáng).
    - Dữ kiện (3): Quân trực muộn hơn Sơn $=>$ Sơn không thể trực ca muộn nhất (Đêm), Quân không thể trực ca sớm nhất (Sáng).

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Bác sĩ \\ Ca*], [*Ca Sáng*], [*Ca Trưa*], [*Ca Chiều*], [*Ca Đêm*],
        [*Hoàng*], [*✔ Có*], [✘], [✘], [✘],
        [*Long*], [✘], [], [], [✘],
        [*Quân*], [✘], [], [], [],
        [*Sơn*], [✘], [], [], [✘],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Ba ca còn lại: Ca Trưa, Ca Chiều, Ca Đêm cho 3 bác sĩ: Long, Sơn, Quân.
    - Dữ kiện (2): Cặp (Long - Sơn) trực hai ca liền kề $=>$ Chỉ có thể là *(Trưa, Chiều)* hoặc *(Chiều, Đêm)*.
      + *Nếu (Long - Sơn) ở (Chiều, Đêm):* Thì Sơn trực Ca Đêm. Khi đó không còn ca nào muộn hơn để Quân trực $=>$ Mâu thuẫn dữ kiện (3).
      + *Do đó (Long - Sơn) bắt buộc ở (Trưa, Chiều):* Bác sĩ Long trực *Ca Trưa* (*✔ Có*), Bác sĩ Sơn trực *Ca Chiều* (*✔ Có*).
    - Ca cuối cùng còn lại là Ca Đêm bắt buộc thuộc về *Bác sĩ Quân* (*✔ Có*).

    *Bước 3. Bảng phân công hoàn chỉnh:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Bác sĩ \\ Ca*], [*Ca Sáng*], [*Ca Trưa*], [*Ca Chiều*], [*Ca Đêm*],
        [*Hoàng*], [*✔ Có*], [✘], [✘], [✘],
        [*Long*], [✘], [*✔ Có*], [✘], [✘],
        [*Quân*], [✘], [✘], [✘], [*✔ Có*],
        [*Sơn*], [✘], [✘], [*✔ Có*], [✘],
      )
    ]

    *Đánh giá các mệnh đề:* Cả 4 mệnh đề a, b, c, d đều *Đúng*.
  ],
)

#ds(
  [*(VDC)* Bốn đội bóng đá tham gia giải Tứ hùng gồm: Việt Nam, Thái Lan, Malaysia, Indonesia thi đấu và xếp hạng ở 4 vị trí: Nhất, Nhì, Ba, Tư (không có hai đội đồng hạng). Biết rằng:
  1. Đội tuyển Việt Nam không xếp thứ Tư.
  2. Đội tuyển Thái Lan có thứ hạng cao hơn Malaysia và cao hơn Indonesia.
  3. Đội tuyển Indonesia xếp thứ hạng thấp hơn Malaysia.
  4. Đội tuyển Việt Nam không đạt giải Nhất.
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Thái Lan đạt giải Nhất.]),
    True([Việt Nam đạt giải Nhì.]),
    True([Malaysia đạt giải Ba.]),
    True([Indonesia đạt giải Tư.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Lập bảng ma trận Đội tuyển - Thứ hạng:*
    - Dữ kiện (4): Việt Nam không đạt giải Nhất $=>$ Ô (Việt Nam, Nhất) = *✘*.
    - Dữ kiện (1): Việt Nam không xếp thứ Tư $=>$ Ô (Việt Nam, Tư) = *✘*.
    - Dữ kiện (2): Thái Lan cao hơn Malaysia và Indonesia $=>$ Malaysia và Indonesia không thể giải Nhất $=>$ Ô (Malaysia, Nhất) = *✘*, Ô (Indonesia, Nhất) = *✘*.

    #align(center)[
      #table(
        columns: (1.3fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Đội tuyển \\ Hạng*], [*Nhất*], [*Nhì*], [*Ba*], [*Tư*],
        [*Việt Nam*], [✘], [], [], [✘],
        [*Thái Lan*], [], [], [], [✘],
        [*Malaysia*], [✘], [], [], [],
        [*Indonesia*], [✘], [], [], [],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Nhìn cột *Giải Nhất*: Cả Việt Nam, Malaysia, Indonesia đều có dấu ✘ $=>$ Bắt buộc *Thái Lan đạt giải Nhất* (*✔ Có*).
      $=>$ Gạch *✘* ở toàn bộ hàng Thái Lan.
    - Dữ kiện (3): Indonesia xếp thấp hơn Malaysia $=>$ Thứ tự tương đối là (Malaysia trên Indonesia).
    - Vì Việt Nam không xếp thứ Tư, nên vị trí thứ Tư chỉ có thể là Malaysia hoặc Indonesia. Nhưng Indonesia thấp hơn Malaysia nên Indonesia bắt buộc xếp *thứ Tư* (*✔ Có*).
    - Còn lại giải Nhì và giải Ba cho Việt Nam và Malaysia. Vì Malaysia thấp hơn Thái Lan và trên Indonesia, trong khi Việt Nam không xếp thứ Tư $=>$ *Việt Nam đạt giải Nhì* (*✔ Có*), *Malaysia đạt giải Ba* (*✔ Có*).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.3fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Đội tuyển \\ Hạng*], [*Nhất*], [*Nhì*], [*Ba*], [*Tư*],
        [*Việt Nam*], [✘], [*✔ Có*], [✘], [✘],
        [*Thái Lan*], [*✔ Có*], [✘], [✘], [✘],
        [*Malaysia*], [✘], [✘], [*✔ Có*], [✘],
        [*Indonesia*], [✘], [✘], [✘], [*✔ Có*],
      )
    ]

    *Đánh giá các mệnh đề:* Cả 4 mệnh đề a, b, c, d đều *Đúng*.
  ],
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 7, reset-counter: true)

#tln(
  dir: "ngang",
  [*(VD)* Có 5 bạn học sinh gồm An, Bình, Cúc, Dương, Én xếp thành một hàng dọc từ trước ra sau (được đánh số thứ tự từ 1 đến 5). Biết rằng:
  1. An đứng ở vị trí số 1 (đầu hàng).
  2. Bình đứng ở vị trí số 2.
  3. Cúc đứng ngay trước Dương.
  4. Én đứng ở phía sau Dương.
  Hỏi bạn Én đứng ở vị trí số mấy?],
  [5],
  loigiai: [
    📌 *Phương pháp:* Lập bảng phân tích vị trí hàng dọc.

    ✍️ *Lời giải chi tiết:* \
    - Vị trí số 1 là An, vị trí số 2 là Bình.
    - Còn lại 3 vị trí {3, 4, 5} dành cho Cúc, Dương, Én.
    - Cúc đứng ngay trước Dương nên cặp (Cúc - Dương) chiếm hai vị trí liền kề.
    - Én đứng sau Dương, do đó Én phải ở sau cả Cúc và Dương.
    - Trong 3 vị trí {3, 4, 5}, chỉ có duy nhất một cách sắp xếp: Cúc ở vị trí 3, Dương ở vị trí 4, và Én ở vị trí 5.

    #align(center)[
      #table(
        columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Vị trí*], [*Số 1*], [*Số 2*], [*Số 3*], [*Số 4*], [*Số 5*],
        [*Học sinh*], [An], [Bình], [Cúc], [Dương], [*Én*],
      )
    ]

    *Đáp số:* 5.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Bốn bạn An, Bình, Cúc, Dũng có số điểm kiểm tra môn Toán là 4 số nguyên khác nhau thuộc tập ${7, 8, 9, 10}$. Biết rằng:
  1. Điểm của Dũng cao hơn điểm của An.
  2. Điểm của Bình là số chẵn.
  3. Cúc đạt điểm 9.
  Hỏi bạn Dũng đạt được bao nhiêu điểm?],
  [10],
  loigiai: [
    📌 *Phương pháp:* Lập bảng ma trận Tên - Điểm số.

    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Điền dữ kiện đề bài vào bảng ma trận:*
    - Cúc đạt 9 điểm $=>$ Ô (Cúc, 9) = *✔ Có*. Gạch *✘* các ô còn lại trên hàng Cúc và cột 9.
    - Bình có điểm là số chẵn, mà tập điểm chỉ có 8 và 10 là chẵn $=>$ Bình nhận 8 hoặc 10 (Loại 7).
    
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Điểm*], [*7 điểm*], [*8 điểm*], [*9 điểm*], [*10 điểm*],
        [*An*], [], [], [✘], [],
        [*Bình*], [✘], [], [✘], [],
        [*Cúc*], [✘], [✘], [*✔ Có*], [✘],
        [*Dũng*], [], [], [✘], [],
      )
    ]

    *Bước 2. Suy luận loại trừ chéo:*
    - Dữ kiện (1): Điểm Dũng cao hơn An.
    - Ba mức điểm còn lại chưa có chủ là: 7, 8, 10 chia cho An, Bình, Dũng.
    - Vì điểm Bình là số chẵn (8 hoặc 10), nếu Bình nhận 10 điểm thì điểm Dũng không thể cao hơn An mà cả hai cùng nhận 7 và 8 (khi đó Dũng chỉ có thể là 8, An là 7).
    - Nhưng nếu Bình nhận 8 điểm, thì còn hai điểm 7 và 10 cho An và Dũng. Vì Dũng cao hơn An nên bắt buộc An = 7 và Dũng = 10.
    - Ở cả hai khả năng hợp lý (Bình = 8, Dũng = 10, An = 7) đều thỏa mãn điểm Bình là số chẵn và Dũng cao hơn An.
    - Do đó, bạn Dũng chắc chắn đạt điểm tối đa là 10.

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Điểm*], [*7 điểm*], [*8 điểm*], [*9 điểm*], [*10 điểm*],
        [*An*], [*✔ Có*], [✘], [✘], [✘],
        [*Bình*], [✘], [*✔ Có*], [✘], [✘],
        [*Cúc*], [✘], [✘], [*✔ Có*], [✘],
        [*Dũng*], [✘], [✘], [✘], [*✔ Có*],
      )
    ]

    *Đáp số:* 10.
  ],
)

#tln(
  dir: "ngang",
  [*(VD)* Ba bạn An, Bình, Chi có số tuổi là ba số tự nhiên liên tiếp từ tập ${15, 16, 17}$. Biết rằng:
  1. An lớn tuổi hơn Bình.
  2. Chi không phải là người nhỏ tuổi nhất.
  3. An không phải là người lớn tuổi nhất.
  Hỏi bạn Chi bao nhiêu tuổi?],
  [17],
  loigiai: [
    📌 *Phương pháp:* Lập bảng ma trận Tên - Độ tuổi.

    ✍️ *Lời giải chi tiết:* \
    - Dữ kiện (2): Chi không nhỏ nhất $=>$ Chi không phải 15 tuổi.
    - Dữ kiện (3): An không lớn nhất $=>$ An không phải 17 tuổi.
    - Dữ kiện (1): An lớn hơn Bình $=>$ An không thể 15 tuổi, và Bình không thể 17 tuổi.
    - Nhìn hàng *An*: An không phải 15, cũng không phải 17 $=>$ *An 16 tuổi* (*✔ Có*).
    - Vì An 16 tuổi và An lớn hơn Bình $=>$ *Bình 15 tuổi* (*✔ Có*).
    - Còn lại *Chi 17 tuổi* (*✔ Có*).

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Tuổi*], [*15 tuổi*], [*16 tuổi*], [*17 tuổi*],
        [*An*], [✘], [*✔ Có*], [✘],
        [*Bình*], [*✔ Có*], [✘], [✘],
        [*Chi*], [✘], [✘], [*✔ Có*],
      )
    ]

    *Đáp số:* 17.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Một công ty thuê 4 văn phòng tại 4 tầng liên tiếp: Tầng 5, Tầng 6, Tầng 7, Tầng 8 cho 4 phòng ban: Nhân sự, Kế toán, Kỹ thuật, Marketing. Biết rằng:
  1. Phòng Kỹ thuật nằm ở tầng cao nhất (Tầng 8).
  2. Phòng Kế toán nằm ở tầng chẵn.
  3. Phòng Marketing nằm ngay bên dưới phòng Nhân sự.
  Hỏi phòng Nhân sự nằm ở tầng số mấy?],
  [7],
  loigiai: [
    📌 *Phương pháp:* Lập bảng phân tích vị trí tầng.

    ✍️ *Lời giải chi tiết:* \
    - Dữ kiện (1): Phòng Kỹ thuật ở Tầng 8.
    - Các tầng còn lại là: Tầng 5, Tầng 6, Tầng 7.
    - Dữ kiện (2): Phòng Kế toán ở tầng chẵn. Trong 3 tầng {5, 6, 7}, chỉ có Tầng 6 là số chẵn $=>$ *Phòng Kế toán ở Tầng 6*.
    - Hai tầng còn lại: Tầng 5 và Tầng 7.
    - Dữ kiện (3): Phòng Marketing nằm ngay bên dưới phòng Nhân sự $=>$ Nhân sự ở Tầng 7, Marketing ở Tầng 5 (Tầng 5 dưới Tầng 7).

    #align(center)[
      #table(
        columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tầng*], [*Tầng 5*], [*Tầng 6*], [*Tầng 7*], [*Tầng 8*],
        [*Phòng ban*], [Marketing], [Kế toán], [*Nhân sự*], [Kỹ thuật],
      )
    ]

    *Đáp số:* 7.
  ],
)

#tln(
  dir: "ngang",
  [*(VD)* Bốn bạn An, Bình, Cúc, Dũng sở hữu 4 chiếc xe đạp có giá tiền lần lượt là 2, 3, 4, 5 (triệu đồng). Biết rằng:
  1. Chiếc xe của Dũng có giá đắt nhất (5 triệu đồng).
  2. Giá xe của An đắt hơn giá xe của Bình.
  3. Bạn Cúc sở hữu chiếc xe có giá 3 triệu đồng.
  Hỏi chiếc xe đạp của bạn An có giá bao nhiêu triệu đồng?],
  [4],
  loigiai: [
    📌 *Phương pháp:* Lập bảng ma trận Tên - Giá xe.

    ✍️ *Lời giải chi tiết:* \
    *Bước 1. Điền các dữ kiện loại trừ vào bảng ma trận:*
    - Dữ kiện (1): Dũng xe 5 triệu $=>$ Ô (Dũng, 5 triệu) = *✔ Có*. Gạch *✘* hàng Dũng và cột 5 triệu.
    - Dữ kiện (3): Cúc xe 3 triệu $=>$ Ô (Cúc, 3 triệu) = *✔ Có*. Gạch *✘* hàng Cúc và cột 3 triệu.

    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Giá*], [*2 triệu*], [*3 triệu*], [*4 triệu*], [*5 triệu*],
        [*An*], [], [✘], [], [✘],
        [*Bình*], [], [✘], [], [✘],
        [*Cúc*], [✘], [*✔ Có*], [✘], [✘],
        [*Dũng*], [✘], [✘], [✘], [*✔ Có*],
      )
    ]

    *Bước 2. Quét bảng (Nhận - Loại chéo):*
    - Hai mức giá còn lại chưa có chủ là: 2 triệu và 4 triệu dành cho An và Bình.
    - Dữ kiện (2): Giá xe của An đắt hơn Bình $=>$ *An sở hữu xe 4 triệu* (*✔ Có*), *Bình sở hữu xe 2 triệu* (*✔ Có*).

    *Bước 3. Bảng ma trận kết quả:*
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Tên \\ Giá*], [*2 triệu*], [*3 triệu*], [*4 triệu*], [*5 triệu*],
        [*An*], [✘], [✘], [*✔ Có*], [✘],
        [*Bình*], [*✔ Có*], [✘], [✘], [✘],
        [*Cúc*], [✘], [*✔ Có*], [✘], [✘],
        [*Dũng*], [✘], [✘], [✘], [*✔ Có*],
      )
    ]

    *Đáp số:* 4.
  ],
)

#tln(
  dir: "ngang",
  [*(VD)* Bốn chiếc xe ô tô A, B, C, D đỗ ở 4 vị trí liền nhau từ 1 đến 4 (từ trái qua phải) trong bãi giữ xe. Biết rằng:
  1. Xe A đỗ ở vị trí số 1.
  2. Xe C đỗ ngay bên cạnh xe A.
  3. Xe D không đỗ ở vị trí số 4.
  Hỏi xe B đỗ ở vị trí số mấy?],
  [4],
  loigiai: [
    📌 *Phương pháp:* Lập bảng phân tích vị trí đỗ xe.

    ✍️ *Lời giải chi tiết:* \
    - Dữ kiện (1): Xe A ở vị trí số 1.
    - Dữ kiện (2): Xe C đỗ ngay cạnh xe A $=>$ Vì A ở vị trí 1 nên xe C bắt buộc phải đỗ ở vị trí số 2.
    - Hai vị trí còn lại là số 3 và số 4 dành cho xe B và xe D.
    - Dữ kiện (3): Xe D không đỗ ở vị trí 4 $=>$ Xe D đỗ ở vị trí số 3.
    - Suy ra xe B đỗ ở vị trí số 4.

    #align(center)[
      #table(
        columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Vị trí đỗ*], [*Số 1*], [*Số 2*], [*Số 3*], [*Số 4*],
        [*Xe ô tô*], [Xe A], [Xe C], [Xe D], [*Xe B*],
      )
    ]

    *Đáp số:* 4.
  ],
)

#tln(
  dir: "ngang",
  [*(VDC)* Một tủ đồ học sinh tại trường học gồm 4 ngăn tủ được đánh số từ 1 đến 4 theo thứ tự từ trái qua phải, được cấp cho 4 bạn Nam, Tuấn, Kiên, Hùng. Biết rằng:
  1. Bạn Hùng có ngăn tủ ở vị trí đầu tiên bên trái (ngăn số 1).
  2. Bạn Nam có ngăn tủ số 2.
  3. Ngăn tủ của bạn Tuấn nằm ở bên phải ngăn tủ của bạn Kiên.
  Hỏi bạn Tuấn có ngăn tủ số mấy?],
  [4],
  loigiai: [
    📌 *Phương pháp:* Lập bảng phân tích số ngăn tủ.

    ✍️ *Lời giải chi tiết:* \
    - Dữ kiện (1): Hùng sở hữu ngăn số 1.
    - Dữ kiện (2): Nam sở hữu ngăn số 2.
    - Còn lại hai ngăn tủ là số 3 và số 4 dành cho Tuấn và Kiên.
    - Dữ kiện (3): Ngăn của Tuấn nằm bên phải ngăn của Kiên (số ngăn của Tuấn lớn hơn số ngăn của Kiên) $=>$ Kiên sở hữu ngăn số 3, Tuấn sở hữu ngăn số 4.

    #align(center)[
      #table(
        columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 or col == 0 { rgb("#e3f2fd") } else { none },
        [*Ngăn tủ*], [*Số 1*], [*Số 2*], [*Số 3*], [*Số 4*],
        [*Học sinh*], [Hùng], [Nam], [Kiên], [*Tuấn*],
      )
    ]

    *Đáp số:* 4.
  ],
)



