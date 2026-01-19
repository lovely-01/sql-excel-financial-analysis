/* TOTAL PROFIT PER COMPANY PER YEAR*/

select 
c.company_name, f.year, sum((f.revenue-f.expenses)) as profit
from companies as c 
join financials as f 
on c.company_id=f.company_id
group by c.company_name,f.year;


/*TOP 3 COMPANIES BY TOTAL PROFIT (ALL YEARS COMBINED)*/

select 
c.company_name, sum((f.revenue-f.expenses)) as total_profit
from companies as c 
join financials as f 
on c.company_id=f.company_id 
group by c.company_name
order by sum((f.revenue-f.expenses)) desc limit 3;


/*YEAR OVER YEAR GROWTH PER COMPANY*/

select 
c.company_name, year,
sum(f.revenue-f.expenses)- lag(sum(f.revenue-f.expenses)) over (partition by company_name order by year) as YOY_growth 
from Companies as c 
join financials as f
on c.company_id=f.company_id
group by c.company_name,f.year;


/*BEST PERFORMING QUARTER FOR EACH COMPANY*/

select company_name, quarter, total_revenue from 
(select 
c.company_name, f.quarter, rank() over (partition by c.company_name order by sum(f.revenue) desc) as rnk, sum(f.revenue) as total_revenue
from companies as c 
join financials as f 
on c.company_id=f.company_id
group by f.quarter, c.company_name) as t
where rnk=1;


/*FIND DEPARTMENT WITH HIGHEST EXPENSE PER COMPANY*/

select company_name, dept_name, total_exp
from (select c.company_name, d.dept_name, rank() over (partition by c.company_name order by sum(de.expense_amt) desc) as rnk, sum(de.expense_amt) as total_exp
from companies as c
join department_expenses as de
on c.company_id=de.company_id
join departments as d
on d.dept_id=de.dept_id
group by c.company_name, d.dept_name) as t
where rnk=1;


/*FIND THE COMPANIES THAT MADE LOSS FOR 2 CONSECUTIVE YEARS*/

select company_name, year, year1 , profit as loss from
(select c.company_name, sum(f.revenue-f.expenses) as profit, f.year,
lag(sum(f.revenue-f.expenses)) over (partition by c.company_name order by f.year ) as prev_profit,
lag (f.year) over (partition by c.company_name order by f.year) as year1
from companies as c 
join financials as f 
on c.company_id=f.company_id
group by c.company_name, f.year) as t
where profit<0 and prev_profit<0;


/* WHICH COMPANY IS MOST COST EFFICIENT*/

select c.company_name, sum(f.expenses)/sum(f.revenue) as efficiency
from companies as c 
join financials as f
on c.company_id=f.company_id
group by company_name
order by efficiency asc;

