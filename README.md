## Recipe Task (Flutter)

A simple, cleanly-structured Flutter app that lists recipes, shows categories, and displays detailed info for a selected recipe. Built with BLoC (Cubit), Dio, GetIt, and JSON code generation.

### Features

- Recipes grid with skeleton loading states
- Categories chips in a pinned sliver app bar
- Recipe details screen with ingredients and steps
- Robust error handling with retry
- Responsive layout via a lightweight sizing helper

### Architecture (high level)

- Core: routing, DI, networking (Dio), theming, shared widgets/utilities
- Feature modules: data (DTOs, mappers, remote), domain (entities, use cases, repo interfaces), presentation (Cubits, UI)

### Project structure

```
lib/
	core/             # di, routing, networking, theming, shared models/widgets
	recipes/          # feature module
		data/           # DTOs, mappers, remote data sources, repo impl
		domain/         # entities, use cases, repo interface
		presentation/   # cubits, screens, widgets
test/
	recipes/          # repository unit tests
```

### Quick start (Windows PowerShell)
### Setup

If it’s your first time on this machine, follow these steps:

1) Verify Flutter and Dart (Make sure to have dart version >= 3.7)
```powershell
flutter --version
dart --version
```

2) Check environment and platforms
```powershell
flutter doctor
```

3) Install project dependencies
```powershell
flutter pub get
```

4) Generate JSON code (required before first run)
```powershell
dart run build_runner build --delete-conflicting-outputs
```

5) Run on your target device/emulator
```powershell
flutter run
```

For more details and troubleshooting, see the User Guide: [docs/user.md#setup](docs/user.md#setup)


1) Install dependencies
```powershell
flutter pub get
```

2) Generate JSON code
```powershell
dart run build_runner build --delete-conflicting-outputs
```

3) Run the app
```powershell
flutter run
```

4) Run tests
```powershell
flutter test
```

5) Lint
```powershell
flutter analyze
```

### Configuration

API base and endpoints are defined in `lib/core/networking/api_constants.dart`:
- Base: `https://mocki.io/v1/`
- Recipes: `6b2ffb2c-e143-4bf1-94fa-d43da8a33111` (pageNumber, pageSize)
- Categories: `00bc95d2-5706-4b08-91b4-5ca00bdb78c7`
- Recipe details: `3ca54879-2bb8-4d35-b2bb-77c95a15012a` (id)

### Tech stack

- Flutter (Dart >= 3.7)
- State: flutter_bloc (Cubits)
- Networking: Dio (+ PrettyDioLogger in debug)
- DI: GetIt
- JSON: json_serializable + json_annotation
- Tests: flutter_test + mocktail

### Documentation

This README is the front door to the project. For deep dives, use the guides below:

- Requirements — what the app does and the constraints: [docs/requirements.md](docs/requirements.md)
- Design — architecture decisions and data flow: [docs/design.md](docs/design.md)
- Technical — stack, modules, configuration, codegen: [docs/technical.md](docs/technical.md)
- User Guide — setup, run, usage, troubleshooting: [docs/user.md](docs/user.md)
- Testing — strategy, current coverage, how to run: [docs/testing.md](docs/testing.md)

Need help right now? See troubleshooting in the User Guide: [docs/user.md#troubleshooting](docs/user.md#troubleshooting)