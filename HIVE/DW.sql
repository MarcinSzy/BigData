/*
1. Doprecyzowac typy danych 
2. Doppecyzowac skladnie ddl 
3. Sprawdzić jeszcze raz zawartość danych w plikach 
2. Stworzyc tabele słownikowe razem z insertami zasulającymi tabele 
*/


create database IF NOT EXISTS DW;

create table IF NOT EXISTS DW.PPN_EC
(
PPN_EV_ID INT, 
LOADING_DATE DATE, 
TABLE_NAME STRING,
SCHEMA_NAME STRING
)

create table  IF NOT EXISTS DW.BADGES
(
 
 UserId INT, 
 Name STRING, 
 CreationDate TIMESTAMP,  
 Class  INT, 
 TagBased BOOLEAN

)
COMMENT 'This is the Badges  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;


create table  IF NOT EXISTS DW.COMMENTS 
(
 Id INT, 
 PostId INT, 
 Score INT, 
 Text STRING,
 CreationDate TIMESTAMP,
 UserId INT

)
COMMENT 'This is the Comments  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;


CREATE TABLE  IF NOT EXISTS DW.POSTS
(
ID INT, 
PostTypeID TINYINT,
ParentId INT, 
AcceptedAnswerId INT,
CreationDate TIMESTAMP,
Score  INT,
ViewCount INT,
BODY STRING, 
OwnerUserId INT,
LastEditorUserId INT,
LastEditorDisplayName STRING, 
LastEditDate TIMESTAMP, 
LastActivityDate TIMESTAMP,
CommunityOwnedDate TIMESTAMP,
ClosedDate TIMESTAMP,
Title STRING,
Tags ARRAY<STRING>,
AnswerCount INT,
CommentCount INT, 
FavoriteCount INT
)
COMMENT 'This is the POSTS  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;

CREATE TABLE  IF NOT EXISTS DW.POSTHISTORY 
(
Id INT, 
PostHistoryTypeId TINYINT,
PostId INT,
RevisionGUID STRING,
CreationDate TIMESTAMP,
UserId  INT,
UserDisplayName STRING,
CommentText STRING COMMENT 'If PostHistoryTypeId = 10, 11, 12, 13, 14, or 15  this column will contain a JSON encoded string with all users who have voted for the PostHistoryTypeId  If PostHistoryTypeId = 17 this column will contain migration details of either "from <url>" or "to <url>"', 
Text STRING,
CloseReasonId TINYINT
 
)
COMMENT 'This is the POSTHISTORY  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;

create table  IF NOT EXISTS  DW.POSTLINKS 
(
Id INT, 
CreationDate TIMESTAMP, 
PostId INT,
RelatedPostId INT,
PostLinkTypeId TINYINT

)
COMMENT 'This is the POSTLINKS  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;




create table  IF NOT EXISTS DW.TAGS
(
 Id INT, 
 TagName STRING, 
 COUNT INT, 
 ExcerptPostId INT,
 WikiPostId INT

)
COMMENT 'This is the TAGS  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;


create table IF NOT EXISTS  DW.USERS
(
ID INT, 
Reputation INT , 
CreationDate TIMESTAMP, 
DisplayName STRING, 
LastAccessDate TIMESTAMP, 
WebsiteUrl STRING,
Location STRING,
AboutMe STRING, 
Views INT ,
UpVotes INT,
DownVotes INT,
ProfileImageUrl STRING,
AccountId INT

) 
COMMENT 'This is the USERS  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;




CREATE  TABLE IF NOT EXISTS  DW.Dictionary (
 code INT,
 name STRING,
 Type STRING, 
 Description STRING	hive 

) 
STORED AS  ORC; 

















