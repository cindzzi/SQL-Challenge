--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salary.salary
from employees
join salary
on employees.emp_no = salary.emp_no

--2. List employees who were hired in 1987.
select * from employees 
where hire_date between '1986-12-31' AND '1988-01-01'

--3.List the manager of each department with the following information: department number,
--department name,the manager's employee number, last name, first name,
--and start and end employment dates.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
from departments
join dept_manager
on departments.dept_no = dept_manager.dept_no
join employees
on dept_manager.emp_no = employees.emp_no

--4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no=employees.emp_no
join departments
on departments.dept_no=departments.dept_no

--5. List all employees whose first name is "Duangkaew" and last names begin with "P."
select employees.first_name, employees.last_name
from employees
where first_name = 'Duangkaew' and last_name like 'P%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name,departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no=employees.emp_no
join departments 
on dept_emp.dept_no=departments.dept_no
where departments.dept_name= 'Sales'

--7. List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no=employees.emp_no
join departments 
on dept_emp.dept_no=departments.dept_no
where departments.dept_name in ('Sales','Development')

--8. In ascending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

select employees.last_name, count(employees.last_name) as "Employees count"
from employees 
GROUP BY employees.last_name
order by "Employees count" asc;
