/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */

WITH yearly_sales AS (
	SELECT
		YEAR(f.order_date) as order_year,
		p.product_name,
		SUM(f.sales_amount) as curr_sales
	FROM gold.fact_sales AS f
	LEFT JOIN gold.dim_products as p
	ON f.product_key = p.product_key
	WHERE order_date IS NOT NULL
	GROUP BY YEAR(f.order_date), p.product_name
)
SELECT 
	order_year,
	product_name,
	curr_sales,
	AVG(curr_sales) OVER(PARTITION BY product_name) AS avg_sales,
	(curr_sales - AVG(curr_sales) OVER(PARTITION BY product_name)) AS diff_avg,
	CASE 
		WHEN (curr_sales - AVG(curr_sales) OVER(PARTITION BY product_name)) > 0 THEN 'Above Average'
		WHEN (curr_sales - AVG(curr_sales) OVER(PARTITION BY product_name)) < 0 THEN 'Below Average'
		ELSE 'Average'
	END AS avg_change,
	-- Year over Year Analysis
	LAG(curr_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS prev_year_sales,
	(curr_sales - LAG(curr_sales) OVER(PARTITION BY product_name ORDER BY order_year)) AS diff_prev_year,
	CASE 
		WHEN (curr_sales - LAG(curr_sales) OVER(PARTITION BY product_name ORDER BY order_year)) > 0 THEN 'Increase'
		WHEN (curr_sales - LAG(curr_sales) OVER(PARTITION BY product_name ORDER BY order_year)) < 0 THEN 'Decrease'
		ELSE 'Nothing Change'
	END AS avg_change
FROM yearly_sales
ORDER BY product_name, order_year;
