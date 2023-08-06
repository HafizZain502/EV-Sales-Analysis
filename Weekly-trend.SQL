Weekly Sales Trend Analysis:


-- This query analyzes the weekly sales trend for Sprint scooters over a specific time period. 
-- It helps identify any weekly patterns in sales to understand customer preferences and behavior.

-- Code to analyze weekly sales trend for Sprint scooters --
select 
  DATEPART(year, sales_transaction_date) as sales_year, 
  DATEPART(week, sales_transaction_date) as sales_week, 
  COUNT(customer_id) as num_of_sales 
from dbo.sales 
where product_id = 7 -- Calculating for only the Sprint scooters --
group by DATEPART(year, sales_transaction_date), DATEPART(week, sales_transaction_date)
order by sales_year, sales_week;


Finding: The weekly sales trend analysis revealed fluctuations in Sprint scooter sales over different weeks, suggesting potential customer behavior patterns.
