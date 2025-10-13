# AutoBackup Vault

AutoBackup Vault is a Bash-based utility that automatically backs up important directories, maintains a timestamped history, and allows easy restoration of previous backups.

---

## Project Overview

AutoBackup Vault is designed to:

- Safely back up user-specified directories.
- Keep organized timestamped backup folders.
- Maintain a log of backup operations.
- Allow restoring previous backups easily.
- Run fully on macOS/Linux using Bash.

This project was developed as part of our Open Source Technology (OST) course, with contributions from all team members.

---

## Team Members

| Name            | Role                                      |
|-----------------|-------------------------------------------|
| Sharvari Murade  | Project setup, backup & restore scripts  |
| Nandini Bansal   | Documentation, README updates            |
| Mohit Rawat      | Initial script skeleton, configuration    |
| Vivaan Gupta     | Repository setup, branch management       |

---

## Quick Start

### 1. Clone the repository

```bash
git clone git@github.com:VivaanGupta2509/auto-backup-vault.git
cd auto-backup-vault
# AutoBackup Vault

**AutoBackup Vault** is a Bash-based backup tool that automatically backs up your important directories to a specified location with timestamped folders. It also allows restoring backups easily, and keeps logs of all backup activities.

---

## Features

- Automatic backup of specified directories.
- Timestamped backup folders to keep multiple versions.
- Simple restore functionality.
- Detailed logging of backup operations.
- Configurable source and backup directories.
- Easy to use with minimal setup.

---

## Installation & Setup

1. **Clone the repository** (if not already):

```bash
git clone https://github.com/VivaanGupta2509/auto-backup-vault.git
cd auto-backup-vault
## Quick Start
1. Configure `config/config.txt`:
```bash
SOURCE_DIR="$HOME/Documents/project_data"
BACKUP_DIR="$HOME/Desktop/auto-backup-vault/Backups"
LOG_FILE="$HOME/Desktop/auto-backup-vault/logs/backup.log"
# AutoBackup Vault 🗂️
### Smart File Backup and Recovery System

## Overview
AutoBackup Vault is a Bash-based tool that automates file backups and allows easy restoration.  
It maintains logs of all actions and keeps your important files safe. This project is implemented as part of the OST group project.

---

## Features
- **Automated Backups:** Copies files from the source folder to a backup folder with timestamps.
- **Restore Functionality:** Allows restoring files from previous backups.
- **Logging:** Tracks all actions in a log file (`backup.log`).
- **Configuration:** Easily set source and backup directories in `config/config.txt`.

---

## Tools & Technologies
- Bash Shell Scripting
- Git & GitHub for version control
- macOS/Linux/Windows (via Git Bash)
- `rsync` (optional for efficient syncing)

---

## Project Structure
# Auto Backup Vault

## Overview
Auto Backup Vault is a simple script-based tool to automatically back up important directories to a safe location and allow easy restore. This project is implemented in Bash and uses rsync for efficient syncing.

## Quick Start
1. Edit `config/config.txt` to set SOURCE_DIR and BACKUP_DIR.
2. Make scripts executable:
   ```bash
   chmod +x scripts/backup.sh

Nandini - Updated README and added documentation
