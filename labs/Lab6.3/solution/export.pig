--export.pig: transforms visits.txt for a Hive table

visits = LOAD '/user/root/whitehouse/visits.txt' USING PigStorage(',');

not_congress = FILTER visits BY (NOT($25 MATCHES '.* CONGRESS .*')) OR ($25 IS NULL);

project_not_congress = FOREACH not_congress GENERATE
   $0 AS lname:chararray,
   $1 AS fname:chararray, 
   $2 AS middle:chararray, 
   $6 AS time_of_arrival:chararray, 
   $11 AS appt_scheduled_time:chararray, 
   $19 AS visitee_lname:chararray, 
   $20 AS visitee_fname:chararray, 
   $21 AS location:chararray, 
   $25 AS comment:chararray ;


STORE project_not_congress INTO 'project_not_congress';

