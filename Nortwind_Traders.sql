select * from orders;
SELECT 
    orders.shipperID, shippers.companyName,
    AVG(DATEDIFF(orders.shippedDate, orders.orderDate)) AS AvgNumOfDays
FROM
    orders
        JOIN
    shippers ON orders.shipperID = shippers.shipperID
GROUP BY orders.shipperID, shippers.companyName;

SELECT 
    categories.categoryID,
    categories.categoryName,
    SUM(order_details.unitPrice * order_details.quantity) AS revenue
FROM
    order_details
        JOIN
    products ON products.productID = order_details.productID
        JOIN
    categories ON products.categoryID = categories.categoryID
GROUP BY products.categoryID, categories.categoryName
order by categories.categoryID ASC;

SELECT orders.employeeID, employees.employeeName, 
 COUNT(orders.orderID) AS orders_count FROM orders JOIN employees ON orders.employeeID=employees.employeeID
 GROUP BY employees.employeeID,  employees.employeeName
 Order by employees.employeeID asc;
 
 SELECT 
    orders.employeeID,
    employees.employeeName,
    SUM(order_details.unitPrice * order_details.quantity) AS transactions
FROM
    orders
        JOIN
    order_details ON orders.orderID = order_details.orderID
        JOIN
    employees ON employees.employeeID = orders.employeeID
GROUP BY orders.employeeID , employees.employeeName;

 SELECT 
    QUARTER(orders.orderDate) AS year_quarter,
    SUM(order_details.unitPrice * order_details.quantity) AS revenue
FROM
    orders
        JOIN
    order_details ON orders.orderID = order_details.orderID
WHERE
    YEAR(orderDate) = 2013
GROUP BY year_quarter;

SELECT shippers.companyName, COUNT(orders.customerID) AS customers
 FROM orders JOIN shippers ON shippers.shipperID=orders.shipperID
 GROUP BY orders.shipperID, shippers.companyName;
 
  SELECT employees.employeeName, COUNT(orders.customerID) AS customers_processed_orders_for
 FROM orders JOIN employees ON orders.employeeID=employees.employeeID
 GROUP BY employees.employeeID, employees.employeeName;
 
 SELECT shippers.companyName, SUM(order_details.unitPrice*order_details.quantity) AS revenue_2nd_q
 FROM shippers JOIN orders ON orders.shipperID=shippers.shipperID
 JOIN order_details ON order_details.orderID=orders.orderID
 WHERE QUARTER(orders.orderDate)=2 and year(orders.orderDate)=2014
 GROUP BY shippers.companyName;
 
SELECT YEAR(orders.orderDate) AS yearM, MONTH(orders.orderDate) AS monthM, SUM(order_details.unitPrice*order_details.quantity) AS revenue
 FROM orders JOIN order_details ON orders.orderID=order_details.orderID
 GROUP BY yearM, monthM;