import re
import glob

# Dictionary mapping question snippets to their corresponding Typst figure code
figures = {
    # 1. Hộp không nắp từ tôn hình vuông (Đề 1, Đề 8)
    "hình vuông cạnh 60 cm": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 7,7",
        {
          sm-polygon((0,0), (6,0), (6,6), (0,6), name: "ABCD", dut: false)
          sm-polygon((0,0), (1.5,0), (1.5,1.5), (0,1.5), mau: rgb("ffcccc"), day: 0pt)
          sm-polygon((6,0), (4.5,0), (4.5,1.5), (6,1.5), mau: rgb("ffcccc"), day: 0pt)
          sm-polygon((6,6), (4.5,6), (4.5,4.5), (6,4.5), mau: rgb("ffcccc"), day: 0pt)
          sm-polygon((0,6), (1.5,6), (1.5,4.5), (0,4.5), mau: rgb("ffcccc"), day: 0pt)
          sm-line((1.5,1.5), (4.5,1.5), dut: true)
          sm-line((1.5,4.5), (4.5,4.5), dut: true)
          sm-line((1.5,1.5), (1.5,4.5), dut: true)
          sm-line((4.5,1.5), (4.5,4.5), dut: true)
          sm-text((3, -0.3), "60 - 2x")
          sm-text((0.75, 0.75), "x")
        }
      )
    ]
    """,
    "hình vuông cạnh 12 cm": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 7,7",
        {
          sm-polygon((0,0), (6,0), (6,6), (0,6), name: "ABCD", dut: false)
          sm-polygon((0,0), (1.5,0), (1.5,1.5), (0,1.5), mau: rgb("ffcccc"), day: 0pt)
          sm-polygon((6,0), (4.5,0), (4.5,1.5), (6,1.5), mau: rgb("ffcccc"), day: 0pt)
          sm-polygon((6,6), (4.5,6), (4.5,4.5), (6,4.5), mau: rgb("ffcccc"), day: 0pt)
          sm-polygon((0,6), (1.5,6), (1.5,4.5), (0,4.5), mau: rgb("ffcccc"), day: 0pt)
          sm-line((1.5,1.5), (4.5,1.5), dut: true)
          sm-line((1.5,4.5), (4.5,4.5), dut: true)
          sm-line((1.5,1.5), (1.5,4.5), dut: true)
          sm-line((4.5,1.5), (4.5,4.5), dut: true)
          sm-text((3, -0.3), "12 - 2x")
          sm-text((0.75, 0.75), "x")
        }
      )
    ]
    """,
    
    # 2. Bài toán tàu biển, cáp ngầm (A trên đảo, B hình chiếu, C đích) (Đề 5, Đề 6, Đề 8)
    "trạm phát A trên bờ biển tới một hòn đảo C": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 11,5",
        {
          sm-line((0,0), (10,0), day: 1.5pt, mau: blue) // Bờ biển
          sm-diem(ctx, (0,4), ten: "C (Đảo)", huong: "tren")
          sm-diem(ctx, (0,0), ten: "B", huong: "duoi")
          sm-diem(ctx, (10,0), ten: "A", huong: "duoi")
          sm-diem(ctx, (6,0), ten: "M", huong: "duoi")
          sm-line((0,4), (0,0), dut: true)
          sm-line((0,4), (6,0), mau: red, day: 1.5pt)
          sm-line((6,0), (10,0), mau: red, day: 1.5pt)
          sm-ve-goc-vuong(ctx, (0,4), (0,0), (10,0))
          sm-text((3, -0.5), "x")
          sm-text((8, -0.5), "10 - x")
          sm-text((-0.5, 2), "4")
        }
      )
    ]
    """,
    "từ trạm khoan trên biển A đến nhà máy lọc dầu C": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 11,7",
        {
          sm-line((0,0), (10,0), day: 1.5pt, mau: blue) // Bờ biển
          sm-diem(ctx, (0,6), ten: "A (Khoan)", huong: "tren")
          sm-diem(ctx, (0,0), ten: "B", huong: "duoi")
          sm-diem(ctx, (10,0), ten: "C (Nhà máy)", huong: "duoi")
          sm-diem(ctx, (4.5,0), ten: "M", huong: "duoi")
          sm-line((0,6), (0,0), dut: true)
          sm-line((0,6), (4.5,0), mau: red, day: 1.5pt)
          sm-line((4.5,0), (10,0), mau: red, day: 1.5pt)
          sm-ve-goc-vuong(ctx, (0,6), (0,0), (10,0))
          sm-text((2.25, -0.5), "x")
          sm-text((7.25, -0.5), "10 - x")
          sm-text((-0.5, 3), "6")
        }
      )
    ]
    """,
    "Một người chèo thuyền xuất phát từ điểm A trên một hòn đảo": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 9,4",
        {
          sm-line((0,0), (8,0), day: 1.5pt, mau: blue) // Bờ biển
          sm-diem(ctx, (0,3), ten: "A (Đảo)", huong: "tren")
          sm-diem(ctx, (0,0), ten: "B", huong: "duoi")
          sm-diem(ctx, (8,0), ten: "C", huong: "duoi")
          sm-diem(ctx, (4,0), ten: "M", huong: "duoi")
          sm-line((0,3), (0,0), dut: true)
          sm-line((0,3), (4,0), mau: red, day: 1.5pt)
          sm-line((4,0), (8,0), mau: red, day: 1.5pt)
          sm-ve-goc-vuong(ctx, (0,3), (0,0), (8,0))
          sm-text((2, -0.5), "x")
          sm-text((6, -0.5), "8 - x")
          sm-text((-0.5, 1.5), "3")
        }
      )
    ]
    """,
    
    # 3. Diện tích màn hình, áp phích (Đề 2, Đề 7)
    "diện tích phần hiển thị là 96 cm2": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 7,11",
        {
          sm-polygon((0,0), (6,0), (6,10), (0,10), mau: rgb("e2e8f0"), day: 0pt) // Toàn bộ điện thoại
          sm-polygon((1,1.5), (5,1.5), (5,8.5), (1,8.5), mau: rgb("3b82f6"), day: 0pt) // Màn hình
          sm-polygon((0,0), (6,0), (6,10), (0,10), dut: false, day: 1.5pt)
          sm-polygon((1,1.5), (5,1.5), (5,8.5), (1,8.5), dut: false, day: 1pt)
          sm-text((3, 5), "96 cm²", mau: white)
          sm-text((0.5, 5), "2")
          sm-text((3, 9.25), "3")
          sm-text((3, -0.5), "W = y + 4")
          sm-text((7, 5), "H = x + 6")
        }
      )
    ]
    """,
    "áp phích quảng cáo hình chữ nhật có diện tích phần in là 384": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 9,13",
        {
          sm-polygon((0,0), (8,0), (8,12), (0,12), mau: rgb("e2e8f0"), day: 0pt)
          sm-polygon((1,1.5), (7,1.5), (7,10.5), (1,10.5), mau: rgb("10b981"), day: 0pt)
          sm-polygon((0,0), (8,0), (8,12), (0,12), dut: false, day: 1.5pt)
          sm-polygon((1,1.5), (7,1.5), (7,10.5), (1,10.5), dut: false, day: 1pt)
          sm-text((4, 6), "384 cm²", mau: white)
          sm-text((0.5, 6), "2")
          sm-text((4, 11.25), "3")
          sm-text((4, -0.5), "W = y + 4")
          sm-text((9, 6), "H = x + 6")
        }
      )
    ]
    """,
    
    # 4. Hàng rào 3 mặt (Đề 3)
    "100m hàng rào lưới thép": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 7,4",
        {
          sm-line((0,3), (6,3), day: 3pt, mau: gray) // Tường
          sm-line((1,3), (1,0), day: 1.5pt, mau: blue) // Rào x
          sm-line((1,0), (5,0), day: 1.5pt, mau: blue) // Rào y
          sm-line((5,0), (5,3), day: 1.5pt, mau: blue) // Rào x
          sm-text((3, 3.5), "Bờ tường")
          sm-text((0.5, 1.5), "x")
          sm-text((5.5, 1.5), "x")
          sm-text((3, -0.5), "y = 100 - 2x")
        }
      )
    ]
    """,
    
    # 5. Khối trụ, hình hộp
    "thùng chứa dạng hình hộp chữ nhật có đáy là hình vuông": r"""
    #align(center)[
      #sm-hop-chu-nhat(a: 3, b: 3, h: 4, them: (ctx, d) => {
         sm-text((d.A.at(0) + 1.5, d.A.at(1) - 0.5), "x")
         sm-text((d.B.at(0) + 1, d.B.at(1) + 0.5), "x")
         sm-text((d.A.at(0) - 0.5, d.A.at(1) + 2), "h")
      })
    ]
    """,
    "bồn chứa nước hình trụ có thể tích $V = 10\pi": r"""
    #align(center)[
      #sm-tru(r: 2, h: 4, them: (ctx, d) => {
         sm-line(d.O2, (d.O2.at(0)+2, d.O2.at(1)), dut: true)
         sm-text((d.O2.at(0)+1, d.O2.at(1)-0.3), "R")
         sm-text((d.O2.at(0)-0.5, d.O2.at(1)+2), "h")
      })
    ]
    """,
    "bồn chứa hóa chất có hình trụ tròn xoay (được đậy nắp kín)": r"""
    #align(center)[
      #sm-tru(r: 2, h: 4, them: (ctx, d) => {
         sm-line(d.O2, (d.O2.at(0)+2, d.O2.at(1)), dut: true)
         sm-line(d.O1, (d.O1.at(0)+2, d.O1.at(1)), dut: false)
         sm-text((d.O2.at(0)+1, d.O2.at(1)-0.3), "R")
         sm-text((d.O2.at(0)-0.5, d.O2.at(1)+2), "h")
      })
    ]
    """,
    "cắt ra một thanh gỗ hình lăng trụ tứ giác đều": r"""
    #align(center)[
      #sm-tru(r: 2, h: 4, them: (ctx, d) => {
         // Đáy dưới (ABCD)
         let A = (d.O2.at(0) - 1.414, d.O2.at(1) - 0.5)
         let B = (d.O2.at(0) + 1.414, d.O2.at(1) - 0.5)
         let C = (d.O2.at(0) + 1.414, d.O2.at(1) + 0.5)
         let D = (d.O2.at(0) - 1.414, d.O2.at(1) + 0.5)
         // Đáy trên (A1B1C1D1)
         let A1 = (A.at(0), A.at(1) + 4)
         let B1 = (B.at(0), B.at(1) + 4)
         let C1 = (C.at(0), C.at(1) + 4)
         let D1 = (D.at(0), D.at(1) + 4)
         
         sm-polygon(A, B, C, D, dut: true, mau: red)
         sm-polygon(A1, B1, C1, D1, dut: false, mau: red)
         sm-line(A, A1, mau: red, day: 1pt)
         sm-line(B, B1, mau: red, day: 1pt)
         sm-line(C, C1, mau: red, day: 1pt, dut: true)
         sm-line(D, D1, mau: red, day: 1pt, dut: true)
      })
    ]
    """,
    
    # 6. Máng nước gấp (Đề 10)
    "máng dẫn nước bằng cách gấp một tấm tôn": r"""
    #align(center)[
      #sm-ve-hinh(
        box: "-1,-1, 7,3",
        {
          sm-line((0,2), (2,0), day: 1.5pt, mau: blue)
          sm-line((2,0), (5,0), day: 1.5pt, mau: blue)
          sm-line((5,0), (7,2), day: 1.5pt, mau: blue)
          sm-line((0,2), (7,2), dut: true)
          sm-text((3.5, -0.5), "x")
          sm-text((0.5, 0.5), "(30-x)/2")
          sm-text((6.5, 0.5), "(30-x)/2")
        }
      )
    ]
    """
}

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")

for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    new_content = content
    for key, typst_code in figures.items():
        if key in new_content:
            # Find where this question is.
            # We look for the "loigiai: [" block that immediately follows this key.
            # A simple way: find the key, then find the next "loigiai: [", and insert typst_code right after it.
            
            # Split the content around the key to make sure we modify the correct loigiai
            parts = new_content.split(key)
            if len(parts) > 1:
                # the first loigiai after the key is in parts[1]
                sub_parts = parts[1].split("loigiai: [", 1)
                if len(sub_parts) == 2:
                    parts[1] = sub_parts[0] + "loigiai: [\n" + typst_code + sub_parts[1]
                    new_content = key.join(parts)

    if new_content != content:
        with open(path, "w") as fw:
            fw.write(new_content)
        print(f"Added figures to {path}")

