----- task1 Employees c?dv?lind?n employee_id-si t?k ?d?d olan i?�il?ri �?xar?n.
select
employee_id
from employees
where mod (employee_id,2)=1;



----Locations c?dv?lind?n street_address s�tununda ikinci rast g?l?n bo?lu?un m�vqeyini �?xar?n.
select
location_id,
instr(street_address, ' ',1,2) as sahin
from locations;

select
*
from locations;

---- task3  Departments c?dv?lind?n h?r departmentin ad?n? v? ad?nda ne�? simvol oldu?unu �?xar?n.
select
department_name,
length(department_name)
from departments;




----task4 Employees c?dv?lind?n ad v? soyad?nda birlikd? olan simvol say? 12-d?n �ox olan i?�il?ri �?xar?n.
select
first_name,
last_name
from employees
where length(first_name) + length(last_name) >12;

---- task5 Employees c?dv?lind?n salary-l?ri 27-? b�l�b, yuvarlaqla?d?rma �sulu il?, k?srd? maximum 2 r?q?m olmaqla �?xar?n.
select
salary,
round(salary / 27,2) as sahin
from employees;


---Employee_id-si 113 olan i?�id?n sonra i?? gir?n i?�il?ri tap?n.
select
* 
from employees
where hire_date > 
(select hire_date
from employees
where employee_id =113);


task 10 Phone_number-i 8-l?  bit?n i?�il?rin manager adlar?n? tap?n.
select 
distinct
m.first_name,
m.last_name
from employees e
join employees m on e.manager_id =m.employee_id
where e.phone_number like '%8';