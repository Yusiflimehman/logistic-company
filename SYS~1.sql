1.Employee_id-si 206 olan i?�il?rl? eyni g�nd? i?? gir?n i?�il?ri tap?n.
select 
*
from employees
where hire_date = (
select hire_date
from employees
where employee_id = 206)
and employee_id = 206;



2.Salary-si 10000-d?n �ox olan department-d? i?l?y?n i?�il?ri department adlar?n? tapan sor?u yaz?n.
select 
e.employee_id, 
e.first_name, 
e.last_name, 
d.department_name
from employees e
join departments d on e.department_id = d.department_id
where e.department_id in (
select department_id
from employees
where salary > 10000);

3.Adminstration departmentinin yerl??diyi k��?nin ad?n? tap?n. (departments v? locations c?dv?ll?rind?n istifad? etm?kl?)
select 
l.street_address
from departments d
join locations l on d.location_id = l.location_id
where lower(d.department_name) = 'administration';

4. H?r bir i?�inin ad?n?, soyad?n?, i?? girm? tarixini v? departmenti �zr? minimum maa??n? g�st?rin.
select 
e.first_name, 
e.last_name, 
e.hire_date, 
d.department_name,
(select min(salary)
from employees
where department_id = e.department_id) as min_salary_in_department
from employees e
join departments d on e.department_id = d.department_id;

5. 50-ci department-d? i?l?m?y?n ,maa??  50-ci departmentd?ki i?�il?rin orta maa??nda �ox olan i?�il?ri tap?n.
select 
*
from employees
where department_id = 50
and salary > (
select avg(salary)
from employees
where department_id = 50);

6.Employees c?dv?lind?n h?r bir i?�inin ad?n?, department_id-sini, i?? girm? tarixini v? �z departmenti �zr? son i?? girm? tarixini g�st?rin.
select 
e.first_name, 
e.department_id, 
e.hire_date,
(select max(hire_date)
from employees
where department_id = e.department_id) as latest_hire_in_department
from employees e;

7.Alexander adl? i?�id?n �ox maa? alan i?�il?rin orta maa??n? tap?n.
select 
avg(salary) as avg_salary
from employees
where salary > (
select salary
from employees
where lower(first_name) = 'Alexander');

8.Employee_id-si 113 olan i?�id?n sonra i?? gir?n i?�il?ri tap?n.
select 
*
from employees
where hire_date > (
select hire_date
from employees
where employee_id = 113);

