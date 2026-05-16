#!/usr/bin/env bash
set -euo pipefail

echo "Preparing iOS release build..."

if ! command -v flutter >/dev/null 2>&1; then
  echo "flutter not found on PATH"
  exit 1
fi

[ -f pubspec.yaml ] || { echo "pubspec.yaml missing. Run from Flutter project root."; exit 1; }
[ -d ios ] || { echo "ios/ missing. This does not look like a Flutter iOS project."; exit 1; }

echo "Project version:"
grep -nE "^version:" pubspec.yaml || true

echo "iOS deployment and permission signals:"
grep -RInE "PRODUCT_BUNDLE_IDENTIFIER|MARKETING_VERSION|CURRENT_PROJECT_VERSION|IPHONEOS_DEPLOYMENT_TARGET|NS[A-Za-z]+UsageDescription" ios 2>/dev/null || true

flutter build ios --release --no-codesign
