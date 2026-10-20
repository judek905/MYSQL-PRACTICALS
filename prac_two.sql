create database Jude;
use Jude;
create table Daily_routine (
task_id int primary key,
task_name varchar(60) not null,
task_description varchar (100) not null,
Duration VARCHAR (60) COMMENT 'Duration of the task in hours'
);
insert into Daily_routine (task_id, task_name, task_description, Duration) values
(1, 'Wake up', 'Get out of bed and start the day', '7:00 AM- 7:30 AM'),
(2, 'Exercise', 'Engage in physical activity to stay fit', '8:00 AM- 8:30 AM'),
(3, 'Breakfast', 'Have a healthy meal to start the day', '9:30 AM- 10:00 AM'),
(4, 'Work/Study', 'Focus on work or academic tasks', '10:30 AM- 11:00 AM'),
(5, 'Lunch', 'Take a break and have a meal', '11:30 AM- 12:00 PM'),
(6, 'Leisure/Relaxation', 'Engage in hobbies or relaxation activities', '12:30 PM- 1:00 PM'),
(7, 'Dinner', 'Have an evening meal with family or friends', '6:00 PM- 7:00 PM'),
(8, 'Sleep', 'Get adequate rest for the next day', '10:00 PM- 6:00 AM');
show tables;
describe Daily_routine;
create view Evening_routine AS SELECT * FROM Daily_routine WHERE Duration BETWEEN ('6:00 PM- 7:00 PM') AND ('10:00 PM- 6:00 AM');
create view view_one AS SELECT * FROM Daily_routine WHERE task_description LIKE 'M%';
create view view_two AS SELECT * FROM Daily_routine WHERE task_description LIKE 'E%'; 