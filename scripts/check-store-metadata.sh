#!/usr/bin/env bash
set -euo pipefail

echo "Checking store metadata structure..."

paths=(
  "store/app-store/description.md"
  "store/app-store/keywords.md"
  "store/app-store/release-notes.md"
  "store/play-store/short-description.md"
  "store/play-store/full-description.md"
  "store/play-store/release-notes.md"
  "store/privacy/policy.md"
  "store/privacy/data-safety.md"
)

for path in "${paths[@]}"; do
  if [ -f "$path" ]; then
    echo "$path found"
  else
    echo "$path missing"
  fi
done

echo
echo "Checking metadata length signals..."
if [ -f store/app-store/keywords.md ]; then
  awk '{ count += length($0) } END { print "App Store keywords characters:", count + NR - 1 }' store/app-store/keywords.md
fi

if [ -f store/play-store/short-description.md ]; then
  awk '{ count += length($0) } END { print "Play short description characters:", count + NR - 1 }' store/play-store/short-description.md
fi
