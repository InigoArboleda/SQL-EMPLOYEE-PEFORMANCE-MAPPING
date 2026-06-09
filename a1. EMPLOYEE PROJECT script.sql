/* 
Data Analyst: Inigo Arboleda
Date: 2/20/2026
Lesson 18: Career Simulation: Employee Performance Mapping
-----------------------------
Overview:
In this project, you will apply the fundamentals of SQL programming to practice, from data preparation, subqueries, and functions. The focus is on building an employee performance mapping solution for a data science startup. You will use SQL to accurately map employees and track their performance. 

Situation:
ScienceQtech is a startup that works in the Data Science field. ScienceQtech has worked on fraud detection, market basket, self-driving cars, supply chain, algorithmic early detection of lung cancer, customer sentiment, and the drug discovery field. With the annual appraisal cycle around the corner, the HR department has asked you (Junior Database Administrator) to generate reports on employee details, their performance, and on the project that the employees have undertaken, to analyze the employee database and extract specific data based on different requirements. 

Task:
To facilitate a better understanding, managers have provided ratings for each employee which will help the HR department to finalize the employee performance mapping. As a DBA, you should find the maximum salary of the employees and ensure that all jobs meet the organization's profile standard. You also need to calculate bonuses to find extra costs for expenses. This will improve the organization's overall performance by ensuring all the employees required receive training.

Action:
1. Create a database named employee, then import data_science_team.csv, proj_table.csv, and emp_record_table.csv into the employee database from the given resources.
2. Create an ER diagram for the given employee database.
3. Write a query to Find EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and  DEPARTMENT from the employee record table, and make a list of employees  and details of their department.
4. Write three separate SQL statements with the following columns from the employee table: EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING. Each query should filter records based on one of the following EMP_RATING conditions:
	- Find employees whose EMP_RATING is less than 2
	- Find employees whose EMP_RATING is greater than 4
	- Find employees whose EMP_RATING is between 2 and 4
5. Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.
6. Write a query to find employees with who have someone reporting to them. Provide the number for each person (including the President).
7. Write a query to list all the employees from the healthcare and finance departments using UNION ALL.
8. Write a query to display each employee’s details—EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING—along with the maximum EMP_RATING in their respective department.
9.Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
10. Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
11. Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.
12. Write a subquery to find employees with experience of more than ten years. Take data from the employee record table.
13. Write a query using the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
	1. The standard being:
	For an employee with experience less than or equal to 2 years, assign ‘JUNIOR DATA 		SCIENTIST’.
	For an employee with experience of more than 2 years and up to 5 years, assign ‘ASSOCIATE DATA SCIENTIST’.
	For an employee with experience of more than 5 years and up to 10 years, assign ‘SENIOR DATA SCIENTIST’.
	For an employee with experience of more than 10 years and up to 12 years, assign ‘LEAD DATA SCIENTIST’.
	For an employee with experience of more than 12 years and up to 16 years, assign ‘MANAGER’
	2. Include the AVERAGE number of years for each department.
14. Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
15. Write a query to calculate the average salary distribution based on the continent and country.

---------------------------------------------*/

/*-- ACTION 1: Create and Import*/
create table project_table(
PROJECTID	varchar (255) primary key not null,
PROJECTNAME	varchar (255),
DOMAIN	varchar (255),
STARTDATE	date	,
CLOSUREDATE	date	,
DEVQTR	varchar (100),
STATUS	varchar (100)
);

create table data_science_team(
EMPID	varchar (255) primary key not null,
FIRSTNAME	varchar (255),
LAST_NAME	varchar (255),
GENDER	varchar (255),
ROLE	 varchar (255),
DEPT	 varchar (255),
EXP	integer,
COUNTRY	varchar (255),
CONTINENT	varchar (255)
);


create table emp_record(
EMPID	varchar (255),
FIRSTNAME	varchar (255),
LASTNAME	 varchar (255),
GENDER	varchar (255),
ROLE	 varchar (255),
DEPT	 varchar (255),
EXP	integer,
COUNTRY	varchar (255),
CONTINENT	varchar (255),
SALARY	integer,
EMPRATING	integer,
MANAGERID varchar (255),
PROJECTID	varchar (255),
foreign key (empid) references data_science_team (empid)
,foreign key (firstname) references data_science_team (firstname)
,foreign key (lastname) references data_science_team (lastname)
,foreign key (gender) references data_science_team (gender)
,foreign key (role) references data_science_team (role)
,foreign key (dept) references data_science_team (dept)
,foreign key (exp) references data_science_team (exp)
,foreign key (country) references data_science_team (country)
,foreign key (continent) references data_science_team (continent)
,foreign key (projectid) references project_Table (projectid)
);

