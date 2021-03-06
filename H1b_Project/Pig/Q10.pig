h1b = load '/user/hive/warehouse/h1b_final' using PigStorage('\t') as (s_n_no:int,case_status:chararray,emp_name:chararray,soc_name:chararray,job_title:chararray,full_time:chararray,prevailing_wage:int,year:chararray,worksite:chararray,longitude:int,latitude:int);

a = foreach h1b generate job_title,case_status;
b = filter a by case_status == 'CERTIFIED-WITHDRAWN';
c = filter a by case_status == 'CERTIFIED';
d = group a by job_title;
e = group c by job_title;
f = group b by job_title;
g = foreach d generate group as Job_Position, COUNT(a) as cnt;
h = foreach e generate group as Job_Position, COUNT(c) as cnt;
i = foreach f generate group as Job_Position, COUNT(b) as cnt;
j = join g by $0,h by $0,i by $0;
k = foreach j generate $0,$1,($3+$5);
l = foreach k generate $0,$1,((float)$2*100/(float)$1)as l;
m = filter l by $1>1000 and $2>70.0;
n = order m by $2 desc;
dump n;
