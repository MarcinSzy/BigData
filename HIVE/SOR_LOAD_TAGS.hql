
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;


insert OVERWRITE TABLE SOR.TAGS PARTITION (ForumName)
select
Id, 
TagName, 
COUNT, 
ExcerptPostId,
WikiPostId,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName   
FROM STG.TAGS;
