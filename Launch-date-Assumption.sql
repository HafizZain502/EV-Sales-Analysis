2. Launch Date Assumption:


-- This query compares the growth percentage of the Sprint scooter with the growth rate of the Sprint Limited Edition scooter launched on a different production start date. 
-- It helps validate the assumption that the launch date might have impacted sales.

-- Code to compare sales growth with other scooter models --
with cte as (
  -- Common Table Expression for Sprint scooter sales growth --
  -- Query same as previous one --
), 
cte_limited as (
  -- Common Table Expression for Sprint Limited Edition scooter sales growth --
  -- Query similar to previous one, but for product_id = 8 (Sprint Limited Edition scooters) --
)

select 
  cte.sales_date, 
  cte.growth_percent as sprint_growth_percent, 
  cte_limited.growth_percent as limited_edition_growth_percent
from cte 
left join cte_limited on cte.sales_date = cte_limited.sales_date;


Finding: By comparing the sales growth of the Sprint scooter with the Sprint Limited Edition scooter, we validated that launching the Sprint model in the second half of the year might have impacted its sales.

