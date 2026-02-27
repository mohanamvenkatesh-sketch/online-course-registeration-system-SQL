create database online_course
use online_course
--student info

create table student(student_id int primary key , first_name varchar(25),last_name varchar(25),email varchar(30),phone varchar(12),date_of_birth date,
registration_date date)

create table instructor(instructor_id int primary key,inst_name varchar(25),email varchar(50),phone varchar(12), specialization varchar(20))
alter table instructor change column email email_id varchar(50)
create table category(category_id int primary key,category_name varchar(20),category_description text)
alter table category change column category_name category_name varchar(100)
create table courses (
    course_id int primary key auto_increment,
    course_title varchar(150) not null,
    description text,
    category_id int,
    price decimal(8,2) not null,
    duration varchar(50),
    foreign key(category_id) references category(category_id)
)
--course_instructor_table
create table course_instructor(course_instructor_id int primary key, course_id int,instructor_id int,
foreign key(course_id) references courses(course_id), foreign key(instructor_id) references instructor(instructor_id))


--enrollment_table
create table enrollment(enrollment_id int primary key,student_id int,course_id int,enrollment_date date, status varchar(25),
foreign key(student_id) references student(student_id),foreign key(course_id) references courses(course_id))


create table payment(payment_id int primary key,student_id int,course_id int,amount decimal(10,2),payment_date date,payment_method varchar(50),
status varchar(25), foreign key(student_id) references student(student_id),foreign key(course_id) references courses(course_id))


create table course_schedule(schedule_id int primary key,course_id int,start_date date,end_date date,class_time time, class_mode varchar(15),
foreign key(course_id) references courses(course_id))

create table progress(progress_id int primary key,student_id int,course_id int,completion_percentage decimal(5,2),last_accessed datetime,
foreign key(student_id) references student(student_id), foreign key(course_id) references courses(course_id))

create table certification(certification_id int primary key,student_id int,course_id int,issue_date date,certificate_link varchar(255),
foreign key(student_id) references student(student_id), foreign key(course_id) references courses(course_id))

insert into student (student_id,first_name,last_name,email,phone,date_of_birth,registration_date) values
(1, 'Arun', 'Kumar', 'arun.kumar@example.com', '9876543210', '2000-05-12', '2024-07-01'), (2, 'Priya', 'Sharma', 'priya.sharma@example.com', '9123456780', '1999-11-23', '2024-07-02'), (3, 'Rahul', 'Verma', 'rahul.verma@example.com', '9988776655', '2001-03-15', '2024-07-03'), (4, 'Sneha', 'Reddy', 'sneha.reddy@example.com', '9876501234', '2002-07-19', '2024-07-04'), (5, 'Vikram', 'Singh', 'vikram.singh@example.com', '9123004567', '1998-12-01', '2024-07-05'), (6, 'Meena', 'Iyer', 'meena.iyer@example.com', '9001122334', '2000-09-09', '2024-07-06'), (7, 'Karthik', 'Nair', 'karthik.nair@example.com', '9112233445', '2001-01-25', '2024-07-07'), (8, 'Divya', 'Patel', 'divya.patel@example.com', '9223344556', '1999-06-30', '2024-07-08'), (9, 'Rohan', 'Gupta', 'rohan.gupta@example.com', '9334455667', '2002-02-14', '2024-07-09'), (10, 'Anjali', 'Menon', 'anjali.menon@example.com', '9445566778', '2000-04-18', '2024-07-10'), (11, 'Suresh', 'Das', 'suresh.das@example.com', '9556677889', '1998-10-05', '2024-07-11'), (12, 'Lakshmi', 'Rao', 'lakshmi.rao@example.com', '9667788990', '2001-12-22', '2024-07-12'), (13, 'Ajay', 'Mishra', 'ajay.mishra@example.com', '9778899001', '2002-08-11', '2024-07-13'), (14, 'Neha', 'Kapoor', 'neha.kapoor@example.com', '9889900112', '1999-03-07', '2024-07-14'), (15, 'Santosh', 'Yadav', 'santosh.yadav@example.com', '9990011223', '2000-07-27', '2024-07-15'), (16, 'Pooja', 'Chopra', 'pooja.chopra@example.com', '9011223344', '2001-05-16', '2024-07-16'), (17, 'Manoj', 'Joshi', 'manoj.joshi@example.com', '9122334455', '1998-09-29', '2024-07-17'), (18, 'Ritika', 'Bansal', 'ritika.bansal@example.com', '9233445566', '2002-11-03', '2024-07-18'), (19, 'Deepak', 'Khan', 'deepak.khan@example.com', '9344556677', '2000-01-12', '2024-07-19'), (20, 'Shalini', 'Roy', 'shalini.roy@example.com', '9455667788', '1999-05-21', '2024-07-20'), (21, 'Naveen', 'George', 'naveen.george@example.com', '9566778899', '2001-06-08', '2024-07-21'), (22, 'Aarti', 'Pillai', 'aarti.pillai@example.com', '9677889900', '2002-10-30', '2024-07-22'), (23, 'Rajesh', 'Kulkarni', 'rajesh.kulkarni@example.com', '9788990011', '1998-02-17', '2024-07-23'), (24, 'Komal', 'Bhatt', 'komal.bhatt@example.com', '9899001122', '2000-12-25', '2024-07-24'), (25, 'Ashok', 'Chatterjee', 'ashok.chatterjee@example.com', '9900112233', '1999-08-13', '2024-07-25')



