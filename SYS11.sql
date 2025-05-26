------H?r regionda yerl???n ölk?l?rin say?n? ç?xaran SQL yaz?n. N?tic?d? iki sütun olacaq: region_id, count_country.
select
region_id,

count(*) as count_country
from countries
group by region_id;

---- Employees c?dv?lind? h?r department_id üzr?, commission_pct sütunlar?n?n null olan v? null olmayan s?tirl?rin saylar?n? ç?xaran sql yaz?n. N?tic?d? üç sütun olacaq: department_id, null_count,
--notnull_count
select
department_id,
count(case when commission_pct is null then 1  end ) as null_count,
count(case when commission_pct  is not null then 1 end ) as notnull_count
from employees
group by department_id;

----Department_id-si 90 olan i?çil?rin maa? c?mini tapan sor?u yaz?n .
SELECT
SUM(salary) 
FROM employees
WHERE department_id = 90;


---.Ad? A h?rfi il? ba?layan i?çil?rin maa? ortalamas?n? tapan sor?u yaz?n.
select
 AVG(SALARY) as SALARY
FROM EMPLOYEES 
WHERE upper(FIRST_NAME) LIKE 'A%';

----.H?r bir department-d? neç? i?çi oldu?unu tapan sor?u yaz?n. N?tic?d? 2 sütun olsun
select
department_id, 
count(*) as employee_count
from employees
group by department_id;

---Departments c?dv?lind?n manager_id sütununda null olan s?tirl?rin say?n? tap?n
select
count(*) 
from departments
where manager_id is null;

----Locations c?dv?lind?n locations c?dv?lind?n  location_id -nin maksimal qiym?tini tap?n.
select
max (location_id) 
from locations;

----- H?r bir country_id üzr? street_address say?n? tapan sor?u yaz?n.
select country_id,
count(street_address) 
from locations
group by country_id;
