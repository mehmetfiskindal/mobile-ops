# iOS Release Workflow

Use this workflow when the user asks for `/mobile-ops ios-release`.

## Purpose

Check iOS release readiness for a Flutter app before App Store submission.

## Files To Inspect

- `pubspec.yaml`
- `ios/Runner.xcodeproj`
- `ios/Runner.xcworkspace`
- `ios/Runner/Info.plist`
- `ios/Podfile`
- signing configuration and CI references

## Commands To Run

```bash
.mobile-ops/scripts/flutter-doctor.sh
.mobile-ops/scripts/check-versioning.sh
.mobile-ops/scripts/check-permissions.sh
flutter analyze
flutter test
.mobile-ops/scripts/build-ios.sh
```

If tests do not exist, Xcode is unavailable, or codesigning is intentionally skipped, report that clearly.

## Risk Signals

- Missing or inconsistent version/build number
- Missing usage descriptions for requested permissions
- Bundle identifier mismatch
- Deployment target drift
- Signing or provisioning assumptions not documented
- Failing analyze, tests, or no-codesign build

## Output Format

Use `reports/release-readiness-report.md`. Report release blockers, signing and provisioning risks, privacy permission risks, test/build result, and App Store Connect readiness notes.
