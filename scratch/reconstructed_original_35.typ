// ══════════════════════════════════════════════════════════════════
//  NỘI DUNG CHUYÊN ĐỀ ĐẠI SỐ TỔ HỢP
//  Tác giả: GV Nguyễn Văn Sang · 0389.821.115
// ══════════════════════════════════════════════════════════════════

// ─── Bảng màu toàn cục ───────────────────────────────────────────
#let c-navy    = rgb("0D2137")
#let c-blue    = rgb("1565C0")
#let c-teal    = rgb("00695C")
#let c-amber   = rgb("BF360C")
#let c-violet  = rgb("4A148C")
#let c-green   = rgb("1B5E20")
#let c-slate   = rgb("37474F")
#let c-gold    = rgb("B7791F")
#let c-crimson = rgb("9B1C1C")
#let c-indigo  = rgb("3730A3")

// ─── Hộp thành phần ────────────────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4.5pt + c-blue, rest: 0.8pt + rgb("BFDBFE")),
  radius: (right: 8pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác Cốt Lõi", body) = block(
  fill: rgb("F0FDF4"),
  stroke: (left: 4pt + c-teal, rest: 0.6pt + rgb("A7F3D
  }
}

// Mục lục
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  strong(it)
}

// ═══════════════════════════════════════════════
// BÌA SÁCH
// ═══════════════════════════════════════════════
#{
  show math.equation: set text(fill: white.transparentize(15%))
  let c-bg    = rgb("#070D1A")
  l

#let key-box(body) = block(
  fill: rgb("F5F3FF"),
  stroke: (left: 4pt + c-violet, rest: 0.6pt + rgb("DDD6FE")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-violet, weight: "bold")[🔑 Công Thức / Nguyên Lý Then Chốt]
  #v(0.3em)
  #body
]

#let example-box(n: "", body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-slate, rest: 0.6pt + rgb("E2E8F0")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-slate, weight: "bold")[📝 Ví Dụ #n]
  #v(0.3em)
  #body
]

#let skill-badge(code, title, color: c-blue) = [
  #heading(level: 1, outlined: true, bookmarked: true)[#code: #title]
  #block(
    fill: color.lighten(95%),
    stroke: (left: 5pt + color, rest: 0.8pt + color.lighten(70%)),
    radius: (right: 8pt), inset: (x: 14pt, y: 10pt), width: 100%,
    above: 1.6em, below: 0.8em,
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      align: (center + horizon, left + horizon),
      box(fill: color, inset: (x: 7pt, y: 4pt), radius: 5pt)[
        #text(fill: white, weight: "bold", size: 9pt)[#code]
      ],
      text(fill: color, weight: "bold", size: 12pt)[#title],
    )
  ]
]

// ─── Đề bài + Lời giải inline ──────────────────────────────────
#let prob(n, de, ans, loigiai: []) = {
  block(
    above: 1.2em, below: 1em,
    stroke: 0.6pt + rgb("E2E8F0"),
    inset: (x: 13pt, y: 10pt),
    radius: 6pt,
    width: 100%,
    fill: white,
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.6em,
      align: (top, top),
      box(fill: c-indigo, inset: (x: 6pt, y: 4pt), radius: 4pt)[
        #text(fill: white, weight: "bold", size: 9pt)[Bài #n]
      ],
      de,
    )
    #if ans != [] [
      #v(0.4em)
      #box(fill: rgb("ECFDF5"), stroke: 0.6pt + c-teal, inset: (x: 9pt, y: 5pt), radius: 4pt)[
        #text(fill: c-teal, weight: "bold", size: 9.5pt)[🎯 Đáp số: #ans]
      ]
    ]
    #if loigiai != [] [
      #v(0.4em)
      #block(
        fill: rgb("FFFBEB"),
        stroke: (left: 3pt + c-gold, rest: 0.5pt + rgb("FDE68A")),
        inset: (x: 12pt, y: 10pt),
        radius: (right: 5pt),
        width: 100%,
      )[
        #text(fill: c-gold, weight: "bold", size: 9.5pt)[📖 Hướng dẫn giải]
        #v(0.3em)
        #loigiai
      ]
    ]
  ]
}

// ─── Separator ──────────────────────────────────────────────────
#let section-rule(color: c-blue) = {
  v(0.5em)
  line(length: 100%, stroke: 1.2pt + color)
  v(0.5em)
}

// ══════════════════════════════════════════════════════════════
// PHẦN I: BẢN ĐỒ TƯ DUY TỔNG QUÁT
// ══════════════════════════════════════════════════════════════
= Bản Đồ Tư Duy Hệ Thống

#insight-box(title: "💡 Khung Kiến Thức Đại Số Tổ Hợp THPT")[
  #align(center)[
// MISSING LINE 141
// MISSING LINE 142
// MISSING LINE 143
// MISSING LINE 144
// MISSING LINE 145
// MISSING LINE 146
// MISSING LINE 147
// MISSING LINE 148
// MISSING LINE 149
// MISSING LINE 150
// MISSING LINE 151
// MISSING LINE 152
// MISSING LINE 153
// MISSING LINE 154
// MISSING LINE 155
// MISSING LINE 156
// MISSING LINE 157
// MISSING LINE 158
// MISSING LINE 159
// MISSING LINE 160
// MISSING LINE 161
// MISSING LINE 162
// MISSING LINE 163
// MISSING LINE 164
// MISSING LINE 165
// MISSING LINE 166
// MISSING LINE 167
// MISSING LINE 168
// MISSING LINE 169
// MISSING LINE 170
// MISSING LINE 171
// MISSING LINE 172
// MISSING LINE 173
    box(stroke: 1pt + white.transparentize(40%), inset:(x:22pt,y:13pt), radius:8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ GV Nguyễn Văn Sang]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        SĐT: 0389.821.115 · Tổ Toán – Tài liệu Thực chiến THPT
      ]
    ]
  })
}
#pagebreak()

#show: sang-setup

// ═══════════════════════════════════════════════
// MỤC LỤC
// ═══════════════════════════════════════════════
#outline(
  title: [Mục Lục Chuyên Đề Đại Số Tổ Hợp],
  depth: 2,
  indent: 1.5em,
)
#pagebreak()

// ═══════════════════════════════════════════════
// NỘI DUNG CHÍNH — CÓ HEADER & FOOTER
// ═══════════════════════════════════════════════
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [Chuyên Đề Đại Số Tổ Hợp — 15 Chủ Đề Toàn Diện],
      [GV Nguyễn Văn Sang · 0389.821.115],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("1565C0"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [Đại Số Tổ Hợp · Conic Typst · 2025–2026],
      [Trang #counter(page).display()],
    )
  },
)

#include "CD-DaiSo-ToHop-content.typ"

// MISSING LINE 223
// MISSING LINE 224
// MISSING LINE 225
// MISSING LINE 226
// MISSING LINE 227
// MISSING LINE 228
// MISSING LINE 229
// MISSING LINE 230
// MISSING LINE 231
// MISSING LINE 232
// MISSING LINE 233
// MISSING LINE 234
// MISSING LINE 235
// MISSING LINE 236
// MISSING LINE 237
    - Chuỗi kết thúc bằng 1: Có dạng $S_{n-1} 1$ với $S_{n-1}$ là chuỗi hợp lệ độ dài $n-1$ (có $a_{n-1}$ cách).
    - Chuỗi kết thúc bằng 0: Phải có dạng $S_{n-2} 10$ với $S_{n-2}$ là chuỗi hợp lệ độ dài $n-2$ (có $a_{n-2}$ cách).
    Do đó ta có hệ thức truy hồi Fibonacci: $a_n = a_{n-1} + a_{n-2}$.
    Với $a_1 = 2, a_2 = 3$, ta tính được:
    - $a_3 = 2 + 3 = 5$
    - $a_4 = 3 + 5 = 8$
    - $a_5 = 5 + 8 = 13$ chuỗi.

  *Cách 3 (Sử dụng hàm sinh - Generating Functions):*
  Ta có thể xây dựng các chuỗi nhị phân không có hai chữ số 0 kề nhau bằng các khối xây dựng cơ bản:
  - Khối `1` (độ dài 1, hàm sinh tương ứng là $x$).
  - Khối `10` (độ dài 2, hàm sinh tương ứng là $x^2$).
  Mọi chuỗi hợp lệ đều có thể viết dưới dạng lặp lại các khối này và kết thúc bằng chuỗi rỗng $e$ (độ dài 0, hàm sinh 1) hoặc số 0 đơn lẻ (độ dài 1, hàm sinh $x$). Biểu thức kịch bản: `(1|10)*(e|0)`.
  Hàm sinh tổng quát của các chuỗi hợp lệ theo độ dài là:
  $ G(x) = frac(1, 1 - x - x^2) dot (1 + x) = frac(1 + x, 1 - x - x^2) $
  Khai triển chuỗi lũy thừa của $G(x)$:
  $
    G(x) = (1 + x) sum_(k=0)^(infinity) (x + x^2)^k \
    = (1 + x) [1 + (x + x^2) + (x + x^2)^2 + (x + x^2)^3 + (x + x^2)^4 + (x + x^2)^5 + ...] \
    = (1 + x) [1 + x + 2x^2 + 3x^3 + 5x^4 + 8x^5 + 13x^6 + ...] \
    = 1 + 2x + 3x^2 + 5x^3 + 8x^4 + 13x^5 + 21x^6 + ...
  $
  Số lượng chuỗi hợp lệ độ dài 5 chính là hệ số của $x^5$ trong khai triển trên, bằng 13.
// MISSING LINE 261
// MISSING LINE 262
// MISSING LINE 263
// MISSING LINE 264
// MISSING LINE 265
// MISSING LINE 266
// MISSING LINE 267
// MISSING LINE 268
// MISSING LINE 269
// MISSING LINE 270
// MISSING LINE 271
// MISSING LINE 272
// MISSING LINE 273
// MISSING LINE 274
// MISSING LINE 275
// MISSING LINE 276
// MISSING LINE 277
// MISSING LINE 278
// MISSING LINE 279
// MISSING LINE 280
// MISSING LINE 281
// MISSING LINE 282
// MISSING LINE 283
// MISSING LINE 284
// MISSING LINE 285
// MISSING LINE 286
// MISSING LINE 287
// MISSING LINE 288
// MISSING LINE 289
// MISSING LINE 290
// MISSING LINE 291
// MISSING LINE 292
// MISSING LINE 293
// MISSING LINE 294
// MISSING LINE 295
// MISSING LINE 296
// MISSING LINE 297
// MISSING LINE 298
// MISSING LINE 299
// MISSING LINE 300
// MISSING LINE 301
// MISSING LINE 302
// MISSING LINE 303
// MISSING LINE 304
// MISSING LINE 305
// MISSING LINE 306
// MISSING LINE 307
// MISSING LINE 308
// MISSING LINE 309
// MISSING LINE 310
// MISSING LINE 311
// MISSING LINE 312
// MISSING LINE 313
// MISSING LINE 314
// MISSING LINE 315
// MISSING LINE 316
// MISSING LINE 317
// MISSING LINE 318
// MISSING LINE 319
// MISSING LINE 320
// MISSING LINE 321
// MISSING LINE 322
// MISSING LINE 323
// MISSING LINE 324
// MISSING LINE 325
// MISSING LINE 326
// MISSING LINE 327
// MISSING LINE 328
// MISSING LINE 329
// MISSING LINE 330
// MISSING LINE 331
// MISSING LINE 332
// MISSING LINE 333
// MISSING LINE 334
// MISSING LINE 335
// MISSING LINE 336
// MISSING LINE 337
// MISSING LINE 338
// MISSING LINE 339
// MISSING LINE 340
// MISSING LINE 341
// MISSING LINE 342
// MISSING LINE 343
// MISSING LINE 344
// MISSING LINE 345
// MISSING LINE 346
// MISSING LINE 347
// MISSING LINE 348
// MISSING LINE 349
// MISSING LINE 350
// MISSING LINE 351
// MISSING LINE 352
// MISSING LINE 353
// MISSING LINE 354
// MISSING LINE 355
// MISSING LINE 356
// MISSING LINE 357
// MISSING LINE 358
// MISSING LINE 359
// MISSING LINE 360
// MISSING LINE 361
// MISSING LINE 362
// MISSING LINE 363
// MISSING LINE 364
// MISSING LINE 365
// MISSING LINE 366
// MISSING LINE 367
// MISSING LINE 368
// MISSING LINE 369
// MISSING LINE 370
// MISSING LINE 371
// MISSING LINE 372
// MISSING LINE 373
// MISSING LINE 374
// MISSING LINE 375
]

#example-box(n: "2 (Trung bình)")[
  Cho tập hợp $S = \{1, 2, ..., n\}$. Chứng minh bằng lập luận tổ hợp công thức:
  $ C_n^k = C_(n-1)^k + C_(n-1)^(k-1) $

  *Giải:*
  Vế trái $C_n^k$ là số cách chọn ra một tập con có $k$ phần tử từ tập $S$ gồm $n$ phần tử.
  Ta cố định một phần tử đặc biệt trong tập $S$, giả sử là phần tử $n$. Khi chọn tập con $k$ phần tử, chỉ có hai trường hợp loại trừ nhau:
  - *Trường hợp 1:* Tập con được chọn không chứa phần tử $n$. Điều này tương đương với việc ta chọn cả $k$ phần tử từ $n-1$ phần tử còn lại của $S$. Số cách chọn là $C_(n-1)^k$.
  - *Trường hợp 2:* Tập con được chọn bắt buộc phải chứa phần tử $n$. Khi đó, ta chỉ cần chọn thêm $k-1$ phần tử nữa từ $n-1$ phần tử còn lại của $S$. Số cách chọn là $C_(n-1)^(k-1)$.
  Theo nguyên lý cộng, tổng số cách chọn là $C_(n-1)^k + C_(n-1)^(k-1)$. Do đó hai vế bằng nhau.
]

