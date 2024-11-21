-- create the database:
create database EmployeeManagement;
use EmployeeManagement;

-- Create table
create table department (id int auto_increment primary key,name varchar(50) not null);
create table employees(id int primary key auto_increment,name varchar(50) not null,age int not null,gender varchar(10) not null,salary int not null check(salary>30000),
 department_id int, foreign key(department_id) references department(id));
 create table projects(id int primary key auto_increment,name varchar(50) not null,budget int not null check (budget>10000));
 create table employee_project (employee_id int ,project_id int ,foreign key(employee_id) references employees(id),foreign key(project_id) references projects(id),primary key(employee_id,project_id));
 create table attendance (id int primary key auto_increment,employee_id int,date date not null,status enum('present','absent','on leave'), foreign key(employee_id) references employees(id));


 -- View the table
 select * from department;
 select * from employees;
select * from projects;
 select * from employee_project;
 select * from attendance;

 insert into department values(1,'HR'),(2,'IT'),(3,'customer care');
 
 insert into employees values(1,'Mathi',21,'female',40000,1);
 insert into employees values(2,'Ram',22,'male',31000,2);
 insert into employees values(3,'Sita',21,'female',34000,3);
 insert into employees values(4,'lakshmi',25,'female',40000,2);
 insert into employees values(5,'priya',24,'female',32000,1);
 insert into employees values(6,'Manjo',17,'male',50000,2);
 insert into employees values(7,'saro',22,'female',32000,1,'saro@gamil.com','resigned');
 
   
insert into projects values(1,'event management',20000);
insert into projects values(2,'wether analysis',12000);
insert into projects values(3,'management system',21000);
insert into projects values(4,'sports academy',40000);


insert into employee_project values(1,2);
insert into employee_project values(2,2);
insert into employee_project values(3,1);
insert into employee_project values(4,3);
insert into employee_project values(5,1);
insert into employee_project values(6,3);


insert into attendance values(1,1,'2023-10-13','present');
insert into attendance values(2,2,'2023-10-14','absent');
insert into attendance values(3,3,'2023-10-20','on leave');
insert into attendance values(4,4,'2023-11-03','present');
insert into attendance values(5,5,'2023-11-10','present');
insert into attendance values(6,6,'2023-12-01','on leave');

update projects set budget=55000 where id=3;
update employees set age=20 where id=6;
-- quries:
-- Retrieve all employees
select * from employees;

--  Retrieve all employees in the 'IT' department.
select e.name,d.name as department from employees e join department d on e.department_id=d.id where d.name='IT';


-- List all projects with a budget greater than 50000.
select name from projects where budget>50000;


-- Show the names of employees and the projects they are working on.
select e.name,p.name as projects from employees e join projects p on e.id=p.id;
SELECT e.name AS employee_name, p.name FROM employees e JOIN employee_project ep ON e.id = ep.employee_id join projects p on ep.project_id=p.id;


-- Count the number of employees in each department.
select d.name,count(e.name) from employees e join department d on e.department_id=d.id group by name;


-- Find employees with a salary greater than 50000.
select name from employees where salary>50000;


-- Get attendance records for a specific employee.
select e.name,a.status from employees e join attendance a on e.id=a.employee_id;
select e.name ,e.salary,d.name as department from employees e join department d on e.department_id=d.id;


-- update records:
-- Increase the salary of employees in the 'HR' department by 10%.
update employees e join department d set salary=salary*1.10 where d.name='HR';
set sql_safe_updates=0;


-- Change the department of an employee.
UPDATE employees set department_id=3 where id=6;


-- delete records:
-- Remove an employee who has resigned.
alter table employees add column status varchAR(20);
update employees set status='active' where id=6;
delete from employees where status='resigned';


-- Delete a project that is completed
delete from projects where id not in (select project_id from employee_project);


-- Constraints and Modification:
--  Add a unique constraint to the `email` column in `Employees` table.
alter table employees add column email varchar(50);
alter table employees add constraint ue unique(email);
update employees set email='mano@gmail.com' where id=6;


--  Ensure `age` is always greater than 18.
alter table employees add constraint ad check(age>18);


-- Add a default value 'Unknown' to `gender` if not specified.
alter table employees modify column gender varchar(10) default 'unknown';
