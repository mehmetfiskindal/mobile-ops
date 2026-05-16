# Firebase Security Audit Workflow

Use this workflow when the user asks for `/mobile-ops firebase-audit` or says:

```text
Follow workflows/firebase-audit.md and audit this Flutter Firebase project.
```

## Purpose

Find Firebase configuration, security, rules, App Check, and secret-handling risks before release.

## Files To Inspect

- `firebase.json`
- `.firebaserc`
- `lib/firebase_options.dart`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `firestore.rules`
- `storage.rules`
- `database.rules.json`
- Firebase-related Dart, Android, and iOS code

## Commands To Run

Run:

```bash
.mobile-ops/scripts/firebase-audit.sh
.mobile-ops/scripts/check-secrets.sh
.mobile-ops/scripts/check-firebase-rules.sh
```

If the repo is not installed as `.mobile-ops`, run the equivalent script path.

## Risk Signals

- Committed service account JSON, private keys, tokens, `.env`, keystores, or signing files
- Missing or permissive Firebase rules
- Missing App Check for production apps
- Firebase config for the wrong environment
- Public Storage or Firestore access without clear business need
- Crashlytics, Analytics, or Messaging usage missing privacy disclosure

## Output Format

Use `reports/firebase-audit-report.md`. Start with release blockers. Do not expose secret values. Refer to secret locations by path and line when possible.
