#!/bin/bash

# System Health Check - User Space Edition
# Logs key info for DevOps monitoring

LOG_DIR="$HOME/logs"
LOG_FILE="$LOG_DIR/health-check-$(date +%Y-%m-%d).log"

# Create log dir if missing
mkdir -p "$LOG_DIR"

# Start logging
echo "=== Health Check @ $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 1. Disk usage in home directory
echo "📁 Disk Usage (Home):" >> "$LOG_FILE"
du -sh "$HOME" 2>/dev/null >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 2. Top 5 largest directories in home
echo "🔍 Top 5 Largest Directories:" >> "$LOG_FILE"
du -h "$HOME" 2>/dev/null | sort -hr | head -n 5 >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 3. Your running processes
echo "⚡ Your Running Processes:" >> "$LOG_FILE"
ps -u "$USER" -o pid,ppid,cmd,%mem,%cpu --sort=-%cpu 2>/dev/null | head -n 10 >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 4. Free memory (user-accessible info)
echo "🧠 Memory Info (from /proc):" >> "$LOG_FILE"
grep -E 'MemTotal|MemFree|MemAvailable' /proc/meminfo 2>/dev/null >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

echo "✅ Health check completed." >> "$LOG_FILE"
echo "-------------------------------" >> "$LOG_FILE"