#example-box(n: "3 (Khó - Giải bằng 3 cách)")[
  Chọn 4 số từ tập hợp $\{1, 2, ..., 12\}$ sao cho trong 4 số được chọn không có hai số nào là hai số tự nhiên liên tiếp. Hỏi có bao nhiêu cách chọn?

  *Cách 1 (Phương pháp song ánh):*
  Giả sử các số được chọn theo thứ tự tăng dần là $x_1 < x_2 < x_3 < x_4$.
  Điều kiện không có hai số nào liên tiếp có nghĩa là:
  $ x_(i+1) - x_i >= 2 quad (forall i = 1, 2, 3) $
  Ta thực hiện phép đổi biến đặt:
  - $y_1 = x_1$
  - $y_2 = x_2 - 1$
  - $y_3 = x_3 - 2$
  - $y_4 = x_4 - 3$
  Khi đó, từ điều kiện $x_(i+1) - x_i >= 2$, ta có:
  $ y_(i+1) - y_i = (x_(i+1) - i) - (x_i - (i-1)) = x_(i+1) - x_i - 1 >= 2 - 1 = 1 $
  Điều này tương đương với $y_1 < y_2 < y_3 < y_4$.
  Giới hạn của các biến $y_i$: do $1 <= x_1$ và $x_4 <= 12$ nên ta có:
  $ 1 <= y_1 < y_2 < y_3 < y_4 <= 12 - 3 = 9 $
  Như vậy, mỗi cách chọn bộ $\{x_1, x_2, x_3, x_4\}$ không chứa hai số liên tiếp tương ứng song ánh 1-1 với một cách chọn bộ 4 số phân biệt $\{y_1, y_2, y_3, y_4\}$ từ tập $\{1, 2, ..., 9\}$.
  Số cách chọn thỏa mãn yêu cầu là: $C_9^4 = frac(9 dot 8 dot 7 dot 6, 4 dot 3 dot 2 dot 1) = 126$ cách.

  *Cách 2 (Phương pháp vách ngăn):*
  Xem 8 số không được chọn như 8 vách ngăn giống nhau xếp hàng ngang.
  Khi xếp 8 vách ngăn này, ta có 9 khoảng trống tạo ra ở giữa và hai đầu:
  `_ | _ | _ | _ | _ | _ | _ | _ | _`
  Để chọn ra 4 số sao cho không có số nào liên tiếp, ta chỉ cần đặt 4 "ngôi sao" biểu diễn cho 4 số được chọn vào 9 khoảng trống này (mỗi khoảng trống chứa tối đa 1 ngôi sao để đảm bảo chúng không kề nhau).
  Số cách chọn vị trí đặt 4 ngôi sao vào 9 khoảng trống là:
  $ C_9^4 = 126 " cách" $

  *Cách 3 (Sử dụng hàm sinh - Generating Functions):*
  Ta quy bài toán về việc đếm số nghiệm nguyên của một phương trì
// MISSING LINE 420
// MISSING LINE 421
// MISSING LINE 422
// MISSING LINE 423
// MISSING LINE 424
// MISSING LINE 425
// MISSING LINE 426
// MISSING LINE 427
// MISSING LINE 428
// MISSING LINE 429
// MISSING LINE 430
// MISSING LINE 431
// MISSING LINE 432
// MISSING LINE 433
// MISSING LINE 434
// MISSING LINE 435
// MISSING LINE 436
// MISSING LINE 437
// MISSING LINE 438
// MISSING LINE 439
// MISSING LINE 440
// MISSING LINE 441
// MISSING LINE 442
// MISSING LINE 443
// MISSING LINE 444
// MISSING LINE 445
// MISSING LINE 446
// MISSING LINE 447
// MISSING LINE 448
// MISSING LINE 449
// MISSING LINE 450
// MISSING LINE 451
// MISSING LINE 452
// MISSING LINE 453
// MISSING LINE 454
// MISSING LINE 455
// MISSING LINE 456
// MISSING LINE 457
// MISSING LINE 458
// MISSING LINE 459
// MISSING LINE 460
// MISSING LINE 461
// MISSING LINE 462
// MISSING LINE 463
// MISSING LINE 464
// MISSING LINE 465
// MISSING LINE 466
// MISSING LINE 467
// MISSING LINE 468
// MISSING LINE 469
// MISSING LINE 470
// MISSING LINE 471
// MISSING LINE 472
// MISSING LINE 473
// MISSING LINE 474
// MISSING LINE 475
// MISSING LINE 476
// MISSING LINE 477
// MISSING LINE 478
// MISSING LINE 479
// MISSING LINE 480
// MISSING LINE 481
// MISSING LINE 482
// MISSING LINE 483
// MISSING LINE 484
// MISSING LINE 485
// MISSING LINE 486
// MISSING LINE 487
// MISSING LINE 488
// MISSING LINE 489
// MISSING LINE 490
// MISSING LINE 491
// MISSING LINE 492
// MISSING LINE 493
// MISSING LINE 494
// MISSING LINE 495
// MISSING LINE 496
// MISSING LINE 497
// MISSING LINE 498
// MISSING LINE 499
// MISSING LINE 500
// MISSING LINE 501
// MISSING LINE 502
// MISSING LINE 503
// MISSING LINE 504
// MISSING LINE 505
// MISSING LINE 506
// MISSING LINE 507
// MISSING LINE 508
// MISSING LINE 509
// MISSING LINE 510
// MISSING LINE 511
// MISSING LINE 512
// MISSING LINE 513
// MISSING LINE 514
// MISSING LINE 515
// MISSING LINE 516
// MISSING LINE 517
// MISSING LINE 518
// MISSING LINE 519
// MISSING LINE 520
// MISSING LINE 521
// MISSING LINE 522
// MISSING LINE 523
// MISSING LINE 524
// MISSING LINE 525
// MISSING LINE 526
// MISSING LINE 527
// MISSING LINE 528
// MISSING LINE 529
// MISSING LINE 530
// MISSING LINE 531
// MISSING LINE 532
// MISSING LINE 533
// MISSING LINE 534
// MISSING LINE 535
// MISSING LINE 536
// MISSING LINE 537
// MISSING LINE 538
// MISSING LINE 539
// MISSING LINE 540
// MISSING LINE 541
// MISSING LINE 542
// MISSING LINE 543
// MISSING LINE 544
// MISSING LINE 545
// MISSING LINE 546
// MISSING LINE 547
// MISSING LINE 548
// MISSING LINE 549
// MISSING LINE 550
// MISSING LINE 551
// MISSING LINE 552
// MISSING LINE 553
// MISSING LINE 554
// MISSING LINE 555
// MISSING LINE 556
// MISSING LINE 557
// MISSING LINE 558
// MISSING LINE 559
// MISSING LINE 560
// MISSING LINE 561
// MISSING LINE 562
// MISSING LINE 563
// MISSING LINE 564
// MISSING LINE 565
// MISSING LINE 566
// MISSING LINE 567
// MISSING LINE 568
// MISSING LINE 569
// MISSING LINE 570
// MISSING LINE 571
// MISSING LINE 572
// MISSING LINE 573
// MISSING LINE 574
// MISSING LINE 575
// MISSING LINE 576
// MISSING LINE 577
// MISSING LINE 578
// MISSING LINE 579
// MISSING LINE 580
// MISSING LINE 581
// MISSING LINE 582
// MISSING LINE 583
// MISSING LINE 584
// MISSING LINE 585
// MISSING LINE 586
// MISSING LINE 587
// MISSING LINE 588
// MISSING LINE 589
// MISSING LINE 590
// MISSING LINE 591
// MISSING LINE 592
// MISSING LINE 593
// MISSING LINE 594
// MISSING LINE 595
// MISSING LINE 596
// MISSING LINE 597
// MISSING LINE 598
// MISSING LINE 599
// MISSING LINE 600
// MISSING LINE 601
// MISSING LINE 602
// MISSING LINE 603
// MISSING LINE 604
// MISSING LINE 605
// MISSING LINE 606
// MISSING LINE 607
// MISSING LINE 608
// MISSING LINE 609
// MISSING LINE 610
// MISSING LINE 611
// MISSING LINE 612
// MISSING LINE 613
// MISSING LINE 614
// MISSING LINE 615
// MISSING LINE 616
// MISSING LINE 617
// MISSING LINE 618
// MISSING LINE 619
// MISSING LINE 620
// MISSING LINE 621
// MISSING LINE 622
// MISSING LINE 623
// MISSING LINE 624
// MISSING LINE 625
// MISSING LINE 626
// MISSING LINE 627
// MISSING LINE 628
// MISSING LINE 629
// MISSING LINE 630
// MISSING LINE 631
// MISSING LINE 632
// MISSING LINE 633
// MISSING LINE 634
// MISSING LINE 635
// MISSING LINE 636
// MISSING LINE 637
// MISSING LINE 638
// MISSING LINE 639
// MISSING LINE 640
// MISSING LINE 641
// MISSING LINE 642
// MISSING LINE 643
// MISSING LINE 644
// MISSING LINE 645
// MISSING LINE 646
// MISSING LINE 647
// MISSING LINE 648
// MISSING LINE 649
// MISSING LINE 650
// MISSING LINE 651
// MISSING LINE 652
// MISSING LINE 653
// MISSING LINE 654
// MISSING LINE 655
// MISSING LINE 656
// MISSING LINE 657
// MISSING LINE 658
// MISSING LINE 659
// MISSING LINE 660
// MISSING LINE 661
// MISSING LINE 662
// MISSING LINE 663
// MISSING LINE 664
// MISSING LINE 665
// MISSING LINE 666
// MISSING LINE 667
// MISSING LINE 668
// MISSING LINE 669
// MISSING LINE 670
// MISSING LINE 671
// MISSING LINE 672
// MISSING LINE 673
// MISSING LINE 674
// MISSING LINE 675
// MISSING LINE 676
// MISSING LINE 677
// MISSING LINE 678
// MISSING LINE 679
// MISSING LINE 680
// MISSING LINE 681
// MISSING LINE 682
// MISSING LINE 683
// MISSING LINE 684
// MISSING LINE 685
// MISSING LINE 686
// MISSING LINE 687
// MISSING LINE 688
// MISSING LINE 689
// MISSING LINE 690
// MISSING LINE 691
// MISSING LINE 692
// MISSING LINE 693
// MISSING LINE 694
// MISSING LINE 695
// MISSING LINE 696
// MISSING LINE 697
// MISSING LINE 698
// MISSING LINE 699
// MISSING LINE 700

  *2. Hệ số đa thức (Hàm sinh):*
  Số nghiệm chính là hệ số của $x^n$ trong khai triển tích các đa thức đại diện cho mỗi hộp:
  $ f(x) = product_(i=1)^k (sum_(j=a_i)^(b_i) x^j) $
]

#example-box(n: "1 (Dễ)")[
  Tìm số cách chia 6 viên kẹo giống nhau cho 3 bạn nhỏ sao cho mỗi bạn nhận được không quá 3 viên kẹo.

  *Cách 1 (Sử dụng Nguyên lý bù trừ kết hợp vách ngăn):*
  Gọi số kẹo mỗi bạn nhận là $x_1, x_2, x_3$. Ta có phương trình:
  $ x_1 + x_2 + x_3 = 6 $
  Ràng buộc: $0 <= x_i <= 3$.
  - Số nghiệm không âm không có cận trên là: $C_(6+3-1)^(3-1) = C_8^2 = 28$.
  - Đặt điều kiện vi phạm: $A_i$ là tập nghiệm có $x_i >= 4$.
    - Giả sử $x_1 >= 4$. Đặt $x_1' = x_1 - 4 >= 0  ->  x_1' + x_2 + x_3 = 2$.
      Số nghiệm là $C_(2+3-1)^(3-1) = C_4^2 = 6$. Có 3 biến nên có $3 dot 6 = 18$ cách vi phạm.
    - Không thể có đồng thời 2 biến $x_i >= 4$ vì tổng chỉ bằng 6.
  Theo nguyên lý bù trừ, số nghiệm thỏa mãn là: $28 - 18 = 10$.

  *Cách 2 (Sử dụng phương pháp Hàm sinh):*
  Mỗi biến $x_i$ ($i = 1, 2, 3$) đại diện cho số kẹo của một bạn nhỏ, nhận giá trị từ $0$ đến $3$. Đa thức đại diện cho mỗi biến là:
  $ P(t) = 1 + t + t^2 + t^3 = frac(1 - t^4, 1 - t) $

  Hàm sinh cho tổng số cách chia kẹo là:
  $ G(t) = (P(t))^3 = (frac(1 - t^4, 1 - t))^3 = (1 - t^4)^3 (1 - t)^(-3) $

  Khai triển đa thức thứ nhất:
  $ (1 - t^4)^3 = 1 - 3 t^4 + 3 t^8 - t^(12) $

  Khai triển chuỗi lũy thừa của nh
// MISSING LINE 732
// MISSING LINE 733
// MISSING LINE 734
// MISSING LINE 735
// MISSING LINE 736
// MISSING LINE 737
// MISSING LINE 738
// MISSING LINE 739
// MISSING LINE 740
// MISSING LINE 741
// MISSING LINE 742
// MISSING LINE 743
// MISSING LINE 744
// MISSING LINE 745
// MISSING LINE 746
// MISSING LINE 747
// MISSING LINE 748
// MISSING LINE 749
// MISSING LINE 750
// MISSING LINE 751
// MISSING LINE 752
// MISSING LINE 753
// MISSING LINE 754
// MISSING LINE 755
// MISSING LINE 756
// MISSING LINE 757
// MISSING LINE 758
// MISSING LINE 759
// MISSING LINE 760
// MISSING LINE 761
// MISSING LINE 762
// MISSING LINE 763
// MISSING LINE 764
// MISSING LINE 765
// MISSING LINE 766
// MISSING LINE 767
// MISSING LINE 768
// MISSING LINE 769
// MISSING LINE 770
// MISSING LINE 771
// MISSING LINE 772
  - Số hạng $3x^(10)$ nhân với hệ số của $x^0$ trong $(1-x)^(-3)$ ($k=0$): $3 dot C_2^2 = 3$.
  Tổng các hệ số trên là:
  $ N = 66 - 63 + 3 = 6 " nghiệm." $
]

