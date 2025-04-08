#!/bin/bash

USER="root"
PASSWORD="rootpassword"
DATABASE="mydb"  # Correct database name
BACKUP_DIR="$HOME/backups"

DATE=$(date +"%Y%m%d%H%M")
BACKUP_FILE="$BACKUP_DIR/$DATABASE-backup-$DATE.sql"

mkdir -p $BACKUP_DIR

docker exec mysql mysqldump -u $USER -p$PASSWORD $DATABASE > $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo "Backup successfully created at $BACKUP_FILE"
else
    echo "Error: Backup failed"
fi