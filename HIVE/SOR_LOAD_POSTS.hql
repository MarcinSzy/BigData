
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;



insert OVERWRITE TABLE SOR.POSTS PARTITION (ForumName)
select
ID, 
PostTypeID TINY,
ParentId, 
AcceptedAnswerId,
to_date(CreationDate)as CreationDate,   
CreationDate as CreationTS,
Score,
ViewCount,
BODY, 
OwnerUserId,
LastEditorUserId,
LastEditorDisplayName, 
LastEditDate, 
LastActivityDate,
CommunityOwnedDate,
ClosedDate,
Title,
SOR.split_tags (coalesce (Tags,"") ) as Tags,
AnswerCount,
CommentCount, 
FavoriteCount,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
forumname  
FROM STG.POSTS
