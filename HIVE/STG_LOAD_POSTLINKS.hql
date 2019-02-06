INSERT OVERWRITE  TABLE STG.POSTLINKS PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_string(storexml, '//@CreationDate') as CreationDate,
xpath_int(storexml, '//@PostId') as PostId,
xpath_string(storexml, '//@RelatedPostId') as RelatedPostId,
xpath_int(storexml, '//@PostLinkTypeId') as PostLinkTypeId,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName 
FROM ODS.POSTLINKSXml 
;
