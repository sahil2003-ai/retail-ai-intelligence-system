# 🧠 Retail AI Intelligence System (2022–2024)

![Python](https://img.shields.io/badge/Python-Data%20Science-blue)
![SQL](https://img.shields.io/badge/PostgreSQL-Analytics-green)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![ML](https://img.shields.io/badge/Machine%20Learning-Model-red)

---

## 📌 Project Overview
An end-to-end **Retail Analytics & AI Intelligence System** built using **SQL, Python, and Power BI**.

This project analyzes **73,000+ daily store-product records** to:
- Optimize sales performance
- Improve inventory management
- Evaluate pricing strategy
- Predict demand and inventory risk using Machine Learning

---

## 🧱 Tech Stack
- **SQL:** PostgreSQL (CTEs, Window Functions, Views)
- **Python:** Pandas, NumPy, Scikit-learn, XGBoost, SQLAlchemy, joblib
- **Visualization:** Power BI
- **App:** Streamlit, Plotly

---

## 🗄️ Data Architecture
- Fact Table: `retail_inventory` (`sales_data`)
- Dimensions:
  - `Product` (Category)
  - `Region`
  - `Time` (Date / Season)

✔️ Structured for scalable analytics

---

## 📊 Key Business Insights

### 🚨 Critical KPI
- **Total Revenue:** ₹550.12M
- **Total Units Sold:** 9.97M
- **Estimated Profit:** ₹137.53M (~25% margin)

---

### 📦 Inventory Performance
- Overstock → **36.11K products** (too much capital tied up)
- Low Stock → **14.06K products** (risk of stockout)
- Stock Turnover → **0.50** (low efficiency)

---

### 🌦️ Seasonality Impact
- Sales are consistent across months with only slight seasonal variation
- Peak demand → **July and October**
- Noticeable dip → **February**

---

### ⏱️ Growth & Sales Trend
- Monthly revenue is stable at **₹45M–₹47M**
- Growth rate → **0.13%** (essentially flat / stagnant)
- Revenue is evenly spread across all 4 regions → no regional dominance

---

### 📦 Product / Pricing Risk
- Top categories by revenue → **Furniture, Groceries**
- Electronics → stable, competitive pricing
- Clothing → underpriced relative to demand (margin left on the table)
- Avg Price → ₹55.13 | Avg Discount → 10%

---

## 🤖 Machine Learning Model

### 🔮 Demand Forecasting — Models Compared:
- Linear Regression — R² 0.9977
- Random Forest — R² 0.9961
- Gradient Boosting — R² 0.9974
- **XGBoost ✅ (Best)** — R² 0.9998

### ⚠️ Inventory Risk Classification — Models Compared:
- **Logistic Regression ✅ (Best)** — Accuracy 0.9999
- Random Forest — Accuracy 0.9997
- Gradient Boosting — Accuracy 0.9996
- XGBoost — Accuracy 0.9990

### Performance:
- Reported business forecast accuracy: **96.27%**
- Demand Gap: **372.13K units**
- ~19% of products flagged as at-risk (Low Stock)
- Balanced precision & recall on risk classification (macro F1 ≈ 1.00 on this dataset)

---

## 📊 Power BI Dashboard

### Features:
- KPI Cards
- Sales Trends
- Inventory Analysis
- Pricing Insights
- Demand Forecast Visualization

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
- KPI Summary Cards
- Interactive Charts (Plotly)
- Downloadable Prediction Reports

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

---

## 💡 Business Recommendations
- Use ML demand forecasts to drive inventory replenishment and cut overstock by 20–30%
- Re-price underperforming categories (e.g. Clothing) to recover margin
- Double down on top-performing products and regions with targeted promotions
- Wire the forecasting model directly into inventory planning for semi-automated reordering

---

## 🚀 Future Improvements
- Hyperparameter tuning (XGBoost)
- Cross-validation
- Advanced feature engineering (lag features)
- Broader model comparison
- Real-time deployment (API)

---

## 📢 Conclusion
This project demonstrates a **complete data analytics pipeline**:
➡️ Data Engineering → SQL Analytics → ML Modeling → Dashboard → Deployment

---

## ⭐ If you like this project, give it a star!
