
#!/bin/sh
FILE=/home/DW/codes/ODS.propertis

db_name=$(grep -i 'databaseName' $FILE  | cut -f2 -d'=')
table_name=$(grep -i 'tableName' $FILE  | cut -f2 -d'=')
path=$(grep -i 'pathName' $FILE  | cut -f2 -d'=')

echo "create database - " $db_name

hive -e "create database IF NOT EXISTS ${db_name};"


echo "connecting to database - " $db_name

echo  "creating tables table - " $table_name

for i in ${table_name}
do
   hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME=$i -hiveconf PATH_NAME=$path -f /home/DW/codes/ODS_DDL.hql
done


