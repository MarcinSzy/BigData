

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

insert OVERWRITE TABLE SOR.VOTES PARTITION (ForumName)
select
Id,
PostId,
VoteTypeID,
to_date(CreationDate)as CreationDate,   
CreationDate as CreationTS, 
UserID,
BountyAmount,
${hiveconf:ppn_ev_id},
forumname
FROM STG.VOTES; 
