1. Customer Demographics Analysis:

-- This query analyzes customer demographics for different scooter models. 
-- It helps understand the target audience for each scooter variant and identify potential marketing opportunities.

-- Code to analyze customer demographics for different scooter models --
select 
  product_id, 
  model, 
  gender, 
  age_group, 
  COUNT(customer_id) as num_of_sales 
from dbo.sales 
group by product_id, model, gender, age_group
order by product_id;


Finding: The customer demographics analysis revealed the gender and age group distribution of customers for each scooter model, aiding in targeted marketing strategies.

2. Sales by Region:

```sql
-- This query examines the regional distribution of scooter sales. 
-- It helps identify regions with the highest and lowest sales and assists in optimizing sales and marketing efforts.

-- Code to analyze scooter sales by region --
select 
  region, 
  COUNT(customer_id) as num_of_sales 
from dbo.sales 
group by region
order by num_of_sales desc;
```

Finding: The sales by region analysis highlighted regions with high sales potential, providing insights into geographic market opportunities.
