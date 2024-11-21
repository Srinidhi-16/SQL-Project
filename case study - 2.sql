-- creating database
create database LibraryDB;
use LibraryDB;

-- creating tables
create table books (id int primary key auto_increment,title varchar(100) not null,author varchar(50) not null,published_year year not null,genre varchar(30));
create table Members(id int primary key auto_increment, name varchar(50) not null,membership_date date not null);
create table Borrowing(id int primary key auto_increment,book_id int ,member_id int,borrow_date date not null,return_date date,foreign key(book_id) references Books(id),foreign key(member_id) references members(id));

select * from books;
select * from members;
select * from Borrowing;

-- inserting datas
insert into books values(1,'It end with us','Collen Hoover',2016,'fictional');
insert into books values(2,'verity','Collen Hoover',2018,'thriller');
insert into books values(3,'Remainder of him','Collen Hoover',2022,'Romance');
insert into books values(4,'This summer will be different','Carley Fortune',2024,'Domestic Fictional');
insert into books values(5,'Ugly Love','Collen Hoover',2014,'Romance');

insert into members values
(101,'Jack','2024-02-12'),
(102,'Rose','2024-02-22'),
(103,'Arjun','2024-02-27'),
(104,'Das','2024-03-04'),
(105,'Mathi','2024-03-24');

insert into borrowing values
(11,1,102,'2024-02-25','204-04-15'),
(12,5,103,'2024-03-12','2024-07-02'),
(13,2,101,'2024-04-21','204-09-09'),
(14,1,105,'2024-03-29','2024-05-02'),
(15,4,103,'2024-05-27','2024-11-18'),
(16,5,101,'2024-05-12','2024-11-14'),
(17,2,102,'2024-02-28','2024-12-15'),
(18,3,104,'2024-04-17','2024-08-21'),
(19,4,105,'2024-04-12','2024-12-05'),
(20,1,104,'2024-04-21','2024-12-27');

-- Quries:
-- List all books.
select title from books;

-- List all members
select name from members;

-- .Show borrowing records with member names and book titles.
select b.id,b.borrow_date,b.return_date,m.name,b1.title from borrowing b join members m on b.member_id=m.id join books b1 on b.book_id=b1.id;

-- Count the number of books borrowed by each member.
select m.name,count(b.book_id) from borrowing b join members m on m.id=b.member_id group by b.member_id;
