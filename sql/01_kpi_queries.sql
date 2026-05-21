-- =====================================================
-- AI RETAIL INTELLIGENCE SYSTEM
-- KPI ANALYSIS QUERIES
-- =====================================================

-- ==========================================
-- TOTAL REVENUE
-- ==========================================

SELECT
    ROUND(SUM(revenue)::numeric, 2) AS total_revenue
FROM retail_inventory;


-- ==========================================
-- TOTAL ESTIMATED PROFIT
-- ==========================================

SELECT
    ROUND(SUM(estimated_profit)::numeric, 2) AS total_profit
FROM retail_inventory;


-- ==========================================
-- AVERAGE UNITS SOLD
-- ==========================================

SELECT
    ROUND(AVG(units_sold)::numeric, 2) AS average_units_sold
FROM retail_inventory;


-- ==========================================
-- TOTAL INVENTORY
-- ==========================================

SELECT
    SUM(inventory_level) AS total_inventory
FROM retail_inventory;