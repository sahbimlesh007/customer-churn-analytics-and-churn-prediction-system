CREATE VIEW vw_customer_overview AS
    SELECT 
        COUNT(*) AS total_customers,
        ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge,
        ROUND(AVG(tenure), 2) AS avg_tenure
    FROM
        customer_churn;
        
        
CREATE VIEW vw_churn_summary AS
    SELECT 
        COUNT(*) as total_customers,
        SUM(CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END) as churned_customers,
        ROUND(100 * SUM(CASE
                    WHEN churn = 'Yes' THEN 1
                    ELSE 0
                END) / COUNT(*),
                2) as  churn_rate
    FROM
        customer_churn;



CREATE VIEW vw_revenue_lost AS
    SELECT 
        SUM(monthly_charges) AS revenue_lost
    FROM
        customer_churn
    WHERE
        churn = 'Yes';
        
CREATE VIEW vw_contract_analysis AS
    SELECT 
        contract,
        COUNT(*) total_customers,
        SUM(CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END) churned_customers
    FROM
        customer_churn
    GROUP BY contract;

CREATE VIEW vw_internet_analysis AS
    SELECT 
        internet_service,
        COUNT(*) customers,
        SUM(CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END) churned
    FROM
        customer_churn
    GROUP BY internet_service;
    
    
    

CREATE VIEW vw_payment_analysis AS
    SELECT 
        payment_method,
        COUNT(*) customers,
        SUM(CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END) churned
    FROM
        customer_churn
    GROUP BY payment_method;    
    
    
CREATE VIEW vw_customer_segments AS
    SELECT 
        customer_id,
        CASE
            WHEN tenure <= 12 THEN 'New'
            WHEN tenure <= 48 THEN 'Regular'
            ELSE 'Loyal'
        END customer_segment,
        monthly_charges,
        churn
    FROM
        customer_churn;    
    
    
CREATE VIEW vw_revenue_segments AS
    SELECT 
        customer_id,
        CASE
            WHEN monthly_charges < 35 THEN 'Low Revenue'
            WHEN monthly_charges < 70 THEN 'Medium Revenue'
            ELSE 'High Revenue'
        END revenue_segment,
        monthly_charges,
        churn
    FROM
        customer_churn;   
    
-- This is the view Power BI should connect to in order to perform analytics

CREATE VIEW vw_dashboard_fact AS
    SELECT 
        customer_id,
        gender,
        senior_citizen,
        partner,
        dependents,
        tenure,
        contract,
        internet_service,
        payment_method,
        monthly_charges,
        total_charges,
        churn,
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END churn_flag
    FROM
        customer_churn;
    
CREATE VIEW vw_high_risk_revenue AS
    SELECT 
        contract,
        SUM(monthly_charges) monthly_revenue,
        COUNT(*) customers
    FROM
        customer_churn
    WHERE
        churn = 'Yes'
    GROUP BY contract;
    
    
    
    
    
CREATE VIEW vw_customer_ltv AS
    SELECT 
        customer_id,
        monthly_charges,
        tenure,
        monthly_charges * tenure AS estimated_ltv
    FROM
        customer_churn;    
    

