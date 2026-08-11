const number = (key, label, value, min = '', max = '', step = '0.1') => ({
  key, label, type: 'number', value, min, max, step,
})

const text = (key, label, value) => ({ key, label, type: 'text', value })
const color = (key, label, value) => ({ key, label, type: 'color', value })
const paint = (key, label, value) => ({ key, label, type: 'paint', value })
const toggle = (key, label, value) => ({ key, label, type: 'boolean', value })
const pair = (key, label, value) => ({ key, label, type: 'pair', value })
const triple = (key, label, value) => ({ key, label, type: 'triple', value })
const range = (key, label, value) => ({ key, label, type: 'range', value })

export const COMMANDS = [
  {
    id: 'draw-ellipse', name: 'Elip', category: '2D', icon: '⌒', tone: 'blue',
    description: 'Elip tâm O, bán trục a và b.',
    fields: [pair('center', 'Tâm (x, y)', [0, 0]), number('a', 'Bán trục a', 3, 0.1, 20), number('b', 'Bán trục b', 2, 0.1, 20), number('angle', 'Góc xoay', 0, -360, 360, '1'), number('samples', 'Độ mịn', 100, 24, 240, '1'), color('stroke', 'Màu nét', '#2b6cb0')],
  },
  {
    id: 'draw-parabola', name: 'Parabol', category: '2D', icon: '∪', tone: 'blue',
    description: 'Đường cong y = ax² + bx + c.',
    fields: [number('a', 'Hệ số a', 1, -20, 20), number('b', 'Hệ số b', 0, -20, 20), number('c', 'Hệ số c', 0, -20, 20), range('x-range', 'Khoảng x', [-3, 3]), number('samples', 'Độ mịn', 80, 24, 240, '1'), color('stroke', 'Màu nét', '#2b6cb0')],
  },
  {
    id: 'draw-hyperbola', name: 'Hyperbol', category: '2D', icon: ')( ', tone: 'blue',
    description: 'Hyperbol x²/a² − y²/b² = 1.',
    fields: [number('a', 'Bán trục a', 1, 0.1, 20), number('b', 'Bán trục b', 1, 0.1, 20), range('x-range', 'Khoảng x', [1.2, 4]), number('samples', 'Độ mịn', 80, 24, 240, '1'), color('stroke', 'Màu nét', '#2b6cb0')],
  },
  {
    id: 'draw-cone', name: 'Hình nón', category: '3D', icon: '△', tone: 'orange',
    description: 'Hình nón phối cảnh, có anchor để đặt nhãn.',
    fields: [number('radius', 'Bán kính đáy', 2, 0.1, 20), number('height', 'Chiều cao', 4, 0.1, 30), triple('center', 'Tâm đáy (x, y, z)', [0, 0, 0]), color('stroke', 'Màu nét', '#2b6cb0'), paint('fill', 'Màu thân', 'none'), toggle('show-hidden', 'Hiện nét khuất', true)],
  },
  {
    id: 'draw-cylinder', name: 'Hình trụ', category: '3D', icon: '▱', tone: 'orange',
    description: 'Hình trụ với đáy elip và nét khuất.',
    fields: [number('radius', 'Bán kính', 2, 0.1, 20), number('height', 'Chiều cao', 4, 0.1, 30), triple('center', 'Tâm đáy (x, y, z)', [0, 0, 0]), color('stroke', 'Màu nét', '#2b6cb0'), paint('fill', 'Màu thân', 'none'), toggle('show-hidden', 'Hiện nét khuất', true)],
  },
  {
    id: 'draw-sphere', name: 'Hình cầu', category: '3D', icon: '◉', tone: 'orange',
    description: 'Hình cầu với xích đạo và kinh tuyến tùy chọn.',
    fields: [number('radius', 'Bán kính', 2, 0.1, 20), triple('center', 'Tâm (x, y, z)', [0, 0, 0]), color('stroke', 'Màu nét', '#2b6cb0'), paint('fill', 'Màu mặt cầu', 'none'), toggle('show-equator', 'Hiện xích đạo', true), toggle('show-meridian', 'Hiện kinh tuyến', false), toggle('show-hidden', 'Hiện nét khuất', true)],
  },
  {
    id: 'draw-helix', name: 'Đường xoắn ốc', category: '3D', icon: '∿', tone: 'orange',
    description: 'Đường xoắn ốc trên mặt trụ.',
    fields: [number('radius', 'Bán kính', 2, 0.1, 20), number('height', 'Chiều cao', 4, 0.1, 30), number('loops', 'Số vòng', 1.5, 0.25, 12, '0.25'), triple('center', 'Tâm (x, y, z)', [0, 0, 0]), number('samples', 'Độ mịn', 200, 40, 400, '1'), color('stroke', 'Màu nét', '#e07a2d')],
  },
  {
    id: 'draw-conical-helix', name: 'Xoắn ốc nón', category: '3D', icon: '⟋', tone: 'orange',
    description: 'Đường xoắn ốc bám trên mặt nón.',
    fields: [number('base-radius', 'Bán kính đáy', 2, 0.1, 20), number('height', 'Chiều cao', 4, 0.1, 30), number('loops', 'Số vòng', 2, 0.25, 12, '0.25'), triple('center', 'Tâm đáy (x, y, z)', [0, 0, 0]), number('samples', 'Độ mịn', 200, 40, 400, '1'), color('stroke', 'Màu nét', '#e07a2d')],
  },
  {
    id: 'draw-saddle', name: 'Mặt yên ngựa', category: 'Mặt cong', icon: '⌁', tone: 'violet',
    description: 'Mặt z = x² − y² dạng lưới.',
    fields: [range('x-range', 'Khoảng x', [-2, 2]), range('y-range', 'Khoảng y', [-2, 2]), number('samples', 'Độ mịn lưới', 16, 6, 30, '1'), color('stroke', 'Màu lưới', '#7c58c7')],
  },
  {
    id: 'draw-paraboloid', name: 'Paraboloid', category: 'Mặt cong', icon: '⌃', tone: 'violet',
    description: 'Mặt paraboloid elliptic dạng lưới.',
    fields: [number('a', 'Bán trục a', 2, 0.1, 12), number('b', 'Bán trục b', 2, 0.1, 12), number('z-max', 'Độ cao tối đa', 4, 0.1, 30), number('samples', 'Độ mịn lưới', 16, 6, 30, '1'), color('stroke', 'Màu lưới', '#7c58c7')],
  },
  {
    id: 'plot-parabola', name: 'Đồ thị parabol', category: 'Đồ thị', icon: 'ƒ', tone: 'green',
    description: 'Đồ thị hàm bậc hai có trục tọa độ.',
    fields: [number('a', 'Hệ số a', 1, -20, 20), number('b', 'Hệ số b', -2, -20, 20), number('c', 'Hệ số c', -3, -20, 20), range('domain', 'Miền x', [-2.5, 4.5])],
    standalone: true,
  },
  {
    id: 'plot-cubic', name: 'Đồ thị bậc ba', category: 'Đồ thị', icon: '∿', tone: 'green',
    description: 'Đồ thị hàm đa thức bậc ba.',
    fields: [number('a', 'Hệ số a', 1, -20, 20), number('b', 'Hệ số b', -3, -20, 20), number('c', 'Hệ số c', 0, -20, 20), number('d', 'Hệ số d', 2, -20, 20), range('domain', 'Miền x', [-1.5, 3.5])],
    standalone: true,
  },
  {
    id: 'square', name: 'Hình vuông', category: 'Hình phẳng', icon: '□', tone: 'blue',
    description: 'Hình vuông với nhãn A, B, C, D.',
    fields: [number('a', 'Cạnh a', 4, 0.1, 20)], standalone: true,
  },
  {
    id: 'tri-right', name: 'Tam giác vuông', category: 'Hình phẳng', icon: '◢', tone: 'blue',
    description: 'Tam giác vuông dựng sẵn theo hai cạnh góc vuông.',
    fields: [number('leg1', 'Cạnh góc vuông 1', 4, 0.1, 20), number('leg2', 'Cạnh góc vuông 2', 3, 0.1, 20)], standalone: true,
  },
  {
    id: 'tri-abc', name: 'Tam giác thường', category: 'Hình phẳng', icon: '△', tone: 'blue',
    description: 'Tam giác cân theo đáy và chiều cao.',
    fields: [number('base', 'Độ dài đáy', 5, 0.1, 20), number('height', 'Chiều cao', 3.5, 0.1, 20)], standalone: true,
  },
  {
    id: 'tri-xyz', name: 'Tam giác 3 điểm', category: 'Hình phẳng', icon: '△', tone: 'blue',
    description: 'Tam giác trực tiếp từ ba đỉnh A, B, C trên canvas.',
    positionalFields: ['A', 'B', 'C'],
    fields: [pair('A', 'Đỉnh A', [-3, -1]), pair('B', 'Đỉnh B', [3, -1]), pair('C', 'Đỉnh C', [0, 2.5])], standalone: true,
  },
  {
    id: 'rect-abc', name: 'Hình chữ nhật', category: 'Hình phẳng', icon: '▭', tone: 'blue',
    description: 'Hình chữ nhật có nhãn bốn đỉnh.',
    fields: [number('width', 'Chiều rộng', 5, 0.1, 20), number('height', 'Chiều cao', 3, 0.1, 20)], standalone: true,
  },
  {
    id: 'circle-desc', name: 'Đường tròn', category: 'Hình phẳng', icon: '○', tone: 'blue',
    description: 'Đường tròn tâm O, bán kính R và hai đường kính phụ.',
    fields: [pair('center', 'Tâm (x, y)', [0, 0]), number('radius', 'Bán kính', 2, 0.1, 20), text('label', 'Nhãn tâm', 'O')], standalone: true,
  },
  {
    id: 'angle-mark', name: 'Đánh dấu góc', category: 'Hình phẳng', icon: '∠', tone: 'blue',
    description: 'Đánh dấu góc AOB bằng cung tròn và nhãn.',
    positionalFields: ['A', 'O', 'B'],
    fields: [pair('A', 'Điểm A', [2, 0]), pair('O', 'Đỉnh O', [0, 0]), pair('B', 'Điểm B', [0, 2]), number('radius', 'Bán kính cung', 0.5, 0.1, 10), text('label', 'Nhãn góc', 'α')], standalone: true,
  },
  {
    id: 'arc-by-points', name: 'Cung qua 3 điểm', category: 'Hình phẳng', icon: '◔', tone: 'blue',
    description: 'Cung tròn từ A → O → B, không cần nhớ góc start/stop của CeTZ.',
    positionalFields: ['A', 'O', 'B'],
    fields: [pair('A', 'Điểm đầu A', [2, 0]), pair('O', 'Tâm O', [0, 0]), pair('B', 'Điểm cuối B', [0, 2]), number('radius', 'Bán kính cung', 0.8, 0.1, 10), color('stroke', 'Màu nét', '#2b6cb0'), paint('fill', 'Màu cung', 'none')], standalone: true,
  },
  {
    id: 'draw-pyramid', name: 'Hình chóp', category: '3D', icon: '◇', tone: 'orange',
    description: 'Hình chóp đáy vuông có đỉnh S và anchor.',
    fields: [number('base-size', 'Cạnh đáy', 4, 0.1, 20), number('height', 'Chiều cao', 4, 0.1, 30), triple('center', 'Tâm đáy (x, y, z)', [0, 0, 0]), color('stroke', 'Màu nét', '#2b6cb0')],
  },
  {
    id: 'draw-truncated-pyramid', name: 'Chóp cụt', category: '3D', icon: '▱', tone: 'orange',
    description: 'Hình chóp cụt đáy vuông với hai kích thước đáy.',
    fields: [number('base-size', 'Cạnh đáy dưới', 4, 0.1, 20), number('top-size', 'Cạnh đáy trên', 2, 0.1, 20), number('height', 'Chiều cao', 3, 0.1, 30), triple('center', 'Tâm đáy (x, y, z)', [0, 0, 0]), color('stroke', 'Màu nét', '#2b6cb0'), paint('fill', 'Màu thân', 'none')],
  },
  {
    id: 'axis-xyz', name: 'Hệ trục Oxyz', category: '3D', icon: '✣', tone: 'orange',
    description: 'Hệ trục tọa độ không gian theo phối cảnh sách giáo khoa.',
    fields: [pair('O', 'Gốc O (x, y)', [0, 0]), number('x-len', 'Độ dài Ox', 3, 0.1, 20), number('y-len', 'Độ dài Oy', 4, 0.1, 20), number('z-len', 'Độ dài Oz', 4, 0.1, 20)], standalone: true,
  },
  {
    id: 'phanghoa-non', name: 'Khai triển mặt nón', category: 'Khai triển', icon: '◒', tone: 'violet',
    description: 'Khai triển hình quạt của mặt nón.',
    fields: [number('r', 'Bán kính đáy', 3, 0.1, 20), number('h', 'Chiều cao', 4, 0.1, 30), toggle('draw-base', 'Vẽ đáy', false)], standalone: true,
  },
  {
    id: 'phanghoa-tru', name: 'Khai triển mặt trụ', category: 'Khai triển', icon: '▤', tone: 'violet',
    description: 'Khai triển mặt xung quanh và đáy hình trụ.',
    fields: [number('r', 'Bán kính', 2, 0.1, 20), number('h', 'Chiều cao', 5, 0.1, 30), toggle('draw-bases', 'Vẽ hai đáy', false)], standalone: true,
  },
  {
    id: 'cone-geodesic-3d', name: 'Đường trắc địa trên nón', category: 'Đường đặc biệt', icon: '⌁', tone: 'violet',
    description: 'Vẽ đường đi ngắn nhất trên mặt nón.',
    fields: [number('r', 'Bán kính', 3, 0.1, 20), number('h', 'Chiều cao', 8, 0.1, 30), number('loops', 'Số vòng', 3, 1, 12, '1'), number('end-distance', 'Khoảng kết thúc', 5, 0.1, 30)], standalone: true,
  },
  {
    id: 'cone-unfold-2d', name: 'Khai triển đường nón', category: 'Đường đặc biệt', icon: '⌒', tone: 'violet',
    description: 'Đường trắc địa sau khi trải mặt nón thành mặt phẳng.',
    fields: [number('r', 'Bán kính', 3, 0.1, 20), number('h', 'Chiều cao', 8, 0.1, 30), number('loops', 'Số vòng', 3, 1, 12, '1'), number('end-distance', 'Khoảng kết thúc', 5, 0.1, 30)], standalone: true,
  },
  {
    id: 'cylinder-geodesic-3d', name: 'Đường trắc địa trên trụ', category: 'Đường đặc biệt', icon: '∿', tone: 'violet',
    description: 'Vẽ đường trắc địa quấn quanh mặt trụ.',
    fields: [number('r', 'Bán kính', 2, 0.1, 20), number('h', 'Chiều cao', 5, 0.1, 30), number('loops', 'Số vòng', 2, 1, 12, '1')], standalone: true,
  },
  {
    id: 'cylinder-unfold-2d', name: 'Khai triển đường trụ', category: 'Đường đặc biệt', icon: '▥', tone: 'violet',
    description: 'Đường trắc địa trên hình chữ nhật khai triển của mặt trụ.',
    fields: [number('r', 'Bán kính', 2, 0.1, 20), number('h', 'Chiều cao', 5, 0.1, 30), number('loops', 'Số vòng', 2, 1, 12, '1')], standalone: true,
  },
  {
    id: 'draw-tree-2x2', name: 'Cây xác suất 2×2', category: 'Xác suất', icon: '⑂', tone: 'green',
    description: 'Cây xác suất hai nhánh, bốn kết quả cuối.',
    fields: [number('spacing', 'Khoảng cách', 3.5, 1, 12, '0.5')],
  },
  {
    id: 'draw-tree-3x2', name: 'Cây xác suất 3×2', category: 'Xác suất', icon: '⑂', tone: 'green',
    description: 'Cây xác suất ba nhánh, sáu kết quả cuối.',
    fields: [number('spacing', 'Khoảng cách', 3.5, 1, 12, '0.5')],
  },
  {
    id: 'draw-box-transfer-diagram', name: 'Sơ đồ chuyển bi', category: 'Xác suất', icon: '▣', tone: 'green',
    description: 'Sơ đồ chuyển bi giữa các hộp với kết quả nổi bật.',
    fields: [],
  },
]

