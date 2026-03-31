--Create a View for Top Fraud Users
CREATE VIEW TopFraudUsers AS
SELECT User_ID,
       COUNT(*) AS total_orders,
       SUM(Return_Flag) AS total_returns,
       SUM(Fraud_Score) AS total_fraud_score,
       SUM(Return_Value) AS revenue_lost
FROM dbo.ecommerce_returns_synthetic_dat$
GROUP BY User_ID;