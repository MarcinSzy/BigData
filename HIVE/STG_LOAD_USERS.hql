

 set hive.exec.dynamic.partition=true;
 set hive.exec.dynamic.partition.mode=nonstrict;
 


INSERT OVERWRITE  TABLE STG.USERS PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_string(storexml, '//@Reputation') as Reputation,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CreationDate,
xpath_string(storexml, '//@DisplayName') as DisplayName,
xpath_string(storexml, '//@LastAccessDate') as LastAccessDate,
xpath_string(storexml, '//@WebsiteUrl') as WebsiteUrl,
xpath_string(storexml, '//@Location') as Location,
xpath_string(storexml, '//@AboutMe') as AboutMe,
xpath_int(storexml, '//@Views') as Views,
xpath_int(storexml, '//@UpVotes') as UpVotes,
xpath_int(storexml, '//@DownVotes') as DownVotes,
xpath_string(storexml, '//@ProfileImageUrl') as ProfileImageUrl,
xpath_int(storexml, '//@AccountId') as AccountId,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName 
FROM ODS.UserSXml 
