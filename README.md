# 🚀 Data Warehouse Analytics Project with SQL Server

This project is a **complete end-to-end sql server reporting system** built for advanced **sales analytics, customer intelligence, and product performance insights**. It's structured to power BI dashboards, drive business decisions, and impress any data-driven stakeholder. 💡

---

## 📊 What's Inside?

### 1. **Change Over Time Analysis**  
Tracks trends, growth, and seasonality using time-series breakdowns.

- 🔄 Monthly & yearly aggregations
- 📈 Sales, customers, quantity trends
- 🧠 Uses `YEAR()`, `MONTH()`, `DATETRUNC()`, `FORMAT()`

### 2. **Cumulative Analysis**  
Understand long-term trends via running totals & moving averages.

- 📊 Running sales total & moving average price
- 🚀 Uses window functions: `SUM() OVER()`, `AVG() OVER()`

### 3. **Performance Analysis (YoY, MoM)**  
Compare sales to last year and product average to spot rising/falling stars.

- 📉 Year-over-Year growth tracking
- 💥 Above/Below average categorization
- ⚙️ Uses `LAG()`, `AVG() OVER()`, and `CASE`

### 4. **Data Segmentation**  
Classify products and customers into meaningful business categories.

- 🏷️ Product pricing tiers (`Below 100`, `100-500`, `500-1000`, `Above 1000`)
- 👤 Customer personas: `VIP`, `Regular`, `New` based on lifespan & spend

### 5. **Part-to-Whole Analysis**  
How much do product categories contribute to total revenue?

- 🧩 Category-wise % share of overall sales
- 📐 Uses `SUM() OVER()` + percentage logic

### 6. **📋 Customer Report View**
`gold.report_customers`  
A consolidated customer intelligence report view:

- 🎯 Age groups, order counts, total sales & recency
- 🎓 KPIs: `avg_order_value`, `avg_monthly_spend`, `lifespan`
- 🧠 Segmented: `VIP`, `Regular`, `New` based on activity

### 7. **📦 Product Report View**
`gold.report_products`  
Complete product lifecycle & performance analytics:

- 📦 Product lifespan, sales, revenue, quantity, customers
- 🔥 Segmented: `High Performer`, `Mid Range`, `Low Performer`
- 💡 KPIs: `avg_selling_price`, `avg_order_revenue`, `avg_monthly_revenue`

---

## 💾 Database Schema (Used)

- **gold.fact_sales**  
- **gold.dim_customers**  
- **gold.dim_products**  

---

## 🛠️ Tools & Concepts Used

- **SQL Server**
- **T-SQL Advanced Queries**
- **Window Functions (`OVER()`)**
- **Aggregations**
- **Date Functions (`DATETRUNC()`, `DATEDIFF()`, `FORMAT()`)**
- **Conditional Logic (`CASE`)**
- **Data Segmentation & KPIs**
- **Views for reporting layers**

---

## 💼 Business Use Cases

This project simulates a **real-life business dashboard backend**, applicable for:

- 📊 Power BI or Tableau integrations
- 🔍 Monthly reporting & trend forecasting
- 🎯 Marketing segmentation & strategy
- 🧠 Executive dashboards & strategic insights

---

**⭐ If you found this helpful, consider starring this repo!**  
