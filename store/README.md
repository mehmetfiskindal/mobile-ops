# Store Metadata Structure

`mobile-ops` recommends this structure inside Flutter apps so Codex can audit store metadata consistently:

```text
store/
├── app-store/
│   ├── description.md
│   ├── keywords.md
│   └── release-notes.md
├── play-store/
│   ├── short-description.md
│   ├── full-description.md
│   └── release-notes.md
└── privacy/
    ├── policy.md
    └── data-safety.md
```

Keep these files close to the app code so release, ASO, and privacy reviews use the same source of truth.
