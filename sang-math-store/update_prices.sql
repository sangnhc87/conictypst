UPDATE products 
SET price_vnd = CASE 
    WHEN access_days = 365 THEN 30000 
    WHEN access_days = 730 THEN 50000 
    WHEN access_days = 1825 THEN 100000 
    ELSE 30000 
END, updated_at = CURRENT_TIMESTAMP
WHERE product_type = 'game';
