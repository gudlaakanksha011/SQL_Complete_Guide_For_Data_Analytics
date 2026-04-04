use co;
select * from customer_order_products;

-- Customer Order Products View
CREATE OR REPLACE VIEW customer_order_products AS
  SELECT o.order_id, o.order_tms, o.order_status,
         c.customer_id, c.email_address, c.full_name,
         SUM(oi.quantity * oi.unit_price) AS order_total,
         GROUP_CONCAT(p.product_name ORDER BY oi.line_item_id SEPARATOR ', ') AS items
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN customers c ON o.customer_id = c.customer_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY o.order_id, o.order_tms, o.order_status, c.customer_id, c.email_address, c.full_name;

-- Product Reviews View (MySQL 8.0+)
CREATE OR REPLACE VIEW product_reviews AS
  SELECT p.product_name, r.rating,
         ROUND(AVG(r.rating) OVER (PARTITION BY p.product_name), 2) AS avg_rating,
         r.review
  FROM products p,
       JSON_TABLE(p.product_details, '$.reviews[*]'
         COLUMNS (
           rating INT PATH '$.rating',
           review VARCHAR(4000) PATH '$.review'
         )
       ) AS r;

-- Product Orders View
CREATE OR REPLACE VIEW product_orders AS
  SELECT p.product_name, o.order_status,
         SUM(oi.quantity * oi.unit_price) AS total_sales,
         COUNT(*) AS order_count
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY p.product_name, o.order_status;




