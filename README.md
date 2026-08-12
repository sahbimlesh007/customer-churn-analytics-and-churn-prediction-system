# 📊 Customer Churn, Retention Analytics and ML churn prediction system

An end-to-end Data Analytics and Machine Learning project designed to identify customer churn patterns, quantify revenue at risk, and provide actionable retention strategies.

This project combines **SQL, Python, Machine Learning, Power BI, and Streamlit** to transform raw customer data into business insights and predictive analytics.

---

## 🚀 Project Overview

Customer churn directly impacts business growth and profitability. This project helps organizations:

- Identify customers likely to churn
- Analyze churn drivers
- Measure revenue loss
- Segment customers by risk and value
- Predict future churn using Machine Learning
- Develop data-driven retention strategies

---

## 🛠️ Tech Stack

- **SQL (MySQL)** – Database Design & Analysis
- **Python** – Data Cleaning, EDA & Machine Learning
- **Pandas & NumPy** – Data Processing
- **Matplotlib & Seaborn** – Data Visualization
- **Scikit-Learn** – Machine Learning
- **XGBoost** – Advanced Classification
- **Power BI** – Interactive Dashboards
- **Streamlit** – Web Application Deployment

---

## 📂 Project Architecture

```text
Raw Dataset
    │
    ▼
MySQL Database
    │
    ▼
SQL Analysis
    │
    ▼
Python EDA
    │
    ▼
Customer Segmentation
    │
    ▼
Machine Learning Models
    │
    ▼
Power BI Dashboard
    │
    ▼
Streamlit Web Application
    │
    ▼
Business Recommendations
```

---

## 📊 Dashboard Pages

### Executive Overview
- Total Customers
- Churn Rate
- Revenue Lost
- Customer Lifetime Value
- Customer Distribution

### Churn Analysis
- Churn by Contract
- Churn by Internet Service
- Churn by Payment Method
- Churn by Customer Segment

### Revenue at Risk
- Revenue Loss Analysis
- High-Risk Customers
- Revenue Segmentation

### Customer Segments
- New Customers
- Regular Customers
- Loyal Customers

### Retention Strategy
- Revenue Lost
- Top Churn Segment
- Highest Revenue Segment
- Highest Risk Contract
- What-If Analysis

---

## 🔍 Exploratory Data Analysis (EDA)

Performed:

- Data Cleaning
- Missing Value Analysis
- Duplicate Detection
- Churn Distribution Analysis
- Numerical Feature Analysis
- Categorical Feature Analysis
- Correlation Analysis
- Revenue Analysis
- Customer Segmentation

### Key Insights

- Month-to-Month customers exhibit the highest churn rate.
- Customers with shorter tenure are more likely to churn.
- Higher monthly charges increase churn probability.
- Electronic Check users show elevated churn.
- Loyal customers have the lowest churn risk.

---

## 🤖 Machine Learning

### Features Used

```python
[
'gender',
'senior_citizen',
'partner',
'dependents',
'tenure',
'contract',
'internet_service',
'payment_method',
'monthly_charges',
'total_charges'
]
```

### Target Variable

```python
churn_flag
```

---

## 📈 Models Trained

### Logistic Regression

- Accuracy: 79.6%
- F1 Score: 58.1%
- ROC-AUC: 0.836

### Random Forest

- Accuracy: 77.0%
- F1 Score: 52.1%
- ROC-AUC: 0.800

### XGBoost

- Accuracy: 79.2%
- F1 Score: 56.3%
- ROC-AUC: 0.837

### Selected Model

✅ Logistic Regression

Reason:

- Highest F1 Score
- Strong ROC-AUC
- Highly Interpretable
- Suitable for Business Decision Making

---

## 🎯 Top Churn Drivers

Feature importance analysis identified the following factors as the strongest contributors to customer churn:

- Contract Type
- Tenure
- Monthly Charges
- Total Charges
- Internet Service
- Payment Method

---

## 📉 Business Impact

This solution enables organizations to:

- Detect customers at risk of leaving
- Reduce customer churn
- Improve customer retention
- Protect recurring revenue
- Prioritize high-value customers
- Increase customer lifetime value (CLV)

---

## 🌐 Streamlit Application

Features:

- Customer Churn Prediction
- Churn Probability Score
- Risk Level Classification
- Model Performance Metrics
- Business Insights
- Interactive User Interface

### Run Locally

```bash
streamlit run app.py
```

---

## 📁 Project Structure

```text
Customer-Churn-Analytics/
│
├── data/
│   └── customer_churn.csv
│
├── notebooks/
│   ├── customer_churn_eda.ipynb
│   ├── churn_model.ipynb
│   ├── logistic_churn_model.pkl
│   ├── scaler.pkl
│   ├── model_features.pkl
│   └── model_info.pkl
│
├── powerbi/
│   └── Customer_Churn_Dashboard.pbix
│
├── app.py
├── requirements.txt
├── README.md
│
└── assets/
```

---

## 📦 Installation

Clone the repository:

```bash
git clone https://github.com/your-username/customer-churn-analytics.git
```

Move into project folder:

```bash
cd customer-churn-analytics
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Run Streamlit app:

```bash
streamlit run app.py
```

---

## 📚 Skills Demonstrated

- SQL Querying
- Database Design
- Data Cleaning
- Exploratory Data Analysis
- Customer Analytics
- Machine Learning
- Predictive Modeling
- Business Intelligence
- Power BI Dashboarding
- Streamlit Deployment
- Business Storytelling

---

## 👨‍💻 Author

**Bimlesh Sah**

Data Analyst | Data Science Enthusiast

### Connect With Me

- LinkedIn: https://linkedin.com/in/bimlesh-sah
- GitHub: https://github.com/sahbimlesh007

---

## ⭐ Project Highlights

✔ End-to-End Analytics Project

✔ Real Business Problem

✔ Predictive Analytics

✔ Revenue Impact Analysis

✔ Interactive Power BI Dashboard

✔ Machine Learning Deployment with Streamlit

✔ Recruiter-Friendly Portfolio Project

---

### © 2026 Bimlesh Sah

Customer Churn & Retention Analytics Project
