-- Query basics

SELECT
	*
FROM
	products;

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

-- Select the most recent record by id to display it.
SELECT
	*
FROM
	patients
WHERE
	patient_id = (
		SELECT
			max(patient_id)
		FROM
			patients
	);

-- SQL requires single quotes around text values (most database systems will also allow double quotes).
--However, numeric fields should not be enclosed in quotes:
DELETE FROM patients WHERE first_name = 'Paul';
-- There are no longer any patients named 'Paul' in the database
select * from patients where first_name = 'Paul'

UPDATE patients
SET
	first_name = 'John',
	weight = 120
WHERE patient_id = 1;

UPDATE patients
SET allergies = 'NKA'
WHERE allergies is NULL;

--AND, OR and NOT Operators
-- The following operators can be used in the WHERE clause: =, >, <, >=, <=, <>|!=, ... BETWEEN 4 AND 6, IN, LIKE 'a%
SELECT * FROM patients
WHERE first_name='John' AND city='Toronto';
-- WHERE city='Hamilton' OR city='Toronto';
-- WHERE NOT province_id = 'ON';

SELECT * FROM patients
    ORDER BY first_name DESC;
	-- ORDER BY first_name, last_name;
	-- ORDER BY first_name ASC, last_name DESC;

SELECT * FROM patients
  WHERE first_name LIKE 'a%';
--   WHERE first_name LIKE '%a';
-- WHERE first_name LIKE '%or%';
	-- WHERE first_name LIKE '_r%';

SELECT * FROM patients
WHERE province_id IN ('SK', 'AB', 'MB');
-- WHERE province_id NOT IN ('SK', 'AB', 'MB');

SELECT * FROM patients 
WHERE first_name in (SELECT first_name FROM doctors);

SELECT * FROM patients
  WHERE weight NOT BETWEEN 100 AND 120;

-- select * from patients patient_id
-- join admissions a on a.patient_id = p.patient_id;

SELECT column_name(s) FROM table1
    -- UNION only distinct values by default
    UNION ALL  
	-- allow duplicate
SELECT column_name(s) FROM table2;

SELECT COUNT(*), province_id
  FROM patients
  GROUP BY province_id
  ORDER BY COUNT(*) DESC