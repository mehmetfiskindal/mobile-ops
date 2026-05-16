#!/usr/bin/env bash
set -euo pipefail

echo "Preparing Android release build..."

if ! command -v flutter >/dev/null 2>&1; then
  echo "flutter not found on PATH"
  exit 1
fi

[ -f pubspec.yaml ] || { echo "pubspec.yaml missing. Run from Flutter project root."; exit 1; }
[ -d android ] || { echo "android/ missing. This does not look like a Flutter Android project."; exit 1; }

echo "Project version:"
grep -nE "^version:" pubspec.yaml || true

echo "Android SDK config:"
grep -RInE "minSdk|targetSdk|compileSdk|applicationId|signingConfig" android/app android/build.gradle android/gradle.properties 2>/dev/null || true

flutter build appbundle --release
