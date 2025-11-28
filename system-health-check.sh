#!/bin/bash

# System Health Check - User Space Edition (shellcheck compliant)
# Logs key info for DevOps monitoring

LOG_DIR="$HOME/logs"
LOG_FILE="$LOG_DIR/health-check-$(date +%Y-%m-%d).log"

# Create log dir if missing
mkdir -p "$LOG_DIR"

# Start logging
printf "=== Health Check @ %s ===\n\n" "$(date)" >> "$LOG_FILE"

# 1. Disk usage in home directory
printf "📁 Disk Usage (Home):\n" >> "$LOG_FILE"
du -sh "$HOME" 2>/dev/null >> "$LOG_FILE"
printf "\n" >> "$LOG_FILE"

# 2. Top 5 largest directories in home
printf "🔍 Top 5 Largest Directories:\n" >> "$LOG_FILE"
du -h "$HOME" 2>/dev/null | sort -hr | head -n 5 >> "$LOG_FILE"
printf "\n" >> "$LOG_FILE"

# 3. Your running processes
printf "⚡ Your Running Processes:\n" >> "$LOG_FILE"
ps -u "$USER" -o pid,ppid,cmd,%mem,%cpu --sort=-%cpu 2>/dev/null | head -n 10 >> "$LOG_FILE"
printf "\n" >> "$LOG_FILE"

# 4. Free memory (user-accessible info)
printf "🧠 Memory Info (from /proc):\n" >> "$LOG_FILE"
grep -E 'MemTotal|MemFree|MemAvailable' /proc/meminfo 2>/dev/null >> "$LOG_FILE"
printf "\n" >> "$LOG_FILE"

printf "✅ Health check completed.\n" >> "$LOG_FILE"
printf "-------------------------------\n\n" >> "$LOG_FILE"
