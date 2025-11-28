#!/bin/bash

# System Health Check - User Space Edition (ShellCheck compliant)
LOG_DIR="$HOME/logs"
LOG_FILE="$LOG_DIR/health-check-$(date +%Y-%m-%d).log"

mkdir -p "$LOG_DIR"

{
  printf "=== Health Check @ %s ===\n\n" "$(date)"

  printf "📁 Disk Usage (Home):\n"
  du -sh "$HOME" 2>/dev/null
  printf "\n"

  printf "🔍 Top 5 Largest Directories:\n"
  du -h "$HOME" 2>/dev/null | sort -hr | head -n 5
  printf "\n"

  printf "⚡ Your Running Processes:\n"
  ps -u "$USER" -o pid,ppid,cmd,%mem,%cpu --sort=-%cpu 2>/dev/null | head -n 10
  printf "\n"

  printf "🧠 Memory Info (from /proc):\n"
  grep -E 'MemTotal|MemFree|MemAvailable' /proc/meminfo 2>/dev/null
  printf "\n"

  printf "✅ Health check completed.\n"
  printf "-------------------------------\n\n"
} >> "$LOG_FILE"
