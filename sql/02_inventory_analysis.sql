-- =====================================================
-- INVENTORY ANALYSIS
-- =====================================================

-- ==========================================
-- LOW STOCK PRODUCTS
-- ==========================================

SELECT
    product_id,
    category,
    inventory_level,
    units_sold,
    inventory_risk
FROM retail_inventory
WHERE inventory_risk = 'Low Stock'
ORDER BY units_sold DESC;


-- ==========================================
-- TOP INVENTORY PRODUCTS
-- ==========================================

SELECT
    product_id,
    category,
    inventory_level
FROM retail_inventory
ORDER BY inventory_level DESC
LIMIT 10;


-- ==========================================
-- STOCK TURNOVER ANALYSIS
-- ==========================================

SELECT
    category,
    ROUND(AVG(stock_turnover)::numeric , 2) AS avg_stock_turnover
FROM retail_inventory
GROUP BY category
ORDER BY avg_stock_turnover DESC;