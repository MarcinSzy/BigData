
use ${hiveconf:DB_NAME};



ALTER TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME}xml ADD PARTITION (ForumName = '${hiveconf:PARTITION_NAME}') LOCATION '${hiveconf:PARTITION_NAME}';

