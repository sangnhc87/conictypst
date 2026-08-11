UPDATE products SET image = '/previews/bingo_math.png', updated_at = CURRENT_TIMESTAMP WHERE entitlement_key = 'bingo-toan-hoc';
UPDATE products SET image = '/previews/rocket_math.png', updated_at = CURRENT_TIMESTAMP WHERE entitlement_key = 'ten-lua-tri-thuc';
UPDATE products SET image = '/previews/river_math.png', updated_at = CURRENT_TIMESTAMP WHERE entitlement_key = 'vuot-song-thu-thach';

INSERT OR REPLACE INTO products (id, name, eyebrow, description, image, color, price_vnd, active, starter, sort_order, updated_at, product_type, fulfillment_type, access_model, access_days, entitlement_key) VALUES
('manh-ghep-bi-an-1y', 'Mảnh Ghép Bí Ẩn - Lật Hình (1 Năm)', 'Game Tương Tác', 'Game tương tác lật mảnh ghép đoán hình, giúp học sinh ôn tập nhanh và thú vị.', '/previews/flip_puzzle_math.png', '#7b2cbf', 199000, 1, 0, 1, CURRENT_TIMESTAMP, 'game', 'web_access', 'subscription', 365, 'manh-ghep-bi-an'),
('manh-ghep-bi-an-2y', 'Mảnh Ghép Bí Ẩn - Lật Hình (2 Năm)', 'Game Tương Tác', 'Game tương tác lật mảnh ghép đoán hình, giúp học sinh ôn tập nhanh và thú vị.', '/previews/flip_puzzle_math.png', '#7b2cbf', 299000, 1, 0, 2, CURRENT_TIMESTAMP, 'game', 'web_access', 'subscription', 730, 'manh-ghep-bi-an'),
('manh-ghep-bi-an-5y', 'Mảnh Ghép Bí Ẩn - Lật Hình (5 Năm)', 'Game Tương Tác', 'Game tương tác lật mảnh ghép đoán hình, giúp học sinh ôn tập nhanh và thú vị.', '/previews/flip_puzzle_math.png', '#7b2cbf', 499000, 1, 0, 3, CURRENT_TIMESTAMP, 'game', 'web_access', 'subscription', 1825, 'manh-ghep-bi-an');

INSERT OR REPLACE INTO products (id, name, eyebrow, description, image, color, price_vnd, active, starter, sort_order, updated_at, product_type, fulfillment_type, access_model, access_days, entitlement_key) VALUES
('dau-tri-keo-co-1y', 'Đấu Trí Kéo Co (1 Năm)', 'Game Hoạt Náo', 'Game chia đội thi đấu kéo co bằng cách trả lời câu hỏi trắc nghiệm.', '/previews/tug_of_war_math.png', '#e85d04', 199000, 1, 0, 1, CURRENT_TIMESTAMP, 'game', 'web_access', 'subscription', 365, 'dau-tri-keo-co'),
('dau-tri-keo-co-2y', 'Đấu Trí Kéo Co (2 Năm)', 'Game Hoạt Náo', 'Game chia đội thi đấu kéo co bằng cách trả lời câu hỏi trắc nghiệm.', '/previews/tug_of_war_math.png', '#e85d04', 299000, 1, 0, 2, CURRENT_TIMESTAMP, 'game', 'web_access', 'subscription', 730, 'dau-tri-keo-co'),
('dau-tri-keo-co-5y', 'Đấu Trí Kéo Co (5 Năm)', 'Game Hoạt Náo', 'Game chia đội thi đấu kéo co bằng cách trả lời câu hỏi trắc nghiệm.', '/previews/tug_of_war_math.png', '#e85d04', 499000, 1, 0, 3, CURRENT_TIMESTAMP, 'game', 'web_access', 'subscription', 1825, 'dau-tri-keo-co');
