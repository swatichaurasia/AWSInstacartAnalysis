**When do people usually order**
with temp as 
(select count(user_id ) as count_ord,order_hour_of_day from orders group by order_hour_of_day)
select  count_ord, order_hour_of_day from temp  order by count_ord
