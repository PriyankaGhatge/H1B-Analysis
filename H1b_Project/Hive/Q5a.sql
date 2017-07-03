--Find the most popular top 10 job positions for H1B visa applications for each year?
--a) for all the applications

select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='2011' group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10;

select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='2012' group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10;

select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='2013' group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10;

select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='2014' group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10;

select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='2015' group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10;

select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='2016' group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10;
