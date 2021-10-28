// filtrando clausulas com where com group by left join em dois selec

select A.* , B.*
from
   (selec student_num, gpa from student_record where current=1) as 1
   left join
   (selec user, max (time_stamp) as last_login
   count(*) as num_logins,
   from web_logins
   where time_stamp >= (now()-84)
   group by user) as B
   on A.student_num = B.user
   
