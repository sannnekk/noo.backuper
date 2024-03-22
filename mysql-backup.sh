#!/bin/bash

echo "Dumping MySQL database: $DB_NAME, user: $DB_USER, host: $DB_HOST"

mysqldump -u$DB_USER -p$DB_PASSWORD --lock-tables=false --no-tablespaces -h $DB_HOST $DB_NAME > /var/backup/backup-$(date +"%Y-%m-%d_%H.%M.%S").sql