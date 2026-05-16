---
name: mobile-ops
description: Audit and automate Flutter/Firebase mobile app operations. Use when the user asks for /mobile-ops firebase-audit, android-release, ios-release, aso-review, privacy-check, or asks to inspect Flutter/Firebase release readiness, store metadata, privacy, permissions, Firebase rules, crash logs, or monetization.
---

# Mobile Ops

You are operating inside a Flutter/Firebase mobile project. Inspect the project before changing it, run the relevant signal-collection scripts when they exist, and produce a clear release-focused risk report.

## Default Inspection Targets

Always inspect these files when they exist:

- `pubspec.yaml`
- `firebase.json`
- `android/app/build.gradle`
- `android/app/build.gradle.kts`
- `android/build.gradle`
- `android/gradle.properties`
- `ios/Runner.xcodeproj`
- `ios/Runner/Info.plist`
- `ios/Podfile`
- `lib/firebase_options.dart`
- `store/`
- `.mobile-ops/store/`
- app store metadata files, release notes, screenshots, and privacy files if available

## Prompt Shortcuts

Treat these as prompt shortcuts, not shell commands:

- `/mobile-ops firebase-audit`: follow `.mobile-ops/workflows/firebase-audit.md` when present, then run `.mobile-ops/scripts/firebase-audit.sh` and related checks.
- `/mobile-ops android-release`: follow `.mobile-ops/workflows/android-release.md` when present, then check versioning, secrets, permissions, and Android build readiness.
- `/mobile-ops ios-release`: follow `.mobile-ops/workflows/ios-release.md` when present, then check versioning, secrets, permissions, pods, and iOS build readiness.
- `/mobile-ops aso-review`: follow `.mobile-ops/workflows/aso.md` or `.mobile-ops/workflows/aso-review.md` when present, then inspect store metadata.
- `/mobile-ops privacy-check`: follow `.mobile-ops/workflows/privacy-check.md` when present, then inspect permissions, data safety, privacy policy, and Firebase usage.

## Operating Rules

- Prefer reading the project before making changes.
- Run matching scripts under `.mobile-ops/scripts/` first; if this repo itself is the mobile-ops workspace, use `scripts/`.
- Treat scripts as signal collectors. Interpret their output instead of pasting raw logs.
- Summarize risks before suggesting a release.
- Never expose secrets. If API keys, service accounts, signing files, keystores, provisioning profiles, tokens, or credentials are found, report the risk without pasting values.
- Keep patches scoped to the mobile operation being audited.
- If the project uses flavors, environments, or multiple Firebase apps, identify which environment each finding applies to.
- Use files in `reports/` or `.mobile-ops/reports/` as report shapes when a workflow references them.
- Use files in `profiles/` or `.mobile-ops/profiles/` only when the user or project context clearly matches the profile.

## Output

End with a concise report that includes:

- inspected scope
- commands or scripts run
- risk findings ordered by severity
- release recommendation
- focused next actions
