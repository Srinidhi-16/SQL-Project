-- creating database
create database LearningDB;
use LearningDB;

create table courses (id int primary key auto_increment,title varchar(100) not null,description text);
create table instructors(id int primary key auto_increment,name varchar(50) not null, expertise varchar(50) not null);
create table students(id int primary key auto_increment,name varchar(50) not null, email varchar(50) not null unique);
create table enrollments(student_id int,course_id int,enrollment_date date not null, primary key (student_id,course_id),foreign key(student_id) references students(id),foreign key(course_id) references courses(id));

select * from courses;
select * from instructors;
select * from students;
select * from enrollments;

insert into courses values
(1,'Java','from basic to advance'),
(2,'SQL','Used for manipulating the data'),
(3,'Web development','using theis course can develop d website');

insert into instructors values
(11,'radha','data analytis'),
(12,'Ramesh','full stack');

insert into students values
(101,'mathi','mathi@gmail.com'),
(102,'vidhya','vid@gmail.com'),
(103,'Lakshmi','lak@gmail.com'),
(104,'srinidhi','sri@gmail.com'),
(105,'nadhi','na@gmail.com');

insert into enrollments values
(101,1,'2024-03-19'),
(102,2,'2024-04-12'),
(103,2,'2024-08-13'),
(104,3,'2024-07-12'),
(105,1,'2024-12-14');

-- List all courses.
select title from courses;

-- List all instructors.
select name from instructors;

-- Show enrollments with student names and course titles.
select s.name,e.course_id,c.title from students s join enrollments e on e.student_id=s.id join courses c on c.id=e.course_id;

-- Count the number of students enrolled in each course.
select c.title,count(e.student_id) as no_of_students from enrollments e join courses c on e.course_id=c.id group by e.course_id;

