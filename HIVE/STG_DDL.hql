
create database IF NOT EXISTS ${hiveconf:DB_NAME};

use ${hiveconf:DB_NAME};

create table IF NOT EXISTS ${hiveconf:DB_NAME}.BADGES
(
 Id INT, 
 UserId INT ,
 Name STRING ,
 CreationDate TIMESTAMP , 
 Class  INT ,
 TagBased BOOLEAN, 
 PPN_EV_ID INT
)
COMMENT 'This is the Badges  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;

create table  IF NOT EXISTS ${hiveconf:DB_NAME}.COMMENTS
(
 Id INT, 
 PostId INT, 
 Score INT, 
 Text STRING,
 CreationDate TIMESTAMP,
 UserId INT,
 PPN_EV_ID INT
)
COMMENT 'This is the Comments  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;


CREATE TABLE  IF NOT EXISTS  ${hiveconf:DB_NAME}.POSTS
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
Tags STRING,
AnswerCount INT,
CommentCount INT, 
FavoriteCount INT,
PPN_EV_ID INT
)
COMMENT 'This is the POSTS  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;

CREATE TABLE  IF NOT EXISTS ${hiveconf:DB_NAME}.POSTHISTORY 
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
CloseReasonId TINYINT,
PPN_EV_ID INT 
)
COMMENT 'This is the POSTHISTORY  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;


create table  IF NOT EXISTS ${hiveconf:DB_NAME}.POSTLINKS 
(
Id INT, 
CreationDate TIMESTAMP, 
PostId INT,
RelatedPostId INT,
PostLinkTypeId TINYINT,
PPN_EV_ID INT 
)
COMMENT 'This is the POSTLINKS  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;



create table IF NOT EXISTS ${hiveconf:DB_NAME}.TAGS 
(
 Id INT, 
 TagName STRING, 
 COUNT INT, 
 ExcerptPostId INT,
 WikiPostId INT,
 PPN_EV_ID INT 
)
COMMENT 'This is the TAGS  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;



create table  IF NOT EXISTS ${hiveconf:DB_NAME}.USERS
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
AccountId INT,
PPN_EV_ID INT 
) 
COMMENT 'This is the USERS  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;




create table  IF NOT EXISTS ${hiveconf:DB_NAME}.VOTES
(
Id INT, 
PostId INT,
VoteTypeID TINYINT,
CreationDate TIMESTAMP,
UserID INT,
BountyAmount INT,
PPN_EV_ID INT
) 
COMMENT 'This is the VOTES  table'
PARTITIONED BY(ForumName STRING )
STORED AS ORC;


















