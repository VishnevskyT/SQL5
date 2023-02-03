USE ShopDB;				-- Завдання 6: Используя вложенные запросы и ShopDB получить имена покупателей и имена сотрудников у которых TotalPrice товара больше 1000


SELECT * FROM Employees;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Customers;


SELECT
(SELECT FName FROM Customers WHERE CustomerNo = (SELECT CustomerNo FROM Orders
																	WHERE Orders.OrderID = OrderDetails.OrderID)) AS Customer_FName,
(SELECT LName FROM Customers WHERE Customers.CustomerNo = (SELECT CustomerNo FROM Orders
																	WHERE Orders.OrderID = OrderDetails.OrderID)) AS Customer_LName,
(SELECT MName FROM Customers WHERE Customers.CustomerNo = (SELECT CustomerNo FROM Orders
																	WHERE Orders.OrderID = OrderDetails.OrderID)) AS Customer_MName,
(SELECT FName FROM Employees WHERE Employees.EmployeeID = (SELECT EmployeeID FROM Orders
																	WHERE Orders.OrderID = OrderDetails.OrderID)) AS Employee_FName,
(SELECT LName FROM Employees WHERE Employees.EmployeeID = (SELECT EmployeeID FROM Orders
																	WHERE Orders.OrderID = OrderDetails.OrderID)) AS Employee_LName,
(SELECT MName FROM Employees WHERE Employees.EmployeeID = (SELECT EmployeeID FROM Orders
																	WHERE Orders.OrderID = OrderDetails.OrderID)) AS Employee_MName,
SUM(TotalPrice) AS TOTAL_PRICE
FROM OrderDetails
GROUP BY 
        Customer_FName,
		Customer_LName,
		Customer_MName,
        Employee_FName,
		Employee_LName,
		Employee_MName
    HAVING SUM(TotalPrice) > 1000;


-- перевірка на валідність вибірки

SELECT Customers.FName, Customers.LName, Customers.MName, Employees.FName, Employees.LName, Employees.MName FROM Customers
	JOIN Orders
	ON Customers.CustomerNo = Orders.CustomerNo
	JOIN Employees
	ON Employees.EmployeeID = Orders.EmployeeID
	JOIN OrderDetails
	ON Orders.OrderID = OrderDetails.OrderID
	GROUP BY 
        Customers.FName,
		Customers.LName,
		Customers.MName,
        Employees.FName,
		Employees.LName,
		Employees.MName
    HAVING SUM(TotalPrice) > 1000;
