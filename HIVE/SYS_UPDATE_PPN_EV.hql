SET hive.enforce.bucketing=true;

UPDATE SYS.PPN_EV 
SET 
loading_stop_ts = current_timestamp(),
rows_in_table_after=${hiveconf:row_cnt}
where PPN_EV_ID=${hiveconf:ppn_ev_id}
; 
