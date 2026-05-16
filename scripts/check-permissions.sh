#!/usr/bin/env bash
set -euo pipefail

echo "Checking Android permissions..."
if [ -f android/app/src/main/AndroidManifest.xml ]; then
  grep -nE "uses-permission|permission" android/app/src/main/AndroidManifest.xml || true
else
  echo "android/app/src/main/AndroidManifest.xml missing"
fi

echo
echo "Checking iOS usage descriptions..."
if [ -f ios/Runner/Info.plist ]; then
  grep -nE "NS[A-Za-z]+UsageDescription" ios/Runner/Info.plist || true
else
  echo "ios/Runner/Info.plist missing"
fi
