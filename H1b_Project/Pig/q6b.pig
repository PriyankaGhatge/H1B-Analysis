h1b = load '/user/hive/warehouse/h1b_final' using PigStorage() as (s_n_no:int,case_status:chararray,emp_name:chararray,soc_name:chararray,job_title:chararray,full_time:chararray,prevailing_wage:int,year:chararray,worksite:chararray,longitude:int,latitude:int);

a = foreach h1b generate $7,$1;
b = group a by year;
c = foreach b generate group as year, COUNT(a) as Total;
d= filter a by case_status == 'CERTIFIED-WITHDRAWN';
e= group d by year;
f = foreach e generate group as year,COUNT(d) as Certified;
g = join c by $0, f by $0;
h = foreach g generate $0,$1,$3,((float)$3*100/(float)$1) as Percentage;
dump h;
