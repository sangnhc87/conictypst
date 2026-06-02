#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== 9. Oxyz: Khi Không Gian Bắt Đầu Đo Được

#why-box[
  Nếu hình học Euclide cổ điển dạy ta cách nhìn cấu trúc và quan hệ hình học bằng mắt, thì hệ tọa độ Đề-các $O x y z$ làm một việc cách mạng hơn: nó số hóa toàn bộ không gian. 
  
  Bằng cách gán cho mỗi điểm một bộ ba số $(x, y, z)$, Oxyz biến không gian từ một thực thể trực quan thành một "cơ sở dữ liệu số". Điều này cho phép máy tính, máy in 3D, và các thiết bị lập trình có thể hiểu, mô tả, và thao tác trên thế giới vật chất một cách chính xác tuyệt đối.
]

#vd-box("8", "Hệ trục tọa độ Oxyz và tọa độ của một điểm")[
  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Để xác định vị trí của một điểm $M$ bất kỳ trong không gian, ta chọn một điểm $O$ làm gốc tọa độ và ba trục $O x, O y, O z$ vuông góc với nhau từng đôi một. 
      
      Tọa độ của điểm $M$ được xác định bằng cách chiếu vuông góc $M$ xuống ba trục:
      - Hình chiếu của $M$ trên trục $O x$ xác định hoành độ $x_0$.
      - Hình chiếu của $M$ trên trục $O y$ xác định tung độ $y_0$.
      - Hình chiếu của $M$ trên trục $O z$ xác định cao độ $z_0$.
      
      Khi đó, ta viết $M(x_0, y_0, z_0)$. Sáu điểm chiếu tạo với gốc $O$ và điểm $M$ thành một hình hộp chữ nhật. Độ dài các cạnh của hình hộp này trên ba trục chính là độ lớn của các tọa độ $x_0, y_0, z_0$. Sự tương ứng $1-1$ này đảm bảo mỗi điểm có một địa chỉ duy nhất trong không gian.
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          let sx = -0.45
          let sy = -0.3
          let proj(x, y, z) = (y + x * sx, z + x * sy)
          
          let O = proj(0, 0, 0)
          let Xaxis = proj(3.2, 0, 0)
          let Yaxis = proj(0, 3.8, 0)
          let Zaxis = proj(0, 0, 3.0)
          
          // Điểm M và các đỉnh hộp tọa độ
          let x0 = 1.8
          let y0 = 2.5
          let z0 = 1.8
          
          let M = proj(x0, y0, z0)
          let Mx = proj(x0, 0, 0)
          let My = proj(0, y0, 0)
          let Mz = proj(0, 0, z0)
          let Mxy = proj(x0, y0, 0)
          let Myz = proj(0, y0, z0)
          let Mzx = proj(x0, 0, z0)
          
          // Vẽ các trục tọa độ (mũi tên đen)
          line(O, Xaxis, stroke: 1pt + black, mark: (end: "stealth", scale: 0.6))
          content((Xaxis.at(0) - 0.25, Xaxis.at(1) - 0.2), $x$, size: 9pt)
          
          line(O, Yaxis, stroke: 1pt + black, mark: (end: "stealth", scale: 0.6))
          content((Yaxis.at(0) + 0.25, Yaxis.at(1)), $y$, size: 9pt)
          
          line(O, Zaxis, stroke: 1pt + black, mark: (end: "stealth", scale: 0.6))
          content((Zaxis.at(0), Zaxis.at(1) + 0.25), $z$, size: 9pt)
          
          content((O.at(0) + 0.2, O.at(1) + 0.15), $O$, size: 9pt)
          
          // Vẽ hộp tọa độ bằng nét đứt xám
          line(Mx, Mxy, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(My, Mxy, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(Mxy, M, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          
          line(My, Myz, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(Mz, Myz, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(Myz, M, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          
          line(Mx, Mzx, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(Mz, Mzx, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(Mzx, M, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          
          // Điểm và nhãn tọa độ trên trục
          circle(Mx, radius: 1.5pt, fill: rgb("#0F766E")); content((Mx.at(0) - 0.25, Mx.at(1) - 0.1), $x_0$, size: 8.5pt, fill: rgb("#0F766E"))
          circle(My, radius: 1.5pt, fill: rgb("#0F766E")); content((My.at(0), My.at(1) - 0.25), $y_0$, size: 8.5pt, fill: rgb("#0F766E"))
          circle(Mz, radius: 1.5pt, fill: rgb("#0F766E")); content((Mz.at(0) - 0.25, Mz.at(1)), $z_0$, size: 8.5pt, fill: rgb("#0F766E"))
          
          // Vẽ điểm M
          circle(M, radius: 2.2pt, fill: rgb("#9F1239"))
          content((M.at(0) + 0.5, M.at(1) + 0.25), $M(x_0, y_0, z_0)$, size: 9pt, fill: rgb("#9F1239"))
        })
      ]
    ]
  )
]

#essay-box("Khai mở tư duy: Bản sao số (Digital Twin) và sự số hóa thế giới thực")[
  Trong kỷ nguyên số, khái niệm *Bản sao số (Digital Twin)* đang cách mạng hóa cách chúng ta xây dựng và vận hành các công trình. Trước khi xây dựng một cây cầu treo dài hàng km, hay chế tạo một động cơ phản lực cho máy bay Boeing, các kỹ sư tạo ra một phiên bản ảo 3D chính xác tuyệt đối trên máy tính. 
  
  Bản sao số này không chỉ là một bức ảnh đẹp. Nó lưu trữ tọa độ $x, y, z$ của từng con ốc vít, từng mối hàn, và từng thanh dầm thép. Khi ta chạy các thuật toán mô phỏng sức gió, nhiệt độ, hay động đất, máy tính thực chất đang giải hàng triệu phương trình tọa độ trên từng điểm nút Oxyz của vật thể. 
  
  Nhờ có Oxyz, ta có thể thử nghiệm, kiểm tra độ an toàn và dự đoán hỏng hóc của một công trình khổng lồ trước khi nó thực sự được đúc móng trên thế giới thực.
]

#history-box("René Descartes và chú ruồi trên trần nhà bệnh viện")[
  Vào thế kỷ 17, triết gia và nhà toán học người Pháp *René Descartes* là một người có sức khỏe rất yếu. Ông thường xuyên phải nằm trên giường bệnh trong nhiều giờ liền để nghỉ ngơi và suy ngẫm. 
  
  Vào một buổi sáng, khi đang nằm nhìn lên trần nhà, ông chú ý đến một chú ruồi đang bò lửng lơ trên đó. Descartes tự hỏi: *Làm thế nào để ta có thể mô tả chính xác vị trí của chú ruồi này tại bất kỳ thời điểm nào bằng ngôn ngữ toán học mà không cần phải chỉ tay trực tiếp?*
  
  Ông nhận ra rằng trần nhà được giới hạn bởi các bức tường vuông góc. Nếu ông đo khoảng cách từ chú ruồi đến bức tường bên trái, và khoảng cách từ nó đến bức tường phía trước mặt, ông sẽ có hai con số $(x, y)$ duy nhất xác định chính xác vị trí của chú ruồi. Nếu chú ruồi bay lơ lửng xuống dưới, ông chỉ cần thêm khoảng cách từ nó đến mặt sàn $(z)$. 
  
  Ý tưởng cực kỳ đơn giản này chính là sự ra đời của *Hệ tọa độ Đề-các (Cartesian Coordinates)*. Nó đã bắc một cây cầu lịch sử nối liền Đại số và Hình học, biến các đường cong, mặt cong hình học thành các phương trình đại số có thể giải được bằng tính toán.
]

#core-box[
  Khi làm việc với hệ tọa độ Oxyz, hãy chú ý cấu trúc của các mặt phẳng tọa độ:
  
  - *Mặt phẳng $O x y$ (mặt đáy):* Có phương trình $z = 0$. Mọi điểm nằm trên mặt phẳng này có dạng $M(x, y, 0)$.
  - *Mặt phẳng $O y z$ (mặt đứng bên):* Có phương trình $x = 0$. Mọi điểm nằm trên mặt phẳng này có dạng $M(0, y, z)$.
  - *Mặt phẳng $O z x$ (mặt đứng trước):* Có phương trình $y = 0$. Mọi điểm nằm trên mặt phẳng này có dạng $M(x, 0, z)$.
  
  Khi chiếu một điểm $M(a, b, c)$ vuông góc xuống các mặt phẳng tọa độ hoặc các trục tọa độ, ta chỉ cần giữ lại các thành phần tọa độ tương ứng và chuyển các thành phần còn lại về $0$. Ví dụ, hình chiếu của $M$ trên trục $O x$ là $M_x(a, 0, 0)$, và trên mặt phẳng $O x y$ là $M_(x y)(a, b, 0)$.
]
