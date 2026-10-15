# Retail AI Intelligence System

A retail analytics project combining SQL, Python, machine learning, Power BI, and Streamlit to explore sales, demand, and inventory risk.

## Dashboard and application screenshots

The repository contains six screenshots. The images below use the files already uploaded in `images/`.

| Screenshot 1 | Screenshot 2 |
|---|---|
| ![Retail dashboard screenshot 1](images/Screenshot(375).png) | ![Retail dashboard screenshot 2](images/Screenshot(376).png) |
| ![Retail dashboard screenshot 3](images/Screenshot(377).png) | ![Retail dashboard screenshot 4](images/Screenshot(378).png) |
| ![Retail dashboard screenshot 5](images/Screenshot(379).png) | ![Retail dashboard screenshot 6](images/Screenshot(380).png) |

## Step-by-step workflow

1. **Inspect repository structure** — review `data/`, `sql/`, `notebooks/`, `models/`, `powerbi/`, `app/`, and `reports/`.
2. **Understand the dataset** — confirm the data source, date range, grain (for example, store-product-day), columns, and whether data is synthetic or externally sourced.
3. **Validate data quality** — check duplicates, missing dates, negative/zero sales, outliers, and product/store coverage.
4. **Prepare SQL tables** — inspect the schema and SQL files, then load data using the documented process.
5. **Perform EDA** — explore sales, revenue, units, seasonality, regions, and inventory indicators in the notebooks.
6. **Define targets** — specify exactly what is being forecast or classified and when a prediction would be made.
7. **Train and evaluate models** — use a chronological split for demand forecasting, compare against simple baselines, and check for leakage.
8. **Validate business metrics** — reconcile sales, revenue, profit, overstock, and low-stock calculations with source data.
9. **Review Power BI and Streamlit** — confirm filters, measures, data connections, and model inputs/outputs.
10. **Document findings** — publish only reproducible results, with the evaluation window and limitations.

## Tools
SQL/PostgreSQL, Python, pandas, scikit-learn, XGBoost, Power BI, Streamlit, Plotly.

## Results and limitations
Previously reported business totals and model scores must be reproducible from the repository before being treated as verified. Near-perfect metrics require careful leakage and target-definition checks.

## Next improvements
Add dataset provenance, exact setup commands, a model card, and a verified results table.