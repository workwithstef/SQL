WITH temp_table AS (
  SELECT DISTINCT b.browse_date,
   b.user_id,
   c.user_id IS NOT NULL AS 'is_checkout',
   p.user_id IS NOT NULL AS 'is_purchase'
FROM browse b
LEFT JOIN checkout c
  ON c.user_id = b.user_id
LEFT JOIN purchase p
  ON p.user_id = c.user_id)
)
SELECT *
FROM temp_table;

-- the WITH command gathers a query result and compiles it in a temporary table
-- which you can then execute more queries on


SELECT *
  CASE
  WHEN City = 'London' THEN 'Home' -- if-condition: if row equals "London" then 'new column' row = "HomeTown"
  ELSE 'Away' -- else, 'new column' row equals "Away"
  END AS 'new column' -- name for result column
FROM temp_table
-- CASE can have multiple WHEN-THEN conditions, similar to elif-condition