-- DATA CHECK:
select *
from project_table;

select *
from emp_Record;

select *
from data_science_team;


/*-- ACTION 2: CREATE ER DIAGARAM. COMPLETE, ERD CREATED -- 'employeedb.erd' 

-- ACTION 3: Write a query to Find EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and  DEPARTMENT from the employee record table, and make a list of employees and details of their department.
	--FINDINGS:
		-- A total of 19 rows of employees were queried, showing their ID, their name, their gender and the department that they work in. 
		--With this, I am now able to get insight of the data that I am working with. Data check, data cleaning, further magnifying the data.*/
select
	empid
	,FIRSTNAME
	,lastname
	,GENDER 
	,dept
from emp_record 
;

/*--ACTION 4: Write three separate SQL statements with the following columns from the employee table: EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING. Each query should filter records based on one of the following EMP_RATING conditions:
	--FINDINGS: 
		-- With these queries, I am looking for visibility in terms of the EMPLOYEE RATING and setting conditions for these ratings to further dissect what employees fit in what category depending on their 'RATING'
		-- 3 employees have a rating less than 2
		-- 4 employees have a rating less than 4 
		-- 12 employees have a rating between 2 and 4*/

--data check:
select
	empid
	,FIRSTNAME
	,lastname
	,GENDER 
	,dept
	,emprating
from emp_record 
;

-- Find employees whose EMP_RATING is less than 2
select
	empid
	,FIRSTNAME
	,lastname
	,GENDER 
	,dept
	,emprating
from emp_record 
where emprating < '2'
;

-- Find employees whose EMP_RATING is greater than 4
select
	empid
	,FIRSTNAME
	,lastname
	,GENDER 
	,dept
	,emprating
from emp_record 
where emprating > '4'
;

-- Find employees whose EMP_RATING is between 2 and 4
select
	empid
	,FIRSTNAME
	,lastname
	,GENDER 
	,dept
	,emprating
from emp_record 
where emprating between '2' and '4'
;

/*--ACTION 5. Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.
	--FINDINGS:
		-- 3 EMPLOYEES: ERIC HOFFMAN, EMILY GROVE, STEVE HOFFMAN work in the FINANCE DEPT*/
select
	empid
	,concat(FIRSTNAME, ' ',lastname) as NAME
	,GENDER 
	,dept
	,emprating
from emp_record
where dept like 'FINANCE%'
;

/*-- ACTION 6. Write a query to find employees with who have someone reporting to them. Provide the number for each person (including the President).
	-- STEPS:
		-- For this action, i am querying employees who will have some "managerial" position since i am finding someone who has employees report to them.
		-- Hence, for my query i added the columns: mangerid and role and exp so that there can be visibility with the "tenure" / "caliber" of the employee.
	-- FINDINGS:
		-- From my query I was able to find a total of 8 emlpoyees with that fit the criteria of having a position where someone will report to them.
		-- 	EMPLOYEES/NAMES: PRESIDENT ARTHUR BLACK,  LEAD ERIC HOFFMAN, LEAD WILLIAM BUTLER, MANAGER PATRICK VOLTZ, MANAGER EMILY GROVE, MANAGER PETE ALLEN, MANAGER JANET HALE, MANAGER TRACY NORRIS*/


--Query:
select
	empid
	,managerid
	,role
	,concat(FIRSTNAME, ' ',lastname) as NAME
	,dept
	,exp 
	,emprating
	,gender
from emp_record
where role like 'President%' or role like 'MANAGER%' or role like '%SENIOR' or role like 'LEAD%'
group by 
	empid
	,managerid
	,role
	,NAME
	,dept
	,exp 
	,emprating
	,gender
; 

/* ACTION 7: Write a query to list all the employees from the healthcare and finance departments using UNION ALL.
	-- FINDINGS: 
		-- Queryed a total of 7 employees that fit the condition of working in either the healthcare dept or fincance dept. 
		-- 4 employees work in healthcare and 3 employees work in finance
		*/
select
	empid
	,concat(FIRSTNAME, ' ',lastname) as NAME
	,dept
