# General Release Workflow

Use this workflow when the platform is unclear or the user asks for a general release readiness review.

## Steps

1. Inspect `pubspec.yaml` for version, SDK constraints, package risk, and Flutter environment.
2. Run Flutter health checks:

   ```bash
   .mobile-ops/scripts/flutter-doctor.sh
   .mobile-ops/scripts/check-versioning.sh
   .mobile-ops/scripts/check-secrets.sh
   ```

3. Run static checks:

   ```bash
   flutter analyze
   ```

4. Run tests when available:

   ```bash
   flutter test
   ```

5. Inspect Android and iOS release readiness using:
   - `workflows/android-release.md`
   - `workflows/ios-release.md`
6. Inspect privacy and store metadata using:
   - `workflows/privacy-check.md`
   - `workflows/aso.md`
7. Summarize release blockers, warnings, and recommended next actions.

## Output Format

Use `reports/release-readiness-report.md`.