export const COMMAND_MAP = Object.fromEntries(COMMANDS.map(command => [command.id, command]))
export const NAMESPACED_COMMANDS = new Set(['draw-cone', 'draw-cylinder', 'draw-sphere', 'draw-helix', 'draw-conical-helix', 'draw-saddle', 'draw-paraboloid', 'draw-pyramid', 'draw-truncated-pyramid', 'draw-tree-2x2', 'draw-tree-3x2', 'draw-box-transfer-diagram'])

const COMMAND_GUIDES = {
  'draw-ellipse': {
    title: 'Vẽ elip từng bước',
    concept: 'Elip có tâm center, hai bán trục a/b và có thể xoay theo góc angle.',
    steps: ['Nhập tâm (x, y).', 'Đặt a là bán trục theo hướng chính, b là bán trục còn lại.', 'Đổi angle nếu muốn xoay elip; để 0 nếu là elip chuẩn.', 'Tăng Độ mịn khi in khổ lớn hoặc cần đường cong mượt hơn.'],
    tips: ['a và b phải lớn hơn 0.', 'Nếu a = b thì hình trở thành đường tròn.', 'Hàm này dùng trong smg-canvas.'],
    example: 'draw-ellipse(center: (0, 0), a: 3, b: 2, angle: 0)',
  },
  'draw-parabola': {
    title: 'Vẽ parabol từng bước',
    concept: 'Vẽ đường cong y = a·x² + b·x + c bằng các điểm mẫu nối liên tục.',
    steps: ['Chọn a để quyết định độ mở và chiều mở.', 'Chọn b, c để dịch đỉnh và dịch đồ thị.', 'Đặt Khoảng x đủ rộng để thấy phần cần minh họa.', 'Tăng Độ mịn nếu khoảng x lớn hoặc cần xuất SVG sắc nét.'],
    tips: ['a = 0 không còn là parabol.', 'Khoảng x có thể là số âm đến số dương.', 'Đây là đường cong thuần, không tự vẽ trục tọa độ.'],
    example: 'draw-parabola(a: 1, b: -2, c: -3, x-range: (-2.5, 4.5))',
  },
  'draw-hyperbola': {
    title: 'Vẽ hyperbol từng bước',
    concept: 'Vẽ bốn nhánh của x²/a² − y²/b² = 1.',
    steps: ['Đặt a và b là hai bán trục dương.', 'Khoảng x phải bắt đầu lớn hơn a; ví dụ a = 1 thì xmin = 1.2.', 'Mở rộng xmax để thấy rõ các nhánh và tiệm cận.', 'Dùng Độ mịn cao hơn khi phóng to.'],
    tips: ['Không đặt xmin ≤ a vì căn bậc hai sẽ không hợp lệ.', 'Hàm này không tự vẽ tiệm cận; có thể thêm đường phụ bằng CeTZ.', 'Đặt a = b cho hyperbol vuông.'],
    example: 'draw-hyperbola(a: 1, b: 1, x-range: (1.2, 4))',
  },
  'draw-cone': {
    title: 'Vẽ hình nón 3D từng bước',
    concept: 'Hình nón phối cảnh có đáy elip, nét khuất và namespace anchor.',
    steps: ['Đặt Bán kính đáy và Chiều cao.', 'Đặt Tâm đáy (x, y, z) nếu muốn dịch hình.', 'Đổi Tên nhóm / anchor thành tên ngắn, ví dụ N.', 'Bật Hiện nét khuất để thấy phần đáy phía sau bằng nét đứt.', 'Dùng anchor N.top hoặc N.apex để đặt nhãn.'],
    tips: ['Tên nhóm phải khác nhau nếu có nhiều khối trong cùng canvas.', 'Các anchor chính: center, base-center, bottom-center, top, apex, left, right, front, back.', 'Hình nón dùng trong smg-canvas.'],
    example: 'draw-cone(name: "N", radius: 2, height: 4, center: (0, 0, 0))',
  },
  'draw-cylinder': {
    title: 'Vẽ hình trụ 3D từng bước',
    concept: 'Hình trụ đứng với hai đáy elip và nét khuất tùy chọn.',
    steps: ['Nhập Bán kính và Chiều cao.', 'Dịch Tâm đáy (x, y, z) nếu cần ghép nhiều khối.', 'Đặt tên namespace để sử dụng anchor.', 'Tắt Hiện nét khuất khi muốn hình tối giản, phù hợp sơ đồ.'],
    tips: ['Anchor có top/top-center, bottom/bottom-center, center, left, right, front, back.', 'Hai đường sinh bên giúp người xem nhận biết chiều cao.', 'Có thể đặt nhiều hình trụ trong một smg-canvas.'],
    example: 'draw-cylinder(name: "C", radius: 2, height: 4, center: (0, 0, 0))',
  },
  'draw-sphere': {
    title: 'Vẽ hình cầu từng bước',
    concept: 'Hình cầu phối cảnh với xích đạo, kinh tuyến và phần khuất.',
    steps: ['Nhập Bán kính và Tâm (x, y, z).', 'Bật xích đạo để minh họa mặt phẳng qua tâm.', 'Bật kinh tuyến khi cần giải thích đường tròn lớn.', 'Bật nét khuất để phần sau dùng nét đứt.'],
    tips: ['Anchor có center, top, bottom, left, right.', 'Kinh tuyến có thể làm hình dày hơn; chỉ bật khi cần.', 'Dùng fill trong mã thủ công nếu muốn tô mặt cầu.'],
    example: 'draw-sphere(name: "S", radius: 2, center: (0, 0, 0), show-equator: true)',
  },
  'draw-helix': {
    title: 'Vẽ đường xoắn ốc từng bước',
    concept: 'Đường xoắn ốc quanh trục đứng, bán kính giữ nguyên và cao dần theo z.',
    steps: ['Đặt Bán kính và Chiều cao.', 'Chọn Số vòng; 1.5 là một vòng rưỡi.', 'Đặt Tâm (x, y, z) để dịch đường xoắn.', 'Tăng Độ mịn khi số vòng lớn hoặc cần xuất ảnh lớn.'],
    tips: ['Anchor có start, end và center.', 'Số vòng nên nằm trong khoảng 0.25–12 để preview nhẹ.', 'Hình xoắn ốc dùng trong smg-canvas.'],
    example: 'draw-helix(name: "H", radius: 2, height: 4, loops: 1.5)',
  },
  'draw-conical-helix': {
    title: 'Vẽ xoắn ốc trên nón từng bước',
    concept: 'Đường xoắn ốc có bán kính giảm dần từ đáy lên đỉnh nón.',
    steps: ['Đặt Bán kính đáy và Chiều cao.', 'Chọn Số vòng theo số đường quấn mong muốn.', 'Đặt Tâm đáy trong không gian.', 'Dùng anchor apex để đặt nhãn tại đỉnh.'],
    tips: ['Bán kính cuối cùng luôn tiến về 0 ở đỉnh.', 'Anchor có start, end và apex.', 'Nếu muốn nón và xoắn ốc trùng nhau, dùng cùng center/height.'],
    example: 'draw-conical-helix(name: "H", base-radius: 2, height: 4, loops: 2)',
  },
  'draw-saddle': {
    title: 'Vẽ mặt yên ngựa từng bước',
    concept: 'Mặt z = x² − y² được biểu diễn bằng lưới các đường cong trong không gian.',
    steps: ['Chọn Khoảng x và Khoảng y đối xứng quanh 0 để thấy rõ yên ngựa.', 'Giảm Độ mịn lưới khi đang chỉnh tham số.', 'Tăng Độ mịn lưới trước khi xuất bản/in.', 'Đặt tên nhóm nếu cần tham chiếu center.'],
    tips: ['Độ mịn cao làm WASM tính lâu hơn.', 'Anchor chính là center.', 'Mặt này dùng trong smg-canvas.'],
    example: 'draw-saddle(name: "Y", x-range: (-2, 2), y-range: (-2, 2), samples: 16)',
  },
  'draw-paraboloid': {
    title: 'Vẽ paraboloid từng bước',
    concept: 'Mặt paraboloid elliptic dạng lưới, mở theo trục z.',
    steps: ['Đặt bán trục a và b để điều chỉnh độ rộng.', 'Đặt Độ cao tối đa z-max.', 'Chọn Độ mịn lưới phù hợp với tốc độ preview.', 'Dùng anchor center để chú thích tâm mặt.'],
    tips: ['a và b phải dương.', 'z-max phải lớn hơn 0.', 'Mặt cong dùng trong smg-canvas.'],
    example: 'draw-paraboloid(name: "P", a: 2, b: 2, z-max: 4, samples: 16)',
  },
  'plot-parabola': {
    title: 'Vẽ đồ thị parabol có trục từng bước',
    concept: 'Khác draw-parabola, lệnh này tạo canvas riêng có trục, tick và phong cách sách giáo khoa.',
    steps: ['Nhập a, b, c của hàm bậc hai.', 'Đặt Miền x để chọn phần đồ thị.', 'Dùng mã ở ngoài smg-canvas; lệnh tự tạo canvas.', 'Chỉnh size và tick thủ công nếu cần bố cục đặc biệt.'],
    tips: ['Không đặt plot-parabola bên trong smg-canvas.', 'Lệnh này phù hợp đồ thị hàm số, không phải đường cong hình học thuần.', 'Nếu cần ghép với hình khác, dùng nhiều khối riêng trong tài liệu.'],
    example: 'plot-parabola(a: 1, b: -2, c: -3, domain: (-2.5, 4.5))',
  },
  'plot-cubic': {
    title: 'Vẽ đồ thị bậc ba từng bước',
    concept: 'Đồ thị y = ax³ + bx² + cx + d có trục tọa độ kiểu school-book.',
    steps: ['Nhập bốn hệ số a, b, c, d.', 'Chọn Miền x chứa vùng cần phân tích.', 'Đặt lệnh độc lập, không bọc trong smg-canvas.', 'Dùng mã thủ công để chỉnh size hoặc bước tick.'],
    tips: ['a = 0 làm hàm giảm xuống bậc hai.', 'Miền x quá rộng làm đồ thị khó đọc.', 'Hàm có sẵn màu xanh theo style của package.'],
    example: 'plot-cubic(a: 1, b: -3, c: 0, d: 2, domain: (-1.5, 3.5))',
  },
  'square': {
    title: 'Vẽ hình vuông từng bước',
    concept: 'Hình vuông cạnh a với nhãn A, B, C, D dựng sẵn.',
    steps: ['Nhập độ dài cạnh a.', 'Giữ nhãn mặc định nếu dùng trong bài hình học cơ bản.', 'Muốn đổi nhãn hoặc vị trí, chỉnh tham số labels/scale trong mã.', 'Lệnh tự tạo canvas riêng; không bọc thêm trong smg-canvas.'],
    tips: ['a phải dương.', 'Lệnh tự tạo bốn đỉnh theo bố cục chuẩn.', 'Có thể dùng cùng circle-desc/angle-mark trong mã thủ công.'],
    example: 'square(a: 4, labels: ("A", "B", "C", "D"))',
  },
  'tri-right': {
    title: 'Vẽ tam giác vuông từng bước',
    concept: 'Tam giác vuông theo hai cạnh góc vuông leg1 và leg2.',
    steps: ['Nhập hai cạnh góc vuông.', 'Chọn đỉnh góc vuông trong mã nếu không muốn mặc định A.', 'Giữ nhãn A, B, C hoặc thay labels khi cần.', 'Lệnh tự tạo canvas riêng; không bọc thêm trong smg-canvas.'],
    tips: ['Hai cạnh phải dương.', 'Góc vuông được đánh dấu tự động.', 'Có thể dùng điểm A/B/C làm đầu vào cho angle-mark trong mã nâng cao.'],
    example: 'tri-right(leg1: 4, leg2: 3, labels: ("A", "B", "C"))',
  },
  'tri-abc': {
    title: 'Vẽ tam giác thường từng bước',
    concept: 'Tam giác cân dựng trên đáy ngang, với base là độ dài đáy và height là chiều cao.',
    steps: ['Nhập Độ dài đáy base.', 'Nhập Chiều cao height.', 'Kiểm tra preview; đỉnh tam giác luôn nằm trên trung điểm đáy.', 'Dùng mã mẫu để đổi nhãn A, B, C khi đưa vào tài liệu.'],
    tips: ['base và height phải dương.', 'Lệnh tự tạo canvas riêng, không bọc thêm trong smg-canvas.', 'Nếu cần tam giác bất kỳ theo ba điểm, dùng tri-xyz trong mã thủ công.'],
    example: 'tri-abc(base: 5, height: 3.5, labels: ("A", "B", "C"))',
  },
  'rect-abc': {
    title: 'Vẽ hình chữ nhật từng bước',
    concept: 'Hình chữ nhật được dựng từ chiều rộng width và chiều cao height, có đủ bốn nhãn đỉnh.',
    steps: ['Nhập Chiều rộng width.', 'Nhập Chiều cao height.', 'Đổi nhãn trong mã nếu muốn dùng tên đỉnh khác.', 'Đặt lệnh độc lập; helper tự tạo canvas.'],
    tips: ['Hai kích thước phải dương.', 'Thứ tự nhãn là A, B, C, D theo chiều quanh hình.', 'Muốn đặt hình vào canvas chung, dùng rect-xyz trong mã nâng cao.'],
    example: 'rect-abc(width: 5, height: 3, labels: ("A", "B", "C", "D"))',
  },
  'circle-desc': {
    title: 'Vẽ đường tròn có đường kính phụ',
    concept: 'Đường tròn tâm center, bán kính radius và hai đường kính nét chấm để minh họa.',
    steps: ['Nhập Tâm (x, y).', 'Nhập Bán kính.', 'Đổi Nhãn tâm nếu cần.', 'Dùng preview để kiểm tra vị trí trước khi sao chép mã.'],
    tips: ['Bán kính phải dương.', 'Đây là helper tự tạo canvas riêng.', 'Đường kính phụ là nét chấm tự động, không cần thêm lệnh khác.'],
    example: 'circle-desc(center: (0, 0), radius: 2, label: "O")',
  },
  'angle-mark': {
    title: 'Đánh dấu góc từng bước',
    concept: 'Vẽ hai tia OA, OB và cung góc tại O; ba điểm được nhập theo thứ tự A, O, B.',
    steps: ['Nhập Điểm A.', 'Nhập Đỉnh O.', 'Nhập Điểm B.', 'Chọn Bán kính cung và Nhãn góc rồi xem preview.'],
    tips: ['A, O, B là ba đối số vị trí trong mã mẫu, không viết A: hoặc O: trước chúng.', 'Ba điểm không nên trùng nhau.', 'Lệnh tự tạo canvas riêng; không bọc thêm trong smg-canvas.'],
    example: 'angle-mark((2, 0), (0, 0), (0, 2), radius: 0.5, label: "α")',
  },
  'tri-xyz': {
    title: 'Vẽ tam giác bằng cách đặt 3 đỉnh',
    concept: 'Thay vì nhập cạnh và chiều cao, bạn đặt trực tiếp A, B, C trên mặt phẳng. Studio tự sinh tri-xyz(A, B, C).',
    steps: ['Chọn công cụ Tam giác 3 điểm.', 'Click hoặc kéo đỉnh A.', 'Click hoặc kéo đỉnh B và C.', 'Kéo các điểm để thay đổi hình; mã Typst cập nhật ngay.'],
    tips: ['Ba điểm không nên thẳng hàng.', 'Bạn có thể dùng tọa độ hiển thị dưới tay nắm để kiểm tra chính xác.', 'Lệnh tự tạo canvas riêng và phù hợp với hình học thao tác trực tiếp.'],
    example: 'tri-xyz((-3, -1), (3, -1), (0, 2.5))',
  },
  'arc-by-points': {
    title: 'Vẽ cung tròn theo 3 điểm — không cần nhớ CeTZ arc',
    concept: 'Typst/CeTZ nhận cung bằng tâm và hai góc start/stop. Lệnh này cho phép nhập cách tự nhiên hơn: điểm đầu A, tâm O, điểm cuối B; package tự đổi sang góc đúng chuẩn Typst.',
    steps: ['Nhập Điểm đầu A.', 'Nhập Tâm O — tâm phải nằm trên đường tròn cung.', 'Nhập Điểm cuối B.', 'Chọn bán kính, màu nét và màu cung rồi kiểm tra chiều cung trong preview.'],
    tips: ['Trong CeTZ, arc không nhận “start point” như một số API LaTeX/TikZ.', 'Thứ tự A → O → B quyết định hai đầu cung; đổi A và B nếu muốn đổi hướng.', 'Đây là helper độc lập, không bọc thêm trong smg-canvas.'],
    example: 'arc-by-points((2, 0), (0, 0), (0, 2), radius: 0.8, stroke: rgb("#2b6cb0"))',
  },
  'draw-pyramid': {
    title: 'Vẽ hình chóp tứ giác từng bước',
    concept: 'Hình chóp đáy vuông chiếu phối cảnh, có đỉnh apex và anchor cho chú thích.',
    steps: ['Nhập Cạnh đáy.', 'Nhập Chiều cao.', 'Dịch Tâm đáy (x, y, z) nếu ghép nhiều khối.', 'Đặt Tên nhóm / anchor ngắn để tham chiếu đỉnh apex.'],
    tips: ['Tên nhóm khác nhau khi có nhiều khối.', 'Mặt khuất được thể hiện bằng nét đứt.', 'Lệnh này đặt bên trong smg-canvas.'],
    example: 'draw-pyramid(name: "P", base-size: 4, height: 4, center: (0, 0, 0))',
  },
  'draw-truncated-pyramid': {
    title: 'Vẽ hình chóp cụt từng bước',
    concept: 'Hình chóp cụt đáy vuông với đáy dưới base-size và đáy trên top-size.',
    steps: ['Nhập Cạnh đáy dưới.', 'Nhập Cạnh đáy trên.', 'Nhập Chiều cao và tâm đáy.', 'Bật Màu thân nếu muốn tô hai mặt bên phía trước.'],
    tips: ['top-size nên nhỏ hơn base-size để đúng hình chóp cụt.', 'Tên anchor dùng để đặt nhãn top-center hoặc bottom-center.', 'Lệnh nằm trong smg-canvas.'],
    example: 'draw-truncated-pyramid(name: "T", base-size: 4, top-size: 2, height: 3, center: (0, 0, 0))',
  },
  'axis-xyz': {
    title: 'Dựng hệ trục Oxyz từng bước',
    concept: 'Tạo hệ trục không gian giả lập theo phối cảnh sách giáo khoa, gồm Ox, Oy, Oz và nhãn.',
    steps: ['Đặt Gốc O (x, y).', 'Chọn độ dài Ox, Oy, Oz.', 'Kiểm tra hướng chiếu trong preview.', 'Dùng mã thủ công nếu cần đổi nhãn trục hoặc góc Ox.'],
    tips: ['Các độ dài phải dương.', 'Helper tự tạo canvas riêng.', 'Muốn ghép điểm/khối vào cùng hệ trục, dùng smg-draw trong mã nâng cao.'],
    example: 'axis-xyz(O: (0, 0), x-len: 3, y-len: 4, z-len: 4)',
  },
  'phanghoa-non': {
    title: 'Khai triển mặt nón từng bước',
    concept: 'Trải mặt xung quanh hình nón thành một hình quạt có đường sinh l và góc ở đỉnh.',
    steps: ['Nhập Bán kính đáy r.', 'Nhập Chiều cao h.', 'Bật Vẽ đáy nếu muốn thêm đường tròn đáy.', 'Dùng hình khai triển để giải bài đường đi trên nón.'],
    tips: ['r và h phải dương.', 'Góc quạt được tính tự động từ r và đường sinh.', 'Lệnh tự tạo canvas riêng, không bọc trong smg-canvas.'],
    example: 'phanghoa-non(r: 3, h: 4, draw-base: true)',
  },
  'phanghoa-tru': {
    title: 'Khai triển mặt trụ từng bước',
    concept: 'Trải mặt xung quanh hình trụ thành hình chữ nhật rộng 2πr và cao h.',
    steps: ['Nhập Bán kính r.', 'Nhập Chiều cao h.', 'Bật Vẽ hai đáy nếu cần đủ hình khai triển.', 'Dùng đường chéo đỏ để minh họa đường đi ngắn nhất.'],
    tips: ['Chiều rộng khai triển tự tăng theo r.', 'r và h phải dương.', 'Helper tự tạo canvas riêng.'],
    example: 'phanghoa-tru(r: 2, h: 5, draw-bases: true)',
  },
  'cone-geodesic-3d': {
    title: 'Vẽ đường trắc địa trên nón',
    concept: 'Đường đi ngắn nhất trên mặt nón được tính bằng cách trải nón rồi chiếu ngược về 3D.',
    steps: ['Nhập Bán kính và Chiều cao nón.', 'Chọn Số vòng quấn.', 'Đặt Khoảng kết thúc từ đỉnh đến điểm B.', 'So sánh đường nét liền/nét đứt để đọc phần thấy và khuất.'],
    tips: ['Số vòng lớn làm preview lâu hơn.', 'Khoảng kết thúc nên không vượt quá đường sinh.', 'Đây là helper tự tạo canvas riêng.'],
    example: 'cone-geodesic-3d(r: 3, h: 8, loops: 3, end-distance: 5)',
  },
  'cone-unfold-2d': {
    title: 'Khai triển đường trắc địa trên nón',
    concept: 'Hiển thị mặt nón đã trải phẳng và dây thẳng biểu diễn đường đi ngắn nhất.',
    steps: ['Nhập r và h để xác định đường sinh.', 'Chọn số vòng trên các cung quạt.', 'Đặt Khoảng kết thúc.', 'Dùng hình này để giải thích vì sao đường trắc địa là đoạn thẳng khi khai triển.'],
    tips: ['Giảm Số vòng nếu hình bị dày.', 'r, h và khoảng kết thúc phải dương.', 'Lệnh tự tạo canvas riêng.'],
    example: 'cone-unfold-2d(r: 3, h: 8, loops: 3, end-distance: 5)',
  },
  'cylinder-geodesic-3d': {
    title: 'Vẽ đường trắc địa trên trụ',
    concept: 'Đường xoắn đều trên mặt trụ, có phần khuất tự động chuyển sang nét đứt.',
    steps: ['Nhập Bán kính và Chiều cao.', 'Chọn Số vòng quấn.', 'Xem hướng đi từ đáy dưới lên đáy trên.', 'Giảm số vòng khi cần hình minh họa thoáng.'],
    tips: ['Số vòng là số vòng xoắn quanh trụ.', 'r và h phải dương.', 'Helper tự tạo canvas riêng.'],
    example: 'cylinder-geodesic-3d(r: 2, h: 5, loops: 2)',
  },
  'cylinder-unfold-2d': {
    title: 'Khai triển đường trắc địa trên trụ',
    concept: 'Trải mặt trụ thành hình chữ nhật, trong đó đường đi ngắn nhất trở thành đoạn thẳng.',
    steps: ['Nhập r để xác định chiều rộng một vòng.', 'Nhập h để xác định chiều cao.', 'Chọn Số vòng.', 'Đọc đoạn chéo đỏ giữa A và B′ trên hình khai triển.'],
    tips: ['Chiều rộng là 2πr nhân số vòng.', 'Số vòng nên là số dương.', 'Lệnh tự tạo canvas riêng.'],
    example: 'cylinder-unfold-2d(r: 2, h: 5, loops: 2)',
  },
  'draw-tree-2x2': {
    title: 'Vẽ cây xác suất 2×2 từng bước',
    concept: 'Cây hai tầng: hai nhánh ở tầng một và bốn kết quả cuối ở tầng hai.',
    steps: ['Đặt Khoảng cách giữa các tầng.', 'Mở mã hiện tại nếu muốn thay nhãn A/B/M và xác suất.', 'Giữ đúng thứ tự bốn phần tử của level2: A-M, A-không, B-M, B-không.', 'Dùng anchor root, A, B để đặt chú thích.'],
    tips: ['Lệnh mặc định đã có dữ liệu mẫu nên có thể xem ngay.', 'Mảng level1 phải có 2 phần tử; level2 phải có 4 phần tử.', 'Lệnh nằm trong smg-canvas.'],
    example: 'draw-tree-2x2(name: "T", spacing: 3.5)',
  },
  'draw-tree-3x2': {
    title: 'Vẽ cây xác suất 3×2 từng bước',
    concept: 'Cây ba nhánh nguồn ở tầng một và hai kết quả cho mỗi nguồn ở tầng hai.',
    steps: ['Đặt Khoảng cách để cây không chồng chữ.', 'Chỉnh level1 thành 3 cặp nhãn–xác suất khi sửa mã.', 'Chỉnh level2 thành 6 cặp theo thứ tự A, B, C.', 'Dùng màu nhánh để phân biệt nhóm và kết quả.'],
    tips: ['Mảng level1 phải có 3 phần tử; level2 phải có 6 phần tử.', 'Giảm spacing nếu cần đưa cây vào cột hẹp.', 'Lệnh nằm trong smg-canvas.'],
    example: 'draw-tree-3x2(name: "T", spacing: 3.5)',
  },
  'draw-box-transfer-diagram': {
    title: 'Vẽ sơ đồ chuyển bi từng bước',
    concept: 'Sơ đồ ba hộp minh họa việc lấy bi từ Hộp I và Hộp II rồi chuyển vào Hộp III.',
    steps: ['Xem ba hộp và hướng mũi tên trong preview.', 'Sửa box1-label, box2-label, box3-label nếu cần.', 'Sửa take1, take2 và result-label để khớp đề bài.', 'Đổi result-color để làm nổi bật màu bi cần tính xác suất.'],
    tips: ['Các nhãn là content nên có thể viết công thức Typst khi sửa mã.', 'Tên nhóm dùng làm anchor box1, box2, box3, result.', 'Lệnh nằm trong smg-canvas.'],
    example: 'draw-box-transfer-diagram(name: "B", take1: [3 bi], take2: [2 bi], result-label: [Đỏ])',
  },
}

