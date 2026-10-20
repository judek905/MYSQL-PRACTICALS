# SQL Practicals

A collection of three MySQL practical exercises covering database creation, table design, relationships, data insertion, and views.

## Contents

| File | Database | Focus |
|------|----------|-------|
| `prac_one.sql` | `university` | Exploring an existing table, sorting, filtering, and creating views |
| `prac_two.sql` | `Jude` | Creating a table, inserting multiple rows, and views with `BETWEEN` / `LIKE` |
| `prac_three.sql` | `dit` | Multi-table schema with primary and foreign keys |

## Requirements

- MySQL 5.7+ or MariaDB
- A MySQL client (MySQL Workbench, phpMyAdmin, or the `mysql` command line)

## How to Run

From the command line:

```bash
mysql -u <username> -p < prac_one.sql
mysql -u <username> -p < prac_two.sql
mysql -u <username> -p < prac_three.sql
```

Or open each file in MySQL Workbench and run it with **Ctrl + Shift + Enter**.

---

## Practical One: `prac_one.sql`

**Database:** `university` (must already exist, with a `students` table)

Practises basic querying and view creation on an existing `students` table.

| Statement | Purpose |
|-----------|---------|
| `show databases;` / `use university;` / `show tables;` | Navigate the server |
| `describe students;` | Show the table structure |
| `SELECT * FROM students;` | Retrieve all records |
| `SELECT ... ORDER BY programme, marks DESC;` | Sort by programme, then highest marks first |
| `SELECT ... WHERE gender = "male";` | Filter male students |
| `CREATE VIEW male_students ...` | Saves the male-student filter as a view |
| `CREATE VIEW ESTHER ...` | View of students whose programme is not `BSIT` or `DIT` |

**Note:** This file does not create the `students` table, so it must exist before running.

---

## Practical Two: `prac_two.sql`

**Database:** `Jude` (created by the script)

Builds a `Daily_routine` table and inserts eight tasks.

### Table: `Daily_routine`

| Column | Type | Constraints |
|--------|------|-------------|
| `task_id` | `INT` | Primary key |
| `task_name` | `VARCHAR(60)` | Not null |
| `task_description` | `VARCHAR(100)` | Not null |
| `Duration` | `VARCHAR(60)` | Time range of the task (stored as text) |

### Views

| View | Definition |
|------|------------|
| `Evening_routine` | Tasks with `Duration` between `6:00 PM- 7:00 PM` and `10:00 PM- 6:00 AM` |
| `view_one` | Tasks whose description starts with `M` |
| `view_two` | Tasks whose description starts with `E` |

---

## Practical Three: `prac_three.sql`

**Database:** `dit` (must already exist)

Creates a small relational schema for a school and inserts one sample record per table.

### Tables

- **`lecturer`**: `lecturer_id` (PK), `lecturer_name`
- **`students`**: `student_id` (PK), `student_name`, `programme`, `marks`, `gender`
- **`courses`**: `course_id` (PK), `course_name`, `lecturer_id` (FK to `lecturer`)
- **`enrollment`**: `enrollment_id` (PK), `student_id` (FK to `students`), `course_id` (FK to `courses`)

### Relationships

```
lecturer 1 ──── * courses 1 ──── * enrollment * ──── 1 students
```

- One lecturer can teach many courses.
- A student can enrol in many courses, and a course can have many students (many-to-many, resolved by `enrollment`).

### Sample data

| Table | Row |
|-------|-----|
| `lecturer` | 1, Dr. Smith |
| `students` | 1, John Doe, BSIT, 85, male |
| `courses` | 1, Database Systems, lecturer 1 |
| `enrollment` | 1, student 1, course 1 |

---

## Known Issues

1. **`prac_three.sql` fails to run.** There is a trailing comma after `lecturer_name varchar(50) not null,` in the `lecturer` table. Remove it:
   ```sql
   create table lecturer (
       lecturer_id int primary key,
       lecturer_name varchar(50) not null
   );
   ```
2. **`prac_two.sql`: `Evening_routine` returns no rows.** `Duration` is text, so `BETWEEN` compares strings alphabetically, and `'6:00 PM- 7:00 PM'` sorts after `'10:00 PM- 6:00 AM'`. Filtering directly instead works, e.g. `WHERE task_name IN ('Dinner', 'Sleep')`.
3. **`prac_two.sql`: `view_one` returns no rows.** No task description starts with `M`.
4. **`prac_two.sql`: misleading column comment.** The `Duration` comment says "in hours", but the column stores time ranges.
5. **`prac_three.sql` and `prac_one.sql`** assume their databases (`dit`, `university`) already exist. Run `create database dit;` first if needed.

## Author

Practical exercises for a database course. Replace this section with your name, course code, and date.
