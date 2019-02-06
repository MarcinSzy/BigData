

 set hive.exec.dynamic.partition=true;
 set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE  TABLE STG.Comments PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_int(storexml, '//@PostId') as PostId,
xpath_int(storexml, '//@Score') as Score,
xpath_string(storexml, '//@Text') as Text,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CreationDate,
xpath_int(storexml, '//@UserId') as UserID,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName
FROM ODS.CommentsXml 
;