#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Có bao nhiêu cách chia 12 quyển sách giống nhau cho 3 học sinh sao cho mỗi học sinh nhận được ít nhất 2 quyển và không quá 5 quyển?

  *Cách 1 (Nguyên lý bù trừ kết hợp vách ngăn):*
  Phương trình đại diện: $x_1 + x_2 + x_3 = 12$ với $2 <= x_i <= 5$.
  Thực hiện đổi biến đưa về biến không âm: đặt $y_i = x_i - 2  ->  0 <= y_i <= 3$.
  Phương trình trở thành:
  $ y_1 + y_2 + y_3 = 12 - 6 = 6 $
  Ta cần tìm số nghiệm nguyên của phương trình trên thỏa mãn $0 <= y_i <= 3$.
  - Số nghiệm không âm tự do: $C_(6+2)^2 = C_8^2 = 28$.
  - Xét các trường hợp vi phạm có biến $y_i >= 4$:
    - Giả sử $y_1 >= 4  ->  y_1' + y_2 + y_3 = 2$.
      Số nghiệm là $C_4^2 = 6$. Số cách chọn 1 biến vi phạm: $C_3^1 = 3  ->  3 dot 6 = 18$ cách.
    - Không thể có 2 biến $y_i >= 4$ vì tổng bằng 6.
  Số nghiệm thỏa mãn yêu cầu là: $28 - 18 = 10$ cách.

  *Cách 2 (Phương pháp hàm sinh đại số):*
  Mỗi biến nhận giá trị từ 2 đến 5 tương ứng với đa thức đại diện là $P(x) = x^2 + x^3 + x^4 + x^5$.
  Số cách chọn chính là hệ số của $x^(12)$ trong đa thức tích $f(x) = (x^2 + x^3 + x^4 + x^5)^3$.
  Ta biến đổi đại số rút gọn $f(x)$:
  $
    f(x) = x^6 (1 + x + x^2 + x^3)^3 = x^6 (frac(1 - x^4, 1 - x))^3 \
    = x^6 (1 - x^4)^3 (1 - x)^(-3) \
    = x^6 (1 - 3x^4 + 3x^8 - x^(12)) (1 - x)^(-3)
  $
  Cần tìm hệ số của $x^(12)$ trong $f(x)$, tương đương hệ số của $x^6$ trong:
  $ h(x) = (1 - 3x^4) (1 - x)^(-3) $
  (Bỏ các số mũ $x^k$ với $k > 6$ vì không đóng góp vào hệ số $x^6$).
  Biết rằng $(1-x)^(-3) = sum_(k=0)^( infinity ) C_(k+2)^2 x^k$.
  - Phần đóng góp từ số hạng 1 trong $(1-3x^4)$ là hệ số của $x^6$ trong $(1-x)^(-3)$, tương ứng $k=6$:
    $ C_(6+2)^2 = C_8^2 = 28 $
  - Phần đóng góp từ số hạng $-3x^4$ là hệ số của $x^2$ trong $(1-x)^(-3)$ nhân với $-3$, tương ứng $k=2$:
    $ -3 dot C_(2+2)^2 = -3 dot C_4^2 = -18 $
  Tổng hệ số là: $28 - 18 = 10$. Kết quả hoàn toàn trùng khớp.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 8: PHÂN HOẠCH TẬP HỢP (SỐ STIRLING LOẠI 2 & SỐ BELL)
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 8", "Phân Hoạch Tập Hợp", color: c-violet)

#theory-box[
  *1. Số Stirling loại 2 (Stirling Numbers of the Second Kind) $S(n,k)$:*
  Là số cách chia một tập hợp gồm $n$ ph
// MISSING LINE 822
// MISSING LINE 823
// MISSING LINE 824
// MISSING LINE 825
// MISSING LINE 826
// MISSING LINE 827
// MISSING LINE 828
// MISSING LINE 829
// MISSING LINE 830
// MISSING LINE 831
// MISSING LINE 832
// MISSING LINE 833
// MISSING LINE 834
// MISSING LINE 835
// MISSING LINE 836
// MISSING LINE 837
// MISSING LINE 838
// MISSING LINE 839
// MISSING LINE 840
// MISSING LINE 841
// MISSING LINE 842
// MISSING LINE 843
// MISSING LINE 844
// MISSING LINE 845
// MISSING LINE 846
// MISSING LINE 847
// MISSING LINE 848
// MISSING LINE 849
// MISSING LINE 850
// MISSING LINE 851
// MISSING LINE 852
// MISSING LINE 853
// MISSING LINE 854
// MISSING LINE 855
// MISSING LINE 856
// MISSING LINE 857
// MISSING LINE 858
// MISSING LINE 859
// MISSING LINE 860
// MISSING LINE 861
// MISSING LINE 862
// MISSING LINE 863
// MISSING LINE 864
// MISSING LINE 865
// MISSING LINE 866
// MISSING LINE 867
// MISSING LINE 868
// MISSING LINE 869
// MISSING LINE 870
// MISSING LINE 871
// MISSING LINE 872
// MISSING LINE 873
// MISSING LINE 874
// MISSING LINE 875
// MISSING LINE 876
// MISSING LINE 877
// MISSING LINE 878
// MISSING LINE 879
// MISSING LINE 880
// MISSING LINE 881
// MISSING LINE 882
// MISSING LINE 883
// MISSING LINE 884
// MISSING LINE 885
// MISSING LINE 886
// MISSING LINE 887
// MISSING LINE 888
// MISSING LINE 889
// MISSING LINE 890
// MISSING LINE 891
// MISSING LINE 892
// MISSING LINE 893
// MISSING LINE 894
// MISSING LINE 895
// MISSING LINE 896
// MISSING LINE 897
// MISSING LINE 898
// MISSING LINE 899
// MISSING LINE 900
// MISSING LINE 901
// MISSING LINE 902
// MISSING LINE 903
// MISSING LINE 904
// MISSING LINE 905
// MISSING LINE 906
// MISSING LINE 907
// MISSING LINE 908
// MISSING LINE 909
// MISSING LINE 910
// MISSING LINE 911
// MISSING LINE 912
// MISSING LINE 913
// MISSING LINE 914
// MISSING LINE 915
// MISSING LINE 916
// MISSING LINE 917
// MISSING LINE 918
// MISSING LINE 919
// MISSING LINE 920
// MISSING LINE 921
// MISSING LINE 922
// MISSING LINE 923
// MISSING LINE 924
// MISSING LINE 925
// MISSING LINE 926
// MISSING LINE 927
// MISSING LINE 928
// MISSING LINE 929
// MISSING LINE 930
// MISSING LINE 931
// MISSING LINE 932
// MISSING LINE 933
// MISSING LINE 934
// MISSING LINE 935
// MISSING LINE 936
// MISSING LINE 937
// MISSING LINE 938
// MISSING LINE 939
// MISSING LINE 940
// MISSING LINE 941
// MISSING LINE 942
// MISSING LINE 943
// MISSING LINE 944
// MISSING LINE 945
// MISSING LINE 946
// MISSING LINE 947
// MISSING LINE 948
// MISSING LINE 949
// MISSING LINE 950
// MISSING LINE 951
// MISSING LINE 952
// MISSING LINE 953
// MISSING LINE 954
// MISSING LINE 955
// MISSING LINE 956
// MISSING LINE 957
// MISSING LINE 958
// MISSING LINE 959
// MISSING LINE 960
// MISSING LINE 961
// MISSING LINE 962
// MISSING LINE 963
// MISSING LINE 964
// MISSING LINE 965
// MISSING LINE 966
// MISSING LINE 967
// MISSING LINE 968
// MISSING LINE 969
// MISSING LINE 970
// MISSING LINE 971
// MISSING LINE 972
// MISSING LINE 973
// MISSING LINE 974
// MISSING LINE 975
// MISSING LINE 976
// MISSING LINE 977
// MISSING LINE 978
// MISSING LINE 979
// MISSING LINE 980
// MISSING LINE 981
// MISSING LINE 982
// MISSING LINE 983
// MISSING LINE 984
// MISSING LINE 985
// MISSING LINE 986
// MISSING LINE 987
// MISSING LINE 988
// MISSING LINE 989
// MISSING LINE 990
// MISSING LINE 991
// MISSING LINE 992
// MISSING LINE 993
// MISSING LINE 994
// MISSING LINE 995
// MISSING LINE 996
// MISSING LINE 997
// MISSING LINE 998
// MISSING LINE 999
// MISSING LINE 1000
// MISSING LINE 1001
// MISSING LINE 1002
// MISSING LINE 1003
// MISSING LINE 1004
// MISSING LINE 1005
// MISSING LINE 1006
// MISSING LINE 1007
// MISSING LINE 1008
// MISSING LINE 1009
// MISSING LINE 1010
// MISSING LINE 1011
// MISSING LINE 1012
// MISSING LINE 1013
// MISSING LINE 1014
// MISSING LINE 1015
// MISSING LINE 1016
// MISSING LINE 1017
// MISSING LINE 1018
// MISSING LINE 1019
// MISSING LINE 1020
// MISSING LINE 1021
// MISSING LINE 1022
// MISSING LINE 1023
// MISSING LINE 1024
// MISSING LINE 1025
// MISSING LINE 1026
// MISSING LINE 1027
// MISSING LINE 1028
// MISSING LINE 1029
// MISSING LINE 1030
// MISSING LINE 1031
// MISSING LINE 1032
// MISSING LINE 1033
// MISSING LINE 1034
// MISSING LINE 1035
// MISSING LINE 1036
// MISSING LINE 1037
// MISSING LINE 1038
// MISSING LINE 1039
// MISSING LINE 1040
// MISSING LINE 1041
// MISSING LINE 1042
// MISSING LINE 1043
// MISSING LINE 1044
// MISSING LINE 1045
// MISSING LINE 1046
// MISSING LINE 1047
// MISSING LINE 1048
// MISSING LINE 1049
// MISSING LINE 1050
// MISSING LINE 1051
// MISSING LINE 1052
// MISSING LINE 1053
// MISSING LINE 1054
// MISSING LINE 1055
// MISSING LINE 1056
// MISSING LINE 1057
// MISSING LINE 1058
// MISSING LINE 1059
// MISSING LINE 1060
// MISSING LINE 1061
// MISSING LINE 1062
// MISSING LINE 1063
// MISSING LINE 1064
// MISSING LINE 1065
// MISSING LINE 1066
// MISSING LINE 1067
// MISSING LINE 1068
// MISSING LINE 1069
// MISSING LINE 1070
// MISSING LINE 1071
// MISSING LINE 1072
// MISSING LINE 1073
// MISSING LINE 1074
// MISSING LINE 1075
// MISSING LINE 1076
// MISSING LINE 1077
// MISSING LINE 1078
// MISSING LINE 1079
// MISSING LINE 1080
// MISSING LINE 1081
// MISSING LINE 1082
// MISSING LINE 1083
// MISSING LINE 1084
// MISSING LINE 1085
// MISSING LINE 1086
// MISSING LINE 1087
// MISSING LINE 1088
// MISSING LINE 1089
// MISSING LINE 1090
// MISSING LINE 1091
// MISSING LINE 1092
// MISSING LINE 1093
// MISSING LINE 1094
// MISSING LINE 1095
// MISSING LINE 1096
// MISSING LINE 1097
// MISSING LINE 1098
// MISSING LINE 1099
// MISSING LINE 1100
// MISSING LINE 1101
// MISSING LINE 1102
// MISSING LINE 1103
// MISSING LINE 1104
// MISSING LINE 1105
// MISSING LINE 1106
// MISSING LINE 1107
// MISSING LINE 1108
// MISSING LINE 1109
// MISSING LINE 1110
// MISSING LINE 1111
// MISSING LINE 1112
// MISSING LINE 1113
// MISSING LINE 1114
// MISSING LINE 1115
// MISSING LINE 1116
// MISSING LINE 1117
// MISSING LINE 1118
// MISSING LINE 1119
// MISSING LINE 1120
// MISSING LINE 1121
// MISSING LINE 1122
// MISSING LINE 1123
// MISSING LINE 1124
// MISSING LINE 1125
// MISSING LINE 1126
// MISSING LINE 1127
// MISSING LINE 1128
// MISSING LINE 1129
// MISSING LINE 1130
// MISSING LINE 1131
// MISSING LINE 1132
// MISSING LINE 1133
// MISSING LINE 1134
// MISSING LINE 1135
// MISSING LINE 1136
// MISSING LINE 1137
// MISSING LINE 1138
// MISSING LINE 1139
// MISSING LINE 1140
// MISSING LINE 1141
// MISSING LINE 1142
// MISSING LINE 1143
// MISSING LINE 1144
// MISSING LINE 1145
// MISSING LINE 1146
// MISSING LINE 1147
// MISSING LINE 1148
// MISSING LINE 1149
// MISSING LINE 1150
// MISSING LINE 1151
// MISSING LINE 1152
// MISSING LINE 1153
// MISSING LINE 1154
// MISSING LINE 1155
// MISSING LINE 1156
// MISSING LINE 1157
// MISSING LINE 1158
// MISSING LINE 1159
// MISSING LINE 1160
// MISSING LINE 1161
// MISSING LINE 1162
// MISSING LINE 1163
// MISSING LINE 1164
// MISSING LINE 1165
// MISSING LINE 1166
// MISSING LINE 1167
// MISSING LINE 1168
// MISSING LINE 1169
// MISSING LINE 1170
// MISSING LINE 1171
// MISSING LINE 1172
// MISSING LINE 1173
// MISSING LINE 1174
// MISSING LINE 1175
// MISSING LINE 1176
// MISSING LINE 1177
// MISSING LINE 1178
// MISSING LINE 1179
// MISSING LINE 1180
// MISSING LINE 1181
// MISSING LINE 1182
// MISSING LINE 1183
// MISSING LINE 1184
// MISSING LINE 1185
// MISSING LINE 1186
// MISSING LINE 1187
// MISSING LINE 1188
// MISSING LINE 1189
// MISSING LINE 1190
// MISSING LINE 1191
// MISSING LINE 1192
// MISSING LINE 1193
// MISSING LINE 1194
// MISSING LINE 1195
// MISSING LINE 1196
// MISSING LINE 1197
// MISSING LINE 1198
// MISSING LINE 1199
// MISSING LINE 1200
// MISSING LINE 1201
// MISSING LINE 1202
// MISSING LINE 1203
// MISSING LINE 1204
// MISSING LINE 1205
// MISSING LINE 1206
// MISSING LINE 1207
// MISSING LINE 1208
// MISSING LINE 1209
// MISSING LINE 1210
// MISSING LINE 1211
// MISSING LINE 1212
// MISSING LINE 1213
// MISSING LINE 1214
// MISSING LINE 1215
// MISSING LINE 1216
// MISSING LINE 1217
// MISSING LINE 1218
// MISSING LINE 1219
// MISSING LINE 1220
// MISSING LINE 1221
// MISSING LINE 1222
// MISSING LINE 1223
// MISSING LINE 1224
// MISSING LINE 1225
// MISSING LINE 1226
// MISSING LINE 1227
// MISSING LINE 1228
// MISSING LINE 1229
// MISSING LINE 1230
// MISSING LINE 1231
// MISSING LINE 1232
// MISSING LINE 1233
// MISSING LINE 1234
// MISSING LINE 1235
// MISSING LINE 1236
// MISSING LINE 1237
// MISSING LINE 1238
// MISSING LINE 1239
// MISSING LINE 1240
// MISSING LINE 1241
// MISSING LINE 1242
// MISSING LINE 1243
// MISSING LINE 1244
// MISSING LINE 1245
// MISSING LINE 1246
// MISSING LINE 1247
// MISSING LINE 1248
// MISSING LINE 1249
// MISSING LINE 1250
// MISSING LINE 1251
// MISSING LINE 1252
// MISSING LINE 1253
// MISSING LINE 1254
// MISSING LINE 1255
// MISSING LINE 1256
// MISSING LINE 1257
// MISSING LINE 1258
// MISSING LINE 1259
// MISSING LINE 1260
// MISSING LINE 1261
// MISSING LINE 1262
// MISSING LINE 1263
// MISSING LINE 1264
// MISSING LINE 1265
// MISSING LINE 1266
// MISSING LINE 1267
// MISSING LINE 1268
// MISSING LINE 1269
// MISSING LINE 1270
// MISSING LINE 1271
// MISSING LINE 1272
// MISSING LINE 1273
// MISSING LINE 1274
// MISSING LINE 1275
// MISSING LINE 1276
// MISSING LINE 1277
// MISSING LINE 1278
// MISSING LINE 1279
// MISSING LINE 1280
// MISSING LINE 1281
// MISSING LINE 1282
// MISSING LINE 1283
// MISSING LINE 1284
// MISSING LINE 1285
// MISSING LINE 1286
// MISSING LINE 1287
// MISSING LINE 1288
// MISSING LINE 1289
// MISSING LINE 1290
// MISSING LINE 1291
// MISSING LINE 1292
// MISSING LINE 1293
// MISSING LINE 1294
// MISSING LINE 1295
// MISSING LINE 1296
// MISSING LINE 1297
// MISSING LINE 1298
// MISSING LINE 1299
// MISSING LINE 1300
// MISSING LINE 1301
// MISSING LINE 1302
// MISSING LINE 1303
// MISSING LINE 1304
// MISSING LINE 1305
// MISSING LINE 1306
// MISSING LINE 1307
// MISSING LINE 1308
// MISSING LINE 1309
// MISSING LINE 1310
// MISSING LINE 1311
// MISSING LINE 1312
// MISSING LINE 1313
// MISSING LINE 1314
// MISSING LINE 1315
// MISSING LINE 1316
// MISSING LINE 1317
// MISSING LINE 1318
// MISSING LINE 1319
// MISSING LINE 1320
// MISSING LINE 1321
// MISSING LINE 1322
// MISSING LINE 1323
// MISSING LINE 1324
// MISSING LINE 1325
// MISSING LINE 1326
// MISSING LINE 1327
// MISSING LINE 1328
// MISSING LINE 1329
// MISSING LINE 1330
// MISSING LINE 1331
// MISSING LINE 1332
// MISSING LINE 1333
// MISSING LINE 1334
// MISSING LINE 1335
// MISSING LINE 1336
// MISSING LINE 1337
// MISSING LINE 1338
// MISSING LINE 1339
// MISSING LINE 1340
// MISSING LINE 1341
// MISSING LINE 1342
// MISSING LINE 1343
// MISSING LINE 1344
// MISSING LINE 1345
// MISSING LINE 1346
// MISSING LINE 1347
// MISSING LINE 1348
// MISSING LINE 1349
// MISSING LINE 1350
// MISSING LINE 1351
// MISSING LINE 1352
// MISSING LINE 1353
// MISSING LINE 1354
// MISSING LINE 1355
// MISSING LINE 1356
// MISSING LINE 1357
// MISSING LINE 1358
// MISSING LINE 1359
// MISSING LINE 1360
// MISSING LINE 1361
// MISSING LINE 1362
// MISSING LINE 1363
// MISSING LINE 1364
// MISSING LINE 1365
// MISSING LINE 1366
// MISSING LINE 1367
// MISSING LINE 1368
// MISSING LINE 1369
// MISSING LINE 1370
// MISSING LINE 1371
// MISSING LINE 1372
// MISSING LINE 1373
// MISSING LINE 1374
// MISSING LINE 1375
// MISSING LINE 1376
// MISSING LINE 1377
// MISSING LINE 1378
// MISSING LINE 1379
// MISSING LINE 1380
// MISSING LINE 1381
// MISSING LINE 1382
// MISSING LINE 1383
// MISSING LINE 1384
// MISSING LINE 1385
// MISSING LINE 1386
// MISSING LINE 1387
// MISSING LINE 1388
// MISSING LINE 1389
// MISSING LINE 1390
    $
  Vậy tổng cần tìm là: $S = frac(2^(n+1) - 1, n+1)$.

  *Cách 2 (Biến đổi đại số trực tiếp):*
  Ta biến đổi số hạng tổng quát của chuỗi:
  $
    frac(1, k+1) C_n^k = frac(1, k+1) dot frac(n!, k! dot (n-k)!) = frac(n!, (k+1)! dot (n-k)!) \
    = frac(1, n+1) dot frac((n+1)!, (k+1)! dot ((n+1) - (k+1))!) = frac(1, n+1) C_(n+1)^(k+1)
  $
  Thay biểu thức này vào tổng $S$, ta có:
  $
    S = sum_(k=0)^n frac(1, n+1) C_(n+1)^(k+1) = frac(1, n+1) sum_(k=0)^n C_(n+1)^(k+1) \
    = frac(1, n+1) [C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1)]
  $
  Biết rằng tổng các hệ số nhị thức từ 0 đến $n+1$ là $2^(n+1)$:
  $ C_(n+1)^0 + C_(n+1)^1 + ... + C_(n+1)^(n+1) = 2^(n+1) $
  Suy ra $C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1) = 2^(n+1) - 1$ (do $C_(n+1)^0 = 1$).
  Thế vào công thức của $S$:
  $ S = frac(2^(n+1) - 1, n+1) $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 15: ỨNG DỤNG TỔ HỢP TRONG TRÒ CHƠI & XÁC SUẤT
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 15", "Ứng Dụng Tổ Hợp Và Xác Suất Trò Chơi", color: c-indigo)

