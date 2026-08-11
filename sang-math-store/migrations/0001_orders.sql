CREATE TABLE IF NOT EXISTS orders (
  id TEXT PRIMARY KEY,
  access_token_hash TEXT NOT NULL,
  payment_code TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL,
  items_json TEXT NOT NULL,
  total_vnd INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending',
  created_at TEXT NOT NULL,
  expires_at TEXT NOT NULL,
  paid_at TEXT,
  transaction_id TEXT,
  last_payment_error TEXT
);

CREATE INDEX IF NOT EXISTS orders_payment_code_idx ON orders(payment_code);
CREATE INDEX IF NOT EXISTS orders_email_idx ON orders(email);

CREATE TABLE IF NOT EXISTS transactions (
  sepay_id TEXT PRIMARY KEY,
  reference_code TEXT,
  payment_code TEXT,
  transfer_amount INTEGER NOT NULL,
  transfer_type TEXT,
  matched_order_id TEXT,
  result TEXT NOT NULL,
  payload_json TEXT NOT NULL,
  received_at TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS transactions_order_idx ON transactions(matched_order_id);
