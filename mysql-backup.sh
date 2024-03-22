#!/bin/bash

mysqldump -u$DB_USER root -p$DB_PASSWORD --lock-tables=false --no-tablespaces -h $DB_HOST $DB_NAME > /var/backup/backup-$(date +"%Y-%m-%d_%H.%M.%S").sql