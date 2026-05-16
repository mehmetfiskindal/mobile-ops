# Firebase Security Audit Workflow

Use this workflow when the user asks for `/mobile-ops firebase-audit` or says:

```text
Follow workflows/firebase-audit.md and audit this Flutter Firebase project.
```

## Steps

1. Inspect Firebase project files:
   - `firebase.json`
   - `.firebaserc`
   - `lib/firebase_options.dart`
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
2. Run:

   ```bash
   .mobile-ops/scripts/firebase-audit.sh
   ```

   If the repo is not installed as `.mobile-ops`, run the equivalent script path.

3. Search for risky material:
   - service account JSON
   - private keys
   - keystores
   - API tokens
   - accidentally committed `.env` files
4. Inspect App Check usage in `lib/`, `ios/`, and `android/`.
5. Inspect Firebase Auth, Firestore, Realtime Database, Storage, Functions, Messaging, Analytics, and Crashlytics references when present.
6. If rules files exist, inspect:
   - `firestore.rules`
   - `storage.rules`
   - `database.rules.json`
7. Summarize:
   - critical risks
   - medium risks
   - missing hardening
   - recommended patches
   - commands already run

## Output Format

Start with a release-blocking summary. Do not expose secret values. Refer to secret locations by path and line when possible.
