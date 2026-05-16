# Crash Log Analysis Workflow

Use this workflow when the user provides Flutter, Firebase Crashlytics, Android Logcat, iOS crash, or Xcode organizer crash output.

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

## Output Format

Report:

- likely cause
- evidence
- suspected files
- proposed patch
- validation steps
