# iOS Release Workflow

Use this workflow when the user asks for `/mobile-ops ios-release`.

## Steps

1. Run Flutter doctor:

   ```bash
   .mobile-ops/scripts/flutter-doctor.sh
   ```

2. Inspect `pubspec.yaml` version.
3. Inspect iOS project files:
   - `ios/Runner.xcodeproj`
   - `ios/Runner/Info.plist`
   - `ios/Podfile`
   - `ios/Runner.xcworkspace`
4. Check:
   - bundle identifier
   - display name
   - deployment target
   - permissions usage descriptions
   - signing team references
   - build number and version
5. Run:

   ```bash
   flutter analyze
   ```

6. Run tests if available:

   ```bash
   flutter test
   ```

7. Build iOS release without codesigning:

   ```bash
   .mobile-ops/scripts/build-ios.sh
   ```

8. Summarize App Store readiness and release risks.

## Output Format

Report:

- release blockers
- signing and provisioning risks
- privacy permission risks
- test/build result
- App Store Connect readiness notes
