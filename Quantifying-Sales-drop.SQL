
1. Quantifying the Sales Drop:


-- This query quantifies the sales drop by calculating the percentage change in cumulative sales volume over a rolling 7-day period. 
-- It helps identify the decline in sales after the initial two weeks of the Sprint scooter launch.

-- Code to calculate sales drop for Sprint scooters --
with cte as (
  select 
    CONVERT(date, sales_transaction_date, 101) as sales_date, 
    COUNT(customer_id) as num_of_sales, 
    sum(COUNT(customer_id)) over (order by CONVERT(date, sales_transaction_date, 101) rows unbounded preceding) as cumul_sales, 
    sum(COUNT(customer_id)) over (order by CONVERT(date, sales_transaction_date, 101) rows between 6 preceding and current row) as current_period_sales, 
    row_number() over(order by CONVERT(date, sales_transaction_date, 101)) as rn1 
  from dbo.sales 
  where product_id = 7 -- Calculating for only the Sprint scooters --
    and CONVERT(date, sales_transaction_date, 101) >= '2016-10-10' -- Limiting the results for the first 3 weeks from launch --
    and CONVERT(date, sales_transaction_date, 101) <= '2016-10-31' 
  group by CONVERT(date, sales_transaction_date, 101)
) 

select 
  t1.sales_date, 
  t1.num_of_sales, 
  t1.cumul_sales, 
  t1.current_period_sales, 
  round(coalesce((t1.current_period_sales - t2.current_period_sales) * 1.0 / t2.current_period_sales, 0) * 100, 2) as growth_percent 
from cte as t1 
left join cte as t2 on t1.rn1 = t2.rn1 + 1;


Finding: The analysis revealed a sales drop of approximately 20% for the Sprint scooter model after the initial two weeks of its launch.

