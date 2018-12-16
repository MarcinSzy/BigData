#!/bin/bash

FORUM_NAME=$1

#'Start creating Data Catalogs in HDFS'

wget -O /home/DW/DataLake/archive/$FORUM_NAME.archive  "https://archive.org/download/stackexchange/$FORUM_NAME.stackexchange.com.7z"
mkdir -p /home/DW/DataLake/$FORUM_NAME
7z e /home/DW/DataLake/archive/$FORUM_NAME.archive -o/home/DW/DataLake/$FORUM_NAME  -y


for i in Badges Comments PostHistory PostLinks Posts Tags Users Votes
do
	hdfs dfs -mkdir -p /user/DW/DataLake/$i/
	hdfs dfs -mkdir -p /user/DW/DataLake/$i/$FORUM_NAME 
	hdfs dfs -put /home/DW/DataLake/$FORUM_NAME/$i.xml  /user/DW/DataLake/$i/$FORUM_NAME
done
