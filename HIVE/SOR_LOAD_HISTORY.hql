set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;


insert OVERWRITE TABLE SOR.POSTHISTORY PARTITION (ForumName)
select
Id, 
PostHistoryTypeId,
PostId,
RevisionGUID,
to_date(CreationDate)as CreationDate,   
CreationDate as CreationTS,
UserId,
UserDisplayName,
CommentText,
Text,  
CloseReasonId,
${hiveconf:ppn_ev_id},
forumname
FROM STG.POSTHISTORY;
