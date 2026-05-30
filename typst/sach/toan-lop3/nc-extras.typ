// nc-extras.typ — Extras for Grade 3 Math Book II

#import "_theme-nc.typ": *

#page[
  #chapter-header-nc(0, "Đề tổng kết / Final Review", C-CH-NC.at(2))

  #section-divider-nc()

  #text(weight: "bold", size: 14pt)[Đề tổng kết Quyển II / Book II Final Exam]
  #v(0.5em)

  #exercise-section-nc("Phần 1: Trắc nghiệm (5 điểm) / Multiple Choice (5 points)", [
    #math-problem-nc(1, "Số nguyên tố nào sau đây? A) 21 B) 23 C) 25 D) 27")
    #math-problem-nc(2, "Kết quả của 56 × 11 là: A) 616 B) 560 C) 506 D) 660")
    #math-problem-nc(3, "Diện tích hình chữ L: ngoài 10 cm × 8 cm, trong cắt 4 cm × 3 cm là: A) 80 cm² B) 68 cm² C) 60 cm² D) 72 cm²")
    #math-problem-nc(4, "Phân số ⅔ + ⅓ = ? A) 1 B) 2/3 C) 3/3 D) 4/3")
    #math-problem-nc(5, "Số 84 chia cho 7 được: A) 11 B) 12 C) 13 D) 14")
  ])

  #section-divider-nc()

  #exercise-section-nc("Phần 2: Tự luận (5 điểm) / Open-ended (5 points)", [
    #math-problem-nc(6, "Phân tích 90 thành thừa số nguyên tố")
    #math-problem-nc(7, "Tính nhẩm: 999 × 8")
    #math-problem-nc(8, "Một hình chữ T có diện tích 50 cm². Thanh ngang 10 cm × 2 cm. Tìm kích thước thanh dọc")
    #math-problem-nc(9, "So sánh: ⅗ và ⅘")
    #math-problem-nc(10, "Tìm số tự nhiên nhỏ nhất có 3 chữ số chia hết cho 2, 3 và 5")
  ])

  #section-divider-nc()

  #text(weight: "bold", size: 14pt)[Sách tham khảo / References]
  #v(0.5em)

  #info-box-nc("📚 Tài liệu tham khảo / References", [
    #v(0.3em)
    - Sách giáo khoa Toán lớp 3 (Bộ Giáo dục và Đào tạo)
    - Singapore Math Primary Mathematics Grade 3
    - SASMO Past Papers Grade 3
    - Kangaroo Math Past Papers Pré-Ecolier
    - Toán nâng cao lớp 3 (Nhiều tác giả)
  ])

  #section-divider-nc()

  #text(weight: "bold", size: 14pt)[Lời kết / Conclusion]
  #v(0.5em)

  #block(
    fill: rgb("#F0FDF4"),
    inset: 10pt,
    radius: 6pt,
    stroke: 1pt + rgb("#22C55E"),
  )[
    #text(size: 11pt)[
      Chúc mừng các em đã hoàn thành Quyển II — Toán Lớp 3 Nâng Cao!
      #v(0.5em)
      Các em đã học được nhiều kiến thức mới và phát triển tư duy toán học.
      #v(0.5em)
      Hãy tiếp tục rèn luyện và khám phá thế giới toán học kỳ diệu!
      #v(1em)
      Congratulations on completing Book II — Advanced Grade 3 Mathematics!
      #v(0.5em)
      You have learned many new concepts and developed your mathematical thinking.
      #v(0.5em)
      Keep practicing and exploring the wonderful world of mathematics!
    ]
  ]

  #progress-tracker-nc(9, 3)
]
