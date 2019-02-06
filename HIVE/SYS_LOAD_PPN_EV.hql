
SET hive.enforce.bucketing=true;
 
insert into SYS.PPN_EV
select  
${hiveconf:ppn_ev_id},
current_timestamp(),
current_timestamp(), 
'${hiveconf:row_cnt}',
null,
'${hiveconf:db_name}',
'${hiveconf:table_name}'
from (select '123')x
  ;
