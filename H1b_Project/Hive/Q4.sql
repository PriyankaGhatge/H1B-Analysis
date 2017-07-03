--Which top 5 employers file the most petitions each year? - Case Status - ALL

select h1b_final.year,h1b_final.employer_name,count(h1b_final.employer_name)as Total_Applications from h1b_final where h1b_final.year='2011' group by h1b_final.year, h1b_final.employer_name order by Total_Applications desc limit 5;

select h1b_final.year,h1b_final.employer_name,count(h1b_final.employer_name)as Total_Applications from h1b_final where h1b_final.year='2012' group by h1b_final.year, h1b_final.employer_name order by Total_Applications desc limit 5;

select h1b_final.year,h1b_final.employer_name,count(h1b_final.employer_name)as Total_Applications from h1b_final where h1b_final.year='2013' group by h1b_final.year, h1b_final.employer_name order by Total_Applications desc limit 5;

select h1b_final.year,h1b_final.employer_name,count(h1b_final.employer_name)as Total_Applications from h1b_final where h1b_final.year='2014' group by h1b_final.year, h1b_final.employer_name order by Total_Applications desc limit 5;

select h1b_final.year,h1b_final.employer_name,count(h1b_final.employer_name)as Total_Applications from h1b_final where h1b_final.year='2015' group by h1b_final.year, h1b_final.employer_name order by Total_Applications desc limit 5;

select h1b_final.year,h1b_final.employer_name,count(h1b_final.employer_name)as Total_Applications from h1b_final where h1b_final.year='2016' group by h1b_final.year, h1b_final.employer_name order by Total_Applications desc limit 5;
