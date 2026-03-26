
-- step1: Append all the monthy tables together

CREATE OR REPLACE TABLE `disco-glow-491104-q5.sales.sales2025` AS 
SELECT * FROM `disco-glow-491104-q5.sales.sales202501`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202502`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202503`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202504`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202505`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202506`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202507`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202508`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202509`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202510`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202511`
UNION ALL SELECT * FROM `disco-glow-491104-q5.sales.sales202512`;

-- step2: Calculate recency, frequency, monetary, r, f, m ranks
-- combine views with CTEs

CREATE OR REPLACE VIEW `disco-glow-491104-q5.sales.rfm_metrics`
AS
WITH current_date AS (
  SELECT DATE('2026-03-25') AS analysis_date -- Today's Date
),
rfm AS (
  SELECT
    customerID,
    MAX(OrderDate) AS last_order_date,
    date_diff((SELECT analysis_date FROM current_date), MAX(OrderDate), DAY) AS recency,
    COUNT(*) AS frequency,
    SUM(OrderValue) AS monetary
  FROM `disco-glow-491104-q5.sales.sales2025`
  GROUP BY customerID
)
SELECT
  rfm.*,
  ROW_NUMBER() OVER(ORDER BY recency ASC) AS r_rank,
  ROW_NUMBER() OVER(ORDER BY frequency DESC) AS f_rank,
  ROW_NUMBER() OVER(ORDER BY monetary DESC) AS m_rank
FROM rfm;


-- step3: Assigning Deciles (10 = best, 1 = worst)
CREATE OR REPLACE VIEW `disco-glow-491104-q5.sales.rfm_scores` 
AS
SELECT 
  *
  NTILE(10) OVER(ORDER BY r_rank DESC) AS r_score
FROM `disco-glow-491104-q5.sales.rfm_metrics`





