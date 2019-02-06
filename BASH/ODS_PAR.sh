
#!/bin/sh
FILE=/home/DW/codes/ODS.propertis

db_name=$(grep -i 'databaseName' $FILE  | cut -f2 -d'=')
table_name=$(grep -i 'tableName' $FILE  | cut -f2 -d'=')
partition_name=$(grep -i 'partitionName' $FILE  | cut -f2 -d'=')



for tn in ${table_name}
do
	for pn in ${partition_name}
	do	
		
		echo "Create partition $pn for table  $tn"
		hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME=$tn -hiveconf PARTITION_NAME=$pn -f /home/DW/codes/ODS_PAR.hql
	done 	
done
