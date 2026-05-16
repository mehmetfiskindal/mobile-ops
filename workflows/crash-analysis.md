# Crash Log Analysis Workflow

Use this workflow when the user provides Flutter, Firebase Crashlytics, Android Logcat, iOS crash, or Xcode organizer crash output.

## Purpose

Analyze Flutter, Android, iOS, or Firebase Crashlytics crash output and turn it into a likely cause, minimal patch, and validation plan.

## Files To Inspect

- crash logs provided by the user
- `lib/`
- platform channel code
- Android native code under `android/`
- iOS native code under `ios/`
- Crashlytics setup and recent release/version metadata

## Commands To Run

Run targeted commands only after identifying likely files. Useful commands include:

```bash
flutter analyze
flutter test
```

## Steps

1. Identify platform:
   - Flutter/Dart
   - Android native
   - iOS native
   - Firebase Crashlytics
2. Extract:
   - exception type
   - top crashing frame
   - affected app version
   - affected OS/device
   - breadcrumbs or logs
3. Search code for matching symbols, routes, providers, widgets, services, and platform channel handlers.
4. Identify likely root cause and confidence level.
5. Propose a minimal fix.
6. Recommend a regression test or reproduction path.

## Risk Signals

- Crash occurs on app launch, purchase, auth, payment, or data-loss paths
- Crash affects current release or a large device/OS segment
- Stack trace points to null state, async lifecycle, platform channel mismatch, or schema migration
- No test, guard, or telemetry exists around the failing path

## Output Format

Report:

- likely cause
- evidence
- suspected files
- proposed patch
- validation steps
