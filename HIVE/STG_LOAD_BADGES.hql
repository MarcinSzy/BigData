
	
 set hive.exec.dynamic.partition=true;
 set hive.exec.dynamic.partition.mode=nonstrict;
 
 
INSERT OVERWRITE  TABLE STG.Badges PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_string(storexml, '//@UserId') as TagName,
xpath_string(storexml, '//@Name') as Name,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@Date') , "yyyy-MM-dd'T'HH:mm:ss.SSS"))   as CreationDate,
xpath_int(storexml, '//@Class') as Class,
xpath_string(storexml, '//@TagBased') as TagBased,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName 
FROM ODS.BadgesXml
;
