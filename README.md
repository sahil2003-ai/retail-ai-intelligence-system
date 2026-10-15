# Retail AI Intelligence System

An end-to-end retail analytics portfolio project combining Python, SQL, machine learning, Power BI, and Streamlit to examine sales, demand, pricing, and inventory indicators.

![Status](https://img.shields.io/badge/Status-Documented-yellow)

## 📌 Table of Contents

- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Objectives](#-objectives)
- [Features](#-features)
- [Dataset](#-dataset)
- [Tech Stack](#-tech-stack)
- [Project Workflow](#-project-workflow)
- [Repository Structure](#-repository-structure)
- [Installation](#-installation)
- [Usage](#-usage)
- [Results and Insights](#-results-and-insights)
- [Screenshots](#-screenshots)
- [Challenges and Solutions](#-challenges-and-solutions)
- [Limitations](#-limitations)
- [Future Improvements](#-future-improvements)
- [What I Learned](#-what-i-learned)
- [Author](#-author)
- [License](#-license)

## 📖 Overview

An end-to-end retail analytics portfolio project combining Python, SQL, machine learning, Power BI, and Streamlit to examine sales, demand, pricing, and inventory indicators.

## 🎯 Problem Statement

The project addresses a data-analysis or modeling question using the dataset and implementation available in this repository. The aim is to produce transparent, reproducible evidence rather than unsupported performance claims.

## 🎯 Objectives

- Understand the data and define the target or business question.
- Document data preparation, feature engineering, and analysis/modeling steps.
- Report available metrics with their evidence and validation status.
- Make the workflow reproducible and explain limitations.

## ✨ Features

1. Validate raw data and column types.
2. Reconcile raw-to-processed row changes.
3. Run SQL analyses and compare KPIs with Python.
4. Review model features, targets, and split strategy.
5. Open and refresh the Power BI dashboard.
6. Run the Streamlit app and test both single and bulk prediction flows, if supported by the code.

## 📂 Dataset

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

## 🛠️ Tech Stack

Python, pandas, scikit-learn/XGBoost where implemented, SQL/PostgreSQL, Power BI, Streamlit, and Plotly.

## 🔄 Project Workflow

1. Validate raw data and column types.
2. Reconcile raw-to-processed row changes.
3. Run SQL analyses and compare KPIs with Python.
4. Review model features, targets, and split strategy.
5. Open and refresh the Power BI dashboard.
6. Run the Streamlit app and test both single and bulk prediction flows, if supported by the code.

## 🗂️ Repository Structure

Browse the repository tree for the actual project files and folders.

## ⚙️ Installation

Review the dependencies and setup files in the repository before running the project.

## ▶️ Usage

Follow the actual notebook/script entry point and verify input paths before execution.

## 📊 Results and Insights

Saved notebook/report outputs report very high demand-model fit and inventory-risk classification performance. **Do not present the saved scores as validated generalization results yet.** The feature `stock_turnover` is defined as `units_sold / inventory_level` while `units_sold` is the demand-regression target, which leaks target information into a predictor. In addition, the inventory-risk target is rule-generated from fields that are also used as model inputs, so a strong classifier can merely learn the rule used to create its label.

To make model results credible:
1. Remove target-derived or post-outcome features.
2. Define the prediction timestamp and exclude information unavailable then.
3. Use a chronological holdout for time-dependent demand prediction.
4. Compare with simple baselines.
5. Recompute MAE/RMSE/R² for regression and precision/recall/F1/confusion matrix for classification.
6. Publish the split design and exact model configuration alongside results.

## 🖼️ Screenshots

Add genuine charts or app screenshots stored in the repository. Do not use mock screenshots or claim that a file exists unless verified.

## 🧩 Challenges and Solutions

| Challenge | Solution |
|---|---|
| Saved outputs may not match current data or dependencies | Rerun the workflow and compare fresh outputs. |
| High model scores can be caused by leakage or an unsuitable split | Validate feature timing, target construction, split strategy, and baseline. |
| Results may be hard to reproduce | Document package versions, input paths, and random seeds where applicable. |

## ⚠️ Limitations

- Raw-to-processed row-count mismatch is unresolved.
- Profit is estimated using a fixed 25% assumption.
- Saved model metrics are not leakage-safe validation evidence.
- The dataset source/license should be documented.
- Business patterns are descriptive and do not prove causation.

## 🚀 Future Improvements

- [ ] Rerun the pipeline and verify all saved metrics.
- [ ] Document dataset provenance and data dictionary.
- [ ] Add genuine output screenshots and a reproducible model comparison.

## 📚 What I Learned

- Building a reproducible data science workflow.
- Choosing and interpreting task-appropriate evaluation metrics.
- Separating descriptive associations from causal claims.
- Documenting model limitations alongside results.

## 👤 Author

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

## 📄 License

Confirm the repository license and dataset reuse terms before redistribution.