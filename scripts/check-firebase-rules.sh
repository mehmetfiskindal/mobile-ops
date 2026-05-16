#!/usr/bin/env bash
set -euo pipefail

echo "Checking Firebase rules files..."

for file in firestore.rules storage.rules database.rules.json; do
  if [ -f "$file" ]; then
    echo "$file found"
  else
    echo "$file missing"
  fi
done

echo
echo "Searching for permissive rule patterns..."
grep -RInE "allow read, write: if true|allow read: if true|allow write: if true|auth == null|request.auth == null" firestore.rules storage.rules database.rules.json 2>/dev/null || true
