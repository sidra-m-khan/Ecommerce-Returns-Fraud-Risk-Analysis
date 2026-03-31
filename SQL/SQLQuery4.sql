-- Top Fraud Users – Identify Repeat Returners

-- Goal: Find users who return items frequently or have high fraud scores.

SELECT User_ID,
       COUNT(*) AS total_orders,
       SUM(Return_Flag) AS total_returns,
       SUM(Fraud_Score) AS total_fraud_score
FROM dbo.ecommerce_returns_synthetic_dat$
GROUP BY User_ID
ORDER BY total_fraud_score DESC;

-- Revenue Loss from Returns

-- Goal: Show how much revenue is lost due to returns.

SELECT SUM(Return_Value) AS total_revenue_lost
FROM dbo.ecommerce_returns_synthetic_dat$;

--Risk Category Summary

--Goal: See how many users fall into High, Medium, Low fraud risk.

SELECT Risk_Category, COUNT(*) AS num_users
FROM dbo.ecommerce_returns_synthetic_dat$
GROUP BY Risk_Category;

--Cohort Analysis: Returns by Days_to_Return

--Goal: Detect suspicious early returns, e.g., items returned in 1–3 days.

SELECT Days_to_Return, 
       COUNT(*) AS return_count, 
       SUM(Return_Value) AS revenue_lost
FROM dbo.ecommerce_returns_synthetic_dat$
WHERE Return_Flag = 1
GROUP BY Days_to_Return
ORDER BY Days_to_Return;