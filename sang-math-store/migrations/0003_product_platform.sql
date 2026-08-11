ALTER TABLE products ADD COLUMN product_type TEXT NOT NULL DEFAULT 'template';
ALTER TABLE products ADD COLUMN fulfillment_type TEXT NOT NULL DEFAULT 'download';
ALTER TABLE products ADD COLUMN access_model TEXT NOT NULL DEFAULT 'lifetime';
ALTER TABLE products ADD COLUMN access_days INTEGER;
ALTER TABLE products ADD COLUMN delivery_url TEXT;
ALTER TABLE products ADD COLUMN badge TEXT;
ALTER TABLE products ADD COLUMN featured INTEGER NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS products_type_active_idx
  ON products(product_type, active, sort_order);

