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

## Features

- Automatic backup of specified directories.
- Timestamped backup folders to keep multiple versions.
- Simple restore functionality.
- Detailed logging of backup operations.
- Configurable source and backup directories.
- Easy to use with minimal setup.

---

## Project Structure

- `scripts/backup.sh` : Main backup & restore script  
- `config/config.txt` : Configure source and backup directories  
- `logs/` : Contains log files of backup operations  
- `README.md` : Project documentation  

---

## Team Members

| Name             | Role                                      |
|------------------|-------------------------------------------|
| Sharvari Murade  | Project setup, backup & restore scripts  |
| Nandini Bansal   | Documentation, README updates            |
| Mohit Rawat      | Initial script skeleton, configuration   |
| Vivaan Gupta     | Repository setup, branch management      |

---

## Installation & Setup

1. **Clone the repository**:

```bash
git clone https://github.com/VivaanGupta2509/auto-backup-vault.git
cd auto-backup-vault

