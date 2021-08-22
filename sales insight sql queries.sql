/* Shows full transactions table*/

SELECT * FROM sales.transactions;


/*Different type of currencies used in transactions*/

SELECT DISTINCT(sales.transactions.currency) FROM sales.transactions;


/* Transactions where USD was used*/
 
SELECT * FROM sales.transactions
WHERE sales.transactions.currency = 'USD';


/* Transactions where USD was used and sales_amount is converted to INR */

SELECT *,
CASE
    WHEN sales.transactions.currency = 'USD' THEN sales.transactions.sales_amount*75
    ELSE sales.transactions.sales_amount*1
END AS normalised_sales_amount
FROM sales.transactions
WHERE sales.transactions.currency = 'USD' ;


/* Total revenue from Mumbai */

SELECT  SUM(sales.transactions.sales_amount) FROM sales.transactions
WHERE sales.transactions.market_code = 'Mark002'  ;

/* Total revenue in Year 2020 */

SELECT  SUM(trs.sales_amount) AS total_revenue 
FROM sales.transactions trs
INNER JOIN sales.date dt
ON trs.order_date = dt.date
WHERE dt.year = 2020;

/* Total sales in Mumbai */

SELECT SUM(sales.transactions.sales_qty) FROM sales.transactions
WHERE sales.transactions.market_code = 'Mark002';


/* Total sales in year 2019 */

SELECT  SUM(trs.sales_qty) AS total_sales
FROM sales.transactions trs
INNER JOIN sales.date dt
ON trs.order_date = dt.date
WHERE dt.year = 2019;
