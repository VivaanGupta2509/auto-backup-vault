set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_FILE="$ROOT_DIR/config/config.txt"

if [[ -f "$CONFIG_FILE" ]]; then
  # shellcheck source=/dev/null
  source "$CONFIG_FILE"
else
  echo " Config file not found: $CONFIG_FILE" >&2
  exit 1
fi

mkdir -p "$BACKUP_DIR"
mkdir -p "$SOURCE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

restore_backup() {
  echo "📂 Available backups in: $BACKUP_DIR"
  mapfile -t BACKUPS < <(ls -1t "$BACKUP_DIR" | grep '^backup_' || true)

  if (( ${#BACKUPS[@]} == 0 )); then
    echo "No backups found in $BACKUP_DIR"
    exit 1
  fi

  for i in "${!BACKUPS[@]}"; do
    printf "%2d) %s\n" "$((i+1))" "${BACKUPS[i]}"
  done

  read -p "Enter the number of the backup to restore: " CHOICE
  if ! [[ "$CHOICE" =~ ^[0-9]+$ ]] || (( CHOICE < 1 || CHOICE > ${#BACKUPS[@]} )); then
    echo " Invalid selection"
    exit 1
  fi

  SELECTED="${BACKUPS[CHOICE-1]}"
  SRC="$BACKUP_DIR/$SELECTED"
  RESTORE_PATH="${SOURCE_DIR}_restored_$(date +%Y%m%d_%H%M%S)"
  mkdir -p "$RESTORE_PATH"

  log "Restoring from $SRC → $RESTORE_PATH"
  rsync -a "$SRC"/ "$RESTORE_PATH"/ >> "$LOG_FILE" 2>&1
  log "✅ Restore completed successfully"
  echo "✅ Backup restored to: $RESTORE_PATH"
}
