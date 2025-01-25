Create Database SQL_CLass_HW_20
Use SQL_CLass_HW_20

--1
CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);
INSERT INTO Salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007);

--1
 select * from orders 

 where salesman_id=(select salesman_id from Salesman where name='Paul Adam')
--2
select * from Orders

where salesman_id=(select salesman_id from Salesman where city='London')

--3

select * from Orders

where salesman_id=(select salesman_id from Orders where customer_id=3007)

--4

select * from Orders
where purch_amt>(select avg(purch_amt) from Orders where ord_date='2012-10-10')

--5
select * from Orders

where salesman_id in (select salesman_id from Salesman where city='New York')

--6
select commission from Salesman
where salesman_id in (select salesman_id from Customer where city='Paris')

--7
select * from Customer
where customer_id = (select salesman_id-2001 from Salesman where name= 'Mc Lyon')

--8

select grade, count(*) from Customer
group by grade
having grade>(select avg(grade) from Customer where city='New York')
--9

SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders WHERE salesman_id IN(SELECT salesman_id FROM salesman WHERE commission = (SELECT MAX(commission) FROM salesman));

--10
SELECT b.*, a.cust_name FROM orders b, customer a WHERE a.customer_id=b.customer_id AND b.ord_date='2012-08-17';

--11

SELECT salesman_id,name FROM salesman a WHERE 1 < (SELECT COUNT(*) FROM customer WHERE salesman_id=a.salesman_id);

--12
SELECT * FROM orders a WHERE purch_amt > (SELECT AVG(purch_amt) FROM orders b WHERE b.customer_id = a.customer_id);

--13

SELECT * FROM orders a WHERE purch_amt >= (SELECT AVG(purch_amt) FROM orders b WHERE b.customer_id = a.customer_id);

--14
SELECT ord_date, SUM (purch_amt) FROM orders a GROUP BY ord_date HAVING SUM (purch_amt) > (SELECT 1000.00 + MAX(purch_amt) FROM orders b WHERE a.ord_date = b.ord_date);

--15
SELECT customer_id,cust_name, city FROM customer WHERE EXISTS
(SELECT * FROM customer WHERE city='London');

--16
SELECT * FROM salesman WHERE salesman_id IN (SELECT DISTINCT salesman_id FROM customer a WHERE EXISTS (SELECT * FROM customer b WHERE b.salesman_id=a.salesman_id AND b.cust_name<>a.cust_name));
--17
SELECT * FROM salesman WHERE salesman_id IN (SELECT DISTINCT salesman_id FROM customer a WHERE NOT EXISTS (SELECT * FROM customer b WHERE a.salesman_id=b.salesman_id AND a.cust_name<>b.cust_name));
--18
SELECT * FROM salesman a WHERE EXISTS (SELECT * FROM customer b WHERE a.salesman_id=b.salesman_id AND 1< (SELECT COUNT (*) FROM orders WHERE orders.customer_id = b.customer_id));
--19
SELECT * FROM salesman WHERE city=ANY (SELECT city FROM customer);
--20
SELECT * FROM salesman WHERE city IN (SELECT city FROM customer);
--21
SELECT * FROM salesman a WHERE EXISTS (SELECT * FROM CUSTOMER b WHERE  a.name  < b.cust_name);
--22
SELECT * FROM customer WHERE grade > ANY (SELECT grade FROM CUSTOMER WHERE  city < 'New York');
--23
SELECT * FROM Orders WHERE purch_amt > ANY (SELECT purch_amt FROM orders WHERE  ord_date='2012/09/10');
--24
SELECT * FROM orders WHERE purch_amt < ANY (SELECT purch_amt FROM orders a, customer b WHERE  a.customer_id=b.customer_id AND b.city='London');
--25
SELECT * FROM orders WHERE purch_amt < (SELECT MAX (purch_amt) FROM orders a, customer b WHERE  a.customer_id=b.customer_id AND b.city='London');
--26
SELECT * FROM customer WHERE grade > ALL (SELECT grade FROM customer WHERE city='New York');
--27
SELECT salesman.name, salesman.city, subquery1.total_amt FROM 
salesman, (SELECT salesman_id, SUM(orders.purch_amt) AS total_amt 
FROM orders GROUP BY salesman_id) subquery1 WHERE subquery1.salesman_id = salesman.salesman_id AND
salesman.city IN (SELECT DISTINCT city FROM customer);
---28
SELECT * FROM customer WHERE grade<> ANY (SELECT grade FROM customer WHERE city='London');
--29
SELECT * FROM customer WHERE grade NOT IN (SELECT grade FROM customer WHERE city='Paris');
--30
SELECT *
FROM customer 
WHERE NOT grade = ANY
   (SELECT grade
	FROM customer
	WHERE city='Dallas');
--31
CREATE TABLE company_mast (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

INSERT INTO company_mast (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);


CREATE TABLE item_mast (
    ITEM_ID INT PRIMARY KEY,
    ITEM_NAME VARCHAR(100),
    ITEM_PRICE DECIMAL(10, 2),
    ITEM_CATEGORY VARCHAR(50)
);

-- Sample data insertion for item_mast (you can modify or expand as per your requirements)
INSERT INTO item_mast (ITEM_ID, ITEM_NAME, ITEM_PRICE, ITEM_CATEGORY) VALUES
(101, 'Laptop', 999.99, 'Electronics'),
(102, 'Smartphone', 799.99, 'Electronics'),
(103, 'Desk Chair', 129.50, 'Furniture'),
(104, 'Headphones', 149.99, 'Electronics'),
(105, 'Coffee Mug', 19.99, 'Kitchenware');


SELECT AVG(pro_price) AS "Average Price", 
   company_mast.com_name AS "Company"
      FROM item_mast, company_mast
         WHERE item_mast.pro_com= company_mast.com_id
           GROUP BY company_mast.com_name
   HAVING AVG(pro_price) >= 350;

--33
SELECT P.pro_name AS "Product Name", 
       P.pro_price AS "Price", 
       C.com_name AS "Company"
   FROM item_mast P, company_mast C
   WHERE P.pro_com = C.com_id
     AND P.pro_price =
     (
       SELECT MAX(P.pro_price)
         FROM item_mast P
         WHERE P.pro_com = C.com_id
     );
--34
SELECT * 
  FROM emp_details
   WHERE emp_lname IN ('Gabriel' , 'Dosio');
   --35
   SELECT emp_fname, emp_lname 
 FROM emp_details
  WHERE emp_dept IN
  (SELECT dpt_code 
     FROM emp_department 
       WHERE dpt_allotment > 50000);
--36

SELECT *
  FROM emp_department
  WHERE dpt_allotment >
  (
    SELECT AVG(dpt_allotment)
    FROM emp_department
  );

  --37
  SELECT *
  FROM emp_department
  WHERE dpt_allotment >
  (
    SELECT AVG(dpt_allotment)
    FROM emp_department
  );

--38
SELECT dpt_name FROM emp_department
  WHERE dpt_code IN
  (
    SELECT emp_dept
      FROM emp_details
      GROUP BY emp_dept
      HAVING COUNT(*) >2
  );
--39
SELECT emp_fname, emp_lname 
FROM emp_details 
WHERE emp_dept IN (
  SELECT dpt_code
  FROM emp_department 
  WHERE dpt_allotment= (
    SELECT MIN(dpt_allotment)
    FROM emp_department 
    WHERE dpt_allotment >
 (SELECT MIN(dpt_allotment) 
      FROM emp_department )));