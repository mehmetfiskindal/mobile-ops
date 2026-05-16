# App Store Optimization Workflow

Use this workflow when the user asks for `/mobile-ops aso-review`.

## Purpose

Review App Store and Play Store metadata for clarity, conversion, policy risk, and localization opportunities.

## Files To Inspect

- `store/app-store/description.md`
- `store/app-store/keywords.md`
- `store/app-store/release-notes.md`
- `store/play-store/short-description.md`
- `store/play-store/full-description.md`
- `store/play-store/release-notes.md`
- README, onboarding copy, visible app copy, and feature documentation

## Commands To Run

```bash
.mobile-ops/scripts/check-store-metadata.sh
```

## Risk Signals

- Unsupported claims
- Metadata that does not match app behavior
- Missing release notes
- Keyword stuffing
- Weak short description or subtitle
- Missing localization for key markets
- Privacy or monetization claims that conflict with SDK usage

## Output Format

Use `reports/aso-review-report.md`. Do not invent unsupported claims. If a feature is not visible in the app or documentation, mark it as an assumption.
