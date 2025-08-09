## User Guide

### Setup

1) Verify Flutter and Dart are installed
```powershell
flutter --version
dart --version
```

2) Check platforms and environment
```powershell
flutter doctor
```

3) Get dependencies
```powershell
flutter pub get
```

4) Generate JSON code (required before first run)
```powershell
dart run build_runner build --delete-conflicting-outputs
```

5) Start an emulator or connect a device, then run
```powershell
flutter run
```

### Prerequisites

- Flutter SDK installed
- Dart SDK (bundled with Flutter)
- A connected device or emulator

### Install dependencies

```powershell
flutter pub get
```

### Generate code (first time and after model changes)

```powershell
dart run build_runner build --delete-conflicting-outputs
```

(Optional) watch for changes:
```powershell
dart run build_runner watch --delete-conflicting-outputs
```

### Run the app

```powershell
flutter run
```

### Use the app

- Home shows a grid of recipes and a categories row in a pinned app bar.
- Tap a recipe card to see details (ingredients, steps, meta info).
- If an error appears, press Retry to fetch again.

### Troubleshooting

- Stale generated files: re-run build_runner with `--delete-conflicting-outputs`.
- Network/timeout issues: verify internet, or update endpoints in `lib/core/networking/api_constants.dart`.
- Analyzer warnings: run `flutter analyze` and fix lints.
- Slow UI on low-end devices: it may be building skeleton placeholders; wait for network or check logs.
