/**
 * CONICCLASSROOM — TRỢ LÝ LỚP HỌC & BẢNG ĐIỂM TÍCH CỰC
 * Thiết kế tươi sáng: Emerald Green (#10b981) + Radiant Orange (#f97316)
 * Chuẩn Thông tư 22/2021/TT-BGDĐT: Đầy đủ các cột ĐGTX, Giữa kỳ, Cuối kỳ, Thêm cột động,
 * Sơ đồ bàn học tương tác, Cấp bậc Level & Hiệu ứng số bay +1, Mã QR tra cứu
 */

(function () {
  'use strict';

  // ==========================================
  // 1. DỮ LIỆU MẪU BAN ĐẦU (10, 11, 12 CÓ ĐỦ 7-8 CỘT ĐIỂM)
  // ==========================================
  const DEFAULT_DATA = {
    data_version: 3,
    currentClassId: 'class_12c2',
    currentSemester: 'hk1',
    soundEnabled: true,
    theme: 'light',
    customReasons: [],
    classes: [
      {
        id: "class_12c2",
        name: "Lớp 12C2",
        desc: "THPT Nguyễn Hữu Cảnh (47 Học Sinh)",
        customColumns: [],
        students: [
          { id: "12c2_1", name: "Võ Phạm Quốc An", team: 1, sbd: "120201", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "15/09/2009", gender: "Nam", history: [] },
          { id: "12c2_2", name: "Phan Huỳnh Anh", team: 2, sbd: "120202", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "07/12/2009", gender: "Nữ", history: [] },
          { id: "12c2_3", name: "Nguyễn Đức Bảo", team: 3, sbd: "120203", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/03/2009", gender: "Nam", history: [] },
          { id: "12c2_4", name: "Tần Gia Bảo", team: 4, sbd: "120204", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "16/11/2009", gender: "Nam", history: [] },
          { id: "12c2_5", name: "Trần Gia Bảo", team: 1, sbd: "120205", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "01/10/2009", gender: "Nam", history: [] },
          { id: "12c2_6", name: "Nguyễn Thị Mỹ Duyên", team: 2, sbd: "120206", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "29/08/2009", gender: "Nữ", history: [] },
          { id: "12c2_7", name: "Hoàng Phan Minh Đạt", team: 3, sbd: "120207", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "26/02/2009", gender: "Nam", history: [] },
          { id: "12c2_8", name: "Trần Minh Đạt", team: 4, sbd: "120208", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "08/08/2009", gender: "Nam", history: [] },
          { id: "12c2_9", name: "Trịnh Hoàng Đăng", team: 1, sbd: "120209", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "09/07/2009", gender: "Nam", history: [] },
          { id: "12c2_10", name: "Nguyễn Trần Đồng", team: 2, sbd: "120210", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "13/08/2009", gender: "Nam", history: [] },
          { id: "12c2_11", name: "Phạm Ngọc Trà Giang", team: 3, sbd: "120211", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "03/04/2009", gender: "Nữ", history: [] },
          { id: "12c2_12", name: "Đặng Thị Mỹ Hằng", team: 4, sbd: "120212", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "17/11/2009", gender: "Nữ", history: [] },
          { id: "12c2_13", name: "Nguyễn Thị Hiền", team: 1, sbd: "120213", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "03/11/2009", gender: "Nữ", history: [] },
          { id: "12c2_14", name: "Lê Thiện Khang Huy", team: 2, sbd: "120214", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "15/04/2009", gender: "Nam", history: [] },
          { id: "12c2_15", name: "Nguyễn Văn Ngọc Huy", team: 3, sbd: "120215", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "12/02/2009", gender: "Nam", history: [] },
          { id: "12c2_16", name: "Lê Thị Phương Huyền", team: 4, sbd: "120216", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "06/10/2009", gender: "Nữ", history: [] },
          { id: "12c2_17", name: "Phan Phú Hưng", team: 1, sbd: "120217", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "10/04/2009", gender: "Nam", history: [] },
          { id: "12c2_18", name: "Nguyễn Trung Kiên", team: 2, sbd: "120218", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/08/2009", gender: "Nam", history: [] },
          { id: "12c2_19", name: "Nguyễn Tuấn Kiệt", team: 3, sbd: "120219", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "08/02/2009", gender: "Nam", history: [] },
          { id: "12c2_20", name: "Trần Gia Kiệt", team: 4, sbd: "120220", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "05/11/2009", gender: "Nam", history: [] },
          { id: "12c2_21", name: "Hồng Quang Kiệt", team: 1, sbd: "120221", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "03/01/2009", gender: "Nam", history: [] },
          { id: "12c2_22", name: "Đặng Trần Gia Khánh", team: 2, sbd: "120222", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "01/10/2009", gender: "Nam", history: [] },
          { id: "12c2_23", name: "Trần Nguyễn Đăng Khoa", team: 3, sbd: "120223", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "26/06/2009", gender: "Nam", history: [] },
          { id: "12c2_24", name: "Hạng Đăng Khôi", team: 4, sbd: "120224", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "02/03/2009", gender: "Nam", history: [] },
          { id: "12c2_25", name: "Đào Quang Tùng Lâm", team: 1, sbd: "120225", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "19/10/2009", gender: "Nam", history: [] },
          { id: "12c2_26", name: "Đỗ Xuân Mai", team: 2, sbd: "120226", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "04/01/2009", gender: "Nữ", history: [] },
          { id: "12c2_27", name: "Trần Hoài Nam", team: 3, sbd: "120227", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "22/01/2009", gender: "Nam", history: [] },
          { id: "12c2_28", name: "Nguyễn Thị Thanh Ngân", team: 4, sbd: "120228", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "03/02/2009", gender: "Nữ", history: [] },
          { id: "12c2_29", name: "Huỳnh Bảo Ngọc", team: 1, sbd: "120229", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "14/08/2009", gender: "Nữ", history: [] },
          { id: "12c2_30", name: "Thi Tường Thảo Ngọc", team: 2, sbd: "120230", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "06/06/2009", gender: "Nữ", history: [] },
          { id: "12c2_31", name: "Võ Trần Bảo Ngọc", team: 3, sbd: "120231", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "23/10/2009", gender: "Nữ", history: [] },
          { id: "12c2_32", name: "Nguyễn Tường Thái Nguyên", team: 4, sbd: "120232", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "27/07/2009", gender: "Nam", history: [] },
          { id: "12c2_33", name: "Hoàng Nguyễn Bảo Như", team: 1, sbd: "120233", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "15/01/2009", gender: "Nữ", history: [] },
          { id: "12c2_34", name: "Lê Thị Kiều Oanh", team: 2, sbd: "120234", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "11/03/2009", gender: "Nữ", history: [] },
          { id: "12c2_35", name: "Trần Nguyễn Thiên Phú", team: 3, sbd: "120235", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "15/01/2009", gender: "Nam", history: [] },
          { id: "12c2_36", name: "Lý Hoàng Phúc", team: 4, sbd: "120236", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/02/2009", gender: "Nam", history: [] },
          { id: "12c2_37", name: "Vũ Bùi Hồng Phúc", team: 1, sbd: "120237", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "02/08/2009", gender: "Nam", history: [] },
          { id: "12c2_38", name: "Nguyễn Công Thành Tài", team: 2, sbd: "120238", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "23/04/2009", gender: "Nam", history: [] },
          { id: "12c2_39", name: "Võ Thành Tiến", team: 3, sbd: "120239", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "29/03/2009", gender: "Nam", history: [] },
          { id: "12c2_40", name: "Trần Đại Tín", team: 4, sbd: "120240", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "15/02/2009", gender: "Nam", history: [] },
          { id: "12c2_41", name: "Hồ Nguyễn Ngọc Tuyền", team: 1, sbd: "120241", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/08/2009", gender: "Nữ", history: [] },
          { id: "12c2_42", name: "Trần Ngọc Thanh Tuyền", team: 2, sbd: "120242", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "01/11/2009", gender: "Nữ", history: [] },
          { id: "12c2_43", name: "Lê Quang Thịnh", team: 3, sbd: "120243", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "20/12/2009", gender: "Nam", history: [] },
          { id: "12c2_44", name: "Huỳnh Thái Thuận", team: 4, sbd: "120244", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "18/05/2009", gender: "Nam", history: [] },
          { id: "12c2_45", name: "Lê Anh Thư", team: 1, sbd: "120245", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "20/05/2009", gender: "Nữ", history: [] },
          { id: "12c2_46", name: "Phan Tú Uyên", team: 2, sbd: "120246", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "19/07/2009", gender: "Nữ", history: [] },
          { id: "12c2_47", name: "Nguyễn Phương Vy", team: 3, sbd: "120247", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "13/10/2009", gender: "Nữ", history: [] }
        ]
      },
      {
        id: "class_12c13",
        name: "Lớp 12C13",
        desc: "THPT Nguyễn Hữu Cảnh (40 Học Sinh)",
        customColumns: [],
        students: [
          { id: "12c13_1", name: "Phạm Thị Thu An", team: 1, sbd: "121301", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "08/11/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_2", name: "Nguyễn Tuấn Anh", team: 2, sbd: "121302", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "06/11/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_3", name: "Lương Phạm Minh Anh", team: 3, sbd: "121303", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "10/10/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_4", name: "Phạm Quỳnh Anh", team: 4, sbd: "121304", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "15/10/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_5", name: "Trần Nguyễn Hoàng Anh", team: 1, sbd: "121305", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "24/08/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_6", name: "Phan Lê Khánh Băng", team: 2, sbd: "121306", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "20/03/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_7", name: "Lâm Ngọc Châu", team: 3, sbd: "121307", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "18/02/2009", gender: "Nữ", ethnic: "Hoa", history: [] },
          { id: "12c13_8", name: "Võ Tấn Đạt", team: 4, sbd: "121308", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/01/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_9", name: "Đinh Xuân Định", team: 1, sbd: "121309", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "07/09/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_10", name: "Nguyễn Trường Giang", team: 2, sbd: "121310", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "20/07/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_11", name: "Lê Phúc Nguyên Hân", team: 3, sbd: "121311", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "30/05/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_12", name: "Nguyễn Phạm Gia Hân", team: 4, sbd: "121312", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "12/11/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_13", name: "Lê Thị Thanh Hoa", team: 1, sbd: "121313", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "14/12/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_14", name: "Lê Khả Hùng", team: 2, sbd: "121314", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "13/10/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_15", name: "Lê Nguyễn Hoàng Lê", team: 3, sbd: "121315", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/10/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_16", name: "Nguyễn Hoàng Mai Linh", team: 4, sbd: "121316", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "06/07/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_17", name: "Lìu Khánh Luân", team: 1, sbd: "121317", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "17/03/2009", gender: "Nam", ethnic: "Hoa", history: [] },
          { id: "12c13_18", name: "Vũ Hải Minh", team: 2, sbd: "121318", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "22/08/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_19", name: "Nguyễn Trần Khánh Ngân", team: 3, sbd: "121319", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "26/08/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_20", name: "Du Gia Nghi", team: 4, sbd: "121320", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "04/12/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_21", name: "Nguyễn Gia Nguyên", team: 1, sbd: "121321", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "29/01/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_22", name: "Trần Ngọc Thảo Nguyên", team: 2, sbd: "121322", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "23/07/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_23", name: "Huỳnh Minh Nhật", team: 3, sbd: "121323", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "05/06/2008", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_24", name: "Lê Phương Nhi", team: 4, sbd: "121324", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "20/05/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_25", name: "Lê Uyên Nhi", team: 1, sbd: "121325", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "07/02/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_26", name: "Đỗ Yến Như", team: 2, sbd: "121326", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/06/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_27", name: "Dương Nguyễn Hồng Phúc", team: 3, sbd: "121327", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "17/12/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_28", name: "Nguyễn Võ Trúc Phương", team: 4, sbd: "121328", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "28/08/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_29", name: "Kim Ngọc Như Quỳnh", team: 1, sbd: "121329", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "03/08/2009", gender: "Nữ", ethnic: "Khơ-me", history: [] },
          { id: "12c13_30", name: "Mang Triết Quỳnh", team: 2, sbd: "121330", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "24/09/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_31", name: "Trần Thế Tài", team: 3, sbd: "121331", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "10/12/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_32", name: "Nguyễn Minh Thư", team: 4, sbd: "121332", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "07/12/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_33", name: "Nguyễn Phan Bảo Thư", team: 1, sbd: "121333", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "05/05/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_34", name: "Nguyễn Phan Bảo Thy", team: 2, sbd: "121334", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "05/05/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_35", name: "Nguyễn Thị Thùy Tiên", team: 3, sbd: "121335", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "17/01/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_36", name: "Ngô Xuân Trung", team: 4, sbd: "121336", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "14/09/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_37", name: "Trần Nguyễn Cẩm Tú", team: 1, sbd: "121337", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "06/10/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_38", name: "Phạm Nhật Hà Uyên", team: 2, sbd: "121338", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "15/09/2009", gender: "Nữ", ethnic: "Kinh", history: [] },
          { id: "12c13_39", name: "Nguyễn Trương Hải Vỹ", team: 3, sbd: "121339", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "02/10/2009", gender: "Nam", ethnic: "Kinh", history: [] },
          { id: "12c13_40", name: "Lê Thị Thanh Xuân", team: 4, sbd: "121340", points: 0, dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null, attitude: null, giuaKy: null, cuoiKy: null, dob: "02/03/2009", gender: "Nữ", ethnic: "Kinh", history: [] }
        ]
      },
      {
        id: "class_10a8",
        name: "Lớp 10A8",
        desc: "THPT Nguyễn Hữu Cảnh (43 Học Sinh)",
        customColumns: [],
        students: [
                {
                        id: "10a8_1", name: "Bùi Nguyên Phúc Anh", team: 1, sbd: "100801",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_2", name: "Nguyễn Khoa Tuấn Anh", team: 2, sbd: "100802",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_3", name: "Võ Hoàng Phương Anh", team: 3, sbd: "100803",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_4", name: "Nguyễn Thị Hồng Ánh", team: 4, sbd: "100804",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_5", name: "Lê Quốc Bảo", team: 1, sbd: "100805",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_6", name: "Nguyễn Thị Bình", team: 2, sbd: "100806",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_7", name: "Trương Thị Quế Chi", team: 3, sbd: "100807",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_8", name: "Dương Bách Đăng", team: 4, sbd: "100808",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_9", name: "Nguyễn Văn Đức", team: 1, sbd: "100809",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_10", name: "Ngô Huy Dương", team: 2, sbd: "100810",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_11", name: "Hồ Võ Thế Duy", team: 3, sbd: "100811",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_12", name: "Võ Nguyễn Thị Duyên", team: 4, sbd: "100812",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_13", name: "Hồ Ngọc Hân", team: 1, sbd: "100813",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_14", name: "Võ Nhật Hảo", team: 2, sbd: "100814",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_15", name: "Nguyễn Hữu Hiền", team: 3, sbd: "100815",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_16", name: "Phan Nguyễn Trung Hiếu", team: 4, sbd: "100816",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_17", name: "Nguyễn Thành Hưng", team: 1, sbd: "100817",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_18", name: "Nguyễn Khang", team: 2, sbd: "100818",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_19", name: "Phạm Huỳnh Minh Khang", team: 3, sbd: "100819",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_20", name: "Trương Trọng Khang", team: 4, sbd: "100820",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_21", name: "Hoàng Gia Khánh", team: 1, sbd: "100821",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_22", name: "Nguyễn Văn Khoa", team: 2, sbd: "100822",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_23", name: "Bùi Lê Anh Kiệt", team: 3, sbd: "100823",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_24", name: "Lý Hoàng Kim", team: 4, sbd: "100824",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_25", name: "Lý Nguyên Lâm", team: 1, sbd: "100825",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_26", name: "Đinh Ngọc Lan", team: 2, sbd: "100826",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_27", name: "Huỳnh Ngọc Long", team: 3, sbd: "100827",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_28", name: "Trần Đức Tuệ Minh", team: 4, sbd: "100828",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_29", name: "Huỳnh Trần Thục Nhi", team: 1, sbd: "100829",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_30", name: "Trần Phạm Phương Nhi", team: 2, sbd: "100830",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_31", name: "Khổng Hữu Phát", team: 3, sbd: "100831",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_32", name: "Lê Văn Gia Phúc", team: 4, sbd: "100832",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_33", name: "Voòng Thiên Phúc", team: 1, sbd: "100833",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_34", name: "Nguyễn Trung Quân", team: 2, sbd: "100834",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_35", name: "Nguyễn Minh Thái", team: 3, sbd: "100835",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_36", name: "Lý Ái Thiên", team: 4, sbd: "100836",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_37", name: "Nguyễn Giang Minh Trang", team: 1, sbd: "100837",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_38", name: "Nguyễn Dương Minh Trí", team: 2, sbd: "100838",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nam",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_39", name: "Trương Thụy Phương Trúc", team: 3, sbd: "100839",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_40", name: "Bành Gia Tuệ", team: 4, sbd: "100840",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_41", name: "Lương Ái Vân", team: 1, sbd: "100841",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_42", name: "Huỳnh Khánh Vy", team: 2, sbd: "100842",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                },
                {
                        id: "10a8_43", name: "Võ Ngọc Tường Vy", team: 3, sbd: "100843",
                        points: 0,
                        dgtx1: null,
                        dgtx2: null,
                        dgtx3: null,
                        dgtx4: null,
                        dgtx5: null,
                        attitude: null,
                        giuaKy: null,
                        cuoiKy: null,
                        dob: "",
                        gender: "Nữ",
                        ethnic: "Kinh",
                        history: []
                }
        ]
      },
      {
      "id": "class_10a1",
      "name": "Lớp 10A1",
      "academicYear": "2026-2027",
      "monitorEmail": "",
      "desksLayout": {
            "rows": 5,
            "cols": 5
      },
      "seatingArrangement": {
            "0_0": [
                  "10a1_1",
                  "10a1_2"
            ],
            "0_1": [
                  "10a1_3",
                  "10a1_4"
            ],
            "0_2": [
                  "10a1_5",
                  "10a1_6"
            ],
            "0_3": [
                  "10a1_7",
                  "10a1_8"
            ],
            "0_4": [
                  "10a1_9",
                  "10a1_10"
            ],
            "1_0": [
                  "10a1_11",
                  "10a1_12"
            ],
            "1_1": [
                  "10a1_13",
                  "10a1_14"
            ],
            "1_2": [
                  "10a1_15",
                  "10a1_16"
            ],
            "1_3": [
                  "10a1_17",
                  "10a1_18"
            ],
            "1_4": [
                  "10a1_19",
                  "10a1_20"
            ],
            "2_0": [
                  "10a1_21",
                  "10a1_22"
            ],
            "2_1": [
                  "10a1_23",
                  "10a1_24"
            ],
            "2_2": [
                  "10a1_25",
                  "10a1_26"
            ],
            "2_3": [
                  "10a1_27",
                  "10a1_28"
            ],
            "2_4": [
                  "10a1_29",
                  "10a1_30"
            ],
            "3_0": [
                  "10a1_31",
                  "10a1_32"
            ],
            "3_1": [
                  "10a1_33",
                  "10a1_34"
            ],
            "3_2": [
                  "10a1_35",
                  "10a1_36"
            ],
            "3_3": [
                  "10a1_37",
                  "10a1_38"
            ],
            "3_4": [
                  "10a1_39",
                  "10a1_40"
            ],
            "4_0": [
                  "10a1_41",
                  "10a1_42"
            ],
            "4_1": [
                  "10a1_43",
                  "10a1_44"
            ],
            "4_2": [
                  "10a1_45",
                  "10a1_46"
            ],
            "4_3": [
                  "10a1_47",
                  null
            ],
            "4_4": [
                  null,
                  null
            ]
      },
      "customColumns": [],
      "students": [
            {
                  "id": "10a1_1",
                  "name": "Nguyễn Xuân Hoài An",
                  "team": 1,
                  "sbd": "100101",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "28/11/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_2",
                  "name": "Hoàng Lại Ân",
                  "team": 2,
                  "sbd": "100102",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "26/12/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_3",
                  "name": "Cao Nguyễn Tuấn Anh",
                  "team": 3,
                  "sbd": "100103",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "08/03/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_4",
                  "name": "Lê Mỹ Anh",
                  "team": 4,
                  "sbd": "100104",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "22/03/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_5",
                  "name": "Nguyễn Ngọc Nguyệt Cát",
                  "team": 1,
                  "sbd": "100105",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "18/09/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_6",
                  "name": "Lương Bằng Bảo Châu",
                  "team": 2,
                  "sbd": "100106",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "29/10/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_7",
                  "name": "Châu Vũ Đạt",
                  "team": 3,
                  "sbd": "100107",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "28/01/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_8",
                  "name": "Dương Bá Đạt",
                  "team": 4,
                  "sbd": "100108",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "28/10/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_9",
                  "name": "Trương Nguyễn Hoàng Đạt",
                  "team": 1,
                  "sbd": "100109",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "27/06/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_10",
                  "name": "Nguyễn Thị Trà Giang",
                  "team": 2,
                  "sbd": "100110",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "29/11/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_11",
                  "name": "Nguyễn Phương Nhật Hạ",
                  "team": 3,
                  "sbd": "100111",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "06/05/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_12",
                  "name": "Lê Nguyễn Bảo Hân",
                  "team": 4,
                  "sbd": "100112",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "31/05/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_13",
                  "name": "Bùi Nguyễn Huy Hoàng",
                  "team": 1,
                  "sbd": "100113",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "18/09/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_14",
                  "name": "Đàm Vĩnh Hùng",
                  "team": 2,
                  "sbd": "100114",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "15/01/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_15",
                  "name": "Nguyễn Minh Hương",
                  "team": 3,
                  "sbd": "100115",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "29/03/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_16",
                  "name": "Đặng Hoàng Huy",
                  "team": 4,
                  "sbd": "100116",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "12/08/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_17",
                  "name": "Trịnh Quốc Huy",
                  "team": 1,
                  "sbd": "100117",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "11/04/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_18",
                  "name": "Đinh Hữu Tuấn Khang",
                  "team": 2,
                  "sbd": "100118",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "01/07/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_19",
                  "name": "Trần Đăng Khoa",
                  "team": 3,
                  "sbd": "100119",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "12/05/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_20",
                  "name": "Đào Mai Khôi",
                  "team": 4,
                  "sbd": "100120",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "15/07/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_21",
                  "name": "Từ Khải Kiệt",
                  "team": 1,
                  "sbd": "100121",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "06/10/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_22",
                  "name": "Trần Quốc Kỳ",
                  "team": 2,
                  "sbd": "100122",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "21/11/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_23",
                  "name": "Trần Đình Long",
                  "team": 3,
                  "sbd": "100123",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "28/11/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_24",
                  "name": "Huỳnh Nhật Minh",
                  "team": 4,
                  "sbd": "100124",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "01/09/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_25",
                  "name": "Nguyễn Trà My",
                  "team": 1,
                  "sbd": "100125",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "24/09/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_26",
                  "name": "Võ Nhật Nam",
                  "team": 2,
                  "sbd": "100126",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "25/11/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_27",
                  "name": "Lê Bảo Ngân",
                  "team": 3,
                  "sbd": "100127",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "12/08/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_28",
                  "name": "Mai Nguyễn Khánh Ngọc",
                  "team": 4,
                  "sbd": "100128",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "17/07/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_29",
                  "name": "Ngô Thanh Ngọc",
                  "team": 1,
                  "sbd": "100129",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "03/04/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_30",
                  "name": "Nguyễn Công Phúc Nguyên",
                  "team": 2,
                  "sbd": "100130",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "03/01/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_31",
                  "name": "Lư Hoàng An Nhiên",
                  "team": 3,
                  "sbd": "100131",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "10/06/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_32",
                  "name": "Nguyễn Thành Phong",
                  "team": 4,
                  "sbd": "100132",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "01/01/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_33",
                  "name": "Nguyễn Đình Phú",
                  "team": 1,
                  "sbd": "100133",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "15/06/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_34",
                  "name": "Nguyễn Xuân Phúc",
                  "team": 2,
                  "sbd": "100134",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "13/01/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_35",
                  "name": "Đào Thị Phương",
                  "team": 3,
                  "sbd": "100135",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "03/11/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_36",
                  "name": "Huỳnh Ngọc Quyên",
                  "team": 4,
                  "sbd": "100136",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "28/03/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_37",
                  "name": "Lại Đình Thịnh",
                  "team": 1,
                  "sbd": "100137",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "18/08/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_38",
                  "name": "Trần Khang Thịnh",
                  "team": 2,
                  "sbd": "100138",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "22/08/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_39",
                  "name": "Trần Thị Anh Thơ",
                  "team": 3,
                  "sbd": "100139",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "15/09/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_40",
                  "name": "Nguyễn Đặng Minh Thư",
                  "team": 4,
                  "sbd": "100140",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "06/04/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_41",
                  "name": "Phạm Ngọc Thanh Thùy",
                  "team": 1,
                  "sbd": "100141",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "04/09/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_42",
                  "name": "Nguyễn Thanh Tịnh",
                  "team": 2,
                  "sbd": "100142",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "11/06/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_43",
                  "name": "Đồng Thị Thu Trâm",
                  "team": 3,
                  "sbd": "100143",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "21/05/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_44",
                  "name": "Huỳnh Quang Vinh",
                  "team": 4,
                  "sbd": "100144",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "10/10/2010",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_45",
                  "name": "Tô Trương Quốc Vinh",
                  "team": 1,
                  "sbd": "100145",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "02/11/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_46",
                  "name": "Phạm Đào Anh Vũ",
                  "team": 2,
                  "sbd": "100146",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "11/01/2011",
                  "gender": "Nam",
                  "ethnic": "Kinh",
                  "history": []
            },
            {
                  "id": "10a1_47",
                  "name": "Trần Nguyễn Tường Vy",
                  "team": 3,
                  "sbd": "100147",
                  "points": 0,
                  "dgtx1": null,
                  "dgtx2": null,
                  "dgtx3": null,
                  "dgtx4": null,
                  "dgtx5": null,
                  "attitude": null,
                  "giuaKy": null,
                  "cuoiKy": null,
                  "dob": "28/05/2011",
                  "gender": "Nữ",
                  "ethnic": "Kinh",
                  "history": []
            }
      ]
}
    ]
  };

  // State ứng dụng
  let appState = loadState();
  let selectedStudentIds = new Set();
  let calledStudents = new Set();
  let isBatchMode = false;
  let activeStudentForModal = null;
  let activeStudentForRedeem = null;
  let isTeacherUnlocked = localStorage.getItem('conic_teacher_unlocked') !== 'false';

  const FUN_CHALLENGES = [
    "Hát một đoạn bài hát yêu thích tặng cả lớp 🎤",
    "Nhảy lò cò 3 bước quanh bục giảng rồi giải lại ví dụ 1 🏃",
    "Chép lại công thức vừa học 3 lần lên góc bảng ✍️",
    "Chọn 1 bạn thân cùng tổ lên bảng giải cứu viện 🤝",
    "Kể một câu chuyện cười ngắn trong 30 giây cho cả lớp vui 😃",
    "Đọc thuộc lòng bảng nhân 7 hoặc một hằng đẳng thức đáng nhớ ⚡",
    "Làm động tác người máy (robot) khen ngợi bạn tổ trưởng 🤖",
    "Được miễn thử thách nếu trả lời đúng 1 câu hỏi trắc nghiệm ngắn của Thầy! 🍀"
  ];

  function checkUrlHashData() {
    if (window.location.hash && window.location.hash.startsWith('#data=')) {
      try {
        const rawBase64 = window.location.hash.replace('#data=', '');
        const jsonStr = decodeURIComponent(escape(atob(rawBase64)));
        const importedClass = JSON.parse(jsonStr);
        if (importedClass && importedClass.name && Array.isArray(importedClass.students)) {
          const existingIdx = appState.classes.findIndex(c => c.id === importedClass.id);
          if (existingIdx >= 0) {
            appState.classes[existingIdx] = importedClass;
          } else {
            appState.classes.unshift(importedClass);
          }
          appState.currentClassId = importedClass.id;
          isTeacherUnlocked = false;
          localStorage.removeItem('conic_teacher_unlocked');
        }
      } catch (e) {
        console.warn('Lỗi đọc dữ liệu từ URL hash:', e);
      }
    }
  }

  function applyAuthMode(unlocked) {
    isTeacherUnlocked = unlocked;
    const teacherBtn = document.getElementById('btn-mode-teacher');
    const studentBtn = document.getElementById('btn-mode-student');
    const banner = document.getElementById('student-notice-banner');
    const teacherText = document.getElementById('mode-teacher-text');

    if (unlocked) {
      document.body.classList.remove('student-mode');
      if (teacherBtn) teacherBtn.classList.add('active');
      if (studentBtn) studentBtn.classList.remove('active');
      if (banner) banner.style.display = 'none';
      if (teacherText) teacherText.textContent = 'GV (Mở)';
    } else {
      document.body.classList.add('student-mode');
      if (studentBtn) studentBtn.classList.add('active');
      if (teacherBtn) teacherBtn.classList.remove('active');
      if (banner) banner.style.display = 'flex';
      if (teacherText) teacherText.textContent = 'GV (Khóa)';
    }
  }

  // Wheel state
  let wheelCanvas, wheelCtx;
  let wheelAngle = 0;
  let isSpinning = false;
  let wheelStudents = [];

  // Timer state
  let timerDuration = 180;
  let timerRemaining = 180;
  let timerInterval = null;
  let isTimerRunning = false;

  // ==========================================
  // 2. AUDIO ENGINE (WEB AUDIO SYNTHESIZER)
  // ==========================================
  const AudioEngine = {
    ctx: null,
    init() {
      if (!this.ctx) {
        const AudioContext = window.AudioContext || window.webkitAudioContext;
        if (AudioContext) {
          this.ctx = new AudioContext();
        }
      }
      if (this.ctx && this.ctx.state === 'suspended') {
        this.ctx.resume();
      }
    },
    playPositive() {
      if (!appState.soundEnabled) return;
      this.init();
      if (!this.ctx) return;
      const now = this.ctx.currentTime;
      const osc = this.ctx.createOscillator();
      const gain = this.ctx.createGain();
      osc.type = 'sine';
      osc.frequency.setValueAtTime(523.25, now);
      osc.frequency.exponentialRampToValueAtTime(783.99, now + 0.12);
      osc.connect(gain);
      gain.connect(this.ctx.destination);
      gain.gain.setValueAtTime(0.18, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.28);
      osc.start(now);
      osc.stop(now + 0.28);
    },
    playNegative() {
      if (!appState.soundEnabled) return;
      this.init();
      if (!this.ctx) return;
      const now = this.ctx.currentTime;
      const osc = this.ctx.createOscillator();
      const gain = this.ctx.createGain();
      osc.type = 'sawtooth';
      osc.frequency.setValueAtTime(260, now);
      osc.frequency.exponentialRampToValueAtTime(150, now + 0.2);
      osc.connect(gain);
      gain.connect(this.ctx.destination);
      gain.gain.setValueAtTime(0.12, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.25);
      osc.start(now);
      osc.stop(now + 0.25);
    },
    playWheelTick() {
      if (!appState.soundEnabled) return;
      this.init();
      if (!this.ctx) return;
      const now = this.ctx.currentTime;
      const osc = this.ctx.createOscillator();
      const gain = this.ctx.createGain();
      osc.type = 'sine';
      osc.frequency.setValueAtTime(600, now);
      osc.connect(gain);
      gain.connect(this.ctx.destination);
      gain.gain.setValueAtTime(0.08, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.04);
      osc.start(now);
      osc.stop(now + 0.04);
    },
    playFanfare() {
      if (!appState.soundEnabled) return;
      this.init();
      if (!this.ctx) return;
      const now = this.ctx.currentTime;
      const notes = [523.25, 659.25, 783.99, 1046.50];
      notes.forEach((freq, idx) => {
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        osc.type = 'triangle';
        osc.frequency.setValueAtTime(freq, now + idx * 0.09);
        osc.connect(gain);
        gain.connect(this.ctx.destination);
        gain.gain.setValueAtTime(0.25, now + idx * 0.09);
        gain.gain.exponentialRampToValueAtTime(0.001, now + idx * 0.09 + 0.35);
        osc.start(now + idx * 0.09);
        osc.stop(now + idx * 0.09 + 0.35);
      });
    },
    playTimerAlarm() {
      if (!appState.soundEnabled) return;
      this.init();
      if (!this.ctx) return;
      for (let i = 0; i < 3; i++) {
        const now = this.ctx.currentTime + i * 0.25;
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        osc.type = 'square';
        osc.frequency.setValueAtTime(880, now);
        osc.connect(gain);
        gain.connect(this.ctx.destination);
        gain.gain.setValueAtTime(0.2, now);
        gain.gain.exponentialRampToValueAtTime(0.001, now + 0.2);
        osc.start(now);
        osc.stop(now + 0.2);
      }
    }
  };

  // ==========================================
  // 3. CANVAS CONFETTI
  // ==========================================
  const Confetti = {
    canvas: null,
    ctx: null,
    particles: [],
    animId: null,
    init() {
      this.canvas = document.getElementById('confetti-canvas');
      if (!this.canvas) return;
      this.ctx = this.canvas.getContext('2d');
      this.resize();
      window.addEventListener('resize', () => this.resize());
    },
    resize() {
      if (!this.canvas) return;
      this.canvas.width = window.innerWidth;
      this.canvas.height = window.innerHeight;
    },
    burst(x = window.innerWidth / 2, y = window.innerHeight / 2, count = 80) {
      if (!this.canvas) return;
      const colors = ['#10b981', '#f97316', '#3b82f6', '#ec4899', '#8b5cf6', '#f59e0b'];
      for (let i = 0; i < count; i++) {
        const angle = Math.random() * Math.PI * 2;
        const speed = Math.random() * 12 + 4;
        this.particles.push({
          x: x,
          y: y,
          vx: Math.cos(angle) * speed,
          vy: Math.sin(angle) * speed - 3,
          size: Math.random() * 8 + 4,
          color: colors[Math.floor(Math.random() * colors.length)],
          rotation: Math.random() * 360,
          rotationSpeed: (Math.random() - 0.5) * 15,
          life: 1,
          decay: Math.random() * 0.02 + 0.015
        });
      }
      if (!this.animId) {
        this.loop();
      }
    },
    loop() {
      if (!this.ctx || !this.canvas) {
        this.animId = null;
        return;
      }
      if (this.particles.length === 0) {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        this.animId = null;
        return;
      }
      this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
      for (let i = this.particles.length - 1; i >= 0; i--) {
        const p = this.particles[i];
        p.x += p.vx;
        p.y += p.vy;
        p.vy += 0.35;
        p.vx *= 0.98;
        p.rotation += p.rotationSpeed;
        p.life -= p.decay;

        if (p.life <= 0) {
          this.particles.splice(i, 1);
          continue;
        }

        this.ctx.save();
        this.ctx.translate(p.x, p.y);
        this.ctx.rotate((p.rotation * Math.PI) / 180);
        this.ctx.fillStyle = p.color;
        this.ctx.globalAlpha = p.life;
        this.ctx.fillRect(-p.size / 2, -p.size / 2, p.size, p.size * 0.6);
        this.ctx.restore();
      }
      this.animId = requestAnimationFrame(() => this.loop());
    }
  };

  // ==========================================
  // 4. QUẢN LÝ STATE & LOCALSTORAGE
  // ==========================================
  function loadState() {
    try {
      const saved = localStorage.getItem('conic_classroom_v2');
      if (saved) {
        const parsed = JSON.parse(saved);
        if (parsed && Array.isArray(parsed.classes) && parsed.classes.length > 0) {
          // Lọc bỏ lớp rác cũ (11B2, 12C3) nhưng giữ nguyên các lớp thật: 12C2, 12C13, 10A8, 10A1
          parsed.classes = parsed.classes.filter(c => c.id === 'class_12c2' || c.id === 'class_12c13' || c.id === 'class_10a8' || c.id === 'class_10a1' || (!['class_11b2', 'class_12c3'].includes(c.id)));

          // Migration v4: Reset toàn bộ điểm +- XP và điểm ĐGTX/Giữa/Cuối kỳ cho các lớp mới
          if (!parsed.data_version || parsed.data_version < 4) {
            parsed.classes.forEach(cls => {
              if (['class_12c2', 'class_12c13', 'class_10a8', 'class_10a1'].includes(cls.id)) {
                cls.students.forEach(s => {
                  s.points = 0;
                  s.dgtx1 = null; s.dgtx2 = null; s.dgtx3 = null; s.dgtx4 = null; s.dgtx5 = null;
                  s.attitude = null; s.giuaKy = null; s.cuoiKy = null;
                  s.history = [];
                });
              }
            });
            parsed.data_version = 4;
            try { localStorage.setItem('conic_classroom_v2', JSON.stringify(parsed)); } catch (e) {}
          }

          // Tự động dọn dẹp lịch sử cũ hơn 1 năm (365 ngày) để bảo toàn dung lượng < 5MB (100% Free)
          const ONE_YEAR_MS = 365 * 24 * 3600 * 1000;
          const nowTime = Date.now();
          parsed.classes.forEach(c => {
            c.students.forEach(s => {
              if (s.points_hk1 === undefined) s.points_hk1 = s.points || 0;
              if (s.points_hk2 === undefined) s.points_hk2 = 0;
              if (Array.isArray(s.history)) {
                s.history = s.history.filter(h => !h.timestamp || (nowTime - h.timestamp) < ONE_YEAR_MS);
              }
            });
          });
          if (!parsed.currentSemester) parsed.currentSemester = 'hk1';

          // Chuẩn hóa SBD 6 ký tự: Khối (2 số) + Lớp (2 số) + STT (2 số) theo quy định của trường
          parsed.classes.forEach(c => {
            c.students.forEach((s, sIdx) => {
              const stt = s.stt || (sIdx + 1);
              s.stt = stt;
              s.sbd = generate6DigitSbd(c.name, stt);
            });
          });

          DEFAULT_DATA.classes.forEach(defaultCls => {
            const existing = parsed.classes.find(c => c.id === defaultCls.id);
            if (!existing) {
              parsed.classes.push(JSON.parse(JSON.stringify(defaultCls)));
            } else if (existing.students.length === 0 && defaultCls.students.length > 0) {
              existing.students = JSON.parse(JSON.stringify(defaultCls.students));
            }
          });
          if (!parsed.currentClassId || ['class_11b2', 'class_12c3'].includes(parsed.currentClassId)) {
            parsed.currentClassId = "class_12c2";
          }
          return parsed;
        }
      }
    } catch (e) {
      console.warn('Lỗi đọc localStorage:', e);
    }
    return JSON.parse(JSON.stringify(DEFAULT_DATA));
  }

  function saveState() {
    try {
      localStorage.setItem('conic_classroom_v2', JSON.stringify(appState));
    } catch (e) {
      console.error('Lỗi lưu state:', e);
    }
    renderClassStats();
  }

  
  
  function generate6DigitSbd(className, stt) {
    let clean = (className || '').replace(/lớp/i, '').trim();
    let grade = '12';
    let classNum = '02';

    const m = clean.match(/^(\d{2})([a-zA-Z]+)(\d+)/);
    if (m) {
      grade = m[1];
      classNum = String(parseInt(m[3], 10)).padStart(2, '0');
    } else {
      const allNums = clean.match(/\d+/g);
      if (allNums && allNums.length >= 2) {
        grade = allNums[0].slice(-2);
        classNum = String(parseInt(allNums[1], 10)).padStart(2, '0');
      }
    }

    const sttStr = String(stt).padStart(2, '0');
    return `${grade}${classNum}${sttStr}`;
  }

  function getStudentPoints(student, semester = appState.currentSemester) {
    if (!student) return 0;
    if (student.points_hk1 === undefined) student.points_hk1 = student.points || 0;
    if (student.points_hk2 === undefined) student.points_hk2 = 0;
    if (semester === 'hk2') return student.points_hk2 || 0;
    if (semester === 'year') return (student.points_hk1 || 0) + (student.points_hk2 || 0);
    return student.points_hk1 || 0;
  }

  function getCurrentClass() {
    let cls = appState.classes.find(c => c.id === appState.currentClassId);
    if (!cls) {
      cls = appState.classes[0];
      appState.currentClassId = cls.id;
    }
    if (!cls.customColumns) cls.customColumns = [];
    cls.students.forEach(s => {
      if (!s.customGrades) s.customGrades = {};
    });
    return cls;
  }

  // ==========================================
  // 5. CẤP BẬC LEVEL & HIỆU ỨNG SỐ BAY
  // ==========================================
  function calculateLevel(xp) {
    const safeXp = Math.max(0, xp || 0);
    if (safeXp < 10) {
      return { level: 1, title: 'Tập sự', progressPct: Math.round((safeXp / 10) * 100), nextXp: 10 };
    } else if (safeXp < 25) {
      return { level: 2, title: 'Chiến binh', progressPct: Math.round(((safeXp - 10) / 15) * 100), nextXp: 25 };
    } else if (safeXp < 45) {
      return { level: 3, title: 'Dũng sĩ', progressPct: Math.round(((safeXp - 25) / 20) * 100), nextXp: 45 };
    } else if (safeXp < 70) {
      return { level: 4, title: 'Cao thủ', progressPct: Math.round(((safeXp - 45) / 25) * 100), nextXp: 70 };
    } else if (safeXp < 100) {
      return { level: 5, title: 'Bậc thầy', progressPct: Math.round(((safeXp - 70) / 30) * 100), nextXp: 100 };
    } else {
      return { level: 6, title: 'Huyền thoại', progressPct: 100, nextXp: safeXp };
    }
  }

  function spawnFloatingPoint(targetEl, deltaPoints) {
    if (!targetEl) return;
    const rect = targetEl.getBoundingClientRect();
    const pill = document.createElement('div');
    pill.className = `floating-point-pill ${deltaPoints < 0 ? 'negative' : ''}`;
    pill.textContent = `${deltaPoints > 0 ? '+' : ''}${deltaPoints} ${deltaPoints > 0 ? '⭐' : '⚠️'}`;
    
    const x = rect.left + rect.width / 2;
    const y = rect.top + window.scrollY;
    pill.style.left = `${x}px`;
    pill.style.top = `${y}px`;
    pill.style.transform = 'translate(-50%, -50%)';

    document.body.appendChild(pill);
    setTimeout(() => {
      pill.remove();
    }, 850);
  }

  // ==========================================
  // 6. TÍNH TOÁN ĐTB MÔN & XẾP LOẠI (TT 22)
  // Công thức TT22: (ĐGTX1..5 + Thái độ + Cột tùy chỉnh + GK*2 + CK*3) / Tổng hệ số
  // ==========================================
  function calculateStudentAverage(s) {
    const cls = getCurrentClass();
    let sum = 0;
    let count = 0;

    // 5 cột ĐGTX & Thái độ (Hệ số 1 mỗi cột nếu có nhập)
    const regulars = [s.dgtx1, s.dgtx2, s.dgtx3, s.dgtx4, s.dgtx5, s.attitude];
    regulars.forEach(val => {
      if (val !== null && val !== undefined && !isNaN(val) && val !== '') {
        sum += parseFloat(val);
        count += 1;
      }
    });

    // Giữa kỳ (Hệ số 2)
    if (s.giuaKy !== null && s.giuaKy !== undefined && !isNaN(s.giuaKy) && s.giuaKy !== '') {
      sum += parseFloat(s.giuaKy) * 2;
      count += 2;
    }

    // Cuối kỳ (Hệ số 3)
    if (s.cuoiKy !== null && s.cuoiKy !== undefined && !isNaN(s.cuoiKy) && s.cuoiKy !== '') {
      sum += parseFloat(s.cuoiKy) * 3;
      count += 3;
    }

    // Các cột tùy chỉnh do giáo viên thêm
    if (cls.customColumns && s.customGrades) {
      cls.customColumns.forEach(col => {
        const val = s.customGrades[col.id];
        const w = parseInt(col.weight, 10);
        if (w > 0 && val !== null && val !== undefined && !isNaN(val) && val !== '') {
          sum += parseFloat(val) * w;
          count += w;
        }
      });
    }

    if (count === 0) return null;
    return (sum / count).toFixed(1);
  }

  function getAverageClassBadge(avg) {
    if (avg === null || avg === undefined) return '<span class="text-muted">--</span>';
    const val = parseFloat(avg);
    if (val >= 8.0) return `<span class="badge-avg-score excellent">${val}</span>`;
    if (val >= 6.5) return `<span class="badge-avg-score good">${val}</span>`;
    if (val >= 5.0) return `<span class="badge-avg-score average">${val}</span>`;
    return `<span class="badge-avg-score weak">${val}</span>`;
  }

  function calculateStudentRank(avg) {
    if (avg === null || avg === undefined) return '<span class="text-muted">--</span>';
    const val = parseFloat(avg);
    if (val >= 8.0) return '<span class="badge-rank-tt22 tot">Tốt</span>';
    if (val >= 6.5) return '<span class="badge-rank-tt22 kha">Khá</span>';
    if (val >= 5.0) return '<span class="badge-rank-tt22 dat">Đạt</span>';
    return '<span class="badge-rank-tt22 chua-dat">Chưa đạt</span>';
  }

  // ==========================================
  // 7. RENDER GIAO DIỆN
  // ==========================================
  function initApp() {
    checkUrlHashData();
    Confetti.init();
    renderClassRibbon();
    renderClassroomTab();
    renderSeatingChart();
    renderGradebookTab();
    initWheel();
    renderLeaderboard();
    applyTheme(appState.theme || 'light');
    updateSoundIcon();
    applyAuthMode(isTeacherUnlocked);
    initEventListeners();
    initKHBD();
    initSupabaseAuthAndCloud();
    initRemoteListeners();

    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('mode') === 'remote') {
      openMobileRemoteApp();
    }
  }

  // Render thanh chuyển lớp nhanh & Dropdown chọn lớp tinh gọn
  function renderClassRibbon() {
    const cls = getCurrentClass();
    const titleEl = document.getElementById('current-class-title');
    const countEl = document.getElementById('current-class-count');
    const menuEl = document.getElementById('class-dropdown-menu');
    const quickContainer = document.getElementById('class-pills-list');

    if (cls) {
      if (titleEl) titleEl.textContent = cls.name;
      if (countEl) countEl.textContent = `${cls.students.length} HS`;
    }

    // Role Lớp trưởng: khóa chặt vào lớp chỉ định
    if (userRole === 'monitor' && monitorClassId) {
      const monCls = appState.classes.find(c => c.id === monitorClassId);
      if (monCls) {
        if (titleEl) titleEl.textContent = `⭐ ${monCls.name}`;
        if (countEl) countEl.textContent = `${monCls.students.length} HS`;
        if (menuEl) {
          menuEl.innerHTML = `
            <div style="padding: 8px 12px; font-size: 0.82rem; color: var(--primary-dark); font-weight: 700;">
              ⭐ Lớp trưởng được phân công: ${escapeHtml(monCls.name)}
            </div>
          `;
        }
        if (quickContainer) {
          quickContainer.innerHTML = `
            <button class="quick-class-btn active" data-class-id="${monCls.id}" style="cursor: default;">
              ⭐ ${escapeHtml(monCls.name)} (Lớp của bạn)
            </button>
          `;
        }
        renderClassStats();
        return;
      }
    }

    // Render danh sách trong Dropdown Lớp
    if (menuEl) {
      menuEl.innerHTML = appState.classes.map(c => `
        <button class="class-dropdown-item ${c.id === appState.currentClassId ? 'active' : ''}" data-class-id="${c.id}" type="button">
          <span>🏫 ${escapeHtml(c.name)}</span>
          <span class="class-drop-badge">${c.students.length} HS</span>
        </button>
      `).join('') + `
        <button class="class-dropdown-item teacher-only" id="btn-drop-manage-officers" type="button" style="border-top: 1px dashed var(--border); color: #0284c7; font-weight: 700; margin-top: 4px;">
          <span>🛡️ Phân quyền Ban cán sự...</span>
        </button>
        <button class="class-dropdown-item teacher-only" id="btn-add-class-from-drop" type="button" style="color: var(--primary-dark); font-weight: 700;">
          <span>➕ Tạo thêm lớp mới...</span>
        </button>
      `;

      menuEl.querySelector('#btn-drop-manage-officers')?.addEventListener('click', (e) => {
        e.stopPropagation();
        document.getElementById('class-dropdown-wrap')?.classList.remove('open');
        openModal('modal-class-officers');
        renderOfficersModal(appState.currentClassId);
      });

      menuEl.querySelector('#btn-add-class-from-drop')?.addEventListener('click', (e) => {
        e.stopPropagation();
        document.getElementById('class-dropdown-wrap')?.classList.remove('open');
        openModal('modal-manage-classes');
      });
    }

    // Render nút chuyển nhanh (Quick pills: [ 12C2 ] [ 12C13 ])
    if (quickContainer) {
      quickContainer.innerHTML = appState.classes.map(c => `
        <button class="quick-class-btn ${c.id === appState.currentClassId ? 'active' : ''}" data-class-id="${c.id}" type="button">
          ${escapeHtml(c.name)}
        </button>
      `).join('');
    }

    renderClassStats();
  }

  function renderClassStats() {
    const cls = getCurrentClass();
    const totalEl = document.getElementById('stat-total-students');
    const todayEl = document.getElementById('stat-today-points');
    if (totalEl) totalEl.textContent = cls.students.length;

    const todayStr = getTodayShortDate();
    let todayPoints = 0;
    cls.students.forEach(s => {
      (s.history || []).forEach(h => {
        if (h.date === todayStr && h.points > 0) todayPoints += h.points;
      });
    });
    if (todayEl) todayEl.textContent = `+${todayPoints}`;
  }

  // Render Tab 1: Lưới thẻ học sinh & Điểm Nhanh
  function renderClassroomTab() {
    const grid = document.getElementById('students-grid');
    if (!grid) return;

    const cls = getCurrentClass();
    const activeTeam = document.querySelector('#team-filter-buttons .filter-pill.active, #team-filter-buttons .btn-pill.active')?.dataset.team || 'all';
    const query = (document.getElementById('student-search-input')?.value || '').toLowerCase().trim();

    let list = cls.students;
    if (activeTeam === 'weak') {
      list = list.filter(s => {
        const avg = parseFloat(calculateStudentAverage(s) || 10);
        return avg < 5.0 || (s.points || 0) < 6;
      });
    } else if (activeTeam !== 'all') {
      list = list.filter(s => s.team === parseInt(activeTeam, 10));
    }

    if (query) {
      list = list.filter(s => s.name.toLowerCase().includes(query) || (s.sbd && s.sbd.toLowerCase().includes(query)));
    }

    if (list.length === 0) {
      const msg = activeTeam === 'weak'
        ? '🎉 Tuyệt vời! Cả lớp đều có ĐTB ≥ 5.0 và tích cực phát biểu!'
        : 'Không tìm thấy học sinh phù hợp.';
      grid.innerHTML = `<div style="grid-column: 1/-1; text-align: center; padding: 40px;"><p class="text-muted">${msg}</p></div>`;
      return;
    }

    grid.innerHTML = list.map((s, idx) => {
      const isSelected = selectedStudentIds.has(s.id);
      const currentPts = getStudentPoints(s);
      const scoreClass = currentPts > 0 ? 'positive' : (currentPts < 0 ? 'negative' : 'zero');
      const avatarInitial = s.name.split(' ').pop().charAt(0).toUpperCase();
      const levelInfo = calculateLevel(currentPts);
      const originalIdx = cls.students.findIndex(st => st.id === s.id);
      const sttNum = originalIdx !== -1 ? originalIdx + 1 : (idx + 1);
      if (!s.sbd || s.sbd.length !== 6) {
        s.sbd = generate6DigitSbd(cls.name, sttNum);
      }
      const sbdDisplay = s.sbd;

      return `
        <div class="student-card ${isSelected ? 'selected' : ''}" data-id="${s.id}">
          <div class="card-top">
            <div class="avatar-circle">${avatarInitial}</div>
            <div class="student-info">
              <div class="student-name" title="${escapeHtml(s.name)}">${escapeHtml(s.name)}</div>
              <div class="student-meta">
                <span class="stt-tag sbd-badge" title="Số Báo Danh trường (Khối-Lớp-STT)">SBD: ${sbdDisplay}</span>
                <button class="team-tag clickable" data-action="quick-team-click" data-id="${s.id}" type="button" title="Bấm để đổi nhanh Tổ cho ${escapeHtml(s.name)}">
                  Tổ ${s.team || 1} ✎
                </button>
              </div>
              <div class="badge-list-display">
                ${(s.badges || []).map(b => `<span class="badge-icon" title="${escapeHtml(b.name)}">${b.icon}</span>`).join('')}
              </div>
            </div>
          </div>

          <div class="student-level-row">
            <span class="level-badge lv-${levelInfo.level}">Lv.${levelInfo.level} ${levelInfo.title}</span>
            <div class="xp-bar-bg" title="${s.points} XP / Cấp tiếp theo: ${levelInfo.nextXp} XP">
              <div class="xp-bar-fill" style="width: ${levelInfo.progressPct}%;"></div>
            </div>
          </div>

          <div class="card-score-row">
            <span class="score-label">Điểm ${appState.currentSemester === 'hk2' ? 'HK II' : (appState.currentSemester === 'year' ? 'Cả Năm' : 'HK I')}:</span>
            <div style="display: flex; align-items: center; gap: 6px;">
              <button class="btn-badge teacher-only" data-action="open-badge" data-id="${s.id}" title="Cấp huy hiệu cho ${escapeHtml(s.name)}">🎖️</button>
              <button class="btn-xp-store teacher-only" data-action="open-store" data-id="${s.id}" title="Đổi thưởng cho ${escapeHtml(s.name)}">🛒 Đổi</button>
              <button class="btn-inventory-badge" data-action="open-inventory" data-id="${s.id}" title="Túi đồ thẻ đặc quyền (${(s.inventory || []).filter(c => !c.used).length} thẻ)" style="background: #eef2ff; border: 1px solid #c7d2fe; border-radius: 6px; padding: 3px 6px; font-size: 0.8rem; cursor: pointer; display: inline-flex; align-items: center; gap: 2px;">
                🎒${(s.inventory || []).filter(c => !c.used).length > 0 ? `<strong style="color: #4f46e5; font-size: 0.75rem;">${(s.inventory || []).filter(c => !c.used).length}</strong>` : ''}
              </button>
              <span class="score-val ${scoreClass}">${currentPts > 0 ? '+' : ''}${currentPts}</span>
            </div>
          </div>

          <div class="card-actions teacher-only">
            <button class="btn-card-plus" data-action="quick-plus" data-id="${s.id}">+1 Phát biểu</button>
            <button class="btn-card-minus" data-action="quick-minus" data-id="${s.id}">-1</button>
            <button class="btn-card-more" data-action="open-modal" data-id="${s.id}">⋮</button>
          </div>
        </div>
      `;
    }).join('');
  }

  // Render Tab 2: Sơ Đồ Bàn Học Thực Tế
  function renderSeatingChart() {
    const container = document.getElementById('seating-chart-grid');
    if (!container) return;

    const cls = getCurrentClass();
    const teams = [1, 2, 3, 4];
    
    let html = '';
    teams.forEach(teamNum => {
      const teamStudents = cls.students.filter(s => s.team === teamNum);
      const deskCount = Math.max(4, Math.ceil(teamStudents.length / 2));

      let desksHtml = '';
      for (let d = 0; d < deskCount; d++) {
        const s1 = teamStudents[d * 2];
        const s2 = teamStudents[d * 2 + 1];

        desksHtml += `
          <div class="desk-double-card">
            <div class="desk-label">Bàn ${d + 1}</div>
            <div class="desk-seats-row">
              ${renderSeat(s1)}
              ${renderSeat(s2)}
            </div>
          </div>
        `;
      }

      html += `
        <div class="seating-column">
          <div class="column-header">Dãy ${teamNum} (Tổ ${teamNum})</div>
          ${desksHtml}
        </div>
      `;
    });

    container.innerHTML = html;
  }

  function renderSeat(student) {
    if (!student) {
      return `
        <div class="desk-seat empty" style="opacity: 0.45; cursor: default;">
          <span class="seat-name text-muted">Trống</span>
          <span class="seat-points">-</span>
        </div>
      `;
    }

    const avatar = student.name.split(' ').pop().charAt(0).toUpperCase();
    const levelInfo = calculateLevel(student.points);
    return `
      <div class="desk-seat" data-seat-id="${student.id}" title="Bấm để thưởng +1 điểm phát biểu">
        <div style="display: flex; align-items: center; gap: 4px; width: 100%;">
          <div class="avatar-circle" style="width: 24px; height: 24px; font-size: 0.7rem; min-width: 24px;">${avatar}</div>
          <span class="seat-name" style="flex: 1; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${escapeHtml(student.name)}</span>
        </div>
        <div style="display: flex; align-items: center; gap: 2px; margin-top: 4px; flex-wrap: wrap; min-height: 16px;">
          ${(student.badges || []).map(b => `<span style="font-size: 0.8rem;" title="${escapeHtml(b.name)}">${b.icon}</span>`).join('')}
        </div>
        <div style="display: flex; align-items: center; justify-content: space-between; width: 100%; margin-top: 4px;">
          <span class="seat-points">${student.points} XP <small style="font-size:0.65rem; color: var(--text-muted);">(Lv.${levelInfo.level})</small></span>
          <button class="btn-card-plus seat-plus-btn" data-action="seat-plus" data-id="${student.id}" style="padding: 1px 7px; font-size: 0.72rem; border-radius: 4px;">+1</button>
        </div>
      </div>
    `;
  }

  // Render Tab 3: Sổ điểm học kỳ (7-8 Cột chuẩn TT 22 + Thêm cột động)
  function renderGradebookTab() {
    const thead = document.getElementById('gradebook-header-row');
    const tbody = document.getElementById('gradebook-tbody');
    if (!tbody) return;

    const cls = getCurrentClass();
    const customCols = cls.customColumns || [];

    // Tự động dựng Header chuẩn + Cột tùy chỉnh
    if (thead) {
      const customHeadersHtml = customCols.map(col => `
        <th class="col-custom" style="min-width: 80px; position: relative;">
          <div style="display: flex; align-items: center; justify-content: center; gap: 4px;">
            <span>${escapeHtml(col.name)}</span>
            <button class="btn-del-col" data-col-id="${col.id}" title="Xóa cột này" style="border:none; background:transparent; color:#ef4444; cursor:pointer; font-weight:bold; font-size:12px; padding:0 2px;">&times;</button>
          </div>
          <small style="font-size:0.68rem; opacity:0.75; font-weight:normal; display:block;">(HS ${col.weight})</small>
        </th>
      `).join('');

      thead.innerHTML = `
        <th style="width: 45px;">STT</th>
        <th style="width: 75px;">SBD</th>
        <th style="min-width: 170px; text-align: left;">Họ và tên</th>
        <th style="width: 55px;">Tổ</th>
        <th class="col-dgtx" style="width: 60px;">ĐGTX 1</th>
        <th class="col-dgtx" style="width: 60px;">ĐGTX 2</th>
        <th class="col-dgtx" style="width: 60px;">ĐGTX 3</th>
        <th class="col-dgtx" style="width: 60px;">ĐGTX 4</th>
        <th class="col-dgtx" style="width: 60px;">ĐGTX 5</th>
        <th class="col-attitude" style="width: 65px;">Thái Độ</th>
        <th class="col-gk" style="width: 70px;">Giữa Kỳ</th>
        <th class="col-ck" style="width: 70px;">Cuối Kỳ</th>
        ${customHeadersHtml}
        <th class="col-avg" style="width: 75px;">ĐTB Môn</th>
        <th class="col-rank" style="width: 80px;">Xếp Loại</th>
        <th class="col-xp" style="width: 80px;">Điểm Thưởng</th>
        <th class="teacher-only" style="width: 95px;">Bù Điểm</th>
      `;
    }

    tbody.innerHTML = cls.students.map((s, idx) => {
      const avg = calculateStudentAverage(s);
      const avgBadge = getAverageClassBadge(avg);
      const rankBadge = calculateStudentRank(avg);

      const customCellsHtml = customCols.map(col => {
        const val = (s.customGrades && s.customGrades[col.id] !== undefined) ? s.customGrades[col.id] : '';
        return `
          <td>
            <input type="number" step="0.5" min="0" max="10" 
                   class="score-input-cell" 
                   data-custom="true" 
                   data-col="${col.id}" 
                   value="${val ?? ''}">
          </td>
        `;
      }).join('');

      return `
        <tr data-student-id="${s.id}">
          <td>${idx + 1}</td>
          <td><span class="stt-tag sbd-badge">${s.sbd || generate6DigitSbd(cls.name, idx + 1)}</span></td>
          <td class="cell-name">${escapeHtml(s.name)}</td>
          <td><span class="team-tag">Tổ ${s.team}</span></td>
          
          <!-- 5 Cột ĐGTX -->
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="dgtx1" value="${s.dgtx1 ?? ''}"></td>
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="dgtx2" value="${s.dgtx2 ?? ''}"></td>
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="dgtx3" value="${s.dgtx3 ?? ''}"></td>
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="dgtx4" value="${s.dgtx4 ?? ''}"></td>
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="dgtx5" value="${s.dgtx5 ?? ''}"></td>

          <!-- Thái độ / Chuyên cần -->
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="attitude" value="${s.attitude ?? ''}" style="color: #854d0e; font-weight: 700;"></td>

          <!-- Giữa kỳ (x2) & Cuối kỳ (x3) -->
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="giuaKy" value="${s.giuaKy ?? ''}" style="color: #b45309; font-weight: 700;"></td>
          <td><input type="number" step="0.5" min="0" max="10" class="score-input-cell" data-col="cuoiKy" value="${s.cuoiKy ?? ''}" style="color: #c2410c; font-weight: 700;"></td>

          <!-- Các cột tùy chỉnh động -->
          ${customCellsHtml}

          <!-- ĐTB Môn Tự Động -->
          <td class="cell-avg">${avgBadge}</td>

          <!-- Xếp Loại TT22 Tự Động -->
          <td class="cell-rank">${rankBadge}</td>

          <!-- Điểm thưởng XP -->
          <td><strong style="color: var(--accent-dark); font-size: 1.05rem;">${s.points} XP</strong></td>

          <!-- Thao tác Đổi / Bù Điểm Thưởng -->
          <td class="teacher-only">
            <button class="btn-redeem-xp" data-action="redeem-xp" data-id="${s.id}">
              🎁 Bù điểm
            </button>
          </td>
        </tr>
      `;
    }).join('');
  }

  // ==========================================
  // 8. THAO TÁC CỘNG ĐIỂM & BÙ ĐIỂM XP
  // ==========================================
  function adjustStudentPoints(studentId, deltaPoints, reason = 'Phát biểu xây dựng bài', sourceEl = null) {
    if (userRole === 'guest' && document.body.classList.contains('student-mode')) {
      showToast('⚠️ Vui lòng đăng nhập Google (Thầy giáo hoặc Lớp trưởng) để ghi điểm.', 'warning');
      return;
    }

    const cls = getCurrentClass();
    const student = cls.students.find(s => s.id === studentId);
    if (!student) return;

    if (student.points_hk1 === undefined) student.points_hk1 = student.points || 0;
    if (student.points_hk2 === undefined) student.points_hk2 = 0;

    const activeSem = (appState.currentSemester === 'year') ? 'hk2' : (appState.currentSemester || 'hk1');
    if (activeSem === 'hk2') {
      student.points_hk2 = (student.points_hk2 || 0) + deltaPoints;
    } else {
      student.points_hk1 = (student.points_hk1 || 0) + deltaPoints;
    }
    student.points = (student.points_hk1 || 0) + (student.points_hk2 || 0);

    if (!student.history) student.history = [];
    student.history.unshift({
      date: getTodayShortDate(),
      time: new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' }),
      timestamp: Date.now(),
      semester: activeSem,
      reason: reason,
      points: deltaPoints,
      actor: (currentUser && currentUser.email) ? currentUser.email : (isTeacherUnlocked ? 'Thầy (PIN)' : 'Hệ thống')
    });

    if (student.history.length > 50) student.history.pop();

    if (sourceEl) {
      spawnFloatingPoint(sourceEl, deltaPoints);
    }

    saveState();
    renderClassroomTab();
    renderSeatingChart();
    renderGradebookTab();
    renderLeaderboard();

    if (deltaPoints > 0) {
      AudioEngine.playPositive();
      if (deltaPoints >= 2) Confetti.burst();
    } else {
      AudioEngine.playNegative();
    }

    showToast(
      deltaPoints > 0
        ? `🌟 <strong>${escapeHtml(student.name)}</strong>: +${deltaPoints} XP <em>(${escapeHtml(reason)})</em>`
        : `⚠️ <strong>${escapeHtml(student.name)}</strong>: ${deltaPoints} XP <em>(${escapeHtml(reason)})</em>`,
      deltaPoints > 0 ? 'success' : 'warning'
    );

    // Đồng bộ tức thời lên Supabase nếu có kết nối
    if (supabaseClient && currentUser) {
      syncPointToSupabase(student, cls.id, deltaPoints, reason);
    }
  }

  // ==========================================
  // HỆ THỐNG HUY HIỆU (BADGES)
  // ==========================================
  const BADGES_LIST = [
    { id: 'hiep_si', icon: '🛡️', name: 'Hiệp Sĩ', desc: 'Dũng cảm nhận lỗi hoặc chỉ ra lỗi của GV/đề bài.', xpReward: 2 },
    { id: 'tien_phong', icon: '🚀', name: 'Tiên Phong', desc: 'Xung phong lên bảng hoặc nộp bài đầu tiên.', xpReward: 1 },
    { id: 'bach_phat', icon: '🎯', name: 'Bách Phát Bách Trúng', desc: 'Lên bảng 3 lần liên tiếp giải đúng 100%.', xpReward: 2 },
    { id: 'mentor', icon: '🤝', name: 'Người Hướng Dẫn', desc: 'Giúp đỡ, giảng bài cho bạn khác hiểu.', xpReward: 1 },
    { id: 'chuyen_can', icon: '🔥', name: 'Chuyên Cần', desc: 'Tham gia học đầy đủ, không vắng mặt buổi nào.', xpReward: 1 }
  ];

  function openBadgeModal(studentId) {
    if (appState.isStudentMode) return showToast('Chế độ Học sinh không được cấp huy hiệu!', 'error');

    const cls = getCurrentClass();
    const stu = cls.students.find(s => s.id === studentId);
    if (!stu) return;

    document.getElementById('badge-student-name').textContent = stu.name;
    const badgeCount = (stu.badges || []).length;
    document.getElementById('badge-student-badges-count').textContent = badgeCount;

    const grid = document.getElementById('badge-items-grid');
    grid.innerHTML = BADGES_LIST.map(badge => {
      const hasBadge = (stu.badges || []).some(b => b.id === badge.id);
      return `
        <div class="badge-item-card" data-action="award-badge" data-badge-id="${badge.id}" data-student-id="${stu.id}">
          <div class="badge-item-icon">${badge.icon}</div>
          <div class="badge-item-name">${badge.name}</div>
          <div class="badge-item-desc">${badge.desc}</div>
          <div class="badge-item-btn">${hasBadge ? 'Đã có (Cấp thêm)' : `Cấp (+${badge.xpReward} XP)`}</div>
        </div>
      `;
    }).join('');

    openModal('modal-badge');
  }

  // ==========================================
  // CỬA HÀNG XP (XP STORE) & THẺ ĐẶC QUYỀN TOÁN THPT
  // ==========================================
  const XP_STORE_ITEMS = [
    { id: 'baohiem', name: '🛡️ Thẻ Bù Bài Tập Về Nhà', cost: 2, desc: 'Miễn trừ 1 lần quên làm bài tập Toán hoặc quên mang vở (cam kết nộp bù vào tiết sau).' },
    { id: 'cuuvien', name: '🤝 Thẻ Cứu Viện Lên Bảng', cost: 3, desc: 'Được chỉ định 1 bạn trong tổ lên bảng cùng hỗ trợ khi giải bài tập Toán khó.' },
    { id: 'chonde', name: '🎯 Thẻ Quyền Chọn Đề', cost: 3, desc: 'Được tự chọn bài Chẵn hoặc Lẻ khi làm bài kiểm tra ngắn 15 phút tại lớp.' },
    { id: 'x2_xp', name: '🔥 Thẻ Thần Tốc x2 XP', cost: 3, desc: 'Lần giải đúng câu hỏi/ví dụ Toán tiếp theo được nhận gấp đôi điểm (+2 XP).' },
    { id: 'mientu', name: '🎟️ Thẻ Miễn Kiểm Tra Miệng', cost: 4, desc: 'Miễn 1 lần gọi kiểm tra công thức / bài cũ ngẫu nhiên đầu giờ.' },
    { id: 'diemcong_nho', name: '📈 Thẻ Cộng +0.5đ ĐGTX', cost: 4, desc: 'Quy đổi 4 XP thành +0.5 điểm thưởng vào 1 cột điểm Đánh Giá Thường Xuyên môn Toán.' },
    { id: 'diemcong_lon', name: '🏆 Thẻ Cộng +1.0đ ĐGTX', cost: 5, desc: 'Quy đổi 5 XP thành +1.0 điểm thưởng vào 1 cột điểm Đánh Giá Thường Xuyên môn Toán.' }
  ];

  function openXPStore(studentId) {
    if (appState.isStudentMode) return showToast('Chế độ Học sinh không được đổi điểm!', 'error');

    const cls = getCurrentClass();
    const stu = cls.students.find(s => s.id === studentId);
    if (!stu) return;

    document.getElementById('xp-store-student-name').textContent = stu.name;
    const currentPts = getStudentPoints(stu);
    document.getElementById('xp-store-student-points').textContent = currentPts;

    const grid = document.getElementById('xp-store-items-grid');
    grid.innerHTML = XP_STORE_ITEMS.map(item => {
      const canAfford = currentPts >= item.cost;
      return `
        <div class="xp-store-item-card ${canAfford ? 'clickable-item' : 'disabled'}" ${canAfford ? `data-action="buy-xp-item" data-item-id="${item.id}" data-student-id="${stu.id}"` : ''}>
          <div class="xp-store-item-icon">${item.name.split(' ')[0]}</div>
          <div class="xp-store-item-name">${item.name.substring(item.name.indexOf(' ') + 1)}</div>
          <div class="xp-store-item-desc">${item.desc}</div>
          <div class="xp-store-item-btn">${item.cost} XP</div>
        </div>
      `;
    }).join('');

    openModal('modal-xp-store');
  }

  // Quản lý Túi đồ học sinh (Inventory)
  function openInventoryModal(studentId) {
    const cls = getCurrentClass();
    const stu = cls.students.find(s => s.id === studentId);
    if (!stu) return;

    if (!stu.inventory) stu.inventory = [];
    const activeCards = stu.inventory.filter(c => !c.used);

    document.getElementById('inventory-student-name').textContent = `${stu.name} (Tổ ${stu.team || 1})`;
    document.getElementById('inventory-cards-count').textContent = activeCards.length;

    const grid = document.getElementById('inventory-cards-grid');
    if (activeCards.length === 0) {
      grid.innerHTML = `
        <div style="text-align: center; padding: 30px; color: var(--text-muted); background: white; border-radius: 12px; border: 1px dashed var(--border);">
          <div style="font-size: 2.5rem; margin-bottom: 8px;">🎒</div>
          <div style="font-weight: 700; font-size: 1rem; color: var(--text-main);">Túi đồ hiện đang trống</div>
          <div style="font-size: 0.85rem; margin-top: 4px;">Dùng điểm XP tại <strong>Cửa Hàng XP</strong> để đổi lấy các thẻ đặc quyền hấp dẫn!</div>
        </div>
      `;
    } else {
      grid.innerHTML = activeCards.map(c => `
        <div class="inventory-card-item" style="display: flex; justify-content: space-between; align-items: center; background: white; padding: 12px 16px; border-radius: 12px; border: 1px solid var(--border); box-shadow: var(--shadow-card);">
          <div style="display: flex; align-items: center; gap: 12px;">
            <div style="font-size: 2rem; width: 44px; height: 44px; display: flex; align-items: center; justify-content: center; background: #eef2ff; border-radius: 10px;">${c.name.split(' ')[0]}</div>
            <div>
              <div style="font-weight: 800; font-size: 1rem; color: var(--text-main);">${escapeHtml(c.name)}</div>
              <div style="font-size: 0.82rem; color: var(--text-muted); margin-top: 2px;">${escapeHtml(c.desc || '')}</div>
              <small style="font-size: 0.72rem; color: #6366f1;">Đã đổi: ${c.purchasedAt || ''}</small>
            </div>
          </div>
          <button class="btn-sub-action btn-activate-card" data-action="use-card" data-student-id="${stu.id}" data-card-id="${c.id}" type="button" style="background: linear-gradient(135deg, #6366f1, #4f46e5); color: white; border: none; font-weight: 800; padding: 8px 14px; border-radius: 8px; cursor: pointer; white-space: nowrap;">
            ⚡ Kích Hoạt
          </button>
        </div>
      `).join('');
    }

    openModal('modal-inventory');
  }

  function activateCard(studentId, cardId) {
    const cls = getCurrentClass();
    const stu = cls.students.find(s => s.id === studentId);
    if (!stu || !stu.inventory) return;

    const card = stu.inventory.find(c => c.id === cardId && !c.used);
    if (!card) return;

    card.used = true;
    card.usedAt = new Date().toLocaleDateString('vi-VN');

    // Ghi lịch sử hoạt động
    if (!stu.history) stu.history = [];
    stu.history.unshift({
      timestamp: new Date().toISOString(),
      dateStr: new Date().toLocaleDateString('vi-VN') + ' ' + new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' }),
      delta: 0,
      reason: `⚡ Kích hoạt đặc quyền: ${card.name}`,
      actor: currentUser?.email || 'Thầy giáo'
    });

    saveState();
    AudioEngine.playReward();
    Confetti.burst();
    showToast(`🎉 ${stu.name} đã kích hoạt thành công ${card.name}!`, 'success');

    if (card.itemId === 'diemcong_nho' || card.itemId === 'diemcong_lon') {
      closeModal('modal-inventory');
      openRedeemModal(studentId);
      return;
    }

    openInventoryModal(studentId);
    renderClassroomTab();
    renderSeatingChart();
  }

  // Mở modal bù điểm thưởng
  function openRedeemModal(studentId) {
    const cls = getCurrentClass();
    const student = cls.students.find(s => s.id === studentId);
    if (!student) return;

    activeStudentForRedeem = student;
    document.getElementById('redeem-student-name').textContent = `${student.name} (Tổ ${student.team})`;
    document.getElementById('redeem-student-xp').textContent = `${student.points} XP`;

    // Cập nhật danh sách các cột có thể bù điểm
    const select = document.getElementById('redeem-target-column');
    if (select) {
      let options = `
        <option value="dgtx1">ĐGTX 1</option>
        <option value="dgtx2">ĐGTX 2</option>
        <option value="dgtx3">ĐGTX 3</option>
        <option value="dgtx4">ĐGTX 4</option>
        <option value="dgtx5">ĐGTX 5</option>
        <option value="attitude">Thái độ / Chuyên cần</option>
      `;
      (cls.customColumns || []).forEach(c => {
        options += `<option value="custom_${c.id}">${escapeHtml(c.name)}</option>`;
      });
      select.innerHTML = options;
    }

    openModal('modal-redeem-xp');
  }

  // Xác nhận bù điểm vào cột điểm
  function confirmRedeemPoints() {
    if (!activeStudentForRedeem) return;
    const targetCol = document.getElementById('redeem-target-column').value;
    const pointsAdd = parseFloat(document.getElementById('redeem-points-add').value) || 1;
    const costXp = pointsAdd * 5; // Tỉ lệ 5 XP = 1 điểm

    if (activeStudentForRedeem.points < costXp) {
      alert(`Học sinh không đủ điểm thưởng! Cần ${costXp} XP để đổi ${pointsAdd} điểm (Hiện có: ${activeStudentForRedeem.points} XP).`);
      return;
    }

    let colTitle = targetCol.toUpperCase();
    if (targetCol.startsWith('custom_')) {
      const colId = targetCol.replace('custom_', '');
      if (!activeStudentForRedeem.customGrades) activeStudentForRedeem.customGrades = {};
      const currentVal = parseFloat(activeStudentForRedeem.customGrades[colId]) || 0;
      activeStudentForRedeem.customGrades[colId] = Math.min(10, currentVal + pointsAdd);
      const colObj = (getCurrentClass().customColumns || []).find(c => c.id === colId);
      if (colObj) colTitle = colObj.name;
    } else {
      const currentVal = parseFloat(activeStudentForRedeem[targetCol]) || 0;
      activeStudentForRedeem[targetCol] = Math.min(10, currentVal + pointsAdd);
    }

    activeStudentForRedeem.points -= costXp;

    activeStudentForRedeem.history.unshift({
      date: getTodayShortDate(),
      time: new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' }),
      reason: `Đổi ${costXp} XP để bù +${pointsAdd}đ vào cột ${colTitle}`,
      points: -costXp
    });

    saveState();
    renderGradebookTab();
    renderClassroomTab();
    renderSeatingChart();
    renderLeaderboard();
    closeModal('modal-redeem-xp');

    AudioEngine.playFanfare();
    Confetti.burst();
    alert(`🎉 Đã bù thành công +${pointsAdd} điểm vào cột ${colTitle} cho em ${activeStudentForRedeem.name}!`);
  }

  // ==========================================
  // 9. VÒNG QUAY MAY MẮN (CANVAS 2D)
  // ==========================================
  function initWheel() {
    wheelCanvas = document.getElementById('wheel-canvas');
    if (!wheelCanvas) return;
    wheelCtx = wheelCanvas.getContext('2d');
    updateWheelStudents();
    drawWheel();
  }

  function updateWheelStudents() {
    const cls = getCurrentClass();
    const scope = document.getElementById('wheel-team-scope')?.value || 'all';
    const excludeCalled = document.getElementById('chk-exclude-called')?.checked ?? true;

    let pool = [...cls.students];
    if (scope !== 'all') {
      pool = pool.filter(s => s.team === parseInt(scope, 10));
    }
    if (excludeCalled) {
      pool = pool.filter(s => !calledStudents.has(s.id));
    }
    if (pool.length === 0) pool = [...cls.students];
    wheelStudents = pool;
  }

  function drawWheel() {
    if (!wheelCanvas || !wheelCtx) return;
    const w = wheelCanvas.width;
    const h = wheelCanvas.height;
    const cx = w / 2;
    const cy = h / 2;
    const r = w / 2 - 12;

    wheelCtx.clearRect(0, 0, w, h);
    const count = wheelStudents.length;
    if (count === 0) return;

    const arc = (Math.PI * 2) / count;
    const sliceColors = ['#10b981', '#f97316', '#3b82f6', '#ec4899', '#8b5cf6', '#06b6d4', '#f59e0b', '#14b8a6'];

    for (let i = 0; i < count; i++) {
      const startAngle = wheelAngle + i * arc;
      const endAngle = startAngle + arc;

      wheelCtx.beginPath();
      wheelCtx.moveTo(cx, cy);
      wheelCtx.arc(cx, cy, r, startAngle, endAngle);
      wheelCtx.closePath();
      wheelCtx.fillStyle = sliceColors[i % sliceColors.length];
      wheelCtx.fill();
      wheelCtx.lineWidth = 2;
      wheelCtx.strokeStyle = 'rgba(255,255,255,0.4)';
      wheelCtx.stroke();

      wheelCtx.save();
      wheelCtx.translate(cx, cy);
      wheelCtx.rotate(startAngle + arc / 2);
      wheelCtx.textAlign = 'right';
      wheelCtx.fillStyle = '#ffffff';
      wheelCtx.font = 'bold 15px Outfit, sans-serif';
      const shortName = wheelStudents[i].name.split(' ').slice(-2).join(' ');
      wheelCtx.fillText(shortName, r - 20, 5);
      wheelCtx.restore();
    }

    // Tâm bánh xe
    wheelCtx.beginPath();
    wheelCtx.arc(cx, cy, 32, 0, Math.PI * 2);
    wheelCtx.fillStyle = '#ffffff';
    wheelCtx.fill();
    wheelCtx.lineWidth = 4;
    wheelCtx.strokeStyle = '#f97316';
    wheelCtx.stroke();

    wheelCtx.fillStyle = '#f97316';
    wheelCtx.font = 'bold 18px Outfit, sans-serif';
    wheelCtx.textAlign = 'center';
    wheelCtx.textBaseline = 'middle';
    wheelCtx.fillText('★', cx, cy);
  }

  function spinWheel() {
    if (isSpinning || wheelStudents.length === 0) return;
    isSpinning = true;
    AudioEngine.init();

    const spinBtn = document.getElementById('btn-spin-wheel');
    if (spinBtn) spinBtn.disabled = true;

    const winnerIndex = Math.floor(Math.random() * wheelStudents.length);
    const winner = wheelStudents[winnerIndex];

    const count = wheelStudents.length;
    const arc = (Math.PI * 2) / count;
    const targetSliceAngle = (3 * Math.PI / 2) - (winnerIndex * arc + arc / 2);
    const extraRounds = (Math.floor(Math.random() * 4) + 5) * Math.PI * 2;
    const targetAngle = wheelAngle + extraRounds + (targetSliceAngle - (wheelAngle % (Math.PI * 2)));

    const startAngle = wheelAngle;
    const totalChange = targetAngle - startAngle;
    const duration = 4500;
    const startTime = performance.now();
    let lastTick = -1;

    function animate(currentTime) {
      const elapsed = currentTime - startTime;
      const progress = Math.min(elapsed / duration, 1);
      const easeOut = 1 - Math.pow(1 - progress, 3);
      wheelAngle = startAngle + totalChange * easeOut;

      const currentSlice = Math.floor(((wheelAngle % (Math.PI * 2)) + Math.PI * 2) / arc);
      if (currentSlice !== lastTick) {
        AudioEngine.playWheelTick();
        lastTick = currentSlice;
      }

      drawWheel();

      if (progress < 1) {
        requestAnimationFrame(animate);
      } else {
        isSpinning = false;
        if (spinBtn) spinBtn.disabled = false;
        calledStudents.add(winner.id);
        updateCalledListUI();
        AudioEngine.playFanfare();
        Confetti.burst(window.innerWidth / 2, window.innerHeight / 2, 120);

        document.getElementById('winner-name').textContent = winner.name;
        document.getElementById('winner-team-badge').textContent = `Tổ ${winner.team} • SBD: ${winner.sbd || '---'}`;
        document.getElementById('btn-winner-add-pts').onclick = () => {
          adjustStudentPoints(winner.id, 2, 'Gọi tên may mắn lên bảng');
          closeModal('modal-winner');
        };
        openModal('modal-winner');
      }
    }
    requestAnimationFrame(animate);
  }

  function updateCalledListUI() {
    const listEl = document.getElementById('called-students-list');
    const countEl = document.getElementById('called-count');
    if (!listEl) return;
    const cls = getCurrentClass();
    const calledArr = cls.students.filter(s => calledStudents.has(s.id));
    if (countEl) countEl.textContent = calledArr.length;
    if (calledArr.length === 0) {
      listEl.innerHTML = '<span class="empty-hint">Chưa có học sinh nào được gọi</span>';
      return;
    }
    listEl.innerHTML = calledArr.map(s => `<span class="called-tag">${escapeHtml(s.name)} (Tổ ${s.team})</span>`).join('');
  }

  // ==========================================
  // 10. TIMER & BỘ CHIA NHÓM
  // ==========================================
  function updateTimerDisplay() {
    const displayEl = document.getElementById('timer-display');
    const progressEl = document.getElementById('timer-progress');
    const statusEl = document.getElementById('timer-status');

    const mins = Math.floor(timerRemaining / 60);
    const secs = timerRemaining % 60;
    if (displayEl) displayEl.textContent = `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;

    if (progressEl) {
      const circumference = 2 * Math.PI * 88;
      const fraction = timerRemaining / timerDuration;
      progressEl.style.strokeDashoffset = circumference * (1 - fraction);
      progressEl.style.stroke = timerRemaining <= 10 && timerRemaining > 0 ? '#ef4444' : 'var(--accent)';
    }

    if (statusEl) statusEl.textContent = isTimerRunning ? 'Đang đếm...' : (timerRemaining === 0 ? 'Hết giờ!' : 'Sẵn sàng');
  }

  function startTimer() {
    if (isTimerRunning) return;
    isTimerRunning = true;
    AudioEngine.init();
    const startBtn = document.getElementById('btn-timer-start');
    const pauseBtn = document.getElementById('btn-timer-pause');
    if (startBtn) startBtn.style.display = 'none';
    if (pauseBtn) pauseBtn.style.display = 'inline-flex';

    timerInterval = setInterval(() => {
      if (timerRemaining > 0) {
        timerRemaining--;
        updateTimerDisplay();
      } else {
        pauseTimer();
        AudioEngine.playTimerAlarm();
        Confetti.burst();
        alert('🔔 HẾT GIỜ LÀM BÀI / THẢO LUẬN!');
      }
    }, 1000);
    updateTimerDisplay();
  }

  function pauseTimer() {
    isTimerRunning = false;
    clearInterval(timerInterval);
    const startBtn = document.getElementById('btn-timer-start');
    const pauseBtn = document.getElementById('btn-timer-pause');
    if (startBtn) startBtn.style.display = 'inline-flex';
    if (pauseBtn) pauseBtn.style.display = 'none';
    updateTimerDisplay();
  }

  function resetTimer(seconds = timerDuration) {
    pauseTimer();
    timerDuration = seconds;
    timerRemaining = seconds;
    updateTimerDisplay();
  }

  let currentGeneratedTeams = [];

    // ==========================================
  // 10. NHIỆM VỤ HỌC TẬP & CHIA NHÓM TỰ RÃ ĐIỂM XP THÔNG MINH
  // ==========================================
  let currentMissionGroupScores = {};
  let currentMissionData = null;
  let manualGroupAssignments = {}; // { studentId: groupIndex }
  let activeMissionGroupingMode = 'random'; // 'random' | 'manual'

  
  function renderMissionsTab() {
    const cls = getCurrentClass();
    const nameEl = document.getElementById('mission-class-name');
    if (nameEl) nameEl.textContent = cls.name;
    const semBadge = document.getElementById('mission-sem-badge');
    if (semBadge) {
      semBadge.textContent = appState.currentSemester === 'hk2' ? '🌸 Học Kỳ II' : '🍂 Học Kỳ I';
    }
    updateMissionsCount();
    if (activeMissionGroupingMode === 'manual') {
      renderManualAssignUI();
    }
  }

  function renderManualAssignUI() {
    const cls = getCurrentClass();
    const countSelect = document.getElementById('manual-team-count-select');
    const groupCount = parseInt(countSelect?.value || '4', 10);
    const searchVal = (document.getElementById('manual-search-stu')?.value || '').toLowerCase().trim();
    const statsContainer = document.getElementById('manual-groups-stats');
    const listContainer = document.getElementById('manual-assign-list');

    // Đếm số lượng thành viên từng nhóm
    const counts = Array.from({ length: groupCount }, () => 0);
    let unassignedCount = 0;

    cls.students.forEach(s => {
      const gIdx = manualGroupAssignments[s.id];
      if (gIdx !== undefined && gIdx !== null && gIdx >= 0 && gIdx < groupCount) {
        counts[gIdx]++;
      } else {
        unassignedCount++;
      }
    });

    if (statsContainer) {
      statsContainer.innerHTML = counts.map((cnt, idx) => `
        <span class="manual-stat-badge ${cnt > 0 ? 'active-fill' : ''}">
          Nhóm ${idx + 1}: <strong>${cnt}</strong> em
        </span>
      `).join('') + `
        <span class="manual-stat-badge" style="background: ${unassignedCount > 0 ? 'rgba(239, 68, 68, 0.12)' : 'var(--bg-subtle)'}; color: ${unassignedCount > 0 ? '#dc2626' : 'var(--text-muted)'};">
          Chưa xếp: <strong>${unassignedCount}</strong> em
        </span>
      `;
    }

    if (!listContainer) return;

    const filtered = cls.students.filter(s => 
      !searchVal || s.name.toLowerCase().includes(searchVal) || (s.sbd && s.sbd.toLowerCase().includes(searchVal))
    );

    listContainer.innerHTML = filtered.map((s, idx) => {
      const assignedGIdx = manualGroupAssignments[s.id];

      return `
        <div class="manual-assign-row" data-id="${s.id}">
          <div class="manual-stu-info">
            <span class="stt-tag small">#${String(idx + 1).padStart(2, '0')}</span>
            <span class="stt-tag sbd-badge small">SBD: ${escapeHtml(s.sbd || '')}</span>
            <strong style="font-size: 0.88rem;">${escapeHtml(s.name)}</strong>
            <small class="text-muted">(Tổ ${s.team})</small>
          </div>
          <div class="manual-group-pills">
            <span class="text-muted small" style="margin-right: 4px; font-weight: 600;">Gán Nhóm:</span>
            ${Array.from({ length: groupCount }, (_, gIdx) => `
              <button class="btn-pick-group ${assignedGIdx === gIdx ? 'active' : ''}" data-id="${s.id}" data-pick-gidx="${gIdx}" type="button">
                ${gIdx + 1}
              </button>
            `).join('')}
          </div>
        </div>
      `;
    }).join('');
  }

  function seedManualGroupsRandomly() {
    const cls = getCurrentClass();
    const groupCount = parseInt(document.getElementById('manual-team-count-select')?.value || '4', 10);
    const shuffled = [...cls.students].sort(() => Math.random() - 0.5);
    manualGroupAssignments = {};
    shuffled.forEach((s, idx) => {
      manualGroupAssignments[s.id] = idx % groupCount;
    });
    renderManualAssignUI();
    showToast(`🎲 Đã trộn ngẫu nhiên gợi ý ${groupCount} nhóm! Thầy có thể click đổi nhóm từng em nếu muốn.`, 'info');
  }

  function clearManualGroups() {
    manualGroupAssignments = {};
    renderManualAssignUI();
    showToast('Đã xóa trắng các nhóm thủ công.', 'info');
  }

  function applyManualTeams() {
    const cls = getCurrentClass();
    const groupCount = parseInt(document.getElementById('manual-team-count-select')?.value || '4', 10);
    const missionTitle = (document.getElementById('mission-title-input')?.value || 'Hoạt động nhóm').trim();

    const teams = Array.from({ length: groupCount }, () => []);

    // Phân bổ các em theo lựa chọn thủ công
    cls.students.forEach((s, idx) => {
      let gIdx = manualGroupAssignments[s.id];
      if (gIdx === undefined || gIdx === null || gIdx < 0 || gIdx >= groupCount) {
        gIdx = idx % groupCount; // phân bổ nốt nếu chưa bấm
      }
      teams[gIdx].push(s);
    });

    currentGeneratedTeams = teams;
    currentMissionGroupScores = {};
    currentMissionData = {
      id: 'mission_' + Date.now(),
      title: missionTitle,
      date: getTodayShortDate(),
      time: new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' }),
      semester: appState.currentSemester || 'hk1',
      groupCount: groupCount,
      method: 'manual',
      teams: teams.map((mList, idx) => ({
        groupIndex: idx,
        groupName: `Nhóm ${idx + 1}`,
        members: mList.map(m => ({ id: m.id, name: m.name, team: m.team, sbd: m.sbd }))
      }))
    };

    renderMissionTeamsUI();
    AudioEngine.playPositive();
    Confetti.burst();
    showToast(`🚀 Đã hoàn tất phân ${groupCount} nhóm thủ công cho "${escapeHtml(missionTitle)}"! Bắt đầu thảo luận & rã XP.`, 'success');
  }

  function moveStudentToAnotherGroup(studentId, currentGIdx) {
    if (!currentGeneratedTeams || currentGeneratedTeams.length <= 1) return;
    const numGroups = currentGeneratedTeams.length;
    const targetNum = prompt(`Chuyển em sang nhóm nào? (Nhập từ 1 đến ${numGroups}):`, String(((currentGIdx + 1) % numGroups) + 1));
    if (!targetNum) return;
    const targetGIdx = parseInt(targetNum, 10) - 1;
    if (isNaN(targetGIdx) || targetGIdx < 0 || targetGIdx >= numGroups || targetGIdx === currentGIdx) {
      showToast('Số nhóm không hợp lệ hoặc trùng nhóm hiện tại!', 'warning');
      return;
    }

    const currList = currentGeneratedTeams[currentGIdx];
    const stuIdx = currList.findIndex(s => s.id === studentId);
    if (stuIdx !== -1) {
      const [moved] = currList.splice(stuIdx, 1);
      currentGeneratedTeams[targetGIdx].push(moved);
      renderMissionTeamsUI();
      showToast(`Đã chuyển em ${moved.name} sang Nhóm ${targetGIdx + 1}!`, 'success');
    }
  }

  function generateMissionTeams() {
    const cls = getCurrentClass();
    const count = parseInt(document.getElementById('team-count-select')?.value || '4', 10);
    const method = document.getElementById('mission-split-method')?.value || 'random';
    const missionTitle = (document.getElementById('mission-title-input')?.value || 'Hoạt động nhóm').trim();
    const resultGrid = document.getElementById('generated-teams-result');
    if (!resultGrid) return;

    let studentsToSplit = [...cls.students];
    const teams = Array.from({ length: count }, () => []);

    if (method === 'fair') {
      // Cân bằng khá / cần hỗ trợ: Sắp xếp theo XP rồi chia zic-zac
      studentsToSplit.sort((a, b) => getStudentPoints(b) - getStudentPoints(a));
      studentsToSplit.forEach((s, idx) => {
        const cycle = Math.floor(idx / count);
        const rem = idx % count;
        const targetTeam = (cycle % 2 === 0) ? rem : (count - 1 - rem);
        teams[targetTeam].push(s);
      });
    } else if (method === 'desks') {
      // Theo cụm bàn / số thứ tự gần nhau
      const chunkSize = Math.ceil(studentsToSplit.length / count);
      for (let i = 0; i < count; i++) {
        teams[i] = studentsToSplit.slice(i * chunkSize, (i + 1) * chunkSize);
      }
    } else {
      // Ngẫu nhiên trộn đều
      studentsToSplit.sort(() => Math.random() - 0.5);
      studentsToSplit.forEach((s, idx) => teams[idx % count].push(s));
    }

    currentGeneratedTeams = teams;
    currentMissionGroupScores = {};
    currentMissionData = {
      id: 'mission_' + Date.now(),
      title: missionTitle,
      date: getTodayShortDate(),
      time: new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' }),
      semester: appState.currentSemester || 'hk1',
      groupCount: count,
      method: method,
      teams: teams.map((mList, idx) => ({
        groupIndex: idx,
        groupName: `Nhóm ${idx + 1}`,
        members: mList.map(m => ({ id: m.id, name: m.name, team: m.team, sbd: m.sbd }))
      }))
    };

    renderMissionTeamsUI();
    AudioEngine.playPositive();
    Confetti.burst();
    showToast(`🎲 Đã chia thành công ${count} nhóm cho "${escapeHtml(missionTitle)}"! Sẵn sàng thảo luận & chấm điểm rã XP.`, 'success');
  }

  function renderMissionTeamsUI() {
    const resultGrid = document.getElementById('generated-teams-result');
    if (!resultGrid || !currentGeneratedTeams) return;

    resultGrid.innerHTML = currentGeneratedTeams.map((mList, idx) => {
      const gScore = currentMissionGroupScores[idx] || 0;
      const scoreBadgeClass = gScore > 0 ? 'pos' : (gScore < 0 ? 'neg' : '');

      return `
        <div class="generated-team-box" data-group-index="${idx}">
          <div class="team-box-header">
            <div>
              <strong>Nhóm ${idx + 1}</strong>
              <small class="text-muted" style="display: block; font-size: 0.72rem;">${mList.length} thành viên</small>
            </div>
            <span id="group-score-display-${idx}" class="group-score-badge ${scoreBadgeClass}">
              ${gScore > 0 ? '+' : ''}${gScore} XP
            </span>
          </div>

          <div class="team-box-pts-row">
            <span class="team-box-pts-lbl">Chấm nhóm:</span>
            <button class="btn-group-pts" data-group-action="award" data-gidx="${idx}" data-pts="1" type="button" title="Tự động rã +1 XP về từng bạn trong nhóm">+1</button>
            <button class="btn-group-pts" data-group-action="award" data-gidx="${idx}" data-pts="2" type="button" title="Tự động rã +2 XP về từng bạn trong nhóm">+2</button>
            <button class="btn-group-pts" data-group-action="award" data-gidx="${idx}" data-pts="5" type="button" title="Tự động rã +5 XP xuất sắc về từng bạn">+5</button>
            <button class="btn-group-pts minus" data-group-action="award" data-gidx="${idx}" data-pts="-1" type="button" title="Trừ 1 XP nhắc nhở cả nhóm">-1</button>
          </div>

          <ul class="team-members-list">
            ${mList.map(m => `
              <li class="mission-member-item">
                <div class="member-name-wrap">
                  <strong>${escapeHtml(m.name)}</strong>
                  <span class="stt-tag sbd-badge small">SBD: ${m.sbd || ''}</span>
                  <small class="text-muted">(Tổ ${m.team})</small>
                </div>
                <div class="member-quick-pts">
                  <button class="btn-mini-pt plus" data-action="member-pt" data-id="${m.id}" data-gidx="${idx}" data-pts="1" type="button" title="Thưởng riêng +1 XP cho em này">+1</button>
                  <button class="btn-mini-pt minus" data-action="member-pt" data-id="${m.id}" data-gidx="${idx}" data-pts="-1" type="button" title="Trừ riêng 1 XP em này">-1</button>
                  <button class="btn-move-student" data-id="${m.id}" data-current-gidx="${idx}" type="button" title="Chuyển bạn này sang nhóm khác">⇄</button>
                </div>
              </li>
            `).join('')}
          </ul>
        </div>
      `;
    }).join('');
  }

  function generateTeams() {
    generateMissionTeams();
  }

  function saveCurrentMission() {
    if (!currentMissionData) {
      showToast('⚠️ Vui lòng phân nhóm nhiệm vụ trước khi lưu.', 'warning');
      return;
    }
    const cls = getCurrentClass();
    if (!cls.missions) cls.missions = [];

    // Cập nhật điểm đã cộng
    currentMissionData.groupScores = { ...currentMissionGroupScores };
    cls.missions.unshift(JSON.parse(JSON.stringify(currentMissionData)));
    saveState();
    updateMissionsCount();
    showToast(`✅ Đã lưu nhiệm vụ "${escapeHtml(currentMissionData.title)}" vào sổ nhiệm vụ học kỳ!`, 'success');
  }

  function updateMissionsCount() {
    const cls = getCurrentClass();
    const countEl = document.getElementById('mission-history-count');
    if (countEl) countEl.textContent = (cls.missions || []).length;
  }

  function openMissionsHistoryModal() {
    const cls = getCurrentClass();
    const nameEl = document.getElementById('mission-history-class-name');
    if (nameEl) nameEl.textContent = cls.name;

    const container = document.getElementById('missions-history-container');
    if (!container) return;

    const list = cls.missions || [];
    if (list.length === 0) {
      container.innerHTML = '<p class="text-muted text-center p-4">Chưa có nhiệm vụ học tập nào được lưu trong học kỳ này.</p>';
    } else {
      container.innerHTML = list.map((m, mIdx) => {
        return `
          <div class="mission-history-card">
            <div>
              <strong>🎯 ${escapeHtml(m.title || 'Nhiệm vụ')}</strong>
              <div class="mission-history-meta">
                <span>🗓️ ${m.date || ''} ${m.time || ''}</span> • 
                <span>${m.semester === 'hk2' ? '🌸 HK II' : '🍂 HK I'}</span> • 
                <span>${m.groupCount || (m.teams && m.teams.length) || 0} Nhóm</span>
              </div>
            </div>
            <div style="display: flex; gap: 8px; align-items: center;">
              <button class="btn-sub-action btn-restore-mission" data-idx="${mIdx}" type="button">
                👁️ Mở Lại Nhóm
              </button>
            </div>
          </div>
        `;
      }).join('');

      container.querySelectorAll('.btn-restore-mission').forEach(btn => {
        btn.addEventListener('click', () => {
          const idx = parseInt(btn.dataset.idx, 10);
          const mission = list[idx];
          if (mission && mission.teams) {
            currentGeneratedTeams = mission.teams.map(t => t.members || []);
            currentMissionGroupScores = mission.groupScores || {};
            currentMissionData = mission;
            document.getElementById('mission-title-input').value = mission.title || '';
            renderMissionTeamsUI();
            closeModal('modal-missions-history');
            showToast(`👁️ Đã mở lại nhóm của nhiệm vụ "${escapeHtml(mission.title)}"`, 'info');
          }
        });
      });
    }

    openModal('modal-missions-history');
  }

  // ==========================================
  // 11. LEADERBOARD & PODIUM
  // ==========================================
  function renderLeaderboard() {
    const cls = getCurrentClass();
    const sorted = [...cls.students].sort((a, b) => getStudentPoints(b) - getStudentPoints(a));

    // Bục Top 3
    const podiumEl = document.getElementById('podium-wrapper');
    if (podiumEl && sorted.length >= 3) {
      const top1 = sorted[0];
      const top2 = sorted[1];
      const top3 = sorted[2];

      podiumEl.innerHTML = `
        <div class="podium-slot rank-2">
          <div class="podium-user-info">
            <div class="podium-avatar">🥈</div>
            <div class="podium-name">${escapeHtml(top2.name)}</div>
            <div class="podium-points">${getStudentPoints(top2)} XP • Tổ ${top2.team}</div>
          </div>
          <div class="podium-pillar">2</div>
        </div>

        <div class="podium-slot rank-1">
          <div class="podium-user-info">
            <div class="podium-avatar">
              <span class="podium-crown">👑</span>
              🥇
            </div>
            <div class="podium-name">${escapeHtml(top1.name)}</div>
            <div class="podium-points">${getStudentPoints(top1)} XP • Tổ ${top1.team}</div>
          </div>
          <div class="podium-pillar">1</div>
        </div>

        <div class="podium-slot rank-3">
          <div class="podium-user-info">
            <div class="podium-avatar">🥉</div>
            <div class="podium-name">${escapeHtml(top3.name)}</div>
            <div class="podium-points">${getStudentPoints(top3)} XP • Tổ ${top3.team}</div>
          </div>
          <div class="podium-pillar">3</div>
        </div>
      `;
    }

    // Bảng cá nhân
    const tbody = document.getElementById('leaderboard-tbody');
    if (tbody) {
      tbody.innerHTML = sorted.map((s, idx) => {
        let badge = '';
        if (idx === 0) badge = '<span class="rank-badge">👑 Vua Xung Phong</span>';
        else if (idx === 1) badge = '<span class="rank-badge">⚡ Chiến Thần</span>';
        else if (idx === 2) badge = '<span class="rank-badge">🌟 Siêu Trí Tuệ</span>';
        else if (s.points >= 15) badge = '<span class="rank-badge">🔥 Tích Cực</span>';

        return `
          <tr>
            <td style="font-family: var(--font-display); font-weight: 800;">${idx + 1}</td>
            <td><strong>${escapeHtml(s.name)}</strong></td>
            <td><span class="team-tag">Tổ ${s.team}</span></td>
            <td><strong style="color: var(--accent-dark); font-size: 1.1rem;">${s.points} XP</strong></td>
            <td>${badge}</td>
            <td>
              <button class="btn-text-small" data-view-history="${s.id}">Xem nhật ký</button>
            </td>
          </tr>
        `;
      }).join('');
    }

    // Điểm thi đua giữa các tổ
    const teamTotals = { 1: 0, 2: 0, 3: 0, 4: 0 };
    cls.students.forEach(s => {
      const t = s.team || 1;
      teamTotals[t] = (teamTotals[t] || 0) + s.points;
    });

    const teamsListEl = document.getElementById('teams-leaderboard-list');
    if (teamsListEl) {
      const sortedTeams = Object.keys(teamTotals)
        .map(t => ({ team: t, points: teamTotals[t] }))
        .sort((a, b) => b.points - a.points);

      teamsListEl.innerHTML = sortedTeams.map((t, idx) => `
        <div class="team-rank-item">
          <div class="team-rank-info">
            <span class="team-rank-badge">${idx + 1}</span>
            <div>
              <strong>Tổ ${t.team}</strong>
              <small class="text-muted" style="display: block;">Tổng điểm: ${t.points} XP</small>
            </div>
          </div>
          <div class="team-rank-points">${t.points} XP</div>
        </div>
      `).join('');
    }
  }

  // ==========================================
  // 12. XUẤT EXCEL SỔ ĐIỂM (CSV UTF-8 BOM)
  // ==========================================
  function exportGradebookCSV() {
    const cls = getCurrentClass();
    const customCols = cls.customColumns || [];
    
    let headers = ['STT', 'Họ và tên', 'Tổ', 'SBD', 'ĐGTX 1', 'ĐGTX 2', 'ĐGTX 3', 'ĐGTX 4', 'ĐGTX 5', 'Thái độ', 'Giữa kỳ (x2)', 'Cuối kỳ (x3)'];
    customCols.forEach(c => {
      headers.push(`"${c.name} (HS ${c.weight})"`);
    });
    headers.push('ĐTB Môn', 'Xếp loại TT22', 'Điểm thưởng (XP)');

    let csv = '\uFEFF' + headers.join(',') + '\n';
    cls.students.forEach((s, idx) => {
      const avg = calculateStudentAverage(s) || '';
      let rank = '';
      if (avg !== '') {
        const val = parseFloat(avg);
        if (val >= 8.0) rank = 'Tốt';
        else if (val >= 6.5) rank = 'Khá';
        else if (val >= 5.0) rank = 'Đạt';
        else rank = 'Chưa đạt';
      }

      let row = [
        idx + 1,
        `"${s.name}"`,
        s.team,
        `"${s.sbd || ''}"`,
        s.dgtx1 ?? '',
        s.dgtx2 ?? '',
        s.dgtx3 ?? '',
        s.dgtx4 ?? '',
        s.dgtx5 ?? '',
        s.attitude ?? '',
        s.giuaKy ?? '',
        s.cuoiKy ?? ''
      ];

      customCols.forEach(c => {
        const customVal = (s.customGrades && s.customGrades[c.id] !== undefined) ? s.customGrades[c.id] : '';
        row.push(customVal);
      });

      row.push(avg, `"${rank}"`, s.points);
      csv += row.join(',') + '\n';
    });

    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = `So_Diem_${cls.name.replace(/\s+/g, '_')}_TT22.csv`;
    link.click();
    URL.revokeObjectURL(url);
  }

  // ==========================================
  // 13. XỬ LÝ SỰ KIỆN TOÀN CỤC

  // ==========================================
  // CHUYỂN TAB PHÂN HỆ VỚI DROPDOWN THÔNG MINH
  // ==========================================
  function switchTab(targetId) {
    if (!targetId) return;

    // 1. Kích hoạt Tab Pane
    document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));
    const targetPane = document.getElementById(targetId);
    if (targetPane) targetPane.classList.add('active');

    // 2. Kích hoạt nút Dropdown Item & Nav Tab Button & Direct Header Button
    document.querySelectorAll('.nav-drop-item, .nav-tab-btn, .nav-direct-header-btn, #quick-nav-ribbon .nav-tab-btn').forEach(btn => {
      if (btn.dataset.tab === targetId) {
        btn.classList.add('active');
      } else {
        btn.classList.remove('active');
      }
    });

    // 3. Phân nhóm Dropdown & cập nhật icon/label trigger
    const groupMap = {
      'tab-classroom': { group: 'grade', icon: '👥', label: 'Điểm Nhanh' },
      'tab-missions': { group: 'grade', icon: '🎯', label: 'Nhiệm Vụ & Nhóm' },
      'tab-seating': { group: 'grade', icon: '🪑', label: 'Sơ Đồ Bàn Học' },
      'tab-gradebook': { group: 'grade', icon: '📊', label: 'Sổ Điểm (TT22)' },
      'tab-wheel': { group: 'tools', icon: '🎡', label: 'Vòng Quay' },
      'tab-tools': { group: 'tools', icon: '⏱️', label: 'Timer & Nhóm' },
      'tab-leaderboard': { group: 'tools', icon: '🏆', label: 'Vinh Danh' },
      'tab-khbd': { group: 'tools', icon: '📅', label: 'KHBD & Sổ Ký' },
      'tab-admin': { group: 'admin', icon: '🛠️', label: 'Quản Trị' },
      'tab-guide': { group: 'admin', icon: '📖', label: 'HDSD & Mẹo' }
    };

    const info = groupMap[targetId];
    if (info) {
      document.querySelectorAll('.nav-drop-trigger').forEach(trig => trig.classList.remove('active'));
      const activeTrigger = document.getElementById(`trigger-group-${info.group}`);
      if (activeTrigger) {
        activeTrigger.classList.add('active');
        const iconEl = activeTrigger.querySelector('.tab-icon');
        const labelEl = activeTrigger.querySelector('.trigger-label');
        if (iconEl) iconEl.textContent = info.icon;
        if (labelEl) labelEl.textContent = info.label;
      }
    }

    // Đóng panel dropdown
    document.querySelectorAll('.nav-drop-group').forEach(g => g.classList.remove('open'));

    // 4. Kích hoạt logic tương ứng từng tab
    if (targetId === 'tab-missions') {
      renderMissionsTab();
    } else if (targetId === 'tab-wheel') {
      updateWheelStudents();
      drawWheel();
    } else if (targetId === 'tab-seating') {
      renderSeatingChart();
    } else if (targetId === 'tab-gradebook') {
      renderGradebookTab();
    } else if (targetId === 'tab-leaderboard') {
      renderLeaderboard();
    } else if (targetId === 'tab-khbd') {
      renderKHBD();
    } else if (targetId === 'tab-admin') {
      renderAdminTab();
    } else if (targetId === 'tab-classroom') {
      renderClassroomTab();
    }
  }


  // ==========================================
  // QUẢN LÝ & PHÂN TỔ HỌC TẬP (TEAM ASSIGNMENT)
  // ==========================================
  function renderAssignTeamsModal() {
    const cls = getCurrentClass();
    const nameEl = document.getElementById('assign-teams-class-name');
    if (nameEl) nameEl.textContent = cls.name;

    const statsContainer = document.getElementById('team-summary-stats');
    const container = document.getElementById('assign-teams-list');
    const searchVal = (document.getElementById('assign-teams-search')?.value || '').toLowerCase().trim();

    // Thống kê sĩ số 4 tổ
    const tCounts = [0, 0, 0, 0];
    cls.students.forEach(s => {
      const t = Number(s.team) || 1;
      if (t >= 1 && t <= 4) tCounts[t - 1]++;
    });

    if (statsContainer) {
      statsContainer.innerHTML = `
        <span class="team-stat-badge t1">Tổ 1: <strong>${tCounts[0]}</strong> bạn</span>
        <span class="team-stat-badge t2">Tổ 2: <strong>${tCounts[1]}</strong> bạn</span>
        <span class="team-stat-badge t3">Tổ 3: <strong>${tCounts[2]}</strong> bạn</span>
        <span class="team-stat-badge t4">Tổ 4: <strong>${tCounts[3]}</strong> bạn</span>
      `;
    }

    if (!container) return;
    const filtered = cls.students.filter(s => !searchVal || s.name.toLowerCase().includes(searchVal));

    container.innerHTML = filtered.map((s, idx) => `
      <div class="assign-stu-row" data-id="${s.id}">
        <div class="assign-stu-info">
          <span class="stt-tag">#${String(idx + 1).padStart(2, '0')}</span>
          <span class="assign-stu-name">${escapeHtml(s.name)}</span>
        </div>
        <div class="team-selector-pills" data-id="${s.id}">
          <button class="team-pick-btn ${(s.team || 1) === 1 ? 'active' : ''}" data-pick-team="1" type="button">Tổ 1</button>
          <button class="team-pick-btn ${(s.team || 1) === 2 ? 'active' : ''}" data-pick-team="2" type="button">Tổ 2</button>
          <button class="team-pick-btn ${(s.team || 1) === 3 ? 'active' : ''}" data-pick-team="3" type="button">Tổ 3</button>
          <button class="team-pick-btn ${(s.team || 1) === 4 ? 'active' : ''}" data-pick-team="4" type="button">Tổ 4</button>
        </div>
      </div>
    `).join('');
  }

  function initAssignTeamsEvents() {
    // Nút mở modal Phân Tổ
    document.getElementById('btn-assign-teams')?.addEventListener('click', () => {
      openModal('modal-assign-teams');
      renderAssignTeamsModal();
    });

    // Tìm kiếm trong modal phân tổ
    document.getElementById('assign-teams-search')?.addEventListener('input', renderAssignTeamsModal);

    // Lắng nghe click chọn tổ cho từng bạn trong modal
    document.getElementById('assign-teams-list')?.addEventListener('click', (e) => {
      const btn = e.target.closest('[data-pick-team]');
      if (!btn) return;
      const newTeam = parseInt(btn.dataset.pickTeam, 10);
      const row = btn.closest('.assign-stu-row');
      if (!row) return;
      const stuId = row.dataset.id;
      const cls = getCurrentClass();
      const stu = cls.students.find(s => s.id === stuId);
      if (stu) {
        stu.team = newTeam;
        row.querySelectorAll('.team-pick-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        renderAssignTeamsModal();
      }
    });

    // 3 Nút chia nhanh
    document.getElementById('btn-quick-split-alternate')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      cls.students.forEach((s, idx) => {
        s.team = (idx % 4) + 1;
      });
      renderAssignTeamsModal();
      showToast('Đã chia xen kẽ 1-2-3-4 cho cả lớp!', 'info');
    });

    document.getElementById('btn-quick-split-blocks')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      const total = cls.students.length;
      const chunkSize = Math.ceil(total / 4);
      cls.students.forEach((s, idx) => {
        s.team = Math.min(4, Math.floor(idx / chunkSize) + 1);
      });
      renderAssignTeamsModal();
      showToast('Đã chia 4 tổ theo khối STT!', 'info');
    });

    document.getElementById('btn-quick-split-random')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      const shuffled = [...cls.students].sort(() => Math.random() - 0.5);
      shuffled.forEach((s, idx) => {
        s.team = (idx % 4) + 1;
      });
      renderAssignTeamsModal();
      showToast('Đã trộn ngẫu nhiên 4 tổ đều quân số!', 'info');
    });

    // Nút Lưu cập nhật tổ
    document.getElementById('btn-save-assign-teams')?.addEventListener('click', () => {
      saveState();
      renderClassroomTab();
      renderSeatingChart();
      closeModal('modal-assign-teams');
      showToast('✅ Đã lưu phân tổ lớp thành công!', 'success');
    });

    // Lắng nghe nút đổi tổ nhanh trong Batch Mode
    document.querySelectorAll('.btn-batch-change-team').forEach(btn => {
      btn.addEventListener('click', () => {
        const targetTeam = parseInt(btn.dataset.team, 10);
        if (selectedStudentIds.size === 0) {
          showToast('Thầy hãy tick chọn ít nhất 1 học sinh!', 'warning');
          return;
        }
        const cls = getCurrentClass();
        let count = 0;
        cls.students.forEach(s => {
          if (selectedStudentIds.has(s.id)) {
            s.team = targetTeam;
            count++;
          }
        });
        saveState();
        renderClassroomTab();
        renderSeatingChart();
        showToast(`Đã chuyển ${count} bạn sang Tổ ${targetTeam}!`, 'success');
      });
    });

    // Lắng nghe click cộng điểm nhóm & tự rã điểm XP về từng em
    document.getElementById('generated-teams-result')?.addEventListener('click', (e) => {
      // 1. Chấm điểm cả nhóm
      const groupBtn = e.target.closest('[data-group-action="award"]');
      if (groupBtn) {
        const gIdx = parseInt(groupBtn.dataset.gidx, 10);
        const pts = parseInt(groupBtn.dataset.pts, 10);
        const missionTitle = (document.getElementById('mission-title-input')?.value || 'Hoạt động nhóm').trim();
        const reason = `[${missionTitle}] - Nhóm ${gIdx + 1}`;

        if (currentGeneratedTeams && currentGeneratedTeams[gIdx]) {
          const members = currentGeneratedTeams[gIdx];
          members.forEach(m => {
            adjustStudentPoints(m.id, pts, reason);
          });

          // Cập nhật điểm tích lũy của nhóm
          currentMissionGroupScores[gIdx] = (currentMissionGroupScores[gIdx] || 0) + pts;
          const scoreBadge = document.getElementById(`group-score-display-${gIdx}`);
          if (scoreBadge) {
            const tot = currentMissionGroupScores[gIdx];
            scoreBadge.textContent = `${tot > 0 ? '+' : ''}${tot} XP`;
            scoreBadge.className = `group-score-badge ${tot > 0 ? 'pos' : (tot < 0 ? 'neg' : '')}`;
          }

          if (pts > 0) {
            AudioEngine.playPositive();
            Confetti.burst();
          } else {
            AudioEngine.playNegative();
          }
          showToast(`⚡ Đã tự động rã ${pts > 0 ? '+' + pts : pts} XP về cho ${members.length} bạn trong Nhóm ${gIdx + 1}!`, pts > 0 ? 'success' : 'warning');
        }
        return;
      }

      // 2. Chấm điểm riêng cho 1 em trong nhóm
      const memberBtn = e.target.closest('[data-action="member-pt"]');
      if (memberBtn) {
        const mId = memberBtn.dataset.id;
        const gIdx = parseInt(memberBtn.dataset.gidx, 10);
        const pts = parseInt(memberBtn.dataset.pts, 10);
        const missionTitle = (document.getElementById('mission-title-input')?.value || 'Hoạt động nhóm').trim();
        const reason = `[${missionTitle} - Nhóm ${gIdx + 1}] Cá nhân tích cực`;
        adjustStudentPoints(mId, pts, reason);
      }
    });

    // Mẫu nhanh tên nhiệm vụ
    document.querySelectorAll('.mission-preset-pill').forEach(pill => {
      pill.addEventListener('click', () => {
        const name = pill.dataset.name;
        const input = document.getElementById('mission-title-input');
        if (input && name) {
          input.value = `Nhiệm vụ: ${name}`;
          showToast(`Đã chọn mẫu: ${name}`, 'info');
        }
      });
    });

    // Nút Lưu nhiệm vụ & Xem lịch sử nhiệm vụ
    document.getElementById('btn-save-current-mission')?.addEventListener('click', saveCurrentMission);
    document.getElementById('btn-view-missions-history')?.addEventListener('click', openMissionsHistoryModal);

    // Nút [Nhiệm Vụ Nhóm] trên toolbar Tab 1
    document.getElementById('btn-open-missions')?.addEventListener('click', () => {
      document.querySelector('[data-tab="tools"]')?.click();
      setTimeout(() => {
        document.getElementById('mission-title-input')?.focus();
      }, 200);
    });
  }

  // ==========================================
  
  // ==========================================
  // BAN CÁN SỰ & PHÂN QUYỀN ĐA GMAIL (OFFICERS)
  // ==========================================
  function getMonitorOfficers(cls) {
    if (!cls) return [];
    if (Array.isArray(cls.monitorEmails) && cls.monitorEmails.length > 0) {
      return cls.monitorEmails.map(item => {
        if (typeof item === 'string') return { email: item.toLowerCase().trim(), role: 'Lớp Trưởng' };
        return { email: (item.email || '').toLowerCase().trim(), role: item.role || 'Cán Sự' };
      }).filter(o => o.email);
    }
    const raw = cls.monitorEmail || '';
    if (!raw.trim()) return [];
    return raw.split(/[,;\s\n]+/)
      .map(e => e.toLowerCase().trim())
      .filter(Boolean)
      .map(e => ({ email: e, role: 'Lớp Trưởng' }));
  }

  function getMonitorEmailsList(cls) {
    return getMonitorOfficers(cls).map(o => o.email);
  }

  let activeOfficersClassId = null;

  function renderOfficersModal(classId) {
    activeOfficersClassId = classId || activeOfficersClassId || appState.currentClassId;
    const targetCls = appState.classes.find(c => c.id === activeOfficersClassId) || getCurrentClass();
    if (!targetCls) return;
    activeOfficersClassId = targetCls.id;

    // 1. Render class tabs
    const tabsContainer = document.getElementById('officers-class-tabs');
    if (tabsContainer) {
      tabsContainer.innerHTML = appState.classes.map(c => {
        const offList = getMonitorOfficers(c);
        const isActive = c.id === activeOfficersClassId;
        return `
          <button class="officers-tab-btn ${isActive ? 'active' : ''}" data-officers-class-id="${c.id}" type="button">
            🏫 ${escapeHtml(c.name)}
            <span class="officers-tab-badge">${offList.length} cán sự</span>
          </button>
        `;
      }).join('');
    }

    // 2. Update target class header card
    const nameEl = document.getElementById('officers-target-class-name');
    const badgeEl = document.getElementById('officers-target-class-badge');
    const countBadgeEl = document.getElementById('officers-target-count-badge');
    const officers = getMonitorOfficers(targetCls);

    if (nameEl) nameEl.textContent = targetCls.name;
    if (badgeEl) badgeEl.textContent = `${targetCls.students.length} học sinh`;
    if (countBadgeEl) countBadgeEl.textContent = `${officers.length} cán sự`;

    // 3. Render officer chips
    const chipsContainer = document.getElementById('officers-chips-container');
    if (chipsContainer) {
      if (officers.length === 0) {
        chipsContainer.innerHTML = `
          <div class="empty-officers-notice">
            Chưa có Gmail cán sự nào được gán cho ${escapeHtml(targetCls.name)}. Thầy hãy nhập Gmail bên dưới để cấp quyền cho Lớp trưởng / Lớp phó!
          </div>
        `;
      } else {
        chipsContainer.innerHTML = officers.map(o => `
          <div class="officer-chip">
            <span class="officer-role-badge">${escapeHtml(o.role)}</span>
            <span class="officer-email-text">${escapeHtml(o.email)}</span>
            <button class="officer-remove-btn" data-remove-officer-email="${escapeHtml(o.email)}" type="button" title="Thu hồi quyền của ${escapeHtml(o.email)}">&times;</button>
          </div>
        `).join('');
      }
    }
  }

  function initOfficersEvents() {
    // Mở modal từ Toolbar hoặc Header
    document.getElementById('btn-open-officers-modal')?.addEventListener('click', () => {
      openModal('modal-class-officers');
      renderOfficersModal(appState.currentClassId);
    });
    document.getElementById('btn-header-officers')?.addEventListener('click', () => {
      openModal('modal-class-officers');
      renderOfficersModal(appState.currentClassId);
    });

    // Chuyển tab lớp trong modal
    document.getElementById('officers-class-tabs')?.addEventListener('click', (e) => {
      const btn = e.target.closest('[data-officers-class-id]');
      if (!btn) return;
      renderOfficersModal(btn.dataset.officersClassId);
    });

    // Thêm cán sự đơn lẻ
    document.getElementById('btn-add-single-officer')?.addEventListener('click', () => {
      const emailInput = document.getElementById('officer-new-email');
      const roleSelect = document.getElementById('officer-new-role');
      if (!emailInput || !roleSelect) return;

      const email = emailInput.value.trim().toLowerCase();
      const role = roleSelect.value;
      if (!email || !email.includes('@')) {
        showToast('Vui lòng nhập địa chỉ Gmail hợp lệ (có đuôi @gmail.com)!', 'warning');
        emailInput.focus();
        return;
      }

      const targetCls = appState.classes.find(c => c.id === activeOfficersClassId) || getCurrentClass();
      if (!targetCls) return;

      targetCls.monitorEmails = getMonitorOfficers(targetCls);
      if (targetCls.monitorEmails.some(o => o.email === email)) {
        showToast('Email này đã được cấp quyền trong lớp rồi Thầy nhé!', 'warning');
        return;
      }

      targetCls.monitorEmails.push({ email, role, addedAt: new Date().toISOString() });
      targetCls.monitorEmail = targetCls.monitorEmails.map(o => o.email).join(', ');
      saveState();
      emailInput.value = '';
      renderOfficersModal(targetCls.id);
      renderAdminTab();
      showToast(`Đã cấp quyền ${role} cho: ${email}`, 'success');
    });

    // Cho phép bấm Enter trong ô nhập email
    document.getElementById('officer-new-email')?.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        e.preventDefault();
        document.getElementById('btn-add-single-officer')?.click();
      }
    });

    // Xóa cán sự
    document.getElementById('officers-chips-container')?.addEventListener('click', (e) => {
      const btn = e.target.closest('[data-remove-officer-email]');
      if (!btn) return;
      const targetEmail = btn.dataset.removeOfficerEmail.toLowerCase();
      const targetCls = appState.classes.find(c => c.id === activeOfficersClassId) || getCurrentClass();
      if (!targetCls) return;

      const current = getMonitorOfficers(targetCls);
      targetCls.monitorEmails = current.filter(o => o.email !== targetEmail);
      targetCls.monitorEmail = targetCls.monitorEmails.map(o => o.email).join(', ');
      saveState();
      renderOfficersModal(targetCls.id);
      renderAdminTab();
      showToast(`Đã thu hồi quyền của ${targetEmail}`, 'info');
    });

    // Toggle Batch Paste
    document.getElementById('btn-toggle-batch-paste')?.addEventListener('click', () => {
      const box = document.getElementById('officers-batch-paste-box');
      if (box) {
        box.style.display = box.style.display === 'none' ? 'block' : 'none';
      }
    });
    document.getElementById('btn-cancel-batch-paste')?.addEventListener('click', () => {
      const box = document.getElementById('officers-batch-paste-box');
      if (box) box.style.display = 'none';
    });

    // Nạp hàng loạt email
    document.getElementById('btn-apply-batch-paste')?.addEventListener('click', () => {
      const textarea = document.getElementById('officers-batch-emails');
      if (!textarea) return;
      const rawText = textarea.value;
      const emails = rawText.split(/[,;\s\n]+/).map(e => e.toLowerCase().trim()).filter(e => e.includes('@'));
      if (emails.length === 0) {
        showToast('Không tìm thấy địa chỉ email hợp lệ nào!', 'warning');
        return;
      }

      const targetCls = appState.classes.find(c => c.id === activeOfficersClassId) || getCurrentClass();
      if (!targetCls) return;

      const current = getMonitorOfficers(targetCls);
      let count = 0;
      emails.forEach(e => {
        if (!current.some(o => o.email === e)) {
          current.push({ email: e, role: 'Cán Sự', addedAt: new Date().toISOString() });
          count++;
        }
      });

      targetCls.monitorEmails = current;
      targetCls.monitorEmail = current.map(o => o.email).join(', ');
      saveState();
      textarea.value = '';
      const box = document.getElementById('officers-batch-paste-box');
      if (box) box.style.display = 'none';
      renderOfficersModal(targetCls.id);
      renderAdminTab();
      showToast(`Đã thêm thành công ${count} Gmail cán sự cho ${targetCls.name}!`, 'success');
    });

    // Nút Lưu cấu hình
    document.getElementById('btn-save-officers')?.addEventListener('click', () => {
      saveState();
      renderAdminTab();
      renderClassRibbon();
      closeModal('modal-class-officers');
      showToast('✅ Đã lưu phân quyền Ban cán sự lớp thành công!', 'success');
    });

    // Nút Đồng bộ Cloud
    document.getElementById('btn-sync-officers-cloud')?.addEventListener('click', async () => {
      if (!supabaseClient) {
        showToast('Chưa kết nối Supabase Cloud. Thầy vui lòng bấm biểu tượng ☁️ để cấu hình!', 'warning');
        return;
      }
      try {
        const targetCls = appState.classes.find(c => c.id === activeOfficersClassId) || getCurrentClass();
        const emailsStr = getMonitorEmailsList(targetCls).join(', ');
        const { error } = await supabaseClient
          .from('classes')
          .update({ monitor_email: emailsStr || null })
          .eq('id', targetCls.id);

        if (error) throw error;
        showToast(`☁️ Đã đồng bộ quyền Ban cán sự ${targetCls.name} lên Cloud thành công!`, 'success');
      } catch (err) {
        showToast('Lỗi đồng bộ Cloud: ' + err.message, 'neg');
      }
    });
  }

  // ==============================================================================
  // NHẬT KÝ ĐỐI CHIẾU TOÀN DIỆN, XUẤT CSV & HỌC KỲ II AUTO CLEAN
  // ==============================================================================
  let activeAuditTab = 'all'; // 'all' hoặc 'student'
  let activeAuditStudentId = null;

  function openAuditModal(studentId = null) {
    const cls = getCurrentClass();
    const classNameEl = document.getElementById('audit-class-name');
    if (classNameEl) classNameEl.textContent = cls.name;

    if (studentId) {
      activeAuditStudentId = studentId;
      switchAuditTab('student');
    } else {
      switchAuditTab('all');
    }
    openModal('modal-history');
  }

  function switchAuditTab(tab) {
    activeAuditTab = tab;
    const tabAllBtn = document.getElementById('tab-audit-all');
    const tabStuBtn = document.getElementById('tab-audit-student');
    const viewAll = document.getElementById('audit-view-all');
    const viewStu = document.getElementById('audit-view-student');

    if (tab === 'all') {
      tabAllBtn?.classList.add('active');
      tabStuBtn?.classList.remove('active');
      if (viewAll) viewAll.style.display = 'block';
      if (viewStu) viewStu.style.display = 'none';
      renderAuditLog();
    } else {
      tabAllBtn?.classList.remove('active');
      tabStuBtn?.classList.add('active');
      if (viewAll) viewAll.style.display = 'none';
      if (viewStu) viewStu.style.display = 'block';
      if (activeAuditStudentId) {
        renderStudentTimeline(activeAuditStudentId);
      }
    }
  }

  function renderStudentTimeline(studentId) {
    const cls = getCurrentClass();
    const student = cls.students.find(s => s.id === studentId);
    const nameEl = document.getElementById('history-student-name');
    const timeline = document.getElementById('history-timeline');
    if (!student) {
      if (nameEl) nameEl.textContent = 'Chưa chọn em';
      if (timeline) timeline.innerHTML = '<p class="text-muted text-center p-3">Vui lòng chọn một học sinh để xem nhật ký cá nhân.</p>';
      return;
    }

    if (nameEl) nameEl.textContent = `${student.name} (Tổ ${student.team})`;
    if (!student.history || student.history.length === 0) {
      if (timeline) timeline.innerHTML = '<p class="text-muted text-center p-3">Chưa có nhật ký hoạt động nào của em này.</p>';
      return;
    }

    if (timeline) {
      timeline.innerHTML = student.history.map(h => `
        <div class="timeline-item" style="display: flex; justify-content: space-between; align-items: center; padding: 10px 0; border-bottom: 1px solid var(--border);">
          <div>
            <div style="font-weight: 700; font-size: 0.9rem;">${escapeHtml(h.reason || 'Hoạt động')}</div>
            <div style="font-size: 0.75rem; color: var(--text-muted); margin-top: 2px;">
              <span>${escapeHtml(h.date || '')} ${escapeHtml(h.time || '')}</span> • 
              <span>${h.semester === 'hk2' ? '🌸 HK II' : '🍂 HK I'}</span> • 
              <span>Người ghi: ${escapeHtml(h.actor || 'Hệ thống')}</span>
            </div>
          </div>
          <span style="font-weight: 800; font-family: var(--font-heading); font-size: 1rem; color: ${(h.points || 0) >= 0 ? '#10b981' : '#ef4444'};">
            ${(h.points || 0) > 0 ? '+' : ''}${h.points} XP
          </span>
        </div>
      `).join('');
    }
  }

  function renderAuditLog() {
    const cls = getCurrentClass();
    const query = (document.getElementById('audit-search-input')?.value || '').toLowerCase().trim();
    const teamFilter = document.getElementById('audit-filter-team')?.value || 'all';
    const typeFilter = document.getElementById('audit-filter-type')?.value || 'all';
    const semesterFilter = document.getElementById('audit-filter-semester')?.value || 'all';

    const classNameEl = document.getElementById('audit-class-name');
    if (classNameEl) classNameEl.textContent = cls.name;

    let logs = [];
    cls.students.forEach(s => {
      if (Array.isArray(s.history)) {
        s.history.forEach((h, idx) => {
          logs.push({
            ...h,
            studentId: s.id,
            studentName: s.name,
            team: s.team,
            sbd: s.sbd,
            logIdx: idx
          });
        });
      }
    });

    if (query) {
      logs = logs.filter(l => 
        (l.studentName && l.studentName.toLowerCase().includes(query)) ||
        (l.sbd && l.sbd.toLowerCase().includes(query)) ||
        (l.reason && l.reason.toLowerCase().includes(query)) ||
        (l.actor && l.actor.toLowerCase().includes(query))
      );
    }

    if (teamFilter !== 'all') {
      logs = logs.filter(l => l.team === parseInt(teamFilter, 10));
    }

    if (typeFilter === 'pos') {
      logs = logs.filter(l => (l.points || 0) > 0);
    } else if (typeFilter === 'neg') {
      logs = logs.filter(l => (l.points || 0) < 0);
    }

    if (semesterFilter !== 'all') {
      logs = logs.filter(l => (l.semester || 'hk1') === semesterFilter);
    }

    logs.sort((a, b) => (b.timestamp || 0) - (a.timestamp || 0));

    const countEl = document.getElementById('audit-log-count');
    if (countEl) countEl.textContent = logs.length;

    const tbody = document.getElementById('audit-tbody');
    if (!tbody) return;

    if (logs.length === 0) {
      tbody.innerHTML = '<tr><td colspan="6" style="text-align: center; padding: 28px; color: var(--text-muted); font-style: italic;">Không tìm thấy bản ghi đối chiếu nào phù hợp.</td></tr>';
      return;
    }

    tbody.innerHTML = logs.map(l => {
      const pts = l.points || 0;
      const ptsBadge = pts > 0 
        ? `<span class="audit-pts-badge pos">+${pts} XP</span>` 
        : `<span class="audit-pts-badge neg">${pts} XP</span>`;
      
      const isTeacherActor = l.actor && (l.actor.includes('nguyensangnhc') || l.actor.includes('sangbeau') || l.actor.includes('Thầy'));
      const isMonitorActor = l.actor && !isTeacherActor && l.actor !== 'Hệ thống';
      const actorIcon = isTeacherActor ? '👨‍🏫' : (isMonitorActor ? '👑' : '⚙️');

      return `
        <tr>
          <td style="font-size: 0.78rem; color: var(--text-muted); white-space: nowrap;">
            ${escapeHtml(l.date || '')} <strong style="color: var(--text-main);">${escapeHtml(l.time || '')}</strong>
          </td>
          <td>
            <a href="javascript:void(0)" class="audit-stu-link" data-id="${l.studentId}" style="font-weight: 700; color: var(--text-main); text-decoration: none;">
              ${escapeHtml(l.studentName)}
            </a>
            <small style="color: var(--text-muted); display: block; font-size: 0.72rem;">SBD: ${escapeHtml(l.sbd || '---')}</small>
          </td>
          <td><span class="team-tag">Tổ ${l.team || 1}</span></td>
          <td>${ptsBadge}</td>
          <td>
            <span>${escapeHtml(l.reason || 'Hoạt động')}</span>
            <small style="color: var(--text-muted); display: block; font-size: 0.7rem;">${l.semester === 'hk2' ? '🌸 HK II' : '🍂 HK I'}</small>
          </td>
          <td>
            <span class="audit-actor-badge" title="${escapeHtml(l.actor || 'Hệ thống')}">
              ${actorIcon} ${escapeHtml(l.actor || 'Hệ thống')}
            </span>
          </td>
        </tr>
      `;
    }).join('');

    tbody.querySelectorAll('.audit-stu-link').forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        activeAuditStudentId = link.dataset.id;
        switchAuditTab('student');
      });
    });
  }

  function exportAuditCsv() {
    const cls = getCurrentClass();
    let rows = [
      ['Thời Gian', 'Học Kỳ', 'Họ Và Tên', 'Tổ', 'SBD', 'Điểm Thay Đổi (XP)', 'Lý Do Chi Tiết', 'Người Chấm (Email/Vai trò)']
    ];

    cls.students.forEach(s => {
      if (Array.isArray(s.history)) {
        s.history.forEach(h => {
          rows.push([
            `${h.date || ''} ${h.time || ''}`,
            h.semester === 'hk2' ? 'Học Kỳ 2' : 'Học Kỳ 1',
            s.name,
            `Tổ ${s.team}`,
            s.sbd || '',
            `${h.points > 0 ? '+' : ''}${h.points || 0}`,
            h.reason || '',
            h.actor || 'Hệ thống'
          ]);
        });
      }
    });

    if (rows.length <= 1) {
      showToast('Chưa có lịch sử điểm nào trong lớp này để xuất file.', 'info');
      return;
    }

    const csvContent = '\uFEFF' + rows.map(r => r.map(cell => `"${String(cell).replace(/"/g, '""')}"`).join(',')).join('\n');
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `Nhat_Ky_Doi_Chieu_${cls.name}_${new Date().toISOString().slice(0, 10)}.csv`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
    showToast(`✅ Đã xuất nhật ký đối chiếu ${cls.name} ra file CSV thành công!`, 'success');
  }

  function rolloverToSemester2() {
    const cls = getCurrentClass();
    if (!confirm(`🌸 XÁC NHẬN CHUYỂN SANG HỌC KỲ II CHO ${cls.name}?\n\n- Toàn bộ điểm thi đua HK I sẽ được bảo toàn đóng băng an toàn.\n- Điểm thi đua HK II sẽ khởi tạo từ 0 XP để cả lớp cùng đua điểm mới.\n- Thầy và các em có thể bấm xem lại điểm HK I bất kỳ lúc nào.\n\nBạn có muốn tiếp tục?`)) {
      return;
    }

    cls.students.forEach(s => {
      if (s.points_hk1 === undefined) s.points_hk1 = s.points || 0;
      s.points_hk2 = 0;
    });

    appState.currentSemester = 'hk2';
    saveState();

    document.querySelectorAll('.btn-semester').forEach(b => {
      b.classList.toggle('active', b.dataset.semester === 'hk2');
    });

    renderClassroomTab();
    renderSeatingChart();
    renderGradebookTab();
    renderLeaderboard();
    renderClassStats();

    showToast(`🌸 Đã chuyển ${cls.name} sang Học Kỳ II thành công! Chúc các em thi đua tốt!`, 'success');
  }

  function cleanHistoryOlderThanOneYear() {
    const ONE_YEAR_MS = 365 * 24 * 3600 * 1000;
    const now = Date.now();
    let totalPurged = 0;

    appState.classes.forEach(c => {
      c.students.forEach(s => {
        if (Array.isArray(s.history)) {
          const before = s.history.length;
          s.history = s.history.filter(h => !h.timestamp || (now - h.timestamp) < ONE_YEAR_MS);
          totalPurged += (before - s.history.length);
        }
      });
    });

    saveState();
    if (totalPurged > 0) {
      showToast(`🧹 Đã dọn dẹp ${totalPurged} bản ghi nhật ký cũ hơn 365 ngày. Dung lượng database cực kỳ nhẹ (< 2MB)!`, 'success');
    } else {
      showToast('✨ Tất cả nhật ký đều thuộc niên khóa hiện tại (dưới 1 năm), không có dữ liệu dư thừa.', 'info');
    }
  }

  function openHistoryModal(studentId) {
    const cls = getCurrentClass();
    const student = cls.students.find(s => s.id === studentId);
    if (!student) return;

    document.getElementById('history-student-name').textContent = `${student.name} (Tổ ${student.team})`;
    const timeline = document.getElementById('history-timeline');
    if (timeline) {
      if (!student.history || student.history.length === 0) {
        timeline.innerHTML = '<p class="text-muted text-center p-3">Chưa có nhật ký hoạt động nào.</p>';
      } else {
        timeline.innerHTML = student.history.map(h => `
          <div class="timeline-item" style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid var(--border);">
            <div>
              <strong>${escapeHtml(h.reason || 'Hoạt động')}</strong>
              <small class="text-muted" style="display: block; font-size: 0.75rem;">${escapeHtml(h.date || '')} ${escapeHtml(h.time || '')}</small>
            </div>
            <span style="font-weight: 800; color: ${h.points >= 0 ? '#10b981' : '#ef4444'};">
              ${h.points > 0 ? '+' : ''}${h.points} XP
            </span>
          </div>
        `).join('');
      }
    }
    openModal('modal-history');
  }

  function initEventListeners() {
    initAssignTeamsEvents();
    initOfficersEvents();
    // 1. Chuyển lớp từ Dropdown hoặc Quick Pills
    function handleClassChange(targetClassId) {
      if (!targetClassId) return;
      if (userRole === 'monitor' && targetClassId !== monitorClassId) {
        showToast('Lớp trưởng chỉ được truy cập lớp được phân công!', 'warning');
        return;
      }
      appState.currentClassId = targetClassId;
      selectedStudentIds.clear();
      calledStudents.clear();
      saveState();
      document.getElementById('class-dropdown-wrap')?.classList.remove('open');
      renderClassRibbon();
      renderClassroomTab();
      renderSeatingChart();
      renderGradebookTab();
      updateWheelStudents();
      drawWheel();
      renderLeaderboard();
      updateCalledListUI();
      syncKhbdWithClass();
      showToast(`Đã chuyển sang ${getCurrentClass().name}`, 'info');
    }

    // Toggle dropdown lớp
    document.getElementById('btn-class-dropdown')?.addEventListener('click', (e) => {
      e.stopPropagation();
      document.getElementById('class-dropdown-wrap')?.classList.toggle('open');
    });

    // Chọn lớp từ Dropdown Menu
    document.getElementById('class-dropdown-menu')?.addEventListener('click', (e) => {
      const item = e.target.closest('.class-dropdown-item');
      if (!item || item.id === 'btn-add-class-from-drop') return;
      handleClassChange(item.dataset.classId);
    });

    // Chọn lớp từ Quick Pills
    document.getElementById('class-pills-list')?.addEventListener('click', (e) => {
      const pill = e.target.closest('.class-pill, .quick-class-btn');
      if (!pill) return;
      handleClassChange(pill.dataset.classId);
    });

    document.getElementById('btn-add-class-ribbon')?.addEventListener('click', () => {
      openModal('modal-manage-classes');
    });

    // 2. Chuyển Tab phân hệ thông minh với Dropdown Menu
    document.querySelectorAll('.nav-drop-trigger').forEach(trig => {
      trig.addEventListener('click', (e) => {
        e.stopPropagation();
        const grp = trig.closest('.nav-drop-group');
        const wasOpen = grp?.classList.contains('open');
        document.querySelectorAll('.nav-drop-group').forEach(g => g.classList.remove('open'));
        if (!wasOpen && grp) grp.classList.add('open');
      });
    });

    document.querySelectorAll('.nav-drop-item, .nav-tab, .nav-tab-btn').forEach(item => {
      item.addEventListener('click', (e) => {
        e.stopPropagation();
        const targetId = item.dataset.tab;
        if (targetId) switchTab(targetId);
      });
    });

    // Đóng dropdown khi click ngoài
    document.addEventListener('click', (e) => {
      if (!e.target.closest('.nav-drop-group')) {
        document.querySelectorAll('.nav-drop-group').forEach(g => g.classList.remove('open'));
      }
      if (!e.target.closest('.class-dropdown-wrap')) {
        document.getElementById('class-dropdown-wrap')?.classList.remove('open');
      }
    });

    // 3. Lọc theo tổ & tìm kiếm
    document.getElementById('team-filter-buttons')?.addEventListener('click', (e) => {
      const btn = e.target.closest('.filter-pill, .btn-pill');
      if (!btn) return;
      document.querySelectorAll('#team-filter-buttons .filter-pill, #team-filter-buttons .btn-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      renderClassroomTab();
    });

    document.getElementById('student-search-input')?.addEventListener('input', renderClassroomTab);

    // 4. Chế độ chọn nhiều (Batch Mode) & Thêm học sinh nhanh
    document.getElementById('btn-batch-select')?.addEventListener('click', () => {
      isBatchMode = !isBatchMode;
      const bar = document.getElementById('batch-action-bar');
      const btn = document.getElementById('btn-batch-select');
      if (isBatchMode) {
        if (bar) bar.style.display = 'flex';
        if (btn) btn.classList.add('active');
      } else {
        if (bar) bar.style.display = 'none';
        if (btn) btn.classList.remove('active');
        selectedStudentIds.clear();
      }
      updateBatchUI();
      renderClassroomTab();
    });

    document.getElementById('btn-cancel-batch')?.addEventListener('click', () => {
      isBatchMode = false;
      const bar = document.getElementById('batch-action-bar');
      const btn = document.getElementById('btn-batch-select');
      if (bar) bar.style.display = 'none';
      if (btn) btn.classList.remove('active');
      selectedStudentIds.clear();
      renderClassroomTab();
    });

    document.querySelectorAll('#batch-action-bar .batch-buttons button[data-pts]').forEach(btn => {
      btn.addEventListener('click', () => {
        const pts = parseInt(btn.dataset.pts, 10);
        if (selectedStudentIds.size === 0) {
          alert('Thầy hãy chọn ít nhất 1 học sinh!');
          return;
        }
        selectedStudentIds.forEach(id => {
          adjustStudentPoints(id, pts, pts > 0 ? 'Thưởng điểm nhóm' : 'Nhắc nhở nhóm');
        });
        selectedStudentIds.clear();
        isBatchMode = false;
        const bar = document.getElementById('batch-action-bar');
        if (bar) bar.style.display = 'none';
        document.getElementById('btn-batch-select')?.classList.remove('active');
        renderClassroomTab();
      });
    });

    function updateBatchUI() {
      const countEl = document.getElementById('selected-count');
      if (countEl) countEl.textContent = selectedStudentIds.size;
    }

    // Thêm học sinh nhanh
    document.getElementById('btn-quick-add-student')?.addEventListener('click', () => {
      const name = prompt('Nhập họ và tên học sinh mới:');
      if (!name || !name.trim()) return;
      const cls = getCurrentClass();
      const newId = 'stu_' + Date.now();
      const teamNum = (cls.students.length % 4) + 1;
      const sbd = generate6DigitSbd(cls.name, cls.students.length + 1);
      cls.students.push({
        id: newId,
        name: name.trim(),
        team: teamNum,
        sbd: sbd,
        points: 0,
        dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null,
        attitude: null,
        giuaKy: null, cuoiKy: null,
        customGrades: {},
        history: []
      });
      saveState();
      renderClassroomTab();
      renderSeatingChart();
      renderGradebookTab();
      renderLeaderboard();
      AudioEngine.playPositive();
      alert(`✅ Đã thêm em ${name.trim()} vào Tổ ${teamNum}!`);
    });

    // Điểm cả tổ (Team Reward)
    document.getElementById('btn-batch-team')?.addEventListener('click', () => {
      openModal('modal-team-score');
    });

    document.querySelectorAll('#modal-team-score .btn-reason-card').forEach(btn => {
      btn.addEventListener('click', () => {
        const teamSelect = document.getElementById('team-batch-select');
        const team = parseInt(teamSelect?.value || '1', 10);
        const pts = parseInt(btn.dataset.teamPts || '1', 10);
        const reason = btn.dataset.teamReason || 'Thưởng hoạt động tổ';

        const cls = getCurrentClass();
        const teamStudents = cls.students.filter(s => s.team === team);
        if (teamStudents.length === 0) {
          alert(`Tổ ${team} hiện chưa có học sinh nào!`);
          return;
        }

        teamStudents.forEach(s => {
          adjustStudentPoints(s.id, pts, reason);
        });

        closeModal('modal-team-score');
        AudioEngine.playFanfare();
        Confetti.burst();
        alert(`🎉 Đã cộng +${pts} điểm cho toàn bộ Tổ ${team} (${teamStudents.length} em)!`);
      });
    });

    // 5. Bấm trên thẻ học sinh (Tab Điểm Nhanh)
    document.getElementById('students-grid')?.addEventListener('click', (e) => {
      const plusBtn = e.target.closest('[data-action="quick-plus"]');
      const minusBtn = e.target.closest('[data-action="quick-minus"]');
      const moreBtn = e.target.closest('[data-action="open-modal"]');
      const teamBtn = e.target.closest('[data-action="quick-team-click"]');
      const storeBtn = e.target.closest('[data-action="open-store"]');
      const badgeBtn = e.target.closest('[data-action="open-badge"]');
      const card = e.target.closest('.student-card');

      if (teamBtn) {
        e.stopPropagation();
        const id = teamBtn.dataset.id;
        const cls = getCurrentClass();
        const stu = cls.students.find(s => s.id === id);
        if (stu) {
          stu.team = ((Number(stu.team || 1)) % 4) + 1;
          saveState();
          renderClassroomTab();
          renderSeatingChart();
          showToast(`Đã chuyển em ${stu.name} sang Tổ ${stu.team}!`, 'info');
        }
        return;
      }

      if (isBatchMode && card && !plusBtn && !minusBtn && !moreBtn) {
        const id = card.dataset.id;
        if (selectedStudentIds.has(id)) selectedStudentIds.delete(id);
        else selectedStudentIds.add(id);
        updateBatchUI();
        renderClassroomTab();
        return;
      }

      if (plusBtn) {
        e.stopPropagation();
        adjustStudentPoints(plusBtn.dataset.id, 1, 'Phát biểu xây dựng bài', plusBtn);
        return;
      }
      if (minusBtn) {
        e.stopPropagation();
        adjustStudentPoints(minusBtn.dataset.id, -1, 'Mất trật tự / Nhắc nhở', minusBtn);
        return;
      }
      if (moreBtn) {
        e.stopPropagation();
        openScoreModal(moreBtn.dataset.id);
        return;
      }
      if (storeBtn) {
        e.stopPropagation();
        openXPStore(storeBtn.dataset.id);
        return;
      }
      if (badgeBtn) {
        e.stopPropagation();
        openBadgeModal(badgeBtn.dataset.id);
        return;
      }
      if (card) {
        openScoreModal(card.dataset.id);
      }
    });

    // 6. Bấm trên Sơ đồ bàn học thực tế
    document.getElementById('seating-chart-grid')?.addEventListener('click', (e) => {
      const plusBtn = e.target.closest('[data-action="seat-plus"]');
      const seat = e.target.closest('.desk-seat');
      if (!seat || seat.classList.contains('empty')) return;

      const studentId = plusBtn ? plusBtn.dataset.id : seat.dataset.seatId;
      if (!studentId) return;

      adjustStudentPoints(studentId, 1, 'Phát biểu tại chỗ (Sơ đồ bàn học)', plusBtn || seat);
    });

    // 7. Xem nhật ký học sinh từ bảng vinh danh
    document.getElementById('leaderboard-tbody')?.addEventListener('click', (e) => {
      const btn = e.target.closest('[data-view-history]');
      if (btn) {
        openHistoryModal(btn.dataset.viewHistory);
      }
    });

    
      // 7b. Sự kiện Học Kỳ (HK1, HK2, Cả Năm) & Nhật Ký Đối Chiếu
    document.querySelectorAll('.btn-semester').forEach(btn => {
      btn.addEventListener('click', () => {
        const sem = btn.dataset.semester;
        if (!sem || sem === appState.currentSemester) return;
        appState.currentSemester = sem;
        saveState();

        document.querySelectorAll('.btn-semester').forEach(b => {
          b.classList.toggle('active', b.dataset.semester === sem);
        });

        renderClassroomTab();
        renderSeatingChart();
        renderGradebookTab();
        renderLeaderboard();
        renderClassStats();

        const semNames = { hk1: 'Học Kỳ I', hk2: 'Học Kỳ II', year: 'Cả Năm' };
        showToast(`⚡ Đã chuyển góc nhìn sang: <strong>${semNames[sem] || sem}</strong>`, 'info');
      });
    });

    document.getElementById('btn-open-audit-log')?.addEventListener('click', () => {
      openAuditModal();
    });

    document.getElementById('btn-modal-view-history')?.addEventListener('click', () => {
      if (activeStudentForModal) {
        closeModal('modal-score');
        openAuditModal(activeStudentForModal.id);
      }
    });

    document.getElementById('tab-audit-all')?.addEventListener('click', () => switchAuditTab('all'));
    document.getElementById('tab-audit-student')?.addEventListener('click', () => switchAuditTab('student'));

    document.getElementById('audit-search-input')?.addEventListener('input', renderAuditLog);
    document.getElementById('audit-filter-team')?.addEventListener('change', renderAuditLog);
    document.getElementById('audit-filter-type')?.addEventListener('change', renderAuditLog);
    document.getElementById('audit-filter-semester')?.addEventListener('change', renderAuditLog);
    document.getElementById('btn-export-audit-csv')?.addEventListener('click', exportAuditCsv);

    document.getElementById('btn-rollover-hk2')?.addEventListener('click', rolloverToSemester2);
    document.getElementById('btn-clean-old-history')?.addEventListener('click', cleanHistoryOlderThanOneYear);


    // 6. Chỉnh sửa ô điểm trực tiếp trong Sổ Điểm (Gradebook)
    document.getElementById('gradebook-tbody')?.addEventListener('input', (e) => {
      const input = e.target.closest('.score-input-cell');
      if (!input) return;
      const row = input.closest('tr');
      const studentId = row.dataset.studentId;
      const col = input.dataset.col;
      const isCustom = input.dataset.custom === 'true';
      const val = input.value.trim() === '' ? null : parseFloat(input.value);

      const cls = getCurrentClass();
      const student = cls.students.find(s => s.id === studentId);
      if (student) {
        if (isCustom) {
          if (!student.customGrades) student.customGrades = {};
          student.customGrades[col] = val;
        } else {
          student[col] = val;
        }

        // Cập nhật lại ĐTB và Xếp loại hiển thị ngay lập tức
        const avg = calculateStudentAverage(student);
        const avgCell = row.querySelector('.cell-avg');
        if (avgCell) {
          avgCell.innerHTML = getAverageClassBadge(avg);
        }
        const rankCell = row.querySelector('.cell-rank');
        if (rankCell) {
          rankCell.innerHTML = calculateStudentRank(avg);
        }
        saveState();
      }
    });

    // Thao tác xóa cột tùy chỉnh từ Header Sổ Điểm
    document.getElementById('gradebook-table-element')?.addEventListener('click', (e) => {
      const delBtn = e.target.closest('.btn-del-col');
      if (delBtn) {
        e.stopPropagation();
        const colId = delBtn.dataset.colId;
        const cls = getCurrentClass();
        if (!cls.customColumns) return;
        const col = cls.customColumns.find(c => c.id === colId);
        if (confirm(`Thầy có chắc chắn muốn xóa cột điểm "${col ? col.name : ''}" không?`)) {
          cls.customColumns = cls.customColumns.filter(c => c.id !== colId);
          cls.students.forEach(s => {
            if (s.customGrades && s.customGrades[colId] !== undefined) {
              delete s.customGrades[colId];
            }
          });
          saveState();
          renderGradebookTab();
        }
      }
    });

    // Bấm nút "+ Thêm Cột Điểm"
    document.getElementById('btn-add-custom-col')?.addEventListener('click', () => {
      openModal('modal-add-column');
    });

    // Xác nhận thêm cột điểm mới
    document.getElementById('btn-confirm-add-col')?.addEventListener('click', () => {
      const nameInput = document.getElementById('new-column-name');
      const weightInput = document.getElementById('new-column-weight');
      const name = (nameInput?.value || '').trim();
      const weight = parseInt(weightInput?.value || '1', 10);

      if (!name) {
        alert('Thầy vui lòng nhập tên cột điểm (ví dụ: Khảo sát đầu năm, 15p bù,...)');
        return;
      }

      const cls = getCurrentClass();
      if (!cls.customColumns) cls.customColumns = [];

      const colId = 'col_' + Date.now();
      cls.customColumns.push({
        id: colId,
        name: name,
        weight: weight
      });

      saveState();
      renderGradebookTab();
      closeModal('modal-add-column');
      if (nameInput) nameInput.value = '';
      AudioEngine.playPositive();
    });

    // Bấm nút "Bù điểm" trong Sổ Điểm
    document.getElementById('gradebook-tbody')?.addEventListener('click', (e) => {
      const btn = e.target.closest('[data-action="redeem-xp"]');
      if (btn) {
        openRedeemModal(btn.dataset.id);
      }
    });

    document.getElementById('btn-confirm-redeem')?.addEventListener('click', confirmRedeemPoints);
    document.getElementById('btn-export-gradebook-excel')?.addEventListener('click', exportGradebookCSV);

    // 7. Mã QR tra cứu cho học sinh
    document.getElementById('btn-show-qr')?.addEventListener('click', () => {
      const qrDisplay = document.getElementById('qr-code-display');
      if (qrDisplay) {
        const liveUrl = 'https://hdsd-conictypst.pages.dev/conic-classroom';
        qrDisplay.innerHTML = `
          <img src="https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=${encodeURIComponent(liveUrl)}" 
               alt="Mã QR Bảng Điểm ConicClassroom" 
               style="width: 200px; height: 200px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);" />
        `;
      }
      openModal('modal-qr');
    });

    // 8. Modal Chấm điểm (Chấm 1 em)
    const modalScoreEl = document.getElementById('modal-score');
    if (modalScoreEl) {
      modalScoreEl.addEventListener('click', (e) => {
        // Xóa nút tùy chỉnh nếu bấm nút x
        const delBtn = e.target.closest('[data-del-reason]');
        if (delBtn) {
          e.stopPropagation();
          const idToDel = delBtn.dataset.delReason;
          appState.customReasons = (appState.customReasons || []).filter(r => r.id !== idToDel);
          saveState();
          renderCustomReasons();
          return;
        }

        const btn = e.target.closest('.btn-reason-card, .btn-reason');
        if (!btn) return;
        if (!activeStudentForModal) return;
        const pts = parseInt(btn.dataset.pts, 10);
        const reason = btn.dataset.reason || (pts >= 0 ? 'Cộng điểm' : 'Trừ điểm');
        adjustStudentPoints(activeStudentForModal.id, pts, reason);
        closeModal('modal-score');
      });
    }

    // Ghi điểm tùy chỉnh (1 lần)
    document.getElementById('btn-submit-custom-point')?.addEventListener('click', () => {
      if (!activeStudentForModal) return;
      const reasonInput = document.getElementById('custom-reason-input');
      const reason = reasonInput?.value.trim() || 'Hoạt động khác';
      const pts = parseInt(document.getElementById('custom-pts-input')?.value || '1', 10);
      adjustStudentPoints(activeStudentForModal.id, pts, reason);
      if (reasonInput) reasonInput.value = '';
      closeModal('modal-score');
    });

    // Lưu lý do tùy chỉnh thành nút bấm sẵn cho các lần sau
    document.getElementById('btn-save-custom-reason')?.addEventListener('click', () => {
      const reasonInput = document.getElementById('custom-reason-input');
      const ptsInput = document.getElementById('custom-pts-input');
      const text = reasonInput?.value.trim();
      const pts = parseInt(ptsInput?.value || '1', 10);
      if (!text) {
        alert('Thầy vui lòng nhập nội dung lý do muốn lưu thành nút bấm sẵn!');
        reasonInput?.focus();
        return;
      }
      if (!appState.customReasons) appState.customReasons = [];
      const newId = 'cr_' + Date.now();
      appState.customReasons.push({ id: newId, text, pts });
      saveState();
      renderCustomReasons();
      showToast(`✨ Đã lưu nút "${escapeHtml(text)} (${pts > 0 ? '+' : ''}${pts} XP)" vào danh sách!`);
    });

    // 9. Vòng quay
    document.getElementById('btn-spin-wheel')?.addEventListener('click', spinWheel);
    document.getElementById('wheel-team-scope')?.addEventListener('change', () => {
      updateWheelStudents();
      drawWheel();
    });
    document.getElementById('chk-fair-mode')?.addEventListener('change', () => {
      updateWheelStudents();
      drawWheel();
    });
    document.getElementById('chk-exclude-called')?.addEventListener('change', () => {
      updateWheelStudents();
      drawWheel();
    });
    document.getElementById('btn-reset-called')?.addEventListener('click', () => {
      calledStudents.clear();
      updateCalledListUI();
      updateWheelStudents();
      drawWheel();
    });

    // 10. Đấu trường 1 vs 1 & Lật thẻ bí ẩn
    document.getElementById('btn-showdown-1v1')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      if (cls.students.length < 2) return;
      const p1 = cls.students[Math.floor(Math.random() * cls.students.length)];
      const diffTeam = cls.students.filter(s => s.team !== p1.team);
      const p2 = diffTeam.length > 0 ? diffTeam[Math.floor(Math.random() * diffTeam.length)] : cls.students.filter(s => s.id !== p1.id)[0];

      document.getElementById('sd-p1-name').textContent = p1.name;
      document.getElementById('sd-p1-team').textContent = `Tổ ${p1.team}`;
      document.getElementById('sd-p1-avatar').textContent = p1.name.split(' ').pop().charAt(0).toUpperCase();

      document.getElementById('sd-p2-name').textContent = p2.name;
      document.getElementById('sd-p2-team').textContent = `Tổ ${p2.team}`;
      document.getElementById('sd-p2-avatar').textContent = p2.name.split(' ').pop().charAt(0).toUpperCase();

      document.getElementById('btn-sd-p1-win').onclick = () => {
        adjustStudentPoints(p1.id, 2, `Thắng đấu trường trước ${p2.name}`);
        closeModal('modal-showdown');
      };
      document.getElementById('btn-sd-p2-win').onclick = () => {
        adjustStudentPoints(p2.id, 2, `Thắng đấu trường trước ${p1.name}`);
        closeModal('modal-showdown');
      };
      openModal('modal-showdown');
      AudioEngine.playFanfare();
    });

    document.getElementById('btn-magic-card')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      if (cls.students.length === 0) return;
      const lucky = cls.students[Math.floor(Math.random() * cls.students.length)];
      const cardEl = document.getElementById('flip-card-element');
      cardEl.classList.remove('flipped');
      document.getElementById('flip-name').textContent = lucky.name;
      document.getElementById('flip-team').textContent = `Tổ ${lucky.team}`;
      document.getElementById('flip-avatar').textContent = lucky.name.split(' ').pop().charAt(0).toUpperCase();
      document.getElementById('btn-flip-add-point').onclick = () => {
        adjustStudentPoints(lucky.id, 1, 'Thẻ bí ẩn may mắn');
        closeModal('modal-card-flip');
      };
      openModal('modal-card-flip');
      cardEl.onclick = () => {
        cardEl.classList.toggle('flipped');
        AudioEngine.playPositive();
        Confetti.burst();
      };
    });

    // 11. Timer & Chia nhóm
    document.querySelectorAll('.btn-timer-preset').forEach(btn => {
      btn.addEventListener('click', () => {
        document.querySelectorAll('.btn-timer-preset').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        resetTimer(parseInt(btn.dataset.sec, 10));
      });
    });
    document.getElementById('btn-timer-start')?.addEventListener('click', startTimer);
    document.getElementById('btn-timer-pause')?.addEventListener('click', pauseTimer);
    document.getElementById('btn-timer-reset')?.addEventListener('click', () => resetTimer());
    document.getElementById('btn-timer-add-1m')?.addEventListener('click', () => {
      timerRemaining += 60;
      timerDuration += 60;
      updateTimerDisplay();
    });
    document.getElementById('btn-generate-teams')?.addEventListener('click', generateTeams);

    // ==========================================
    // SỰ KIỆN PHÂN NHÓM & NHIỆM VỤ HỌC TẬP (Missions Hub)
    // ==========================================
    // Chuyển chế độ Ngẫu Nhiên vs Thủ Công
    document.getElementById('btn-mode-split-random')?.addEventListener('click', () => {
      activeMissionGroupingMode = 'random';
      document.getElementById('btn-mode-split-random')?.classList.add('active');
      document.getElementById('btn-mode-split-manual')?.classList.remove('active');
      const randBox = document.getElementById('mission-random-controls');
      const manBox = document.getElementById('mission-manual-controls');
      if (randBox) randBox.style.display = 'grid';
      if (manBox) manBox.style.display = 'none';
    });

    document.getElementById('btn-mode-split-manual')?.addEventListener('click', () => {
      activeMissionGroupingMode = 'manual';
      document.getElementById('btn-mode-split-manual')?.classList.add('active');
      document.getElementById('btn-mode-split-random')?.classList.remove('active');
      const randBox = document.getElementById('mission-random-controls');
      const manBox = document.getElementById('mission-manual-controls');
      if (randBox) randBox.style.display = 'none';
      if (manBox) manBox.style.display = 'block';
      renderManualAssignUI();
    });

    document.getElementById('manual-team-count-select')?.addEventListener('change', renderManualAssignUI);
    document.getElementById('manual-search-stu')?.addEventListener('input', renderManualAssignUI);
    document.getElementById('btn-manual-quick-seed')?.addEventListener('click', seedManualGroupsRandomly);
    document.getElementById('btn-manual-clear-all')?.addEventListener('click', clearManualGroups);
    document.getElementById('btn-manual-apply-teams')?.addEventListener('click', applyManualTeams);

    // Bấm chọn nhóm thủ công cho từng em trong bảng thủ công
    document.getElementById('manual-assign-list')?.addEventListener('click', (e) => {
      const pickBtn = e.target.closest('[data-pick-gidx]');
      if (!pickBtn) return;
      const stuId = pickBtn.dataset.id;
      const gIdx = parseInt(pickBtn.dataset.pickGidx, 10);
      manualGroupAssignments[stuId] = gIdx;
      renderManualAssignUI();
    });

    // Bấm đổi nhóm ⇄ trực tiếp trong thẻ nhóm đang thực hiện
    document.getElementById('generated-teams-result')?.addEventListener('click', (e) => {
      const moveBtn = e.target.closest('.btn-move-student');
      if (moveBtn) {
        const stuId = moveBtn.dataset.id;
        const gIdx = parseInt(moveBtn.dataset.currentGidx, 10);
        moveStudentToAnotherGroup(stuId, gIdx);
      }
    });

    // Nút Reset nhiệm vụ
    document.getElementById('btn-reset-mission')?.addEventListener('click', () => {
      if (confirm('Thầy có muốn làm mới để tạo nhiệm vụ học tập mới không?')) {
        currentGeneratedTeams = null;
        currentMissionGroupScores = {};
        currentMissionData = null;
        manualGroupAssignments = {};
        const resEl = document.getElementById('generated-teams-result');
        if (resEl) {
          resEl.innerHTML = '<div class="empty-hint-box">Chọn phương thức <strong>"Phân Nhóm Ngẫu Nhiên"</strong> hoặc <strong>"Phân Nhóm Thủ Công"</strong> ở trên để bắt đầu hoạt động nhóm!</div>';
        }
        showToast('Đã làm mới khu vực nhiệm vụ nhóm.', 'info');
      }
    });

    // Nút mở nhanh từ Toolbar và Tab Tools
    document.getElementById('btn-open-missions')?.addEventListener('click', () => {
      switchTab('tab-missions');
    });

    document.getElementById('btn-tools-open-missions')?.addEventListener('click', () => {
      switchTab('tab-missions');
    });

    document.getElementById('btn-tools-open-missions')?.addEventListener('click', () => {
      switchTab('tab-missions');
    });

    // Lắng nghe Quick Nav Ribbon
    document.getElementById('quick-nav-ribbon')?.addEventListener('click', (e) => {
      const btn = e.target.closest('.nav-tab-btn');
      if (!btn || !btn.dataset.tab) return;
      switchTab(btn.dataset.tab);
    });


    // 12. Chế độ GV / HS & Xác thực PIN
    document.getElementById('btn-mode-teacher')?.addEventListener('click', () => {
      if (isTeacherUnlocked) {
        alert('Thầy đang ở quyền Giáo viên rồi ạ! Nếu muốn khóa trước khi chiếu máy chiếu, Thầy hãy bấm nút "HS" nhé.');
      } else {
        const pinInput = document.getElementById('input-teacher-pin');
        if (pinInput) pinInput.value = '';
        const errMsg = document.getElementById('pin-error-msg');
        if (errMsg) errMsg.style.display = 'none';
        openModal('modal-pin');
        setTimeout(() => pinInput?.focus(), 150);
      }
    });

    document.getElementById('btn-banner-unlock')?.addEventListener('click', () => {
      const pinInput = document.getElementById('input-teacher-pin');
      if (pinInput) pinInput.value = '';
      const errMsg = document.getElementById('pin-error-msg');
      if (errMsg) errMsg.style.display = 'none';
      openModal('modal-pin');
      setTimeout(() => pinInput?.focus(), 150);
    });

    document.getElementById('btn-mode-student')?.addEventListener('click', () => {
      applyAuthMode(false);
      localStorage.removeItem('conic_teacher_unlocked');
    });

    document.getElementById('btn-submit-pin')?.addEventListener('click', () => {
      const pinInput = document.getElementById('input-teacher-pin');
      const val = (pinInput?.value || '').trim();
      const currentPin = localStorage.getItem('conic_teacher_pin') || '2026';

      if (val === currentPin) {
        localStorage.setItem('conic_teacher_unlocked', 'true');
        applyAuthMode(true);
        closeModal('modal-pin');
        AudioEngine.playFanfare();
        Confetti.burst();
      } else {
        const errMsg = document.getElementById('pin-error-msg');
        if (errMsg) errMsg.style.display = 'block';
        AudioEngine.playNegative();
      }
    });

    document.getElementById('input-teacher-pin')?.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        document.getElementById('btn-submit-pin')?.click();
      }
    });

    document.getElementById('btn-change-pin')?.addEventListener('click', () => {
      const oldPin = prompt('Nhập mã PIN hiện tại (Mặc định: 2026):');
      const currentPin = localStorage.getItem('conic_teacher_pin') || '2026';
      if (oldPin !== currentPin) {
        alert('Mã PIN hiện tại không chính xác!');
        return;
      }
      const newPin = prompt('Nhập mã PIN mới (4 đến 8 chữ số):');
      if (!newPin || newPin.trim().length < 4) {
        alert('Mã PIN mới phải có ít nhất 4 ký tự!');
        return;
      }
      localStorage.setItem('conic_teacher_pin', newPin.trim());
      alert(`✅ Đã đổi mã PIN thành công! Mã mới là: ${newPin.trim()}`);
    });

    // 13. Chia sẻ Link Kèm Dữ Liệu Lớp (Zalo)
    document.getElementById('btn-copy-share-link')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      try {
        const raw = JSON.stringify(cls);
        const encoded = btoa(unescape(encodeURIComponent(raw)));
        const shareUrl = window.location.origin + window.location.pathname + '#data=' + encoded;
        navigator.clipboard.writeText(shareUrl).then(() => {
          alert(`🎉 Đã sao chép link bảng điểm kèm điểm số mới nhất của lớp ${cls.name}!\n\nThầy chỉ cần dán (Paste) vào nhóm Zalo lớp để học sinh và phụ huynh xem ngay ở chế độ Chỉ Xem!`);
        }).catch(() => {
          prompt('Thầy hãy copy đường link chia sẻ này gửi cho học sinh:', shareUrl);
        });
      } catch (e) {
        console.error(e);
        alert('Không thể tạo link chia sẻ, vui lòng thử lại!');
      }
    });

    // 14. Vòng quay Thử Thách Vui (cho bạn chưa thuộc bài)
    document.getElementById('btn-fun-challenge')?.addEventListener('click', () => {
      spinFunChallenge();
    });
    document.getElementById('btn-spin-another-challenge')?.addEventListener('click', () => {
      spinFunChallenge();
    });

    function spinFunChallenge() {
      const textEl = document.getElementById('fun-challenge-text');
      if (!textEl) return;
      const challenge = FUN_CHALLENGES[Math.floor(Math.random() * FUN_CHALLENGES.length)];
      textEl.textContent = challenge;
      openModal('modal-fun-challenge');
      AudioEngine.playPositive();
      Confetti.burst();
    }

    // 13. Theme & Sound & Fullscreen
    document.getElementById('btn-toggle-sound')?.addEventListener('click', () => {
      appState.soundEnabled = !appState.soundEnabled;
      saveState();
      updateSoundIcon();
    });

    document.getElementById('btn-toggle-theme')?.addEventListener('click', () => {
      const isLight = document.body.classList.contains('theme-light');
      const newTheme = isLight ? 'dark' : 'light';
      applyTheme(newTheme);
      appState.theme = newTheme;
      saveState();
    });

    document.getElementById('btn-toggle-fullscreen')?.addEventListener('click', () => {
      if (!document.fullscreenElement) document.documentElement.requestFullscreen().catch(() => {});
      else document.exitFullscreen().catch(() => {});
    });

    // 14. Quản lý lớp & Excel
    document.getElementById('btn-manage-classes')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      const emailInput = document.getElementById('input-monitor-email');
      const statusEl = document.getElementById('monitor-email-status');
      if (emailInput) emailInput.value = cls.monitorEmail || '';
      if (statusEl) statusEl.textContent = cls.monitorEmail ? `Đang gán: ${cls.monitorEmail}` : 'Chưa gán lớp trưởng.';
      openModal('modal-manage-classes');
    });

    document.getElementById('btn-save-monitor-email')?.addEventListener('click', () => {
      const cls = getCurrentClass();
      const email = (document.getElementById('input-monitor-email')?.value || '').trim().toLowerCase();
      cls.monitorEmail = email;
      saveState();
      const statusEl = document.getElementById('monitor-email-status');
      if (statusEl) statusEl.textContent = email ? `Đã lưu lớp trưởng: ${email}` : 'Đã hủy gán lớp trưởng.';
      showToast(`Đã lưu email lớp trưởng cho ${cls.name}: ${email || '(Trống)'}`, 'success');

      // Đồng bộ trường monitor_email lên Supabase nếu có kết nối
      if (supabaseClient) {
        supabaseClient
          .from('classes')
          .update({ monitor_email: email || null })
          .eq('id', cls.id)
          .then(({ error }) => {
            if (error) console.warn('[Supabase] Lỗi cập nhật email lớp trưởng:', error.message);
            else showToast('Đã đồng bộ quyền Lớp trưởng lên Supabase Cloud!', 'success');
          });
      }
    });

    document.getElementById('btn-create-class')?.addEventListener('click', () => {
      const name = document.getElementById('new-class-name').value.trim();
      if (!name) return;
      const newId = 'class_' + Date.now();
      appState.classes.push({ id: newId, name: name, customColumns: [], students: [] });
      appState.currentClassId = newId;
      document.getElementById('new-class-name').value = '';
      saveState();
      renderClassRibbon();
      renderClassroomTab();
      renderSeatingChart();
      renderGradebookTab();
      alert(`Đã tạo lớp ${name} thành công!`);
    });

    document.getElementById('btn-import-excel')?.addEventListener('click', () => {
      const text = document.getElementById('paste-excel-input').value.trim();
      if (!text) return;
      const cls = getCurrentClass();
      const lines = text.split(/\r?\n/).filter(l => l.trim().length > 0);
      const newStu = [];

      lines.forEach((line, idx) => {
        const parts = line.split(/\t|,|;/).map(p => p.trim()).filter(Boolean);
        if (parts.length === 0) return;
        let name = parts[0];
        let team = (idx % 4) + 1;
        let sbd = generate6DigitSbd(cls.name, idx + 1);
        if (parts.length >= 2) {
          const num = parseInt(parts[1], 10);
          if (!isNaN(num) && num >= 1 && num <= 8) team = num;
          else sbd = parts[1];
        }
        if (parts.length >= 3) sbd = parts[2];

        newStu.push({
          id: 'stu_' + Date.now() + '_' + idx,
          name: name,
          team: team,
          sbd: sbd,
          points: 0,
          dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null,
          attitude: null,
          giuaKy: null, cuoiKy: null,
          customGrades: {},
          history: []
        });
      });

      if (newStu.length > 0) {
        cls.students = newStu;
        saveState();
        renderClassroomTab();
        renderSeatingChart();
        renderGradebookTab();
        renderLeaderboard();
        closeModal('modal-manage-classes');
        alert(`🎉 Đã nạp thành công ${newStu.length} học sinh vào lớp ${cls.name}!`);
      }
    });

    document.getElementById('btn-load-sample')?.addEventListener('click', () => {
      if (confirm('Thầy có chắc muốn nạp lại dữ liệu mẫu 10A1, 11B2, 12C3 không?')) {
        appState = JSON.parse(JSON.stringify(DEFAULT_DATA));
        saveState();
        initApp();
        closeModal('modal-manage-classes');
      }
    });

    // Cửa hàng XP: Bấm mua vật phẩm
    document.getElementById('xp-store-items-grid')?.addEventListener('click', (e) => {
      const card = e.target.closest('[data-action="buy-xp-item"]');
      if (card) {
        const studentId = card.dataset.studentId;
        const itemId = card.dataset.itemId;
        
        if (appState.isStudentMode) return showToast('Chế độ Học sinh không được đổi điểm!', 'error');

        const cls = getCurrentClass();
        const stu = cls.students.find(s => s.id === studentId);
        if (!stu) return;

        const item = XP_STORE_ITEMS.find(i => i.id === itemId);
        if (!item) return;

        const currentPts = getStudentPoints(stu);
        if (currentPts < item.cost) {
          return showToast(`Bạn còn thiếu ${item.cost - currentPts} XP nữa mới đủ đổi thẻ này!`, 'warning');
        }

        // Trừ điểm
        adjustStudentPoints(studentId, -item.cost, `Đổi thẻ đặc quyền: ${item.name}`);

        // Thêm vào túi đồ (Inventory)
        if (!stu.inventory) stu.inventory = [];
        stu.inventory.push({
          id: 'card_' + Date.now() + '_' + Math.random().toString(36).substr(2, 4),
          itemId: item.id,
          name: item.name,
          desc: item.desc,
          purchasedAt: new Date().toLocaleDateString('vi-VN')
        });
        saveState();

        AudioEngine.playReward();
        Confetti.burst();
        showToast(`Đổi thành công ${item.name} cho ${stu.name}! Đã cất vào 🎒 Túi đồ.`, 'success');
        
        // Đóng modal & cập nhật
        closeModal('modal-xp-store');
        renderClassroomTab();
        renderSeatingChart();
        renderLeaderboard();
      }
    });

    // Cấp huy hiệu
    document.getElementById('badge-items-grid')?.addEventListener('click', (e) => {
      const card = e.target.closest('[data-action="award-badge"]');
      if (card) {
        const studentId = card.dataset.studentId;
        const badgeId = card.dataset.badgeId;
        
        if (appState.isStudentMode) return showToast('Chế độ Học sinh không được cấp huy hiệu!', 'error');

        const cls = getCurrentClass();
        const stu = cls.students.find(s => s.id === studentId);
        if (!stu) return;

        const badgeInfo = BADGES_LIST.find(i => i.id === badgeId);
        if (!badgeInfo) return;

        // Cấp huy hiệu
        stu.badges = stu.badges || [];
        stu.badges.push({
          id: badgeInfo.id,
          name: badgeInfo.name,
          icon: badgeInfo.icon,
          desc: badgeInfo.desc,
          awardedAt: new Date().toISOString()
        });

        // Thưởng XP
        if (badgeInfo.xpReward > 0) {
          adjustStudentPoints(studentId, badgeInfo.xpReward, `Thưởng huy hiệu: ${badgeInfo.name}`);
        } else {
          // Log sự kiện cấp huy hiệu (nếu không có XP)
          stu.history.unshift({
            date: new Date().toLocaleString(),
            pts: 0,
            reason: `Được phong tặng huy hiệu: ${badgeInfo.name}`,
            semester: appState.currentSemester
          });
          saveState();
        }

        AudioEngine.playReward();
        Confetti.burst();
        showToast(`Đã cấp huy hiệu ${badgeInfo.name} cho ${stu.name}!`, 'success');
        
        closeModal('modal-badge');
        renderClassroomTab();
        renderSeatingChart();
        renderLeaderboard();
      }
    });

    // ─── 10. NHẬP ĐIỂM SANG MATH OMR ───
    document.getElementById('btn-import-omr-scores')?.addEventListener('click', openImportOMRModal);

    document.getElementById('btn-trigger-omr-file')?.addEventListener('click', () => {
      document.getElementById('omr-file-upload')?.click();
    });

    document.getElementById('omr-file-upload')?.addEventListener('change', (e) => {
      const file = e.target.files?.[0];
      if (!file) return;
      const reader = new FileReader();
      reader.onload = (evt) => {
        const text = evt.target?.result || '';
        const pasteInput = document.getElementById('omr-raw-paste');
        if (pasteInput) pasteInput.value = text;
        handleParseOMR();
      };
      reader.readAsText(file, 'UTF-8');
    });

    document.getElementById('btn-parse-omr-data')?.addEventListener('click', handleParseOMR);
    document.getElementById('btn-apply-omr-grades')?.addEventListener('click', handleApplyOMR);

    // ─── 11. TÚI ĐỒ THẺ ĐẶC QUYỀN (INVENTORY) ───
    document.addEventListener('click', (e) => {
      const invBtn = e.target.closest('[data-action="open-inventory"]');
      if (invBtn) {
        openInventoryModal(invBtn.dataset.id);
        return;
      }
      const useBtn = e.target.closest('[data-action="use-card"]');
      if (useBtn) {
        activateCard(useBtn.dataset.studentId, useBtn.dataset.cardId);
        return;
      }
    });

    // ─── 12. REMOTE MOBILE CLICKER (ĐIỀU KHIỂN TỪ XA) ───
    document.getElementById('btn-open-remote-modal')?.addEventListener('click', openRemoteQRModal);
    document.getElementById('btn-copy-remote-link')?.addEventListener('click', () => {
      const url = document.getElementById('remote-link-url')?.href || '';
      if (navigator.clipboard) {
        navigator.clipboard.writeText(url).then(() => showToast('📋 Đã sao chép link Remote!', 'success'));
      } else {
        alert(url);
      }
    });
    document.getElementById('btn-open-remote-tab')?.addEventListener('click', () => {
      openMobileRemoteApp();
      closeModal('modal-remote-controller');
    });

    document.getElementById('btn-remote-exit')?.addEventListener('click', () => {
      const app = document.getElementById('mobile-remote-app');
      if (app) app.style.display = 'none';
    });

    document.getElementById('remote-class-select')?.addEventListener('change', (e) => {
      switchClass(e.target.value);
      renderRemoteStudentList();
      sendRemoteCommand('select-class', { classId: e.target.value });
    });

    document.getElementById('remote-search-student')?.addEventListener('input', renderRemoteStudentList);

    document.getElementById('remote-students-list')?.addEventListener('click', (e) => {
      const btn = e.target.closest('.btn-remote-action');
      if (btn) {
        const studentId = btn.dataset.id;
        const delta = parseInt(btn.dataset.delta, 10);
        const name = btn.dataset.name;
        sendRemoteCommand('adjust-points', { studentId, delta, studentName: name, reason: 'Remote clicker' });
        renderRemoteStudentList();
      }
    });

    document.getElementById('btn-remote-spin')?.addEventListener('click', () => {
      sendRemoteCommand('spin-wheel');
    });

    document.getElementById('btn-remote-timer')?.addEventListener('click', () => {
      sendRemoteCommand('start-timer');
    });

    document.getElementById('btn-remote-switch-tab')?.addEventListener('click', () => {
      sendRemoteCommand('switch-tab', { tabId: 'tab-leaderboard', tabName: 'Bảng Vinh Danh' });
    });

    // Modal Close
    document.querySelectorAll('[data-close]').forEach(btn => {
      btn.addEventListener('click', () => closeModal(btn.dataset.close));
    });
    document.querySelectorAll('.modal-overlay').forEach(modal => {
      modal.addEventListener('click', (e) => {
        if (e.target === modal) modal.classList.remove('open');
      });
    });
  }

  function renderCustomReasons() {
    const wrapper = document.getElementById('custom-reasons-wrapper');
    const grid = document.getElementById('custom-reasons-grid');
    if (!wrapper || !grid) return;
    const reasons = appState.customReasons || [];
    if (reasons.length === 0) {
      wrapper.style.display = 'none';
      grid.innerHTML = '';
      return;
    }
    wrapper.style.display = 'block';
    grid.innerHTML = reasons.map(r => {
      const isPos = r.pts >= 0;
      return `
        <button class="btn-reason-card ${isPos ? 'pos' : 'neg'} custom-reason" data-pts="${r.pts}" data-reason="${escapeHtml(r.text)}" title="Bấm để ghi điểm: ${escapeHtml(r.text)}">
          <span>✨ ${escapeHtml(r.text)}</span>
          <div style="display: flex; align-items: center; gap: 6px;">
            <span class="pts-badge">${isPos ? '+' : ''}${r.pts}</span>
            <span class="btn-delete-custom-reason" data-del-reason="${r.id}" title="Xóa nút này">&times;</span>
          </div>
        </button>
      `;
    }).join('');
  }

  // ==========================================
  // NHẬP ĐIỂM SANG MATH OMR -> SỔ ĐIỂM TT22
  // ==========================================
  let currentOMRMatches = [];

  function openImportOMRModal() {
    if (appState.isStudentMode) return showToast('Chế độ Học sinh không được nhập điểm!', 'error');
    
    // Đổ danh sách cột tuỳ chỉnh vào select nếu có
    const select = document.getElementById('omr-target-col');
    if (select) {
      const cls = getCurrentClass();
      const baseOptions = `
        <option value="dgtx1">ĐGTX 1 (Thường xuyên 1)</option>
        <option value="dgtx2">ĐGTX 2 (Thường xuyên 2)</option>
        <option value="dgtx3">ĐGTX 3 (Thường xuyên 3)</option>
        <option value="dgtx4">ĐGTX 4 (Thường xuyên 4)</option>
        <option value="dgtx5">ĐGTX 5 (Thường xuyên 5)</option>
        <option value="giuaKy">Giữa Kỳ (Hệ số 2)</option>
        <option value="cuoiKy">Cuối Kỳ (Hệ số 3)</option>
      `;
      let customOptions = '';
      (cls.customColumns || []).forEach(c => {
        customOptions += `<option value="custom_${c.id}">${escapeHtml(c.name)} (Cột tự tạo HS ${c.weight})</option>`;
      });
      select.innerHTML = baseOptions + customOptions;
    }

    document.getElementById('omr-match-summary').style.display = 'none';
    document.getElementById('omr-match-preview-wrap').style.display = 'none';
    openModal('modal-import-omr');
  }

  function parseOMRData(rawText) {
    if (!rawText || !rawText.trim()) return [];
    const lines = rawText.trim().split(/\r?\n/);
    const results = [];

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (!line) continue;

      // Phân tách CSV xử lý cả dấu ngoặc kép
      const tokens = [];
      let current = '';
      let inQuote = false;
      for (let c = 0; c < line.length; c++) {
        const char = line[c];
        if (char === '"') {
          inQuote = !inQuote;
        } else if (char === ',' && !inQuote) {
          tokens.push(current.trim());
          current = '';
        } else {
          current += char;
        }
      }
      tokens.push(current.trim());

      const lower = tokens.join(' ').toLowerCase();
      if (lower.includes('sbd') || (lower.includes('họ tên') && lower.includes('điểm')) || lower.includes('stt')) {
        continue;
      }

      let sbd = '';
      let name = '';
      let score = null;

      tokens.forEach(tok => {
        const clean = tok.replace(/"/g, '').trim();
        if (!sbd && /^\d{4,8}$/.test(clean)) {
          sbd = clean;
        } else if (score === null && /^(\d+(\.\d+)?)$/.test(clean) && Number(clean) <= 10) {
          score = Number(clean);
        } else if (!name && /[a-zA-ZÀ-ỹ]{2,}/.test(clean) && isNaN(Number(clean))) {
          name = clean;
        }
      });

      if (!sbd && tokens.length >= 3) {
        if (/^\d+$/.test(tokens[0])) sbd = tokens[0];
        else if (/^\d+$/.test(tokens[1])) sbd = tokens[1];
      }
      if (score === null && tokens.length >= 3) {
        for (let k = tokens.length - 1; k >= 0; k--) {
          const num = parseFloat(tokens[k]);
          if (!isNaN(num) && num >= 0 && num <= 10) {
            score = num;
            break;
          }
        }
      }

      if (sbd || name) {
        results.push({ sbd: sbd ? String(sbd).padStart(6, '0') : '', name, score });
      }
    }
    return results;
  }

  function handleParseOMR() {
    const rawText = document.getElementById('omr-raw-paste')?.value || '';
    const targetCol = document.getElementById('omr-target-col')?.value || 'dgtx1';

    if (!rawText.trim()) {
      alert('Thầy vui lòng chọn file CSV OMR hoặc dán dữ liệu điểm vào ô!');
      return;
    }

    const omrList = parseOMRData(rawText);
    if (omrList.length === 0) {
      alert('Không nhận diện được dòng điểm nào hợp lệ. Vui lòng kiểm tra lại định dạng file CSV!');
      return;
    }

    const cls = getCurrentClass();
    const matches = [];
    let matchCount = 0;

    cls.students.forEach((stu, idx) => {
      const stuSbd = String(stu.sbd || generate6DigitSbd(cls.name, idx + 1)).padStart(6, '0');

      // Tìm theo SBD
      let found = omrList.find(item => item.sbd && item.sbd === stuSbd);

      // Nếu không khớp SBD, thử so khớp theo họ tên không dấu
      if (!found && stu.name) {
        const normStu = stu.name.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').trim();
        found = omrList.find(item => {
          if (!item.name) return false;
          const normItem = item.name.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').trim();
          return normItem === normStu;
        });
      }

      let oldVal = '';
      if (targetCol.startsWith('custom_')) {
        const cId = targetCol.replace('custom_', '');
        oldVal = stu.customGrades && stu.customGrades[cId] !== undefined ? stu.customGrades[cId] : '-';
      } else {
        oldVal = (stu[targetCol] !== undefined && stu[targetCol] !== null) ? stu[targetCol] : '-';
      }

      const isMatched = found && found.score !== null && found.score !== undefined;
      if (isMatched) matchCount++;

      matches.push({
        student: stu,
        sbd: stuSbd,
        name: stu.name,
        newScore: isMatched ? found.score : null,
        oldScore: oldVal,
        matched: isMatched
      });
    });

    currentOMRMatches = matches;

    // Hiển thị thống kê
    const summaryEl = document.getElementById('omr-match-summary');
    summaryEl.style.display = 'block';
    summaryEl.innerHTML = `
      <div style="display: flex; gap: 12px; flex-wrap: wrap;">
        <div style="background: #ecfdf5; border: 1px solid #a7f3d0; padding: 10px 16px; border-radius: 8px; flex: 1;">
          <div style="font-size: 0.8rem; font-weight: 700; color: #065f46;">ĐÃ KHỚP SBD</div>
          <div style="font-size: 1.5rem; font-weight: 900; color: #059669;">${matchCount} / ${cls.students.length} HS</div>
        </div>
        <div style="background: #fffbeb; border: 1px solid #fde68a; padding: 10px 16px; border-radius: 8px; flex: 1;">
          <div style="font-size: 0.8rem; font-weight: 700; color: #92400e;">CHƯA CÓ BÀI / VẮNG</div>
          <div style="font-size: 1.5rem; font-weight: 900; color: #d97706;">${cls.students.length - matchCount} HS</div>
        </div>
      </div>
    `;

    // Hiển thị bảng preview
    const tbody = document.getElementById('omr-preview-tbody');
    tbody.innerHTML = matches.map((m, i) => `
      <tr style="${!m.matched ? 'opacity: 0.6; background: #fafafa;' : ''}">
        <td>${i + 1}</td>
        <td><strong style="color: var(--primary-dark); font-family: monospace;">${m.sbd}</strong></td>
        <td style="text-align: left; font-weight: 600;">${escapeHtml(m.name)}</td>
        <td>
          ${m.matched ? `<span style="font-weight: 900; font-size: 1rem; color: #10b981;">${m.newScore}</span>` : '<span class="text-muted">-</span>'}
        </td>
        <td class="text-muted">${m.oldScore}</td>
        <td>
          ${m.matched 
            ? '<span style="background: #d1fae5; color: #065f46; padding: 2px 8px; border-radius: 10px; font-weight: 700; font-size: 0.75rem;">✓ Khớp chuẩn</span>'
            : '<span style="background: #fee2e2; color: #991b1b; padding: 2px 8px; border-radius: 10px; font-weight: 700; font-size: 0.75rem;">Chưa có bài</span>'}
        </td>
      </tr>
    `).join('');

    document.getElementById('omr-match-preview-wrap').style.display = 'block';
  }

  function handleApplyOMR() {
    if (!currentOMRMatches || currentOMRMatches.length === 0) return;
    const targetCol = document.getElementById('omr-target-col')?.value || 'dgtx1';
    const cls = getCurrentClass();

    let updatedCount = 0;
    currentOMRMatches.forEach(m => {
      if (m.matched && m.newScore !== null && m.newScore !== undefined) {
        const stu = cls.students.find(s => s.id === m.student.id);
        if (stu) {
          if (targetCol.startsWith('custom_')) {
            const colId = targetCol.replace('custom_', '');
            if (!stu.customGrades) stu.customGrades = {};
            stu.customGrades[colId] = m.newScore;
          } else {
            stu[targetCol] = m.newScore;
          }
          updatedCount++;
        }
      }
    });

    saveState();
    renderGradebookTab();
    closeModal('modal-import-omr');
    AudioEngine.playReward();
    Confetti.burst();
    showToast(`🎉 Đã nạp thành công điểm OMR cho ${updatedCount} học sinh vào sổ điểm!`, 'success');
  }

  // ==========================================
  // REMOTE CONTROLLER (TEACHER MOBILE CLICKER)
  // ==========================================
  function openRemoteQRModal() {
    const remoteUrl = window.location.origin + window.location.pathname + '?mode=remote';
    const linkEl = document.getElementById('remote-link-url');
    if (linkEl) {
      linkEl.textContent = remoteUrl;
      linkEl.href = remoteUrl;
    }
    const qrImg = document.getElementById('remote-qr-img');
    if (qrImg) {
      qrImg.src = `https://api.qrserver.com/v1/create-qr-code/?size=250x250&data=${encodeURIComponent(remoteUrl)}`;
    }
    openModal('modal-remote-controller');
  }

  function sendRemoteCommand(cmd, data = {}) {
    const payload = { cmd, data, timestamp: Date.now() };

    // 1. Supabase Broadcast
    if (supabaseClient) {
      try {
        supabaseClient.channel('conic-classroom-realtime').send({
          type: 'broadcast',
          event: 'remote-cmd',
          payload
        });
      } catch (e) {
        console.warn('[Remote] Broadcast error:', e);
      }
    }

    // 2. Local BroadcastChannel
    if (typeof BroadcastChannel !== 'undefined') {
      try {
        if (!window.__conicLocalBc) window.__conicLocalBc = new BroadcastChannel('conic-classroom-local-bc');
        window.__conicLocalBc.postMessage(payload);
      } catch (e) {}
    }

    // 3. Local direct dispatch
    handleRemoteCommand(payload);
  }

  function handleRemoteCommand(payload) {
    if (!payload || !payload.cmd) return;
    const { cmd, data } = payload;

    if (cmd === 'adjust-points') {
      adjustStudentPoints(data.studentId, data.delta, data.reason || 'Remote clicker');
      if (data.delta > 0) {
        AudioEngine.playScore();
        Confetti.burst();
      }
      renderClassroomTab();
      renderSeatingChart();
      renderLeaderboard();
      renderGradebookTab();
      showToast(`📱 Remote: ${data.delta > 0 ? '+' : ''}${data.delta} XP cho ${data.studentName || 'học sinh'}`, 'info');
    } else if (cmd === 'spin-wheel') {
      switchTab('tab-wheel');
      const spinBtn = document.getElementById('btn-spin-wheel');
      if (spinBtn) spinBtn.click();
      showToast('📱 Remote: Đã kích hoạt Vòng quay may mắn trên TV!', 'info');
    } else if (cmd === 'start-timer') {
      switchTab('tab-tools');
      const tBtn = document.getElementById('btn-timer-start-stop');
      if (tBtn) tBtn.click();
      showToast('📱 Remote: Đã bật/tắt Timer trên TV!', 'info');
    } else if (cmd === 'switch-tab') {
      if (typeof switchTab === 'function') switchTab(data.tabId);
      showToast(`📱 Remote: Chuyển sang ${data.tabName || data.tabId}`, 'info');
    } else if (cmd === 'select-class') {
      if (typeof switchClass === 'function') switchClass(data.classId);
      showToast(`📱 Remote: Đổi sang lớp ${data.classId}`, 'info');
    }
  }

  function initRemoteListeners() {
    if (typeof BroadcastChannel !== 'undefined' && !window.__conicLocalBc) {
      window.__conicLocalBc = new BroadcastChannel('conic-classroom-local-bc');
      window.__conicLocalBc.onmessage = (e) => {
        if (e.data) handleRemoteCommand(e.data);
      };
    }
  }

  function openMobileRemoteApp() {
    const app = document.getElementById('mobile-remote-app');
    if (!app) return;
    app.style.display = 'flex';

    const clsSelect = document.getElementById('remote-class-select');
    if (clsSelect) {
      clsSelect.innerHTML = appState.classes.map(c => `
        <option value="${c.id}" ${c.id === appState.currentClassId ? 'selected' : ''}>${escapeHtml(c.name)}</option>
      `).join('');
    }

    const badge = document.getElementById('remote-class-badge');
    if (badge) badge.textContent = `Lớp ${getCurrentClass().name} (${getCurrentClass().students.length} HS)`;

    renderRemoteStudentList();
  }

  function renderRemoteStudentList() {
    const container = document.getElementById('remote-students-list');
    if (!container) return;

    const cls = getCurrentClass();
    const searchVal = (document.getElementById('remote-search-student')?.value || '').toLowerCase().trim();
    const filtered = cls.students.filter(s => !searchVal || s.name.toLowerCase().includes(searchVal) || (s.sbd && s.sbd.includes(searchVal)));

    container.innerHTML = filtered.map((s, idx) => `
      <div style="background: #1e293b; border: 1px solid #334155; border-radius: 12px; padding: 10px 14px; display: flex; justify-content: space-between; align-items: center;">
        <div>
          <div style="font-weight: 800; font-size: 1.05rem; color: #f8fafc;">
            <span style="color: #38bdf8; font-family: monospace; font-size: 0.9rem; margin-right: 4px;">#${String(idx + 1).padStart(2, '0')}</span>
            ${escapeHtml(s.name)}
          </div>
          <div style="display: flex; align-items: center; gap: 8px; margin-top: 4px; font-size: 0.78rem; color: #94a3b8;">
            <span>Tổ ${s.team || 1}</span>
            <span>•</span>
            <strong style="color: #f59e0b; font-size: 0.9rem;">${s.points} XP</strong>
            ${(s.inventory || []).filter(c => !c.used).length > 0 ? `<span style="background: #312e81; color: #818cf8; padding: 1px 6px; border-radius: 6px; font-size: 0.72rem;">🎒 ${(s.inventory || []).filter(c => !c.used).length} thẻ</span>` : ''}
          </div>
        </div>
        <div style="display: flex; gap: 6px;">
          <button class="btn-remote-action" data-remote-action="plus" data-id="${s.id}" data-delta="1" data-name="${escapeHtml(s.name)}" style="background: #10b981; color: white; border: none; width: 44px; height: 44px; border-radius: 10px; font-weight: 900; font-size: 1.1rem; cursor: pointer;">
            +1
          </button>
          <button class="btn-remote-action" data-remote-action="plus" data-id="${s.id}" data-delta="2" data-name="${escapeHtml(s.name)}" style="background: #0284c7; color: white; border: none; width: 44px; height: 44px; border-radius: 10px; font-weight: 900; font-size: 1.1rem; cursor: pointer;">
            +2
          </button>
          <button class="btn-remote-action" data-remote-action="minus" data-id="${s.id}" data-delta="-1" data-name="${escapeHtml(s.name)}" style="background: #334155; color: #f87171; border: 1px solid #475569; width: 44px; height: 44px; border-radius: 10px; font-weight: 900; font-size: 1.1rem; cursor: pointer;">
            -1
          </button>
        </div>
      </div>
    `).join('');
  }

  function openScoreModal(studentId) {
    const cls = getCurrentClass();
    const student = cls.students.find(s => s.id === studentId);
    if (!student) return;
    activeStudentForModal = student;
    document.getElementById('modal-student-name').textContent = student.name;
    document.getElementById('modal-student-sub').textContent = `Tổ ${student.team} • SBD: ${student.sbd || '---'} • Hiện có: ${student.points} XP`;
    document.getElementById('modal-student-avatar').textContent = student.name.split(' ').pop().charAt(0).toUpperCase();
    renderCustomReasons();
    openModal('modal-score');
  }

  function openModal(id) {
    document.getElementById(id)?.classList.add('open');
  }
  function closeModal(id) {
    document.getElementById(id)?.classList.remove('open');
  }

  function applyTheme(theme) {
    if (theme === 'dark') {
      document.body.classList.remove('theme-light');
      document.body.classList.add('theme-dark');
      const icon = document.getElementById('theme-icon');
      if (icon) icon.textContent = '🌙';
    } else {
      document.body.classList.remove('theme-dark');
      document.body.classList.add('theme-light');
      const icon = document.getElementById('theme-icon');
      if (icon) icon.textContent = '☀️';
    }
  }

  function updateSoundIcon() {
    const icon = document.getElementById('sound-icon');
    if (icon) icon.textContent = appState.soundEnabled ? '🔊' : '🔇';
  }

  function getTodayShortDate() {
    const now = new Date();
    return `${String(now.getDate()).padStart(2, '0')}/${String(now.getMonth() + 1).padStart(2, '0')}`;
  }

  function escapeHtml(str) {
    return String(str || '').replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  }

  function showToast(message, type = 'success', duration = 2800) {
    let container = document.getElementById('toast-container');
    if (!container) {
      container = document.createElement('div');
      container.id = 'toast-container';
      container.className = 'toast-container';
      document.body.appendChild(container);
    }
    const toast = document.createElement('div');
    toast.className = `toast-item toast-${type}`;
    toast.innerHTML = message;
    container.appendChild(toast);
    const scheduleFrame = typeof window !== 'undefined' && window.requestAnimationFrame ? window.requestAnimationFrame : fn => setTimeout(fn, 16);
    scheduleFrame(() => {
      toast.classList.add('show');
    });
    setTimeout(() => {
      toast.classList.remove('show');
      setTimeout(() => toast.remove(), 350);
    }, duration);
  }

  // ==========================================
  // 15. SUPABASE CLOUD SYNC & AUTHENTICATION
  // ==========================================
  const TEACHER_ADMIN_EMAILS = [
    'nguyensangnhc@gmail.com',
    'sangbeau@gmail.com'
  ];

  let supabaseClient = null;
  let currentUser = null;
  let userRole = 'guest'; // 'teacher' | 'monitor' | 'guest'
  let monitorClassId = null;

  function getSupabaseConfig() {
    const url = localStorage.getItem('conic_supabase_url') || (window.CONIC_SUPABASE_CONFIG && window.CONIC_SUPABASE_CONFIG.url) || '';
    const key = localStorage.getItem('conic_supabase_anon_key') || (window.CONIC_SUPABASE_CONFIG && window.CONIC_SUPABASE_CONFIG.anonKey) || '';
    return { url: url.trim(), key: key.trim() };
  }

  function initSupabase() {
    const { url, key } = getSupabaseConfig();
    if (url && key && window.supabase && typeof window.supabase.createClient === 'function') {
      try {
        supabaseClient = window.supabase.createClient(url, key);
        return true;
      } catch (e) {
        console.warn('Lỗi khởi tạo Supabase client:', e);
      }
    }
    return false;
  }

  async function syncAuthRole() {
    if (!supabaseClient) {
      if (isTeacherUnlocked) {
        userRole = 'teacher';
      } else {
        userRole = 'guest';
      }
      updateAuthUI();
      return;
    }

    try {
      const { data: { session } } = await supabaseClient.auth.getSession();
      currentUser = session?.user || null;
    } catch (e) {
      currentUser = null;
    }

    if (currentUser && currentUser.email) {
      const email = currentUser.email.toLowerCase().trim();
      if (TEACHER_ADMIN_EMAILS.includes(email)) {
        userRole = 'teacher';
        monitorClassId = null;
        applyAuthMode(true);
      } else {
        let mClass = appState.classes.find(c => getMonitorEmailsList(c).includes(email));
        if (!mClass && supabaseClient) {
          try {
            const { data: dbClasses } = await supabaseClient.from('classes').select('*');
            if (dbClasses && dbClasses.length > 0) {
              dbClasses.forEach(dbc => {
                let localCls = appState.classes.find(c => c.id === dbc.id);
                if (localCls) {
                  localCls.monitorEmail = dbc.monitor_email || '';
                  if (dbc.monitor_email) {
                    localCls.monitorEmails = dbc.monitor_email.split(/[,;\s\n]+/).filter(Boolean).map(e => ({ email: e.toLowerCase().trim(), role: 'Cán Sự' }));
                  }
                }
              });
              mClass = appState.classes.find(c => getMonitorEmailsList(c).includes(email));
            }
          } catch (e) {
            console.warn('Lỗi kiểm tra quyền cán sự từ Cloud:', e);
          }
        }
        if (mClass) {
          userRole = 'monitor';
          monitorClassId = mClass.id;
          appState.currentClassId = mClass.id;
          applyMonitorMode(mClass);
        } else {
          userRole = 'guest';
          monitorClassId = null;
          applyAuthMode(false);
        }
      }
    } else {
      if (isTeacherUnlocked) {
        userRole = 'teacher';
      } else {
        userRole = 'guest';
        applyAuthMode(false);
      }
    }
    updateAuthUI();
  }

  function applyMonitorMode(targetClass) {
    document.body.classList.remove('student-mode');
    document.body.classList.add('monitor-mode');
    const teacherBtn = document.getElementById('btn-mode-teacher');
    const studentBtn = document.getElementById('btn-mode-student');
    const banner = document.getElementById('student-notice-banner');
    const teacherText = document.getElementById('mode-teacher-text');
    if (teacherBtn) teacherBtn.classList.remove('active');
    if (studentBtn) studentBtn.classList.remove('active');
    if (banner) {
      banner.style.display = 'flex';
      banner.innerHTML = `<span>⭐ <strong>Chế độ Lớp Trưởng (${escapeHtml(targetClass.name)}):</strong> Chào bạn ${escapeHtml(currentUser?.user_metadata?.full_name || currentUser?.email)}! Bạn có quyền chấm điểm cho các bạn trong lớp.</span>`;
    }
    if (teacherText) teacherText.textContent = 'Lớp Trưởng';
    renderClassRibbon();
    renderClassroomTab();
  }

  function updateAuthUI() {
    const loginBtn = document.getElementById('btn-google-login');
    const userBadge = document.getElementById('user-profile-badge');
    const roleTag = document.getElementById('user-role-tag');
    const userEmailText = document.getElementById('user-display-email');
    const cfgUrlInput = document.getElementById('cfg-supabase-url');
    const cfgKeyInput = document.getElementById('cfg-supabase-key');

    const { url, key } = getSupabaseConfig();
    if (cfgUrlInput && !cfgUrlInput.value) cfgUrlInput.value = url;
    if (cfgKeyInput && !cfgKeyInput.value) cfgKeyInput.value = key;

    if (currentUser && currentUser.email) {
      if (loginBtn) loginBtn.style.display = 'none';
      if (userBadge) userBadge.style.display = 'inline-flex';
      if (userEmailText) {
        userEmailText.textContent = currentUser.user_metadata?.full_name || currentUser.email.split('@')[0];
        userEmailText.title = currentUser.email;
      }
      if (roleTag) {
        if (userRole === 'teacher') {
          roleTag.className = 'role-tag teacher';
          roleTag.textContent = '👑 Thầy (Admin)';
        } else if (userRole === 'monitor') {
          roleTag.className = 'role-tag monitor';
          roleTag.textContent = '⭐ Lớp Trưởng';
        } else {
          roleTag.className = 'role-tag guest';
          roleTag.textContent = '🎓 Học Sinh';
        }
      }
    } else {
      if (loginBtn) loginBtn.style.display = 'inline-flex';
      if (userBadge) userBadge.style.display = 'none';
    }
  }

  async function loginWithGoogle() {
    if (!supabaseClient) {
      openModal('modal-supabase-cloud');
      showToast('Thầy vui lòng cấu hình Supabase URL & Key trước khi kết nối Google Cloud.', 'warning');
      return;
    }
    try {
      const { error } = await supabaseClient.auth.signInWithOAuth({
        provider: 'google',
        options: {
          redirectTo: window.location.href.split('#')[0]
        }
      });
      if (error) showToast('Lỗi đăng nhập: ' + error.message, 'neg');
    } catch (err) {
      showToast('Lỗi: ' + err.message, 'neg');
    }
  }

  async function logoutUser() {
    if (supabaseClient) {
      await supabaseClient.auth.signOut();
    }
    currentUser = null;
    userRole = 'guest';
    monitorClassId = null;
    document.body.classList.remove('monitor-mode');
    applyAuthMode(false);
    updateAuthUI();
    showToast('Đã đăng xuất tài khoản Google.', 'neutral');
  }

  function syncPointToSupabase(student, classId, deltaPoints, reason) {
    if (!supabaseClient || !currentUser) return;
    // 1. Cập nhật tổng điểm học sinh
    supabaseClient
      .from('students')
      .update({ points: student.points, updated_at: new Date().toISOString() })
      .eq('id', student.id)
      .then(({ error }) => {
        if (error) console.warn('[Supabase] Không thể cập nhật điểm:', error.message);
      });

    // 2. Ghi nhật ký điểm
    supabaseClient
      .from('point_logs')
      .insert({
        student_id: student.id,
        class_id: classId,
        points: deltaPoints,
        reason: reason,
        actor_email: currentUser.email || 'unknown'
      })
      .then(({ error }) => {
        if (error) console.warn('[Supabase] Không thể ghi log:', error.message);
      });
  }

  function subscribeRealtime() {
    if (!supabaseClient) return;
    try {
      supabaseClient
        .channel('conic-classroom-realtime')
        .on('postgres_changes', { event: '*', schema: 'public', table: 'students' }, payload => {
          if (payload.new && payload.new.id) {
            const stuId = payload.new.id;
            appState.classes.forEach(c => {
              const s = c.students.find(st => st.id === stuId);
              if (s && s.points !== payload.new.points) {
                s.points = payload.new.points;
                saveState();
                renderClassroomTab();
                renderSeatingChart();
                renderGradebookTab();
                renderLeaderboard();
              }
            });
          }
        })
        .on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'point_logs' }, payload => {
          if (payload.new && payload.new.actor_email && payload.new.actor_email !== currentUser?.email) {
            showToast(`⚡ Điểm vừa được cập nhật bởi ${payload.new.actor_email}: ${payload.new.points > 0 ? '+' : ''}${payload.new.points} XP`, 'success');
          }
        })
        .subscribe();
    } catch (e) {
      console.warn('Lỗi kết nối Realtime:', e);
    }
  }

  async function uploadDataToSupabase() {
    if (!supabaseClient) {
      showToast('Chưa kết nối Supabase!', 'neg');
      return;
    }
    const statusEl = document.getElementById('cloud-sync-status');
    if (statusEl) statusEl.innerHTML = '<span class="text-accent">⏳ Đang đồng bộ năm học, lớp học và học sinh lên Supabase...</span>';

    try {
      // 1. Năm học
      await supabaseClient
        .from('academic_years')
        .upsert({ id: '2026-2027', name: 'Năm học 2026 - 2027', is_active: true });

      // 2. Lớp học
      for (const cls of appState.classes) {
        await supabaseClient
          .from('classes')
          .upsert({
            id: cls.id,
            year_id: '2026-2027',
            name: cls.name,
            teacher_email: 'nguyensangnhc@gmail.com',
            monitor_email: cls.monitorEmail || null
          });

        // 3. Học sinh
        const studentPayloads = cls.students.map((s, idx) => ({
          id: s.id,
          class_id: cls.id,
          stt: idx + 1,
          sbd: s.sbd || '',
          name: s.name,
          gender: s.gender || 'Nam',
          dob: s.dob || '',
          ethnic: s.ethnic || 'Kinh',
          team: s.team || 1,
          points: s.points || 0,
          dgtx1: s.dgtx1 ?? 8.0,
          dgtx2: s.dgtx2 ?? 8.0,
          dgtx3: s.dgtx3 ?? 8.0,
          dgtx4: s.dgtx4 ?? 8.0,
          dgtx5: s.dgtx5 ?? 8.0,
          attitude: s.attitude ?? 10,
          giua_ky: s.giuaKy ?? 8.0,
          cuoi_ky: s.cuoiKy ?? 8.0
        }));

        if (studentPayloads.length > 0) {
          await supabaseClient.from('students').upsert(studentPayloads);
        }
      }

      if (statusEl) statusEl.innerHTML = '<span style="color: var(--primary-dark); font-weight: 700;">✅ Đã đẩy toàn bộ dữ liệu lên Supabase Cloud thành công!</span>';
      showToast('Đã đồng bộ toàn bộ dữ liệu lên Cloud!', 'success');
    } catch (e) {
      if (statusEl) statusEl.innerHTML = `<span class="text-danger">❌ Lỗi đồng bộ: ${escapeHtml(e.message)}</span>`;
      showToast('Lỗi đồng bộ: ' + e.message, 'neg');
    }
  }

  async function downloadDataFromSupabase() {
    if (!supabaseClient) {
      showToast('Chưa kết nối Supabase!', 'neg');
      return;
    }
    const statusEl = document.getElementById('cloud-sync-status');
    if (statusEl) statusEl.innerHTML = '<span class="text-accent">⏳ Đang kéo dữ liệu từ Supabase Cloud...</span>';

    try {
      const { data: dbClasses, error: cErr } = await supabaseClient.from('classes').select('*');
      if (cErr) throw cErr;

      const { data: dbStudents, error: sErr } = await supabaseClient.from('students').select('*').order('stt', { ascending: true });
      if (sErr) throw sErr;

      if (dbClasses && dbClasses.length > 0) {
        dbClasses.forEach(dbc => {
          let localCls = appState.classes.find(c => c.id === dbc.id);
          if (!localCls) {
            localCls = { id: dbc.id, name: dbc.name, customColumns: [], students: [] };
            appState.classes.push(localCls);
          }
          localCls.monitorEmail = dbc.monitor_email || '';

          const classStus = (dbStudents || []).filter(s => s.class_id === dbc.id);
          if (classStus.length > 0) {
            localCls.students = classStus.map(s => ({
              id: s.id,
              name: s.name,
              team: s.team || 1,
              sbd: s.sbd || '',
              points: Number(s.points) || 0,
              dgtx1: s.dgtx1,
              dgtx2: s.dgtx2,
              dgtx3: s.dgtx3,
              dgtx4: s.dgtx4,
              dgtx5: s.dgtx5,
              attitude: s.attitude,
              giuaKy: s.giua_ky,
              cuoiKy: s.cuoi_ky,
              dob: s.dob || '',
              gender: s.gender || 'Nam',
              ethnic: s.ethnic || 'Kinh',
              history: []
            }));
          }
        });

        saveState();
        initApp();
        if (statusEl) statusEl.innerHTML = '<span style="color: var(--primary-dark); font-weight: 700;">✅ Đã kéo dữ liệu từ Cloud về máy thành công!</span>';
        showToast('Đã nạp dữ liệu từ Cloud thành công!', 'success');
      }
    } catch (e) {
      if (statusEl) statusEl.innerHTML = `<span class="text-danger">❌ Lỗi kéo dữ liệu: ${escapeHtml(e.message)}</span>`;
      showToast('Lỗi: ' + e.message, 'neg');
    }
  }

  function initSupabaseAuthAndCloud() {
    initSupabase();
    syncAuthRole();

    if (supabaseClient) {
      subscribeRealtime();
      supabaseClient.auth.onAuthStateChange(() => {
        syncAuthRole();
      });
    }

    // Nút đăng nhập Google
    document.getElementById('btn-google-login')?.addEventListener('click', loginWithGoogle);
    // Nút đăng xuất
    document.getElementById('btn-user-logout')?.addEventListener('click', logoutUser);
    // Nút mở modal Cloud
    document.getElementById('btn-show-cloud-settings')?.addEventListener('click', () => openModal('modal-supabase-cloud'));
    document.getElementById('btn-cloud-sync')?.addEventListener('click', () => openModal('modal-supabase-cloud'));

    // Lưu cấu hình URL & Key
    document.getElementById('btn-save-cloud-config')?.addEventListener('click', () => {
      const url = (document.getElementById('cfg-supabase-url')?.value || '').trim();
      const key = (document.getElementById('cfg-supabase-key')?.value || '').trim();
      if (!url || !key) {
        showToast('Vui lòng nhập đủ URL và Key Supabase', 'warning');
        return;
      }
      localStorage.setItem('conic_supabase_url', url);
      localStorage.setItem('conic_supabase_anon_key', key);
      const ok = initSupabase();
      if (ok) {
        showToast('Đã lưu cấu hình và kết nối Supabase thành công!', 'success');
        document.getElementById('cloud-connection-status').innerHTML = '<span style="color: var(--primary-dark); font-weight: 700;">🟢 Đã kết nối Supabase Client thành công.</span>';
        syncAuthRole();
        subscribeRealtime();
      } else {
        showToast('Đã lưu cấu hình (vui lòng kiểm tra lại URL/Key)', 'warning');
      }
    });

    // Test kết nối
    document.getElementById('btn-test-cloud-config')?.addEventListener('click', async () => {
      if (!supabaseClient) initSupabase();
      if (!supabaseClient) {
        document.getElementById('cloud-connection-status').innerHTML = '<span class="text-danger">🔴 Chưa kết nối được Supabase client.</span>';
        return;
      }
      try {
        const { data, error } = await supabaseClient.from('academic_years').select('id').limit(1);
        if (error) throw error;
        document.getElementById('cloud-connection-status').innerHTML = '<span style="color: var(--primary-dark); font-weight: 700;">🟢 Kết nối cơ sở dữ liệu Supabase hoạt động xuất sắc!</span>';
        showToast('Kết nối Supabase thành công 100%!', 'success');
      } catch (err) {
        document.getElementById('cloud-connection-status').innerHTML = `<span class="text-danger">🔴 Lỗi truy vấn: ${escapeHtml(err.message)}</span>`;
        showToast('Lỗi: ' + err.message, 'neg');
      }
    });

    // Upload & Download
    document.getElementById('btn-upload-to-cloud')?.addEventListener('click', uploadDataToSupabase);
    document.getElementById('btn-download-from-cloud')?.addEventListener('click', downloadDataFromSupabase);

    
    // (Sự kiện học kỳ & nhật ký đối chiếu đã được cấu hình trong initEventListeners)

    // Copy mã SQL tạo bảng 1 chạm
    document.getElementById('btn-copy-sql-schema')?.addEventListener('click', async () => {
      try {
        const res = await fetch('supabase-schema.sql');
        const sql = await res.text();
        await navigator.clipboard.writeText(sql);
        showToast('📋 Đã copy mã SQL vào Clipboard! Thầy mở Supabase > SQL Editor, dán vào và bấm Run.', 'success', 4000);
      } catch (err) {
        window.open('supabase-schema.sql', '_blank');
      }
    });

    // ==========================================
    // SỰ KIỆN TAB 8: QUẢN TRỊ & ĐÁM MÂY
    // ==========================================
    document.getElementById('admin-btn-sync-now')?.addEventListener('click', uploadDataToSupabase);
    document.getElementById('admin-btn-pull-cloud')?.addEventListener('click', downloadDataFromSupabase);
    document.getElementById('admin-btn-backup-json')?.addEventListener('click', () => {
      document.getElementById('btn-export-backup')?.click();
    });

    document.getElementById('admin-btn-new-class')?.addEventListener('click', () => {
      const name = prompt('Nhập tên lớp mới (ví dụ: 12C4, 11B3...):');
      if (!name || !name.trim()) return;
      const newId = 'class_' + Date.now();
      appState.classes.push({ id: newId, name: name.trim(), customColumns: [], students: [] });
      appState.currentClassId = newId;
      saveState();
      renderClassRibbon();
      renderAdminTab();
      showToast(`Đã tạo lớp ${name.trim()} thành công!`, 'success');
    });

    document.getElementById('admin-btn-import-excel')?.addEventListener('click', () => {
      const text = (document.getElementById('admin-excel-textarea')?.value || '').trim();
      if (!text) {
        showToast('Vui lòng dán danh sách học sinh vào ô văn bản.', 'warning');
        return;
      }
      const cls = getCurrentClass();
      const lines = text.split(/\r?\n/).filter(l => l.trim().length > 0);
      const newStu = [];

      lines.forEach((line, idx) => {
        const parts = line.split(/\t|,|;/).map(p => p.trim()).filter(Boolean);
        if (parts.length === 0) return;
        let name = parts[0];
        let team = (idx % 4) + 1;
        let sbd = `12${String(idx + 1).padStart(2, '0')}`;
        if (parts.length >= 2) {
          const num = parseInt(parts[1], 10);
          if (!isNaN(num) && num >= 1 && num <= 8) team = num;
          else sbd = parts[1];
        }
        if (parts.length >= 3) sbd = parts[2];

        newStu.push({
          id: 'stu_' + Date.now() + '_' + idx,
          name: name,
          team: team,
          sbd: sbd,
          points: 0,
          dgtx1: null, dgtx2: null, dgtx3: null, dgtx4: null, dgtx5: null,
          attitude: null,
          giuaKy: null, cuoiKy: null,
          history: []
        });
      });

      if (newStu.length > 0) {
        cls.students = newStu;
        saveState();
        renderClassRibbon();
        renderClassroomTab();
        renderAdminTab();
        document.getElementById('admin-excel-textarea').value = '';
        showToast(`🎉 Đã nạp thành công ${newStu.length} học sinh vào lớp ${cls.name}!`, 'success');
      }
    });

    document.getElementById('admin-btn-export-excel')?.addEventListener('click', () => {
      exportClassToCsv(getCurrentClass());
    });

    document.getElementById('admin-class-list')?.addEventListener('click', (e) => {
      const selectBtn = e.target.closest('.btn-select-teach-class');
      if (selectBtn) {
        appState.currentClassId = selectBtn.dataset.classId;
        saveState();
        renderClassRibbon();
        renderAdminTab();
        showToast(`Đã chuyển sang dạy lớp: ${getCurrentClass().name}`, 'success');
        return;
      }

      const officersBtn = e.target.closest('.btn-admin-manage-officers');
      if (officersBtn) {
        const clsId = officersBtn.dataset.classId;
        openModal('modal-class-officers');
        renderOfficersModal(clsId);
        return;
      }

      const saveMonitorBtn = e.target.closest('.btn-save-cls-monitor');
      if (saveMonitorBtn) {
        const clsId = saveMonitorBtn.dataset.classId;
        const cls = appState.classes.find(c => c.id === clsId);
        if (!cls) return;
        const inputEl = document.querySelector(`.admin-monitor-input[data-class-id="${clsId}"]`);
        const email = (inputEl ? inputEl.value : '').trim().toLowerCase();
        cls.monitorEmail = email;
        saveState();
        showToast(`Đã gán lớp trưởng ${cls.name}: ${email || '(Hủy gán)'}`, 'success');
        if (supabaseClient) {
          supabaseClient
            .from('classes')
            .update({ monitor_email: email || null })
            .eq('id', cls.id)
            .then(({ error }) => {
              if (!error) showToast('Đã đồng bộ lên Supabase Cloud!', 'success');
            });
        }
        return;
      }

      const exportCsvBtn = e.target.closest('.btn-export-cls-csv');
      if (exportCsvBtn) {
        const clsId = exportCsvBtn.dataset.classId;
        const targetCls = appState.classes.find(c => c.id === clsId);
        if (targetCls) exportClassToCsv(targetCls);
        return;
      }
    });
  }

  // ==========================================
  // 16. TAB 8: QUẢN TRỊ & ĐÁM MÂY SUPABASE
  // ==========================================
  function renderAdminTab() {
    const listEl = document.getElementById('admin-class-list');
    const nameEl = document.getElementById('admin-active-class-name');
    const badgeEl = document.getElementById('admin-cloud-badge');
    const currClass = getCurrentClass();

    if (nameEl) nameEl.textContent = `${currClass.name} (${currClass.students.length} HS)`;

    if (badgeEl) {
      if (supabaseClient) {
        badgeEl.className = 'cloud-badge-pill online';
        badgeEl.textContent = '🟢 Đã Kết Nối Supabase Cloud';
      } else {
        badgeEl.className = 'cloud-badge-pill';
        badgeEl.textContent = '🟠 Chế Độ Ngoại Tuyến (Local)';
      }
    }

    if (listEl) {
      listEl.innerHTML = appState.classes.map(cls => {
        const isActive = cls.id === appState.currentClassId;
        return `
          <div class="admin-class-card ${isActive ? 'active-class' : ''}">
            <div class="admin-class-top">
              <div>
                <span class="admin-class-name">${escapeHtml(cls.name)}</span>
                <span class="text-muted small" style="margin-left: 8px;">(${cls.students.length} học sinh)</span>
                ${isActive ? '<span class="pts-badge" style="margin-left: 8px; font-size: 0.72rem;">Đang chọn</span>' : ''}
              </div>
              <div style="display: flex; gap: 6px;">
                ${!isActive ? `<button class="btn-sub-action btn-select-teach-class" data-class-id="${cls.id}">👉 Chọn Dạy</button>` : ''}
                <button class="btn-sub-action btn-export-cls-csv" data-class-id="${cls.id}" title="Tải file Excel/CSV lớp này">📥 Xuất CSV</button>
              </div>
            </div>
            <div class="admin-officers-row">
              <div style="display: flex; align-items: center; gap: 8px;">
                <span style="font-size: 1rem;">🛡️</span>
                <strong>Ban cán sự:</strong>
                <div class="admin-officers-chips-container">
                  ${getMonitorOfficers(cls).length === 0 ? '<span class="text-muted small">Chưa cấp quyền Gmail nào</span>' : getMonitorOfficers(cls).map(o => `
                    <span class="officer-mini-chip">
                      <strong>${escapeHtml(o.role)}:</strong> ${escapeHtml(o.email)}
                    </span>
                  `).join('')}
                </div>
              </div>
              <button class="btn-sub-action btn-officers-action btn-admin-manage-officers" data-class-id="${cls.id}">
                ⚙️ Phân Quyền (${getMonitorOfficers(cls).length})
              </button>
            </div>
          </div>
        `;
      }).join('');
    }
  }

  function exportClassToCsv(cls) {
    if (!cls || !cls.students || cls.students.length === 0) {
      showToast('Lớp chưa có học sinh để xuất.', 'warning');
      return;
    }
    let csv = '\uFEFFSTT,SBD,Họ và tên,Tổ,Điểm tích cực (XP),Ngày sinh,Giới tính,Dân tộc\n';
    cls.students.forEach((s, idx) => {
      csv += `${idx + 1},"${s.sbd || ''}","${s.name || ''}",${s.team || 1},${s.points || 0},"${s.dob || ''}","${s.gender || 'Nam'}","${s.ethnic || 'Kinh'}"\n`;
    });
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = `Danh_Sach_${cls.name.replace(/\s+/g, '_')}.csv`;
    link.click();
    showToast(`Đã xuất file CSV lớp ${cls.name}`, 'success');
  }

  // ==========================================
  // 17. PHÂN HỆ KẾ HOẠCH BÀI DẠY (KHBD) & KÝ SỔ ĐẦU BÀI
  // ==========================================
  let currentKhbdGrade = 'k10';
  let currentKhbdHk = 'hk1';
  let currentKhbdWeek = 1;
  let currentKhbdView = 'week'; // 'week' | 'full'
  let khbdSearchQuery = '';

  // Khởi tạo và liên kết sự kiện KHBD
  function initKHBD() {
    // 1. Tự động tính tuần hiện tại theo ngày hệ thống
    currentKhbdWeek = detectCurrentSchoolWeek();

    // 2. Đồng bộ khối theo lớp hiện tại
    syncKhbdWithClass();

    // 3. Bắt sự kiện chuyển Khối (10, 11, 12)
    document.querySelectorAll('#khbd-grade-pills .khbd-pill').forEach(btn => {
      btn.addEventListener('click', () => {
        document.querySelectorAll('#khbd-grade-pills .khbd-pill').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        currentKhbdGrade = btn.dataset.grade;
        renderKHBD();
      });
    });

    // 4. Bắt sự kiện chuyển Học kỳ (HK1, HK2)
    document.querySelectorAll('#khbd-hk-pills .khbd-pill').forEach(btn => {
      btn.addEventListener('click', () => {
        document.querySelectorAll('#khbd-hk-pills .khbd-pill').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        currentKhbdHk = btn.dataset.hk;
        renderKHBD();
      });
    });

    // 5. Bắt sự kiện chuyển Chế độ xem (Tuần / Toàn bộ 18 tuần)
    const btnViewWeek = document.getElementById('btn-khbd-view-week');
    const btnViewFull = document.getElementById('btn-khbd-view-full');

    btnViewWeek?.addEventListener('click', () => {
      currentKhbdView = 'week';
      btnViewWeek.classList.add('active');
      btnViewFull?.classList.remove('active');
      const weekViewEl = document.getElementById('khbd-week-view');
      const fullViewEl = document.getElementById('khbd-full-view');
      if (weekViewEl) weekViewEl.style.display = 'block';
      if (fullViewEl) fullViewEl.style.display = 'none';
      renderKHBD();
    });

    btnViewFull?.addEventListener('click', () => {
      currentKhbdView = 'full';
      btnViewFull.classList.add('active');
      btnViewWeek?.classList.remove('active');
      const weekViewEl = document.getElementById('khbd-week-view');
      const fullViewEl = document.getElementById('khbd-full-view');
      if (weekViewEl) weekViewEl.style.display = 'none';
      if (fullViewEl) fullViewEl.style.display = 'block';
      renderKhbdFullView();
    });

    // 6. Điều hướng tuần: Trước / Sau / Chọn tuần / Về tuần hiện tại
    document.getElementById('btn-khbd-prev-week')?.addEventListener('click', () => {
      if (currentKhbdWeek > 1) {
        currentKhbdWeek--;
        renderKhbdWeekView();
      } else {
        showToast('Đang ở Tuần 1 đầu học kỳ!', 'info');
      }
    });

    document.getElementById('btn-khbd-next-week')?.addEventListener('click', () => {
      const maxWeeks = getKhbdWeekList().length || 18;
      if (currentKhbdWeek < maxWeeks) {
        currentKhbdWeek++;
        renderKhbdWeekView();
      } else {
        showToast(`Đang ở Tuần ${maxWeeks} cuối học kỳ!`, 'info');
      }
    });

    document.getElementById('khbd-week-select')?.addEventListener('change', (e) => {
      currentKhbdWeek = parseInt(e.target.value, 10) || 1;
      renderKhbdWeekView();
    });

    document.getElementById('btn-khbd-jump-current')?.addEventListener('click', () => {
      const detected = detectCurrentSchoolWeek();
      currentKhbdWeek = detected;
      renderKhbdWeekView();
      showToast(`Đã chuyển về Tuần ${detected} hiện tại`, 'success');
    });

    // 7. Nút chép tóm tắt cả tuần
    document.getElementById('btn-copy-week-summary')?.addEventListener('click', () => {
      const weekData = getKhbdWeekData(currentKhbdWeek);
      if (!weekData) return;
      const cls = getCurrentClass();
      let text = `[KẾ HOẠCH BÀI DẠY - TUẦN ${weekData.tuan} (${weekData.range})]\n`;
      text += `Trường THPT Nguyễn Hữu Cảnh • Môn Toán ${currentKhbdGrade.toUpperCase()} • ${cls ? cls.name : ''}\n\n`;
      weekData.tiets.forEach(p => {
        text += `• Tiết ${p.ppct}: ${p.tenBai} (${p.chuong})\n`;
      });
      if (weekData.alert) {
        text += `\n⚠️ Lưu ý: ${weekData.alert}\n`;
      }
      copyTextToClipboard(text, `Đã chép tóm tắt 4 tiết Tuần ${weekData.tuan} vào Clipboard!`);
    });

    // 8. Sổ ghi nhớ tuần (Debounced auto-save)
    let memoTimeout = null;
    document.getElementById('khbd-weekly-memo')?.addEventListener('input', (e) => {
      const statusEl = document.getElementById('khbd-memo-status');
      if (statusEl) statusEl.textContent = 'Đang lưu...';
      clearTimeout(memoTimeout);
      memoTimeout = setTimeout(() => {
        saveKhbdMemo(currentKhbdGrade, currentKhbdHk, currentKhbdWeek, e.target.value);
        if (statusEl) statusEl.textContent = 'Đã lưu tự động';
      }, 500);
    });

    // 9. Tìm kiếm ở Chế độ toàn bộ 18 tuần
    document.getElementById('khbd-search-input')?.addEventListener('input', (e) => {
      khbdSearchQuery = e.target.value.trim().toLowerCase();
      renderKhbdFullView();
    });
  }

  // Tự động nhận diện tuần theo ngày
  function detectCurrentSchoolWeek() {
    const today = new Date();
    const todayStr = `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`;
    const weeks = window.KHBD_DATA?.k10?.hk1 || [];
    for (let i = 0; i < weeks.length; i++) {
      if (todayStr >= weeks[i].startDate && todayStr <= weeks[i].endDate) {
        return weeks[i].tuan;
      }
    }
    if (weeks.length > 0) {
      if (todayStr < weeks[0].startDate) return 1;
      if (todayStr > weeks[weeks.length - 1].endDate) return weeks.length;
    }
    return 1;
  }

  // Đồng bộ khối lớp KHBD với lớp đang chọn trong ConicClassroom
  function syncKhbdWithClass() {
    const cls = getCurrentClass();
    if (!cls) return;
    const nameLower = cls.name.toLowerCase();
    let detectedGrade = null;
    if (nameLower.includes('10')) detectedGrade = 'k10';
    else if (nameLower.includes('11')) detectedGrade = 'k11';
    else if (nameLower.includes('12')) detectedGrade = 'k12';

    if (detectedGrade && detectedGrade !== currentKhbdGrade) {
      currentKhbdGrade = detectedGrade;
      document.querySelectorAll('#khbd-grade-pills .khbd-pill').forEach(btn => {
        if (btn.dataset.grade === currentKhbdGrade) btn.classList.add('active');
        else btn.classList.remove('active');
      });
    }

    const classLabelEl = document.getElementById('khbd-active-class-name');
    if (classLabelEl) classLabelEl.textContent = cls.name;
  }

  function getKhbdWeekList() {
    const gradeData = window.KHBD_DATA?.[currentKhbdGrade];
    if (!gradeData) return [];
    return gradeData[currentKhbdHk] || [];
  }

  function getKhbdWeekData(tuan) {
    const list = getKhbdWeekList();
    return list.find(w => w.tuan === tuan) || list[0] || null;
  }

  // Ghi nhớ và đọc Memo tuần
  function getKhbdMemo(grade, hk, tuan) {
    try {
      return localStorage.getItem(`conic_khbd_memo_${grade}_${hk}_w${tuan}`) || '';
    } catch (e) {
      return '';
    }
  }

  function saveKhbdMemo(grade, hk, tuan, text) {
    try {
      localStorage.setItem(`conic_khbd_memo_${grade}_${hk}_w${tuan}`, text);
    } catch (e) {}
  }

  // Quản lý trạng thái "Đã dạy" theo lớp
  function getPeriodTaughtKey(classId, grade, hk, tuan, periodIdx) {
    return `taught_${classId}_${grade}_${hk}_w${tuan}_p${periodIdx}`;
  }

  function isPeriodTaught(classId, grade, hk, tuan, periodIdx) {
    try {
      const key = getPeriodTaughtKey(classId, grade, hk, tuan, periodIdx);
      return localStorage.getItem(key) === 'true';
    } catch (e) {
      return false;
    }
  }

  function togglePeriodTaught(classId, grade, hk, tuan, periodIdx, btnEl, cardEl) {
    const key = getPeriodTaughtKey(classId, grade, hk, tuan, periodIdx);
    const curr = isPeriodTaught(classId, grade, hk, tuan, periodIdx);
    const newVal = !curr;
    try {
      localStorage.setItem(key, String(newVal));
    } catch (e) {}

    const cls = getCurrentClass();
    const clsName = cls ? cls.name : '';

    if (newVal) {
      btnEl.classList.add('is-taught');
      btnEl.innerHTML = '✅ Đã dạy xong';
      cardEl?.classList.add('taught');
      showToast(`Đã ghi nhận ${clsName} hoàn thành tiết học này!`, 'success');
    } else {
      btnEl.classList.remove('is-taught');
      btnEl.innerHTML = '⚪ Chưa dạy';
      cardEl?.classList.remove('taught');
      showToast(`Đã bỏ đánh dấu tiết học cho ${clsName}`, 'info');
    }
  }

  // Hàm sao chép clipboard chung
  function copyTextToClipboard(text, successMsg) {
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(text).then(() => {
        showToast(successMsg, 'success');
      }).catch(() => {
        fallbackCopyText(text, successMsg);
      });
    } else {
      fallbackCopyText(text, successMsg);
    }
  }

  function fallbackCopyText(text, successMsg) {
    const ta = document.createElement('textarea');
    ta.value = text;
    ta.style.position = 'fixed';
    ta.style.opacity = '0';
    document.body.appendChild(ta);
    ta.select();
    try {
      document.execCommand('copy');
      showToast(successMsg, 'success');
    } catch (err) {
      showToast('Không thể sao chép tự động. Xin hãy bôi đen text để chép.', 'warning');
    }
    document.body.removeChild(ta);
  }

  // Render toàn bộ phân hệ KHBD
  function renderKHBD() {
    syncKhbdWithClass();
    const weeks = getKhbdWeekList();
    const weekViewEl = document.getElementById('khbd-week-view');
    const fullViewEl = document.getElementById('khbd-full-view');

    if (!weeks || weeks.length === 0) {
      // Hiển thị thông báo chưa có dữ liệu cho khối này
      if (weekViewEl) {
        weekViewEl.innerHTML = `
          <div class="empty-state-card" style="text-align: center; padding: 48px 24px; background: var(--bg-card); border: 1px dashed var(--border); border-radius: 16px;">
            <div style="font-size: 3rem; margin-bottom: 14px;">📂</div>
            <h3 style="font-size: 1.25rem; font-weight: 800; color: var(--text-main); margin-bottom: 8px;">
              Chưa Có Dữ Liệu Kế Hoạch Dạy Học: ${currentKhbdGrade.toUpperCase()} - ${currentKhbdHk.toUpperCase()}
            </h3>
            <p class="text-muted" style="max-width: 520px; margin: 0 auto 18px; line-height: 1.5;">
              Hệ thống hiện đã nạp hoàn tất <strong>Khối 10 - Học kỳ I (72 tiết)</strong>. Thầy gửi tiếp ảnh/tài liệu cho <strong>Khối 11, Khối 12 hoặc Học kỳ II</strong>, hệ thống sẽ số hóa và cập nhật ngay lập tức!
            </p>
            <button class="btn-sub-action" onclick="document.querySelector('#khbd-grade-pills [data-grade=k10]').click();" style="padding: 10px 20px; font-weight: 700;">
              👉 Chuyển Về Toán Khối 10 (Đã Có Đầy Đủ 18 Tuần)
            </button>
          </div>
        `;
      }
      return;
    }

    if (currentKhbdView === 'week') {
      renderKhbdWeekView();
    } else {
      renderKhbdFullView();
    }
  }

  // Render View 1: Tiêu điểm tuần
  function renderKhbdWeekView() {
    const weeks = getKhbdWeekList();
    const weekViewEl = document.getElementById('khbd-week-view');
    if (!weeks || weeks.length === 0) return;

    // Đảm bảo weekViewEl có khung HTML nếu trước đó bị ghi đè bởi empty state
    if (!document.getElementById('khbd-week-select')) {
      weekViewEl.innerHTML = `
        <div class="khbd-week-navbar">
          <button id="btn-khbd-prev-week" class="btn-week-step" type="button" title="Xem tuần trước">
            ◀ Tuần Trước
          </button>
          <div class="khbd-week-center-ctrl">
            <select id="khbd-week-select" class="clean-select khbd-week-dropdown" title="Chọn tuần"></select>
            <button id="btn-khbd-jump-current" class="btn-today-pill" type="button" title="Quay về tuần tương ứng với ngày hôm nay">
              ⚡ Về Tuần Hiện Tại
            </button>
          </div>
          <button id="btn-khbd-next-week" class="btn-week-step" type="button" title="Xem tuần sau">
            Tuần Sau ▶
          </button>
        </div>
        <div id="khbd-week-alert" class="khbd-radar-alert" style="display: none;">
          <span class="radar-icon">🔔</span>
          <div id="khbd-alert-text" class="radar-text">...</div>
        </div>
        <div id="khbd-next-week-alert" class="khbd-radar-alert next-week-alert" style="display: none;">
          <span class="radar-icon">📢</span>
          <div id="khbd-next-alert-text" class="radar-text">...</div>
        </div>
        <div class="khbd-sub-toolbar">
          <div class="khbd-active-class-info">
            <span class="info-label">Lớp đang theo dõi:</span>
            <span id="khbd-active-class-name" class="class-name-badge">Lớp 10A1</span>
            <span class="sync-desc">Tick chọn <strong class="text-success">✅ Đã dạy</strong> để ghi nhớ tiến độ từng lớp và tránh lệch tiết!</span>
          </div>
          <div class="khbd-toolbar-actions">
            <button id="btn-copy-week-summary" class="btn-sub-action btn-copy-all" type="button" title="Chép tóm tắt nội dung 4 tiết tuần này">
              📋 Chép Cả 4 Tiết Tuần Này
            </button>
          </div>
        </div>
        <div id="khbd-periods-grid" class="khbd-periods-grid"></div>
        <div class="khbd-memo-box">
          <div class="memo-top-row">
            <div class="memo-title-wrap">
              <span class="memo-icon">📝</span>
              <h4 class="memo-title">Sổ Ghi Chép Nhắc Nhớ Tuần — <span id="khbd-memo-week-label">Tuần 1</span></h4>
            </div>
            <span id="khbd-memo-status" class="memo-saved-tag">Đã lưu tự động</span>
          </div>
          <textarea id="khbd-weekly-memo" class="khbd-memo-textarea" rows="2" placeholder="Ghi nhớ việc của thầy trong tuần này (VD: Dặn 10A1 mang máy tính Casio; in đề KTTX1; kiểm tra bài tập về nhà Tổ 2...)"></textarea>
        </div>
      `;
      // Re-attach listeners for week controls
      document.getElementById('btn-khbd-prev-week')?.addEventListener('click', () => {
        if (currentKhbdWeek > 1) {
          currentKhbdWeek--;
          renderKhbdWeekView();
        }
      });
      document.getElementById('btn-khbd-next-week')?.addEventListener('click', () => {
        const maxWeeks = getKhbdWeekList().length || 18;
        if (currentKhbdWeek < maxWeeks) {
          currentKhbdWeek++;
          renderKhbdWeekView();
        }
      });
      document.getElementById('khbd-week-select')?.addEventListener('change', (e) => {
        currentKhbdWeek = parseInt(e.target.value, 10) || 1;
        renderKhbdWeekView();
      });
      document.getElementById('btn-khbd-jump-current')?.addEventListener('click', () => {
        currentKhbdWeek = detectCurrentSchoolWeek();
        renderKhbdWeekView();
      });
      document.getElementById('btn-copy-week-summary')?.addEventListener('click', () => {
        const weekData = getKhbdWeekData(currentKhbdWeek);
        if (!weekData) return;
        const cls = getCurrentClass();
        let text = `[KẾ HOẠCH BÀI DẠY - TUẦN ${weekData.tuan} (${weekData.range})]\n`;
        text += `Trường THPT Nguyễn Hữu Cảnh • Môn Toán ${currentKhbdGrade.toUpperCase()} • ${cls ? cls.name : ''}\n\n`;
        weekData.tiets.forEach(p => {
          text += `• Tiết ${p.ppct}: ${p.tenBai} (${p.chuong})\n`;
        });
        if (weekData.alert) {
          text += `\n⚠️ Lưu ý: ${weekData.alert}\n`;
        }
        copyTextToClipboard(text, `Đã chép tóm tắt 4 tiết Tuần ${weekData.tuan} vào Clipboard!`);
      });
      let memoTimeout = null;
      document.getElementById('khbd-weekly-memo')?.addEventListener('input', (e) => {
        const statusEl = document.getElementById('khbd-memo-status');
        if (statusEl) statusEl.textContent = 'Đang lưu...';
        clearTimeout(memoTimeout);
        memoTimeout = setTimeout(() => {
          saveKhbdMemo(currentKhbdGrade, currentKhbdHk, currentKhbdWeek, e.target.value);
          if (statusEl) statusEl.textContent = 'Đã lưu tự động';
        }, 500);
      });
    }

    if (currentKhbdWeek < 1) currentKhbdWeek = 1;
    if (currentKhbdWeek > weeks.length) currentKhbdWeek = weeks.length;

    const currentSchoolWeek = detectCurrentSchoolWeek();
    const weekData = getKhbdWeekData(currentKhbdWeek);
    if (!weekData) return;

    // 1. Cập nhật Dropdown chọn tuần
    const weekSelect = document.getElementById('khbd-week-select');
    if (weekSelect) {
      weekSelect.innerHTML = weeks.map(w => {
        const isCurrent = w.tuan === currentSchoolWeek;
        const selected = w.tuan === currentKhbdWeek ? 'selected' : '';
        return `<option value="${w.tuan}" ${selected}>
          Tuần ${w.tuan}: ${w.range} ${isCurrent ? '⭐ (Tuần Này)' : ''}
        </option>`;
      }).join('');
    }

    // 2. Banner Radar Cảnh Báo (Tuần hiện tại & Tuần sau)
    const alertBox = document.getElementById('khbd-week-alert');
    const alertText = document.getElementById('khbd-alert-text');
    if (alertBox && alertText) {
      if (weekData.alert) {
        alertBox.style.display = 'flex';
        alertText.textContent = weekData.alert;
      } else {
        alertBox.style.display = 'none';
      }
    }

    const nextAlertBox = document.getElementById('khbd-next-week-alert');
    const nextAlertText = document.getElementById('khbd-next-alert-text');
    if (nextAlertBox && nextAlertText) {
      const nextWeekData = weeks.find(w => w.tuan === weekData.tuan + 1);
      if (nextWeekData) {
        const examPeriods = (nextWeekData.tiets || []).filter(p => 
          p.type === 'exam' || 
          /KTTX|kiểm tra|thi/i.test(p.tenBai || '') || 
          /KTTX|kiểm tra|thi/i.test(p.ghiChu || '')
        );
        const hasExamAlert = /kiểm tra|KTTX|thi|giữa kỳ|cuối kỳ/i.test(nextWeekData.alert || '');

        if (examPeriods.length > 0 || hasExamAlert) {
          let details = examPeriods.map(p => `Tiết ${p.ppct}: ${p.ghiChu || p.tenBai}`).join(', ');
          if (!details) details = nextWeekData.alert || 'Kiểm tra';
          nextAlertBox.style.display = 'flex';
          nextAlertText.innerHTML = `<strong>📢 NHẮC NHỞ TUẦN SAU (Tuần ${nextWeekData.tuan}: ${nextWeekData.range}):</strong> Sắp có <strong>${escapeHtml(details)}</strong>! Thầy nhớ dặn học sinh chuẩn bị bài và ôn tập trước từ tuần này nhé.`;
        } else {
          nextAlertBox.style.display = 'none';
        }
      } else {
        nextAlertBox.style.display = 'none';
      }
    }

    // 3. Render 4 Cards Tiết học
    const gridEl = document.getElementById('khbd-periods-grid');
    const cls = getCurrentClass();
    const classId = cls ? cls.id : 'unknown';

    if (gridEl && weekData.tiets) {
      gridEl.innerHTML = weekData.tiets.map((period, idx) => {
        const taught = isPeriodTaught(classId, currentKhbdGrade, currentKhbdHk, weekData.tuan, idx);
        
        let badgeClass = 'badge-ppct-standard';
        let badgeLabel = `Tiết ${period.ppct}`;
        if (period.type === 'chuyende') {
          badgeClass = 'badge-ppct-chuyende';
          badgeLabel = `📘 Tiết ${period.ppct}`;
        } else if (period.type === 'exam') {
          badgeClass = 'badge-ppct-exam';
          badgeLabel = `📝 ${period.ghiChu || 'Kiểm Tra'}`;
        } else if (period.type === 'trainghiem') {
          badgeClass = 'badge-ppct-trainghiem';
          badgeLabel = `🌟 Trải Nghiệm`;
        }

        return `
          <div class="khbd-period-card ${taught ? 'taught' : ''}" id="period-card-${weekData.tuan}-${idx}">
            <div class="period-card-top">
              <span class="period-badge-ppct ${badgeClass}">${badgeLabel}</span>
              <button class="btn-toggle-taught ${taught ? 'is-taught' : ''}" 
                      data-week="${weekData.tuan}" 
                      data-idx="${idx}"
                      type="button">
                ${taught ? '✅ Đã dạy xong' : '⚪ Chưa dạy'}
              </button>
            </div>
            <div class="period-card-chuong">${escapeHtml(period.chuong)}</div>
            <div class="period-card-name">${escapeHtml(period.tenBai)}</div>
            <div class="period-card-footer">
              <button class="btn-copy-sign" 
                      data-ppct="${period.ppct}" 
                      data-name="${escapeHtml(period.tenBai)}"
                      type="button" 
                      title="Chép chuỗi 'Tiết ${period.ppct}: ${escapeHtml(period.tenBai)}' để ký sổ">
                📋 Ký Sổ (Tiết + Tên)
              </button>
              <button class="btn-copy-title-only" 
                      data-name="${escapeHtml(period.tenBai)}"
                      type="button" 
                      title="Chỉ chép tên bài để dán vào ô Tên bài học trên VnEdu/SMAS">
                Chỉ Tên Bài
              </button>
            </div>
          </div>
        `;
      }).join('');

      // Gán sự kiện cho các nút trong thẻ tiết
      gridEl.querySelectorAll('.btn-toggle-taught').forEach(btn => {
        btn.addEventListener('click', (e) => {
          e.stopPropagation();
          const wNum = parseInt(btn.dataset.week, 10);
          const pIdx = parseInt(btn.dataset.idx, 10);
          const cardEl = document.getElementById(`period-card-${wNum}-${pIdx}`);
          togglePeriodTaught(classId, currentKhbdGrade, currentKhbdHk, wNum, pIdx, btn, cardEl);
        });
      });

      gridEl.querySelectorAll('.btn-copy-sign').forEach(btn => {
        btn.addEventListener('click', () => {
          const ppct = btn.dataset.ppct;
          const name = btn.dataset.name;
          const textToCopy = `Tiết ${ppct}: ${name}`;
          copyTextToClipboard(textToCopy, `Đã chép: "${textToCopy}" vào Clipboard để ký sổ!`);
          btn.classList.add('copied');
          btn.innerHTML = '✓ Đã Chép!';
          setTimeout(() => {
            btn.classList.remove('copied');
            btn.innerHTML = '📋 Ký Sổ (Tiết + Tên)';
          }, 1500);
        });
      });

      gridEl.querySelectorAll('.btn-copy-title-only').forEach(btn => {
        btn.addEventListener('click', () => {
          const name = btn.dataset.name;
          copyTextToClipboard(name, `Đã chép tên bài: "${name}"!`);
        });
      });
    }

    // 4. Cập nhật Sổ ghi nhớ tuần
    const memoLabel = document.getElementById('khbd-memo-week-label');
    const memoTextarea = document.getElementById('khbd-weekly-memo');
    if (memoLabel) memoLabel.textContent = `Tuần ${weekData.tuan} (${weekData.range})`;
    if (memoTextarea) {
      memoTextarea.value = getKhbdMemo(currentKhbdGrade, currentKhbdHk, weekData.tuan);
    }
  }

  // Render View 2: Xem toàn bộ 18 tuần
  function renderKhbdFullView() {
    const weeks = getKhbdWeekList();
    const tbody = document.getElementById('khbd-full-tbody');
    const countBadge = document.getElementById('khbd-full-count-badge');
    if (!tbody || !weeks) return;

    const currentSchoolWeek = detectCurrentSchoolWeek();
    let rowsHtml = '';
    let totalPeriodsShown = 0;

    weeks.forEach(w => {
      const isCurrentWeek = w.tuan === currentSchoolWeek;
      w.tiets.forEach((period, pIdx) => {
        // Lọc theo tìm kiếm nếu có
        if (khbdSearchQuery) {
          const matchPpct = String(period.ppct).toLowerCase().includes(khbdSearchQuery);
          const matchName = period.tenBai.toLowerCase().includes(khbdSearchQuery);
          const matchChuong = period.chuong.toLowerCase().includes(khbdSearchQuery);
          const matchTuan = `tuần ${w.tuan}`.includes(khbdSearchQuery);
          if (!matchPpct && !matchName && !matchChuong && !matchTuan) {
            return;
          }
        }

        totalPeriodsShown++;
        const isExam = period.type === 'exam';

        rowsHtml += `
          <tr class="${isExam ? 'row-exam' : ''}">
            <td class="tuan-cell ${isCurrentWeek ? 'current-week' : ''}">
              T${w.tuan}
            </td>
            <td class="small text-muted">${w.range}</td>
            <td style="text-align: center; font-weight: 800; color: ${period.type === 'chuyende' ? '#7c3aed' : isExam ? '#dc2626' : 'var(--text-main)'};">
              ${period.ppct}
            </td>
            <td>
              <span class="small font-weight-bold" style="color: var(--text-muted);">${escapeHtml(period.chuong)}</span>
            </td>
            <td>
              <div style="font-weight: 700; color: var(--text-main);">${escapeHtml(period.tenBai)}</div>
              ${period.ghiChu ? `<span class="badge-ppct-exam small" style="display: inline-block; margin-top: 3px; padding: 1px 6px;">${escapeHtml(period.ghiChu)}</span>` : ''}
            </td>
            <td style="text-align: center;">
              <button class="btn-table-copy" 
                      data-ppct="${period.ppct}" 
                      data-name="${escapeHtml(period.tenBai)}"
                      type="button" 
                      title="Chép để ký sổ">
                📋 Ký Sổ
              </button>
            </td>
          </tr>
        `;
      });
    });

    if (rowsHtml === '') {
      tbody.innerHTML = `
        <tr>
          <td colspan="6" style="text-align: center; padding: 32px; color: var(--text-muted);">
            🔍 Không tìm thấy bài dạy nào phù hợp với từ khóa "<strong>${escapeHtml(khbdSearchQuery)}</strong>"
          </td>
        </tr>
      `;
    } else {
      tbody.innerHTML = rowsHtml;
    }

    if (countBadge) {
      if (khbdSearchQuery) {
        countBadge.textContent = `Tìm thấy ${totalPeriodsShown} tiết phù hợp`;
      } else {
        countBadge.textContent = `Tổng cộng ${weeks.length} tuần • ${totalPeriodsShown} tiết`;
      }
    }

    // Gán sự kiện nút Copy trong bảng
    tbody.querySelectorAll('.btn-table-copy').forEach(btn => {
      btn.addEventListener('click', () => {
        const text = `Tiết ${btn.dataset.ppct}: ${btn.dataset.name}`;
        copyTextToClipboard(text, `Đã chép: "${text}"!`);
      });
    });
  }

  window.addEventListener('DOMContentLoaded', initApp);
})();
