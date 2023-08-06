3. Email Analysis - Click-through and Open Rates:


-- This query provides insights into the click-through rate (CTR) and open rate for email marketing campaigns related to the Sprint scooter. 
-- It helps understand how well the campaign engages recipients and measures the overall impact and success of the campaign.

-- Code to calculate CTR and open rate for Sprint scooters --
with cte_sent as (
  -- Common Table Expression for total sent emails --
  -- Query same as previous ones --
), 
cte_bounces as (
  -- Common Table Expression for bounced emails --
  -- Query same as previous ones --
), 
cte_opens as (
  -- Common Table Expression for opened emails --
  -- Query same as previous ones --
), 
cte_clicks as (
  -- Common Table Expression for clicked emails --
  -- Query same as previous ones --
) 

select 
  cte_bounces.num_of_bounces, 
  cte_opens.num_of_opens, 
  cte_sent.num_of_sent,
  cte_clicks.num_of_clicks,
  round((cte_opens.num_of_opens * 1.0)/(cte_sent.num_of_sent - cte_bounces.num_of_bounces), 2) as open_rate, 
  round((cte_clicks.num_of_clicks * 1.0)/(cte_sent.num_of_sent - cte_bounces.num_of_bounces), 2) as click_rate 
from cte_sent 
left join cte_opens on cte_opens.date = cte_sent.date 
left join cte_bounces on cte_bounces.date = cte_sent.date 
left join cte_clicks on cte_clicks.date = cte_sent.date;


Finding: The email analysis showed the open rate and click-through rate for the email marketing campaign related to the Sprint scooter, providing insights into its engagement and effectiveness
