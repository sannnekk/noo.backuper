#!/bin/bash

echo "Dumping MySQL database: $DB_NAME, user: $DB_USER, host: $DB_HOST"
echo "Options: --single-transaction --set-gtid-purged=ON --max_allowed_packet=5G"
echo "Backup file: /var/backup/backup-$(date +%Y-%m-%d-%H-%M-%S).sql.gz"
echo "Mysqldump version: $(mysqldump --version)" 

mysqldump -u$DB_USER -p$DB_PASSWORD --single-transaction --set-gtid-purged=ON --max_allowed_packet=5G -h $DB_HOST $DB_NAME | gzip > /var/backup/backup-$(date +%Y-%m-%d-%H-%M-%S).sql.gz

# if [ $? -eq 0 ]; then
#   echo "Backup successful"
# else
#   echo "Backup failed"
# fi
