# Auto Backup Vault

## Overview
Auto Backup Vault is a simple script-based tool to automatically back up important directories to a safe location and allow easy restore. This project is implemented in Bash and uses rsync for efficient syncing.

## Quick Start
1. Edit `config/config.txt` to set SOURCE_DIR and BACKUP_DIR.
2. Make scripts executable:
   ```bash
   chmod +x scripts/backup.sh

