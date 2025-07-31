# Customer-Segmentation
SQL project for customer segmentation and business analysis using the Brazilian E-commerce Dataset . Includes insights on revenue, reviews, delivery, and customer behavior.


# Customer Segmentation Using SQL – Brazilian E-commerce Dataset

This project uses **SQL** to explore, segment, and analyze customer behavior using the
[Brazilian E-commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
The goal is to generate actionable insights by segmenting customers based on demographics, purchasing behavior, and delivery metrics.

---

## Project Objective

The aim of this project is to:
- Segment customers based on purchase history and geographic data
- Identify high-value customers and markets
- Analyze delivery efficiency and customer satisfaction
- Help e-commerce businesses make data-driven marketing decisions

---

##  Dataset Source

 **Source**: <a href='https://github.com/venkteshwari/Customer-Segmentation/tree/main/CustomerDataset' >Download</a>  
 **Files Used**:  
- `customers_dataset.csv`
- `orders_dataset.csv`
- `order_items_dataset.csv`
- `products_dataset.csv`
- `order_payments_dataset.csv`
- `order_reviews_dataset.csv`
- `sellers_dataset.csv`
- `geolocation_dataset.csv`
- `product_category_name_translation.csv`

Imported as relational tables in SQL under the database: `EcommerceCustomerDataset`.

---

##  SQL Tasks & Analysis

| #  | Task Description |
|----|------------------|
| 1  | Monthly order trend analysis |
| 2  | Top 5 selling product categories |
| 3  | Revenue by payment method |
| 4  | Unique customers by state |
| 5  | Top 10 cities by revenue |
| 6  | Revenue and item count per order |
| 7  | Average product weight by category |
| 8  | Most common review scores |
| 9  | Top 5 sellers by revenue |
| 10 | Average review score by state |
| 11 | Average delivery time (days) |
| 12 | Number of late deliveries |

Each query uses SQL operations like:
- `JOIN`
- `GROUP BY`
- `AGGREGATE FUNCTIONS (SUM, AVG, COUNT)`
- `DATE FUNCTIONS`
- `FILTERING and ORDERING`

---


GROUP BY payment_type;

