import re

def fix4(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    content = content.replace('[Số học sinh giải được ít nhất một bài toán là 39 em.],', 'True([Số học sinh giải được ít nhất một bài toán là 39 em.]),')
    content = content.replace('[Số học sinh lớp 10A không giải được bài toán nào là 1 em.],', 'True([Số học sinh lớp 10A không giải được bài toán nào là 1 em.]),')
    content = content.replace('[Số học sinh chỉ giải được đúng một bài toán là 16 em.],', 'False([Số học sinh chỉ giải được đúng một bài toán là 16 em.]),')
    content = content.replace('[Số học sinh giải được bài A hoặc bài B nhưng không giải được bài C là 24 em.],', 'True([Số học sinh giải được bài A hoặc bài B nhưng không giải được bài C là 24 em.]),')
    
    content = content.replace('[$m$ không thể nhận giá trị bằng 1.],', 'True([$m$ không thể nhận giá trị bằng 1.]),')
    content = content.replace('[$m$ có thể nhận giá trị bằng -2.],', 'True([$m$ có thể nhận giá trị bằng -2.]),')
    content = content.replace('[Tổng các giá trị nguyên của $m$ thỏa mãn yêu cầu bằng 0.],', 'True([Tổng các giá trị nguyên của $m$ thỏa mãn yêu cầu bằng 0.]),')
    content = content.replace('[Có đúng 2 giá trị của $m$ thỏa mãn yêu cầu bài toán.],', 'True([Có đúng 2 giá trị của $m$ thỏa mãn yêu cầu bài toán.]),')
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

def fix5(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    content = content.replace('[Tập hợp $A$ có 5 phần tử.],', 'True([Tập hợp $A$ có 5 phần tử.]),')
    content = content.replace('[Tập hợp $B$ là một tập con của $A$.],', 'True([Tập hợp $B$ là một tập con của $A$.]),')
    content = content.replace('[Tập hợp $A setminus B = {-2, 0}$.],', 'False([Tập hợp $A setminus B = {-2, 0}$.]),')
    content = content.replace('[Số tập con của tập $A union B$ bằng 64.],', 'False([Số tập con của tập $A union B$ bằng 64.]),')
    
    content = content.replace('[Số gia đình có ít nhất một trong ba thiết bị trên là 100.],', 'False([Số gia đình có ít nhất một trong ba thiết bị trên là 100.]),')
    content = content.replace('[Số gia đình sở hữu cả ba thiết bị là 5.],', 'False([Số gia đình sở hữu cả ba thiết bị là 5.]),')
    content = content.replace('[Số gia đình chỉ có duy nhất ti vi là 10.],', 'False([Số gia đình chỉ có duy nhất ti vi là 10.]),')
    content = content.replace('[Số gia đình có đúng hai trong ba loại thiết bị trên là 90.],', 'False([Số gia đình có đúng hai trong ba loại thiết bị trên là 90.]),')
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

fix4('de-on-kiem-tra-chuong-1-de-4.typ')
fix5('de-on-kiem-tra-chuong-1-de-5.typ')
