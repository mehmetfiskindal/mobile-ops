#!/usr/bin/env bash
set -euo pipefail

echo "Checking Flutter installation..."

if ! command -v flutter >/dev/null 2>&1; then
  echo "flutter not found on PATH"
  exit 1
fi

flutter --version
flutter doctor -v

echo "Checking project files..."

[ -f pubspec.yaml ] && echo "pubspec.yaml found" || echo "pubspec.yaml missing"
[ -d android ] && echo "android/ found" || echo "android/ missing"
[ -d ios ] && echo "ios/ found" || echo "ios/ missing"