insert into instructor(instructor_id,inst_name ,email_id ,phone, specialization) values (1, 'Ravi Kumar', 'ravi.kumar@example.com', '9876543210', 'Mathematics'), (2, 'Priya Sharma', 'priya.sharma@example.com', '9123456780', 'Physics'), (3, 'Arun Verma', 'arun.verma@example.com', '9988776655', 'Computer Science'), (4, 'Sneha Reddy', 'sneha.reddy@example.com', '9876501234', 'Chemistry'), (5, 'Vikram Singh', 'vikram.singh@example.com', '9123004567', 'Biology'), (6, 'Meena Iyer', 'meena.iyer@example.com', '9001122334', 'English'), (7, 'Karthik Nair', 'karthik.nair@example.com', '9112233445', 'Economics'), (8, 'Divya Patel', 'divya.patel@example.com', '9223344556', 'Statistics'), (9, 'Rohan Gupta', 'rohan.gupta@example.com', '9334455667', 'History'), (10, 'Anjali Menon', 'anjali.menon@example.com', '9445566778', 'Political Science'), (11, 'Suresh Das', 'suresh.das@example.com', '9556677889', 'Philosophy'), (12, 'Lakshmi Rao', 'lakshmi.rao@example.com', '9667788990', 'Psychology'), (13, 'Ajay Mishra', 'ajay.mishra@example.com', '9778899001', 'Sociology'), (14, 'Neha Kapoor', 'neha.kapoor@example.com', '9889900112', 'Business Studies'), (15, 'Santosh Yadav', 'santosh.yadav@example.com', '9990011223', 'Accounting'), (16, 'Pooja Chopra', 'pooja.chopra@example.com', '9011223344', 'Finance'), (17, 'Manoj Joshi', 'manoj.joshi@example.com', '9122334455', 'Marketing'), (18, 'Ritika Bansal', 'ritika.bansal@example.com', '9233445566', 'Human Resources'), (19, 'Deepak Khan', 'deepak.khan@example.com', '9344556677', 'Law'), (20, 'Shalini Roy', 'shalini.roy@example.com', '9455667788', 'Fine Arts'), (21, 'Naveen George', 'naveen.george@example.com', '9566778899', 'Music'), (22, 'Aarti Pillai', 'aarti.pillai@example.com', '9677889900', 'Dance'), (23, 'Rajesh Kulkarni', 'rajesh.kulkarni@example.com', '9788990011', 'Engineering'), (24, 'Komal Bhatt', 'komal.bhatt@example.com', '9899001122', 'Architecture'), (25, 'Ashok Chatterjee', 'ashok.chatterjee@example.com', '9900112233', 'Design')


