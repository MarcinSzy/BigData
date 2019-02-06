set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

 
insert OVERWRITE TABLE SOR.COMMENTS PARTITION (ForumName)
select 
Id,
PostId,
Score,
Text,
to_date(CreationDate) as CreationDate,    
CreationDate as CreationTS,
UserId,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
forumname
FROM STG.COMMENTS;
