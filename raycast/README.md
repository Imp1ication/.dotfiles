# Raycast Script Commands

This directory contains custom Raycast Script Commands for easy synchronization and management across different devices.

## Contents

- `scripts/`: Custom Raycast Script Commands, including shell script templates and practical scripts.
  - `script-command.template.sh`: A template for creating new Raycast Script Commands.
  - `obsidian_leju_log.sh`: A command quickly generate a timestamped log entry for use in Obsidian.

**Note:** Personal Raycast settings (such as shortcuts and preferences) are not included in this git directory and must be migrated manually.

## Migration and Backup

1. On your old device, use the `Export` feature in Raycast preferences to export your personal configuration (including shortcuts and preferences).
2. Manually copy the exported configuration file to your new device (this file is not tracked by git).
3. On the new device, use the `Import` feature in Raycast preferences to import your configuration.
4. The Raycast Script Commands directory is configured to point to `~/.dotfiles/raycast/scripts`, so there is no need to manually copy script files. After importing your Raycast configuration, your scripts will be available automatically.
