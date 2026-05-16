# Monetization Review Workflow

Use this workflow when reviewing subscriptions, in-app purchases, ads, paywalls, or pricing.

## Purpose

Review subscriptions, purchases, ads, paywalls, and entitlement logic for release and policy risk.

## Files To Inspect

- `pubspec.yaml`
- paywall screens and purchase flows in `lib/`
- backend entitlement checks if present
- store metadata and release notes
- privacy policy and data safety files

## Commands To Run

```bash
.mobile-ops/scripts/check-store-metadata.sh
.mobile-ops/scripts/check-permissions.sh
```

Run tests only after locating monetization-related test files.

## Steps

1. Inspect dependencies for monetization SDKs:
   - RevenueCat
   - in_app_purchase
   - AdMob
   - AppLovin
   - custom payment integrations
2. Inspect paywall UI and entitlement checks.
3. Inspect restore purchase flows.
4. Inspect App Store and Play Store policy-sensitive claims.
5. Check privacy disclosures for monetization SDK data collection.
6. Summarize conversion opportunities and compliance risks.

## Risk Signals

- Missing restore purchase path
- Client-only entitlement trust
- Paywall copy promises unsupported features
- Trial, renewal, cancellation, or refund text is unclear
- Ads or attribution SDKs missing privacy disclosure
- Kids or sensitive-category app with tracking or ad ambiguity

## Output Format

Report:

- revenue model
- entitlement risks
- policy risks
- analytics gaps
- suggested experiments
