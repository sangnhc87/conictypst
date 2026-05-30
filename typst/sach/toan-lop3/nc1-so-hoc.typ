// nc1-so-hoc.typ — Advanced Chapter 1: Number Theory

#import "_theme-nc.typ": *

#page[
  #chapter-header-nc(1, "Lý thuyết số / Number Theory", C-CH-NC.at(0))

  #learning-objectives-nc[
    - Nhận biết số nguyên tố đến 50 / Identify prime numbers up to 50
    - Tìm ước và bội / Find factors and multiples
    - Phân tích số thành thừa số nguyên tố / Prime factorization
    - Ứng dụng trong bài toán thực tế / Real-world applications
  ]

  #section-divider-nc()

  #key-reminder-nc[
    #v(0.3em)
    - Số nguyên tố: chỉ có 2 ước là 1 và chính nó (ví dụ: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47)
    - Hợp số: có nhiều hơn 2 ước
    - Ước của một số: các số chia hết cho số đó
    - Bội của một số: các số chia hết cho số đó
    - Phân tích thừa số nguyên tố: viết số thành tích các số nguyên tố
    - English:
      - Prime numbers: only 2 factors (1 and itself)
      - Composite numbers: more than 2 factors
      - Factors: numbers that divide evenly
      - Multiples: numbers that are divisible by the given number
      - Prime factorization: writing a number as product of primes
  ]

  #section-divider-nc()

  #example-nc[
    #v(0.3em)
    Tìm các ước của 12:
    #v(0.3em)
    12 = 1 × 12 = 2 × 6 = 3 × 4
    #v(0.3em)
    Ước của 12: 1, 2, 3, 4, 6, 12
    #v(0.3em)
    Phân tích 12 thành thừa số nguyên tố: 12 = 2 × 2 × 3 = 2² × 3
    #v(0.3em)
    Số 7 có phải số nguyên tố không? Có, vì chỉ có ước 1 và 7
  ]

  #section-divider-nc()

  #exercise-section-nc("Bài tập cơ bản / Basic Exercises", [
    #math-problem-nc(1, "Tìm các ước của 18")
    #math-problem-nc(2, "Tìm các ước của 24")
    #math-problem-nc(3, "Phân tích 30 thành thừa số nguyên tố")
    #math-problem-nc(4, "Phân tích 45 thành thừa số nguyên tố")
    #math-problem-nc(5, "Số nào là số nguyên tố: 15, 17, 21, 23?")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập luyện tập / Practice Exercises", [
    #math-problem-nc(6, "Tìm bội chung nhỏ nhất của 6 và 8")
    #math-problem-nc(7, "Tìm ước chung lớn nhất của 12 và 18")
    #math-problem-nc(8, "Phân tích 60 thành thừa số nguyên tố")
    #math-problem-nc(9, "Có bao nhiêu số nguyên tố từ 1 đến 30?")
    #math-problem-nc(10, "Tìm số tự nhiên x biết: x là ước của 24 và x > 10")
  ])

  #section-divider-nc()

  #exercise-section-nc("Bài tập tư duy / Thinking Challenges", [
    #math-problem-nc(11, "Tìm số có 2 chữ số là số nguyên tố và tổng các chữ số bằng 10")
    #math-problem-nc(12, "Một số khi chia cho 6 dư 4, chia cho 8 dư 6. Tìm số nhỏ nhất thỏa mãn")
    #math-problem-nc(13, "Chứng minh rằng tích của 3 số tự nhiên liên tiếp luôn chia hết cho 6")
  ])

  #progress-tracker-nc(1, 3)
]
