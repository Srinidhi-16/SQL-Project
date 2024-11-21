-- creating database
create database StudentDB;
use StudentDB;

create table Student(id int primary key auto_increment,name varchar(50) not null, age int not null,email varchar(50) not null unique);
create table courses(id int primary key auto_increment,name varchar(50) not null );
create table Enrollments(student_id int,course_id int,grade char(1),foreign key(course_id) references courses(id), foreign key(student_id) references student(id),primary key(student_id,course_id));

select * from student;
select * from courses;
select * from enrollments;

-- inserting data
insert into student values
(1,'Vidhya',15,'vid@gmail.com'),
(2,'Krishne',16,'Krishna@gmail.com'),
(3,'Swathi',15,'abc@gmail.com'),
(4,'Lakshmi',14,'lak@gmail.com'),
(5,'Ram',17,'ram@gmail.com'),
(6,'Manoj',14,'mano@gmail.com');

insert into courses values 
(101,'Full stack'),
(102,'Web davelopment'),
(103,'SQL'),
(104,'Tally'),
(105,'advance EXCEl');

insert into enrollments values
(1,101,'P'),
(1,103,'P'),
(2,105,'F'),
(2,103,'P'),
(3,101,'F'),
(4,101,'P'),
(5,101,'P'),
(4,103,'F'),
(5,102,'P'),
(5,104,'F');

-- List all students.
select name from student;

-- List all students.
select name from courses;

-- Show the names of students and the courses they are enrolled in
select s.name,c.name from student s join enrollments e on s.id=e.student_id join courses c on e.course_id=c.id;

-- Count the number of students in each course.
select c.name as course_name,count(e.student_id) as no_of_students from courses c join enrollments e on c.id=e.course_id group by c.name; 
