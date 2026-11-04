-- 3 Average_Order_Value (AOV)
-- What is the Average Order Value (AOV="Total Spend" /"Total Orders" ) across different segments?

WITH Customer_Spend AS (
    SELECT CustomerID,
        SUM(Quantity * UnitPrice) AS Total_Spend,
        COUNT(DISTINCT InvoiceNo) AS Total_Orders
    FROM data
    WHERE Quantity > 0 AND CustomerID IS NOT NULL
    GROUP BY CustomerID
),
Segmented_Customers AS (
    SELECT CustomerID,Total_Spend,Total_Orders,
        CASE 
            WHEN Total_Spend > 5000 THEN 'High Value'
            WHEN Total_Spend BETWEEN 1000 AND 5000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS Customer_Segment
    FROM Customer_Spend
)
SELECT 
    Customer_Segment,
    ROUND(SUM(Total_Spend) / NULLIF(SUM(Total_Orders), 0), 2) AS Average_Order_Value
FROM Segmented_Customers
GROUP BY Customer_Segment;

--  Each customer's Total_Spend and labels them into a group:
-- High Value: Customers who spent more than 1675.79.

-- Medium Value: Customers who spent more than 512.54.

-- Low Value: Everyone else (spent less than 258.3).