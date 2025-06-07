--CTE---COMMON TABLE EXPRESSIONS  BINA TABLE K QUERIES RUN KRNA AS A VIEW --temporary tables
--jab tak query chlti h tab tk ye table hota h database me nhi hota
--complex quriies k liye use krte hai
--CTEs me alias names krna compulsary hai

select 100
union 
select 100
--duplicate eliminate kr degaa

select 100
union all 
select 100
--union all duplicate eliminate ni krtaa

With table1 as(
select od.Region, Sales, pp.person
from Orders$ od
join People$ pp on pp.Region=od.Region
)
select * from table1



select [Row ID],
Sales,
[Order Date],
YEAR([Order Date]) years_,
month([Order Date]) months_,
DAY([Order Date]) days_,
DATEFROMPARTS(YEAR([Order Date]),month([Order Date]),DAY([Order Date])) calculated_date,
EOMONTH([Order Date],0) end_of_month,
DATEADD(D,1,EOMONTH([Order Date],-1)) start_of_month,
CONVERT(int,CONVERT(datetime,[Order Date])) converted_date
from Orders$


select
format(EOMONTH([Order Date],0),'MMM-yy') dates,
SUM(Sales),
count(1)
from Orders$
group by EOMONTH([Order Date],0)
order by EOMONTH([Order Date],0)

select distinct
EOMONTH([Order Date],0) dates,
SUM(Sales) over(order by EOMONTH([Order Date],0)) running_total
from Orders$
order by EOMONTH([Order Date],0)

--SQL me OVER clause ka use aggregate functions (jaise SUM(), AVG(), COUNT(), RANK() etc.) ke sath kiya jata hai, lekin bina GROUP BY lagaye, har row ke upar result dikhane ke liye.

--🔍 Simple Definition:
--OVER clause ka matlab hota hai:
--"Ye function har row ke liye chalega, aur window (ya group) define karne ke liye ye condition use hogi."
--eg--Har employee ki row ke sath ek extra column dikhayega jisme poore table ka total salary hoga.

--Running total ka matlab hota hai:
--Ek row tak jitna bhi total ban chuka hai, uska total dikhana.

select distinct
EOMONTH([Order Date],0) dates,
SUM(Sales) over(order by EOMONTH([Order Date],0)) running_total,
sum(sales)
from Orders$
order by EOMONTH([Order Date],0)

--using cte --tables made inside a query

--with table1 as(
--select 
--EOMONTH([Order Date],0) dates_,
--SUM(Sales) tot_sales
--from Orders$
--group by EOMONTH([Order Date],0)
--)

--alias wale naam use krungi directly kyoki table1 bn chuka hai,,, mujhe original table me columns k naam ni ptaa
--select 
--dates_,
--tot_sales,
--sum(tot_sales) over (order by dates_)
--from table1

--with table2 as (
--select 
--Segment, 
--COUNT(1) cnt_,
--sum(Sales) tot_sales
--from Orders$
--group by Segment
--)

with tot as (
select 'Total' Segment_, COUNT(1) cnt_,1.00 Perc, SUM(Sales) tot_sales 
from Orders$
)
select
Segment,
COUNT(1) cntt_,
--(COUNT(1)*1.100)/cnt_perc,
sum(Sales) sales_tot,
tot.Segment_,
tot.cnt_,
tot.Perc,
tot.tot_sales
from Orders$,tot
group by Segment,tot.Segment_,
tot.cnt_,
tot.Perc,
tot.tot_sales

--Creating Views for Reusability
CREATE VIEW MonthlySalesView AS
SELECT 
  FORMAT(EOMONTH([Order Date], 0), 'MMM-yyyy') AS month_,
  SUM(Sales) AS total_sales
FROM Orders$
GROUP BY EOMONTH([Order Date], 0);

--Optimizing through indexes
CREATE INDEX idx_region ON Orders$(Region);
CREATE INDEX idx_order_date ON Orders$([Order Date]);
