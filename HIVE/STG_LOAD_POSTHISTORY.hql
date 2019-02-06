
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict

INSERT OVERWRITE TABLE STG.POSTHISTORY PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_int(storexml, '//@PostHistoryTypeId') as PostHistoryTypeId,
xpath_int(storexml, '//@PostId') as PostId,
xpath_string(storexml, '//@RevisionGUID') as RevisionGUID,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CreationDate,
xpath_int(storexml, '//@UserId') as UserId,
xpath_string(storexml, '//@UserDisplayName') as UserDisplayName,
xpath_string(storexml, '//@CommentText') as CommentText,
xpath_string(storexml, '//@Text') as Text,
xpath_int(storexml, '//@CloseReasonId') as CloseReasonId,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName
FROM ODS.POSTHISTORYXml 
         
