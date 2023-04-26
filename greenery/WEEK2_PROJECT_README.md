User Repeat Rate
Ans: 80%

select count(distinct case when num_orders >= 2 then user_id else null end) / count(distinct user_id)
from ...