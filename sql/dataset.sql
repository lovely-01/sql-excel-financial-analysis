drop database if exists project1;
create database project1;
use project1;

drop table if exists Companies;
drop table if exists Financials;
drop table if exists Departments;
drop table if exists Department_Expenses;

create table Companies(
	company_id int primary key,
    company_name varchar(50) not null,
    industry varchar(20) not null
    );
    
create table Financials(
	company_id int,
    year int not null,
    quarter int not null,
    revenue decimal(12,2) not null,
    expenses decimal(12,2) not null,
    primary key (company_id,year,quarter),
    foreign key (company_id) references companies(company_id)
    on update cascade
    on delete cascade,
    check(quarter between 1 and 4),
    check(revenue >=0),
    check (expenses >=0)
    );
    
    create table Departments(
	dept_id int primary key,
    dept_name varchar(50) not null
    );
    
    create table Department_Expenses(
	company_id int,
    dept_id int,
    year int not null,
    quarter int not null,
    expense_amt decimal(12,2) not null,
    primary key (company_id, dept_id,year,quarter),
    foreign key (company_id) references Companies(company_id),
	foreign key (dept_id) references Departments(dept_id)
    on delete cascade
    on update cascade,
    check (quarter between 1 and 4),
    check (expense_amt >=0)
    );
    
insert into Companies (company_id,company_name,industry) values 
	(1,'TCS','IT'),
    (2,'HDFC Bank', 'Finance'),
    (3,'ITC','FMCG'),
    (4,'Byjus','EdTech'),
    (5,'Infosys','IT');
select * from Companies;

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/chatgptkafinancials.csv'
INTO TABLE Financials
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(company_id, year, quarter, revenue, expenses);
select * from Financials;

insert into Departments (dept_id, dept_name) values 
(1,'Sales'),(2,'HR'),(3,'Finance'),(4,'Audit'),(5,'Tax');
select * from Departments;

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/chatgptkadepartment_expenses.csv'
INTO TABLE Department_Expenses
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(company_id, dept_id, year, quarter, expense_amt);
select * from Department_Expenses;