from emp_record 
where dept = 'HEALTHCARE'
UNION ALL 
SELECT 
	empid
	,concat(FIRSTNAME, ' ',lastname) as NAME
	,dept
from emp_record 
where dept = 'FINANCE'
;

/*-- ACTION 8. Write a query to display each employee’s details—EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING—along with the maximum EMP_RATING in their respective department.
	-- FINDINGS:
		-- Through the window function. A new/separate column was created "max_emprating".*/
select
	EMPID 
	,concat(FIRSTNAME, ' ',lastname) as NAME
	,role
	,DEPT 
	,EMPRATING 
	,MAX(emprating) over (partition by DEPT) as max_emprating
from emp_record 
order by max_empRating desc;

/*-- ACTION 9: Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
	--FINDINGS:
		-- Junior data scientist Jenifer Jhones (1 year of experience) has the min salary of 2,800.
		-- President Arthur Black (20 years of experience) has the max salary of 16,500.
		-- I did include column: continent into the query to gain perspective on whether an employees salary or earnings can be affected by their respective continent. 
		-- And from the query, the leading earner President ARHTUR BLACK lives in NORTH AMERICA, while the lowest earner, JUNIOR DATA SCI, JENIFER JHONES lives in SOUTH AMERICA.
		-- For example, to put into perspective, $2 USD = 8,0000 columbian pesos.*/
select
	empid
	,role
	,concat(FIRSTNAME, ' ',lastname) as NAME
	,dept
	,exp 
	,continent
	,min(salary) as min_salary
	,max(SALARY) as max_salary
from emp_Record
group by 
	empid,role,name,dept,exp,continent
;

/*-- ACTION 10: Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
	--FINDINGS:
		-- I utilized a window function to create a new column using aggregate, in order to create a new column: EXPERIENCE_RANK, where i was able to create a ranking system based on the amount of work experience an employee has
		-- In my query is made sure to order/sort the experience column in descending order so that the employees with most exp can start from most exp to least exp. 
		-- Through this, I'd be able to rank from 1 to 19.
		-- PRESIDENT ARTHUR BLACK with 20 years of experience is ranked 1 and JUNIOR DATA SCIENTIST, JENIFER JHONES with 1 year of experience is ranked 19.
		-- From this query, I am able to see that there is a correlation between an employees' years of experience with their ranking.*/

select
	empid
	,role
	,concat(Firstname, ' ',lastname) as NAME
	,exp as EXPERIENCE
	,RANK() over (order by exp desc) as experience_rank
from emp_record 
group by empid,role,name,experience
;

/*-- ACTION 11: Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.
	--FINDINGS: 
		-- 12 employees out of 19 make more than six thousand, while the remaining seven employees make less than six thousand. 
		-- Commonality consists of employees with more years of experience as well as having a title/position where they are to be in charge of other employees
		-- I created view called TOP_EARNERS to simplify this query*/

create view top_earners as
select
	empid
	,role
	,concat(FIRSTNAME, ' ',lastname) as NAME
	,dept
	,exp 
	,continent
	,country
	,salary
from emp_Record
where salary >= 6000
order by exp desc
;

/*-- ACTION 12. Write a subquery to find employees with experience of more than ten years. Take data from the employee record table.
	-- FINDINGS: 
		-- From the query, 8 employees fit the criteria of having more than 10 years of experience.
		-- I performed a subquery from the previous VIEW query to retrieve a new column where experience is greater than 10*/

select 
	EMPID 
	,role
	,NAME
	,exp as EXPERIENCE
from (
select * from top_Earners 
where exp >10)
as experienced_staff
;

/* ACTION 13. Write a query using the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
	1. The standard being:
	- For an employee with experience less than or equal to 2 years, assign ‘JUNIOR DATA 		SCIENTIST’.
	- For an employee with experience of more than 2 years and up to 5 years, assign ‘ASSOCIATE DATA SCIENTIST’.
	- For an employee with experience of more than 5 years and up to 10 years, assign ‘SENIOR DATA SCIENTIST’.
	- For an employee with experience of more than 10 years and up to 12 years, assign ‘LEAD DATA SCIENTIST’.
	- For an employee with experience of more than 12 years and up to 16 years, assign ‘MANAGER’
	2. Include the AVERAGE number of years for each department.
*/

-- data checking for project_Table
select *
from project_table;

