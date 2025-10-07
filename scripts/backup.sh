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
