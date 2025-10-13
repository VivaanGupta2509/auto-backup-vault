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
cd auto-backup-vault```

## Applications

Auto Backup Vault can be used in a variety of real-world scenarios:

- **Student & coursework protection** — automatic daily backups of assignments, lab reports, and project directories.  
- **Developer workflow** — quick snapshot backups before major refactors or releases.  
- **Small office / personal computers** — scheduled local backups for critical documents.  
- **Pre-deployment snapshots** — capture server configs and app data prior to major updates.  
- **Ad hoc data salvage** — create quick archives of specified folders before dangerous operations.


## 🚀 Future scope & improvements

Potential enhancements to make the project production-ready:

- **GPG encryption** of backups for privacy and secure transport.  
- **Differential/incremental backups** to save space and speed up runs.  
- **Cloud integration** (rclone, AWS S3, Google Drive) with optional retention policies.  
- **Web or desktop GUI** for non-technical users to configure backups and view logs.  
- **Email / Slack / webhook notifications** on success/failure and backup sizes.  
- **Config validation & dry-run mode** to test config entries without producing archives.  
- **Automatic rotation / retention** (delete old backups older than N days).  
- **Unit / integration tests** and CI pipeline for quality and regressions.

---

## 🧰 Suggested Tech Stack & Tools

- **Shell / Bash** (primary script language)  
- **rclone** (recommended for cloud sync)  
- **gpg** (for encryption)  
- **cron / launchd / systemd timers** for scheduling  
- **GitHub Actions** for CI checks (optional)
