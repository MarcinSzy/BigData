

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;


insert OVERWRITE TABLE SOR.POSTLINKS PARTITION (ForumName)
select
Id, 
to_date(CreationDate)as CreationDate,   
CreationDate as CreationTS,
PostId,
RelatedPostId,
PostLinkTypeId,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
forumname   
FROM STG.POSTLINKS;
