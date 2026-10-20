// Bộ hình theo bài: mỗi bộ là danh sách mẫu (id mẫu rời + thuộc tính tùy chọn); editor tự xếp lưới vừa khổ bảng.
// [id bộ, môn, lớp, tên, mô tả, [ [idMẫu, {props}?], … ], số cột]
const B = (id, g, lop, ten, mo, items, cot = 2) => ({ id, g, lop, ten, mo, items: items.map(i => (Array.isArray(i) ? { k: i[0], p: i[1] || {} } : { k: i, p: {} })), cot })

export const BO_HINH = [
  // ── Hóa
  B('b-khi', 'Hóa học', '10–11', 'Điều chế và thu các khí (SO₂, CO₂, NH₃, Cl₂, O₂, H₂)', 'Sáu sơ đồ điều chế khí thường gặp', ['tn-so2', 'tn-co2', 'tn-nh3', 'tn-cl2', 'tn-o2', 'tn-h2']),
  B('b-hc-khi', 'Hóa học', '11', 'Điều chế hiđrocacbon (C₂H₄, C₂H₂)', 'Etilen và axetilen', ['tn-c2h4', 'tn-c2h2']),
  B('b-dienhoa', 'Hóa học', '12', 'Điện hóa học', 'Pin Zn–Cu, ăn mòn điện hóa, mạ điện, điện phân NaCl', ['tn-pin-zn-cu', 'tn-an-mon', 'tn-ma-dien', 'tn-dien-phan-nacl']),
  B('b-dungcu', 'Hóa học', '8–12', 'Dụng cụ thí nghiệm cơ bản', 'Cốc, bình, ống nghiệm, ống đong, buret, phễu, pipet, đèn cồn…', ['coc', 'erlen', 'binh-cau', 'ong-nghiem', 'ong-dong', 'buret', 'pheu', 'binh-dinh-muc', 'pipet', 'den-con'], 5),
  B('b-tachchat', 'Hóa học', '8–11', 'Tách chất: lọc và chưng cất', 'Lọc thường, chưng cất thường', ['tn-loc', 'tn-chung-cat']),
  B('b-tinhthe', 'Hóa học', '10–12', 'Mạng tinh thể', 'NaCl, kim cương, than chì, lập phương tâm khối và tâm diện', ['tt-nacl', 'tt-kimcuong', 'tt-thanchi', 'tt-tamkhoi', 'tt-tamdien'], 3),
  B('b-dongphan', 'Hóa học', '11', 'Đồng phân hữu cơ', 'C₄H₁₀, C₅H₁₂, C₄H₈, C₂H₆O', ['dp-c4h10', 'dp-c5h12', 'dp-c4h8', 'dp-c2h6o'], 1),
  B('b-cacbohidrat', 'Hóa học', '12', 'Cacbohiđrat', 'Glucozơ, fructozơ, saccarozơ', ['hc-glucozo-mach-ho', 'hc-glucozo-dang-vong', 'hc-fructozo-mach-ho', 'hc-saccarozo']),
  B('b-aminoaxit', 'Hóa học', '12', 'Amino axit và peptit', 'Gly, Ala, Lys, Glu, Gly-Ala', ['hc-glyxin', 'hc-alanin', 'hc-lysin', 'hc-axit-glutamic', 'hc-gly-ala-dipeptit'], 3),
  B('b-este', 'Hóa học', '12', 'Este – chất béo', 'Metyl axetat, etyl axetat, vinyl axetat, isoamyl axetat, axit béo', ['hc-metyl-axetat', 'hc-etyl-axetat', 'hc-vinyl-axetat', 'hc-isoamyl-axetat', 'hc-axit-stearic', 'hc-axit-oleic'], 3),
  B('b-ptpu', 'Hóa học', '10–12', 'Phương trình phản ứng hay gặp', 'Mười hai phương trình tự cân bằng', ['hh-ot-chay-etanol', 'hh-nhiet-phan-kmno', 'hh-fe-tac-dung-hcl', 'hh-al-tac-dung-hno-loang', 'hh-kmno-hcl-dac', 'hh-fe-so-naoh', 'hh-nung-fes', 'hh-este-hoa'], 1),
  // ── Lý
  B('b-rlc', 'Vật lí', '12', 'Dòng điện xoay chiều RLC', 'Mạch RLC, giản đồ Fresnel, đồ thị u–i, mạch LC', ['v-rlc', 'v-fresnel', 'v-ui', 'v-mach-lc']),
  B('b-quang', 'Vật lí', '11', 'Quang hình học', 'Dựng ảnh qua thấu kính, khúc xạ, mắt cận/viễn', ['q-anh-thauk', 'q-khuc-xa', ['v-mat', { kind: 'can', kinh: true }], ['v-mat', { kind: 'vien', kinh: true }]]),
  B('b-giaothoa', 'Vật lí', '12', 'Giao thoa ánh sáng và sóng', 'Young, vân giao thoa, sóng nước hai nguồn, nhiễu xạ', ['v-young', 'v-gt-I', 'v-gt-2nguon', 'v-nhieu-xa']),
  B('b-khi-li-tuong', 'Vật lí', '10', 'Khí lí tưởng: các đẳng quá trình', 'Ba đồ thị p–V, V–T, p–T và chu trình Cacnô', ['v-3dt-nhiet', 'v-3dt-ap', 'v-3dt-tich', 'v-ct-carno'], 1),
  B('b-dientu', 'Vật lí', '11–12', 'Điện từ học', 'Cảm ứng điện từ, khung dây, máy biến áp, lực Lo-ren-xơ', ['v-cam-ung', 'v-khung-tt', 'v-bien-ap', 'v-lorentz']),
  B('b-luongtu', 'Vật lí', '12', 'Vật lí lượng tử và hạt nhân', 'Quang điện, Rutherford, quang phổ vạch, phân hạch', ['v-quang-dien', 'v-rutherford', 'v-pho-vach', 'v-phan-hach']),
  B('b-daodong', 'Vật lí', '11–12', 'Dao động cơ', 'Con lắc đơn, lò xo thẳng đứng và nằm ngang, đồ thị x(t)', ['con-lac-don', 'loxo-treo', 'v-conlac-ngang', 'l-ddh'], 4),
  // ── Toán
  B('b-khaosat', 'Toán', '12', 'Khảo sát hàm số', 'Đồ thị bậc ba, phân thức, tiệm cận xiên, trùng phương, kèm BBT', ['g-bac3-ct', 'g-ptcd', 'g-tcx', 'g-tp-ct', 'b-bac3', 'b-phanthuc']),
  B('b-hhkg-11', 'Toán', '11', 'Hình học không gian: chóp, lăng trụ, thiết diện', 'Chóp đều, lập phương, thiết diện', ['s-chop-deu-4', 's-lapphuong', 's-td-lp-luc-giac', 's-td-chop-song-song'], 4),
  B('b-gockc', 'Toán', '11', 'Góc và khoảng cách trong không gian', 'Góc đường–mặt, mặt–mặt, khoảng cách điểm–mặt, hai đường chéo nhau', ['s-goc-dt-mp', 's-goc-mp-mp', 's-kc-diem-mp', 's-kc-cheo-nhau']),
  B('b-xoay', 'Toán', '12', 'Mặt cầu, nón, trụ', 'Mặt cầu nội/ngoại tiếp, hình trụ, nón, nón cụt', ['s-cau-cube-ngoai', 's-cau-chop-noi', 'g-xoay-tru', 'g-xoay-non', 'g-xoay-noncut'], 3),
  B('b-conic', 'Toán', '10', 'Ba đường conic', 'Elip, hypebol, parabol', ['g-elip-tn', 'g-hypebol-tn', 'g-parabol-tn'], 3),
  B('b-tichphan', 'Toán', '12', 'Ứng dụng tích phân', 'Diện tích hình phẳng, thể tích khối tròn xoay', ['g-dien-tich', 'g-the-tich']),
  B('b-xacsuat', 'Toán', '11–12', 'Xác suất và thống kê', 'Cây xác suất, bảng phân phối, histogram, boxplot', ['x-cay-2', 'x-bang-pp', 'x-histogram', 'x-boxplot']),
  B('b-luonggiac', 'Toán', '11', 'Lượng giác', 'Đường tròn lượng giác và đồ thị sin, cos, tan', ['g-lg-tron', 'g-lg-sin', 'g-lg-cos', 'g-lg-tan']),
  B('b-tamgiac', 'Toán', '10', 'Tam giác: các đường đặc biệt', 'Trung tuyến, đường cao, phân giác, trung trực, hệ thức lượng', ['g-tgdb-trung-tuyen', 'g-tgdb-duong-cao', 'g-tgdb-phan-giac', 'g-tgdb-trung-truc', 'g-he-thuc-luong'], 3),
]
