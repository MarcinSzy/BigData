

INSERT OVERWRITE  TABLE STG.Votes PARTITION (ForumName)
select

CASE 
	WHEN  xpath_int( storexml, '//@Id') = '-10101' THEN  NULL 
	ELSE  xpath_int( storexml, '//@Id')
END as Id,

CASE 
	WHEN  xpath_int(storexml, '//@PostId')  = '-10101' THEN  NULL 
	ELSE  xpath_int(storexml, '//@PostId') 
END as PostId,

CASE 
	WHEN  xpath_int(storexml, '//@VoteTypeId')  = '-10101' THEN  NULL 
	ELSE  xpath_int(storexml, '//@VoteTypeId') 
END as VoteTypeId,

CASE 
	WHEN xpath_string(storexml, '//@CreationDate')  = '-10101' THEN  NULL 
	ELSE  from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS"))
END as CreationDate,

CASE 
	WHEN  xpath_int(storexml, '//@UserId') = '-10101' THEN  NULL 
	ELSE  xpath_int(storexml, '//@UserId')
END as UserID,

CASE 
	WHEN  xpath_int(storexml, "//@BountyAmount") = '-10101' THEN  NULL 
	ELSE  xpath_int(storexml, "//@BountyAmount")
END as BountyAmount,
${hiveconf:ppn_ev_id}  as PPN_EV_ID,
Forumname
FROM ODS_V.Votesxml 
;

