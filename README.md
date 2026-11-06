# RFM-Customer-Segmentation-Analytics

Executive Summary

Marketing efficiency relies on delivering the right message to the right audience. 
This project implements Recency, Frequency, and Monetary (RFM) segmentation on transactional retail
data to replace blanket marketing promotions with targeted strategies. 
By scoring and categorizing customers into actionable segments, the business
can protect profit margins, boost retention, and maximize campaign ROI.


Key Highlights

•	Data-Driven Targeting: Moves away from "one-size-fits-all" marketing to targeted segments based on transactional behavior.
•	Data Integrity Standards: Rigorously handles edge cases such as cancellations, refunds, missing customer identifiers, and duplicate rows.
•	SQL-First Architecture: Leverages advanced SQL constructs including CTEs, NTILE(), dynamic CASE WHEN scoring, and deep aggregations.
•	Measurable Business Impact: Focuses on bottom-line outcomes like repeat-purchase rate, campaign margin, and retained revenue rather than vanity metrics

Business Problem

A retailer currently sends the exact same promotion to every customer in their database. This generic approach creates two major operational inefficiencies:
1.	Wasted Discount Budget: Sends price cuts to high-intent buyers who would have paid full price anyway.
2.	Lost Revenue Opportunities: Fails to proactively re-engage high-value customers whose activity is declining before they churn completely.
The business requires a clear, data-backed picture of customer lifecycle value and recency to optimize promotional spend and safeguard customer retention.

Methodology

The analysis follows a structured, step-by-step SQL pipeline:
1.	Metric Calculation:
o	Recency ($R$): Days elapsed between the benchmark date and the customer's most recent purchase date.
o	Frequency ($F$): Total count of distinct valid orders placed per customer.
o	Monetary ($M$): Net monetary value spent by the customer.


Skills 

•	SQL Techniques:
o	Common Table Expressions (CTEs) for clean multi-stage queries
o	Window Functions (NTILE()) for quintile scoring
o	Conditional Logic (CASE WHEN) for segment classification
o	Aggregations & Grouping (GROUP BY, SUM, COUNT, MAX, AVG)

