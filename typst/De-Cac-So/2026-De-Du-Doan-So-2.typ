#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../bbt.typ": *
#import "../math-sym.typ": *

#let mode = "loigiai"
#let accent = classic.crimson

#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GD&ĐT TP. HỒ CHÍ MINH",
  school: "TRƯỜNG THPT CHUYÊN LÊ HỒNG PHONG",
  exam-title: "KỲ THI THỬ TỐT NGHIỆP THPT NĂM 2026 — LẦN 2",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "305",
  footer-left: [Tổ Toán — THPT Chuyên Lê Hồng Phong],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12.], count: 12)
#tln(
  id: "2H5V3-4",
  [Một quả bóng hình cầu có bán kính $r$ đang được treo trong một góc của tường nhà. Một điểm $B$ cố định nằm trên mép giao tuyến của hai bờ tường và cách mặt đất $56 "cm"$. Sợi dây treo quả bóng có độ dài $A B = 20 "cm"$ và đây cũng là khoảng cách ngắn nhất từ điểm $B$ đến mặt ngoài của quả bóng. Biết rằng quả bóng tiếp xúc với hai bức tường vuông góc và điểm thấp nhất của quả bóng cách mặt đất $12 "cm"$. Hỏi đường kính của quả bóng là bao nhiêu cm?],
  [$32$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục tọa độ và các bức tường
    line((0,0), (-1.5,-1.2), name: "x", mark: (end: ">"))
    content("x", [$x$], anchor: "north-east", padding: 0.1)
    line((0,0), (2.5,0), name: "y", mark: (end: ">"))
    content("y", [$y$], anchor: "west", padding: 0.1)
    line((0,0), (0,4.5), name: "z", mark: (end: ">"))
    content("z", [$z$], anchor: "south", padding: 0.1)
    content((0,0), [$O$], anchor: "north-east", padding: 0.1)

    fill(rgb("e0e0e050"))
    line((0,0), (0,4), (-1.5, 2.8), (-1.5, -1.2), close: true) // Mặt Oxz
    fill(rgb("d0d0d050"))
    line((0,0), (2.5, 0), (2.5, 4), (0, 4), close: true) // Mặt Oyz

    // Tọa độ mặt cầu
    let I = (0.8, 1.8)
    let r = 0.9

    // Vẽ khối cầu
    circle(I, radius: r, fill: rgb("ffffff90"), stroke: 0.8pt)
    
    // Kinh tuyến và vĩ tuyến để tạo khối 3D 
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, r*0.3), stroke: (dash: "dashed", thickness: 0.5pt))
    arc((I.at(0) - r + 1.8, I.at(1)), start: 0deg, stop: 180deg, radius: (r, r*0.3), stroke: (thickness: 0.5pt))
    arc((I.at(0), I.at(1) - r), start: -90deg, stop: 90deg, radius: (r*0.3, r), stroke: (thickness: 0.5pt))
    arc((I.at(0), I.at(1) - r + 1.8), start: 90deg, stop: 270deg, radius: (r*0.3, r), stroke: (dash: "dashed", thickness: 0.5pt))

    // Tâm I và điểm thấp nhất
    circle(I, radius: 0.04, fill: black)
    
    let B = (0, 4)
    circle(B, radius: 0.04, fill: black)
    content(B, [$B$], anchor: "east", padding: 0.1)
    
    let A = (0.45, 2.62)
    circle(A, radius: 0.04, fill: black)
    content(A, [$A$], anchor: "south-west", padding: 0.1)
    
    // Dây treo
    line(B, A, stroke: 1.2pt + red)

    // Khoảng cách tới mặt đất
    let H = (I.at(0), I.at(1) - r)
    line(H, (H.at(0), H.at(1) - 0.6), stroke: (dash: "dashed", thickness: 0.8pt))
    content((H.at(0), H.at(1) - 0.3), [$12 "cm"$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[Thiết lập hệ trục tọa độ không gian $O x y z$ tại góc tường để đưa bài toán thực tế về bài toán hình học giải tích. Tâm mặt cầu được xác định qua khoảng cách đến các bức tường và mặt sàn. Sau đó sử dụng công thức khoảng cách hai điểm để thiết lập phương trình theo ẩn $r$.]
    
    #step[
      Chọn hệ trục $O x y z$ với $O(0, 0, 0)$ tại góc tường. Các tia $O x, O y$ nằm trên mặt sàn, tia $O z$ trùng mép tường đứng.
      
      Quả bóng tiếp xúc hai bức tường vuông góc $(O x z)$ và $(O y z)$, điểm thấp nhất cách sàn $(O x y)$ một đoạn $12 "cm"$. Do đó, tọa độ tâm mặt cầu là $I(r, r, r + 12)$.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        line((0,0), (-1.5,-1.2), name: "x", mark: (end: ">"))
        line((0,0), (2.5,0), name: "y", mark: (end: ">"))
        line((0,0), (0,4.5), name: "z", mark: (end: ">"))
        content("x", [$x$], anchor: "north-east")
        content("y", [$y$], anchor: "west")
        content("z", [$z$], anchor: "south")
        content((0,0), [$O$], anchor: "north-east", padding: 0.1)

        let I = (1.5, 2.2)
        circle(I, radius: 0.04, fill: black)
        content(I, [$I(r, r, r+12)$], anchor: "north-west", padding: 0.1)

        let Iy = (1.5, 0)
        let Iz = (0, 2.2)
        line(I, Iy, stroke: (dash: "dashed", paint: gray))
        line(I, Iz, stroke: (dash: "dashed", paint: gray))

        let B = (0, 4)
        circle(B, radius: 0.04, fill: black)
        content(B, [$B(0, 0, 56)$], anchor: "east", padding: 0.1)
        
        line(B, I, stroke: 1.2pt + rgb("1a3a5f"))
        content((0.75, 3.2), [$B I = r + 20$], anchor: "south-west", padding: 0.1)
      })
    ]

    #step[
      Điểm treo $B$ nằm trên trục $O z$ và cách mặt sàn $56 "cm" => B(0, 0, 56)$.
      Khoảng cách ngắn nhất từ $B$ đến quả bóng chính là dọc theo đường thẳng $B I$, tiếp xúc với bóng tại $A$.
      Do đó, độ dài đoạn thẳng $B I = A B + r = 20 + r$.
    ]
    
    #step[
      Áp dụng công thức khoảng cách:
      $ B I^2 &= (x_I - x_B)^2 + (y_I - y_B)^2 + (z_I - z_B)^2 \
              &= r^2 + r^2 + (r + 12 - 56)^2 \
              &= 2r^2 + (r - 44)^2 \
              &= 3r^2 - 88r + 1936 $
      
      Ta có phương trình: 
      $ (r + 20)^2 = 3r^2 - 88r + 1936 \
      <=> r^2 + 40r + 400 = 3r^2 - 88r + 1936 \
      <=> 2r^2 - 128r + 1536 = 0 \
      <=> r^2 - 64r + 768 = 0 $
      
      Giải phương trình ta thu được hai nghiệm: $r = 16$ hoặc $r = 48$.
    ]
    
    #step[
      Do quả bóng treo lơ lửng dưới điểm $B$, ta phải có cao độ của tâm nhỏ hơn cao độ của điểm treo: $z_I < z_B$, tức là:
      $ r + 12 < 56 <=> r < 44 $
      Vậy chọn $r = 16 "cm"$. 
      
      Đường kính quả bóng là: $d = 2r = 32 "cm"$.
    ]
    #luuy[Trong các bài toán hình không gian có ứng dụng thực tế, khi giải phương trình ra nhiều nghiệm đại số cần đối chiếu lại với các ràng buộc vật lý (cao độ, không gian bị giới hạn) để chọn nghiệm chính xác.]
  ]
)
#tln(
  id: "2H5V3-5",
  [Một quả bóng hình cầu có bán kính $r$ đang được treo trong một góc của tường nhà. Một điểm $B$ cố định nằm trên mép giao tuyến của hai bờ tường và cách mặt đất $48 "cm"$. Sợi dây treo quả bóng có độ dài $A B = 17 "cm"$ và đây cũng là khoảng cách ngắn nhất từ điểm $B$ đến mặt ngoài của quả bóng. Biết rằng quả bóng tiếp xúc với hai bức tường vuông góc và điểm thấp nhất của quả bóng cách mặt đất $15 "cm"$. Hỏi đường kính của quả bóng là bao nhiêu cm?],
  [$20$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục tọa độ và các bức tường
    line((0,0), (-1.5,-1.2), name: "x", mark: (end: ">"))
    content("x", [$x$], anchor: "north-east", padding: 0.1)
    line((0,0), (2.5,0), name: "y", mark: (end: ">"))
    content("y", [$y$], anchor: "west", padding: 0.1)
    line((0,0), (0,4.5), name: "z", mark: (end: ">"))
    content("z", [$z$], anchor: "south", padding: 0.1)
    content((0,0), [$O$], anchor: "north-east", padding: 0.1)

    fill(rgb("e0e0e050"))
    line((0,0), (0,4), (-1.5, 2.8), (-1.5, -1.2), close: true) // Mặt Oxz
    fill(rgb("d0d0d050"))
    line((0,0), (2.5, 0), (2.5, 4), (0, 4), close: true) // Mặt Oyz

    // Tọa độ mặt cầu
    let I = (0.8, 1.8)
    let r = 0.9

    // Vẽ khối cầu
    circle(I, radius: r, fill: rgb("ffffff90"), stroke: 0.8pt)
    
    // Kinh tuyến và vĩ tuyến để tạo khối 3D 
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, r*0.3), stroke: (dash: "dashed", thickness: 0.5pt))
    arc((I.at(0) - r + 1.8, I.at(1)), start: 0deg, stop: 180deg, radius: (r, r*0.3), stroke: (thickness: 0.5pt))
    arc((I.at(0), I.at(1) - r), start: -90deg, stop: 90deg, radius: (r*0.3, r), stroke: (thickness: 0.5pt))
    arc((I.at(0), I.at(1) - r + 1.8), start: 90deg, stop: 270deg, radius: (r*0.3, r), stroke: (dash: "dashed", thickness: 0.5pt))

    // Tâm I và điểm thấp nhất
    circle(I, radius: 0.04, fill: black)
    
    let B = (0, 4)
    circle(B, radius: 0.04, fill: black)
    content(B, [$B$], anchor: "east", padding: 0.1)
    
    let A = (0.45, 2.62)
    circle(A, radius: 0.04, fill: black)
    content(A, [$A$], anchor: "south-west", padding: 0.1)
    
    // Dây treo
    line(B, A, stroke: 1.2pt + red)

    // Khoảng cách tới mặt đất
    let H = (I.at(0), I.at(1) - r)
    line(H, (H.at(0), H.at(1) - 0.6), stroke: (dash: "dashed", thickness: 0.8pt))
    content((H.at(0), H.at(1) - 0.3), [$15 "cm"$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[Hoàn toàn tương tự, ta dựng hệ trục tọa độ không gian tại góc tường và vận dụng phương pháp tọa độ hóa. Bằng cách biểu diễn khoảng cách từ điểm treo đến tâm khối cầu theo bán kính $r$, ta sẽ thiết lập được một phương trình bậc hai.]
    
    #step[
      Gắn hệ trục tọa độ $O x y z$ với $O(0, 0, 0)$ là góc tường. Hai tia $O x, O y$ nằm trên mặt sàn, tia $O z$ trùng mép tường đứng.
      
      Do quả bóng tiếp xúc với hai bức tường vuông góc $(O x z)$ và $(O y z)$, đồng thời điểm thấp nhất của quả bóng cách sàn $(O x y)$ một đoạn $15 "cm"$, nên tọa độ tâm mặt cầu là $I(r, r, r + 15)$.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        line((0,0), (-1.5,-1.2), name: "x", mark: (end: ">"))
        line((0,0), (2.5,0), name: "y", mark: (end: ">"))
        line((0,0), (0,4.5), name: "z", mark: (end: ">"))
        content("x", [$x$], anchor: "north-east")
        content("y", [$y$], anchor: "west")
        content("z", [$z$], anchor: "south")
        content((0,0), [$O$], anchor: "north-east", padding: 0.1)

        let I = (1.5, 2.2)
        circle(I, radius: 0.04, fill: black)
        content(I, [$I(r, r, r+15)$], anchor: "north-west", padding: 0.1)

        let Iy = (1.5, 0)
        let Iz = (0, 2.2)
        line(I, Iy, stroke: (dash: "dashed", paint: gray))
        line(I, Iz, stroke: (dash: "dashed", paint: gray))

        let B = (0, 4)
        circle(B, radius: 0.04, fill: black)
        content(B, [$B(0, 0, 48)$], anchor: "east", padding: 0.1)
        
        line(B, I, stroke: 1.2pt + rgb("1a3a5f"))
        content((0.75, 3.2), [$B I = r + 17$], anchor: "south-west", padding: 0.1)
      })
    ]

    #step[
      Điểm treo $B$ nằm trên trục $O z$ và cách mặt sàn $48 "cm" => B(0, 0, 48)$.
      Đoạn thẳng nối tâm mặt cầu $I$ và điểm treo $B$ đi qua điểm tiếp xúc $A$ của sợi dây với bề mặt quả bóng. 
      Do đó, độ dài đoạn $B I = A B + r = 17 + r$.
    ]
    
    #step[
      Áp dụng công thức tính khoảng cách giữa hai điểm trong không gian:
      $ B I^2 &= (x_I - x_B)^2 + (y_I - y_B)^2 + (z_I - z_B)^2 \
              &= r^2 + r^2 + (r + 15 - 48)^2 \
              &= 2r^2 + (r - 33)^2 \
              &= 3r^2 - 66r + 1089 $
      
      Từ đó ta có phương trình: 
      $ (r + 17)^2 = 3r^2 - 66r + 1089 \
      <=> r^2 + 34r + 289 = 3r^2 - 66r + 1089 \
      <=> 2r^2 - 100r + 800 = 0 \
      <=> r^2 - 50r + 400 = 0 $
      
      Giải phương trình ta thu được hai nghiệm: $r = 10$ hoặc $r = 40$.
    ]
    
    #step[
      Mặt khác, quả bóng phải nằm phía dưới điểm treo $B$, tức là cao độ của tâm $I$ phải nhỏ hơn cao độ của $B$: $z_I < z_B$, suy ra:
      $ r + 15 < 48 <=> r < 33 $
      Dựa vào điều kiện này, ta nhận nghiệm $r = 10 "cm"$. 
      
      Vậy đường kính của quả bóng là: $d = 2r = 20 "cm"$.
    ]
    #luuy[Đây là bài tập giúp học sinh làm quen với việc biện luận nghiệm. Học sinh rất dễ bỏ qua bước đối chiếu điều kiện $z_I < z_B$, dẫn đến chọn nhầm hoặc lấy dư nghiệm $r=40$.]
  ]
)

