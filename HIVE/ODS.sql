/*

ODS - Operating Data Stage 
temporary form of data that are loaded regulary  
Keeps XMLs files 
*/

/*
To create catalog for data dictionary 
nano /home/DW/DataLake/Dictionary
hdfs dfs -put /home/DW/DataLake/Dictionary  /user/DW/DataLake/Dictionary
*/

create database IF NOT EXISTS ODS;


CREATE EXTERNAL TABLE IF NOT EXISTS ODS.Dictionary (
 code INT,
 name STRING,
 Type STRING, 
 Description STRING							 
) 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/Dictionary'
; 


CREATE EXTERNAL TABLE IF NOT EXISTS ODS.TagsXml (storexml string) PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/Tags'
;
ALTER TABLE ods.TagsXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.TagsXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';

CREATE EXTERNAL TABLE IF NOT EXISTS ODS.BadgesXml (storexml string)  PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/Badges'
;
ALTER TABLE ods.BadgesXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.BadgesXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';

CREATE EXTERNAL TABLE IF NOT EXISTS ODS.CommentsXml (storexml string)  PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/Comments'
;
ALTER TABLE ods.CommentsXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.CommentsXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';


CREATE EXTERNAL TABLE IF NOT EXISTS ODS.POSTSXml (storexml string)  PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/Posts'
;
ALTER TABLE ods.POSTSXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.POSTSXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';

CREATE EXTERNAL TABLE IF NOT EXISTS ODS.POSTHISTORYXml (storexml string)   PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/PostHistory'
;
ALTER TABLE ods.POSTHISTORYXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.POSTHISTORYXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';

CREATE EXTERNAL TABLE IF NOT EXISTS ODS.POSTLINKSXml (storexml string)  PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/PostLinks'
;
ALTER TABLE ods.POSTLINKSXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.POSTLINKSXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';


CREATE EXTERNAL TABLE IF NOT EXISTS ODS.USERSXml (storexml string)  PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/Users'
;
ALTER TABLE ods.USERSXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.USERSXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';



CREATE EXTERNAL TABLE IF NOT EXISTS ODS.VOTESXml (storexml string)  PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '/user/DW/DataLake/Votes'
;
ALTER TABLE ods.VOTESXml ADD PARTITION (ForumName = 'anime') LOCATION 'anime';
ALTER TABLE ods.VOTESXml ADD PARTITION (ForumName = 'arabic') LOCATION 'arabic';