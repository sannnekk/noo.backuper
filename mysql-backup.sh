#!/bin/bash

echo "Dumping MySQL database: $DB_NAME, user: $DB_USER, host: $DB_HOST"

mysqldump -u$DB_USER -p$DB_PASSWORD --single-transaction --flush-logs --set-gtid-purged=ON --max_allowed_packet=5G -h $DB_HOST $DB_NAME | gzip > /var/backup/backup-$(date +%Y-%m-%d-%H-%M-%S).sql.gz

echo "MySQL database dumped successfully"
echo "Removing backups older than 12 hours"

find /var/backup -name "backup-*.sql" -type f -mmin +720 -exec rm {} \;

echo "Removed backups older than 6 hours"
