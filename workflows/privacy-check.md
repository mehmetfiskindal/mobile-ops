# Privacy Check Workflow

Use this workflow when the user asks for `/mobile-ops privacy-check`.

## Purpose

Check whether app permissions, SDK usage, privacy policy, and store privacy metadata are aligned.

## Files To Inspect

- `pubspec.yaml`
- `ios/Runner/Info.plist`
- `android/app/src/main/AndroidManifest.xml`
- `lib/`
- `store/privacy/policy.md`
- `store/privacy/data-safety.md`
- App Store privacy notes if available

## Commands To Run

```bash
.mobile-ops/scripts/check-permissions.sh
.mobile-ops/scripts/check-store-metadata.sh
.mobile-ops/scripts/firebase-audit.sh
```

## Risk Signals

- Permission requested without user-facing rationale
- Firebase Analytics, Crashlytics, Messaging, ads, or attribution SDKs missing from disclosures
- Missing account deletion or data deletion path for account-based apps
- Play Data Safety or App Store privacy labels inconsistent with code
- Privacy policy template still contains placeholders

## Output Format

Use `reports/privacy-risk-report.md`. Mark legal assumptions clearly and do not present generated policy text as legal advice.