insert into category (category_id, category_name, category_description) values
(1, 'Web Development', 'Courses on HTML, CSS, JavaScript, and frameworks'),
(2, 'Data Science', 'Machine learning, data analysis, and visualization'),
(3, 'Cybersecurity', 'Network security, ethical hacking, and risk management'),
(4, 'Cloud Computing', 'AWS, Azure, and Google Cloud certifications'),
(5, 'Artificial Intelligence', 'AI fundamentals, deep learning, and NLP'),
(6, 'Software Engineering', 'Principles of software design and development'),
(7, 'Mobile App Development', 'Android and iOS app programming'),
(8, 'Database Management', 'SQL, NoSQL, and database administration'),
(9, 'UI/UX Design', 'User interface and experience design courses'),
(10, 'Digital Marketing', 'SEO, social media, and online advertising'),
(11, 'Graphic Design', 'Adobe Photoshop, Illustrator, and design theory'),
(12, 'Photography', 'Digital photography and editing techniques'),
(13, 'Film Studies', 'Cinematography, editing, and film theory'),
(14, 'Music Production', 'Sound engineering and music composition'),
(15, 'Fine Arts', 'Painting, sculpture, and creative expression'),
(16, 'Performing Arts', 'Dance, theatre, and stage performance'),
(17, 'Business Administration', 'Core MBA foundation courses'),
(18, 'Finance Management', 'Corporate finance, investments, and banking'),
(19, 'Human Resource Management', 'HR practices, recruitment, and leadership'),
(20, 'Marketing Management', 'Branding, consumer behavior, and strategy'),
(21, 'Operations Management', 'Supply chain and process optimization'),
(22, 'Entrepreneurship', 'Startup creation, innovation, and venture funding'),
(23, 'International Business', 'Global trade, cross-cultural management'),
(24, 'Project Management', 'Agile, Scrum, and PMP certification courses'),
(25, 'Leadership & Strategy', 'Executive leadership and strategic planning')

select * from category


insert into courses (course_id, course_title, description, category_id, price, duration) values
(1, 'Introduction to Web Development', 'Learn HTML, CSS, and JavaScript basics', 1, 199.99, '6 weeks'),
(2, 'Python for Data Science', 'Data analysis and visualization using Python', 2, 299.99, '10 weeks'),
(3, 'Cybersecurity Fundamentals', 'Network security and ethical hacking basics', 3, 249.99, '8 weeks'),
(4, 'Cloud Computing with AWS', 'Hands-on AWS services and deployment', 4, 399.99, '12 weeks'),
(5, 'Artificial Intelligence Basics', 'AI fundamentals and machine learning concepts', 5, 349.99, '12 weeks'),
(6, 'Software Engineering Principles', 'Agile, testing, and design patterns', 6, 249.99, '8 weeks'),
(7, 'Mobile App Development with Flutter', 'Cross-platform mobile apps using Flutter', 7, 299.99, '10 weeks'),
(8, 'Database Design with SQL', 'Schema design, joins, and normalization', 8, 199.99, '6 weeks'),
(9, 'UI/UX Design Fundamentals', 'Design thinking and prototyping tools', 9, 249.99, '8 weeks'),
(10, 'Digital Marketing Essentials', 'SEO, SEM, and social media strategies', 10, 199.99, '6 weeks'),
(11, 'Graphic Design with Photoshop', 'Image editing and creative design projects', 11, 149.99, '5 weeks'),
(12, 'Photography Masterclass', 'Lighting, composition, and editing techniques', 12, 199.99, '6 weeks'),
(13, 'Film Editing Basics', 'Learn Adobe Premiere and storytelling', 13, 249.99, '8 weeks'),
(14, 'Music Theory and Composition', 'Fundamentals of music creation', 14, 149.99, '5 weeks'),
(15, 'Painting Techniques', 'Oil, acrylic, and watercolor methods', 15, 199.99, '6 weeks'),
(16, 'Performing Arts Workshop', 'Acting, dance, and stage presence', 16, 249.99, '8 weeks'),
(17, 'MBA Foundation', 'Core concepts in business administration', 17, 499.99, '16 weeks'),
(18, 'Corporate Finance', 'Financial modeling and valuation techniques', 18, 399.99, '12 weeks'),
(19, 'Human Resource Management', 'Recruitment, training, and leadership skills', 19, 299.99, '10 weeks'),
(20, 'Marketing Strategy', 'Consumer behavior and branding', 20, 349.99, '12 weeks'),
(21, 'Operations Management', 'Supply chain and process optimization', 21, 399.99, '12 weeks'),
(22, 'Entrepreneurship Bootcamp', 'Startup creation and venture funding', 22, 499.99, '14 weeks'),
(23, 'International Business', 'Global trade and cross-cultural management', 23, 399.99, '12 weeks'),
(24, 'Project Management with Agile', 'Scrum, Kanban, and PMP preparation', 24, 349.99, '12 weeks'),
(25, 'Leadership and Strategy', 'Executive leadership and decision-making', 25, 499.99, '14 weeks');


insert into course_instructor (course_instructor_id, course_id, instructor_id) values
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25)

select * from course_instructor

