#!/bin/bash

echo "Dumping MySQL database: $DB_NAME, user: $DB_USER, host: $DB_HOST"

mysqldump -u$DB_USER -p$DB_PASSWORD --lock-tables=false --no-tablespaces -h $DB_HOST $DB_NAME > /var/backup/backup-$(date +"%Y-%m-%d_%H.%M.%S").sql

echo "MySQL database dumped successfully"
echo "Removing backups older than 12 hours"

find /var/backup -name "backup-*.sql" -type f -mmin +720 -exec rm {} \;

echo "Removed backups older than 12 hours"
