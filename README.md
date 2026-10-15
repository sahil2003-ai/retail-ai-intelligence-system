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

The saved setup/cleaning notebook reports **73,100 rows × 15 columns**. The cleaning notebook output reports zero missing values across the listed columns and **0 duplicate rows removed**.

- **Files:** `data/raw/retail_store_inventory.csv`, `data/processed/retail_cleaned.csv`
- **Fields:** date, store_id, product_id, category, region, inventory_level, units_sold, units_ordered, demand_forecast, price, discount, weather_condition, holiday_promotion, competitor_pricing, seasonality.
- **Data provenance:** The repository includes the dataset, but the original publisher/license is not established in the README. Verify source terms before redistribution.

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

### Results recorded in saved notebook outputs

| Metric | Recorded result |
|---|---:|
| Dataset size | 73,100 rows × 15 columns |
| Missing values | 0 in the listed columns |
| Duplicate rows removed | 0 |
| Total revenue | ₹550,118,851.12 |
| Total profit | ₹137,529,712.78 |
| Average units sold | 137.71 |
| Total inventory | 19,929,382 |
| Demand model | XGBoost |
| Demand model test R² | 0.999813 |
| Demand model 5-fold CV R² | 0.999809 |
| Inventory-risk model accuracy (saved output) | Logistic Regression: 0.999931 |

These are **saved notebook outputs**, not independently re-executed results in a clean environment. The exceptionally high model scores require a target/feature leakage audit before being presented as reliable predictive performance. In particular, inspect how the target is constructed and whether inputs such as demand forecast, inventory, demand-supply gap, or related engineered fields overlap with the target.

### Business interpretation

The saved report flags inventory imbalance and stable revenue. Treat proposed actions (such as reducing overstock) as hypotheses until verified against the data, KPI definitions, and operational constraints.

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

- Dataset provenance and license are not confirmed.
- Reported KPI and model values come from saved notebook outputs and were not freshly reproduced here.
- Near-perfect model scores require a target definition and leakage audit.
- Business recommendations need validation against operational costs and constraints.

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
