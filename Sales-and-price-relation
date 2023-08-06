Price Analysis for Sales Variations:

-- This query examines the relationship between pricing and sales variations for different scooter models. 
-- It helps identify the impact of pricing on the sales performance of different scooter variants.

-- Code to analyze price variations for different scooter models --
select 
  product_id, 
  model, 
  base_price, 
  COUNT(customer_id) as num_of_sales 
from dbo.sales 
group by product_id, model, base_price
order by product_id;
```

Finding: The price analysis showed that certain scooter models with specific price ranges had higher sales, suggesting price sensitivity among customers.
