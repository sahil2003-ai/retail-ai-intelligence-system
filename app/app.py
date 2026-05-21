# =========================================================
# AI RETAIL INTELLIGENCE STREAMLIT APP (FINAL ELITE)
# =========================================================

import streamlit as st
import pandas as pd
import joblib
import plotly.express as px

from utils import make_predictions

# ======================
# PAGE CONFIG
# ======================

st.set_page_config(
    page_title="AI Retail Intelligence",
    layout="wide"
)

# ======================
# CUSTOM UI
# ======================

st.markdown("""
<style>
.main {
    background-color: #0F172A;
    color: white;
}
.stButton>button {
    background-color: #06B6D4;
    color: white;
    border-radius: 10px;
}
</style>
""", unsafe_allow_html=True)

# ======================
# LOAD MODELS & ENCODERS
# ======================

model_reg = joblib.load('../models/best_demand_model.pkl')
model_cls = joblib.load('../models/best_risk_model.pkl')
le_dict = joblib.load('../models/label_encoders.pkl')

# ======================
# TITLE
# ======================

st.title("📊 AI Retail Intelligence System")
st.markdown("### Predict Demand & Inventory Risk using AI")

st.markdown("---")

# =========================================================
# 🔮 SINGLE PREDICTION
# =========================================================

st.subheader("🔮 Single Prediction")

col1, col2 = st.columns(2)

with col1:
    price = st.number_input("Price", value=100.0)
    discount = st.slider("Discount", 0.0, 0.5, 0.1)
    inventory = st.number_input("Inventory Level", value=200)

with col2:
    demand_forecast = st.number_input("Demand Forecast", value=250)
    competitor_price = st.number_input("Competitor Price", value=95)
    category = st.selectbox("Category", ["Electronics", "Clothing", "Grocery", "Furniture"])
    region = st.selectbox("Region", ["North", "South", "East", "West"])
    seasonality = st.selectbox("Seasonality", ["Winter", "Summer", "Spring", "Autumn"])

# Create input dataframe
input_df = pd.DataFrame({
    'price': [price],
    'discount': [discount],
    'inventory_level': [inventory],
    'demand_forecast': [demand_forecast],
    'competitor_pricing': [competitor_price],
    'category': [category],
    'region': [region],
    'seasonality': [seasonality]
})

# Risk decoding function
def decode_risk(value):
    mapping = {0: "Normal", 1: "Low Stock", 2: "Critical"}
    return mapping.get(value, "Unknown")

# Predict
if st.button("🚀 Predict"):

    result = make_predictions(input_df, model_reg, model_cls, le_dict)

    demand = result['Predicted Demand'].values[0]
    risk_raw = result['Predicted Risk'].values[0]
    risk = decode_risk(risk_raw)

    st.subheader("📈 Results")

    c1, c2 = st.columns(2)

    c1.metric("Predicted Demand", f"{demand:.2f}")
    c2.metric("Inventory Risk", risk)

st.markdown("---")

# =========================================================
# 📂 BULK PREDICTION
# =========================================================

st.subheader("📂 Bulk Prediction")

uploaded_file = st.file_uploader("Upload CSV File", type=["csv"])

if uploaded_file:

    df = pd.read_csv(uploaded_file)

    st.write("### Preview Data")
    st.dataframe(df.head())

    if st.button("📊 Run Bulk Prediction"):

        result_df = make_predictions(df, model_reg, model_cls, le_dict)

        # Decode risk column
        result_df['Predicted Risk Label'] = result_df['Predicted Risk'].map({
            0: "Normal",
            1: "Low Stock",
            2: "Critical"
        })

        st.success("Prediction Completed ✅")

        # Show key columns
        st.write("### Predictions")
        st.dataframe(result_df[['Predicted Demand', 'Predicted Risk Label']].head())

        # ======================
        # KPI CARDS
        # ======================

        st.subheader("📊 Key Insights")

        col1, col2, col3 = st.columns(3)

        col1.metric("Avg Demand", round(result_df['Predicted Demand'].mean(), 2))
        col2.metric("Max Demand", round(result_df['Predicted Demand'].max(), 2))
        col3.metric(
            "Low Stock Count",
            (result_df['Predicted Risk'] == 1).sum()
        )

        # ======================
        # VISUALIZATION
        # ======================

        st.subheader("📈 Insights Charts")

        fig1 = px.histogram(
            result_df,
            x='Predicted Demand',
            title="Demand Distribution"
        )

        st.plotly_chart(fig1, use_container_width=True)

        fig2 = px.box(
            result_df,
            y='Predicted Demand',
            title="Demand Spread"
        )

        st.plotly_chart(fig2, use_container_width=True)

        # ======================
        # DOWNLOAD BUTTON
        # ======================

        st.download_button(
            "⬇️ Download Predictions",
            result_df.to_csv(index=False),
            file_name="predictions.csv"
        )