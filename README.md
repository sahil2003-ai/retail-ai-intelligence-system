# Retail AI Intelligence System

An end-to-end retail analytics portfolio project combining SQL, Python, machine learning, and dashboards to explore sales performance, demand forecasting, and inventory risk.

## Business Objective
Investigate retail sales and inventory patterns and demonstrate how analytical reporting and predictive models can support planning questions.

## Technology
- **SQL:** PostgreSQL, including CTEs and window functions as documented
- **Python:** pandas, NumPy, scikit-learn, XGBoost, SQLAlchemy, joblib
- **Visualization/app:** Power BI, Streamlit, Plotly

## Data Architecture
The README describes a retail inventory/sales fact table and product, region, and time dimensions. Confirm the actual schema and data-generation process in the repository.

## Analysis Areas
- Sales, revenue, units, and profitability summaries
- Product and regional comparisons
- Seasonality and demand trends
- Overstock and low-stock indicators
- Forecasting and inventory-risk classification experiments

## Model Results
The current README reports very high model scores, including near-perfect values for some tasks. These should be considered **unverified until independently reproduced**. Such results can arise from target leakage, a target derived directly from input features, duplicated rows, or an easy synthetic dataset.

Before presenting metrics:
1. Define the target and the point at which predictions would be made.
2. Split chronologically or by appropriate entity where needed.
3. Fit preprocessing only on training data.
4. Compare against simple baselines.
5. Report held-out metrics and error analysis.
6. Explain whether the data is synthetic, simulated, or externally sourced.

## How to Review
Inspect the SQL schema, data-generation/cleaning code, notebooks, dependency file, dashboards, and Streamlit entry point before following setup commands.

## Recommended Improvements
Add dataset provenance, a reproducible end-to-end command, verified findings, dashboard screenshots, and a model card with target definition and limitations. Avoid calling a score “accuracy” unless its metric and evaluation set are clear.