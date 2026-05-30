// nc2-phep-tinh.typ — Advanced Chapter 2: Speed Arithmetic

#import "_theme-nc.typ": *

#page[
  #chapter-header-nc(2, "Tính nhẩm siêu tốc / Speed Arithmetic", C-CH-NC.at(1))

  #learning-objectives-nc[
    - Nhân nhanh với 11 / Quick multiplication by 11
    - Nhân nhanh với 25 / Quick multiplication by 25
    - Kỹ thuật bù số / Compensation technique
    - Tính nhẩm phép chia / Mental division
  ]

  #section-divider-nc()

  #key-reminder-nc[
    #v(0.3em)
    - Nhân với 11: giữ nguyên chữ số đầu và cuối, cộng các cặp chữ số ở giữa
      Ví dụ: 23 × 11 = 2 (2+3) 3 = 253
    - Nhân với 25: nhân với 100 rồi chia cho 4
      Ví dụ: 36 × 25 = 3600 ÷ 4 = 900
    - Bù số: thêm/bớt để làm tròn rồi điều chỉnh
      Ví dụ: 99 × 7 = (100 × 7) - 7 = 700 - 7 = 693
    - Chia cho 5: nhân với 2 rồi chia cho 10
      Ví dụ: 85 ÷ 5 = (85 × 2) ÷ 10 = 170 ÷ 10 = 17
  ]

  #section-divider-nc()

  #example-nc[
    #v(0.3em)
    Tính nhẩm: 47 × 11
    #v(0.3em)
    Giải: 4 (4+7) 7 = 4 11 7 = 517
    #v(0.3em)
    Tính nhẩm: 64 × 25
    #v(0.3em)
    Giải: 64 × 100 = 6400, 6400 ÷ 4 = 1600
    #v(0.3em)
    Tính nhẩm: 98 × 6
    #v(0.3em)
    Giải: (100 × 6) - (2 × 6) = 600 - 12 = 588
  ]

  #section-divider-nc()

  #exercise-section-nc("Bài tập cơ bản / Basic Exercises", [
    #math-problem-nc(1, "Tính nhẩm: 34 × 11")
    #math-problem-nc(2, "Tính nhẩm: 52 × 11")
    #math-problem-nc(3, "Tính nhẩm: 28 × 25")
    #math-problem-nc(4, "Tính nhẩm: 44 × 25")
    #math-problem-nc(5, "Tính nhẩm: 99 × 8")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập luyện tập / Practice Exercises", [
    #math-problem-nc(6, "Tính nhẩm: 67 × 11")
    #math-problem-nc(7, "Tính nhẩm: 88 × 25")
    #math-problem-nc(8, "Tính nhẩm: 97 × 9")
    #math-problem-nc(9, "Tính nhẩm: 75 ÷ 5")
    #math-problem-nc(10, "Tính nhẩm: 120 ÷ 5")
    #math-problem-nc(11, "Tính nhẩm: 56 × 11")
    #math-problem-nc(12, "Tính nhẩm: 32 × 25")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập tư duy / Thinking Challenges", [
    #math-problem-nc(13, "Tính nhẩm: 123 × 11")
    #math-problem-nc(14, "Tính nhẩm: 999 × 7 (sử dụng bù số)")
    #math-problem-nc(15, "Tìm cách tính nhanh: 25 × 48")
  ])

  #progress-tracker-nc(2, 3)
]
