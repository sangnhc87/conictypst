// nc6-thu-thach.typ — Advanced Chapter 6: Olympiad Challenges

#import "_theme-nc.typ": *

#page[
  #chapter-header-nc(6, "Thử thách Olympiad / Olympiad Challenges", C-CH-NC.at(5))

  #learning-objectives-nc[
    - Giải bài toán SASMO cấp độ 1-2 / Solve SASMO level 1-2 problems
    - Giải bài toán Kangaroo Pré-Ecolier / Solve Kangaroo Pré-Ecolier problems
    - Phát triển tư duy logic / Develop logical thinking
    - Rèn luyện kỹ năng giải toán nhanh / Practice quick problem-solving
  ]

  #section-divider-nc()

  #key-reminder-nc[
    #v(0.3em)
    - Đọc kỹ đề bài, xác định dữ kiện
    - Vẽ sơ đồ nếu cần
    - Thử các trường hợp có thể
    - Kiểm tra lại kết quả
    - English:
      - Read carefully, identify given information
      - Draw diagrams if needed
      - Try possible cases
      - Check your answer
  ]

  #section-divider-nc()

  #example-nc[
    #v(0.3em)
    Bài toán SASMO: Tìm số có 2 chữ số biết tổng các chữ số bằng 12 và tích các chữ số bằng 32
    #v(0.3em)
    Giải: Gọi số là ab. a + b = 12, a × b = 32
    #v(0.3em)
    Thử: 4 × 8 = 32, 4 + 8 = 12. Vậy số là 48 hoặc 84
  ]

  #section-divider-nc()

  #exercise-section-nc("Bài tập cơ bản / Basic Exercises", [
    #math-problem-nc(1, "Tìm số có 2 chữ số biết tổng các chữ số bằng 9 và tích các chữ số bằng 20")
    #math-problem-nc(2, "Có bao nhiêu số có 2 chữ số mà chữ số hàng chục lớn hơn chữ số hàng đơn vị?")
    #math-problem-nc(3, "Một số khi nhân với 3 rồi cộng với 5 được 26. Tìm số đó")
    #math-problem-nc(4, "Tìm số tự nhiên x biết: x + x + x = 24")
    #math-problem-nc(5, "Có 3 số tự nhiên liên tiếp có tổng bằng 24. Tìm các số đó")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập luyện tập / Practice Exercises", [
    #math-problem-nc(6, "Tìm số có 3 chữ số biết tổng các chữ số bằng 10 và chữ số hàng trăm gấp 3 lần chữ số hàng đơn vị")
    #math-problem-nc(7, "Một hình vuông có chu vi 36 cm. Nếu tăng cạnh thêm 2 cm thì diện tích tăng bao nhiêu?")
    #math-problem-nc(8, "Có 5 số tự nhiên liên tiếp có tổng bằng 35. Tìm số lớn nhất")
    #math-problem-nc(9, "Một số khi chia cho 7 được thương là 8 và dư 5. Tìm số đó")
    #math-problem-nc(10, "Tìm số tự nhiên nhỏ nhất có 3 chữ số chia hết cho 3 và 5")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập tư duy / Thinking Challenges", [
    #math-problem-nc(11, "Tìm số có 2 chữ số biết rằng nếu viết thêm chữ số 0 vào giữa thì được số mới gấp 7 lần số cũ")
    #math-problem-nc(12, "Có 3 hộp kẹo. Hộp thứ nhất có 10 cái, hộp thứ hai có 15 cái, hộp thứ ba có 20 cái. Lấy 5 cái từ mỗi hộp. Hỏi tổng số kẹo còn lại là bao nhiêu?")
    #math-problem-nc(13, "Một số có 3 chữ số, chữ số hàng trăm bằng chữ số hàng đơn vị, chữ số hàng chục bằng 0. Số đó chia hết cho 9. Tìm số đó")
    #math-problem-nc(14, "Có bao nhiêu cách xếp 3 bạn A, B, C vào 3 ghế?")
    #math-problem-nc(15, "Tìm số tự nhiên nhỏ nhất có 4 chữ số khác nhau và chia hết cho 5")
  ])

  #progress-tracker-nc(6, 3)
]
