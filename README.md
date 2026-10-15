# Retail AI Intelligence System

An end-to-end retail analytics portfolio project combining Python, SQL, machine learning, Power BI, and Streamlit to examine sales, demand, pricing, and inventory indicators.

## Project components

- `data/raw/retail_store_inventory.csv`: raw retail dataset
- `data/processed/retail_cleaned.csv`: processed dataset with derived fields
- `notebooks/`: setup, cleaning/feature engineering, and ML experiments
- `sql/`: KPI, inventory, sales, pricing, forecasting, and advanced business queries
- `models/`: saved model artifacts
- `powerbi/AI_Retail_Intelligence_System.pbix`: Power BI report
- `app/`: Streamlit application
- `reports/`: EDA, SQL, ML, app, dashboard, and final reports
- `images/`: application and dashboard screenshots

## Dataset profile

The current CSV files were inspected directly:

| File | Rows | Columns | Missing cells | Duplicate rows |
|---|---:|---:|---:|---:|
| Raw retail dataset | 73,100 | 15 | 0 | 0 |
| Processed retail dataset | 72,427 | 26 | 0 | 0 |

**Data-quality issue:** The processed file has 673 fewer rows than the raw file. The current notebook narrative reports zero duplicates removed, so the row-count difference needs to be traced to a filter, failed transformation, or export step.

The notebook's derived fields include revenue, estimated profit, stock turnover, risk labels, and date features. In particular:
- `revenue = units_sold × price`
- `estimated_profit = revenue × 0.25` is a fixed margin assumption, not observed accounting profit.
- `stock_turnover = units_sold ÷ inventory_level`
- `inventory_risk` is a rule-derived label.

## Recalculated processed-data KPIs

| KPI | Result |
|---|---:|
| Processed rows | 72,427 |
| Processed columns | 26 |
| Total revenue | ₹550,118,851.12 |
| Estimated profit at assumed 25% margin | ₹137,529,712.78 |
| Average units sold per row | 137.71 |
| Total inventory level | 19,929,382 |
| Average price | ₹55.13 |
| Average discount | 10.01% |

These aggregate values were recalculated from the processed CSV. The estimate of profit must not be presented as actual realized profit.

## Modeling: critical evaluation caveats

Saved notebook/report outputs report very high demand-model fit and inventory-risk classification performance. **Do not present the saved scores as validated generalization results yet.** The feature `stock_turnover` is defined as `units_sold / inventory_level` while `units_sold` is the demand-regression target, which leaks target information into a predictor. In addition, the inventory-risk target is rule-generated from fields that are also used as model inputs, so a strong classifier can merely learn the rule used to create its label.

To make model results credible:
1. Remove target-derived or post-outcome features.
2. Define the prediction timestamp and exclude information unavailable then.
3. Use a chronological holdout for time-dependent demand prediction.
4. Compare with simple baselines.
5. Recompute MAE/RMSE/R² for regression and precision/recall/F1/confusion matrix for classification.
6. Publish the split design and exact model configuration alongside results.

## Workflow

1. Validate raw data and column types.
2. Reconcile raw-to-processed row changes.
3. Run SQL analyses and compare KPIs with Python.
4. Review model features, targets, and split strategy.
5. Open and refresh the Power BI dashboard.
6. Run the Streamlit app and test both single and bulk prediction flows, if supported by the code.

## Tech stack

Python, pandas, scikit-learn/XGBoost where implemented, SQL/PostgreSQL, Power BI, Streamlit, and Plotly.

## Reproduction

Install dependencies from `requirements.txt`; follow the notebooks in sequence; use the SQL setup/queries in `sql/`; open the PBIX in Power BI Desktop; and launch the app from the confirmed entry point. Verify all paths, input data, and dependencies for your environment.

## Limitations

- Raw-to-processed row-count mismatch is unresolved.
- Profit is estimated using a fixed 25% assumption.
- Saved model metrics are not leakage-safe validation evidence.
- The dataset source/license should be documented.
- Business patterns are descriptive and do not prove causation.

## Skills demonstrated

Retail KPI analysis, data quality validation, feature engineering, SQL analytics, model evaluation, dashboarding, and application integration.

## Author

Sahil Gaikwad · [GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
