create database project1
use project1

create table student (student_id int primary key auto_increment, First_Name varchar (25),Last_Name varchar (25),gender varchar(2),
DOB date,phone_no int,email_id varchar(50) unique, registration_date date)

create table Instructor (instructor_id int primary key auto_increment, instructor_name varchar (25), gender varchar(2),
phone_no int,email_id varchar(50) unique, specialization varchar(30))

create table category (category_id int primary key auto_increment, category_name varchar (25), cate_description text)

create table courses (course_id int primary key auto_increment, course_name varchar (25), course_descrpiton text,
price decimal (8,2) not null,duration varchar(10),
foreign key(course_id) references category(category_id))

create table course_instructor(course_instrucor_id int, course_id int,instructor_id int ,foreign key (course_id)
references courses(course_id), foreign key (instructor_id) references instructor(instructor_id))

create table enrollment(enrollment_id int primary key auto_increment,student_id int,course_id int, enroll_date date,
status varchar(25),foreign key(student_id) references student(student_id),foreign key(course_id) references courses(course_id))

create table payment(payment_id int primary key auto_increment,student_id int,course_id int, amount decimal(8,0), payment_date date,
payment_method varchar(25),foreign key(student_id) references student(student_id),foreign key(course_id) references courses(course_id))

create table course_schedule(schedule_id int primary key auto_increment,course_id int, start_date date, end_date date,
class_time time,class_mode varchar(10),foreign key(course_id) references courses(course_id))

create table progress(progress_id int primary key auto_increment,student_id int ,course_id int , percentage_of_completion decimal(5,2) default 0,
last_accessed datetime,foreign key(student_id) references student(student_id),foreign key(course_id) references courses(course_id))

create table certification(certificate_id int primary key auto_increment,student_id int not null,course_id int not null,
issue_date date,foreign key(student_id) references student(student_id),foreign key(course_id) references courses(course_id))