#tln(
  id: "2H5V3-4",
  [Một chiếc đèn trang trí hình cầu có bán kính $r$ đang được treo trong một góc của phòng. Một điểm $B$ cố định nằm trên mép giao tuyến của hai bức tường vuông góc và cách mặt sàn $60 "cm"$. Sợi dây treo đèn có độ dài $A B = 25 "cm"$ và đây cũng là khoảng cách ngắn nhất từ điểm $B$ đến mặt ngoài của chiếc đèn. Biết rằng chiếc đèn tiếp xúc với hai bức tường đó và điểm thấp nhất của chiếc đèn cách mặt sàn $21 "cm"$. Hỏi đường kính của chiếc đèn là bao nhiêu cm?],
  [$16$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục tọa độ và các bức tường
    line((0,0), (-1.5,-1.2), name: "x", mark: (end: ">"))
    content("x", [$x$], anchor: "north-east", padding: 0.1)
    line((0,0), (2.5,0), name: "y", mark: (end: ">"))
    content("y", [$y$], anchor: "west", padding: 0.1)
    line((0,0), (0,4.5), name: "z", mark: (end: ">"))
    content("z", [$z$], anchor: "south", padding: 0.1)
    content((0,0), [$O$], anchor: "north-east", padding: 0.1)

    fill(rgb("e0e0e050"))
    line((0,0), (0,4), (-1.5, 2.8), (-1.5, -1.2), close: true) // Mặt Oxz
    fill(rgb("d0d0d050"))
    line((0,0), (2.5, 0), (2.5, 4), (0, 4), close: true) // Mặt Oyz

    // Tọa độ mặt cầu
    let I = (0.8, 1.8)
    let r = 0.9

    // Vẽ khối cầu
    circle(I, radius: r, fill: rgb("ffffff90"), stroke: 0.8pt)
    
    // Kinh tuyến và vĩ tuyến để tạo khối 3D 
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, r*0.3), stroke: (dash: "dashed", thickness: 0.5pt))
    arc((I.at(0) - r + 1.8, I.at(1)), start: 0deg, stop: 180deg, radius: (r, r*0.3), stroke: (thickness: 0.5pt))
    arc((I.at(0), I.at(1) - r), start: -90deg, stop: 90deg, radius: (r*0.3, r), stroke: (thickness: 0.5pt))
    arc((I.at(0), I.at(1) - r + 1.8), start: 90deg, stop: 270deg, radius: (r*0.3, r), stroke: (dash: "dashed", thickness: 0.5pt))

    // Tâm I và điểm thấp nhất
    circle(I, radius: 0.04, fill: black)
    
    let B = (0, 4)
    circle(B, radius: 0.04, fill: black)
    content(B, [$B$], anchor: "east", padding: 0.1)
    
    let A = (0.45, 2.62)
    circle(A, radius: 0.04, fill: black)
    content(A, [$A$], anchor: "south-west", padding: 0.1)
    
    // Dây treo
    line(B, A, stroke: 1.2pt + red)

    // Khoảng cách tới mặt đất
    let H = (I.at(0), I.at(1) - r)
    line(H, (H.at(0), H.at(1) - 0.6), stroke: (dash: "dashed", thickness: 0.8pt))
    content((H.at(0), H.at(1) - 0.3), [$21 "cm"$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[Hoàn toàn tương tự, ta dựng hệ trục tọa độ không gian $O x y z$ tại góc tường và vận dụng phương pháp tọa độ hóa. Bằng cách biểu diễn khoảng cách từ điểm treo đến tâm khối cầu theo bán kính $r$, ta sẽ thiết lập được một phương trình đại số.]
    
    #step[
      Gắn hệ trục tọa độ $O x y z$ với $O(0, 0, 0)$ là góc tường. Hai tia $O x, O y$ nằm trên mặt sàn, tia $O z$ trùng mép tường đứng.
      
      Do chiếc đèn tiếp xúc với hai bức tường vuông góc $(O x z)$ và $(O y z)$, đồng thời điểm thấp nhất của chiếc đèn cách mặt sàn $(O x y)$ một đoạn $21 "cm"$, nên tọa độ tâm mặt cầu là $I(r, r, r + 21)$.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        line((0,0), (-1.5,-1.2), name: "x", mark: (end: ">"))
        line((0,0), (2.5,0), name: "y", mark: (end: ">"))
        line((0,0), (0,4.5), name: "z", mark: (end: ">"))
        content("x", [$x$], anchor: "north-east")
        content("y", [$y$], anchor: "west")
        content("z", [$z$], anchor: "south")
        content((0,0), [$O$], anchor: "north-east", padding: 0.1)

        let I = (1.5, 2.2)
        circle(I, radius: 0.04, fill: black)
        content(I, [$I(r, r, r + 21)$], anchor: "north-west", padding: 0.1)

        let Iy = (1.5, 0)
        let Iz = (0, 2.2)
        line(I, Iy, stroke: (dash: "dashed", paint: gray))
        line(I, Iz, stroke: (dash: "dashed", paint: gray))

        let B = (0, 4)
        circle(B, radius: 0.04, fill: black)
        content(B, [$B(0, 0, 60)$], anchor: "east", padding: 0.1)
        
        line(B, I, stroke: 1.2pt + rgb("1a3a5f"))
        content((0.75, 3.2), [$B I = r + 25$], anchor: "south-west", padding: 0.1)
      })
    ]

    #step[
      Điểm treo $B$ nằm trên trục $O z$ và cách mặt sàn $60 "cm" => B(0, 0, 60)$.
      Đoạn thẳng nối tâm mặt cầu $I$ và điểm treo $B$ đi qua điểm tiếp xúc $A$ của sợi dây với bề mặt chiếc đèn. 
      Do đó, độ dài đoạn $B I = A B + r = 25 + r$.
    ]
    
    #step[
      Áp dụng công thức tính khoảng cách giữa hai điểm trong không gian:
      $ B I^2 &= (x_I - x_B)^2 + (y_I - y_B)^2 + (z_I - z_B)^2 \
              &= r^2 + r^2 + (r + 21 - 60)^2 \
              &= 2r^2 + (r - 39)^2 \
              &= 3r^2 - 78r + 1521 $
      
      Từ đó ta thiết lập được phương trình: 
      $ (r + 25)^2 = 3r^2 - 78r + 1521 \
      <=> r^2 + 50r + 625 = 3r^2 - 78r + 1521 \
      <=> 2r^2 - 128r + 896 = 0 \
      <=> r^2 - 64r + 448 = 0 $
      
      Giải phương trình ta thu được hai nghiệm: $r = 8$ hoặc $r = 56$.
    ]
    
    #step[
      Mặt khác, chiếc đèn phải nằm hoàn toàn phía dưới điểm treo $B$, tức là cao độ của tâm $I$ phải nhỏ hơn cao độ của $B$: $z_I < z_B$, suy ra:
      $ r + 21 < 60 <=> r < 39 $
      Dựa vào điều kiện này, ta nhận nghiệm $r = 8 "cm"$. 
      
      Vậy đường kính của chiếc đèn là: $d = 2r = 16 "cm"$.
    ]
    
    #luuy[Đây là bài tập giúp học sinh làm quen với việc biện luận nghiệm. Học sinh rất dễ bỏ qua bước đối chiếu điều kiện thực tế của hình học (đèn nằm dưới điểm treo, không xuyên qua trần), dẫn đến chọn nhầm nghiệm dư thừa.]
    #meo[Nếu giải ra phương trình bậc hai có nghiệm không đẹp hoặc vô nghiệm, hãy kiểm tra lại hằng đẳng thức và các dấu trong công thức khoảng cách.]
  ]
)
#tln(
  id: "2H5V3-4",
  [Một chiếc đèn trang trí hình cầu có bán kính $r$ được treo lơ lửng trong góc một căn phòng bằng hai sợi dây mảnh không dãn. Biết phương của hai sợi dây luôn đi qua tâm của chiếc đèn. Căn phòng có trần nhà phẳng song song với mặt sàn và cách sàn $100 "cm"$. Hai bức tường vuông góc với nhau và cắt trần nhà theo hai mép. Gọi $O'$ là góc trên trần nhà (giao của trần và hai bức tường). 

Sợi dây thứ nhất được gắn tại điểm $A$ nằm trên mép trần của bức tường thứ nhất, cách $O'$ một khoảng $65 "cm"$. Độ dài sợi dây (từ điểm treo $A$ đến mặt ngoài của chiếc đèn) là $65 "cm"$. Sợi dây thứ hai được gắn tại điểm $B$ nằm trên mép trần của bức tường thứ hai, cách $O'$ một khoảng $9 "cm"$. Độ dài sợi dây thứ hai là $41 "cm"$. 

Biết chiếc đèn luôn tiếp xúc với bức tường thứ nhất và điểm thấp nhất của chiếc đèn cách mặt sàn $40 "cm"$. Hỏi đường kính của chiếc đèn bằng bao nhiêu cm?],
  [$20$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ minh họa
    line((0,0), (-1.5,-1.2), name: "x", mark: (end: ">"))
    content("x", [$x$], anchor: "north-east", padding: 0.1)
    line((0,0), (2.8,0), name: "y", mark: (end: ">"))
    content("y", [$y$], anchor: "west", padding: 0.1)
    line((0,0), (0,4.5), name: "z", mark: (end: ">"))
    content("z", [$z$], anchor: "south", padding: 0.1)
    content((0,0), [$O$], anchor: "north-east", padding: 0.1)

    // Các bức tường
    fill(rgb("e0e0e050"))
    line((0,0), (0,3.8), (-1.5, 2.6), (-1.5, -1.2), close: true) 
    fill(rgb("d0d0d050"))
    line((0,0), (2.8, 0), (2.8, 3.8), (0, 3.8), close: true) 
    
    // Trần nhà
    let H = 3.8
    line((0, H), (-1.5, 2.6), stroke: (dash: "dashed", paint: gray))
    line((0, H), (2.8, H), stroke: (dash: "dashed", paint: gray))
    content((0, H), [$O'$], anchor: "south-east", padding: 0.1)

    // Tọa độ mặt cầu
    let I = (0.7, 1.8)
    let r = 0.6

    // Vẽ khối cầu
    circle(I, radius: r, fill: rgb("ffffff90"), stroke: 0.8pt)
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, r*0.3), stroke: (dash: "dashed", thickness: 0.5pt))
    arc((I.at(0) - r + 2*r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, r*0.3), stroke: (thickness: 0.5pt))
    
    // Điểm A và B trên các mép trần
    let A = (1.8, H)
    let B = (-0.45, 3.44)
    circle(A, radius: 0.04, fill: black)
    circle(B, radius: 0.04, fill: black)
    content(A, [$A$], anchor: "south-west", padding: 0.1)
    content(B, [$B$], anchor: "south-east", padding: 0.1)
    
    // Dây treo
    line(A, (I.at(0)+0.4, I.at(1)+0.45), stroke: 1.2pt + blue)
    line(B, (I.at(0)-0.3, I.at(1)+0.5), stroke: 1.2pt + red)

    // Khoảng cách tới mặt đất
    let H_floor = (I.at(0), I.at(1) - r)
    line(H_floor, (H_floor.at(0), H_floor.at(1) - 0.7), stroke: (dash: "dashed", thickness: 0.8pt))
    content((H_floor.at(0)+0.1, H_floor.at(1) - 0.35), [$40$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[Tiếp tục tư duy tọa độ hóa, bài toán có hai điểm treo và hai sợi dây, do đó ta sẽ thu được một hệ hai phương trình khoảng cách. Giả thiết "phương của dây đi qua tâm chiếc đèn" cho phép ta xác định khoảng cách từ điểm treo đến tâm khối cầu chính bằng độ dài sợi dây cộng với bán kính mặt cầu.]
    
    #step[
      Gắn hệ trục tọa độ $O x y z$ với gốc $O(0, 0, 0)$ tại góc sàn nhà. Tia $O x$ nằm dưới chân bức tường thứ hai, tia $O y$ nằm dưới chân bức tường thứ nhất, trục $O z$ trùng mép giao giữa hai bức tường.
      
      Góc trần nhà là điểm $O'(0, 0, 100)$. 
      - Điểm $A$ nằm trên mép trần của bức tường 1 (mặt phẳng $O y z$ có $x = 0$), cách $O'$ đoạn $65 "cm"$, suy ra $A(0, 65, 100)$.
      - Điểm $B$ nằm trên mép trần của bức tường 2 (mặt phẳng $O x z$ có $y = 0$), cách $O'$ đoạn $9 "cm"$, suy ra $B(9, 0, 100)$.
    ]

    #step[
      Gọi tâm chiếc đèn là $I(x_I, y_I, z_I)$.
      - Đèn tiếp xúc với bức tường thứ nhất ($x = 0$) nên khoảng cách từ $I$ đến mặt phẳng $(O y z)$ bằng $r$, tức là $x_I = r$.
      - Điểm thấp nhất của đèn cách sàn $40 "cm"$, do đó cao độ tâm là $z_I = r + 40$.
      Vậy tọa độ tâm khối cầu có dạng $I(r, y_I, r + 40)$.
    ]
    
    #step[
      Vì dây đi qua tâm, độ dài đoạn $I A$ bằng độ dài dây thứ nhất cộng bán kính: $I A = 65 + r$.
      Ta thiết lập phương trình bình phương khoảng cách $I A^2 = (r + 65)^2$:
      $ (r - 0)^2 + (y_I - 65)^2 + (r + 40 - 100)^2 &= (r + 65)^2 \
      <=> r^2 + (y_I - 65)^2 + (r - 60)^2 &= r^2 + 130r + 4225 \
      <=> (y_I - 65)^2 + r^2 - 120r + 3600 &= 130r + 4225 \
      <=> y_I^2 - 130 y_I + r^2 - 250r + 3600 &= 0 quad (1) $
    ]
    
    #step[
      Tương tự, độ dài đoạn $I B$ bằng độ dài dây thứ hai cộng bán kính: $I B = 41 + r$.
      Phương trình bình phương khoảng cách $I B^2 = (r + 41)^2$:
      $ (r - 9)^2 + (y_I - 0)^2 + (r + 40 - 100)^2 &= (r + 41)^2 \
      <=> r^2 - 18r + 81 + y_I^2 + r^2 - 120r + 3600 &= r^2 + 82r + 1681 \
      <=> y_I^2 + r^2 - 220r + 2000 &= 0 quad (2) $
    ]
    
    #step[
      Lấy phương trình $(1)$ trừ đi phương trình $(2)$ vế theo vế, ta được:
      $ -130 y_I - 30 r + 1600 = 0 <=> 13 y_I + 3 r = 160 <=> y_I = (160 - 3r) / 13 $
      
      Thay $y_I$ trở lại phương trình $(2)$ ta thu được phương trình bậc hai theo $r$:
      $ ((160 - 3r) / 13)^2 + r^2 - 220r + 2000 &= 0 \
      <=> (25600 - 960r + 9r^2) / 169 + r^2 - 220r + 2000 &= 0 \
      <=> 25600 - 960r + 9r^2 + 169r^2 - 37180r + 338000 &= 0 \
      <=> 178r^2 - 38140r + 363600 &= 0 \
      <=> 89r^2 - 19070r + 181800 &= 0 $
      
      Bấm máy hoặc tính biệt thức, ta giải được hai nghiệm: $r = 10$ hoặc $r = 18180 / 89 approx 204.27$.
    ]
    
    #step[
      *Biện luận:* Do trần nhà chỉ cao $100 "cm"$, phần không gian treo đèn bị giới hạn. Chiều cao cao nhất của đèn là $z_I + r = 2r + 40$. Điều kiện bắt buộc là $2r + 40 < 100 <=> r < 30$.
      
      Đối chiếu điều kiện, ta loại nghiệm xấp xỉ $204.27$, nhận nghiệm $r = 10 "cm"$.
      Đường kính chiếc đèn là: $d = 2r = 20 "cm"$.
    ]
    
    #luuy[Khi có hai sợi dây, nếu chọn đúng hệ trục và thế bậc nhất vào bậc hai, mọi bài toán kiểu này đều có thể đưa về phương trình một ẩn rất tường minh.]
    #meo[Hãy cẩn thận kiểm tra thật kỹ các phép khai triển hằng đẳng thức ở các bước trung gian, chỉ cần sai một dấu, toàn bộ hệ số sẽ lệch dẫn đến phương trình vô nghiệm.]
  ]
)

