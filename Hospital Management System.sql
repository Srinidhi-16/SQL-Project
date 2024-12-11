-- creating database
create database HospitalDB;
use HospitalDB;

create table Patients(id int primary key auto_increment,name varchar(50)not null,age int not null, gender varchar(10),contact varchar(50));
create table doctors(id int primary key auto_increment,name varchar(50) not null , specialization varchar(50) not null);
create table appointments( id int primary key auto_increment,patient_id int ,doctor_id int,appointment_date date not null,status enum('scheduled','completed','cancelled'), foreign key(patient_id)references patients(id),foreign key(doctor_id) references doctors(id));

select * from patients;
select * from doctors;
select * from appointments;

insert into  patients values
(1,'latha',31,'female','7198437419'),
(2,'Mathi',23,'female','7198437419'),
(3,'manoj',28,'male','7198437419'),
(4,'ram',22,'male','7198437419'),
(5,'Sathish',29,'male','7198437419'),
(6,'sita',24,'female','7198437419');

insert into doctors values
(11,'indhu','Dermatologists'),
(12,'mohan','Emergency Medicine Specialists'),
(13,'lakshmi','Neurologists'),
(14,'Srinidhi','Radiologists');

insert into appointments values
(101,1,11,'2024-01-12','completed'),
(102,4,14,'2024-03-16','cancelled'),
(103,5,12,'2024-08-16','completed'),
(104,2,13,'2024-08-13','completed'),
(105,6,12,'2024-06-18','cancelled'),
(106,3,14,'2024-12-03','scheduled');

-- List all patients.
select name from patients;

--  List all doctors.
select name from doctors;

-- Show appointments with patient and doctor names
select p.name,a.appointment_date,d.name from patients p join appointments a on p.id=a.patient_id join doctors d on a.doctor_id=d.id;

-- Count appointments per doctor.
select d.name,count(a.doctor_id)as no_of_appointmtnets from appointments a join doctors d on a.doctor_id=d.id group by a.doctor_id;
