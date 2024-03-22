#!/bin/bash

mysqldump -user="$DB_USER" root --password="$DB_PASSWORD" noo > /var/backup/backup-$(date +"%Y-%m-%d_%H.%M.%S").sql