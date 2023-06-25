-- Query Basics
SELECT
	first_name,
	last_name
FROM
	patients;

SELECT
	*
FROM
	patients;

-- Select the most recent record by id to display it.
select
	*
from
	patients
where
	patient_id = (
		select
			max(patient_id)
		from
			patients
	);

-- Insert a record
INSERT INTO
	patients (
		first_name,
		last_name,
		gender,
		birth_date,
		city,
		province_id,
		allergies,
		weight,
		height
	)
VALUES
	(
		'John',
		'Smith',
		'M',
		'1994-02-21',
		'Hamilton',
		'ON',
		NULL,
		132,
		182
	);

-- Insert Data Only in Specified Columns
INSERT INTO
	patients (first_name, last_name, gender)
VALUES
	('Jane', 'Doe', 'F');

DELETE FROM patients
WHERE
	first_name = 'Paul';

UPDATE patients
SET
	first_name = 'John',
	weight = 120
WHERE
	patient_id = 1;

UPDATE patients
SET
	allergies = 'NKA'
WHERE
	allergies is NULL;

SELECT
	*
FROM
	patients
WHERE
	gender = 'F';

-- Operators
-- Equal, =
-- Greater Than, >
-- Less Than, <
-- Greater Than Or Equal To, >=
-- Less Than Or Equal To, <=
-- Not Equal, <> or != depending on sql version
-- Between, inclusive range
-- Like, pattern search
-- In, in a collection
SELECT
	*
FROM
	patients
WHERE
	patient_id = 1;

--   WHERE patient_id > 5;
--   WHERE patient_id < 5;
--   WHERE patient_id >= 5;
--   WHERE patient_id <= 5;
--   WHERE patient_id != 1;
--   WHERE patient_id BETWEEN 4 AND 6;
--   WHERE first_name LIKE 'a%';
--   WHERE patient_id IN (1,3,6,9);
-- the values can be replaced with a sub-query.
-- Query Filtering
SELECT
	*
FROM
	patients
WHERE
	first_name = 'John'
	AND city = 'Toronto';

SELECT
	*
FROM
	patients
WHERE
	city = 'Hamilton'
	OR city = 'Toronto';

SELECT
	*
FROM
	patients
WHERE
	NOT province_id = 'ON';

SELECT
	*
FROM
	patients
ORDER BY
	first_name;

SELECT
	*
FROM
	patients
ORDER BY
	first_name,
	last_name;

SELECT * FROM patients
    ORDER BY first_name ASC, last_name DESC;


SELECT * FROM patients
  WHERE first_name LIKE 'a%';
--   WHERE first_name LIKE '%a';
--   WHERE first_name LIKE '%or%';
--   WHERE first_name LIKE '_r%';
--   at least 3 characters in length
--   WHERE first_name LIKE 'a__%';
--   WHERE first_name LIKE 'a%o';
--   WHERE first_name NOT LIKE 'a%';

SELECT * FROM patients
WHERE province_id IN ('SK', 'AB', 'MB');

SELECT * FROM patients
WHERE province_id NOT IN ('SK', 'AB', 'MB');

SELECT * FROM patients 
WHERE first_name in (SELECT first_name FROM doctors)

SELECT * FROM patients
  WHERE weight BETWEEN 100 AND 120;

SELECT * FROM patients
  WHERE weight NOT BETWEEN 100 AND 120;

SELECT * FROM patients
  WHERE weight NOT BETWEEN 100 AND 120
  AND province_id NOT IN ('ON', 'SK', 'AB');

-- Text is compared based on the ASCII value of the text. 
-- For example, 'c'(99) is between 'a'(97) and 'e'(101) but 'C'(67) is not between 'a'(97) and 'e'(101).
SELECT * FROM patients
  WHERE first_name BETWEEN 'Alex' AND 'Ben'

-- JOIN Three Tables
SELECT
	*
FROM patients p
  JOIN admissions a ON a.patient_id = p.patient_id
  JOIN doctors ph ON ph.doctor_id = a.attending_doctor_id

SELECT first_name FROM patients
    UNION 
SELECT first_name FROM doctors
    ORDER BY first_name;

SELECT first_name FROM patients
    UNION ALL
SELECT first_name FROM doctors
    ORDER BY first_name;

SELECT COUNT(*), province_id
  FROM patients
  GROUP BY province_id;

SELECT COUNT(*), province_id
  FROM patients
  GROUP BY province_id
  ORDER BY COUNT(*) DESC;

SELECT COUNT(*), first_name
  FROM patients
  GROUP BY first_name
  HAVING count(*) > 30
  ORDER BY COUNT(*) DESC;