#theory-box[
  *1. Xác suất cổ điển trên không gian mẫu tổ hợp:*
  $ P(A) = frac(|A|, |Omega|) $
  Trong đó $|Omega|$ và $|A|$ được tính bằng các công cụ đếm tổ hợp nâng cao.

  *2. Xích Markov và Mô hình hóa trạng thái:*
  Với các trò chơi nhiều lượt, xác suất thắng/thua ở mỗi lượt thay đổi phụ thuộc vào trạng thái hiện tại. Ta lập hệ thức liên hệ xác suất giữa các trạng thái kế tiếp và giải phương trình đại số.
]

#example-box(n: "1 (Dễ)")[
  Một người tung một đồng xu cân đối và đồng chất 6 lần liên tiếp. Tính xác suất để số lần xuất hiện mặt ngửa đúng bằng số lần xuất hiện mặt sấp.

  *Cách 1 (Sử dụng tổ hợp trực tiếp):*
  - Mỗi lần tung đồng xu có 2 khả năng (Ngửa hoặc Sấp). Tổng số kịch bản xảy ra khi tung 6 lần là:
    $ |Omega| = 2^6 = 64 " kịch bản" $
  - Để số lần ngửa bằng số sấp, mỗi mặt phải xuất hiện đúng 3 lần. Số cách chọn ra 3 lượt tung xuất hiện mặt ngửa trong 6 lượt tung là:
    $ |A| = C_6^3 = 20 " cách" $
  - Xác suất cần tìm là: $P(A) = frac(20, 64) = frac(5, 16) = 0.3125$.

  *Cách 2 (Sử dụng phương pháp Hàm sinh):*
  Mỗi lần tung đồng xu có thể được mô tả bằng hàm sinh đa thức đại diện cho số mặt ngửa ($x$) và số mặt sấp ($1$, đóng vai trò giữ vị trí). Vì đồng xu cân đối và đồng chất nên xác suất nhận được mặt ngửa hay sấp ở mỗi lần tung đều là $1/2$. Do đó, hàm sinh cho x
// MISSING LINE 1438
// MISSING LINE 1439
// MISSING LINE 1440
// MISSING LINE 1441
// MISSING LINE 1442
// MISSING LINE 1443
// MISSING LINE 1444
// MISSING LINE 1445
// MISSING LINE 1446
// MISSING LINE 1447
// MISSING LINE 1448
// MISSING LINE 1449
// MISSING LINE 1450
// MISSING LINE 1451
// MISSING LINE 1452
// MISSING LINE 1453
// MISSING LINE 1454
// MISSING LINE 1455
// MISSING LINE 1456
// MISSING LINE 1457
// MISSING LINE 1458
// MISSING LINE 1459
// MISSING LINE 1460
// MISSING LINE 1461
// MISSING LINE 1462
// MISSING LINE 1463
// MISSING LINE 1464
// MISSING LINE 1465
// MISSING LINE 1466
// MISSING LINE 1467
// MISSING LINE 1468
// MISSING LINE 1469
// MISSING LINE 1470
// MISSING LINE 1471
// MISSING LINE 1472
// MISSING LINE 1473
// MISSING LINE 1474
// MISSING LINE 1475
// MISSING LINE 1476
// MISSING LINE 1477
// MISSING LINE 1478
// MISSING LINE 1479
// MISSING LINE 1480
// MISSING LINE 1481
// MISSING LINE 1482
// MISSING LINE 1483
// MISSING LINE 1484
// MISSING LINE 1485
// MISSING LINE 1486
// MISSING LINE 1487
// MISSING LINE 1488
// MISSING LINE 1489
// MISSING LINE 1490
// MISSING LINE 1491
// MISSING LINE 1492
// MISSING LINE 1493
// MISSING LINE 1494
// MISSING LINE 1495
// MISSING LINE 1496
// MISSING LINE 1497
// MISSING LINE 1498
// MISSING LINE 1499
     <->  p = frac(1, 2) + frac(1, 2) - frac(1, 2) p \
     <->  frac(3, 2) p = 1  <->  p = frac(2, 3)
  $
  Xác suất thắng cuộc của người A là $2/3$.

  *Cách 3 (Sử dụng hàm sinh xác suất - Probability Generating Functions):*
  Gọi $X$ là biến ngẫu nhiên biểu diễn số lượt tung cho đến khi xuất hiện mặt ngửa đầu tiên. Do mỗi lần tung độc lập với xác suất ngửa là $1/2$, $X$ tuân theo phân phối hình học $X ~ upright("Geom")(1/2)$ với xác suất:
  $ P(X = k) = (frac(1, 2))^k quad (forall k = 1, 2, 3, ...) $
  Hàm sinh xác suất (PGF) của biến ngẫu nhiên $X$ được định nghĩa là:
  $ G_X(t) = E[t^X] = sum_(k=1)^(infinity) P(X = k) t^k = sum_(k=1)^(infinity) (frac(t, 2))^k = frac(frac(t, 2), 1 - frac(t, 2)) = frac(t, 2 - t) $
  Người A thắng cuộc khi và chỉ khi mặt ngửa đầu tiên xuất hiện ở lượt tung lẻ của trò chơi, tức là $X$ nhận giá trị lẻ.
  Ta có thể lọc tổng các xác suất tại điểm lẻ bằng cách sử dụng các giá trị của hàm sinh xác suất tại $t=1$ và $t=-1$:
  $ P(X " lẻ") = sum_(k " lẻ") P(X = k) = frac(G_X(1) - G_X(-1), 2) $
  Tính các giá trị của hàm sinh:
  - Với $t = 1$: $G_X(1) = frac(1, 2 - 1) = 1$.
  - Với $t = -1$: $G_X(-1) = frac(-1, 2 - (-1)) = -frac(1, 3)$.
  Thay vào công thức ta được:
  $ P(X " lẻ") = frac(1 - (-frac(1, 3)), 2) = frac(frac(4, 3
// MISSING LINE 1518
// MISSING LINE 1519
// MISSING LINE 1520
// MISSING LINE 1521
// MISSING LINE 1522
// MISSING LINE 1523
// PHẦN II: ĐỀ LUYỆN TỔNG HỢP
// ══════════════════════════════════════════════════════════════
= Đề Luyện Tổng Hợp

#align(center)[
  #block(
    fill: rgb("F8FAFC"),
    stroke: 1pt + c-navy,
    radius: 8pt,
    inset: (x: 20pt, y: 15pt),
    width: 100%,
  )[
    #text(fill: c-navy, weight: "bold", size: 12pt)[
      📋 Bảng Phân Loại Đề Thực Chiến 15 Bài Tập Điển Hình
    ]
    #v(0.8em)
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 12pt,
      row-gutter: 8pt,
      align: (center, left, center),
      box(fill: rgb("DCFCE7"), stroke: 1pt + c-teal, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-teal, weight: "bold")[★ Cơ Bản]
      ],
      [Nguyên lý cộng nhân, hoán vị chỉnh hợp cơ bản, vách ngăn đơn giản],
      [Bài 1–5],

      box(fill: rgb("FEF9C3"), stroke: 1pt + c-gold, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-gold, weight: "bold")[★★ Khá]
      ],
      [Gộp khối khoảng trống, hoán vị lặp, đếm hình học, chữ số chia hết],
      [Bài 6–10],

      box(fill: rgb("FEE2E2"), stroke: 1pt + c-crimson, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-crimson, weight: "bold")[★★★ Khó]
      ],
      [Hàm sinh Euler, phân hoạch Stirling, song ánh Catalan, truy hồi bậc cao, Newton],
      [Bài 11–15],
    )
  ]
]

