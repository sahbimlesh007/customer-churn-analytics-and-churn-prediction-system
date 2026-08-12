import streamlit as st
import pandas as pd
import numpy as np
import joblib
import plotly.graph_objects as go

st.set_page_config(page_title="Customer Churn Analytics", page_icon="📊", layout="wide")


model = joblib.load(r"./notebooks/logistic_churn_model.pkl")
scaler = joblib.load(r"./notebooks/scaler.pkl")
feature_columns = joblib.load(r"./notebooks/model_features.pkl")
model_info = joblib.load(r"./notebooks/model_info.pkl")


st.markdown(
    """
<style>

.main{
    background-color:#0E1117;
}

[data-testid="stHeader"]{
    background-color: rgba(0,0,0,0);
}

.block-container{
    padding-top:2rem;
}

.metric-card{
    background:#1c2333;
    padding:20px;
    border-radius:15px;
    text-align:center;
}

.big-title{
    font-size:40px;
    font-weight:700;
    color:white;
}

.sub-title{
    color:#b8bcc8;
    font-size:18px;
}

</style>
""",
    unsafe_allow_html=True,
)


# HEADER


st.markdown(
    """
    <div class="big-title">
    📊 Customer Churn Analytics Platform
    </div>

    <div class="sub-title">
    Predict customer churn and identify retention opportunities using Machine Learning
    </div>
    """,
    unsafe_allow_html=True,
)

st.markdown("---")


# KPI SECTION


col1, col2, col3 = st.columns(3)

with col1:
    st.metric("Model", model_info["model_name"])

with col2:
    st.metric("F1 Score", f"{model_info['f1_score']:.3f}")

with col3:
    st.metric("ROC AUC", f"{model_info['roc_auc']:.3f}")

st.markdown("---")


# INPUT SECTION


st.subheader("Customer Information")

col1, col2, col3 = st.columns(3)

with col1:

    gender = st.selectbox("Gender", ["Male", "Female"])

    senior_citizen = st.selectbox("Senior Citizen", [0, 1])

    partner = st.selectbox("Partner", ["Yes", "No"])

with col2:

    dependents = st.selectbox("Dependents", ["Yes", "No"])

    tenure = st.slider("Tenure (Months)", 0, 72, 24)

    contract = st.selectbox("Contract", ["Month-to-month", "One year", "Two year"])

with col3:

    internet_service = st.selectbox("Internet Service", ["DSL", "Fiber optic", "No"])

    payment_method = st.selectbox(
        "Payment Method",
        [
            "Electronic check",
            "Mailed check",
            "Bank transfer (automatic)",
            "Credit card (automatic)",
        ],
    )

    monthly_charges = st.number_input("Monthly Charges", min_value=0.0, value=70.0)

total_charges = monthly_charges * tenure

st.markdown("")

predict_btn = st.button("🔍 Predict Churn Risk", use_container_width=True)


# PREDICTION


if predict_btn:

    input_df = pd.DataFrame(
        {
            "gender": [gender],
            "senior_citizen": [senior_citizen],
            "partner": [partner],
            "dependents": [dependents],
            "tenure": [tenure],
            "contract": [contract],
            "internet_service": [internet_service],
            "payment_method": [payment_method],
            "monthly_charges": [monthly_charges],
            "total_charges": [total_charges],
        }
    )

    input_df = pd.get_dummies(input_df, drop_first=True)

    input_df = input_df.reindex(columns=feature_columns, fill_value=0)

    input_scaled = scaler.transform(input_df)

    prediction = model.predict(input_scaled)[0]

    probability = model.predict_proba(input_scaled)[0][1]

    st.markdown("---")

    left, right = st.columns([1, 1])

    # Gauge

    with left:

        fig = go.Figure(
            go.Indicator(
                mode="gauge+number",
                value=probability * 100,
                title={"text": "Churn Probability"},
                gauge={"axis": {"range": [0, 100]}},
            )
        )

        fig.update_layout(height=350)

        st.plotly_chart(fig, use_container_width=True)

    # Result

    with right:

        if probability >= 0.80:
            risk = "🔴 Very High Risk"

        elif probability >= 0.60:
            risk = "🟠 High Risk"

        elif probability >= 0.40:
            risk = "🟡 Medium Risk"

        else:
            risk = "🟢 Low Risk"

        st.metric("Risk Level", risk)

        st.metric("Churn Probability", f"{probability:.2%}")

        if prediction == 1:

            st.error("Customer is likely to churn.")

        else:

            st.success("Customer is likely to stay.")


# BUSINESS INSIGHTS

st.markdown("---")

st.subheader("📈 Key Business Insights")

st.info("""
        📌 **IBM Telco Churn Dataset Insights**

• Total Customers: 7,043

• Customers Retained: 5,174 (73.5%)

• Customers Churned: 1,869 (26.5%)

• Month-to-Month customers show the highest churn tendency.

• Short-tenure customers are significantly more likely to churn.

• Higher monthly charges are associated with increased churn risk.

• Contract type and payment method are strong churn indicators.

• Retention efforts should focus on high-value, high-risk customers.
""")


st.markdown("---")


st.markdown(
    """
    <div style='text-align:center; color:#A0A0A0; font-size:14px; padding:10px;'>
        © 2026 Bimlesh Sah | End-to-End Customer Churn Analytics Project <br>
        SQL • Python • Machine Learning • Power BI • Streamlit
    </div>
    """,
    unsafe_allow_html=True,
)
