 show databases;
 use university;
 show tables;
 describe students;
 SELECT * FROM students;
 SELECT * FROM students ORDER BY programme, marks DESC;
 SELECT * FROM students WHERE gender = "male";
 CREATE VIEW male_students AS SELECT * FROM students WHERE gender = "male";
 CREATE VIEW ESTHER AS SELECT * FROM students WHERE programme NOT IN( "BSIT", "DIT");