#v(1em)

#prob(
  "1 ★",
  [Có bao nhiêu số tự nhiên có 5 chữ số đôi một khác nhau được lập từ các chữ số của tập hợp $\{1, 2, 3, 4, 5, 6, 7\}$ sao cho số đó chia hết cho 5?],
  [360],
  loigiai: [
    Gọi số cần lập là $overline(a_1 a_2 a_3 a_4 a_5)$ với các chữ số khác nhau thuộc tập $\{1, ..., 7\}$.
    - Chữ số cuối $a_5$ bắt buộc phải bằng 5 (có đúng 1 cách chọn).
    - Bốn chữ số còn lại $a_1, a_2, a_3, a_4$ được chọn và xếp thứ tự từ tập 6 chữ số còn lại $\{1, 2, 3, 4, 6, 7\}$: có $A_6^4 = 360$ cách.
    Số lượng số thỏa mãn là: $1 dot 360 = 360$ số.
  ],
)

#prob(
  "2 ★",
  [Tìm số nghiệm nguyên không âm của phương trình $x + y + z + w = 17$ thỏa m
  [364],
  loigiai: [
    *Cách 1 (Sử dụng phương pháp đổi biến - Vách ngăn):*
    Thực hiện đổi biến đưa về dạng không âm tự do:
    - Đặt $x' = x - 1 >= 0$
    - Đặt $y' = y - 2 >= 0$
    - Đặt $z' = z - 3 >= 0$
    - Đặt $w' = w >= 0$
    Thay vào phương trình ta được:
    $
      (x' + 1) + (y' + 2) + (z' + 3) + w' = 
       <->  x' + y' + z' + w' = 11
    $
    Áp dụng công thức vách ngăn cơ bản với $n=11$ và $k=4$:
    $ N = C_(11+4-1)^(4-1) = C_(14)^3 = frac(14 dot 13 dot 12, 3 dot 2 dot 1) = 364 " nghiệm" $

    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*
    Hàm sinh cho từng biến số ứng với các điều kiện ràng buộc như sau:
// MISSING LINE 1601
// MISSING LINE 1602
// MISSING LINE 1603
// MISSING LINE 1604
// MISSING LINE 1605
// MISSING LINE 1606
// MISSING LINE 1607
// MISSING LINE 1608
// MISSING LINE 1609
// MISSING LINE 1610
// MISSING LINE 1611
// MISSING LINE 1612
// MISSING LINE 1613
// MISSING LINE 1614
// MISSING LINE 1615
  [15400],
  loigiai: [
    *Cách 1 (Sử dụng tổ hợp trực tiếp):*
    - Bước 1: Chia 12 học sinh vào 4 nhóm phân biệt (nhóm 1, nhóm 2, nhóm 3, nhóm 4) mỗi nhóm 3 học sinh:
      - Nhóm 1: Chọn 3 học sinh từ 12 học sinh: $C_(12)^3$ cách.
      - Nhóm 2: Chọn 3 học sinh từ 9 học sinh còn lại: $C_9^3$ cách.
      - Nhóm 3: Chọn 3 học sinh từ 6 học sinh còn lại: $C_6^3$ cách.
      - Nhóm 4: Chọn 3 học sinh từ 3 học sinh còn lại: $C_3^3$ cách.
      Số cách chia vào nhóm phân biệt là: $C_(12)^3 dot C_9^3 dot C_6^3 dot C_3^3 = 220 dot 84 dot 20 dot 1 = 369600$.
    - Bước 2: Vì 4 nhóm có vai trò hoàn toàn như nhau và không phân biệt tên gọi, ta phải khử lặp thứ tự bằng cách chia cho hoán vị của 4 nhóm là $4! = 24$.
    Số cách chia nhóm không phân biệt là:
    $ N = frac(369600, 24) = 15400 " cách." $

    *Cách 2 (Sử dụng hàm sinh lũy thừa - EGF):*
    Vì các học sinh là phân biệt, ta sử dụng hàm sinh lũy thừa (EGF).
    Mỗi nhóm chứa đúng 3 học sinh, nên hàm sinh lũy thừa cho việc chọn một nhóm là:
    $ f(x) = frac(x^3, 3!) = frac(x^3, 6) $
    Số cách phân hoạch 12 học sinh thành 4 nhóm không phân biệt, mỗi nhóm 3 người, chính là hệ số của $frac(x^(12), 12!)$ trong hàm sinh lũy thừa của hệ 4 nhóm:
    $ G(x) = frac(1, 4!) (f(x))^4 = frac(1, 24) (frac(x^3, 6))^4 = frac(x^(12), 24 dot 1296) = frac(x^(12), 31104) $
    Hệ số của $frac(x^(12), 12!)$ là:
    $ N = 12! [x^(12)] G(x) = frac(12!, 31104) = frac(479001600, 31104) = 15400 " cách." $
  ],
)

#prob(
  "4 ★★",
  [Có bao nhiêu cách xếp 4 học sinh nam và 4 học sinh nữ thành một hàng ngang sao cho không có hai học sinh lẻ/cùng giới tính đứng kề nhau (tức là nam và nữ xếp xen kẽ hoàn toàn)?],
  [1152],
  loigiai: [
    Để nam và nữ đứng xen kẽ nhau hoàn toàn trong hàng gồm 8 người, chỉ có hai cấu trúc hàng dọc khả dĩ:
    - *Cấu trúc 1:* `Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ`
      - Sắp xếp vị trí 4 nam vào các vị trí nam: $4! = 24$ cách.
      - Sắp xếp vị trí 4 nữ vào các vị trí nữ: $4! = 24$ cách.
      Số cách xếp là: $24 dot 24 = 576$ cách.
    - *Cấu trúc 2:* `Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam`
      - Tương tự như trên, số cách xếp là: $24 dot 24 = 576$ cách.
    Tổng số cách xếp thỏa mãn là: $576 + 576 = 1152$ cách.
  ],
)

#prob(
  "5 ★★",
  [Có bao nhiêu số tự nhiên gồm 3 chữ số đôi một khác nhau sao cho tích của 3 chữ số đó là một số chẵn?],
  [588],
  loigiai: [
    Tích của 3 chữ số là số chẵn khi và chỉ khi trong 3 chữ số đó có ít nhất một chữ số chẵn.
    Ta sử dụng phương pháp phần bù:
    - Tổng số các số tự nhiên có 3 chữ số đôi một khác nhau lập từ $\{0, 1, ..., 9\}$:
      - Chọn chữ số hàng trăm $a  !=  0$
// MISSING LINE 1665
// MISSING LINE 1666
// MISSING LINE 1667
// MISSING LINE 1668
// MISSING LINE 1669
// MISSING LINE 1670
// MISSING LINE 1671
// MISSING LINE 1672
// MISSING LINE 1673
// MISSING LINE 1674
// MISSING LINE 1675
// MISSING LINE 1676
// MISSING LINE 1677
// MISSING LINE 1678
// MISSING LINE 1679
// MISSING LINE 1680
// MISSING LINE 1681
// MISSING LINE 1682
// MISSING LINE 1683
// MISSING LINE 1684
// MISSING LINE 1685
// MISSING LINE 1686
// MISSING LINE 1687
// MISSING LINE 1688
// MISSING LINE 1689
// MISSING LINE 1690
// MISSING LINE 1691
// MISSING LINE 1692
// MISSING LINE 1693
// MISSING LINE 1694
// MISSING LINE 1695
// MISSING LINE 1696
// MISSING LINE 1697
// MISSING LINE 1698
// MISSING LINE 1699
// MISSING LINE 1700
// MISSING LINE 1701
// MISSING LINE 1702
// MISSING LINE 1703
// MISSING LINE 1704
// MISSING LINE 1705
// MISSING LINE 1706
// MISSING LINE 1707
// MISSING LINE 1708
// MISSING LINE 1709
// MISSING LINE 1710
// MISSING LINE 1711
// MISSING LINE 1712
// MISSING LINE 1713
// MISSING LINE 1714
// MISSING LINE 1715
// MISSING LINE 1716
// MISSING LINE 1717
// MISSING LINE 1718
// MISSING LINE 1719
// MISSING LINE 1720
// MISSING LINE 1721
// MISSING LINE 1722
// MISSING LINE 1723
// MISSING LINE 1724
// MISSING LINE 1725
// MISSING LINE 1726
// MISSING LINE 1727
// MISSING LINE 1728
// MISSING LINE 1729
// MISSING LINE 1730
// MISSING LINE 1731
// MISSING LINE 1732
// MISSING LINE 1733
// MISSING LINE 1734
// MISSING LINE 1735
// MISSING LINE 1736
// MISSING LINE 1737
// MISSING LINE 1738
// MISSING LINE 1739
// MISSING LINE 1740
// MISSING LINE 1741
// MISSING LINE 1742
// MISSING LINE 1743
// MISSING LINE 1744
// MISSING LINE 1745
// MISSING LINE 1746
// MISSING LINE 1747
// MISSING LINE 1748
// MISSING LINE 1749
// MISSING LINE 1750
// MISSING LINE 1751
// MISSING LINE 1752
// MISSING LINE 1753
// MISSING LINE 1754
// MISSING LINE 1755
// MISSING LINE 1756
// MISSING LINE 1757
// MISSING LINE 1758
// MISSING LINE 1759
// MISSING LINE 1760
// MISSING LINE 1761
// MISSING LINE 1762
// MISSING LINE 1763
// MISSING LINE 1764
// MISSING LINE 1765
// MISSING LINE 1766
// MISSING LINE 1767
// MISSING LINE 1768
// MISSING LINE 1769
// MISSING LINE 1770
// MISSING LINE 1771
// MISSING LINE 1772
// MISSING LINE 1773
// MISSING LINE 1774
// MISSING LINE 1775

    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*
    Quy ước $a_0 = 1$ (số cách lát hành lang độ dài 0 là 1 - lát rỗng). Khi đó hệ thức truy hồi $a_n = a_(n-1) + a_(n-2)$ được thỏa mãn với mọi $n >= 2$ (do $a_1 = a_0 = 1$, $a_2 = a_1 + a_0 = 2$).
    Định nghĩa hàm sinh của dãy số $a_n$ là:
    $ G(x) = sum_(n=0)^(infinity) a_n x^n $
    Áp dụng hệ thức truy hồi ta có:
    $ G(x) = a_0 + a_1 x + sum_(n=2)^(infinity) (a_(n-1) + a_(n-2)) x^n = 1 + x + x sum_(n=2)^(infinity) a_(n-1) x^(n-1) + x^2 sum_(n=2)^(infinity) a_(n-2) x^(n-2) $
    $ G(x) = 1 + x + x (G(x) - 1) + x^2 G(x) = 1 + (x + x^2) G(x) $
    Suy ra hàm sinh của dãy số $a_n$ là:
    $ G(x) = frac(1, 1 - x - x^2) $
    Ta khai triển lũy thừa của phân thức $G(x)$:
    $ G(x) = sum_(k=0)^(infinity) (x + x^2)^k = sum_(k=0)^(infinity) x^k (1 + x)^k $
    Áp dụng khai triển nhị thức Newton cho $(1+x)^k$:
    $ G(x) = sum_(k=0)^(infinity) x^k sum_(j=0)^k C_k^j x^j = sum_(k=0)^(infinity) sum_(j=0)^k C_k^j x^(k+j) $
    Để tìm hệ số của $x^(10)$, ta chọn các cặp số $(k, j)$ sao cho $k + j = 10$ với $0 <= j <= k$.
    Các cặp số thỏa mãn là:
    - Với $k = 10, j = 0 -> C_(10)^0 = 1$
    - Với $k = 9, j = 1 -> C_9^1 = 9$
    - Với $k = 8, j = 2 -> C_8^2 = 28$
    - Với $k = 7, j = 3 -> C_7^3 = 35$
    - Với $k = 6, j = 4 -> C_6^4 = 15$
    - Với $k = 5, j = 5 -> C_5^5 = 1$
    (Các trường hợp khác $k < 5$ không thỏa mãn điều kiện $j <= k$).
    Cộng tất cả các hệ số trên ta được số cách lát:
    $ a_(10) = 1 + 9 + 28 + 35 + 15 + 1 = 89 " cách." $
  ],
)

