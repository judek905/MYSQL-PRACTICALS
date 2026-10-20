show databases;
use dit;
create table lecturer (
    lecturer_id int primary key,
    lecturer_name varchar(50) not null,
);
create table students (
    student_id int primary key,
    student_name varchar(50) not null,
    programme varchar(50) not null,
    marks int not null,
    gender varchar(10) not null
);
create Table courses (
    course_id int primary key,
    course_name varchar(50) not null,
    lecturer_id int,
    foreign key (lecturer_id) references lecturer(lecturer_id)
);
create table enrollment (
    enrollment_id int primary key,
    student_id int,
    course_id int,
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);
insert into lecturer values (1, "Dr. Smith");
insert into students values (1, "John Doe", "BSIT", 85, "male");
insert into courses values (1, "Database Systems", 1);
insert into enrollment values (1, 1, 1);