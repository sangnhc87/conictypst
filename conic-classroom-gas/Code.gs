/**
 * HỆ THỐNG QUẢN LÝ LỚP HỌC CONIC CLASSROOM (Phiên bản Google Sheets)
 */

function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('🎯 ConicClassroom')
      .addItem('Mở Vòng Quay Gọi Tên', 'openSidebar')
      .addSeparator()
      .addItem('Cộng +1 XP (Học sinh đang chọn)', 'addOneXP')
      .addItem('Trừ -1 XP (Học sinh đang chọn)', 'subOneXP')
      .addSeparator()
      .addItem('Chia Nhóm Ngẫu Nhiên', 'randomGroups')
      .addItem('Rã Điểm Nhóm Về Cá Nhân', 'distributeGroupPoints')
      .addToUi();
}

/**
 * Mở Sidebar Vòng quay may mắn
 */
function openSidebar() {
  var html = HtmlService.createHtmlOutputFromFile('Sidebar')
      .setTitle('🎡 Vòng Quay Gọi Tên')
      .setWidth(300);
  SpreadsheetApp.getUi().showSidebar(html);
}

/**
 * Cộng 1 XP cho (các) ô Tên Học Sinh đang bôi đen
 */
function addOneXP() {
  updateXP(1);
}

/**
 * Trừ 1 XP cho (các) ô Tên Học Sinh đang bôi đen
 */
function subOneXP() {
  updateXP(-1);
}

function updateXP(amount) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("DS_Lop");
  if (!sheet) {
    SpreadsheetApp.getUi().alert("Không tìm thấy sheet 'DS_Lop'. Vui lòng kiểm tra lại tên sheet.");
    return;
  }
  
  var activeRange = SpreadsheetApp.getActiveRange();
  if (activeRange.getSheet().getName() !== "DS_Lop") {
    SpreadsheetApp.getUi().alert("Vui lòng chọn học sinh bên trong sheet 'DS_Lop'.");
    return;
  }

  var numRows = activeRange.getNumRows();
  var startRow = activeRange.getRow();
  
  // Giả sử: Cột B là Tên (cột 2), Cột D là XP (cột 4)
  // Xử lý lấy điểm hiện tại và cộng thêm
  for (var i = 0; i < numRows; i++) {
    var currentRow = startRow + i;
    // Bỏ qua dòng tiêu đề
    if (currentRow === 1) continue;
    
    var xpCell = sheet.getRange(currentRow, 4); 
    var currentXP = xpCell.getValue();
    currentXP = (currentXP === "" || isNaN(currentXP)) ? 0 : Number(currentXP);
    
    var newXP = currentXP + amount;
    xpCell.setValue(newXP);
  }
  
  // Tuỳ chọn: Ghi Log ở đây nếu bạn tạo thêm sheet Lich_Su
}

/**
 * Lấy danh sách tên học sinh (Để đưa vào Vòng Quay ở Sidebar)
 */
function getStudentNames() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("DS_Lop");
  if (!sheet) return [];
  
  var lastRow = sheet.getLastRow();
  if (lastRow < 2) return [];
  
  // Lấy dữ liệu Cột B (Tên học sinh) từ dòng 2
  var names = sheet.getRange(2, 2, lastRow - 1, 1).getValues();
  var flatNames = [];
  for (var i = 0; i < names.length; i++) {
    if (names[i][0] && names[i][0].toString().trim() !== "") {
      flatNames.push(names[i][0]);
    }
  }
  return flatNames;
}

/**
 * Trộn mảng ngẫu nhiên (Fisher-Yates)
 */
function shuffleArray(array) {
  for (var i = array.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1));
    var temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
  return array;
}

/**
 * Chia 4 nhóm ngẫu nhiên
 */
function randomGroups() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheetDs = ss.getSheetByName("DS_Lop");
  var sheetNhom = ss.getSheetByName("Chia_Nhom");
  
  if (!sheetDs || !sheetNhom) {
    SpreadsheetApp.getUi().alert("Thiếu sheet 'DS_Lop' hoặc 'Chia_Nhom'!");
    return;
  }
  
  var students = getStudentNames();
  if (students.length === 0) return;
  
  students = shuffleArray(students);
  
  // Chia làm 4 nhóm
  var numGroups = 4;
  var groups = [[], [], [], []];
  
  for (var i = 0; i < students.length; i++) {
    groups[i % numGroups].push(students[i]);
  }
  
  // Xóa dữ liệu cũ
  sheetNhom.getRange("A2:C100").clearContent();
  
  // Ghi dữ liệu mới
  var writeRow = 2;
  for (var g = 0; g < numGroups; g++) {
    for (var j = 0; j < groups[g].length; j++) {
      sheetNhom.getRange(writeRow, 1).setValue("Nhóm " + (g + 1));
      sheetNhom.getRange(writeRow, 2).setValue(groups[g][j]);
      // Cột 3 là Điểm Nhóm (trống để GV tự nhập)
      writeRow++;
    }
  }
  SpreadsheetApp.getUi().alert("Đã chia thành 4 nhóm ngẫu nhiên thành công!");
}

/**
 * Rã điểm nhóm về cá nhân
 */
function distributeGroupPoints() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheetDs = ss.getSheetByName("DS_Lop");
  var sheetNhom = ss.getSheetByName("Chia_Nhom");
  
  if (!sheetDs || !sheetNhom) return;
  
  var lastRowNhom = sheetNhom.getLastRow();
  var groupData = sheetNhom.getRange(2, 1, lastRowNhom - 1, 3).getValues(); // Nhóm | Tên | Điểm Nhóm
  
  var lastRowDs = sheetDs.getLastRow();
  var dsData = sheetDs.getRange(2, 2, lastRowDs - 1, 3).getValues(); // Tên (Cột B), Tổ (C), XP (D)
  
  var updated = 0;
  
  for (var i = 0; i < groupData.length; i++) {
    var hsName = groupData[i][1];
    var diemNhom = groupData[i][2];
    
    if (hsName && diemNhom && !isNaN(diemNhom)) {
      diemNhom = Number(diemNhom);
      
      // Tìm trong DS Lớp để cộng điểm
      for (var j = 0; j < dsData.length; j++) {
        if (dsData[j][0] === hsName) {
          var currentXP = dsData[j][2];
          currentXP = (currentXP === "" || isNaN(currentXP)) ? 0 : Number(currentXP);
          var newXP = currentXP + diemNhom;
          
          // Ghi lại vào Cột D (cột 4)
          sheetDs.getRange(j + 2, 4).setValue(newXP);
          updated++;
          break;
        }
      }
    }
  }
  
  if (updated > 0) {
    SpreadsheetApp.getUi().alert("Đã rã điểm thành công cho " + updated + " học sinh!");
    // Tự động xoá điểm nhóm đi để tránh cộng trùng
    sheetNhom.getRange(2, 3, lastRowNhom - 1, 1).clearContent();
  } else {
    SpreadsheetApp.getUi().alert("Không có điểm nào được rã. Hãy chắc chắn bạn đã nhập số vào cột 'Điểm Nhóm'.");
  }
}