#prob(
  "12 ★★★",
  [Tìm số đường đi trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(5,5)$ bằng các bước đi sang phải $(+1,0)$ hoặc đi lên trên $(0,+1)$ sao cho đường đi không bao giờ đi lên phía trên đường thẳng $y = x$.],
  [42],
  loigiai: [
    *Cách 1 (Sử dụng công thức số Catalan):*
    Đây là bài toán tính số đường đi Dyck dưới đường phân giác, kết quả chính là số Catalan thứ 5 ($C_5$):
    $ C_5 = frac(1, 5+1) C_(10)^5 = frac(1, 6) dot 252 = 42 " đường đi" $

    *Cách 2 (Sử dụng hàm sinh - Generating Function):*
    Hàm sinh cho dãy số Catalan $C_n$ là $C(x) = sum_(n=0)^(infinity) C_n x^n$. Bằng cách phân hoạch đường đi Dyck theo điểm đầu tiên chạm vào đường phân giác $y=x$, ta thu được phương trình hàm sinh:
    $ C(x) = 1 + x C(x)^2  <=>  x C(x)^2 - C(x) + 1 = 0 $
    Giải phương trình với điều kiện biên $C(0) = 1$, ta có:
    $ C(x) = frac(1 - sqrt(1 - 4x), 2x) $
    Khai triển Taylor cho căn thức bằng công thức nhị thức mở rộng:
    $ (1 - 4x)^(1/2) = sum_(n=0)^(infinity) C_(1/2)^n (-4x)^n $
    Rút gọn hệ số dẫn đến:
    $ C_n = [x^n] C(x) = frac(1, n+1) C_(2n)^n $
    Với $n = 5$, ta tính được số đường đi Dyck hợp lệ:
    $ C_5 = frac(1, 6) C_(10)^5 = 42 " đường đi." $
  ],
)

#prob(
  "13 ★★★",
  [Tính tổng sau theo $n$:
  $ S = (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + ... + (C_n^n)^2 $],
  [$C_(2n)^n$],
  loigiai: [
    *Cách 1 (Lập luận tổ hợp - Chọn nhóm):*
    Ta có một nhóm gồm $n$ nam và $n$ nữ (tổng cộng $2n$ người). Ta muốn chọn ra một nhóm gồm đúng $n$ người từ $2n$ người này.
    - Cách tính trực tiếp: Số cách chọn ra $n$ người từ $2n$ người là $C_(2n)^n$.
    - Cách tính phân hoạch theo giới tính: Giả sử trong $n$ người được chọn có đúng $k$ học sinh nam (với $0 <= k <= n$), khi đó số học sinh nữ được chọn bắt buộc là $n-k$.
      - Số cách chọn $k$ nam từ $n$ nam là $C_n^k$.
      - Số cách chọn $n-k$ nữ từ $n$ nữ là $C_n^(n-k)$.
      Theo nguyên lý nhân, ứng với mỗi giá trị $k$, số cách chọn là $C_n^k dot C_n^(n-k) = (C_n^k)^2$ (do tính chất đối xứng $C_n^(n-k) = C_n^k$).
      Lấy tổng theo mọi trường hợp khả dĩ của $k$ từ $0$ đến $n$, ta có số cách chọn là:
      $ S = sum_(k=0)^n (C_n^k)^2 $
    Đồng nhất hai cách đếm cùng một đối tượng, ta suy ra đẳng thức cần chứng minh: $S = C_(2n)^n$.

    *Cách 2 (Sử dụng hàm sinh - Đồng nhất hệ số):*
    Xét đa thức hàm sinh cho hai phân phối nhị thức:
    $ f(x) = (1 + x)^n " và " g(x) = (x + 1)^n $
    Nhân hai đa thức này ta được:
    $ f(x) g(x) = (1 + x)^(2n) $
    - Hệ số của số hạng $x^n$ trong vế phải $(1 + x)^(2n)$ là: $C_(2n)^n$.
    - Ở vế trái, ta thực hiện khai triển nhị thức Newton cho từng đa thức:
      $ f(x) g(x) = (sum_(i=0)^n C_n^i x^i) dot (sum_(j=0)^n C_n^j x^(n-j)) $
      Hệ số của số hạng $x^n$ trong tích vế trái có được bằng cách nhân các số hạng có tích số mũ bằng $n$, tức là $x^i dot x^(n-j) = x^n  <=>  i = j$.
      Hệ số tương ứng thu được là:
      $ sum_(i=0)^n C_n^i dot C_n^i = sum_(i=0)^n (C_n^i)^2 $
    Đồng nhất hệ số của $x^n$ ở cả hai vế, ta thu được: $S = C_(2n)^n$.
  ],
)

#prob(
  "14 ★★★",
  [Hai người chơi A và B chơi một trò chơi tung đồng xu. Người A thắng nếu tung được mặt ngửa, người B thắng nếu tung được mặt sấp. Biết đồng xu không cân đối, xác suất xuất hiện mặt ngửa là $p = 0.6$ và sấp là $1-p = 0.4$. Trò chơi kết thúc khi có người đạt được 2 lư
// MISSING LINE 1862
// MISSING LINE 1863
// MISSING LINE 1864
// MISSING LINE 1865
// MISSING LINE 1866
// MISSING LINE 1867
// MISSING LINE 1868
// MISSING LINE 1869
// MISSING LINE 1870
// MISSING LINE 1871
// MISSING LINE 1872
// MISSING LINE 1873
// MISSING LINE 1874
// MISSING LINE 1875
// MISSING LINE 1876
// MISSING LINE 1877
// MISSING LINE 1878
// MISSING LINE 1879
// MISSING LINE 1880
// MISSING LINE 1881
// MISSING LINE 1882
// MISSING LINE 1883
// MISSING LINE 1884
// MISSING LINE 1885
// MISSING LINE 1886
// MISSING LINE 1887
// MISSING LINE 1888
// MISSING LINE 1889
// MISSING LINE 1890
// MISSING LINE 1891
// MISSING LINE 1892
// MISSING LINE 1893
// MISSING LINE 1894
// MISSING LINE 1895
// MISSING LINE 1896
// MISSING LINE 1897
// MISSING LINE 1898
// MISSING LINE 1899
// MISSING LINE 1900
// MISSING LINE 1901
// MISSING LINE 1902
// MISSING LINE 1903
// MISSING LINE 1904
// MISSING LINE 1905
// MISSING LINE 1906
// MISSING LINE 1907
// MISSING LINE 1908
// MISSING LINE 1909
// MISSING LINE 1910
// MISSING LINE 1911
// MISSING LINE 1912
// MISSING LINE 1913
// MISSING LINE 1914
// MISSING LINE 1915
// MISSING LINE 1916
// MISSING LINE 1917
// MISSING LINE 1918
// MISSING LINE 1919
// MISSING LINE 1920
// MISSING LINE 1921
// MISSING LINE 1922
// MISSING LINE 1923
// MISSING LINE 1924
// MISSING LINE 1925
// MISSING LINE 1926
// MISSING LINE 1927
// MISSING LINE 1928
// MISSING LINE 1929
// MISSING LINE 1930
// MISSING LINE 1931
// MISSING LINE 1932
// MISSING LINE 1933
// MISSING LINE 1934
// MISSING LINE 1935
// MISSING LINE 1936
// MISSING LINE 1937
// MISSING LINE 1938
// MISSING LINE 1939
// MISSING LINE 1940
// MISSING LINE 1941
// MISSING LINE 1942
// MISSING LINE 1943
// MISSING LINE 1944
// MISSING LINE 1945
// MISSING LINE 1946
// MISSING LINE 1947
// MISSING LINE 1948
// MISSING LINE 1949
// MISSING LINE 1950
// MISSING LINE 1951
// MISSING LINE 1952
// MISSING LINE 1953
// MISSING LINE 1954
// MISSING LINE 1955
// MISSING LINE 1956
// MISSING LINE 1957
// MISSING LINE 1958
// MISSING LINE 1959
// MISSING LINE 1960
// MISSING LINE 1961
// MISSING LINE 1962
// MISSING LINE 1963
// MISSING LINE 1964
// MISSING LINE 1965
// MISSING LINE 1966
// MISSING LINE 1967
// MISSING LINE 1968
// MISSING LINE 1969
// MISSING LINE 1970
// MISSING LINE 1971
// MISSING LINE 1972
// MISSING LINE 1973
// MISSING LINE 1974
// MISSING LINE 1975
// MISSING LINE 1976
// MISSING LINE 1977
// MISSING LINE 1978
// MISSING LINE 1979
// MISSING LINE 1980
// MISSING LINE 1981
// MISSING LINE 1982
// MISSING LINE 1983
// MISSING LINE 1984
// MISSING LINE 1985
// MISSING LINE 1986
// MISSING LINE 1987
// MISSING LINE 1988
// MISSING LINE 1989
// MISSING LINE 1990
// MISSING LINE 1991
// MISSING LINE 1992
// MISSING LINE 1993
// MISSING LINE 1994
// MISSING LINE 1995
// MISSING LINE 1996
// MISSING LINE 1997
// MISSING LINE 1998
// MISSING LINE 1999
    Hệ số của $x^(20)$ trong $f(x)$ là:
    $ [x^(20)] f(x) = [x^(16)] h(x) - [x^(10)] h(x) = 280 - 86 = 194 " cách." $
  ],
)

#prob(
  "18 ★★★",
  [Có 8 học sinh phân biệt được phân vào 3 phòng học khác nhau (phòng 1, phòng 2, phòng 3). Hỏi có bao nhiêu cách phân chia sao cho phòng 1 chứa một số chẵn học sinh và có ít nhất 2 học sinh, còn phòng 2 và phòng 3 mỗi phòng có ít nhất 1 học sinh?],
  [2772],
  loigiai: [
    *Cách 1 (Chia trường hợp kết hợp tổ hợp):*
    Gọi $x_1, x_2, x_3$ lần lượt là số học sinh được phân vào 3 phòng. Ta có phương trình:
    $ x_1 + x_2 + x_3 = 8 $
    Trong đó $x_1$ là số chẵn thỏa mãn $x_1 >= 2$; $x_2 >= 1, x_3 >= 1$. Các giá trị khả dĩ của $x_1$ là 2, 4, 6.
    - *Trường hợp 1 ($x_1 = 2$):*
      - Chọn 2 học sinh vào phòng 1: có $C_8^2 = 28$ cách.
      - Phân chia 6 học sinh còn lại vào hai phòng 2 và 3 sao cho mỗi phòng có ít nhất 1 người: có $2^6 - 2 = 62$ cách.
      - Số cách phân chia: $28 dot 62 = 1736$ cách.
    - *Trường hợp 2 ($x_1 = 4$):*
      - Chọn 4 học sinh vào phòng 1: có $C_8^4 = 70$ cách.
      - Phân chia 4 học sinh còn lại vào hai phòng 2 và 3 sao cho mỗi phòng có ít nhất 1 người: có $2^4 - 2 = 14$ cách.
      - Số cách phân chia: $70 dot 14 = 980$ cách.
    - *Trường h
// MISSING LINE 2023
// MISSING LINE 2024
// MISSING LINE 2025
// MISSING LINE 2026
// MISSING LINE 2027
// MISSING LINE 2028
// MISSING LINE 2029
// MISSING LINE 2030
// MISSING LINE 2031
// MISSING LINE 2032
// MISSING LINE 2033
// MISSING LINE 2034
// MISSING LINE 2035
// MISSING LINE 2036
// MISSING LINE 2037
// MISSING LINE 2038
// MISSING LINE 2039
// MISSING LINE 2040
// MISSING LINE 2041
// MISSING LINE 2042
// MISSING LINE 2043
// MISSING LINE 2044
// MISSING LINE 2045
// MISSING LINE 2046
// MISSING LINE 2047
// MISSING LINE 2048
// MISSING LINE 2049
// MISSING LINE 2050
// MISSING LINE 2051
// MISSING LINE 2052
// MISSING LINE 2053
// MISSING LINE 2054
// MISSING LINE 2055
// MISSING LINE 2056
// MISSING LINE 2057
// MISSING LINE 2058
    Vì $a_i <= 8$ nên $S <= 6 dot 8 = 48$. Vậy $S$ có thể bằng 18, 36.
    - Với $S = 18$: số nghiệm nguyên không âm của $a_1 + a_2 + ... + a_6 = 18$ với $a_1 >= 2$ chẵn, và $a_i >= 0$ chẵn.
      Thay $a_1 = 2 a_1', a_i = 2 a_i'$ ta đưa về phương trình $a_1' + a_2' + ... + a_6' = 9$ với $a_1' >= 1$ và $a_i' >= 0$.
      Đổi biến $a_1'' = a_1' - 1 >= 0$, ta có $a_1'' + a_2' + ... + a_6' = 8$ với cận trên $a_i' <= 4$.
      Áp dụng nguyên lý bù trừ, ta tính được số cách là 836.
    - Với $S = 36$: Đưa về phương trình $a_1'' + a_2' + ... + a_6' = 17$ với cận trên $a_i' <= 4$.
      Số cách là 456.
    Tổng số các số lập được là: $836 + 456 = 1292$ số.

    *Cách 2 (Sử dụng hàm sinh và kỹ thuật lọc căn đơn vị - Roots of unity filter):*
    Hàm sinh cho từng vị trí chữ số của số có 6 chữ số:
    - Chữ số hàng trăm nghìn $a_1 in {2, 4, 6, 8}$: $P(x) = x^2 + x^4 + x^6 + x^8$.
    - Năm chữ số còn lại $a_i in {0, 2, 4, 6, 8}$: $Q(x) = 1 + x^2 + x^4 + x^6 + x^8$.
    Hàm sinh tổng quát biểu diễn tổng các chữ số là:
    $ F(x) = P(x) Q(x)^5 $
    Ta cần tính tổng các hệ số của $x^k$ với $k$ chia hết cho 9 trong khai triển của $F(x)$.
    Sử dụng kỹ thuật lọc căn đơn vị với $epsilon = e^(i 2 pi / 9)$ (căn bậc 9 của đơn vị):
    $ N = frac(1, 9) sum_(j=0)^8 F(epsilon^j) $
    - Với $j = 0$ ($epsilon^0 = 1$): $F(1) = P(1) Q(1)^5 = 4 dot 5^5 = 12500$.
    - Với $j >= 1$: do $epsilon^j != 1$ và $(epsilon^j)^9 = 1$, ta có:
      $ Q(epsilon^j) = frac(1 - (epsilon^j)^(10), 1 - (epsilon^j)^2) = frac(1 - epsilon^j, 1 - (epsi
// MISSING LINE 2080
// MISSING LINE 2081
// MISSING LINE 2082
// MISSING LINE 2083
// MISSING LINE 2084
// MISSING LINE 2085
// MISSING LINE 2086
// MISSING LINE 2087
// MISSING LINE 2088
// MISSING LINE 2089
// MISSING LINE 2090
// MISSING LINE 2091
// MISSING LINE 2092
// MISSING LINE 2093
// MISSING LINE 2094
// MISSING LINE 2095
// MISSING LINE 2096
// MISSING LINE 2097
// MISSING LINE 2098
      - Đỉnh thứ ba được chọn không được trùng với 2 đỉnh của cạnh đã chọn, đồng thời không được kề với chúng (để tránh tạo thêm cạnh thứ hai). Số cách chọn đỉnh thứ ba là: $12 - 4 = 8$ cách.
      - Số tam giác loại này là: $12 dot 8 = 96$ tam giác.
    - Số tam giác không chứa cạnh nào của đa giác là:
      $ N = 220 - 12 - 96 = 112 " tam giác." $

    *Cách 2 (Sử dụng công thức vách ngăn dạng tròn):*
    Bài toán tương đương với việc chọn 3 đỉnh không kề nhau từ 12 đỉnh xếp trên một vòng tròn.
    Công thức tổng quát để chọn ra $k$ đối tượng không kề nhau từ $n$ đối tượng được xếp trên một vòng tròn ($n >= 2k$) là:
    $ N = frac(n, n-k) C_(n-k)^k $
    Áp dụng công thức trên với $n = 12$ và $k = 3$, ta có số cách chọn là:
    $ N = frac(12, 12-3) C_(12-3)^3 = frac(12, 9) C_9^3 = frac(4, 3) dot frac(9 dot 8 dot 7, 3 dot 2 dot 1) = frac(4, 3) dot 84 = 112 " tam giác." $
  ],
)

#prob(
  "21 ★★★",
  [Chứng minh đẳng thức tổ hợp sau với mọi số tự nhiên $n$ và $m$ thỏa mãn $0 <= m <= n$:
  $ sum_(k=0)^m C_n^k C_(n-k)^(m-k) = 2^m C_n^m $],
  [Đẳng thức được chứng minh],
  loigiai: [
    *Cách 1 (Sử dụng lập luận tổ hợp - Đếm bằng hai cách):*
    Giả sử có một nhóm gồm $n$ người phân biệt. Ta cần chọn ra một ban đại diện gồm đúng $m$ người, trong đó một số người trong ban đại diện được chọn làm thành viên chính thức, số còn lại là thành viên dự bị.
    Ta đếm số cách thiết lập ban đại diện này bằng hai phương pháp khác nhau:
    - *Phương pháp 1 (Đếm trực tiếp):*
      - Bước 1: Chọn ra $m$ người từ $n$ người để đưa vào ban đại diện. Số cách chọn là $C_n^m$.
      - Bước 2: Với mỗi người trong số $m$ người được chọn, ta quyết định xem họ là chính thức hay dự bị. Có 2 sự lựa chọn cho mỗi người, do đó có $2^m$ cách phân vai trò.
      Theo nguyên lý nhân, số cách thiết lập là: $2^m C_n^m$.
    - *Phương pháp 2 (Phân hoạch theo số thành viên dự bị):*
      Giả sử số thành viên dự bị được chọn trong ban đại diện là $k$ (với $0 <= k <= m$).
      - Bước 1: Chọn ra $k$ thành viên dự bị từ $n$ người ban đầu. Số cách chọn là $C_n^k$.
      - Bước 2: Chọn ra $m-k$ thành viên chính thức từ $n-k$ người còn lại. Số cách chọn là $C_(n-k)^(m-k)$.
      Tổng số cách chọn theo mọi trường hợp của $k$ là: $sum_(k=0)^m C_n^k C_(n-k)^(m-k)$.
    Vì cả hai phương pháp đều đếm cùng một đối tượng, ta suy ra đẳng thức cần chứng minh.

    *Cách 2 (Sử dụng đại số hàm sinh):*
    Ta biến đổi số hạng tổng quát của vế trái:
    $ C_n^k C_(n-k)^(m-k) = frac(n!, k! (n-k)!) dot frac((n-k)!, (m-k)! (n-m)!) = frac(n!, k! (m-k)! (n-m)!) $
    Nhân cả tử và mẫu với $m!$, ta được:
    $ C_n^k C_(n-k)^(m-k) = frac(n!, m! (n-m)!) dot frac(m!, k! (m-k)!) = C_n^m C_m^k $
    Thay vào biểu thức vế trái, ta thu được:
    $ sum_(k=0)^m C_n^k C_(n-k)^(m-k) = sum_(k=0)^m C_n^m C_m^k = C_n^m (sum_(k=0)^m C_m^k) $
    Áp dụng khai triển hàm sinh nhị thức Newton cho biểu thức $(1+x)^m$ tại điểm $x=1$:
    $ sum_(k=0)^m C_m^k = (1+1)^m = 2^m $
    Do đó, vế trái bằng $C_n^m dot 2^m = 2^m C_n^m$ (bằng vế phải). Đẳng thức được chứng minh hoàn toàn.
  ],
)

