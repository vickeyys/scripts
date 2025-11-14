#!/bin/bash

# ---------- CONFIG ----------
DATE=$(date +"%Y-%m-%d-%H-%M")
BACKUP_DIR="/opt/backups"
FILENAME="mysql-backup-$DATE.sql"
S3_BUCKET="s3://my-db-backups-bucket"
MYSQL_USER="root"
MYSQL_PASS="YourPassword"
MYSQL_DB="your_database_name"
# ----------------------------

# Create local backup directory if NOT exists
if [ ! -d "$BACKUP_DIR" ]; then
  echo "[INFO] Backup directory not found. Creating..."
  mkdir -p "$BACKUP_DIR"
fi

echo "[INFO] Taking MySQL backup..."
mysqldump -u"$MYSQL_USER" -p"$MYSQL_PASS" "$MYSQL_DB" > "$BACKUP_DIR/$FILENAME"

# Check dump success
if [ $? -ne 0 ]; then
  echo "[ERROR] MySQL dump failed!"
  exit 1
fi

echo "[INFO] Uploading to S3..."
aws s3 cp "$BACKUP_DIR/$FILENAME" "$S3_BUCKET/"

# Check upload success
if [ $? -eq 0 ]; then
  echo "[INFO] Upload successful. Deleting local dump..."
  rm -f "$BACKUP_DIR/$FILENAME"
else
  echo "[ERROR] Upload failed! Keeping local dump for safety."
  exit 1
fi

echo "[INFO] Backup process completed successfully!"
