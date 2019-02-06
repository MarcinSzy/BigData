
 set hive.exec.dynamic.partition=true;
 set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE STG.Posts PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_int(storexml, '//@PostTypeID') as PostTypeID,
xpath_int(storexml, '//@ParentId') as ParentId,
xpath_int(storexml, '//@AcceptedAnswerId') as AcceptedAnswerId,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CreationDate,
xpath_int(storexml, '//@Score') as Score,
xpath_int(storexml, '//@ViewCount') as ViewCount,
regexp_replace ( xpath_string(storexml, '//@Body') ,"<[^>]+>", ' ' ) as BODY,
xpath_int(storexml, '//@OwnerUserId') as OwnerUserId,
xpath_int(storexml, '//@LastEditorUserId') as LastEditorUserId,
xpath_string(storexml, '//@LastEditorDisplayName') as LastEditorDisplayName,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@LastEditDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as LastEditDate, 
from_unixtime(unix_timestamp(xpath_string(storexml, '//@LastActivityDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as LastActivityDate, 
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CommunityOwnedDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CommunityOwnedDate, 
from_unixtime(unix_timestamp(xpath_string(storexml, '//@ClosedDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS"))  as ClosedDate,
xpath_string(storexml, '//@Title') as Title,
xpath_string(storexml, '//@Tags') as Tags,
xpath_int(storexml, '//@AnswerCount') as AnswerCount,
xpath_int(storexml, '//@CommentCount') as CommentCount,
xpath_int(storexml, '//@FavoriteCount') as FavoriteCount,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName
FROM ODS.PostsXml 
;
