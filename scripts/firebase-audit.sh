#!/usr/bin/env bash
set -euo pipefail

echo "Checking Firebase files..."

[ -f firebase.json ] && echo "firebase.json found" || echo "firebase.json missing"
[ -f .firebaserc ] && echo ".firebaserc found" || echo ".firebaserc missing"
[ -f lib/firebase_options.dart ] && echo "lib/firebase_options.dart found" || echo "lib/firebase_options.dart missing"
[ -f android/app/google-services.json ] && echo "android/app/google-services.json found" || echo "android/app/google-services.json missing"
[ -f ios/Runner/GoogleService-Info.plist ] && echo "ios/Runner/GoogleService-Info.plist found" || echo "ios/Runner/GoogleService-Info.plist missing"

echo
echo "Searching for risky keys and credentials..."
grep -RInE "AIza|BEGIN PRIVATE KEY|private_key|client_secret|service_account|refresh_token|APP_STORE_CONNECT|PLAY_STORE|SENTRY_DSN" . \
  --exclude-dir=.git \
  --exclude-dir=build \
  --exclude-dir=.dart_tool \
  --exclude-dir=node_modules \
  --exclude-dir=Pods \
  --exclude='*.lock' || true

echo
echo "Checking App Check references..."
grep -RInE "FirebaseAppCheck|firebase_app_check|AppCheck|DeviceCheck|PlayIntegrity|SafetyNet" lib ios android \
  --exclude-dir=build \
  --exclude-dir=.dart_tool \
  --exclude-dir=Pods 2>/dev/null || true

echo
echo "Checking Firebase rules files..."
[ -f firestore.rules ] && echo "firestore.rules found" || echo "firestore.rules missing"
[ -f storage.rules ] && echo "storage.rules found" || echo "storage.rules missing"
[ -f database.rules.json ] && echo "database.rules.json found" || echo "database.rules.json missing"
