# Retail AI Intelligence — Data and SQL Findings

## Dataset validation

| File | Rows | Columns | Missing cells | Duplicate rows |
|---|---:|---:|---:|---:|
| `data/raw/retail_store_inventory.csv` | 73,100 | 15 | 0 | 0 |
| `data/processed/retail_cleaned.csv` | 72,427 | 26 | 0 | 0 |

**Unresolved discrepancy:** 673 rows are missing from the processed export even though the cleaning notebook output says zero duplicates were removed. Identify the exact transformation/filter causing this before treating the pipeline as fully reconciled.

## Recalculated KPIs from the current processed CSV

| KPI | Value |
|---|---:|
| Total revenue | ₹550,118,851.12 |
| Estimated profit | ₹137,529,712.78 |
| Average units sold per processed row | 137.71 |
| Total inventory | 19,929,382 |
| Average price | ₹55.13 |
| Average discount | 10.01% |

The notebook defines `estimated_profit = revenue × 0.25`. It is an assumed 25% margin, not observed accounting profit.

## Category revenue

| Category | Revenue |
|---|---:|
| Furniture | ₹111,488,901.57 |
| Groceries | ₹110,962,070.30 |
| Clothing | ₹109,631,718.66 |
| Toys | ₹109,617,729.33 |
| Electronics | ₹108,418,431.26 |

## Machine-learning validation findings

The saved demand model reports (R^2 = 0.999813), but its feature list includes `stock_turnover = units_sold / inventory_level` while `units_sold` is the target. This is direct target leakage. Do not report the score as valid forecasting performance. Remove the target-derived feature, define a realistic prediction time, use a chronological holdout, and compare with a simple baseline.

The inventory-risk label is rule-generated from `inventory_level` and `demand_forecast`, both used as model inputs. Its near-perfect classification score therefore mostly measures reproduction of the rule, not prediction of independently observed risk.

## SQL validation notes

The SQL files query the table `retail_inventory`. The notebook's `to_sql(..., if_exists='replace')` creates this table in the local database configured in the notebook; the SQL queries will not run until that table is created/loaded in the target PostgreSQL database. The KPI figures above were recalculated from the CSV, not from a live SQL engine. Cross-check the results after importing the file and resolve the raw/processed row discrepancy.
