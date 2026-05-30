// nc4-hinh-hoc.typ — Advanced Chapter 4: Advanced Geometry

#import "_theme-nc.typ": *

#page[
  #chapter-header-nc(4, "Hình học nâng cao / Advanced Geometry", C-CH-NC.at(3))

  #learning-objectives-nc[
    - Tính diện tích hình chữ L / Calculate area of L-shape
    - Tính diện tích hình chữ T / Calculate area of T-shape
    - Ghép và cắt hình / Combine and cut shapes
    - Nhận biết hình đối xứng / Recognize symmetric shapes
  ]

  #section-divider-nc()

  #key-reminder-nc[
    #v(0.3em)
    - Hình chữ L: chia thành 2 hình chữ nhật, tính diện tích từng phần rồi cộng
    - Hình chữ T: chia thành 3 hình chữ nhật
    - Ghép hình: diện tích hình ghép bằng tổng diện tích các hình thành phần
    - Cắt hình: diện tích hình còn lại bằng diện tích ban đầu trừ diện tích phần cắt
    - Đối xứng: hình có trục đối xứng
    - English:
      - L-shape: divide into 2 rectangles, add areas
      - T-shape: divide into 3 rectangles
      - Combine shapes: total area = sum of parts
      - Cut shapes: remaining area = original - cut area
      - Symmetry: shape has axis of symmetry
  ]

  #section-divider-nc()

  #example-nc[
    #v(0.3em)
    Hình chữ L có kích thước: ngoài 8 cm × 6 cm, trong cắt 4 cm × 3 cm
    #v(0.3em)
    Diện tích = (8 × 6) - (4 × 3) = 48 - 12 = 36 cm²
    #v(0.3em)
    Hoặc chia thành 2 hình chữ nhật: 8×3 + 4×3 = 24 + 12 = 36 cm²
  ]

  #section-divider-nc()

  #exercise-section-nc("Bài tập cơ bản / Basic Exercises", [
    #math-problem-nc(1, "Tính diện tích hình chữ L: ngoài 10 cm × 8 cm, trong cắt 5 cm × 4 cm")
    #math-problem-nc(2, "Tính diện tích hình chữ T: thanh ngang 12 cm × 3 cm, thanh dọc 4 cm × 6 cm")
    #math-problem-nc(3, "Một hình vuông cạnh 10 cm, cắt đi một hình vuông nhỏ cạnh 4 cm ở góc. Tính diện tích còn lại")
    #math-problem-nc(4, "Ghép 2 hình chữ nhật 6 cm × 4 cm và 8 cm × 3 cm. Tính diện tích hình ghép")
    #math-problem-nc(5, "Vẽ trục đối xứng của hình chữ nhật")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập luyện tập / Practice Exercises", [
    #math-problem-nc(6, "Tính diện tích hình chữ L: ngoài 12 cm × 10 cm, trong cắt 6 cm × 5 cm")
    #math-problem-nc(7, "Một hình chữ nhật 15 cm × 10 cm, cắt đi một hình vuông cạnh 5 cm ở mỗi góc. Tính diện tích còn lại")
    #math-problem-nc(8, "Ghép 3 hình vuông cạnh 4 cm thành hình chữ nhật. Tính chu vi và diện tích")
    #math-problem-nc(9, "Hình nào có trục đối xứng: hình chữ nhật, hình bình hành, hình thoi?")
    #math-problem-nc(10, "Một hình chữ T có kích thước: thanh ngang 10 cm × 2 cm, thanh dọc 2 cm × 8 cm. Tính diện tích")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập tư duy / Thinking Challenges", [
    #math-problem-nc(11, "Một hình chữ L có diện tích 60 cm². Ngoài 12 cm × 8 cm. Tìm kích thước phần cắt")
    #math-problem-nc(12, "Có thể ghép 4 hình vuông nhỏ cạnh 3 cm thành bao nhiêu hình chữ nhật khác nhau? Tính diện tích mỗi hình")
    #math-problem-nc(13, "Một hình chữ nhật có chiều dài gấp đôi chiều rộng. Cắt một hình vuông cạnh 2 cm ở mỗi góc, diện tích còn lại 60 cm². Tìm kích thước ban đầu")
  ])

  #progress-tracker-nc(4, 3)
]
