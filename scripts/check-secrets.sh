#!/usr/bin/env bash
set -euo pipefail

echo "Checking for secret-like material..."

grep -RInE "AIza|BEGIN PRIVATE KEY|private_key|client_secret|service_account|refresh_token|APP_STORE_CONNECT|PLAY_STORE|SENTRY_DSN|api[_-]?secret|access[_-]?token|auth[_-]?token" . \
  --exclude-dir=.git \
  --exclude-dir=.mobile-ops \
  --exclude-dir=build \
  --exclude-dir=.dart_tool \
  --exclude-dir=node_modules \
  --exclude-dir=Pods \
  --exclude='*.lock' \
  --exclude='*.md' || true

echo
echo "Checking for risky secret files..."
find . \
  -path './.git' -prune -o \
  -path './.mobile-ops' -prune -o \
  -path './build' -prune -o \
  -path './.dart_tool' -prune -o \
  -path './node_modules' -prune -o \
  -path './ios/Pods' -prune -o \
  -type f \( \
    -name '.env' -o \
    -name '.env.*' -o \
    -name '*.jks' -o \
    -name '*.keystore' -o \
    -name '*.p8' -o \
    -name '*.pem' -o \
    -name '*service-account*.json' -o \
    -name '*ServiceAccount*.json' \
  \) -print
