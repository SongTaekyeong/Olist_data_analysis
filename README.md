# 🛒 Olist 이커머스 고객 이탈 분석

## 📌 프로젝트 개요
브라질 이커머스 플랫폼 Olist 데이터를 활용하여
고객 이탈 패턴을 분석하고 인사이트를 도출하는 프로젝트입니다.

- **분석 환경:** Google BigQuery
- **데이터 출처:** [Kaggle - Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **분석 기간:** 2016년 ~ 2018년

## 📂 데이터셋
| 테이블 | 설명 |
|--------|------|
| olist_customers_dataset | 고객 정보 |
| olist_orders_dataset | 주문 정보 |
| olist_order_items_dataset | 주문 상품 정보 |
| olist_order_payments_dataset | 결제 정보 |
| olist_products_dataset | 상품 정보 |
| olist_sellers_dataset | 판매자 정보 |

> **Key Discovery:** customer_id는 주문마다 새로 부여되는 ID이며,
> 실제 고객 식별은 customer_unique_id를 사용해야 함

## 🎯 이탈 고객 정의
| 항목 | 내용 |
|------|------|
| 이탈 기준 | 재구매 이력이 없는 고객 |
| 비이탈 기준 | 재구매 이력이 있는 고객 |
| 근거 | 재구매 고객의 평균 재구매 간격이 87일로, 이 기간이 지나도 재구매가 없는 고객은 사실상 이탈로 판단 |
| 분석 대상 | delivered 상태의 주문 고객 |

## 📊 이탈 분석 결과
| 구분 | 인원 | 비율 |
|------|------|------|
| 이탈(1) | 90,557명 | 약 97% |
| 비이탈(0) | 2,801명 | 약 3% |
| 전체 | 93,358명 | 100% |

## 📈 분석 단계
- [x] 1단계: 데이터 탐색 (EDA)
- [x] 2단계: 이탈 고객 정의 및 추출
- [ ] 3단계: 이탈 고객 특성 분석
- [ ] 4단계: 인사이트 도출

## 🔍 결과 및 인사이트
추후 업데이트 예정
