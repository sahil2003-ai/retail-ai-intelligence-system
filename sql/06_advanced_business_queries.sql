-- =====================================================
-- TOP REVENUE PRODUCTS
-- WINDOW FUNCTION ANALYSIS
-- =====================================================

SELECT
    product_id,
    category,
    ROUND(SUM(revenue)::numeric, 2) AS total_revenue,

    RANK() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_rank

FROM retail_inventory

GROUP BY
    product_id,
    category

ORDER BY total_revenue DESC
LIMIT 10;

-- =====================================================
-- TOP PRODUCTS BY REGION
-- =====================================================

WITH regional_sales AS (

    SELECT
        region,
        product_id,

        ROUND(SUM(revenue)::numeric, 2) AS total_revenue,

        RANK() OVER (
            PARTITION BY region
            ORDER BY SUM(revenue) DESC
        ) AS regional_rank

    FROM retail_inventory

    GROUP BY
        region,
        product_id
)

SELECT *
FROM regional_sales
WHERE regional_rank <= 5;

-- =====================================================
-- MONTHLY SALES TREND
-- =====================================================

SELECT
    month,

    ROUND(SUM(revenue)::numeric, 2) AS monthly_revenue,

    ROUND(
        LAG(SUM(revenue)) OVER (
            ORDER BY month
        )::numeric,
        2
    ) AS previous_month_revenue

FROM retail_inventory

GROUP BY month

ORDER BY month;

-- =====================================================
-- HIGH DEMAND LOW INVENTORY PRODUCTS
-- =====================================================

SELECT
    product_id,
    category,
    inventory_level,
    units_sold,
    demand_forecast,

    ROUND(stock_turnover::numeric, 2) AS stock_turnover

FROM retail_inventory

WHERE
    inventory_level < 200
    AND demand_forecast > 150

ORDER BY demand_forecast DESC;

-- =====================================================
-- COMPETITOR PRICING ANALYSIS
-- =====================================================

SELECT
    category,

    ROUND(AVG(price)::numeric, 2) AS avg_company_price,

    ROUND(AVG(competitor_pricing)::numeric, 2)
        AS avg_competitor_price,

    ROUND(AVG(price_difference)::numeric, 2)
        AS avg_price_difference

FROM retail_inventory

GROUP BY category

ORDER BY avg_price_difference DESC;

-- =====================================================
-- SEASONAL REVENUE ANALYSIS
-- =====================================================

SELECT
    seasonality,

    ROUND(SUM(revenue)::numeric, 2)
        AS seasonal_revenue,

    ROUND(AVG(units_sold)::numeric, 2)
        AS avg_units_sold

FROM retail_inventory

GROUP BY seasonality

ORDER BY seasonal_revenue DESC;

-- =====================================================
-- HOLIDAY PROMOTION ANALYSIS
-- =====================================================

SELECT
    holiday_promotion,

    ROUND(AVG(units_sold)::numeric, 2)
        AS avg_units_sold,

    ROUND(SUM(revenue)::numeric, 2)
        AS total_revenue

FROM retail_inventory

GROUP BY holiday_promotion;

-- =====================================================
-- INVENTORY RISK SUMMARY
-- =====================================================

SELECT
    inventory_risk,

    COUNT(*) AS total_products,

    ROUND(AVG(units_sold)::numeric, 2)
        AS avg_units_sold

FROM retail_inventory

GROUP BY inventory_risk;

-- =====================================================
-- POWER BI ANALYTICS VIEW
-- =====================================================

CREATE OR REPLACE VIEW retail_dashboard_view AS

SELECT
    date,
    month,
    quarter,
    year,

    region,
    category,
    seasonality,

    inventory_level,
    units_sold,
    demand_forecast,

    price,
    competitor_pricing,

    revenue,
    estimated_profit,

    stock_turnover,
    inventory_risk

FROM retail_inventory;