export function getCommandGuide(commandId, object) {
  const guide = COMMAND_GUIDES[commandId] || {
    title: 'Hướng dẫn lệnh',
    concept: 'Lệnh thuộc package sang-math-graphics.',
    steps: ['Chọn lệnh ở thư viện.', 'Chỉnh các tham số ở Bảng vẽ.', 'Xem mã Typst được sinh và sao chép khi cần.'],
    tips: ['Có thể chuyển sang sửa mã thủ công để dùng thêm tùy chọn nâng cao.'],
    example: '',
  }
  return { ...guide, generated: object ? typstCall(object).trim() : guide.example }
}

export const CATEGORIES = ['Tất cả', ...new Set(COMMANDS.map(command => command.category))]

export function createObject(commandId) {
  const command = COMMAND_MAP[commandId] || COMMANDS[0]
  return {
    id: `${command.id}-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`,
    command: command.id,
    name: `${command.id.replaceAll('-', ' ')}`,
    values: Object.fromEntries(command.fields.map(field => [field.key, Array.isArray(field.value) ? [...field.value] : field.value])),
  }
}

// Mẫu mặc định phải là một cảnh duy nhất, tránh ghép elip 2D với đáy nón 3D
// khiến người mới tưởng package đang vẽ sai hoặc sinh ra một đường xoắn lạ.
export const STARTER_OBJECTS = [createObject('draw-cone')]

