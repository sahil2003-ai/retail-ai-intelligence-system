-- =====================================================
-- PRICING ANALYSIS
-- =====================================================

-- ==========================================
-- PRODUCTS PRICED ABOVE COMPETITORS
-- ==========================================

SELECT
    product_id,
    category,
    price,
    competitor_pricing,
    price_difference
FROM retail_inventory
WHERE price_difference > 0
ORDER BY price_difference DESC;


-- ==========================================
-- AVERAGE CATEGORY PRICING
-- ==========================================

SELECT
    category,
    ROUND(AVG(price)::numeric, 2) AS avg_price
FROM retail_inventory
GROUP BY category
ORDER BY avg_price DESC;


-- ==========================================
-- DISCOUNT IMPACT ANALYSIS
-- ==========================================

SELECT
    discount,
    ROUND(AVG(units_sold)::numeric, 2) AS avg_units_sold
FROM retail_inventory
GROUP BY discount
ORDER BY discount;