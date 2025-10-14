#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_FILE="$ROOT_DIR/config/config.txt"

if [[ -f "$CONFIG_FILE" ]]; then
  source "$CONFIG_FILE"
else
  echo "Config file not found: $CONFIG_FILE" >&2
  exit 1
fi

mkdir -p "$SOURCE_DIR"
mkdir -p "$BACKUP_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

do_backup() {
  TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
  BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"
  mkdir -p "$BACKUP_PATH"
  log "Starting backup: $SOURCE_DIR -> $BACKUP_PATH"
  rsync -a --delete --exclude="$BACKUP_DIR" --exclude='.git' "$SOURCE_DIR"/ "$BACKUP_PATH"/ >> "$LOG_FILE" 2>&1
  log "Backup completed: $BACKUP_PATH"
  prune_old_backups
}

prune_old_backups() {
  if [[ -z "${RETENTION_COUNT:-}" ]]; then return 0; fi
  mapfile -t ITEMS < <(ls -1t "$BACKUP_DIR" | grep '^backup_' || true)
  if (( ${#ITEMS[@]} > RETENTION_COUNT )); then
    for (( i=RETENTION_COUNT; i<${#ITEMS[@]}; i++ )); do
      OLD="$BACKUP_DIR/${ITEMS[i]}"
      log "Pruning old backup: $OLD"
      rm -rf "$OLD"
    done
  fi
}

do_restore() {
  if [[ -z "${1:-}" ]]; then
    echo "Usage: $0 --restore <backup_folder_name>" >&2
    exit 1
  fi
  BACKUP_TO_RESTORE="$1"
  SRC="$BACKUP_DIR/$BACKUP_TO_RESTORE"
  if [[ ! -d "$SRC" ]]; then
    echo "Backup not found: $SRC" >&2
    exit 1
  fi
  RESTORE_PATH="${SOURCE_DIR}_restored_$(date +%Y%m%d_%H%M%S)"
  mkdir -p "$RESTORE_PATH"
  log "Restoring $SRC -> $RESTORE_PATH"
  rsync -a "$SRC"/ "$RESTORE_PATH"/ >> "$LOG_FILE" 2>&1
  log "Restore completed: $RESTORE_PATH"
  echo "Restored to: $RESTORE_PATH"
}

case "${1:-}" in
  --restore)
    shift || true
    do_restore "$@"
    ;;
  --run-once)
    do_backup
    ;;
  --help|-h)
    cat <<EOF
Usage:
  $(basename "$0") --run-once          Create one timestamped backup
  $(basename "$0") --restore <name>    Restore the named backup
  $(basename "$0")                     Default: same as --run-once
EOF
    ;;
  *)
    do_backup
    ;;
esac
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
