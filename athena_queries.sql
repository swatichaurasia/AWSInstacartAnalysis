/*When do people usually order*/

with temp as 
(select count(user_id ) as count_ord,order_hour_of_day from orders group by order_hour_of_day)
select  count_ord, order_hour_of_day from temp  order by count_ord

/*Top Selling Product Departments*/
with ord as (
select pp.product_id,pp.order_id,p.product_name, p.aisle_id,p.department_id,p.department,pp.order_id, o.order_id,o.user_id, pp.add_to_cart_order,pp.reordered from prod_dep  p full join prod_p pp  
on p.product_id = pp.product_id
 full join orders  o on o.order_id = pp.order_id)
select count(product_name) as prod_count,department
from ord group by department   order by prod_count

/*Mostly ordered products*/
with ord as (
select pp.product_id,pp.order_id,p.product_name, p.aisle_id, p.department_id,p.department,
pp.order_id,o.order_id,o.user_id,pp.add_to_cart_order, pp.reordered
from prod_dep  p full join prod_p pp  
on p.product_id = pp.product_id
 full join orders  o on
  o.order_id = pp.order_id)
select product_name,count(*) as count
from ord
group by product_name 
order by count desc

