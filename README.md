# mobile-ops

Codex-native operations workspace for Flutter and Firebase apps.

`mobile-ops` is a template repo for auditing Flutter + Firebase projects before release. It gives Codex repo-specific instructions, repeatable workflows, store metadata templates, and small shell scripts that perform real checks.

It can be used in two ways:

- as a `.mobile-ops/` folder inside a Flutter app
- as a local Codex plugin from this repo

## MVP Workflows

- Firebase security audit
- Android release checklist
- iOS release checklist
- ASO review
- Privacy check

Each workflow follows the same idea: Codex reads project context, runs small signal-collection scripts, then writes a release-focused report.

## Use In A Flutter Project

Add this repo inside an existing app:

```bash
git submodule add https://github.com/mehmetfiskindal/mobile-ops .mobile-ops
```

Or copy it without git history:

```bash
npx degit mehmetfiskindal/mobile-ops .mobile-ops
```

Then ask Codex:

```text
Use .mobile-ops/AGENTS.md and .mobile-ops/workflows/firebase-audit.md to audit this project.
```

## Prompt Shortcuts

These are human-friendly prompts, not installed shell commands:

```text
/mobile-ops firebase-audit
/mobile-ops android-release
/mobile-ops ios-release
/mobile-ops aso-review
/mobile-ops privacy-check
```

## Codex Plugin Usage

This repo includes a local Codex plugin scaffold:

```text
.agents/plugins/marketplace.json
plugins/mobile-ops/.codex-plugin/plugin.json
plugins/mobile-ops/skills/mobile-ops/SKILL.md
```

When the local plugin is installed or enabled in Codex, use the same prompt shortcuts from the root of a Flutter app:

```text
/mobile-ops firebase-audit
/mobile-ops android-release
/mobile-ops ios-release
/mobile-ops aso-review
/mobile-ops privacy-check
```

The plugin tells Codex to inspect standard Flutter, Firebase, Android, iOS, store metadata, and privacy files, then run matching scripts from `.mobile-ops/scripts/` when this repo is embedded in the app. If you are working directly in this repo, it uses `scripts/` instead.

## Local Script Usage

From the root of a Flutter app:

```bash
.mobile-ops/scripts/firebase-audit.sh
.mobile-ops/scripts/check-secrets.sh
.mobile-ops/scripts/check-firebase-rules.sh
.mobile-ops/scripts/check-permissions.sh
.mobile-ops/scripts/check-store-metadata.sh
.mobile-ops/scripts/check-versioning.sh
.mobile-ops/scripts/flutter-doctor.sh
.mobile-ops/scripts/build-android.sh
.mobile-ops/scripts/build-ios.sh
```

The scripts are intentionally conservative. They check common release and security signals, then Codex should interpret the output and suggest focused patches.

## Repository Layout

```text
mobile-ops/
├── AGENTS.md
├── README.md
├── workflows/
├── templates/
├── scripts/
├── reports/
├── profiles/
├── prompts/
├── store/
├── .agents/plugins/
├── plugins/mobile-ops/
└── examples/
```

## Store Metadata Convention

For app projects, keep store metadata in:

```text
store/
├── app-store/
├── play-store/
└── privacy/
```

See [store/README.md](store/README.md) for the exact file names.

## Profiles

Profiles tune the risk posture without changing the core idea:

- `profiles/indie-app.md`
- `profiles/startup-production.md`
- `profiles/kids-app.md`
- `profiles/subscription-app.md`
- `profiles/ads-supported-app.md`
- `profiles/enterprise-app.md`

Example prompt:

```text
Use .mobile-ops/profiles/subscription-app.md while following .mobile-ops/workflows/privacy-check.md.
```

## Security Note

Do not commit private signing keys, Firebase service account JSON, `.env` files with production secrets, App Store Connect API keys, or Play Console credentials. If a workflow finds sensitive material, rotate it and move it to a secure secret manager or CI secret store.
