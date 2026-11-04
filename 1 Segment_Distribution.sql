-- 1 Segment_Distribution
-- What is the total count and percentage share of customers in each segment?
WITH Segment AS (
    SELECT 
        CustomerID,
        COUNT(DISTINCT CustomerID) AS Customer
    FROM data
    GROUP BY CustomerID
)
SELECT 
    customerID,
    Customer,
    ROUND(100.0 * Customer / SUM(Customer) OVER(), 2) AS Percentage_Share
FROM Segment
GROUP BY customerID
ORDER BY Customer DESC;
-- Helps the retailer identify its largest customer groups, allocate marketing 
-- resources, and decide which segments need retention or re-engagement campaigns.