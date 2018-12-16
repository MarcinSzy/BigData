

 set hive.exec.dynamic.partition=true;
 set hive.exec.dynamic.partition.mode=nonstrict;
 
 
INSERT OVERWRITE  TABLE stg.Badges PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_string(storexml, '//@UserId') as TagName,
xpath_string(storexml, '//@Name') as Name,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@Date') , "yyyy-MM-dd'T'HH:mm:ss.SSS"))   as CreationDate,
xpath_int(storexml, '//@Class') as Class,
xpath_string(storexml, '//@TagBased') as TagBased,
ForumName 
FROM ODS.BadgesXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;


INSERT OVERWRITE TABLE stg.Posts PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_int(storexml, '//@PostTypeID') as PostTypeID,
xpath_int(storexml, '//@ParentId') as ParentId,
xpath_int(storexml, '//@AcceptedAnswerId') as AcceptedAnswerId,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CreationDate,
xpath_int(storexml, '//@Score') as Score,
xpath_int(storexml, '//@ViewCount') as ViewCount,
xpath_string(storexml, '//@Body') as BODY,
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
ForumName
FROM ODS.PostsXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;


INSERT OVERWRITE TABLE stg.POSTHISTORY PARTITION (ForumName)
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
ForumName
FROM ODS.POSTHISTORYXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;

INSERT OVERWRITE  TABLE stg.POSTLINKS PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_string(storexml, '//@CreationDate') as CreationDate,
xpath_int(storexml, '//@PostId') as PostId,
xpath_string(storexml, '//@RelatedPostId') as RelatedPostId,
xpath_int(storexml, '//@PostLinkTypeId') as PostLinkTypeId,
ForumName 
FROM ODS.POSTLINKSXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;
 


INSERT OVERWRITE TABLE stg.Tags PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_string(storexml, '//@TagName') as TagName,
xpath_int(storexml, '//@Count') as Count,
xpath_int(storexml, '//@ExcerptPostId') as ExcerptPostId,
xpath_int(storexml, '//@WikiPostId') as WikiPostId,
ForumName
FROM ODS.TagsXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;




INSERT OVERWRITE  TABLE stg.USERS PARTITION (ForumName)
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
ForumName 
FROM ODS.UserSXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;


INSERT OVERWRITE  TABLE stg.Votes PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_int(storexml, '//@PostId') as PostId,
xpath_int(storexml, '//@VoteTypeId') as VoteTypeID,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CreationDate,
xpath_int(storexml, '//@UserID') as UserID,
xpath_int(storexml, '//@BountyAmount') as BountyAmount,
ForumName 
FROM ODS.VotesXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;


INSERT OVERWRITE  TABLE stg.Comments PARTITION (ForumName)
select 
xpath_int(storexml, '//@Id') as Id,
xpath_int(storexml, '//@PostId') as PostId,
xpath_int(storexml, '//@Score') as Score,
from_unixtime(unix_timestamp(xpath_string(storexml, '//@CreationDate') , "yyyy-MM-dd'T'HH:mm:ss.SSS")) as CreationDate,
xpath_int(storexml, '//@UserID') as UserID,
xpath_string(storexml, '//@Text') as Text,
ForumName 
FROM ODS.VotesXml 
where regexp_extract(storexml, '<row', 0) = '<row'
;



