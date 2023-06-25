-- Query Basics

SELECT column1, column2, ...
  FROM tablename;

-- ALIASES
-- The AS keyword is optional in defining aliases.

-- COLUMNS
SELECT name AS city_name
FROM city;
-- TABLES
SELECT co.name, ci.name
FROM city AS ci
JOIN country AS co
  ON ci.country_id = co.id;


SELECT * FROM tablename;

INSERT INTO tablename (column1, column2, column3, ...)
    VALUES (value1, value2, value3, ...);

DELETE FROM tablename WHERE condition;

UPDATE tablename
    SET column1 = value1, column2 = value2, ...
    WHERE condition;

-- WHERE clause is used to filter records
SELECT column1, column2, ...
  FROM tablename
  WHERE condition;

-- Query Filtering

SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

SELECT column1, column2, ...
    FROM table_name
    ORDER BY column1, column2, ... ASC|DESC;

SELECT column1, column2, ...
  FROM table_name
  WHERE column LIKE pattern;

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

SELECT column_name(s) FROM table_name
  WHERE column_name BETWEEN value1 AND value2;

-- (INNER) JOIN: Returns records that have matching values in both tables
SELECT column_name(s)
    FROM table1
    [INNER] JOIN table2
    ON table1.column_name = table2.column_name;

-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
SELECT city.name, country.name
FROM city
LEFT JOIN country
  ON city.country_id = country.id;

-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
SELECT city.name, country.name
FROM city
RIGHT JOIN country
  ON city.country_id = country.id;

-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
SELECT city.name, country.name
FROM city
FULL [OUTER] JOIN country
  ON city.country_id = country.id;

-- CROSS JOIN returns all possible combinations of rows from both tables. There are two syntaxes available.
SELECT city.name, country.name
FROM city
CROSS JOIN country;

SELECT city.name, country.name
FROM city, country;

-- NATURAL JOIN will join tables by all columns with the same name.
SELECT city.name, country.name
FROM city
NATURAL JOIN country;

-- SELF JOIN
SELECT
  child.cat_name AS child_name,
  mom.cat_name   AS mom_name
FROM cat AS child
JOIN cat AS mom
  ON child.mom_id = mom.cat_id;

-- NON-EQUI SELF JOIN
-- You can use a non-equality in the ON condition, for example, to show all different pairs of rows
SELECT
  a.toy_name AS toy_a,
  b.toy_name AS toy_b
FROM toy a
JOIN toy b
  ON a.cat_id < b.cat_id;

-- MULTIPLE JOINS
JOIN & LEFT JOIN
SELECT
  t.toy_name,
  c.cat_name,
  o.name AS owner_name
FROM toy t
JOIN cat c
  ON t.cat_id = c.cat_id
LEFT JOIN owner o
  ON c.owner_id = o.id;

-- JOIN WITH MULTIPLE CONDITIONS
SELECT
  cat_name,
  o.name AS owner_name,
  c.age  AS cat_age,
  o.age  AS owner_age
FROM cat c
JOIN owner o
  ON c.owner_id = o.id
 AND c.age < o.age;

SELECT column_name(s) FROM table1
    UNION
SELECT column_name(s) FROM table2;

-- allow duplicate values, use UNION ALL
SELECT column_name(s) FROM table1
    UNION ALL
SELECT column_name(s) FROM table2;

SELECT name
FROM cycling
WHERE country = 'DE'
INTERSECT
SELECT name
FROM skating
WHERE country = 'DE';

SELECT name
FROM cycling
WHERE country = 'DE'
EXCEPT / MINUS
SELECT name
FROM skating
WHERE country = 'DE';

SELECT column_name(s)
  FROM table_name
  WHERE condition
  GROUP BY column_name(s)

SELECT column_name(s)
  FROM table_name
  WHERE condition
  GROUP BY column_name(s)
  HAVING condition
  ORDER BY column_name(s);

CASE
      WHEN condition1 THEN result1
      WHEN condition2 THEN result2
      WHEN conditionN THEN resultN
      ELSE result
  END;

SELECT DISTINCT column1, column2, ...
  FROM table_name;

SELECT column_name(s)
  FROM table_name
  WHERE EXISTS
  (SELECT column_name FROM table_name WHERE condition);

SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);

SELECT ALL column_name(s)
FROM table_name
WHERE condition;

SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);


-- IFNULL

-- MySQL
SELECT first_name, IFNULL(allergies,'none') as allergies 
FROM patients

SELECT first_name, COALESCE(allergies,'none') as allergies 
FROM patients

-- SQL Server
SELECT first_name, IFNULL(allergies,'none') as allergies 
FROM patients

-- MS Access
SELECT first_name, IIF(ISNULL(allergies,0),allergies) as allergies 
FROM patients

-- Oracle
SELECT first_name, NVL(allergies,'none') as allergies 
FROM patients


SELECT column_names
FROM table_name
WHERE column_name IS [NOT] NULL;

-- Functions

-- Aggregate
SELECT COUNT(column_name)
FROM table_name
WHERE condition;

SELECT AVG(column_name)
FROM table_name
WHERE condition;

SELECT SUM(column_name)
FROM table_name
WHERE condition;

SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MIN(column_name)
FROM table_name
WHERE condition;


-- Window Functions: Value window functions, aggregation window functions, and ranking window functions
-- ROW_NUMBER(), RANK(), SUM(), and many more
window_function_name ( expression ) OVER (
    partition_clause
    order_clause
    frame_clause
)

-- Value window functions
Lag(expression [, offset])
Lead(expression [, offset])

FIRST_VALUE ( scalar_expression )  
OVER ( 
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)

LAST_VALUE ( scalar_expression )  
OVER ( 
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)


-- String
CONCAT(expression1, expression2, expression3,...)
-- Note: Depending on the language there may be a built in syntax support for concat. Eg, + or ||
LEN(string)
UPPER(string)
LOWER(string)

-- Numeric
RAND(seed)
ROUND(number, deciamls)
FLOOR(number)
CEIL(number)

-- Math
ABS(number)
POWER(base, exponent)
SQRT(number)

-- Date
SELECT CURRENT_TIMESTAMP;
YEAR(date)
MONTH(date)
DAY(date)


-- Tables
-- SQL Data Types 
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;

DROP TABLE table_name;

ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE table_name
ALTER COLUMN column_name datatype;

CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);

-- The following constraints are commonly used in SQL:
-- NOT NULL - Ensures that a column cannot have a NULL value
-- UNIQUE - Ensures that all values in a column are different
-- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
-- FOREIGN KEY - Prevents actions that would destroy links between tables
-- CHECK - Ensures that the values in a column satisfies a specific condition
-- DEFAULT - Sets a default value for a column if no value is specified

-- CREATE INDEX Statement
-- Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update).
-- So, only create indexes on columns that will be frequently searched against.

CREATE INDEX index_name
ON table_name (column1, column2, ...);

CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);



-- Mega query aka mega cheat sheet
