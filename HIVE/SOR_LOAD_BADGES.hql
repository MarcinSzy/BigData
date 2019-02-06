

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;


insert OVERWRITE TABLE SOR.BADGES PARTITION (ForumName)
select 
Id,
UserId,
Name,
to_date(CreationDate)as CreationDate,   
CreationDate as CreationTS,
Class,
TagBased,
PPN_EV_ID ,
forumname
FROM STG.BADGES;
