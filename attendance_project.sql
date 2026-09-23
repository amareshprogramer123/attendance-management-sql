create database attendance_management;
use attendance_management;

create table student(
student_id int auto_increment primary key,
roll_no varchar(50),
name varchar(50),
gender varchar(50),
dob date,
department varchar(50),
semester int,
email varchar(50),
phone_no varchar(50));

create table teachers(
teacher_id int auto_increment primary key,
name varchar(50),
department varchar(50),
email varchar(50),
phone_no varchar(50));

create table subjects(
subject_id int auto_increment primary key,
subject_code varchar(20) unique not null,
subject_name varchar(50) not null,
semester int,
department varchar(50),
teacher_id int,
foreign key(teacher_id) references teachers(teacher_id));

create table classes(
class_id int auto_increment primary key,
subject_id int,
class_date date,
start_time time,
end_time time,
foreign key (subject_id) references subjects (subject_id));

create table attendance(
attendance_id int auto_increment primary key,
class_id int,
student_id int,
status enum("Present","Absent","Late") default "Absent",
marked_time timestamp default current_timestamp,
foreign key (class_id) references classes(class_id),
foreign key (student_id) references student(student_id),
unique(class_id, student_id));

insert into student(roll_no,name,gender,department,semester) values
('CSE01','Rahul Kumr','Male',"CSE",5),
("CSE02","Anita Sharma","Female","CSE",5);
insert into teachers(name,department,email)values
("Dr. S.Das","CSE","sdas@collegegmail.com");
insert into subjects(subject_code,subject_name,semester,department,teacher_id)values
("CSE501","Database Management System",5,"CSE",1);
(start_time,end_time) values
(1,"2026-02-09","10:00:00","11:00:00");insert into classes(subject_id,class_date,s
insert into attendance (class_id,student_id,status) values
(1,1,"Present"),
(1,2,"Absent");

-- select*from teachers;
-- select*from student;
select s.roll_no,s.name,sub.subject_name,c.class_date,a.status
from attendance a
join student s on a.student_id=s.student_id
join classes c on a.class_id= c.class_id
join subjects sub on c.subject_id=sub.subject_id;


