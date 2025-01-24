create database SQL_Class_Hw22
Use SQL_Class_Hw22

CREATE TABLE MyNumbers (
    num INT
);

-- Insert the data into the MyNumbers table
INSERT INTO MyNumbers (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

select * from MyNumbers

;with cte as
(select *, count(num) as c from MyNumbers
group by num
having count(num)=1)

select top 1 num from cte
order by num desc

----------------------------------------

CREATE TABLE Seat (
    id INT ,
    student VARCHAR(50)
);

INSERT INTO Seat (id, student) VALUES (1, 'Abbot');
INSERT INTO Seat (id, student) VALUES (2, 'Doris');
INSERT INTO Seat (id, student) VALUES (3, 'Emerson');
INSERT INTO Seat (id, student) VALUES (4, 'Green');
INSERT INTO Seat (id, student) VALUES (5, 'Jeames');


select * from Seat

/*student 
  Dorris
  Abbot
  Green
  Emerson
  Jeames
*/

select case 
             when id%2=1 then coalesce(lead(student) over (order by id), student )
			 else coalesce(lag(student) over (order by id), student)
			 end as result
			 from Seat 

--------------------------------------------------------------------------------

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    managerId INT
);

-- Insert the data into the Employee table
INSERT INTO Employees (id, name, salary, managerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);


select * from Employees


--find employees who earn more than their managers

select * from Employees as Employees
join Employees as Managers
on Employees.managerId=Managers.id 
where Employees.salary>Managers.salary
			
-----------------------------------------------

CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(50)
);
INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'Headphone');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-01', 'Pencil');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'Basketball');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-01', 'Bible');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'T-Shirt');


select sell_date,   STRING_AGG( convert(Nvarchar(max),  product), ', ') as Products FROM Activities

group by sell_date



--Find the date, number of products produced per date and the name of those items

/* sell_date					Products
	2020-05-30					 Basketball, Headphone, T-Shirt
	2020-06-01					Bible, Pencil
	2020-06-02					Mask
*/

/* string_agg */

--------------------------------------------------------
CREATE TABLE Orders (
    order_number INT PRIMARY KEY,
    customer_number INT
);

-- Insert the data into the Orders table
INSERT INTO Orders (order_number, customer_number) VALUES
(5, 1),
(2, 2),
(3, 3),
(4, 3);

--Eng kop order qilgan customerni topish

select customer_number, order_number from Orders


/* customer_number
		3
*/
SELECT top 1 customer_number, COUNT(order_number) AS order_count
FROM Orders
GROUP BY customer_number
ORDER BY order_count DESC


----------------------------------------

CREATE TABLE Employees (
    emp_id INT,
    event_day DATE,
    in_time INT,
    out_time INT
);

-- Insert the data into the Employees table
INSERT INTO Employees (emp_id, event_day, in_time, out_time) VALUES
(1, '2020-11-28', 4, 32),
(1, '2020-11-28', 55, 200),
(1, '2020-12-03', 1, 42),
(2, '2020-11-28', 3, 33),
(2, '2020-12-09', 47, 74);

select event_day, emp_id, sum(out_time-in_time) as Total_Time from Employees
group by  emp_id, event_day
order by emp_id, event_day


--Har bir employee bir kunda necci vaqt officeda bolganligini hisoblash kerak

/* event_day		emp_ID		Total_time
	2020-11-28		1				173
	2020-12-03		1				41
	2020-11-28		2				30
	2020-12-09		2				27
*/
--------------------------------------------------------

-- Create the Product table
CREATE TABLE Product (
    product_key INT 
);

-- Insert the data into the Product table
INSERT INTO Product (product_key) VALUES
(5),
(6);

-- Create the Customer table
CREATE TABLE Customer (
    customer_id INT,
    product_key INT,
   );

-- Insert the data into the Customer table
INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);


select * from Customer
select * from Product

--Har bir productni ololadigan customer topish
/* customer_ID
		1
		3
*/

select c.customer_id from  Customer as c
join Product as p
on c.product_key=p.product_key
group by c.customer_id
having count(distinct c.product_key)=(select count(*) from Product)

-----------------------------------
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Users (user_id, name) VALUES (1, 'aLice');
INSERT INTO Users (user_id, name) VALUES (2, 'bOB');
INSERT INTO Users (user_id, name) VALUES (3, 'sArA');
INSERT INTO Users (user_id, name) VALUES (4, 'JoHNSoN');


select * from users

/* 1		Alice
   2		Bob
   3		Sara
   4		Johnson
*/

--Capitalize first letters 

select user_id,
               concat(Upper(substring(name,1,1)), lower(substring(name,2, len(name)))) as name
			   from Users

-------------------------------------------------