-- Case When for STANDARD TITLE query 
select 
	er.empid as EMPLOYEEID
	,er.role
	,concat(er.FIRSTNAME, ' ',er.lastname) as NAME
	,er.dept as DEPT
	,er.exp as EXPERIENCE
	,case 
	when er.exp <=2 then 'JUNIOR DATA SCIENTIST'
	WHEN er.exp <=5 then 'ASSOCIATE DATA SCIENTIST' 
	WHEN er.exp <=10 then 'SENIOR DATA SCIENTIST'
	WHEN er.exp <=12 then 'LEAD DATA SCIENTIST'
	WHEN er.exp >12 then 'MANAGER'
	else 'secret'
	end as EXP_STANDARD
from emp_record er
left join project_table pr on er.projectid = pr.projectid
ORDER BY er.exp desc
;

/*-- ADDING AVG NUMBER OF YEARS FOR EACH DEPARTMENT TO PREVIOUS QUERY
	-- Implementing window function to query the average as well as creating a separate column to display the averages*/
select 
	er.empid as EMPLOYEEID
	,er.role
	,concat(er.FIRSTNAME, ' ',er.lastname) as NAME
	,er.dept as DEPT
	,er.exp as EXPERIENCE
	,ROUND(AVG(er.exp) OVER(PARTITION BY er.dept), 2) AS DEPT_AVG_EXP
	,case 
	when er.exp <=2 then 'JUNIOR DATA SCIENTIST'
	WHEN er.exp <=5 then 'ASSOCIATE DATA SCIENTIST' 
	WHEN er.exp <=10 then 'SENIOR DATA SCIENTIST'
	WHEN er.exp <=12 then 'LEAD DATA SCIENTIST'
	WHEN er.exp >12 then 'MANAGER'
	else 'secret'
	end as EXP_STANDARD
from emp_record er
left join project_table pr on er.projectid = pr.projectid
ORDER BY er.dept, er.exp desc
;

/*ACTION 14. Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
	--FINDINGS:
		-- Using the previous query to now implement a window function/separate column to see hwo I could calculate the bonus for all employees. The bonus will be based on their rating and salary.
		-- I sorted the query based on the bonus from highest bonus to lowest bonus. Doing this allows me to see if there is any correlation between bonus amount with any other factors such as experience and rating of the employee.
	-- From the queried data, I was able to analyze that employees with more years of experience and higher employee rating were more susceptible to getting a higher bonus.
	-- For example, ARTHUR BLACK with the most amount of years experience and highest rating had the highest bonus with $41,250, while the employee that made the least bonus $1,500, KATRINA ALLEN, has only 2 year work experience.*/
select
	er.empid as EMPLOYEEID
	,concat(er.firstname,' ',er.lastname) as NAME
	,er.dept as DEPT
	,er.exp as EXPERIENCE
	,er.salary as SALARY
	,er.emprating as RATING
	,(er.salary * 0.5 * er.EMPrating) as BONUS_AMOUNT 
	,ROUND(AVG(er.exp) OVER(PARTITION BY er.dept), 2) AS DEPT_AVG_EXP
	,case 
	when er.exp <=2 then 'JUNIOR DATA SCIENTIST'
	WHEN er.exp <=5 then 'ASSOCIATE DATA SCIENTIST' 
	WHEN er.exp <=10 then 'SENIOR DATA SCIENTIST'
	WHEN er.exp <=12 then 'LEAD DATA SCIENTIST'
	WHEN er.exp >12 then 'MANAGER'
	else 'secret'
	end as EXP_STANDARD
from emp_Record er
left join project_table pr on er.projectid = pr.projectid
ORDER BY bonus_amount desc;


/*-- ACTION 15. Write a query to calculate the average salary distribution based on the continent and country.
	--FINDINGS:
		-- Included a count for the total employees to provide insight on how many employees reside in their specified country and continent.
		-- I wanted to sort the query by the average salary from most avg salary to least avg salary.
		--I was able to analyze that ASIA had the highest average salary while SOUTH AMERICA had the lowest average salary.*/
select
	er.continent as CONTINENT
	,er.country as COUNTRY
	,count(er.empid) as TOTALEMPLOYEES
	,round(avg(er.salary),2) as AVG_SALARY
	,min(er.salary) as MIN_SALARY
	,max(er.salary) as MAX_SALARY
from emp_Record er
group by er.continent, er.COUNTRY 
order by 
	er.continent ASC
	,avg_Salary desc
;

