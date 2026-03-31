ALTER TABLE dbo.ecommerce_returns_synthetic_dat$
ADD Return_Value DECIMAL(10,2);  -- create the column

UPDATE dbo.ecommerce_returns_synthetic_dat$
SET Return_Value = Product_Price * Order_Quantity * Return_Flag;

