DELETE FROM products WHERE id IN ('rung-chuong', 'bong-da');

INSERT OR REPLACE INTO products (id, name, eyebrow, description, image, color, price_vnd, active, sort_order, updated_at, product_type, access_model, access_days, entitlement_key) VALUES 
('rung-chuong-1y', 'Rung Chuông Vàng (1 Năm)', 'Đấu trường toàn lớp', 'Học sinh ghi bảng, trả lời để bám trụ đến cùng', '/previews/rung-chuong.png', '#eab308', 30000, 1, 160, CURRENT_TIMESTAMP, 'game', 'subscription', 365, 'rung-chuong'),
('rung-chuong-2y', 'Rung Chuông Vàng (2 Năm)', 'Đấu trường toàn lớp', 'Học sinh ghi bảng, trả lời để bám trụ đến cùng', '/previews/rung-chuong.png', '#eab308', 50000, 1, 161, CURRENT_TIMESTAMP, 'game', 'subscription', 730, 'rung-chuong'),
('rung-chuong-5y', 'Rung Chuông Vàng (5 Năm)', 'Đấu trường toàn lớp', 'Học sinh ghi bảng, trả lời để bám trụ đến cùng', '/previews/rung-chuong.png', '#eab308', 100000, 1, 162, CURRENT_TIMESTAMP, 'game', 'subscription', 1825, 'rung-chuong');

INSERT OR REPLACE INTO products (id, name, eyebrow, description, image, color, price_vnd, active, sort_order, updated_at, product_type, access_model, access_days, entitlement_key) VALUES 
('bong-da-1y', 'Bóng Đá Luân Lưu (1 Năm)', 'Hai đội sút phạt', 'Đáp án đúng là một cú sút tung lưới đối phương', '/previews/bong-da.png', '#22c55e', 30000, 1, 170, CURRENT_TIMESTAMP, 'game', 'subscription', 365, 'bong-da'),
('bong-da-2y', 'Bóng Đá Luân Lưu (2 Năm)', 'Hai đội sút phạt', 'Đáp án đúng là một cú sút tung lưới đối phương', '/previews/bong-da.png', '#22c55e', 50000, 1, 171, CURRENT_TIMESTAMP, 'game', 'subscription', 730, 'bong-da'),
('bong-da-5y', 'Bóng Đá Luân Lưu (5 Năm)', 'Hai đội sút phạt', 'Đáp án đúng là một cú sút tung lưới đối phương', '/previews/bong-da.png', '#22c55e', 100000, 1, 172, CURRENT_TIMESTAMP, 'game', 'subscription', 1825, 'bong-da');
