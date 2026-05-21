# =========================================================
# UTILS FILE (DATA PROCESSING + PREDICTION)
# =========================================================

import pandas as pd


# ======================
# FEATURE ENGINEERING
# ======================

def create_features(df):

    df['price_ratio'] = df['price'] / (df['competitor_pricing'] + 1)

    df['inventory_pressure'] = df['demand_forecast'] / (df['inventory_level'] + 1)

    df['demand_supply_gap'] = df['demand_forecast'] - df['inventory_level']

    df['price_difference'] = df['price'] - df['competitor_pricing']

    if 'units_sold' in df.columns:
        df['stock_turnover'] = df['units_sold'] / (df['inventory_level'] + 1)
    else:
        df['stock_turnover'] = 1

    return df


# ======================
# ENCODING
# ======================

def encode_data(df, le_dict):
    categorical_cols = [
        'category', 'region',
        'weather_condition', 'seasonality'
    ]

    for col in categorical_cols:
        if col in df.columns:
            df[col] = df[col].map(
                dict(zip(
                    le_dict[col].classes_,
                    le_dict[col].transform(le_dict[col].classes_)
                ))
            )

    return df


# ======================
# CLEAN DATA
# ======================

def clean_data(df):
    df = df.drop(
        columns=['date', 'product_id', 'store_id', 'weekday', 'inventory_risk'],
        errors='ignore'
    )
    return df


# ======================
# SELECT FEATURES
# ======================

def select_features(df):
    features = [
    'price', 'discount', 'inventory_level',
    'demand_forecast', 'competitor_pricing',
    'price_difference', 'stock_turnover',
    'price_ratio', 'inventory_pressure',
    'demand_supply_gap',
    'category', 'region', 'seasonality'
]
    
    return df[features]


# ======================
# FULL PIPELINE
# ======================

def preprocess_data(df, le_dict):
    df = create_features(df)
    df = encode_data(df, le_dict)
    df = clean_data(df)
    df = select_features(df)
    return df


# ======================
# PREDICTION FUNCTION
# ======================

def make_predictions(df, model_reg, model_cls, le_dict):

    df_model = preprocess_data(df.copy(), le_dict)

    df['Predicted Demand'] = model_reg.predict(df_model)
    df['Predicted Risk'] = model_cls.predict(df_model)

    return df