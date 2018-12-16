/*

ETL that ransform data from STG Layer to STG Layer  !!! 

Ideas What to do in that layer: 
- Transate codes to values !! 
- Do something with dates !! 
- Put tags from Post table to DataSet structure !! 
- Create table user_activity !! 
- create table Calendar 
*/

 set hive.exec.dynamic.partition=true;
 set hive.exec.dynamic.partition.mode=nonstrict;
 
 
insert into DW.Dictionary 
select * FROM ODS.Dictionary; 



ALTER TABLE stg.Badges SET SERDEPROPERTIES ("timestamp.formats"="yyyy-MM-dd'T'HH:mm:ss.SSSZ");

create table IF NOT EXISTS DW.BADGES  
(
 Id INT, 
 UserId INT ,
 Name STRING ,
 CreationDate TIMESTAMP , 
 Class  INT ,
 TagBased BOOLEAN 
)
COMMENT 'This is the Badges  table'
PARTITIONED BY(ForumName STRING)
STORED AS ORC;
 
 
 
 insert overwrite table  DW.Badges PARTITION (ForumName)
 select 
 Id, 
 UserId  ,
 Name  ,
 CreationDate , 
 Class  ,
 TagBased,
 ForumName
 FROM STG.Badges;
