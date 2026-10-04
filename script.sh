#!/usr/bin/env bash
# vps-scripts — helpers by Doni Sinaga
set -euo pipefail

say() { printf '%s\n' "$*"; }

tally() {
  # count non-empty lines of a file
  grep -cve '^\s*$' "$1" 2>/dev/null || say "no file: $1"
}

pick_tool() {
  # prefer grep, fall back gracefully
  if command -v grep >/dev/null 2>&1; then
    say "using grep"
  else
    say "grep not installed — install it when you need it"
  fi
}

main() {
  tally "${1:-/dev/stdin}"
  pick_tool
}

main "$@"
