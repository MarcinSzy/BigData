
#!/bin/sh

Job_Name=$1

arrIN=(${Job_Name//_/ })


db_name=${arrIN[0]}
table_name=${arrIN[2]}


row_cnt = $(hive -e "set hive.cli.print.header=false; select count(1) FROM $db_name.$table_name" )
ppn_ev_id = $(hive -e "set hive.cli.print.header=false; select max(ppn_ev_id)+1 as PPN_EV_ID FROM DW.PPN_EV" )

#wykonaj insert do tabeli PPN_EV


hive -hiveconf "row_cnt"="$row_cnt" -hiveconf "ppn_ev_id"="$ppn_ev_id" -hiveconf "$db_name" -hiveconf "$table_name"  -f SYS_LOAD_PPN_EV.hql


#wykonaj insert do glownej tabeli  

hive -hiveconf "ppn_ev_id"="$ppn_ev_id" -f $Job_Name.hql


#update tabeli PPN_EV_ID 


hive -hiveconf "row_cnt"="$row_cnt" -hiveconf "ppn_ev_id"="$ppn_ev_id"-f SYS_UPDATE_PPN_EV.hql

