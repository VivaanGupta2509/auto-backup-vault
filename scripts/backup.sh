#!/bin/bash

# AutoBackup Vault - Smart Backup System
set -euo pipefail

# Load config
CONFIG_FILE="$(dirname "$0")/../config/config.txt"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Config file not found: $CONFIG_FILE"
    exit 1
fi

# Create folders if they don't exist
mkdir -p "$SOURCE_DIR" "$BACKUP_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

# Function to create backup
backup() {
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"
    mkdir -p "$BACKUP_PATH"
    cp -r "$SOURCE_DIR"/* "$BACKUP_PATH"
    echo "✅ Backup completed at $TIMESTAMP" | tee -a "$LOG_FILE"
}

# Function to restore backup
restore() {
    echo "Available backups in $BACKUP_DIR:"
    ls "$BACKUP_DIR"
    read -p "Enter the backup folder to restore: " BACKUP_TO_RESTORE
    RESTORE_PATH="${SOURCE_DIR}_restored"
    mkdir -p "$RESTORE_PATH"
    cp -r "$BACKUP_DIR/$BACKUP_TO_RESTORE/"* "$RESTORE_PATH/"
    echo "✅ Backup restored to $RESTORE_PATH" | tee -a "$LOG_FILE"
}

# Check command line argument
if [[ "${1:-}" == "--restore" ]]; then
    restore
else
    backup
fi
#!/bin/bash
# AutoBackup Vault - initial backup skeleton (Mohit)
set -euo pipefail

# Resolve script and project dirs
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

CONFIG_FILE="$ROOT_DIR/config/config.txt"
LOG_DIR="$ROOT_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

# Load config
if [ -f "$CONFIG_FILE" ]; then
  # shellcheck source=/dev/null
  source "$CONFIG_FILE"
else
  echo "Config file not found: $CONFIG_FILE" >&2
  exit 1
fi

# Ensure directories exist
mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

echo "[$(date)] Starting backup from $SOURCE_DIR to $BACKUP_DIR" >> "$LOG_FILE"

# Placeholder for actual backup command. Replace with rsync later.
# rsync -av --progress "$SOURCE_DIR"/ "$BACKUP_DIR"/ >> "$LOG_FILE" 2>&1
echo "DEBUG: would sync $SOURCE_DIR -> $BACKUP_DIR" >> "$LOG_FILE"

echo "[$(date)] Backup script initialized successfully." >> "$LOG_FILE"
