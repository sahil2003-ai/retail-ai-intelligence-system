# 🤖 Machine Learning Insights

## 📌 Project Overview

This project implements two machine learning workflows:

1. **Regression – Demand Forecasting**
2. **Classification – Inventory Risk Prediction**

The pipeline follows a complete ML lifecycle:
- Data loading & inspection
- Feature preprocessing
- Feature engineering
- Train-test split
- Model training
- Evaluation
- Feature importance analysis

---

# 📊 1. Data Preparation

## Preprocessing Steps
- Dataset loaded into pandas DataFrame
- Missing value handling
- Feature selection
- Train-test split
- Numerical & categorical separation

## Transformations
- Encoding (Label / One-hot)
- Feature scaling (where required)
- Target variable separation

---

# 🔮 2. Demand Forecasting (Regression)

## 🎯 Objective
Predict future product demand using historical business and inventory data.

---

## ⚙️ Workflow
- Define target variable (Demand)
- Train-test split
- Model training (ensemble-based)
- Prediction generation
- Performance evaluation

---

## 🧠 Model Used
Likely ensemble-based models:
- Random Forest Regressor  
- Gradient Boosting Regressor  

---

## 📏 Model Performance
- **Accuracy:** 96.27%
- **Error Rate:** 3.73%
- **Demand Gap:** 372.13K units

---

## 📊 Evaluation Metrics
- MAE (Mean Absolute Error)
- MSE (Mean Squared Error)
- RMSE
- R² Score

### Interpretation:
- Lower error → better predictions
- Higher R² → stronger model fit

---

## 📌 Observations
- Forecast closely follows actual demand
- Seasonal patterns captured effectively
- Minor deviations during demand spikes

---

## 📈 Feature Importance

Key drivers of demand:
- Units Sold
- Inventory Level
- Price
- Seasonality
- Region

### Insights:
- Demand is highly influenced by historical sales
- Seasonality plays a significant role
- Inventory indirectly impacts demand fulfillment

---

# ⚠️ 3. Inventory Risk Prediction (Classification)

## 🎯 Objective
Classify products into risk categories:
- Normal
- Low Stock Risk

---

## ⚙️ Workflow
1. Target creation
2. Train-test split
3. Model training
4. Predictions
5. Evaluation

---

## 🧠 Model Used
- Random Forest Classifier
- Tree-based classification model

---

## 📊 Confusion Matrix Interpretation

- Strong diagonal dominance → high accuracy
- Few misclassifications

### Key Terms:
- True Positive → Correct risk detection
- True Negative → Correct safe classification
- False Positive → Normal marked risky
- False Negative → Risk missed

---

## 📏 Evaluation Metrics
- Accuracy
- Precision
- Recall
- F1 Score

### Interpretation:
- Accuracy → overall correctness
- Precision → quality of predictions
- Recall → ability to detect risks
- F1 → balance between precision & recall

---

## 📌 Observations
- Majority of inventory classified correctly
- ~19% products fall under risk category
- Model effectively identifies stock issues

---

# 🧠 Overall Insights

## Strengths
✓ End-to-end ML pipeline  
✓ Both regression & classification covered  
✓ Feature importance analysis  
✓ Business-focused modeling  

---

## 💼 Business Value

### Demand Forecasting
- Improves inventory planning
- Reduces stockouts
- Enhances supply chain decisions

### Inventory Risk Classification
- Early risk detection
- Better warehouse optimization
- Prevents revenue loss

---

# 🚀 Future Improvements
- Hyperparameter tuning (XGBoost)
- Cross-validation
- Advanced feature engineering (lag features)
- Model comparison
- Real-time deployment (API)