SELECT patient_id, height,
  CASE
      WHEN height > 175 THEN 'height is greater than 175'
      WHEN height = 175 THEN 'height is 175'
      ELSE 'height is under 175'
  END AS height_group
  FROM patients;

SELECT patient_id, first_name, allergies
  FROM patients
  ORDER BY
  (CASE
      WHEN allergies IS NULL THEN first_name
      ELSE allergies
  END);

SELECT COUNT(DISTINCT first_name) FROM patients;

select * from patients 
  where exists (select diagnosis from admissions 
      where patients.patient_id = admissions.patient_id 
      and diagnosis = 'Pregnancy')

-- Note: SQL statements that use the EXISTS condition are very inefficient
-- since the sub-query is rerun for EVERY row in the outer query's table.
-- The above SQL statement can be written more efficiently:
select * from patients 
  JOIN admissions on patients.patient_id = admissions.patient_id
  where diagnosis = 'Pregnancy'

-- Functions

-- Aggregate
SELECT COUNT(*) FROM patients 
WHERE weight > 120;

SELECT AVG(weight) FROM patients;

SELECT SUM(weight) FROM patients;

SELECT MAX(weight) FROM patients;

SELECT MIN(weight) FROM patients;

-- Window Functions
SELECT 
    first_name,
    last_name,
    weight,
    AVG(weight) OVER() as avg_weight
FROM
    patients;

with rolling_sum_table as (
    select
      patient_id,
      first_name,
      weight,
      sum(weight) over(order by patient_id) as rolling_sum
    from patients
  )
SELECT *
from rolling_sum_table
where rolling_sum < 1000

-- Value window functions
select
  patient_id,
  first_name,
  lag(first_name, 1) over() as previous_name
from patients

select
  patient_id,
  first_name,
  lead(first_name, 1) over() as next_name
from patients

select
  patient_id,
  province_id,
  first_value(birth_date) 
  over(partition by province_id -- group by province_id
       order by birth_date -- order it by birth_date for the first_value
       -- select all rows in the partition
       rows between UNBOUNDED PRECEDING and unbounded following
  ) as oldest_birth_date
from patients
order by patient_id

select
  patient_id,
  province_id,
  last_value(birth_date)
  over(partition by province_id -- group by province_id
       order by birth_date -- order it by birth_date for the last_value
       -- select all rows in the partiton
       rows between UNBOUNDED PRECEDING and unbounded following
  ) as youngest_birth_date
from patients
order by patient_id

-- String
SELECT CONCAT(first_name,' ', last_name) AS full_name
FROM patients;

SELECT first_name, LEN(first_name) AS length_of_name
FROM patients;

SELECT first_name, UPPER(first_name) AS uppercase_name
FROM patients;

SELECT first_name, LOWER(first_name) AS lowercase_name
FROM patients;

-- Numeric
SELECT RAND();
SELECT ROUND(135.375, 2);
SELECT FLOOR(25.9);  -- 25
SELECT CEIL(25.1);  - 26

-- Math
SELECT ABS(-362.3);
SELECT POWER(8, 3);
SELECT SQRT(13);

-- Date
SELECT year(current_timestamp)
SELECT MONTH(current_timestamp)
SELECT DAY(current_timestamp)


-- Tables
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

CREATE TABLE TestPatients AS
SELECT patient_id,first_name, last_name
FROM patients;

DROP TABLE patients;

ALTER TABLE patients
ADD email varchar(255);

ALTER TABLE patients
DROP COLUMN last_name;

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

ALTER TABLE Persons
ADD UNIQUE (ID);

ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

ALTER TABLE Persons
DROP CONSTRAINT UC_Person;


-- MySQL
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

-- SQL Server / Oracle / MS Access
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

ALTER TABLE Persons
ADD PRIMARY KEY (ID);

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;
-- SQL Server / Oracle / MS Access

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
	-- CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

ALTER TABLE Persons
ADD CHECK (Age>=18);

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT current_timestamp
);
insert into Orders (ID,OrderNumber) values (1,1);
select * from Orders;

ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Sandnes' FOR City;

ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

-- AUTO INCREMENT, SQL Server
CREATE TABLE Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

-- CREATE INDEX Statement
CREATE INDEX idx_last_name
ON patients (last_name);

CREATE INDEX idx_pname
ON patients (last_name, first_name);

-- DROP index
-- SQL Server
DROP INDEX table_name.index_name;

-- MySQL
ALTER TABLE table_name
DROP INDEX index_name;

-- DB2/Oracle
DROP INDEX index_name;

-- MS Access
DROP INDEX index_name ON table_name;