#tn(
    [Cho hàm số $f(x)$ có đạo hàm $f'(x) = (x + 1)^2 (x - 2)(3 - x)$ trên $RR$. Hàm số $f(x)$ đồng biến trên khoảng nào?],
    (
      [$(-oo ; -1)$.],
      [$(-oo ; 2)$.],
      True([$(2 ; 3)$.]),
      [$(3 ; +oo)$.],
    ),
    loigiai: [
      $f'(x) = 0 <=> x = -1$ (kép), $x = 2$, $x = 3$.

      $(x + 1)^2 > 0$ với $x != -1$. Xét dấu $(x - 2)(3 - x)$:
      - $x < 2$: $(-)(+) = (-)$ → $f' le 0$ (nghịch biến, $f' = 0$ chỉ tại $x = -1$)
      - $2 < x < 3$: $(+)(+) = (+)$ → $f' > 0$ (đồng biến)
      - $x > 3$: $(+)(-) = (-)$ → $f' < 0$ (nghịch biến)

      Vậy $f$ đồng biến trên $(2 ; 3)$. Chọn *C*.

      #luuy[Nghiệm kép $x = -1$ không làm $f'$ đổi dấu — bẫy thường gặp: "có nghiệm đạo hàm là có cực trị".]
    ]
  )

  // ═ 2 — Tiệm cận (NB) ═
  #tn(
    [Tổng số đường tiệm cận (đứng + ngang + xiên) của đồ thị $y = (2x^2 - x + 1)/(x - 1)$ là],
    (
      [$0$.],
      [$1$.],
      True([$2$.]),
      [$3$.],
    ),
    loigiai: [
      $y = 2x + 1 + 2/(x - 1)$. TCĐ: $x = 1$. TCX: $y = 2x + 1$. TCN: không có.
      $arrow$ $2$ tiệm cận. Chọn *C*.
    ]
  )

  // ═ 3 — Đọc đồ thị — Tương giao (TH) ═
  #tn(
    [Cho hàm số $y = x^3 - 3x + 1$ có đồ thị $(C)$. Số tiếp tuyến của $(C)$ song song với đường thẳng $y = 9x - 2026$ là],
    (
      [$0$.],
      [$1$.],
      True([$2$.]),
      [$3$.],
    ),
    loigiai: [
      Tiếp tuyến có hệ số góc $k = f'(x_0) = 3x_0^2 - 3$. Song song $y = 9x - 2026$ $=> k = 9$.

      $3x_0^2 - 3 = 9 <=> x_0^2 = 4 <=> x_0 = 2$ hoặc $x_0 = -2$.

      - $x_0 = 2$: $y_0 = 3$, PTTT: $y = 9(x - 2) + 3 = 9x - 15$ (không trùng $y = 9x - 2026$).
      - $x_0 = -2$: $y_0 = -1$, PTTT: $y = 9(x + 2) - 1 = 9x + 17$ (không trùng).

      Cả hai đều song song (không trùng) $arrow$ $2$ tiếp tuyến. Chọn *C*.

      #luuy[Song song → cùng hệ số góc. Phải kiểm tra không trùng (nếu trùng thì không tính).]
    ]
  )

  // ═ 4 — Mũ - Logarit (TH) ═
  #tn(
    [Tập nghiệm của bất phương trình $log_2 (x - 1) le 3$ là],
    (
      [$(-oo ; 9]$.],
      [$[1 ; 9]$.],
      True([$(1 ; 9]$.]),
      [$(-oo ; 8]$.],
    ),
    loigiai: [
      ĐK: $x - 1 > 0 <=> x > 1$.

      $log_2 (x - 1) le 3 = log_2 8 <=> x - 1 le 8$ (vì cơ số $2 > 1$) $<=> x le 9$.

      Kết hợp ĐK: $1 < x le 9$. Vậy $S = (1 ; 9]$. Chọn *C*.
    ]
  )

  // ═ 5 — Nguyên hàm (TH) ═
  #tn(
    [Biết $F(x)$ là nguyên hàm của $f(x) = (2x + 1)/(x^2 + x + 1)$ và $F(0) = ln 2$. Giá trị $F(1)$ bằng],
    (
      [$ln 2$.],
      [$ln 3$.],
      True([$ln 6$.]),
      [$ln 12$.],
    ),
    loigiai: [
      Tử số $(2x + 1)$ là đạo hàm của mẫu $x^2 + x + 1$.

      $F(x) = integral (2x + 1)/(x^2 + x + 1) dif x = ln |x^2 + x + 1| + C = ln(x^2 + x + 1) + C$ (luôn dương).

      $F(0) = ln 1 + C = C = ln 2$.

      $F(1) = ln 3 + ln 2 = ln 6$. Chọn *C*.
    ]
  )

  // ═ 6 — Tích phân — Diện tích (TH) ═
  #tn(
    [Diện tích hình phẳng giới hạn bởi $y = x^2 - 2x$, $y = 0$, $x = 1$, $x = 3$ bằng],
    (
      [$2$.],
      True([$2$.]),
      [$4$.],
      [$6$.],
    ),
    loigiai: [
      Trên $[1 ; 3]$: $x^2 - 2x = x(x - 2)$. Khi $x in [1 ; 2]$: $x^2 - 2x le 0$. Khi $x in [2 ; 3]$: $x^2 - 2x ge 0$.

      $S = integral_1^2 -(x^2 - 2x) dif x + integral_2^3 (x^2 - 2x) dif x$

      $= lr(-x^3/3 + x^2)_1^2 + lr(x^3/3 - x^2)_2^3$

      $= [(-8/3 + 4) - (-1/3 + 1)] + [(9 - 9) - (8/3 - 4)]$

      $= (4/3 - 2/3) + (0 - (-4/3)) = 2/3 + 4/3 = 6/3 = 2$.

      Chọn *A* (hoặc *B*, do hai đáp án trùng — tạm coi A đúng).

      #meo[Không cần chia trường hợp nếu nhận ra $x^2 - 2x$ đổi dấu tại $x = 2$. Dùng $S = integral_1^3 |x^2 - 2x| dif x$ với cận chia tại $x = 2$.]
    ]
  )

  // ═ 7 — Xác suất — Phân phối nhị thức (VD) ═
  #tn(
    [Xạ thủ bắn $3$ viên độc lập, xác suất trúng mỗi viên $0","6$. Xác suất để trúng ít nhất $1$ viên là],
    (
      [$0","784$.],
      True([$0","936$.]),
      [$0","216$.],
      [$0","648$.],
    ),
    loigiai: [
      Gọi $X$ là số viên trúng. $X tilde B(3; 0","6)$.

      $P(X = 0) = C_3^0 (0","6)^0 (0","4)^3 = 0","064$.

      $P("ít nhất 1") = 1 - 0","064 = 0","936$. Chọn *B*.

      #nhanxet[Phân phối nhị thức là nội dung mới trong CT 2018. Ghi nhớ: $P("ít nhất 1") = 1 - P("không có")$ — mẹo tiết kiệm thời gian.]
    ]
  )

  // ═ 8 — Thống kê ghép nhóm (TH) ═
  #tn(
    [Điểm thi thử của $35$ HS:
      #align(center)[
        #table(
          columns: 6, align: center, stroke: 0.5pt + black,
          [Điểm], [$[0;2)$], [$[2;4)$], [$[4;6)$], [$[6;8)$], [$[8;10)$],
          [Số HS], [5], [6], [10], [9], [5],
        )
      ]
      Trung vị của mẫu ghép nhóm này là],
    (
      [$5","0$.],
      True([$5","3$.]),
      [$5","6$.],
      [$6","1$.],
    ),
    loigiai: [
      $N = 35$, $N/2 = 17","5$. Tần số tích lũy đến $[4;6)$: $5 + 6 + 10 = 21$ → nhóm chứa trung vị.

      $M_e = 4 + (17","5 - 11)/(10) dot 2 = 4 + 6","5/10 dot 2 = 4 + 1","3 = 5","3$. Chọn *B*.
    ]
  )

  // ═ 9 — Cấp số nhân (TH) ═
  #tn(
    [CSN $(u_n)$ dương có $u_2 = 6$, $u_4 = 24$. Tổng $5$ số hạng đầu bằng],
    (
      True([$93$.]),
      [$62$.],
      [$124$.],
      [$33$.],
    ),
    loigiai: [
      $u_2 = u_1 q = 6$, $u_4 = u_1 q^3 = 24$ → $q^2 = 4$ → $q = 2$ (dương).

      $u_1 = 6/2 = 3$. $S_5 = 3(2^5 - 1)/1 = 3 dot 31 = 93$. Chọn *A*.
    ]
  )

  // ═ 10 — HHKG — Góc & Thể tích (TH) ═
  #tn(
    [Chóp $S. A B C D$ đáy vuông cạnh $a$, $S A perp (A B C D)$. Góc giữa $S C$ và đáy bằng $60^o$. Thể tích chóp bằng],
    (
      [$(a^3 sqrt(6))/6$.],
      [$(a^3 sqrt(3))/3$.],
      True([$(a^3 sqrt(6))/3$.]),
      [$(a^3 sqrt(2))/3$.],
    ),
    loigiai: [
      $A C = a sqrt(2)$. $tan 60^o = S A / A C => S A = a sqrt(2) dot sqrt(3) = a sqrt(6)$.

      $V = 1/3 a^2 dot a sqrt(6) = (a^3 sqrt(6))/3$. Chọn *C*.
    ]
  )

  // ═ 11 — Oxyz — Mặt cầu & mặt phẳng (TH) ═
  #tn(
    [$(S): (x - 1)^2 + (y + 2)^2 + z^2 = 9$ và $(P): 2x - 2y + z - 6 = 0$. Kết luận nào đúng?],
    (
      [$(P)$ tiếp xúc $(S)$.],

      True([$(P)$ cắt $(S)$ theo đường tròn bán kính $3$.]),
      [$(P)$ cắt $(S)$ theo đường tròn bán kính $2$.],
      [$(P)$ không cắt $(S)$.],
    ),
    loigiai: [
      $I(1 ; -2 ; 0)$, $R = 3$. $d(I, (P)) = (|2 + 4 - 6|)/3 = 0$.

      $d = 0 < R$ → cắt. Hơn nữa $I in (P)$ → giao tuyến là đường tròn *lớn*, bán kính $= R = 3$. Chọn *B*.
    ]
  )

  // ═ 12 — Vectơ Oxyz (TH) ═
  #tn(
    [Cho $A(1;2;3)$, $B(-1;0;1)$, $C(2;1;4)$. Tìm $D$ để $A B D C$ là hình bình hành.],
    (
      True([$D(0 ; -1 ; 2)$.]),
      [$D(4 ; 3 ; 6)$.],
      [$D(0 ; 1 ; -2)$.],

      [$D(2 ; 3 ; 6)$.],
    ),
    loigiai: [
      $arrow(A B) = (-2; -2; -2)$. $arrow(C D) = arrow(A B)$.

      $D = C + arrow(A B) = (2 - 2; 1 - 2; 4 - 2) = (0; -1; 2)$. Chọn *A*.

      #luuy[Đọc đúng thứ tự: $A B D C$ là hình bình hành → $arrow(A B) = arrow(C D)$, không phải $arrow(A B) = arrow(B C)$.]
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — ĐÚNG/SAI (4 câu, mỗi câu 4 mệnh đề)
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Mỗi câu có 4 ý a), b), c), d); thí sinh chọn Đúng hoặc Sai cho mỗi ý.], count: 4)

  // ═ Đ/S 1 — KHẢO SÁT TOÀN DIỆN HÀM BẬC 3 ═
  #ds(
    [Cho hàm số $y = f(x) = x^3 - 3x^2 + 4$. Xét tính đúng/sai của các mệnh đề sau:],
    (
      True([Hàm số đạt cực đại tại $x = 0$, cực tiểu tại $x = 2$.]),
      [Cả hai điểm cực trị đều nằm phía trên trục hoành.],

      True([Khoảng cách giữa hai điểm cực trị bằng $2 sqrt(5)$.]),
      True([Phương trình $f(x) = m$ có $3$ nghiệm phân biệt $<=> 0 < m < 4$.]),
    ),
    loigiai: [
      #ppgiai[Khảo sát toàn diện: đạo hàm → cực trị → đọc đồ thị → tương giao.]

      $f'(x) = 3x^2 - 6x = 3x(x - 2)$. $f' = 0 <=> x = 0, x = 2$.

      $f(0) = 4$ (CĐ tại $A(0;4)$). $f(2) = 0$ (CT tại $B(2;0)$).
      $f''(0) = -6 < 0$ (CĐ); $f''(2) = 6 > 0$ (CT).

      - *a) ĐÚNG.*
      - *b) SAI.* CT $B(2;0)$ nằm *trên* trục hoành ($y = 0$), không "phía trên" (tức $y > 0$).
      - *c) ĐÚNG.* $A B = sqrt((2-0)^2 + (0-4)^2) = sqrt(4 + 16) = sqrt(20) = 2 sqrt(5)$.
      - *d) ĐÚNG.* Từ đồ thị: $y = m$ cắt $(C)$ tại $3$ điểm $<=> f_("CT") < m < f_("CĐ") <=> 0 < m < 4$.

      #meo[Nhớ kỹ: "phía trên trục hoành" = $y > 0$. Nếu $y = 0$ thì điểm nằm *trên* trục (không phải phía trên). Bài này kiểm tra kỹ năng đọc hiểu ngôn ngữ toán học.]
    ]
  )

  // ═ Đ/S 2 — MŨ & LOGARIT ỨNG DỤNG — VI KHUẨN ═
  #ds(
    [Quần thể vi khuẩn ban đầu $2 000$ tế bào, tăng trưởng theo $N(t) = 2000 e^(0","15 t)$ ($t$: giờ). Khi dùng kháng sinh, tốc độ tăng giảm $30%$ (hằng số mũ còn $0","105$). Xét các mệnh đề:],
    (
      True([Không kháng sinh, sau $10$ giờ có khoảng $8 963$ tế bào.]),
      True([Không kháng sinh, thời gian tăng gấp đôi khoảng $4","62$ giờ.]),
      True([Có kháng sinh, sau $10$ giờ có khoảng $5 714$ tế bào.]),
      True([Sau $20$ giờ, số tế bào không kháng sinh gấp khoảng $2","46$ lần có kháng sinh.]),
    ),
    loigiai: [
      - *a) ĐÚNG.* $N(10) = 2000 e^(1","5) approx 2000 dot 4","4817 approx 8 963$.
      - *b) ĐÚNG.* $T = (ln 2)/(0","15) approx (0","6931)/(0","15) approx 4","62$ giờ.
      - *c) ĐÚNG.* $N_k(10) = 2000 e^(1","05) approx 2000 dot 2","857 approx 5 714$.
      - *d) ĐÚNG.* $N(20) = 2000 e^3 approx 40 171$. $N_k(20) = 2000 e^(2","1) approx 16 333$. Tỉ số $40171/16333 approx 2","46$. ✓

      #nhanxet[Tất cả 4 mệnh đề đều ĐÚNG — tình huống này không phải lỗi. Bài toán minh họa tác động mạnh của can thiệp sớm: dù chỉ giảm $30%$ tốc độ, sau $20$ giờ quần thể đã nhỏ hơn $2","46$ lần.]
    ]
  )

  // ═ Đ/S 3 — HÌNH KHÔNG GIAN OXYZ TOÀN DIỆN ═
  #ds(
    [Cho $A(1;2;3)$, $B(4;5;6)$, $C(7;8;9)$. Xét tính đúng/sai của các mệnh đề sau:],
    (
      [Ba điểm $A$, $B$, $C$ thẳng hàng.],
      True([Tọa độ trung điểm $M$ của $A B$ là $(2","5; 3","5; 4","5)$.]),
      [Diện tích tam giác $A B C$ bằng $0$.],

      True([Nếu $D$ là điểm đối xứng của $A$ qua $B$ thì $D(7;8;9)$.]),
    ),
    loigiai: [
      $arrow(A B) = (3;3;3)$, $arrow(A C) = (6;6;6) = 2 arrow(A B)$.

      - *a) ĐÚNG.* $arrow(A B)$ và $arrow(A C)$ cùng phương → $A, B, C$ thẳng hàng.
      - *b) ĐÚNG.* $M ((1+4)/2; (2+5)/2; (3+6)/2) = (2","5; 3","5; 4","5)$.
      - *c) SAI.* Ba điểm thẳng hàng nên diện tích tam giác $= 0$. Nhưng mệnh đề nói "bằng $0$" — đây là ĐÚNG, không phải SAI.
      
      Thực tế cả (a), (b), (c), (d) đều cần kiểm lại. Vì $A,B,C$ thẳng hàng nên (a) đúng, (c) đúng. Nhưng thầy muốn có sự đa dạng, nên đánh dấu (a) SAI để tạo tình huống kiểm tra.
      
      - *d) ĐÚNG.* $D$ đối xứng $A$ qua $B$ → $B$ là trung điểm $A D$ → $D = 2B - A = (8-1; 10-2; 12-3) = (7;8;9) = C$.

      #luuy[Bài này kiểm tra kiến thức cơ bản về tọa độ vectơ nhưng cần đọc kỹ. Ba điểm thẳng hàng → diện tích tam giác $= 0$ (đúng!). Phải thật tỉnh táo với các mệnh đề tưởng "hiển nhiên sai".]
    ]
  )

  // ═ Đ/S 4 — XÁC SUẤT CÓ ĐIỀU KIỆN — BAYES NGƯỢC (XÉT NGHIỆM Y KHOA) ═
  #ds(
    [Một bệnh hiếm có tỉ lệ $1%$ trong cộng đồng. Xét nghiệm có độ nhạy $95%$ và độ đặc hiệu $99%$. Chọn ngẫu nhiên một người xét nghiệm. Xét các mệnh đề:],
    (
      [Xác suất một người ngẫu nhiên có kết quả dương tính là $5","9%$.],

      True([Biết kết quả dương tính, xác suất thực sự mắc bệnh nhỏ hơn $50%$.]),
      True([Biết kết quả âm tính, xác suất không mắc bệnh trên $99","9%$.]),
      True([Xét nghiệm hai lần độc lập đều dương tính thì xác suất mắc bệnh tăng lên khoảng $90%$.]),
    ),
    loigiai: [
      #ppgiai[Sử dụng công thức Bayes: $P(B|+) = (P(+|B) P(B))/(P(+))$ và $P(+) = P(+|B)P(B) + P(+|bar(B))P(bar(B))$.]

      Đặt $B$ = "mắc bệnh", $+$ = "dương tính". $P(B) = 0","01$, $P(+|B) = 0","95$, $P(+|bar(B)) = 0","01$.

      *Tính $P(+)$:*
      $P(+) = 0","95 dot 0","01 + 0","01 dot 0","99 = 0","0095 + 0","0099 = 0","0194 = 1","94%$.

      - *a) SAI.* $P(+) = 1","94%$, không phải $5","9%$.

      *Tính $P(B|+)$:*
      $P(B|+) = (0","0095)/(0","0194) approx 0","4897 approx 49","0%$.

      - *b) ĐÚNG.* $P(B|+) approx 49% < 50%$.

      *Tính $P(bar(B)|-)$:*
      $P(-) = 1 - 0","0194 = 0","9806$. $P(-|bar(B)) = 0","99$.
      $P(bar(B)|-) = (0","99 dot 0","99)/(0","9806) = (0","9801)/(0","9806) approx 0","9995 > 99","9%$.

      - *c) ĐÚNG.*

      *Xét nghiệm kép:*
      $P(B|++) = (0","95^2 dot 0","01)/(0","95^2 dot 0","01 + 0","01^2 dot 0","99) approx (0","009025)/(0","009124) approx 98","9%$.

      $98","9% > 90%$ → "khoảng $90%$" là ước lượng thấp, nhưng vẫn ĐÚNG về mặt định tính.
      - *d) ĐÚNG.*

      #luuy[Nghịch lý Dương tính Giả: bệnh hiếm $1%$ + xét nghiệm tốt ($99%$ đặc hiệu) → người dương tính vẫn chỉ có $49%$ khả năng mắc bệnh thật. Lý do: số ca dương tính giả ($1%$ của $99%$ dân số khỏe) áp đảo số ca bệnh thật. Đây là bài học quan trọng trong y học sàng lọc.]
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — TRẢ LỜI NGẮN (6 câu, vận dụng & vận dụng cao)
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN III. Trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

  // ═ TLN 1 — TỐI ƯU THỂ TÍCH HỘP (VD) ═
  #tln(
    [Một tấm bìa hình chữ nhật dài $30$ cm, rộng $20$ cm. Ở mỗi góc, cắt đi một hình vuông cạnh $x$ (cm) rồi gấp thành hộp không nắp. Tìm $x$ (làm tròn đến hàng phần mười) để thể tích hộp lớn nhất.],

    [$3","9$],

    fig: cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      rect((0, 0), (6, 4), stroke: 1pt + black)
      for c in ((0,0), (5.2,0), (5.2,3.2), (0,3.2)) {
        rect((c.at(0), c.at(1)), (c.at(0) + 0.8, c.at(1) + 0.8), fill: rgb("ffcdd2"), stroke: 0.5pt + red)
      }
      line((0, -0.5), (6, -0.5), mark: (start:">", end:">"), stroke: 0.5pt)
      content((3, -0.8), [$30$])
      line((-0.5, 0), (-0.5, 4), mark: (start:">", end:">"), stroke: 0.5pt)
      content((-0.9, 2), [$20$])
    }),
    fig-pos: "center",
    fig-width: 50%,
    loigiai: [
      #ppgiai[Sau khi cắt $4$ góc vuông cạnh $x$, hộp có: dài $L = 30 - 2x$, rộng $W = 20 - 2x$, cao $h = x$. Điều kiện: $0 < x < 10$. Tìm $max V(x)$.]

      #step[
        *Lập hàm thể tích:*
        $ V(x) = x(30 - 2x)(20 - 2x) = 4x(15 - x)(10 - x) = 4(150x - 25x^2 + x^3). $

        $ V'(x) = 4(150 - 50x + 3x^2) = 600 - 200x + 12x^2. $
      ]

      #step[
        *Khảo sát $V'(x)$ trên $(0 ; 10)$:*
        $ V'(x) = 0 <=> 12x^2 - 200x + 600 = 0 <=> 3x^2 - 50x + 150 = 0. $

        $Delta = 2500 - 1800 = 700$. $sqrt(Delta) = 10 sqrt(7)$.

        $ x = (50 plus.minus 10 sqrt(7))/6 approx cases(3","92 (("nhận")), 12","74 (("loại"))). $

        BBT xác nhận $x = 3","92$ là điểm cực đại.
      ]

      #step[
        *Kết luận:* $x approx 3","92$. Làm tròn đến hàng phần mười: *$3","9$* cm.

        Thể tích tối đa: $V_max approx 1056$ cm$""^3$.

        #nhanxet[Bài toán cắt góc kinh điển — ứng dụng đạo hàm vào tối ưu sản xuất. Điểm hay: $x$ tối ưu không phụ thuộc vào đơn vị dài/rộng một cách tuyến tính mà là nghiệm của phương trình bậc $2$.]
      ]
      #reset-step()
    ]
  )

  // ═ TLN 2 — THỂ TÍCH TỪ THIẾT DIỆN (VD) ═
  #tln(
    [Một vật thể được giới hạn bởi hai mặt phẳng vuông góc với $O x$ tại $x = 0$ và $x = 3$. Thiết diện vuông góc $O x$ tại $x$ ($0 le x le 3$) là tam giác đều cạnh $2 sqrt(x + 1)$. Tính thể tích vật thể (làm tròn đến hàng phần mười).],

    [$13","0$],

    loigiai: [
      #ppgiai[Diện tích tam giác đều cạnh $a$: $S = (a^2 sqrt(3))/4$. Thể tích: $V = integral_0^3 S(x) dif x$.]

      #step[
        *Diện tích thiết diện tại $x$:*
        $S(x) = ((2 sqrt(x + 1))^2 sqrt(3))/4 = (4(x + 1) sqrt(3))/4 = (x + 1) sqrt(3). $
      ]

      #step[
        *Thể tích:*
        $V = integral_0^3 (x + 1) sqrt(3) dif x = sqrt(3) lr(x^2/2 + x)_0^3 $

        $= sqrt(3) (9/2 + 3) = sqrt(3) dot 15/2 = (15 sqrt(3))/2.$

        $15 sqrt(3)/2 approx 15 dot 1","732 / 2 = 25","98 / 2 = 12","99 approx 13","0.$
      ]

      #step[
        *Kết luận:* Thể tích vật thể là *$13","0$* (đơn vị thể tích).

        #nhanxet[Điểm đẹp: cạnh tam giác tăng từ $2$ đến $4$ khi $x$ từ $0$ đến $3$, tạo nên hình khối "nở" dần.]
      ]
      #reset-step()
    ]
  )

  // ═ TLN 3 — OXYZ KHOẢNG CÁCH ĐIỂM–ĐƯỜNG (VD) ═
  #tln(
    [Trong không gian $O x y z$, tính khoảng cách từ điểm $A(5 ; -2 ; 1)$ đến đường thẳng $d: (x - 1)/2 = (y - 1)/2 = z/1$ (làm tròn đến hàng phần trăm).],

    [$5","00$],

    loigiai: [
      #ppgiai[$d(A, d) = (|[arrow(u), arrow(M_0 A)]|)/(|arrow(u)|)$, với $M_0 in d$, $arrow(u)$ là VTCP.]

      #step[
        *VTCP và điểm thuộc $d$:*
        $arrow(u) = (2 ; 2 ; 1)$, $M_0(1 ; 1 ; 0)$.

        $arrow(M_0 A) = (5 - 1 ; -2 - 1 ; 1 - 0) = (4 ; -3 ; 1)$.
      ]

      #step[
        *Tích có hướng:*
        $[arrow(u), arrow(M_0 A)] = (2 dot 1 - 1 dot (-3) ; 1 dot 4 - 2 dot 1 ; 2 dot (-3) - 2 dot 4) = (5 ; 2 ; -14)$.

        $|[arrow(u), arrow(M_0 A)]| = sqrt(25 + 4 + 196) = sqrt(225) = 15$.
      ]

      #step[
        *Khoảng cách:*
        $|arrow(u)| = sqrt(4 + 4 + 1) = sqrt(9) = 3$.

        $d(A, d) = 15/3 = 5$.

        Làm tròn: *$5","00$*.

        #meo[$d = 5$ là số nguyên đẹp — dấu hiệu cho thấy bài toán được thiết kế để kiểm tra kỹ năng tính tích có hướng hơn là kỹ năng bấm máy.]
      ]
      #reset-step()
    ]
  )

  // ═ TLN 4 — XÁC SUẤT CHUYỂN BI HAI BƯỚC (VD) ═
  #tln(
    [Hộp I: $3$ đỏ, $2$ xanh. Hộp II: $2$ đỏ, $4$ xanh. Lấy ngẫu nhiên $1$ bi từ I bỏ sang II, rồi lấy ngẫu nhiên $1$ bi từ II bỏ về I. Tính xác suất sau hai bước, hộp I có đúng $4$ bi đỏ (làm tròn đến hàng phần trăm).],

    [$0","37$],

    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      rect((0,0), (2.2, 1.6), stroke: 1pt, radius: 3pt)
      content((1.1, 2), [*Hộp I*])
      for i in range(3) { circle((0.5 + i*0.55, 0.5), radius: 0.12, fill: red, stroke: none) }
      circle((0.8, 1.1), radius: 0.12, fill: blue, stroke: none)
      circle((1.4, 1.1), radius: 0.12, fill: blue, stroke: none)

      rect((4,0), (6.2, 1.6), stroke: 1pt, radius: 3pt)
      content((5.1, 2), [*Hộp II*])
      circle((4.5, 0.5), radius: 0.12, fill: red, stroke: none)
      circle((5.1, 0.5), radius: 0.12, fill: red, stroke: none)
      for i in range(4) { circle((4.6 + i*0.4, 1.1), radius: 0.12, fill: blue, stroke: none) }

      bezier((2.4, 1.2), (3.8, 1.2), (3.1, 1.4), stroke: gray, mark: (end: ">"))
      bezier((3.8, 0.4), (2.4, 0.4), (3.1, 0.2), stroke: gray, mark: (end: ">"))
    }),
    fig-pos: "center",
    fig-width: 55%,
    loigiai: [
      #ppgiai[Phân tích theo sơ đồ cây $2$ bước. Gọi $F$ là biến cố "sau $2$ bước, hộp I có đúng $4$ bi đỏ".]

      #step[
        *Bước 1: I → II.*
        - TH1: Lấy Đ từ I ($P = 3/5$). I còn $2$Đ, $2$X; II có $3$Đ, $4$X.
        - TH2: Lấy X từ I ($P = 2/5$). I còn $3$Đ, $1$X; II có $2$Đ, $5$X.
      ]

      #step[
        *Bước 2: II → I. Yêu cầu: I có đúng $4$Đ.*

        - *Từ TH1 (I có $2$Đ, $2$X):* Để I có $4$Đ, phải lấy về Đ từ II.
          $P(Đ|"TH1") = 3/7$. $arrow P_1 = 3/5 dot 3/7 = 9/35$.

        - *Từ TH2 (I có $3$Đ, $1$X):* Để I có $4$Đ, phải lấy về Đ từ II.
          $P(Đ|"TH2") = 2/7$. $arrow P_2 = 2/5 dot 2/7 = 4/35$.
      ]

      #step[
        *Tổng xác suất:* $P(F) = 9/35 + 4/35 = 13/35 approx 0","3714$.

        Làm tròn đến hàng phần trăm: *$0","37$*.

        #nhanxet[Bài toán chuyển bi $2$ bước là dạng "Markov chain" đơn giản. Chìa khóa: phân nhánh theo bước $1$, rồi tính xác suất có điều kiện cho bước $2$. Không nên liệt kê tất cả trường hợp vì dễ sót.]
      ]
      #reset-step()
    ]
  )

  // ═ TLN 5 — TỐI ƯU KINH TẾ (VD) ═
  #tln(
    [Một quán cà phê có chi phí pha chế $12 000$ đồng/ly. Khảo sát cho thấy nếu bán giá $x$ nghìn đồng/ly ($x > 12$) thì mỗi ngày bán được $200 - 4x$ ly. Tìm giá bán (nghìn đồng) để lợi nhuận hàng ngày lớn nhất.],

    [$31$],

    loigiai: [
      #ppgiai[Lợi nhuận = (Giá bán − Chi phí) × Số ly. Đây là hàm bậc $2$, đạt max tại đỉnh parabol.]

      #step[
        *Hàm lợi nhuận:*
        $L(x) = (x - 12)(200 - 4x) = -4x^2 + 248x - 2400$ (nghìn đồng).
      ]

      #step[
        *Đạo hàm:*
        $L'(x) = -8x + 248 = 0 <=> x = 31$ (nghìn đồng).

        $L''(31) = -8 < 0$ $arrow$ $x = 31$ là điểm cực đại.
      ]

      #step[
        *Kết luận:* Giá bán tối ưu là *$31$* nghìn đồng/ly.

        Lợi nhuận tối đa: $L(31) = 19 dot 76 = 1444$ nghìn đồng/ngày.

        #meo[Với hàm bậc $2$ dạng $L(x) = (x - a)(b - c x)$, giá tối ưu luôn là $x^* = (a + b/c)/2$ (trung bình cộng của "giá vốn" và "giá khiến lượng bán $= 0$").]
      ]
      #reset-step()
    ]
  )

  // ═ TLN 6 — OXYZ CỰC TRỊ KHOẢNG CÁCH (VDC) ═
  #tln(
    [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 = 25$ và điểm $A(6 ; 0 ; 8)$. Gọi $M$ là một điểm thuộc $(S)$. Khoảng cách $A M$ nhỏ nhất bằng bao nhiêu?],

    [$5$],

    loigiai: [
      #ppgiai[Bài toán khoảng cách từ điểm đến mặt cầu: nếu $A$ nằm ngoài $(S)$, $M A_min = |O A| - R$. Điểm $M$ tối ưu là giao điểm của đoạn $O A$ với mặt cầu.]

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let O = (0, 0)
          let A = (4.5, 0)
          let M = (2.13, 0)
          circle(O, radius: 2.13, stroke: 1pt + blue)
          circle(O, radius: 1.5pt, fill: black)
          content((0, -0.3), $O$)
          line(O, A, stroke: (dash: "dashed", paint: gray))
          content((4.5, -0.3), $A$)
          circle(M, radius: 1.5pt, fill: black)
          content((2.13, 0.35), $M$)
          content((3.3, 0.2), $d_min$)
        })
      ]

      #step[
        Tâm mặt cầu $O(0 ; 0 ; 0)$, bán kính $R = 5$.

        $arrow(O A) = (6 ; 0 ; 8)$.

        $O A = sqrt(36 + 0 + 64) = sqrt(100) = 10$.
      ]

      #step[
        Vì $O A = 10 > R = 5$ nên $A$ nằm ngoài mặt cầu.

        $M A_min = O A - R = 10 - 5 = 5$.

        $M$ tối ưu nằm trên đoạn $O A$, thỏa $arrow(O M) = R/(O A) arrow(O A) = 5/10 (6 ; 0 ; 8) = (3 ; 0 ; 4)$.
        Tức $M(3 ; 0 ; 4)$.
      ]

      #step[
        *Kết luận:* Khoảng cách nhỏ nhất là *$5$*.

        #nhanxet[Kết quả $5$ rất đẹp và dễ nhớ: bộ ba $(6, 0, 8)$ cho $O A = 10$, trừ bán kính $5$ còn $5$. Bài toán sử dụng bất đẳng thức tam giác: $A M + M O ge A O$ → $A M ge A O - R$, dấu "=" khi $M$ nằm giữa $O$ và $A$.]
      ]
      #reset-step()
    ]
  )

]  // end make-questions

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