insert into enrollment (enrollment_id, student_id, course_id, enrollment_date, status) values
(1, 1, 1, '2024-07-01', 'Active'),
(2, 2, 2, '2024-07-02', 'Active'),
(3, 3, 3, '2024-07-03', 'Completed'),
(4, 4, 4, '2024-07-04', 'Active'),
(5, 5, 5, '2024-07-05', 'Dropped'),
(6, 6, 6, '2024-07-06', 'Active'),
(7, 7, 7, '2024-07-07', 'Active'),
(8, 8, 8, '2024-07-08', 'Completed'),
(9, 9, 9, '2024-07-09', 'Active'),
(10, 10, 10, '2024-07-10', 'Active'),
(11, 11, 11, '2024-07-11', 'Dropped'),
(12, 12, 12, '2024-07-12', 'Active'),
(13, 13, 13, '2024-07-13', 'Completed'),
(14, 14, 14, '2024-07-14', 'Active'),
(15, 15, 15, '2024-07-15', 'Active'),
(16, 16, 16, '2024-07-16', 'Dropped'),
(17, 17, 17, '2024-07-17', 'Active'),
(18, 18, 18, '2024-07-18', 'Active'),
(19, 19, 19, '2024-07-19', 'Completed'),
(20, 20, 20, '2024-07-20', 'Active'),
(21, 21, 21, '2024-07-21', 'Active'),
(22, 22, 22, '2024-07-22', 'Dropped'),
(23, 23, 23, '2024-07-23', 'Active'),
(24, 24, 24, '2024-07-24', 'Completed'),
(25, 25, 25, '2024-07-25', 'Active')


insert into payment (payment_id, student_id, course_id, amount, payment_date, payment_method, status) values
(1, 1, 1, 199.99, '2024-07-01', 'Credit Card', 'Completed'),
(2, 2, 2, 299.99, '2024-07-02', 'Debit Card', 'Completed'),
(3, 3, 3, 249.99, '2024-07-03', 'UPI', 'Completed'),
(4, 4, 4, 399.99, '2024-07-04', 'Net Banking', 'Completed'),
(5, 5, 5, 349.99, '2024-07-05', 'Credit Card', 'Pending'),
(6, 6, 6, 249.99, '2024-07-06', 'Debit Card', 'Completed'),
(7, 7, 7, 299.99, '2024-07-07', 'UPI', 'Completed'),
(8, 8, 8, 199.99, '2024-07-08', 'Credit Card', 'Completed'),
(9, 9, 9, 249.99, '2024-07-09', 'Net Banking', 'Completed'),
(10, 10, 10, 199.99, '2024-07-10', 'Debit Card', 'Completed'),
(11, 11, 11, 149.99, '2024-07-11', 'UPI', 'Completed'),
(12, 12, 12, 199.99, '2024-07-12', 'Credit Card', 'Completed'),
(13, 13, 13, 249.99, '2024-07-13', 'Debit Card', 'Completed'),
(14, 14, 14, 149.99, '2024-07-14', 'UPI', 'Completed'),
(15, 15, 15, 199.99, '2024-07-15', 'Net Banking', 'Completed'),
(16, 16, 16, 249.99, '2024-07-16', 'Credit Card', 'Pending'),
(17, 17, 17, 499.99, '2024-07-17', 'Debit Card', 'Completed'),
(18, 18, 18, 399.99, '2024-07-18', 'UPI', 'Completed'),
(19, 19, 19, 299.99, '2024-07-19', 'Credit Card', 'Completed'),
(20, 20, 20, 349.99, '2024-07-20', 'Net Banking', 'Completed'),
(21, 21, 21, 399.99, '2024-07-21', 'Debit Card', 'Completed'),
(22, 22, 22, 499.99, '2024-07-22', 'UPI', 'Completed'),
(23, 23, 23, 399.99, '2024-07-23', 'Credit Card', 'Completed'),
(24, 24, 24, 349.99, '2024-07-24', 'Net Banking', 'Completed'),
(25, 25, 25, 499.99, '2024-07-25', 'Debit Card', 'Completed')



