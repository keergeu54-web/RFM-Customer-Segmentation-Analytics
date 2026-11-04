-- 5 Top Revenue Drivers vs. Churn Risks 
-- Which specific customer IDs represent the highest monetary value but have not purchased recently 
-- (e.g., At Risk / Champions who are drifting away)?

SELECT Country,StockCode,
    MAX(Description) AS Product_Description,
    SUM(Quantity) AS Total,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM data
GROUP BY Country, StockCode
ORDER BY Revenue DESC
limit 20;

-- It returns the 20 highest-revenue product and country combinations.
-- it return the total and revenue from highest revenue to lowest revenue		`