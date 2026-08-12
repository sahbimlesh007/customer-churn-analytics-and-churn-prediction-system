CREATE TABLE customer_churn (
    customer_id VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(20),
    senior_citizen BOOLEAN,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure INT,
    phone_service VARCHAR(20),
    multiple_lines VARCHAR(50),
    internet_service VARCHAR(50),
    online_security VARCHAR(50),
    online_backup VARCHAR(50),
    device_protection VARCHAR(50),
    tech_support VARCHAR(50),
    streaming_tv VARCHAR(50),
    streaming_movies VARCHAR(50),
    contract VARCHAR(50),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(100),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(12,2),
    churn VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customer_churn
SELECT
customerID,
gender,
SeniorCitizen,
Partner,
Dependents,
tenure,
PhoneService,
MultipleLines,
InternetService,
OnlineSecurity,
OnlineBackup,
DeviceProtection,
TechSupport,
StreamingTV,
StreamingMovies,
Contract,
PaperlessBilling,
PaymentMethod,
MonthlyCharges,
NULLIF(TRIM(TotalCharges),''),
Churn,
CURRENT_TIMESTAMP
FROM stg_customer_churn;


select * from customer_churn;
select count(*) from customer_churn;

select sum(customer_id is null) as customer_null,
sum(monthly_charges is null) as monthly_null,
sum(total_charges is null) as total_null from customer_churn;

select total_charges from customer_churn where total_charges is null;

delete from customer_churn where total_charges is null;

select total_charges from customer_churn where total_charges is null;

select customer_id, count(*) from customer_churn group by customer_id having count(*) > 1;

select distinct churn from customer_churn;