#prob(
  "22 ★★★",
  [Chọn ra 5 số từ tập hợp $S = {1, 2, ..., 20}$ sao cho khoảng cách giữa hai số bất kỳ được chọn ít nhất là 3. Hỏi có bao nhiêu cách chọn?],
  [792],
  loigiai: [
    *Cách 1 (Sử dụng phương pháp đổi biến - Song ánh):*
    Giả sử 5 số được chọn xếp theo thứ tự tăng dần là $x_1 < x_2 < x_3 < x_4 < x_5$.
    Điều kiện khoảng cách giữa hai số bất kỳ ít nhất là 3 có nghĩa là:
    $ x_(i+1) - x_i >= 3 quad (forall i = 1, 2, 3, 4) $
    Ta thực hiện đổi biến đặt:
    - $y_1 = x_1$
    - $y_2 = x_2 - 2$
    - $y_3 = x_3 - 4$
    - $y_4 = x_4 - 6$
    - $y_5 = x_5 - 8$
    Khi đó, từ điều kiện $x_(i+1) - x_i >= 3$, ta suy ra:
    $ y_(i+1) - y_i = x_(i+1) - x_i - 2 >= 3 - 2 = 1 $
    Điều này tương đương với $y_1 < y_2 < y_3 < y_4 < y_5$.
    Giới hạn của các biến $y_i$: do $1 <= x_1$ và $x_5 <= 20$ nên ta có:
    $ 1 <= y_1 < y_2 < y_3 < y_4 < y_5 <= 20 - 8 = 12 $
    Như vậy, mỗi cách chọn bộ $\{x_i\}$ tương ứng song ánh 1-1 với một cách chọn bộ 5 số phân biệt $\{y_i\}$ từ tập $\{1, ..., 12\}$.
    Số cách chọn thỏa mãn yêu cầu là: $C_(12)^5 = frac(12 dot 11 dot 10 dot 9 dot 8, 5 dot 4 dot 3 dot 2 dot 1) = 792$ cách.

    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*
    Quy bài toán về việc đếm số nghiệm nguyên. Giả sử 5 số được chọn xếp tăng dần là $x_1 < x_2 < ... < x_5$.
    Gọi:
    - $y_1 = x_1 - 1 >= 0$ là số lượng số không được chọn nằm trước $x_1$.
    - $
// MISSING LINE 2174
// MISSING LINE 2175
// MISSING LINE 2176
// MISSING LINE 2177
// MISSING LINE 2178
    $ f(t) = (sum_(i=0)^(infinity) t^i)^2 dot (sum_(i=2)^(infinity) t^i)^4 = (frac(1, 1-t))^2 dot (frac(t^2, 1-t))^4 = frac(t^8, (1-t)^6) $
    Số cách chọn thỏa mãn là hệ số của $t^(15)$ trong khai triển của $f(t)$:
    $ [t^(15)] f(t) = [t^(15)] frac(t^8, (1-t)^6) = [t^7] (1-t)^(-6) = C_(7+6-1)^7 = C_(12)^7 = C_(12)^5 = 792 " cách." $
  ],
)

#prob(
  "23 ★★★",
  [Tìm số chuỗi tam phân độ dài $n$ (gồm các chữ số 0, 1, 2) sao cho không chứa hai chữ số 0 nào đứng cạnh nhau.],
  [Công thức tổng quát: hệ số của $x^n$ trong $frac(1+x, 1-2x-2x^2)$],
  loigiai: [
    *Cách 1 (Sử dụng hệ thức truy hồi tuyến tính):*
    Gọi $a_n$ là số chuỗi tam phân độ dài $n$ thỏa mãn điều kiện không chứa "00".
    Phân tích chữ số tận cùng của chuỗi hợp lệ độ dài $n$:
    - Nếu chữ số tận cùng là 1 hoặc 2 (có 2 cách chọn): Phần trước đó độ dài $n-1$ là một chuỗi hợp lệ. Số cách là $2 a_(n-1)$.
    - Nếu chữ số tận cùng là 0: Chữ số kề cuối bắt buộc phải là 1 hoặc 2 (có 2 cách chọn). Phần trước đó độ dài $n-2$ là chuỗi hợp lệ. Số cách là $2 a_(n-2)$.
    Theo nguyên lý cộng, ta có hệ thức truy hồi:
    $ a_n = 2 a_(n-1) + 2 a_(n-2)  quad  (forall n >= 3) $
    Khởi tạo giá trị:
    - Với $n=1$: $\{0, 1, 2\}  ->  a_1 = 3$.
    - Với $n=2$: Các chuỗi độ dài 2 bất kỳ trừ đi chuỗi $00$ là $3^2 - 1 = 8  ->  a_2 = 8$.
    Bằng cách giải phương trình đặc trưng $r^2 - 2r - 2 = 0$, ta tìm được nghiệm tổng quát:
// MISSING LINE 2201
// MISSING LINE 2202
// MISSING LINE 2203
// MISSING LINE 2204
// MISSING LINE 2205
// MISSING LINE 2206
// MISSING LINE 2207
// MISSING LINE 2208
// MISSING LINE 2209
// MISSING LINE 2210
// MISSING LINE 2211
// MISSING LINE 2212
// MISSING LINE 2213
// MISSING LINE 2214
// MISSING LINE 2215
// MISSING LINE 2216
// MISSING LINE 2217
// MISSING LINE 2218
// MISSING LINE 2219
// MISSING LINE 2220
// MISSING LINE 2221
// MISSING LINE 2222
// MISSING LINE 2223
// MISSING LINE 2224
// MISSING LINE 2225
// MISSING LINE 2226
// MISSING LINE 2227
// MISSING LINE 2228
// MISSING LINE 2229
// MISSING LINE 2230
// MISSING LINE 2231
// MISSING LINE 2232
// MISSING LINE 2233
// MISSING LINE 2234
// MISSING LINE 2235
// MISSING LINE 2236
// MISSING LINE 2237
// MISSING LINE 2238
// MISSING LINE 2239
// MISSING LINE 2240
// MISSING LINE 2241
// MISSING LINE 2242
// MISSING LINE 2243
// MISSING LINE 2244
// MISSING LINE 2245
// MISSING LINE 2246
// MISSING LINE 2247
// MISSING LINE 2248
// MISSING LINE 2249
// MISSING LINE 2250
// MISSING LINE 2251
// MISSING LINE 2252
// MISSING LINE 2253
// MISSING LINE 2254
// MISSING LINE 2255
// MISSING LINE 2256
// MISSING LINE 2257
// MISSING LINE 2258
// MISSING LINE 2259
// MISSING LINE 2260
// MISSING LINE 2261
// MISSING LINE 2262
// MISSING LINE 2263
// MISSING LINE 2264
// MISSING LINE 2265
// MISSING LINE 2266
// MISSING LINE 2267
// MISSING LINE 2268
// MISSING LINE 2269
// MISSING LINE 2270
// MISSING LINE 2271
// MISSING LINE 2272
// MISSING LINE 2273
// MISSING LINE 2274
// MISSING LINE 2275
// MISSING LINE 2276
// MISSING LINE 2277
// MISSING LINE 2278
// MISSING LINE 2279
// MISSING LINE 2280
// MISSING LINE 2281
// MISSING LINE 2282
// MISSING LINE 2283
// MISSING LINE 2284
// MISSING LINE 2285
// MISSING LINE 2286
// MISSING LINE 2287
// MISSING LINE 2288
// MISSING LINE 2289
// MISSING LINE 2290
// MISSING LINE 2291
// MISSING LINE 2292
// MISSING LINE 2293
// MISSING LINE 2294
// MISSING LINE 2295
// MISSING LINE 2296
// MISSING LINE 2297
// MISSING LINE 2298
// MISSING LINE 2299
// MISSING LINE 2300
// MISSING LINE 2301
// MISSING LINE 2302
// MISSING LINE 2303
// MISSING LINE 2304
// MISSING LINE 2305
// MISSING LINE 2306
// MISSING LINE 2307
// MISSING LINE 2308
// MISSING LINE 2309
// MISSING LINE 2310
// MISSING LINE 2311
// MISSING LINE 2312
// MISSING LINE 2313
// MISSING LINE 2314
// MISSING LINE 2315
// MISSING LINE 2316
// MISSING LINE 2317
// MISSING LINE 2318
// MISSING LINE 2319
// MISSING LINE 2320
// MISSING LINE 2321
// MISSING LINE 2322
// MISSING LINE 2323
// MISSING LINE 2324
// MISSING LINE 2325
// MISSING LINE 2326
// MISSING LINE 2327
// MISSING LINE 2328
// MISSING LINE 2329
// MISSING LINE 2330
// MISSING LINE 2331
// MISSING LINE 2332
// MISSING LINE 2333
// MISSING LINE 2334
// MISSING LINE 2335
// MISSING LINE 2336
// MISSING LINE 2337
// MISSING LINE 2338
// MISSING LINE 2339
// MISSING LINE 2340
// MISSING LINE 2341
// MISSING LINE 2342
// MISSING LINE 2343
// MISSING LINE 2344
// MISSING LINE 2345
// MISSING LINE 2346
// MISSING LINE 2347
// MISSING LINE 2348
// MISSING LINE 2349
// MISSING LINE 2350
// MISSING LINE 2351
// MISSING LINE 2352
// MISSING LINE 2353
// MISSING LINE 2354
// MISSING LINE 2355
// MISSING LINE 2356
// MISSING LINE 2357
// MISSING LINE 2358
// MISSING LINE 2359
// MISSING LINE 2360
// MISSING LINE 2361
// MISSING LINE 2362
// MISSING LINE 2363
// MISSING LINE 2364
// MISSING LINE 2365
// MISSING LINE 2366
// MISSING LINE 2367
// MISSING LINE 2368
// MISSING LINE 2369
// MISSING LINE 2370
// MISSING LINE 2371
// MISSING LINE 2372
// MISSING LINE 2373
// MISSING LINE 2374
// MISSING LINE 2375
// MISSING LINE 2376
// MISSING LINE 2377
// MISSING LINE 2378
// MISSING LINE 2379
// MISSING LINE 2380
// MISSING LINE 2381
// MISSING LINE 2382
// MISSING LINE 2383
// MISSING LINE 2384
// MISSING LINE 2385
// MISSING LINE 2386
// MISSING LINE 2387
// MISSING LINE 2388
// MISSING LINE 2389
// MISSING LINE 2390
// MISSING LINE 2391
// MISSING LINE 2392
// MISSING LINE 2393
// MISSING LINE 2394
// MISSING LINE 2395
// MISSING LINE 2396
// MISSING LINE 2397
// MISSING LINE 2398
// MISSING LINE 2399
// MISSING LINE 2400
// MISSING LINE 2401
// MISSING LINE 2402
// MISSING LINE 2403
// MISSING LINE 2404
// MISSING LINE 2405
// MISSING LINE 2406
// MISSING LINE 2407
// MISSING LINE 2408
// MISSING LINE 2409
// MISSING LINE 2410
// MISSING LINE 2411
// MISSING LINE 2412
// MISSING LINE 2413
// MISSING LINE 2414
// MISSING LINE 2415
// MISSING LINE 2416
// MISSING LINE 2417
// MISSING LINE 2418
// MISSING LINE 2419
// MISSING LINE 2420
// MISSING LINE 2421
// MISSING LINE 2422
// MISSING LINE 2423
// MISSING LINE 2424
// MISSING LINE 2425
// MISSING LINE 2426
// MISSING LINE 2427
// MISSING LINE 2428
// MISSING LINE 2429
// MISSING LINE 2430
// MISSING LINE 2431
// MISSING LINE 2432
// MISSING LINE 2433
// MISSING LINE 2434
// MISSING LINE 2435
// MISSING LINE 2436
// MISSING LINE 2437
// MISSING LINE 2438
// MISSING LINE 2439
// MISSING LINE 2440
// MISSING LINE 2441
// MISSING LINE 2442
// MISSING LINE 2443
// MISSING LINE 2444
// MISSING LINE 2445
// MISSING LINE 2446
// MISSING LINE 2447
// MISSING LINE 2448
// MISSING LINE 2449
// MISSING LINE 2450
// MISSING LINE 2451
// MISSING LINE 2452
// MISSING LINE 2453
// MISSING LINE 2454
// MISSING LINE 2455
// MISSING LINE 2456
// MISSING LINE 2457
// MISSING LINE 2458
// MISSING LINE 2459
// MISSING LINE 2460
// MISSING LINE 2461
// MISSING LINE 2462
// MISSING LINE 2463
// MISSING LINE 2464
// MISSING LINE 2465
// MISSING LINE 2466
// MISSING LINE 2467
// MISSING LINE 2468
// MISSING LINE 2469
// MISSING LINE 2470
// MISSING LINE 2471
// MISSING LINE 2472
// MISSING LINE 2473
// MISSING LINE 2474
// MISSING LINE 2475
// MISSING LINE 2476
// MISSING LINE 2477
// MISSING LINE 2478
// MISSING LINE 2479
// MISSING LINE 2480
// MISSING LINE 2481
// MISSING LINE 2482
// MISSING LINE 2483
// MISSING LINE 2484
// MISSING LINE 2485
// MISSING LINE 2486
// MISSING LINE 2487
// MISSING LINE 2488
// MISSING LINE 2489
// MISSING LINE 2490
// MISSING LINE 2491
// MISSING LINE 2492
// MISSING LINE 2493
// MISSING LINE 2494
// MISSING LINE 2495
// MISSING LINE 2496
// MISSING LINE 2497
// MISSING LINE 2498
// MISSING LINE 2499
)

