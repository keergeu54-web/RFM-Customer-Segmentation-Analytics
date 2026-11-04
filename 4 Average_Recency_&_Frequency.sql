-- 4 Average_Recency_&_Frequency 

-- What is the average days since last purchase and average number of orders for each segment?
WITH customer_metrics AS (
    SELECT CustomerID,
        DATEDIFF(
            (SELECT MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'))
             FROM data),
            MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'))
        ) AS recency_days,
        COUNT(DISTINCT InvoiceNo) AS frequency
    FROM data
    WHERE CustomerID IS NOT NULL
      AND InvoiceNo NOT LIKE 'C%'
      AND Quantity > 0
      AND UnitPrice > 0
    GROUP BY CustomerID
),

customer_segments AS (
    SELECT CustomerID,recency_days,frequency,
        CASE
            WHEN recency_days <= 30 AND frequency >= 10 THEN 'Champions'
            WHEN recency_days <= 60 AND frequency >= 5 THEN 'Loyal Customers'
            WHEN recency_days > 90 AND frequency >= 3 THEN 'At Risk'
            WHEN frequency = 1 THEN 'One-Time Customers'
            ELSE 'Regular Customers'
        END AS segment
    FROM customer_metrics
)

SELECT
    segment,
    ROUND(AVG(recency_days), 2) AS avg_recency_days,
    ROUND(AVG(frequency), 2) AS avg_orders
FROM customer_segments
GROUP BY segment
ORDER BY avg_recency_days;

-- The retailer can reward loyal customers, encourage repeat purchases from one-time 
-- customers, and re-engage customers who have not purchased recently.