insert into course_schedule (schedule_id, course_id, start_date, end_date, class_time, class_mode) values
(1, 1, '2024-07-01', '2024-08-12', '10:00:00', 'Online'),
(2, 2, '2024-07-02', '2024-09-02', '14:00:00', 'Online'),
(3, 3, '2024-07-03', '2024-08-28', '09:00:00', 'Offline'),
(4, 4, '2024-07-04', '2024-09-26', '11:00:00', 'Hybrid'),
(5, 5, '2024-07-05', '2024-09-20', '15:00:00', 'Online'),
(6, 6, '2024-07-06', '2024-08-31', '13:00:00', 'Offline'),
(7, 7, '2024-07-07', '2024-09-15', '16:00:00', 'Online'),
(8, 8, '2024-07-08', '2024-08-19', '10:00:00', 'Hybrid'),
(9, 9, '2024-07-09', '2024-09-03', '09:30:00', 'Online'),
(10, 10, '2024-07-10', '2024-08-21', '11:30:00', 'Offline'),
(11, 11, '2024-07-11', '2024-08-15', '12:00:00', 'Online'),
(12, 12, '2024-07-12', '2024-09-05', '14:30:00', 'Hybrid'),
(13, 13, '2024-07-13', '2024-09-07', '15:30:00', 'Online'),
(14, 14, '2024-07-14', '2024-08-25', '10:30:00', 'Offline'),
(15, 15, '2024-07-15', '2024-09-10', '09:00:00', 'Online'),
(16, 16, '2024-07-16', '2024-09-12', '13:30:00', 'Hybrid'),
(17, 17, '2024-07-17', '2024-11-06', '17:00:00', 'Offline'),
(18, 18, '2024-07-18', '2024-10-10', '18:00:00', 'Online'),
(19, 19, '2024-07-19', '2024-11-08', '19:00:00', 'Hybrid'),
(20, 20, '2024-07-20', '2024-10-12', '20:00:00', 'Online'),
(21, 21, '2024-07-21', '2024-10-15', '09:00:00', 'Offline'),
(22, 22, '2024-07-22', '2024-10-20', '11:00:00', 'Online'),
(23, 23, '2024-07-23', '2024-10-25', '14:00:00', 'Hybrid'),
(24, 24, '2024-07-24', '2024-10-30', '15:00:00', 'Offline'),
(25, 25, '2024-07-25', '2024-11-05', '16:00:00', 'Online')


insert into certification (certification_id, student_id, course_id, issue_date, certificate_link) values
(1, 1, 1, '2024-08-15', 'http://example.com/certificates/cert1.pdf'),
(2, 2, 2, '2024-08-16', 'http://example.com/certificates/cert2.pdf'),
(3, 3, 3, '2024-08-17', 'http://example.com/certificates/cert3.pdf'),
(4, 4, 4, '2024-08-18', 'http://example.com/certificates/cert4.pdf'),
(5, 5, 5, '2024-08-19', 'http://example.com/certificates/cert5.pdf'),
(6, 6, 6, '2024-08-20', 'http://example.com/certificates/cert6.pdf'),
(7, 7, 7, '2024-08-21', 'http://example.com/certificates/cert7.pdf'),
(8, 8, 8, '2024-08-22', 'http://example.com/certificates/cert8.pdf'),
(9, 9, 9, '2024-08-23', 'http://example.com/certificates/cert9.pdf'),
(10, 10, 10, '2024-08-24', 'http://example.com/certificates/cert10.pdf'),
(11, 11, 11, '2024-08-25', 'http://example.com/certificates/cert11.pdf'),
(12, 12, 12, '2024-08-26', 'http://example.com/certificates/cert12.pdf'),
(13, 13, 13, '2024-08-27', 'http://example.com/certificates/cert13.pdf'),
(14, 14, 14, '2024-08-28', 'http://example.com/certificates/cert14.pdf'),
(15, 15, 15, '2024-08-29', 'http://example.com/certificates/cert15.pdf'),
(16, 16, 16, '2024-08-30', 'http://example.com/certificates/cert16.pdf'),
(17, 17, 17, '2024-08-31', 'http://example.com/certificates/cert17.pdf'),
(18, 18, 18, '2024-09-01', 'http://example.com/certificates/cert18.pdf'),
(19, 19, 19, '2024-09-02', 'http://example.com/certificates/cert19.pdf'),
(20, 20, 20, '2024-09-03', 'http://example.com/certificates/cert20.pdf'),
(21, 21, 21, '2024-09-04', 'http://example.com/certificates/cert21.pdf'),
(22, 22, 22, '2024-09-05', 'http://example.com/certificates/cert22.pdf'),
(23, 23, 23, '2024-09-06', 'http://example.com/certificates/cert23.pdf'),
(24, 24, 24, '2024-09-07', 'http://example.com/certificates/cert24.pdf'),
(25, 25, 25, '2024-09-08', 'http://example.com/certificates/cert25.pdf')

select * from certification

# list all the student with their registration date

select student_id,first_name,last_name,registration_date from student



