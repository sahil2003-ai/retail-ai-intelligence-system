# 🧠 Retail AI Intelligence System

![Python](https://img.shields.io/badge/Python-Data%20Science-blue)
![SQL](https://img.shields.io/badge/PostgreSQL-Analytics-green)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![ML](https://img.shields.io/badge/Machine%20Learning-Model-red)

---

An end-to-end retail analytics and AI intelligence platform that turns raw store-level sales and inventory data into business decisions. It combines SQL analytics, exploratory data analysis, machine learning (demand forecasting + inventory risk classification), an interactive Power BI dashboard, and a Streamlit prediction app.

📌 Project Overview

The system ingests two years of daily, store-and-product-level retail data (~73K rows, 5 categories, 4 regions) and answers four business questions:

Where is revenue and profit coming from, and is it growing?
Which products are overstocked or at risk of stocking out?
Is pricing competitive, and where are we leaving margin on the table?
Can future demand be predicted accurately enough to plan inventory around it?

The answers are delivered through SQL reports, a 5-page Power BI dashboard, and a Streamlit app that serves live ML predictions.

🚀 Highlights
📊 Analyzed ₹550.12M in revenue across 9.97M units sold
💰 ₹137.53M estimated profit (~25% margin)
🤖 Trained and compared 4 regression models for demand forecasting — best: XGBoost (R² ≈ 0.9998)
⚠️ Trained and compared 4 classification models for inventory-risk detection — best: Logistic Regression (accuracy ≈ 0.9999)
📦 Identified inventory imbalance: 36.11K overstocked vs 14.06K low-stock products, stock turnover of only 0.50
📈 Built a 5-page interactive Power BI dashboard (Overview, Sales, Inventory, Pricing, Forecasting)
🌐 Shipped a Streamlit app for single and bulk (CSV) demand/risk predictions
🧱 Tech Stack
Layer	Tools
Data storage / analysis	PostgreSQL (CTEs, window functions, views)
Data wrangling / EDA	Python, Pandas, NumPy, Matplotlib, Seaborn, SQLAlchemy
Machine Learning	scikit-learn (Linear/Logistic Regression, Random Forest, Gradient Boosting), XGBoost, joblib
Dashboarding	Power BI (.pbix)
App / Serving	Streamlit, Plotly

ℹ️ The repo does not currently include a requirements.txt. Based on the actual imports in the notebooks and app code, install: pandas numpy matplotlib seaborn scikit-learn xgboost sqlalchemy joblib streamlit plotly.

📁 Repository Structure

This reflects what is actually in the repository:

retail-ai-intelligence-system/
│
├── app/
│   ├── app.py                          # Streamlit UI (single + bulk prediction)
│   └── utils.py                        # Feature engineering, encoding, prediction pipeline
│
├── data/
│   ├── raw/
│   │   └── retail_store_inventory.csv       # 73,100 rows, original source data
│   └── processed/
│       └── retail_cleaned.csv               # 72,427 rows, engineered features + labels
│
├── images/
│   ├── Screenshot(375).png ... (376–379)    # Power BI dashboard pages
│   └── Screenshot(380).png                  # Streamlit app screenshot
│
├── models/
│   ├── best_demand_model.pkl            # Trained XGBoost regressor
│   ├── best_risk_model.pkl              # Trained Logistic Regression classifier
│   └── label_encoders.pkl               # Saved LabelEncoders for categorical fields
│
├── notebooks/
│   ├── 01_project_setup.ipynb                        # Load + inspect raw data
│   ├── 02_data_cleaning_feature_engineering.ipynb    # Cleaning, features, load to Postgres
│   └── 03_ml_modeling.ipynb                          # Model training, comparison, export
│
├── powerbi/
│   └── AI_Retail_Intelligence_System.pbix   # 5-page interactive dashboard
│
├── reports/
│   ├── final_report.md                  # Executive summary of the whole project
│   ├── sql_analysis.md                  # SQL-derived KPIs and business interpretation
│   ├── eda_insights.md                  # EDA findings
│   ├── ml_insights.md                   # ML pipeline, metrics, feature importance
│   ├── dashboard_explanation.md         # Walkthrough of each dashboard page
│   └── app_explanation.md               # Walkthrough of the Streamlit app
│
├── sql/
│   ├── 01_kpi_queries.sql               # Revenue, profit, core KPIs
│   ├── 02_inventory_analysis.sql        # Low stock / overstock queries
│   ├── 03_sales_analysis.sql            # Category & region sales performance
│   ├── 04_pricing_analysis.sql          # Price vs. competitor pricing
│   ├── 05_forecasting_queries.sql       # Demand & demand-gap queries
│   └── 06_advanced_business_queries.sql # Window functions (RANK, etc.)
│
└── README.md
🗄️ Dataset

Source file: data/raw/retail_store_inventory.csv — daily records per store/product from 2022 onward.

Column	Description
Date, Store ID, Product ID	Row identifiers
Category	Groceries, Toys, Electronics, Furniture, Clothing
Region	North, South, East, West
Inventory Level, Units Sold, Units Ordered	Stock movement
Demand Forecast	Forecasted demand (source system)
Price, Discount, Competitor Pricing	Pricing fields
Weather Condition, Holiday/Promotion, Seasonality	Contextual features

Processed file: data/processed/retail_cleaned.csv adds engineered fields used for analytics and modeling: revenue, estimated_profit, demand_gap, price_difference, stock_turnover, inventory_risk (Normal / Low Stock), plus date parts (year, month, day, weekday, quarter).

🧮 SQL Analysis

Six query files under sql/ cover:

KPIs — total revenue, total profit, average price
Inventory — low-stock and overstock product lists
Sales — revenue by category and region
Pricing — products priced above/below competitors
Forecasting — highest-demand products, demand-gap analysis
Advanced — RANK() OVER (...) window-function queries for top products by revenue

Full narrative and interpreted results are in reports/sql_analysis.md.

📊 Key Business Insights
Core KPIs
Total Revenue: ₹550.12M
Total Units Sold: 9.97M
Average Price: ₹55.13
Estimated Profit: ₹137.53M (~25% margin)
Inventory
Overstocked products: 36.11K
Low-stock products: 14.06K
Stock turnover: 0.50 (indicates low efficiency)
Sales
Monthly revenue is stable in the ₹45M–₹47M range
Growth rate is essentially flat (~0.13%) — a plateaued/mature market
Pricing
Average discount: ~10%
Pricing is broadly competitive, but some categories (e.g. Clothing) are underpriced relative to demand
Demand
Reported forecast accuracy (business KPI): 96.27%
Demand gap: 372.13K units
🤖 Machine Learning Models

Built and evaluated in notebooks/03_ml_modeling.ipynb, with final models exported to models/.

🔮 Demand Forecasting (Regression)

Four models were trained and compared on R²:

Model	R²
Linear Regression	0.9977
Random Forest	0.9961
Gradient Boosting	0.9974
XGBoost (selected)	0.9998

Best model: XGBoost Regressor — saved as models/best_demand_model.pkl.

⚠️ Inventory Risk Classification

Four classifiers were trained and compared on accuracy:

Model	Accuracy
Logistic Regression (selected)	0.9999
Random Forest	0.9997
Gradient Boosting	0.9996
XGBoost	0.9990

Best model: Logistic Regression — saved as models/best_risk_model.pkl. In the processed data, inventory_risk has two observed classes, Normal and Low Stock (~19% of records flagged as at-risk).

Features used by both models (see app/utils.py): price, discount, inventory_level, demand_forecast, competitor_pricing, price_difference, stock_turnover, price_ratio, inventory_pressure, demand_supply_gap, category, region, seasonality.

Full write-up: reports/ml_insights.md.

📊 Power BI Dashboard

powerbi/AI_Retail_Intelligence_System.pbix — a 5-page dashboard:

Executive Overview — KPI cards, revenue trend, revenue by category/region, top products
Sales Analytics — monthly trend, category/region performance, product mix
Inventory Analytics — stock levels, risk distribution, turnover by category
Pricing Analytics — price vs. demand, competitor comparison, discount impact
Demand Forecasting — forecast vs. actual, seasonal trend, error distribution

All pages include filters for date range, region, category, store, and seasonality.
📸 Screenshots (images/Screenshot(375–379).png):

### 1️⃣ Executive Overview
- Revenue KPIs
- Profit KPIs
- Regional Performance
- Category Performance
![Dashboard](images/Screenshot(375).png)

### 2️⃣ Sales Analytics
- Monthly Sales Trends
- Product Performance
- Category Revenue Analysis
![Dashboard](images/Screenshot(376).png)

### 3️⃣ Inventory Analytics
- Inventory Risk Analysis
- Overstock Detection
- Stock Turnover Monitoring
![Dashboard](images/Screenshot(377).png)

### 4️⃣ Pricing Analytics
- Competitor Price Comparison
- Discount Impact Analysis
- Profit Margin Tracking
![Dashboard](images/Screenshot(378).png)

### 5️⃣ Demand Forecasting
- Forecast vs Actual
- Forecast Accuracy
- Error Distribution
- Seasonal Demand Trends
![Dashboard](images/Screenshot(379).png)

---

## 🌐 Streamlit Application

Features:
- Real-time demand prediction
- User input-based forecasting
- Interactive UI

📸 Screenshots:

![app](images/Screenshot(380).png)

---

## 📁 Project Structure

```bash
retail-ai-intelligence-system/
│
├── app/
│   └── app.py
│
├── data/
│   ├── raw/
│   └── processed/
│
├── images/
│   ├── dashboard.png
│   └── app.png
│
├── models/
│   ├── model.pkl
│   └── scaler.pkl
│
├── notebooks/
│   ├── eda.ipynb
│   └── ml_model.ipynb
│
├── outputs/
│   └── predictions.csv
│
├── powerbi/
│   └── dashboard.pbix
│
├── reports/
│   ├── final_report.md
│   ├── sql_analysis.md
│   ├── ml_insights.md
│   ├── eda_insights.md
│   └── dashboard_explanation.md
│
├── sql/
│   ├── schema.sql
│   └── queries.sql
│
├── requirements.txt
└── README.md#
```

## 💡 Business Recommendations

- Implement **demand-based inventory planning**
- Optimize pricing for underperforming categories
- Focus on high-performing products & regions
- Integrate ML predictions into operations

---

## 🎯 Business Impact

This solution helps retailers:

✅ Reduce stock shortages

✅ Minimize overstock inventory costs

✅ Improve demand planning

✅ Optimize pricing strategies

✅ Increase operational efficiency

✅ Support data-driven decision making

---

## 🏆 Key Skills Demonstrated

### Data Analytics
- Advanced SQL
- Data Cleaning
- Exploratory Data Analysis
- KPI Development

### Data Science
- Feature Engineering
- Regression Modeling
- Classification Modeling
- Model Evaluation

### Business Intelligence
- Power BI Dashboard Development
- DAX Measures
- Data Modeling
- Interactive Reporting

### Business Analytics
- Demand Forecasting
- Inventory Optimization
- Pricing Analytics
- Revenue Analysis

---

## 🎯 Conclusion

This project demonstrates the ability to:
- Convert raw data into actionable insights  
- Build predictive models for business optimization  
- Deliver real-world analytics solutions  

---

⭐ If you like this project, give it a star!
