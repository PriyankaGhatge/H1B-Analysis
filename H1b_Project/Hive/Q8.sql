
--Q8]Find the average Prevailing Wage for each Job for each Year (take part time and full time separate). Arrange the output in descending order.

--Full Time Position

insert overwrite directory '/user/hive/warehouse/h1b_8/8a_2011' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='Y' and h1b_final.year='2011' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8a_2012' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='Y' and h1b_final.year='2012' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8a_2013' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='Y' and h1b_final.year='2013' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8a_2014' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='Y' and h1b_final.year='2014' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8a_2015' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='Y' and h1b_final.year='2015' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8a_2016' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='Y' and h1b_final.year='2016' group by h1b_final.year,h1b_final.job_title order by AVG desc;

--Part Time Position

insert overwrite directory '/user/hive/warehouse/h1b_8/8b_2011' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='N' and h1b_final.year='2011' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8b_2012' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='N' and h1b_final.year='2012' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8b_2013' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='N' and h1b_final.year='2013' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8b_2014' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='N' and h1b_final.year='2014' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8b_2015' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='N' and h1b_final.year='2015' group by h1b_final.year,h1b_final.job_title order by AVG desc;

insert overwrite directory '/user/hive/warehouse/h1b_8/8b_2016' select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where h1b_final.full_time_position='N' and h1b_final.year='2016' group by h1b_final.year,h1b_final.job_title order by AVG desc;






