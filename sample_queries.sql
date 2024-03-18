-- Retrieve all categories:
SELECT * FROM categories;

--Retrieve all customers:
SELECT * FROM customers;

-- Retrieve all products with their suppliers:
SELECT 
    products.product_id,
    products.product_name,
    products.quantity_per_unit,
    products.unit_price,
    suppliers.company_name AS supplier
FROM products
JOIN suppliers ON products.supplier_id = suppliers.supplier_id;

-- Retrieve orders with customer information:
SELECT 
    orders.order_id,
    orders.order_date,
    customers.company_name AS customer
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

-- Retrieve employee details with their territories:
SELECT 
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    territories.territory_id
FROM employees
LEFT JOIN employee_territories ON employees.employee_id = employee_territories.employee_id
LEFT JOIN territories ON employee_territories.territory_id = territories.territory_id;

-- Retrieve the total sales for each product:
SELECT 
    products.product_id,
    products.product_name,
    SUM(order_details.unit_price * order_details.quantity * (1 - order_details.discount)) AS total_sales
FROM products
JOIN order_details ON products.product_id = order_details.product_id
GROUP BY products.product_id, products.product_name;


-- Retrieve the top 5 customers with the highest total order amounts:
SELECT 
    customers.customer_id,
    customers.company_name,
    SUM(orders.freight) AS total_order_amount
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.company_name
ORDER BY total_order_amount DESC
LIMIT 5;
