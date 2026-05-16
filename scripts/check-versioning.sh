#!/usr/bin/env bash
set -euo pipefail

echo "Checking Flutter versioning..."
if [ -f pubspec.yaml ]; then
  grep -nE "^version:" pubspec.yaml || echo "version missing in pubspec.yaml"
else
  echo "pubspec.yaml missing"
fi

echo
echo "Checking Android version signals..."
grep -RInE "versionCode|versionName|applicationId" android/app 2>/dev/null || true

echo
echo "Checking iOS version signals..."
grep -RInE "MARKETING_VERSION|CURRENT_PROJECT_VERSION|PRODUCT_BUNDLE_IDENTIFIER" ios 2>/dev/null || true
