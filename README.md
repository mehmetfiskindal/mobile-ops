# mobile-ops

Codex-native operations workspace for Flutter and Firebase apps.

`mobile-ops` is a template repo for auditing Flutter + Firebase projects before release. It gives Codex repo-specific instructions, repeatable workflows, store metadata templates, and small shell scripts that perform real checks.

## MVP Workflows

- Firebase security audit
- Android release checklist
- iOS release checklist
- ASO review
- Privacy check

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

## Local Script Usage

From the root of a Flutter app:

```bash
.mobile-ops/scripts/firebase-audit.sh
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
└── examples/
```

## Security Note

Do not commit private signing keys, Firebase service account JSON, `.env` files with production secrets, App Store Connect API keys, or Play Console credentials. If a workflow finds sensitive material, rotate it and move it to a secure secret manager or CI secret store.
