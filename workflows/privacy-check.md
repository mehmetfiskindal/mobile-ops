# Privacy Check Workflow

Use this workflow when the user asks for `/mobile-ops privacy-check`.

## Steps

1. Inspect app permissions:
   - `ios/Runner/Info.plist`
   - `android/app/src/main/AndroidManifest.xml`
2. Inspect SDKs and packages in `pubspec.yaml`.
3. Inspect Firebase usage:
   - Analytics
   - Crashlytics
   - Messaging
   - Remote Config
   - Performance Monitoring
4. Inspect consent, account deletion, data export, and privacy settings if present.
5. Compare findings with store privacy labels and privacy policy files if available.
6. Use `templates/privacy-policy.md` for a draft or gap analysis.

## Output Format

Report:

- collected data categories
- permission rationale
- missing disclosures
- store privacy label risks
- privacy policy patch suggestions
