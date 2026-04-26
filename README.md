#  Olist 이커머스 고객 이탈 분석

## 프로젝트 개요
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
| 이탈 기준 | 마지막 주문 후 **87일 이상** 주문 없는 고객 |
| 87일 근거 | 재구매 고객의 평균 재구매 간격 (데이터 기반) |
| 분석 기준일 | 2018년 11월 12일 (데이터 마지막 날짜) |
| 제외 대상 | 마지막 주문일이 2018-08-17 이후인 고객 (관찰 중단) |

## 📊 분석 단계
- [x] 1단계: 데이터 탐색 (EDA)
- [x] 2단계: 이탈 고객 정의
- [ ] 3단계: 이탈 고객 추출
- [ ] 4단계: 이탈 고객 특성 분석
- [ ] 5단계: 인사이트 도출

## 📁 폴더 구조
queries/
├── 01_eda.sql
├── 02_churn_definition.sql
├── 03_churn_extraction.sql
├── 04_churn_analysis.sql
└── 05_insight.sql

## 🔍 결과 및 인사이트
추후 업데이트 예정
