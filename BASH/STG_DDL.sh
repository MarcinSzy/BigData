
#!/bin/sh
FILE=/home/DW/codes/STG.propertis

db_name=$(grep -i 'databaseName' $FILE  | cut -f2 -d'=')
db_name_in=$(grep -i 'databaseInName' $FILE  | cut -f2 -d'=')

   hive -hiveconf DB_NAME=$db_name -hiveconf DB_NAME_IN=$db_name_in -f /home/DW/codes/STG_DDL.hql

