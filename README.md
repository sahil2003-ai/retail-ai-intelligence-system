# 🧠 Retail AI Intelligence System (2022–2024)

![Python](https://img.shields.io/badge/Python-Data%20Science-blue)
![SQL](https://img.shields.io/badge/PostgreSQL-Analytics-green)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![ML](https://img.shields.io/badge/Machine%20Learning-Model-red)

---

## 📌 Project Overview
An end-to-end **Retail Analytics & AI Intelligence System** built using **SQL, Python, and Power BI**.

This project analyzes 72,000+ store-product-day records to:
- Optimize sales performance
- Detect inventory imbalance (overstock vs. stockout)
- Evaluate pricing strategy
- Predict future demand and inventory risk using Machine Learning

---

## 🧱 Tech Stack
- **SQL:** PostgreSQL (Advanced Queries, CTEs, Window Functions)
- **Python:** Pandas, NumPy, Scikit-learn, XGBoost
- **Visualization:** Power BI
- **App:** Streamlit

---

## 🗄️ Data Architecture
- Fact Table: `retail_inventory`
- Dimensions (embedded in the fact table):
  - Date *(year, month, quarter, weekday)*
  - Product / Category
  - Region
  - Seasonality / Weather Condition

✔️ Structured for scalable analytics

---

## 📊 Key Business Insights

### 🚨 Critical KPI
- **Total Revenue:** ₹550.12M
- **Estimated Profit:** ₹137.53M (~25% margin)

---

### 📦 Inventory Performance
- Overstocked products → **36.11K**
- Low-stock products → **14.06K**
- Stock Turnover → **0.50** (low efficiency)

---

### 📈 Sales Trend
- Monthly revenue stable → **₹45M–₹47M**
- Growth rate → **0.13%** (stagnant, plateaued market)

---

### 💰 Pricing Impact
- Avg Price → ₹55.13
- Avg Discount → ~10%
- Competitive overall, but **Clothing** is underpriced relative to demand

---

### 🔮 Demand & Category Risk
- Forecast Accuracy → **96.27%**
- Demand Gap → **372.13K units**
- Furniture & Groceries → top revenue categories

---

## 🤖 Machine Learning Model

### 🔮 Demand Forecasting — Models Compared:
- Linear Regression
- Random Forest
- Gradient Boosting
- **XGBoost ✅ (Best — R² ≈ 0.9998)**

### ⚠️ Inventory Risk Classification — Models Compared:
- **Logistic Regression ✅ (Best — Accuracy ≈ 0.9999)**
- Random Forest
- Gradient Boosting
- XGBoost

### Performance:
- Regression (Demand): **R² ≈ 0.9998**, CV score ≈ 0.9998
- Classification (Risk): **Accuracy ≈ 0.9999**, precision/recall/F1 ≈ 1.00
- ~19% of products flagged as at-risk (Low Stock)

---

## 📊 Power BI Dashboard

### Features:
- KPI Cards
- Sales Trends
- Inventory Analysis
- Pricing Insights
- Forecast Visualization

📸 Screenshots:

![Dashboard](images/Screenshot(375).png)
![Dashboard](images/Screenshot(376).png)
![Dashboard](images/Screenshot(377).png)
![Dashboard](images/Screenshot(378).png)
![Dashboard](images/Screenshot(379).png)

---

## 🌐 Streamlit Application

Features:
- Single Prediction (Demand + Inventory Risk)
- Bulk CSV Prediction
- KPI Cards & Plotly Charts
- Downloadable Predictions Report

📸 Screenshots:

![app](images/Screenshot(380).png)

---

## 📁 Project Structure

```bash
retail-ai-intelligence-system/
│
├── app/                         # Streamlit application
│   ├── app.py
│   └── utils.py
│
├── data/                        # Raw & processed datasets
│   ├── raw/
│   │   └── retail_store_inventory.csv
│   └── processed/
│       └── retail_cleaned.csv
│
├── images/                      # Screenshots (Dashboard, App)
│   ├── Screenshot(375–379).png     # Power BI dashboard pages
│   └── Screenshot(380).png         # Streamlit app
│
├── models/                      # Saved ML models
│   ├── best_demand_model.pkl
│   ├── best_risk_model.pkl
│   └── label_encoders.pkl
│
├── notebooks/                   # Jupyter notebooks (EDA, training)
│   ├── 01_project_setup.ipynb
│   ├── 02_data_cleaning_feature_engineering.ipynb
│   └── 03_ml_modeling.ipynb
│
├── powerbi/                     # Power BI dashboard file
│   └── AI_Retail_Intelligence_System.pbix
│
├── reports/                     # Documentation & reports
│   ├── final_report.md
│   ├── sql_analysis.md
│   ├── ml_insights.md
│   ├── eda_insights.md
│   ├── dashboard_explanation.md
│   └── app_explanation.md
│
├── sql/                         # PostgreSQL scripts
│   ├── 01_kpi_queries.sql
│   ├── 02_inventory_analysis.sql
│   ├── 03_sales_analysis.sql
│   ├── 04_pricing_analysis.sql
│   ├── 05_forecasting_queries.sql
│   └── 06_advanced_business_queries.sql
│
└── README.md                    # Main project documentation
```

> ℹ️ No `requirements.txt` is currently in the repo. Install manually:
> `pip install pandas numpy matplotlib seaborn scikit-learn xgboost sqlalchemy joblib streamlit plotly`

---

## 💡 Business Recommendations
- Use ML demand forecasts to drive inventory planning and cut overstock by 20–30%
- Re-price underperforming categories (e.g. Clothing) to recover margin
- Focus promotions on high-performing products & regions
- Integrate the forecasting model directly into inventory operations

---

## 🚀 Future Improvements
- Hyperparameter tuning (deeper XGBoost search)
- Cross-validation across more folds
- Lag-based feature engineering for time-series demand
- Real-time model deployment via API

---

## 📢 Conclusion
This project demonstrates a **complete data analytics pipeline**:
➡️ Data Engineering → SQL Analytics → ML Modeling → Dashboard → Deployment

---

## ⭐ If you like this project, give it a star!
