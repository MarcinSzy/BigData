


create database IF NOT EXISTS ${hiveconf:DB_NAME};




create table IF NOT EXISTS ${hiveconf:DB_NAME}.BADGES
(
 Id INT,
 UserId INT ,
 Name STRING ,
 CreationDate DATE, 
 CreationTS TIMESTAMP ,
 Class  INT ,
 TagBased BOOLEAN,
 PPN_EV_ID INT

)
COMMENT 'This is the Badges  table'
PARTITIONED BY(ForumName STRING)
STORED AS PARQUET;


create table  IF NOT EXISTS ${hiveconf:DB_NAME}.COMMENTS 
(
 Id INT,
 PostId INT,
 Score INT,
 Text STRING,
 CreationDate DATE, 
 CreationTS TIMESTAMP,
 UserId INT,
 PPN_EV_ID INT

)
COMMENT 'This is the Comments  table'
PARTITIONED BY(ForumName STRING)
STORED AS PARQUET;


CREATE TABLE  IF NOT EXISTS ${hiveconf:DB_NAME}.POSTS
(
ID INT, 
PostTypeID TINYINT,
ParentId INT, 
AcceptedAnswerId INT,
CreationDate DATE, 
CreationTS TIMESTAMP,
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
FavoriteCount INT,
PPN_EV_ID INT
)
COMMENT 'This is the POSTS  table'
PARTITIONED BY(ForumName STRING)
STORED AS PARQUET;

CREATE TABLE  IF NOT EXISTS ${hiveconf:DB_NAME}.POSTHISTORY 
(
Id INT, 
PostHistoryTypeId TINYINT,
PostId INT,
RevisionGUID STRING,
CreationDate Date, 
CreationTS TIMESTAMP,
UserId  INT,
UserDisplayName STRING,
CommentText STRING COMMENT, 
Text STRING,
CloseReasonId TINYINT,
PPN_EV_ID INT 
)
COMMENT 'This is the POSTHISTORY  table'
PARTITIONED BY(ForumName STRING)
STORED AS PARQUET;

create table  IF NOT EXISTS  ${hiveconf:DB_NAME}.POSTLINKS 
(
Id INT, 
CreationDate DATE,
CreationTS TIMESTAMP, 
PostId INT,
RelatedPostId INT,
PostLinkTypeId TINYINT,
PPN_EV_ID INT 
)
COMMENT 'This is the POSTLINKS  table'
PARTITIONED BY(ForumName STRING)
STORED AS PARQUET;




create table  IF NOT EXISTS ${hiveconf:DB_NAME}.TAGS
(
 Id INT, 
 TagName STRING, 
 COUNT INT, 
 ExcerptPostId INT,
 WikiPostId INT,
 PPN_EV_ID INT 
)
COMMENT 'This is the TAGS table'
PARTITIONED BY(ForumName STRING)
STORED AS PARQUET;


create table IF NOT EXISTS  ${hiveconf:DB_NAME}.USERS
(
ID INT, 
Reputation INT ,
CreationDate DATE,  
CreationTS TIMESTAMP, 
DisplayName STRING, 
LastAccessDate TIMESTAMP, 
WebsiteUrl STRING,
Location STRING,
AboutMe STRING, 
Views INT ,
UpVotes INT,
DownVotes INT,
Age INT,
AccountId INT,
PPN_EV_ID INT 
) 
COMMENT 'This is the USERS  table'
PARTITIONED BY(ForumName STRING)
STORED AS SEQUENCEFILE;



create table  IF NOT EXISTS ${hiveconf:DB_NAME}.VOTES
(
Id INT,
PostId INT,
VoteTypeID TINYINT,
CreationDate DATE,
CreationTS TIMESTAMP,
UserID INT,
BountyAmount INT,
PPN_EV_ID INT
)
COMMENT 'This is the VOTES  table'
PARTITIONED BY(ForumName STRING )
STORED AS PARQUET;




CREATE  TABLE IF NOT EXISTS  ${hiveconf:DB_NAME}.Dictionary (
 code INT,
 name STRING,
 Type STRING, 
 Description STRING,
 PPN_EV_ID INT
) 
STORED AS  ORC; 
























