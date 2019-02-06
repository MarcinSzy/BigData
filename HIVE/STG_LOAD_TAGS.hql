
 set hive.exec.dynamic.partition=true;
 set hive.exec.dynamic.partition.mode=nonstrict;
 

INSERT OVERWRITE TABLE STG.Tags PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_string(storexml, '//@TagName') as TagName,
xpath_int(storexml, '//@Count') as Count,
xpath_int(storexml, '//@ExcerptPostId') as ExcerptPostId,
xpath_int(storexml, '//@WikiPostId') as WikiPostId,
${hiveconf:ppn_ev_id} as PPN_EV_ID,
ForumName
FROM ODS.TagsXml 
;
