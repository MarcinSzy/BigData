


set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

insert OVERWRITE TABLE SOR.USERS PARTITION (ForumName)
select
ID, 
Reputation,
to_date(CreationDate)as CreationDate,   
CreationDate as CreationTS, 
DisplayName, 
LastAccessDate, 
WebsiteUrl,
Location,
AboutMe, 
Views,
UpVotes,
DownVotes,
Age,
AcountId,
${hiveconf:ppn_ev_id},
forumname  
FROM STG.USERS;
