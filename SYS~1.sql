1.Employee_id-si 206 olan i?çil?rl? eyni günd? i?? gir?n i?çil?ri tap?n.
select 
*
from employees
where hire_date = (
select hire_date
from employees
where employee_id = 206)
and employee_id = 206;



2.Salary-si 10000-d?n çox olan department-d? i?l?y?n i?çil?ri department adlar?n? tapan sor?u yaz?n.
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

3.Adminstration departmentinin yerl??diyi küç?nin ad?n? tap?n. (departments v? locations c?dv?ll?rind?n istifad? etm?kl?)
select 
l.street_address
from departments d
join locations l on d.location_id = l.location_id
where lower(d.department_name) = 'administration';

4. H?r bir i?çinin ad?n?, soyad?n?, i?? girm? tarixini v? departmenti üzr? minimum maa??n? göst?rin.
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

5. 50-ci department-d? i?l?m?y?n ,maa??  50-ci departmentd?ki i?çil?rin orta maa??nda çox olan i?çil?ri tap?n.
select 
*
from employees
where department_id = 50
and salary > (
select avg(salary)
from employees
where department_id = 50);

6.Employees c?dv?lind?n h?r bir i?çinin ad?n?, department_id-sini, i?? girm? tarixini v? öz departmenti üzr? son i?? girm? tarixini göst?rin.
select 
e.first_name, 
e.department_id, 
e.hire_date,
(select max(hire_date)
from employees
where department_id = e.department_id) as latest_hire_in_department
from employees e;

7.Alexander adl? i?çid?n çox maa? alan i?çil?rin orta maa??n? tap?n.
select 
avg(salary) as avg_salary
from employees
where salary > (
select salary
from employees
where lower(first_name) = 'Alexander');

8.Employee_id-si 113 olan i?çid?n sonra i?? gir?n i?çil?ri tap?n.
select 
*
from employees
where hire_date > (
select hire_date
from employees
where employee_id = 113);

