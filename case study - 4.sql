-- creating database
create database RetailDB;
use RetailDB;

create table Products(id int primary key auto_increment,name varchar(50) not null,price Decimal(10,2) not null ,stock int not null,check (Price>0),check (Stock>=0));
create table Suppliers(id int primary key auto_increment,name varchar(50) not null,contact varchar(50));
create table sales(id int primary key auto_increment,product_id int ,date date not null, quantity int not null, total_price decimal(10,2) not null,check ( quantity>0),
foreign key (product_id) references Products(id));

select * from products;
select * from suppliers;
select * from sales;

insert into products values
(1,'Printer',1200,8),
(2,'Chair',800,12),
(3,'Desk',1000,15);

insert into Suppliers values
(11,'Mathi','9461893218'),
(12,"Sri",'9461893218'),
(13,'Ram','9461893218'),
(14,'Sita','9461893218'),
(15,"indu",'9461893218'),
(16,'lakshmi','9461893218');

insert into sales values
(101,1,'2024-01-13',2,2400),
(102,3,'2024-03-17',3,3000),
(103,2,'2024-04-12',4,32000);

-- List all products.
select name from products;

-- Show products with stock less than 10.
select name from products where stock<10;

--  List sales with product names and total prices.
select p.name,s.total_price from products p join sales s on p.id=s.product_id;

--  Calculate the total sales for each product.
select sales.product_id,count(sales.total_price) as total_salas from sales group by sales.product_id;

