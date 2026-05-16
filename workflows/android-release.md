# Android Release Workflow

Use this workflow when the user asks for `/mobile-ops android-release`.

## Purpose

Check Android release readiness for a Flutter app before Play Store submission.

## Files To Inspect

- `pubspec.yaml`
- `android/app/build.gradle`
- `android/app/build.gradle.kts`
- `android/build.gradle`
- `android/gradle.properties`
- `android/app/src/main/AndroidManifest.xml`
- signing configuration files and CI references

## Commands To Run

```bash
.mobile-ops/scripts/flutter-doctor.sh
.mobile-ops/scripts/check-versioning.sh
.mobile-ops/scripts/check-permissions.sh
flutter analyze
flutter test
.mobile-ops/scripts/build-android.sh
```

If tests do not exist or Flutter is unavailable, report that clearly.

## Risk Signals

- Missing or inconsistent version/build number
- Unsafely committed signing material
- Debug signing used for release
- Outdated target SDK or incompatible min SDK
- Overbroad Android permissions
- Failing analyze, tests, or app bundle build

## Output Format

Use `reports/release-readiness-report.md`. Report release blockers, signing risks, SDK/version risks, test/build result, and Play Console readiness notes.
