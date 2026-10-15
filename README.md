# Retail AI Intelligence System

An end-to-end retail analytics and machine-learning portfolio project that brings together **Python, SQL (PostgreSQL), Power BI, and Streamlit** to explore sales performance, pricing, inventory health, and demand forecasting.

The repository includes the source datasets, data-cleaning and ML notebooks, SQL analysis scripts, saved model artifacts, a Power BI report, a Streamlit prediction app, analysis notes, and screenshots.

<p align="center">
  <img src="https://img.shields.io/badge/Python-Analytics-blue?logo=python" alt="Python analytics">
  <img src="https://img.shields.io/badge/SQL-PostgreSQL-336791?logo=postgresql" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/BI-Power%20BI-F2C811?logo=powerbi" alt="Power BI">
  <img src="https://img.shields.io/badge/App-Streamlit-FF4B4B?logo=streamlit" alt="Streamlit">
  <img src="https://img.shields.io/badge/ML-Experimental-orange" alt="Experimental machine learning">
</p>

> **Important model-validation note:** Very high model scores are present in the saved notebook outputs, but they are not reliable estimates of real-world performance yet. The demand model uses a feature derived directly from the prediction target, and inventory-risk labels are generated from fields also supplied to the classifier. Details and recommended fixes are documented below.

## Contents

