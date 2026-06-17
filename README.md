# 🧠 Retail AI Intelligence System

![Python](https://img.shields.io/badge/Python-Data%20Science-blue)
![SQL](https://img.shields.io/badge/PostgreSQL-Analytics-green)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![ML](https://img.shields.io/badge/Machine%20Learning-Model-red)

---

## 📌 Project Overview
An end-to-end **Retail Analytics & AI Intelligence System** built using **SQL, Python, Power BI, and Machine Learning**.

This project analyzes large-scale retail data to:
- Optimize sales performance
- Improve inventory management
- Enhance pricing strategies
- Predict demand using ML models

---

## 🚀 Project Highlights

- 📊 Analyzed **72K+ retail transactions**
- 💰 Generated insights from **₹550M+ revenue**
- 🤖 Built **Demand Forecasting Model (XGBoost)** with **99.98% R² Score**
- 📈 Achieved **96.27% Business Forecast Accuracy**
- ⚠️ Built **Inventory Risk Classification Model**
- 📦 Identified **36K Overstock** and **14K Low Stock** products
- 💵 Performed **Competitor Pricing Analysis**
- 🗄️ Developed **Advanced SQL Analytics Layer** using CTEs and Window Functions
- 📊 Created a **5-page Interactive Power BI Dashboard**

---

## 🧱 Tech Stack
- **SQL:** PostgreSQL (Advanced Queries, CTEs, Window Functions)
- **Python:** Pandas, NumPy, Scikit-learn
- **Visualization:** Power BI
- **App:** Streamlit
  
---

## 🔄 End-to-End Project Workflow

1. Data Collection & Validation
2. Exploratory Data Analysis (EDA)
3. Data Cleaning & Feature Engineering
4. SQL Business Analytics
5. Demand Forecasting (Regression)
6. Inventory Risk Prediction (Classification)
7. Power BI Dashboard Development
8. Business Recommendation Generation

---

## 🗄️ Data Architecture
- Fact Table: `sales_data`
- Dimensions:
  - Product
  - Category
  - Region
  - Time

✔️ Structured for scalable analytics

---

## 📊 Key Business Insights

### 🚨 Core KPIs
- **Total Revenue:** ₹550.12M  
- **Total Units Sold:** 9.97M  
- **Profit:** ₹137.53M (~25% margin)

---

### 📦 Inventory Insights
- Overstock → **36K products**
- Low stock → **14K products**
- Stock Turnover → **0.50 (low efficiency)**

---

### 📈 Sales Insights
- Monthly revenue stable (~₹45M–₹47M)
- Growth rate → **0.13% (stagnant)**

---

### 💰 Pricing Insights
- Avg Price → ₹55.13  
- Avg Discount → 10%  
- Competitive pricing but **underpriced categories exist**

---

### 🔮 Demand Insights
- Forecast Accuracy → **96.27%**
- Demand Gap → **372K units**
- Strong seasonal patterns observed

---

## 🗄️ SQL Analytics

Advanced PostgreSQL queries were used to generate business insights:

- KPI Analysis
- Inventory Analysis
- Sales Performance Analysis
- Pricing Optimization Analysis
- Seasonal Revenue Analysis
- Holiday Promotion Analysis
- Inventory Risk Assessment
- Forecasting Support Queries

### SQL Concepts Used

- Common Table Expressions (CTEs)
- Window Functions
- Aggregate Functions
- CASE Statements
- Views
- Ranking Functions
- Business KPI Calculations

---

## 🤖 Machine Learning Models

### 🔮 Demand Forecasting (Regression)

**Model:** XGBoost Regressor

- R² Score: 99.98%
- Cross Validation Score: 99.98%
- Forecast Accuracy KPI: 96.27%
- Demand Gap: 372.13K Units

Features Used:
- Inventory Level
- Price
- Discount
- Competitor Pricing
- Seasonality
- Product Category
- Region

---

### ⚠️ Inventory Risk Prediction (Classification)

Models Evaluated:
- Logistic Regression
- Random Forest
- Gradient Boosting
- XGBoost Classifier

Business Objective:
- Predict Low Stock Risk
- Reduce Stockouts
- Improve Inventory Planning

---

## 📊 Power BI Dashboard

### Features:
- KPI Cards
- Sales Trends
- Inventory Analysis
- Pricing Insights
- Forecast Visualization

## Dashboard Pages:

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
