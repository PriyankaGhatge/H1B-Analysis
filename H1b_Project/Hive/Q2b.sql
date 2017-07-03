--Find top 5 locations in the US who have got certified visa for each year.

select year,worksite,count(case_status) as Count_Cases from h1b_final where case_status='CERTIFIED' and year='2011' group by worksite,year order by Count_Cases desc limit 5;

select year,worksite,count(case_status) as Count_Cases from h1b_final where case_status='CERTIFIED' and year='2012' group by worksite,year order by Count_Cases desc limit 5;

select year,worksite,count(case_status) as Count_Cases from h1b_final where case_status='CERTIFIED' and year='2013' group by worksite,year order by Count_Cases desc limit 5;

select year,worksite,count(case_status) as Count_Cases from h1b_final where case_status='CERTIFIED' and year='2014' group by worksite,year order by Count_Cases desc limit 5;

select year,worksite,count(case_status) as Count_Cases from h1b_final where case_status='CERTIFIED' and year='2015' group by worksite,year order by Count_Cases desc limit 5;

select year,worksite,count(case_status) as Count_Cases from h1b_final where case_status='CERTIFIED' and year='2016' group by worksite,year order by Count_Cases desc limit 5;

