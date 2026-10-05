#!/bin/sh
# Claude Code statusLine command
# Mirrors the Powerlevel10k lean prompt: dir | git | model | context

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
limit_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')

# Shorten the directory: replace $HOME with ~, then show last 2 components
short_dir=$(echo "$cwd" | sed "s|^$HOME|~|")
dir_display=$(echo "$short_dir" | awk -F'/' '{
  n=NF
  if (n <= 2) print $0
  else if ($1 == "~") {
    if (n == 3) print "~/" $NF
    else print "~/../" $NF
  } else print "../" $NF
}')

# Git branch (skip optional locks to avoid blocking)
git_branch=""
if [ -d "$cwd/.git" ] || git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  git_branch=$(git -C "$cwd" -c core.fsmonitor=false symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" -c core.fsmonitor=false rev-parse --short HEAD 2>/dev/null)
fi

# Build output
parts=""

# Directory (cyan)
parts=$(printf '\033[36m%s\033[0m' "$dir_display")

# Git branch (yellow)
if [ -n "$git_branch" ]; then
  parts=$(printf '%s  \033[33m%s\033[0m' "$parts" "$git_branch")
fi

# Model (dim)
if [ -n "$model" ]; then
  parts=$(printf '%s  \033[2m%s\033[0m' "$parts" "$model")
fi

# Context usage (green when low, yellow when moderate, red when high)
if [ -n "$used_pct" ]; then
  used_int=$(printf '%.0f' "$used_pct")
  if [ "$used_int" -ge 80 ]; then
    color='\033[31m'
  elif [ "$used_int" -ge 50 ]; then
    color='\033[33m'
  else
    color='\033[32m'
  fi
  parts=$(printf "%s  ${color}ctx:%d%%\033[0m" "$parts" "$used_int")
fi

# 5-hour rate limit usage (green when low, yellow when moderate, red when high)
if [ -n "$limit_pct" ]; then
  limit_int=$(printf '%.0f' "$limit_pct")
  if [ "$limit_int" -ge 80 ]; then
    color='\033[31m'
  elif [ "$limit_int" -ge 50 ]; then
    color='\033[33m'
  else
    color='\033[32m'
  fi
  parts=$(printf "%s  ${color}5h:%d%%\033[0m" "$parts" "$limit_int")
fi

printf '%s' "$parts"
