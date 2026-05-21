-- =====================================================
-- SALES ANALYSIS
-- =====================================================

-- ==========================================
-- TOP REVENUE GENERATING CATEGORIES
-- ==========================================

SELECT
    category,
    ROUND(SUM(revenue)::numeric, 2) AS total_revenue
FROM retail_inventory
GROUP BY category
ORDER BY total_revenue DESC;


-- ==========================================
-- REGION-WISE SALES PERFORMANCE
-- ==========================================

SELECT
    region,
    ROUND(SUM(revenue)::numeric, 2) AS regional_revenue
FROM retail_inventory
GROUP BY region
ORDER BY regional_revenue DESC;


-- ==========================================
-- MONTHLY SALES TREND
-- ==========================================

SELECT
    month,
    ROUND(SUM(revenue)::numeric, 2) AS monthly_revenue
FROM retail_inventory
GROUP BY month
ORDER BY month;