
-- 이탈 고객 특성 분석


-- 1. 결제금액 분석
-- 이탈 고객 평균 결제금액($159) > 비이탈 고객($143)
-- 이탈 고객이 한 번에 더 많은 금액을 지출하는 경향이 있음
-- 고가 상품 구매 후 재구매로 이어지지 않는 패턴 확인
-- 고액 결제 이탈 고객을 우선 쿠폰 타겟으로 선정 필요
with churn as(select
       customer_unique_id,
       count(distinct o.order_id) as order_count,
       case when count(distinct o.order_id) >= 2 then 0 else 1 end as is_churn
from `olist.olist_orders_dataset` o
  inner join `olist.olist_customers_dataset` c on o.customer_id = c.customer_id
where 1=1
       and o.order_status = 'delivered'
group by 1
),

payment_info as(
select 
       c.customer_unique_id,
       avg(p.payment_value) as avg_payment
from `olist.olist_order_payments_dataset` p
 inner join `olist.olist_orders_dataset` o on p.order_id = o.order_id
 inner join `olist.olist_customers_dataset` c on o.customer_id = c.customer_id
group by 1
)             
select 
       is_churn,
       avg(avg_payment) as avg_pay
from churn c
 inner join payment_info pi on pi.customer_unique_id = c.customer_unique_id 
group by 1


-- 2. 구매 카테고리 분석
-- 뷰티/건강 카테고리 이탈 고객
-- = 소모품 재구매 필요 + 경쟁사 이탈 가능성 높음
-- = 우선 쿠폰 타겟!
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
       ch.is_churn,
       p.product_category_name,
       count(*)
from churn ch
 inner join `olist.olist_customers_dataset` c on c.customer_unique_id = ch.customer_unique_id
 inner join `olist.olist_orders_dataset` o on c.customer_id = o.customer_id
 inner join `olist.olist_order_items_dataset` oi on o.order_id = oi.order_id
 inner join `olist.olist_products_dataset` p on oi.product_id = p.product_id
group by 1,2
order by 1,3 desc


-- 3.지역별 이탈 분석
-- AP 지역은 전체 고객 수가 67명으로 샘플이 너무 적어 통계적으로 신뢰하기 어려움
-- 최소 100명 이상인 지역 기준으로 CE, RN, MA 순으로 이탈률이 높게 나타남
-- 세 지역 모두 브라질 북동부로, 배송 인프라 부족과 연관 가능성 있음
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
       c.customer_state,
       count(*) as total,
       sum(is_churn) as churn_count,
       round(sum(is_churn) / count(*) * 100 , 2) as chrun_rate
from churn ch
 inner join `olist.olist_customers_dataset` c on ch.customer_unique_id = c.customer_unique_id
group by 1
order by chrun_rate desc

