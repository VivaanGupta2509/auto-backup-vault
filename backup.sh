#!/bin/bash
# -----------------------------------------
# AutoBackup Vault - Smart Backup System
# -----------------------------------------

# Directories
SOURCE_DIR="$HOME/Documents/source_files"
BACKUP_DIR="$HOME/Documents/backup_files"
LOG_FILE="$HOME/Documents/backup_log.txt"

# Create folders if they don't exist
mkdir -p "$SOURCE_DIR" "$BACKUP_DIR"

# Start logging
echo "----------------------------------------" >> "$LOG_FILE"
echo "Backup started at: $(date)" >> "$LOG_FILE"

# Perform backup
cp -r "$SOURCE_DIR"/* "$BACKUP_DIR"/ 2>>"$LOG_FILE"

# Check status
if [ $? -eq 0 ]; then
  echo "Backup completed successfully!" >> "$LOG_FILE"
else
  echo "Backup failed!" >> "$LOG_FILE"
fi

echo "Backup finished at: $(date)" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"

echo "✅ Backup complete! Check $LOG_FILE for details."

