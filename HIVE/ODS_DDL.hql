use ${hiveconf:DB_NAME};

CREATE EXTERNAL TABLE IF NOT EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME}xml (storexml string) PARTITIONED BY (ForumName STRING)
STORED AS TEXTFILE
LOCATION '${hiveconf:PATH_NAME}/${hiveconf:TABLE_NAME}'
tblproperties ("skip.header.line.count"="2", "skip.footer.line.count"="1")
;

