# Retail AI Intelligence System

> Retail analytics project combining SQL, Python, machine learning, Power BI, and Streamlit to explore sales, demand, and inventory risk.

![Status](https://img.shields.io/badge/Status-Portfolio--Project-blue)

## 📌 Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Features](#features)
- [Dataset](#dataset)
- [Tech Stack](#tech-stack)
- [Project Workflow](#project-workflow)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Results and Insights](#results-and-insights)
- [Screenshots](#screenshots)
- [Challenges and Solutions](#challenges-and-solutions)
- [Limitations](#limitations)
- [Future Improvements](#future-improvements)
- [What I Learned](#what-i-learned)
- [Author](#author)
- [License](#license)

## 📖 Overview

Retail analytics project combining SQL, Python, machine learning, Power BI, and Streamlit to explore sales, demand, and inventory risk. This README documents the intended workflow and the files available in the repository. Verify all outputs against the current code and data before using them as evidence.

## 🎯 Problem Statement

Retail planning requires consistent sales/inventory metrics and carefully evaluated forecasts or risk indicators.

## 🎯 Objectives

- Explore retail sales and inventory patterns.
- Define prediction targets and evaluate models correctly.
- Present results through dashboards and an application.

## ✨ Features

- SQL, data, notebook, model, dashboard, and app folders.
- Six existing project screenshots.
- Analytics and ML workflow.

## 📂 Dataset

I inspected both repository CSVs directly.

| File | Rows | Columns | Missing values | Duplicate rows |
|---|---:|---:|---:|---:|
| Raw `retail_store_inventory.csv` | 73,100 | 15 | 0 | 0 |
| Processed `retail_cleaned.csv` | 72,427 | 26 | 0 | 0 |

**Important discrepancy:** The processed CSV has **673 fewer rows** than the raw CSV. The current notebook output says zero duplicates were removed, so the row-count difference is not explained by the documented duplicate-removal step. Reconcile the exact filtering/export step before calling the cleaning pipeline fully validated.

Raw fields include date, store/product IDs, category, region, inventory, units sold/ordered, demand forecast, price, discount, weather, promotion, competitor pricing, and seasonality. The processed file adds derived KPIs, risk labels, and date features.

### Derived metric definitions

- `revenue = units_sold × price`
- `estimated_profit = revenue × 0.25` — this is a fixed 25% assumption, **not observed accounting profit**.
- `stock_turnover = units_sold ÷ inventory_level`
- `inventory_risk` is rule-generated from inventory and forecast thresholds, rather than an independently observed outcome.

Document the original data source/license before redistribution.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| SQL/PostgreSQL | Data preparation and querying |
| Python/pandas | EDA and feature preparation |
| scikit-learn/XGBoost | Models where implemented |
| Power BI | Reporting |
| Streamlit/Plotly | Application and charts |

## 🔄 Project Workflow

1. Inspect data/, sql/, notebooks/, models/, powerbi/, app/, reports/, and images/.
2. Confirm dataset source, grain, time range, and synthetic/external status.
3. Check duplicates, missing dates, invalid sales, outliers, and inventory fields.
4. Review SQL schema and prepare tables using actual repository scripts.
5. Run notebooks to explore sales, demand, seasonality, and inventory indicators.
6. Define forecast/classification targets and prediction timing.
7. Use chronological splits for forecasting, compare baselines, and check leakage.
8. Reconcile dashboard KPIs against source data and notebook outputs.
9. Inspect the app entry point and confirm model inputs/outputs.
10. Document only reproducible metrics and business findings.

## 🗂️ Repository Structure

```text
retail-ai-intelligence-system/
├── app/
├── data/
├── images/
├── models/
├── notebooks/
├── powerbi/
├── reports/
└── sql/
└── README.md
```

The list above highlights known project files and folders; inspect the repository for the complete current structure.

## ⚙️ Installation

### Prerequisites

- Install the tools listed in the Tech Stack that apply to this project.
- For Python projects, use a Python version compatible with the dependencies actually imported by the code.
- For Power BI projects, use Power BI Desktop.

### Setup

Inspect the app/ and notebook folders for actual entry points and dependencies. Create an environment and install the project requirements if a dependency file is present; verify database setup in SQL scripts.

Do not run generic commands that do not match the files in this repository. Confirm the data paths, database dialect, and package versions before execution.

## ▶️ Usage

Follow the actual notebook, SQL, Power BI, and app workflows in the repository. Confirm the app entry point before using a run command.

## 📊 Results and Insights

### Recalculated KPIs from the current processed CSV

| KPI | Result |
|---|---:|
| Processed dataset rows | 72,427 |
| Processed dataset columns | 26 |
| Total revenue | ₹550,118,851.12 |
| Estimated profit (25% of revenue) | ₹137,529,712.78 |
| Average units sold per processed row | 137.71 |
| Total inventory | 19,929,382 |
| Average price | ₹55.13 |
| Average discount | 10.01% |

The totals above were independently recalculated from the current processed CSV. Because estimated profit is defined as exactly 25% of revenue in the notebook, it should be labelled **estimated profit under the assumed 25% margin**, not actual profit.

### Model evaluation: important validity issue

The saved notebook reports XGBoost demand regression (R^2 = 0.999813) and 5-fold cross-validation (R^2 = 0.999809). These values are **not valid evidence of generalizable forecasting performance in the current feature setup**: the feature list includes `stock_turnover`, which is calculated as `units_sold / inventory_level`, while the target is `units_sold`. This directly leaks information from the target into an input feature.

The inventory-risk classifier has a similar issue: `inventory_risk` is rule-generated from `inventory_level` and `demand_forecast`, and those same fields are used as model inputs. Its near-perfect saved accuracy measures how well the model recovers the rule, not whether it predicts independently observed future risk.

**Do not advertise either saved score as validated model performance.** Remove target-derived features, define prediction time, use a chronological holdout for forecasting, compare against a baseline, and rerun evaluation before reporting model metrics.

## 🖼️ Screenshots

![Retail project screenshot 1](images/Screenshot(375).png)

![Retail project screenshot 2](images/Screenshot(376).png)

![Retail project screenshot 3](images/Screenshot(377).png)

![Retail project screenshot 4](images/Screenshot(378).png)

![Retail project screenshot 5](images/Screenshot(379).png)

![Retail project screenshot 6](images/Screenshot(380).png)

## 🧩 Challenges and Solutions

| Challenge | Solution / validation approach |
|---|---|
| Forecasting and inventory targets may leak information | Define prediction time and validate using chronological splits and baselines. |

## ⚠️ Limitations

- Raw and processed files differ by 673 rows; the cleaning/export pipeline needs reconciliation.
- Estimated profit is an assumed 25% of revenue, not observed profit.
- The saved demand model leaks the target through `stock_turnover`; the classification label is rule-derived from its input features.
- Saved model scores have not been validated under a leakage-safe evaluation design.
- Dataset provenance and license should be documented.

## 🚀 Future Improvements

- [ ] Add reproducible setup commands and data dictionary.
- [ ] Validate reported model results and publish a model card.
- [ ] Document dashboard KPIs and data provenance.

## 📚 What I Learned

- Combining analytics, modelling, and dashboards.
- Importance of leakage checks and reproducible evaluation.

## 👤 Author

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

## 📄 License

Check data provenance and repository licensing.
