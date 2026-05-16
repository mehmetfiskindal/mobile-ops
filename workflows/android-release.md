# Android Release Workflow

Use this workflow when the user asks for `/mobile-ops android-release`.

## Steps

1. Run Flutter doctor:

   ```bash
   .mobile-ops/scripts/flutter-doctor.sh
   ```

2. Inspect `pubspec.yaml` version.
3. Inspect Android signing config:
   - `android/app/build.gradle`
   - `android/app/build.gradle.kts`
   - `android/key.properties`
   - CI secret references
4. Check Android SDK settings:
   - `minSdk`
   - `targetSdk`
   - `compileSdk`
   - Kotlin and Gradle plugin versions
5. Check package identity:
   - `applicationId`
   - app label
   - launcher icon
6. Run:

   ```bash
   flutter analyze
   ```

7. Run tests if available:

   ```bash
   flutter test
   ```

8. Build app bundle:

   ```bash
   .mobile-ops/scripts/build-android.sh
   ```

9. Summarize risks before release.

## Output Format

Report:

- release blockers
- signing risks
- SDK/version risks
- test/build result
- Play Console readiness notes