export function valueFor(object, field) {
  return object?.values?.[field.key] ?? field.value
}

function formatNumber(value) {
  const numberValue = Number(value)
  if (!Number.isFinite(numberValue)) return '0'
  return String(Number(numberValue.toFixed(4)))
}

function formatTypstValue(value, field) {
  if (field.type === 'boolean') return value ? 'true' : 'false'
  if (field.type === 'paint') return value === 'none' ? 'none' : `rgb("${String(value || '#d8eee5')}")`
  if (field.type === 'color') return `rgb("${String(value || '#2b6cb0')}")`
  if (field.type === 'pair' || field.type === 'range' || field.type === 'triple') {
    const values = Array.isArray(value) ? value : String(value).split(',')
    return `(${values.map(formatNumber).join(', ')})`
  }
  if (field.type === 'number') return formatNumber(value)
  return `"${String(value ?? '').replaceAll('"', '\\"')}"`
}

export function typstCall(object) {
  const command = COMMAND_MAP[object.command]
  if (!command) return ''
  const args = command.fields.map(field => command.positionalFields?.includes(field.key)
    ? formatTypstValue(valueFor(object, field), field)
    : `${field.key}: ${formatTypstValue(valueFor(object, field), field)}`)
  if (NAMESPACED_COMMANDS.has(object.command)) args.unshift(`name: "${String(object.name || object.command).replaceAll('"', '\\"')}"`)
  return `  ${object.command}(${args.join(', ')})`
}

export function buildSource(objects) {
  const usesStandalone = objects.some(object => COMMAND_MAP[object.command]?.standalone)
  const canvasObjects = objects.filter(object => !COMMAND_MAP[object.command]?.standalone)
  const standaloneObjects = objects.filter(object => COMMAND_MAP[object.command]?.standalone)
  const blocks = [
    '#import "@preview/sang-math-graphics:0.1.0": *',
    '#set page(margin: 1cm)',
    '',
  ]
  if (canvasObjects.length) {
    blocks.push('#smg-canvas(length: 1cm, {', ...canvasObjects.map(typstCall), '})')
  }
  if (usesStandalone && standaloneObjects.length) {
    if (canvasObjects.length) blocks.push('')
    standaloneObjects.forEach((object, index) => {
      blocks.push(`#align(center, ${typstCall(object).trim()})`)
      if (index < standaloneObjects.length - 1) blocks.push('#v(1em)')
    })
  }
  if (!canvasObjects.length && !standaloneObjects.length) blocks.push('// Chọn một lệnh ở bên trái để bắt đầu.')
  return `${blocks.join('\n')}\n`
}
