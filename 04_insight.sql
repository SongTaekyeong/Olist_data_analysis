-- SELECT
--     PERCENTILE_CONT(payment_value, 0.25) OVER() AS p25,
--     PERCENTILE_CONT(payment_value, 0.50) OVER() AS p50,
--     PERCENTILE_CONT(payment_value, 0.75) OVER() AS p75
-- FROM `olist.olist_order_payments_dataset`
-- LIMIT 1

--
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

select
        COUNT(DISTINCT ch.customer_unique_id) AS target_customer
from churn ch 
 inner join `olist.olist_customers_dataset` c on ch.customer_unique_id = c.customer_unique_id
 inner join `olist.olist_orders_dataset` o on c.customer_id = o.customer_id
 inner join `olist.olist_order_payments_dataset` pd on pd.order_id = o.order_id
where 1=1
    and ch.is_churn = 1
    and payment_value >= 172












