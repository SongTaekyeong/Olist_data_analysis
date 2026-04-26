-- 이탈고객 재구매 여부 구하기

with churn as(select
       customer_unique_id,
       count(distinct o.order_id) as order_count,
       case when count(distinct o.order_id) >= 2 then 0 else 1 end as is_churn
from `olist.olist_orders_dataset` o
  inner join `olist.olist_customers_dataset` c on o.customer_id = c.customer_id
where 1=1
       and o.order_status = 'delivered'
group by 1
)
select is_churn, count(*)
from churn
group by 1