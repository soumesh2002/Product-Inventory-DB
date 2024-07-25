-- show TABLES;

create table Orders (
    order_id int primary key auto_increment,
    customer_name varchar (100) not null,
    order_date date not null
);

ALTER TABLE Orders AUTO_INCREMENT = 101;

create table Products
(
    product_id varchar (100),
    product_name varchar (100) not null,
    price int not null
);

create table Order_details
(
    order_id int,
    product_id int,
    quantity int
);

insert into Orders
    (customer_name, order_date)
values
    ("Jane Smith", '2024-08-17'),
    ("John Smith", "2023-02-14"),
    ("Luke Evans", "2019-07-10"),
    ("Anthony Cook", "2010-10-23"),
    ("Brooklyn James", "1996-05-13"),
    ("Julian Cooper", "2003-08-26"),
    ("Addison Foster", '2006-09-12'),
    ("Lucy Bryant", "2002-01-10"),
    ("Brian O' Conner", "2017-08-25"),
    ("Luke Hobbs", "2015-07-07"),
    ("Deckard Shaw", "2012-09-11"),
    ("Dominic Toretto", "2023-08-27"),
    ("Christoper Stone", "2002-05-12"),
    ("Isabella Angelina", "2002-07-29"),
    ("Troy Stone", "2002-03-08");

select *
from Orders;

-- TRUNCATE Products;

INSERT INTO Products
    (product_id, product_name, price)
VALUES
    ('P01', 'HP Elitebook 14', 159000),
    ('P02', 'Apple iPhone 14 Ultra Pro Legend Max', 4560000),
    ('P03', 'LG Washing Machine', 12500),
    ('P04', 'Sony Bravia Android TV', 55600),
    ('P05', 'Sony PS5', 49000),
    ('P06', 'Samsung Galaxy S24', 900009),
    ('P07', 'Dell XPS 13', 113000),
    ('P08', 'Hitachi Inverter AC', 67500);


select *
from Products;

alter table Order_details modify column product_id varchar (100);

alter table Products
add primary key (product_id);

alter table Order_details
add constraint fk_product_id foreign key (product_id)
references Products(product_id);

insert into Order_details (order_id, product_id, quantity)
--                          int        varchar     int
VALUES
(101, 'P05', 2),
(102, 'P07', 10),
(103, 'P08', 40),
(104, 'P04', 100),
(106, 'P02', 70);

select *
from Order_details;

-- Tasks

-- 01
select *
from Orders; 

-- 02
select *
from Products;

-- 03
select *
from Order_details;

-- 04
select order_date
from Orders
where order_date = '2023-02-14';

-- 05
select product_id, product_name
from Products
where price = 12500;

-- 06
select o.order_id, o.customer_name, p.product_name, od.quantity
from Orders o
join Order_details od ON o.order_id = od.order_id
join Products p on od.product_id = p.product_id
where o.customer_name = 'John Smith';

-- 07
select product_name, price
from Products
where price > 50000;

-- 08
select o.order_id, o.customer_name, o.order_date, p.product_name, od.quantity
from Orders o
join Order_details od on o.order_id = od.order_id
join Products p on p.product_id = od.product_id
where o.order_id = 103;

-- 09
-- substring: %'hit'%
select p.product_name
from Products p
where p.product_name like '%rav%';

-- 10
select o.order_id, o.order_date, od.order_id, od.quantity
from Orders o
join Order_details od on o.order_id = od.order_id
where o.order_id = 102;

-- 11
select count(o.order_id) as totalOrders
from Orders o;

-- 12
select count(p.product_id) as totalProducts
from Products p;

-- 13
select count(od.order_id) as totalOrderDetails
from Order_details od;

-- 14
select max(prod.price) as maxProductPrice
from Products prod;

-- 15
select min(prod.price) as minProductPrice
from Products prod;

-- 16
select avg(prod.price) as avgProductPrice
from Products prod;

-- formatting avg value to 2 decimal places
select cast(avg(prod.price) as decimal(10, 2))
as avgProductPrice
from Products prod;

-- 17
select o.order_id, o.order_date, p.product_name
from Orders o
join Order_details od on o.order_id = od.order_id
join Products p on p.product_id = od.product_id
order by o.order_date;

-- 18
select p.product_id, p.product_name, p.price
from Products p
order by p.price;

-- 19
select o.order_id, o.customer_name
from Orders o
order by o.customer_name;

-- 20
select od.order_id, od.quantity
from Order_details od;

-- 21
select o.order_id, p.product_name, p.price, od.quantity, (od.quantity * p.price) as totalValue
from Orders o
join Order_details od on o.order_id = od.order_id
join Products p on p.product_id = od.product_id;

-- 22
select o.order_id, o.customer_name, p.product_name
from Orders o
join Order_details od on o.order_id = od.order_id
join Products p on p.product_id = od.product_id;

-- 23
select distinct od.order_id, p.product_name
from Order_details od
join Products p on od.product_id = p.product_id
where p.product_name = "Sony PS5";

-- 24
select count(od.product_id) as TotalDifferentProductsOrdered
from Order_details od;

-- 26
select max(p.price) as maxPrice
from Products p;

-- 27
select min(p.price) as minPrice
from Products p;

-- 28
select *
from Orders
where Orders.order_date between '1990-10-01' and '2007-09-19';

-- 29
select p.product_id, p.product_name
from Products p
where p.product_id not in (select od.product_id from Order_details od);

-- 30
select o.order_id, o.customer_name, o.order_date, p.product_name, p.price as price_per_quantity, od.quantity as total_quantity_purchased, (od.quantity * price) as totalValue
from Orders o
join Order_details od on o.order_id = od.order_id
join Products p on p.product_id = od.product_id;