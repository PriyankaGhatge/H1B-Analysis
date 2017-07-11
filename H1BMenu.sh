#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}****************************************H1B APPLICATIONS*******************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest growth in applications? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4) ${MENU} Find top 5 locations in the US who have got certified visa for each year.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5) ${MENU} Which industry has the most number of Data Scientist positions?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6) ${MENU} Which top 5 employers file the most petitions each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year?${NORMAL}"
	echo -e "${MENU}**${NUMBER} 8) ${MENU} Find the most popular top 10 job positions for certified H1B visa applications for each year?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9) ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10) ${MENU} Create a bar graph to depict the number of applications for each year${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11) ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order${NORMAL}"
    echo -e "${MENU}**${NUMBER} 12) ${MENU} Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 13) ${MENU} Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 14) ${MENU}Export result for option no 12 to MySQL database.${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
clear
show_menu
	while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "1 a) Is the number of petitions with Data Engineer job title increasing over time?";
		hadoop fs -rmr /niit/h1b_result/Q1a
		hadoop jar H1b.jar Question1a /user/hive/warehouse/h1b_final /niit/h1b_result/Q1a
		hadoop fs -cat /niit/h1b_result/Q1a/p* 
        show_menu;
        ;;
        2) clear;
        option_picked "1 b) Find top 5 job titles who are having highest growth in applications. ";
        
		pig  /home/sherlock/Documents/H1b_Project/Pig/Q1b.pig
        show_menu;
        ;;  
        3) clear;
        option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
		hadoop fs -rmr /niit/h1b_result/Q2a
		hadoop jar H1b.jar Question2a /user/hive/warehouse/h1b_final /niit/h1b_result/Q2a
		hadoop fs -cat /niit/h1b_result/Q2a/p*
        show_menu;
        ;;
	    4) clear;
        option_picked "2 b) find top 5 locations in the US who have got certified visa for each year.";
        echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
	    hive -e " select h1b_final.year,h1b_final.worksite,count(h1b_final.case_status) as Count_Cases from h1b_final where 		        h1b_final.case_status='CERTIFIED' and h1b_final.year='$var' group by h1b_final.worksite,h1b_final.year order 				by Count_Cases desc limit 5;" 
        show_menu;
        ;;  
	    5) clear;
        option_picked "3) Which industry has the most number of Data Scientist positions?";
                
		hadoop fs -rmr /niit/h1b_result/Q3a
		hadoop jar H1b.jar Question3 /user/hive/warehouse/h1b_final /niit/h1b_result/Q3a
		hadoop fs -cat /niit/h1b_result/Q3a/p* 
        show_menu;
        ;;
        6) clear;
        option_picked "4)Which top 5 employers file the most petitions each year?";
		echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
	    hive -e " select h1b_final.year,h1b_final.employer_name,count(h1b_final.employer_name)as Total_Applications from 		h1b_final where h1b_final.year='$var' group by h1b_final.year, h1b_final.employer_name order by Total_Applications desc 
	limit 5;" 
        show_menu;
        ;;  
        7) clear;
        option_picked "5a) Find the most popular top 10 job positions for H1B visa applications for each year?";
	    echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
		echo "Find the most popular top 10 job positions for H1B visa applications for year '$var'?";
	    hive -e "select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='$var' 				group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10; "
        show_menu;
        ;;

	8) clear;
        option_picked "5b) Find the most popular top 10 job positions for certified H1B visa applications for each year?";
	    echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
		echo "Find the most popular top 10 job positions for H1B visa applications for year '$var'?"
	    hive -e "select h1b_final.year,h1b_final.job_title,count(job_title) as Popular from h1b_final where h1b_final.year='$var' 				and case_status='CERTIFIED' group by h1b_final.job_title,h1b_final.year order by Popular desc limit 10; ";
        show_menu;
        ;;
        9) clear;
       	
		option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.";
			echo -e "Enter the case_status (1-CERTIFIED,2-CERTIFIED-WITHDRAWN,3-WITHDRAWN,4-DENIED)";
			read n
			case "$n" in 
			"1")
			pig /home/sherlock/Documents/H1b_Project/Pig/Q6_C.pig;
        ;;

			"2")
			pig /home/sherlock/Documents/H1b_Project/Pig/Q6_CW.pig;
        ;;

			"3")
			pig /home/sherlock/Documents/H1b_Project/Pig/Q6_W.pig;
        ;;

			"4")
			pig /home/sherlock/Documents/H1b_Project/Pig/Q6_D.pig;
        ;;
		esac
		show_menu;
		;;

		10) clear;
		
		sleep 6
        option_picked "7) Create a bar graph to depict the number of applications for each year";
		 hadoop fs -rmr /niit/h1b_result/Q7/
		hadoop jar H1b.jar Question7 /user/hive/warehouse/h1b_final /niit/h1b_result/Q7
		hadoop fs -cat /niit/h1b_result/Q7/p* 
        show_menu;
        ;;
		11) clear;
        option_picked "8a) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) 		arrange output in descending order";
		echo -e "Enter the year(2011,2012,2013,2014,2015,2016)"
		read year
		echo -e "Enter the choice Full time/ Part time.(Y/N)"
		read var
        hive -e "select h1b_final.year,h1b_final.job_title,avg(h1b_final.prevailing_wage)as AVG from h1b_final where 			h1b_final.full_time_position='$var' and h1b_final.year='$year' group by h1b_final.year,h1b_final.job_title order by AVG desc;"
        show_menu;
        ;;
		12) clear;
		
		option_picked "9) Which are   employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?"
		
		pig /home/sherlock/Documents/H1b_Project/Pig/Q9.pig
        show_menu;
        ;;
		13) clear;
		
		option_picked "10) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"
		
		pig /home/sherlock/Documents/H1b_Project/Pig/Q10.pig
        show_menu;
        ;;
		14) clear;
		option_picked "11) Export result for question no 13 to MySql database."
		 mysql -u root -p'hansolo'-e 'use H1B; select * from Question10;';
        show_menu;
        ;;
		\n) exit;   
		;;
        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done