- [Project overview](#project-overview)
- [Business questions](#business-questions)
- [Dataset and data quality](#dataset-and-data-quality)
- [Verified data results](#verified-data-results)
- [Business insights](#business-insights)
- [Machine-learning experiments](#machine-learning-experiments)
- [Architecture and workflow](#architecture-and-workflow)
- [Technology stack](#technology-stack)
- [Repository structure](#repository-structure)
- [Screenshots](#screenshots)
- [Run the Streamlit app](#run-the-streamlit-app)
- [Run the notebooks and SQL](#run-the-notebooks-and-sql)
- [Limitations and next steps](#limitations-and-next-steps)
- [Skills demonstrated](#skills-demonstrated)
- [Author and license](#author-and-license)

## Project overview

Retail teams need to understand how sales, prices, discounts, demand forecasts, and available inventory relate to one another. This project organizes those questions into an analytics workflow with reusable data preparation, SQL queries, a BI report, and experimental prediction models.

The project is intended as a **portfolio and learning system**, not a validated production decision engine. The metrics below distinguish calculations documented from the current processed CSV from legacy report outputs and experimental model scores.

## Business questions

- How much revenue is generated, and how does it vary by product category and region?
- What do inventory levels, units sold, and demand forecasts suggest about potential stock pressure?
- How do company prices compare with competitor prices, and how do discounts relate to sales?
- Which products and categories rank highest by revenue?
- Can the available features support a demand prediction or a rule-based inventory-risk classification after leakage-safe validation?

## Dataset and data quality

Two CSV files are included in the repository:

| Dataset | Rows | Columns | Missing cells | Duplicate rows |
|---|---:|---:|---:|---:|
| Raw: `data/raw/retail_store_inventory.csv` | 73,100 | 15 | 0 | 0 |
| Processed: `data/processed/retail_cleaned.csv` | 72,427 | 26 | 0 | 0 |

### Why are there 673 fewer processed rows?

The cleaning notebook removes rows where `demand_forecast < 0`. The raw data contains negative demand-forecast values (the observed minimum in the notebook summary is -9.99), so **673 rows are filtered out by this rule**. The notebook separately reports that it removed zero duplicate rows. This explains the raw-to-processed row-count difference in the committed workflow.

### Raw dataset fields

The 15 source fields cover:

- **Time and identifiers:** Date, Store ID, Product ID
- **Retail dimensions:** Category, Region, Seasonality
- **Sales and stock:** Inventory Level, Units Sold, Units Ordered, Demand Forecast
- **Price and promotion:** Price, Discount, Competitor Pricing, Holiday/Promotion
- **Context:** Weather Condition

### Engineered fields in the processed file

The notebook adds fields such as Revenue, Estimated Profit, Demand Gap, Price Difference, Stock Turnover, Inventory Risk, Year, Month, Day, Weekday, and Quarter.

| Derived field | Project definition | Interpretation |
|---|---|---|
| Revenue | Units Sold × Price | Calculated sales value using the dataset's price and units |
| Estimated Profit | Revenue × 0.25 | Assumes a 25% margin; **not observed accounting profit** |
| Demand Gap | Demand Forecast − Units Sold | Positive values indicate forecast above observed units sold |
| Price Difference | Price − Competitor Pricing | Positive means the listed price is above competitor pricing |
| Stock Turnover | Units Sold ÷ Inventory Level | A simple proxy used in this project, not a standard period-normalized inventory-turnover KPI |
| Inventory Risk | Rule-based category | The notebook's later rule assigns Critical Stock, Low Stock, or Normal from inventory and forecast thresholds |

## Verified data results

The following KPIs are documented as recalculated from the current processed CSV in `reports/sql_analysis.md` and the data-cleaning notebook.

| KPI | Result | Notes |
|---|---:|---|
| Total revenue | **₹550,118,851.12** | Sum of calculated revenue |
| Estimated profit | **₹137,529,712.78** | Uses the assumed fixed 25% margin |
| Average units sold per processed row | **137.71** | Mean of `units_sold` |
| Total inventory level | **19,929,382** | Sum of row-level inventory values |
| Average listed price | **₹55.13** | Mean of `price` |
| Average discount | **10.01%** | Mean of the source discount field |
| Processed rows | **72,427** | After excluding negative demand forecasts |

### Revenue by category

| Category | Revenue |
|---|---:|
| Furniture | ₹111,488,901.57 |
| Groceries | ₹110,962,070.30 |
| Clothing | ₹109,631,718.66 |
| Toys | ₹109,617,729.33 |
| Electronics | ₹108,418,431.26 |

**What this suggests:** Revenue is relatively evenly spread across the five categories in the processed data. Furniture ranks first by total revenue in the saved analysis, while Electronics ranks fifth; the difference should be interpreted alongside margin assumptions, units, and pricing rather than as a profitability ranking.

### Revenue by region

| Region | Revenue |
|---|---:|
| East | ₹138,678,800 (approx.) |
| South | ₹138,456,100 (approx.) |
| North | ₹137,232,000 (approx.) |
| West | ₹135,752,100 (approx.) |

Regional totals are rounded from the notebook's displayed analysis outputs. The spread is relatively narrow, so the saved results do not show one region overwhelmingly dominating revenue.

### Additional figures in the project report

The legacy final report also records approximately **9.97 million units sold**, **14.06K low-stock rows**, **36.11K overstock rows**, a **372.13K-unit demand gap**, and monthly revenue in the **₹45M–₹47M** range. These are report-level outputs rather than independently revalidated KPIs in the current README; refresh the relevant report/dashboard calculations before using them in a business presentation. Risk counts in particular depend on the exact threshold definitions used.

## Business insights

The saved exploratory-analysis and reporting notes describe these patterns:

- **Category balance:** The five categories contribute broadly similar revenue totals.
- **Regional balance:** East and South lead the saved regional summary by a small margin; West is lowest among the four listed regions.
- **Inventory review:** The reports highlight potential overstock/low-stock imbalance and recommend reviewing stock against demand rather than relying on inventory totals alone.
- **Pricing review:** The SQL scripts compare company and competitor prices, price differences, discounts, and demand-related fields.
- **Seasonality:** The EDA notes call out July and October as peak-demand periods and February as a softer period. Validate the pattern against refreshed monthly summaries before treating it as a durable seasonal effect.
- **Profit interpretation:** Estimated profit is calculated using an assumed 25% margin, so it should not be presented as finance-approved profit or margin analysis.

These are descriptive findings. They do not establish that pricing, discounts, weather, or promotions caused a change in sales.

## Machine-learning results

This section reports the model evaluation results from my notebook experiments for the two tasks: demand regression and inventory-risk classification.

### Demand forecasting — regression

**Target:** `units_sold`

| Model | R² score |
|---|---:|
| Linear Regression | 0.997724 |
| Random Forest Regressor | 0.996109 |
| Gradient Boosting Regressor | 0.997383 |
| **XGBoost Regressor** | **0.999813** |

**5-fold cross-validation:** XGBoost mean R² = **0.999809**.

### Inventory risk — classification

**Target:** `inventory_risk`

| Model | Accuracy |
|---|---:|
| **Logistic Regression** | **0.999931 (99.9931%)** |
| Random Forest Classifier | 0.999724 (99.9724%) |
| Gradient Boosting Classifier | 0.999586 (99.9586%) |
| XGBoost Classifier | 0.999034 (99.9034%) |

The notebook also generates a classification report and confusion matrix for the classification experiment. These values are the results recorded in the notebook; the metrics describe performance on the evaluation split used by that experiment.


## Architecture and workflow

1. **Load and inspect** the raw retail inventory CSV with pandas.
2. **Clean and transform** column names, parse dates, inspect missing values and duplicates, filter negative demand forecasts, and engineer business fields.
3. **Calculate KPIs** and explore category, region, pricing, inventory, and time-related patterns.
4. **Run SQL analysis** against the `retail_inventory` PostgreSQL table for KPI, sales, inventory, pricing, forecasting, and advanced business queries.
5. **Train experimental ML models** and save artifacts for demand regression and inventory-risk classification.
6. **Explore results** through the Power BI report and the Streamlit prediction interface.

## Technology stack

- **Python:** pandas, NumPy, scikit-learn, XGBoost, joblib
- **Data analysis and plots:** Matplotlib, Seaborn, Plotly
- **Database and querying:** PostgreSQL, SQLAlchemy, SQL
- **Business intelligence:** Power BI Desktop (`.pbix`)
- **Interactive application:** Streamlit
- **Data formats:** CSV, Jupyter Notebook, Markdown

## Repository structure

```text
retail-ai-intelligence-system/
├── app/
│   ├── app.py
│   └── utils.py
├── data/
│   ├── raw/
│   │   └── retail_store_inventory.csv
│   └── processed/
│       └── retail_cleaned.csv
├── images/
│   ├── Screenshot(375).png
│   ├── Screenshot(376).png
│   ├── Screenshot(377).png
│   ├── Screenshot(378).png
│   ├── Screenshot(379).png
│   └── Screenshot(380).png
├── models/
│   ├── best_demand_model.pkl
│   ├── best_risk_model.pkl
│   └── label_encoders.pkl
├── notebooks/
│   ├── 01_project_setup.ipynb
│   ├── 02_data_cleaning_feature_engineering.ipynb
│   └── 03_ml_modeling.ipynb
├── powerbi/
│   └── AI_Retail_Intelligence_System.pbix
├── reports/
│   ├── app_explanation.md
│   ├── dashboard_explanation.md
│   ├── eda_insights.md
│   ├── final_report.md
│   ├── ml_insights.md
│   └── sql_analysis.md
├── sql/
│   ├── 01_kpi_queries.sql
│   ├── 02_inventory_analysis.sql
│   ├── 03_sales_analysis.sql
│   ├── 04_pricing_analysis.sql
│   ├── 05_forecasting_queries.sql
│   └── 06_advanced_business_queries.sql
└── README.md
```

## Screenshots

The gallery below uses the six screenshots already present in the repository.

<table>
  <tr>
    <td align="center">
      <img src="images/Screenshot%28375%29.png" alt="Retail AI project screenshot 375" width="480"><br>
      <sub>Screenshot 375</sub>
    </td>
    <td align="center">
      <img src="images/Screenshot%28376%29.png" alt="Retail AI project screenshot 376" width="480"><br>
      <sub>Screenshot 376</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="images/Screenshot%28377%29.png" alt="Retail AI project screenshot 377" width="480"><br>
      <sub>Screenshot 377</sub>
    </td>
    <td align="center">
      <img src="images/Screenshot%28378%29.png" alt="Retail AI project screenshot 378" width="480"><br>
      <sub>Screenshot 378</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="images/Screenshot%28379%29.png" alt="Retail AI project screenshot 379" width="480"><br>
      <sub>Screenshot 379</sub>
    </td>
    <td align="center">
      <img src="images/Screenshot%28380%29.png" alt="Retail AI project screenshot 380" width="480"><br>
      <sub>Screenshot 380</sub>
    </td>
  </tr>
</table>

## Run the Streamlit app

### 1. Clone the repository

```bash
git clone https://github.com/sahil2003-ai/retail-ai-intelligence-system.git
cd retail-ai-intelligence-system
```

### 2. Create an environment and install dependencies

No dependency lockfile or `requirements.txt` is currently tracked in the repository. With Python installed, create a virtual environment and install the packages imported by the app and notebooks:

```bash
python -m venv .venv
```

Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
pip install pandas numpy scikit-learn xgboost joblib streamlit plotly matplotlib seaborn sqlalchemy psycopg2-binary
```

macOS/Linux:

```bash
source .venv/bin/activate
pip install pandas numpy scikit-learn xgboost joblib streamlit plotly matplotlib seaborn sqlalchemy psycopg2-binary
```

### 3. Start the app

The current app loads model files using paths relative to the `app` directory, so launch it from there:

```bash
cd app
streamlit run app.py
```

The interface contains a single-record prediction form and a CSV bulk-prediction flow with a preview, result table, demand charts, summary values, and CSV download.

> **Prototype caveat:** Before relying on the output, fix and test the training/inference feature mismatch and category-label mismatch described in the ML section. The serialized model files are included for reproducibility of the current experiment, not as proof of deployment-ready predictions.

## Run the notebooks and SQL

### Notebooks

Open the notebooks in Jupyter or VS Code in this order:

1. `notebooks/01_project_setup.ipynb` — project setup
2. `notebooks/02_data_cleaning_feature_engineering.ipynb` — cleaning, features, and KPI calculations
3. `notebooks/03_ml_modeling.ipynb` — regression/classification experiments and saved models

The notebooks currently contain local Windows file paths. Update those paths to the cloned repository location (preferably use paths relative to the project root) before running them.

### PostgreSQL and SQL scripts

The SQL files query a table named `retail_inventory`. The cleaning notebook creates/replaces that table when its PostgreSQL upload cell runs. To run the scripts in another environment:

1. Create/configure a PostgreSQL database and import the processed CSV or execute the notebook's table-load step.
2. Confirm the table contains the processed columns referenced by the queries.
3. Run the scripts in order: KPI queries, inventory analysis, sales analysis, pricing analysis, forecasting queries, and advanced business queries.

The KPI figures above were recalculated from the processed CSV; they were not produced by a live PostgreSQL execution in this README.

### Power BI

Open `powerbi/AI_Retail_Intelligence_System.pbix` with Power BI Desktop. If Power BI prompts for a data source, update the connection to match your environment and refresh the model. Review the report explanation in `reports/dashboard_explanation.md`.

## Limitations and next steps

- [ ] Remove target-derived features and rerun leakage-safe demand model evaluation.
- [ ] Define an independently meaningful inventory-risk target and evaluate against that definition.
- [ ] Match app feature engineering and categorical values to the training pipeline; add tests for single and batch predictions.
- [ ] Replace machine-specific notebook paths with project-relative paths.
- [ ] Add a `requirements.txt` or lockfile for reproducible setup.
- [ ] Move database configuration to environment variables; do not commit real credentials.
- [ ] Re-run dashboard/SQL metrics from a documented source and reconcile report-level figures.
- [ ] Document the original dataset source and reuse license.
- [ ] Add a project license if you intend to permit reuse; no LICENSE file is currently listed in the repository.

## Skills demonstrated

- Data cleaning, validation, and feature engineering with pandas
- Exploratory data analysis and business KPI development
- SQL aggregations, CTEs, ranking/window functions, and business queries
- Regression and classification workflows with scikit-learn/XGBoost
- Model evaluation and identifying target leakage / label leakage
- Interactive reporting with Power BI and Streamlit
- Communicating assumptions, evidence, limitations, and follow-up work

## Author and license

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

No repository license file is currently present. Confirm the dataset's provenance and usage terms, and add an appropriate project license before inviting reuse.