#prob(
  "33 ★★★",
  [Cho một đa giác đều có 15 đỉnh. Chọn ra 3 đỉnh tùy ý của đa giác. Tính số tam giác cân được tạo thành từ 3 đỉnh được chọn.],
  [95],
  loigiai: [
    *Cách 1 (Đếm theo đỉnh đối xứng và hiệu chỉnh tam giác đều):*
    Mỗi tam giác cân trong đa giác đều có một đỉnh duy nhất đóng vai trò là đỉnh cân.
    - Chọn 1 đỉnh trong 15 đỉnh làm đỉnh cân của tam giác cân: Có 15 cách chọn.
    - Trục đối xứng đi qua đỉnh cân và tâm đa giác sẽ chia các đỉnh còn lại thành các cặp đối xứng. Khoảng cách đo theo số cạnh từ các đỉnh này đến đỉnh cân là bằng nhau.
    - Số cặp đối xứng như vậy trên đa giác 15 đỉnh là: $frac(15-1, 2) = 7$ cặp.
    - Mỗi đỉnh cân cho ta chọn 7 tam giác cân. Vậy tổng số tam giác cân đếm được là: $15 dot 7 = 105$.
    - Tuy nhiên, trong số các tam giác cân này, các tam giác đều đã bị đếm lặp.
      - Số tam giác đều tạo bởi 15 đỉnh là: $frac(15, 3) = 5$ tam giác đều.
      - Mỗi tam giác đều có 3 đỉnh đối xứng đóng vai trò đỉnh cân, do đó mỗi tam giác đều đã bị đếm lặp đúng 3 lần trong tổng số 105 trên.
    Số tam giác cân thực tế (kể cả tam giác đều) là:
    $ N = 105 - 2 dot 5 = 95 " tam giác." $
// MISSING LINE 2518
// MISSING LINE 2519
// MISSING LINE 2520
// MISSING LINE 2521
// MISSING LINE 2522
// MISSING LINE 2523
// MISSING LINE 2524
// MISSING LINE 2525
// MISSING LINE 2526
// MISSING LINE 2527
// MISSING LINE 2528
// MISSING LINE 2529
// MISSING LINE 2530
// MISSING LINE 2531
// MISSING LINE 2532
// MISSING LINE 2533
// MISSING LINE 2534
// MISSING LINE 2535
// MISSING LINE 2536
// MISSING LINE 2537
// MISSING LINE 2538
// MISSING LINE 2539
// MISSING LINE 2540
// MISSING LINE 2541
// MISSING LINE 2542
// MISSING LINE 2543
    $ 2^n + 0 = 2 (C_n^0 + C_n^2 + C_n^4 + ...)  <->  2^n = 2 S $
    Do đó, số chuỗi nhị phân có số lượng số 1 chẵn là:
    $ S = 2^(n-1) " chuỗi." $

    *Cách 2 (Sử dụng đại số hàm sinh - Generating Functions):*
    Ta xây dựng hàm sinh cho từng vị trí trong chuỗi nhị phân:
    Mỗi vị trí có thể đặt chữ số 0 (đóng góp 0 vào số lượng số 1, hàm sinh $1$) hoặc đặt chữ số 1 (đóng góp 1 vào số lượng số 1, hàm sinh $y$ để theo dõi số lượng chữ số 1).
    Hàm sinh tổng quát cho chuỗi nhị phân độ dài $n$ là:
    $ F(y) = (1 + y)^n = sum_(k=0)^n C_n^k y^k $
    Ta cần tính tổng các hệ số của $y^k$ với $k$ chẵn.
    Sử dụng bộ lọc căn đơn vị bậc 2 (roots of unity filter) bằng cách lấy trung bình cộng giá trị của hàm sinh tại $y = 1$ và $y = -1$:
    $ S = frac(F(1) + F(-1), 2) = frac((1+1)^n + (1-1)^n, 2) = frac(2^n + 0, 2) = 2^(n-1) " chuỗi." $
  ],
)

#prob(
  "35 ★★★",
  [Cho tập hợp $S = {1, 2, ..., n}$ (với $n >= 1$). Có bao nhiêu tập con $A$ của $S$ sao cho tổng tất cả các phần tử của $A$ là một số chia hết cho 3 (quy ước tổng các phần tử của tập rỗng bằng 0)?],
  [Nếu $n = 3m$: $frac(1, 3) (2^n + 2^(n/3 + 1))$; nếu $n = 3m+1$: $frac(1, 3) (2^n + 2^((n-1)/3))$; nếu $n = 3m+2$: $frac(1, 3) (2^n + 2^((n+1)/3))$],
  loigiai: [
    *Cách 1 (Sử dụng hệ thức truy hồi):*
    Gọi $a_n, b_n, c_n$ lần lượt là số tập con của tập $\{1, 2, ..., n\}$ có tổng các phần tử chia cho 3 dư 0, 1, 2.
    Khi xét thêm phần tử $n+1$:
    - *Trường hợp $n+1$ chia hết cho 3:* Phần tử này không làm thay đổi số dư 
// MISSING LINE 2568
// MISSING LINE 2569
// MISSING LINE 2570
// MISSING LINE 2571
// MISSING LINE 2572
// MISSING LINE 2573
// MISSING LINE 2574
// MISSING LINE 2575
// MISSING LINE 2576
// MISSING LINE 2577
// MISSING LINE 2578
// MISSING LINE 2579
// MISSING LINE 2580
// MISSING LINE 2581
// MISSING LINE 2582
// MISSING LINE 2583
// MISSING LINE 2584
// MISSING LINE 2585
// MISSING LINE 2586
// MISSING LINE 2587
// MISSING LINE 2588
// MISSING LINE 2589
// MISSING LINE 2590
// MISSING LINE 2591
// MISSING LINE 2592
// MISSING LINE 2593
        $ N = frac(1, 3) (2^n + 2^(n/3) + 2^(n/3)) = frac(1, 3) (2^n + 2^(n/3 + 1)) $
      - Nếu $n = 3m+1$: $f(omega) = 2^m (1+omega) = 2^m (-omega^2)$, và $f(omega^2) = 2^m (1+omega^2) = 2^m (-omega)$.
        $ f(omega) + f(omega^2) = 2^m (-omega^2 - omega) = 2^m (1) = 2^((n-1)/3) $
        $ N = frac(1, 3) (2^n + 2^((n-1)/3)) $
      - Nếu $n = 3m+2$: $f(omega) = 2^m (1+omega)(1+omega^2) = 2^m$, và $f(omega^2) = 2^m (1+omega^2)(1+omega) = 2^m$.
        $ f(omega) + f(omega^2) = 2 dot 2^m = 2^((n-2)/3 + 1) = 2^((n+1)/3) $
        $ N = frac(1, 3) (2^n + 2^((n+1)/3)) $
    Cả hai phương pháp đều dẫn tới cùng một công thức nhất quán.
  ],
)

#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN III: BẢNG TỔNG HỢP CÔNG THỨC
// ══════════════════════════════════════════════════════════════
= Bảng Tổng Hợp Công Thức Cốt Lõi

#align(center)[
  #block(width: 100%)[
    #table(
      columns: (1.2fr, 2fr, 1.2fr, 2fr),
      align: (center, left, center, left),
      stroke: 0.6pt + rgb("E2E8F0"),
      inset: (x: 8pt, y: 7pt),
      fill: (x,y) => if y==0 { c-navy } else if calc.rem(y,2)==0 { rgb("F8FAFC") } else { white },

      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],
      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],

      [Hoán vị], $P_n = n!$, [Tổ hợp], $C_n^k = frac(n!, k!(n-k)!)$,
      [Chỉnh hợp], $A_n^k = frac(n!, (n-k)!)$, [Hoán vị lặp], $frac(n!, n_1!n_2!dots.c n_k!)$,
      [Vách ngăn ($>= 0$)], $C_(n+k-1)^(k-1)$, [Vách ngăn ($>= 1$)], $C_(n-1)^(k-1)$,
      [Stirling loại 2], $S(n,k) = frac(1, k!) sum (-1)^j C_k^j (k-j)^n$, [Số Bell], $B(n) = sum_(k=1)^n S(n,k)$,
      [Số Catalan], $C_n = frac(1, n+1) C_(2n)^n$, [Đa thức sắc vòng], $(k-1)^n + (k-1)(-1)^n$,
      [Dãy Fibonacci], $F_n = F_(n-1)+F_(n-2)$, [Hàm phi Euler], $phi(n) = n product_(p|n) (1 - 1/p)$,
      [Khai triển], $(a+b)^n = sum C_n^k a^(n-k) b^k$, [Vandermonde], $C_(2n)^n = sum_(k=0)^n (C_n^k)^2$,
    )
  ]
]

#v(1em)
#key-box[
  *Phương châm giải toán Đại số Tổ hợp:*
  - *Xem xét tính phân biệt:* Vật phân biệt hay giống nhau? Hộp/Nhóm phân biệt hay giống nhau?
  - *Xem xét tính thứ tự:* Lựa chọn có quan tâm đến thứ tự sắp xếp hay chỉ lấy ra tập hợp?
  - *Đơn giản hóa mô hình:* Nếu đếm xuôi có quá nhiều điều kiện chặn, hãy lập tức nghĩ đến việc đếm gián tiếp qua phần bù hoặc thiết lập hệ thức truy hồi.
]

