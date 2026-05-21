-- =====================================================
-- FORECASTING & DEMAND ANALYSIS
-- =====================================================

-- ==========================================
-- HIGHEST DEMAND PRODUCTS
-- ==========================================

SELECT
    product_id,
    category,
    demand_forecast
FROM retail_inventory
ORDER BY demand_forecast DESC
LIMIT 10;


-- ==========================================
-- DEMAND GAP ANALYSIS
-- ==========================================

SELECT
    product_id,
    category,
    demand_forecast,
    units_sold,
    demand_gap
FROM retail_inventory
ORDER BY demand_gap DESC;


-- ==========================================
-- SEASONAL DEMAND ANALYSIS
-- ==========================================

SELECT
    seasonality,
    ROUND(AVG(demand_forecast)::numeric, 2) AS avg_demand
FROM retail_inventory
GROUP BY seasonality
ORDER BY avg_demand DESC;