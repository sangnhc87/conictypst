// nc3-toan-do.typ — Advanced Chapter 3: Problem Strategies

#import "_theme-nc.typ": *

#page[
  #chapter-header-nc(3, "Chiến lược giải toán / Problem Strategies", C-CH-NC.at(2))

  #learning-objectives-nc[
    - Sử dụng sơ đồ nhánh / Use branching diagrams
    - Sử dụng bảng hai chiều / Use two-way tables
    - Phương pháp giả thiết tạm / Trial and error method
    - Giải bài toán 3-4 bước / Solve 3-4 step problems
  ]

  #section-divider-nc()

  #key-reminder-nc[
    #v(0.3em)
    - Sơ đồ nhánh: vẽ các nhánh thể hiện các trường hợp có thể
    - Bảng hai chiều: liệt kê các khả năng theo hàng và cột
    - Giả thiết tạm: thử một giá trị, kiểm tra, điều chỉnh
    - Bài toán nhiều bước: đọc kỹ, xác định các bước, giải từng bước
    - English:
      - Branching diagrams: draw branches for possible cases
      - Two-way tables: list possibilities in rows and columns
      - Trial and error: try a value, check, adjust
      - Multi-step problems: read carefully, identify steps, solve step by step
  ]

  #section-divider-nc()

  #example-nc[
    #v(0.3em)
    Bài toán: Một cửa hàng có 3 loại bút: xanh, đỏ, đen. Có 2 loại vở: ô ly, kẻ ngang. Hỏi có bao nhiêu cách chọn 1 bút và 1 vở?
    #v(0.3em)
    Giải bằng sơ đồ nhánh:
    #v(0.3em)
    Bút xanh → vở ô ly, vở kẻ ngang
    Bút đỏ → vở ô ly, vở kẻ ngang
    Bút đen → vở ô ly, vở kẻ ngang
    #v(0.3em)
    Có 3 × 2 = 6 cách
  ]

  #section-divider-nc()

  #exercise-section-nc("Bài tập cơ bản / Basic Exercises", [
    #math-problem-nc(1, "Có 4 loại kem và 3 loại topping. Hỏi có bao nhiêu cách chọn 1 kem và 1 topping?")
    #math-problem-nc(2, "Một số có 2 chữ số, chữ số hàng chục gấp đôi chữ số hàng đơn vị. Tìm số đó")
    #math-problem-nc(3, "Tổng của hai số là 20, hiệu là 4. Tìm hai số đó")
    #math-problem-nc(4, "Một hình chữ nhật có chu vi 30 cm, chiều dài hơn chiều rộng 3 cm. Tìm kích thước")
    #math-problem-nc(5, "Có 15 con vật gồm gà và chó, tổng số chân là 40. Hỏi có bao nhiêu con mỗi loại?")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập luyện tập / Practice Exercises", [
    #math-problem-nc(6, "Một cửa hàng có 5 loại bánh và 4 loại kẹo. Hỏi có bao nhiêu cách chọn 1 bánh và 1 kẹo?")
    #math-problem-nc(7, "Tìm số có 3 chữ số biết tổng các chữ số bằng 15 và chữ số hàng trăm gấp 3 lần chữ số hàng đơn vị")
    #math-problem-nc(8, "Một lớp có 35 học sinh. Số học sinh nam nhiều hơn số học sinh nữ 5 em. Hỏi có bao nhiêu học sinh nam?")
    #math-problem-nc(9, "Một mảnh vườn hình chữ nhật có chiều dài gấp đôi chiều rộng. Chu vi là 36 m. Tính diện tích")
    #math-problem-nc(10, "Có 20 tờ tiền gồm loại 5.000đ và 10.000đ, tổng số tiền là 150.000đ. Hỏi có bao nhiêu tờ mỗi loại?")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập tư duy / Thinking Challenges", [
    #math-problem-nc(11, "Một số có 3 chữ số, chữ số hàng trăm bằng tổng chữ số hàng chục và hàng đơn vị. Tìm số lớn nhất thỏa mãn")
    #math-problem-nc(12, "Có 3 bạn An, Bình, Cường. Mỗi bạn có một số kẹo khác nhau. Tổng số kẹo là 30. An có nhiều hơn Bình 5 cái, Bình có nhiều hơn Cường 3 cái. Hỏi mỗi bạn có bao nhiêu kẹo?")
    #math-problem-nc(13, "Một hình chữ nhật có chiều dài gấp 3 lần chiều rộng. Nếu tăng chiều dài thêm 2 cm và giảm chiều rộng đi 1 cm thì diện tích giảm 4 cm². Tìm kích thước ban đầu")
  ])

  #progress-tracker-nc(3, 3)
]
