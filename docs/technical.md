## Technical Documentation

### Tech stack

- Flutter (Dart >= 3.7)
- State: flutter_bloc (Cubits)
- Networking: Dio + PrettyDioLogger
- DI: GetIt
- JSON: json_serializable + json_annotation
- Testing: flutter_test + mocktail

### Project structure

- `lib/main.dart`: app entry point, initializes DI and `AppSizer`, sets up `MaterialApp` and routing.
- `lib/core`: shared code (di, networking, models, theming, routing, utils, widgets).
- `lib/recipes`: feature module split into data/domain/presentation layers.
- `test/recipes/...`: unit tests for repository layer.

### Notable modules

- Networking
  - `DioFactory`: creates configured instance with baseUrl, timeouts, and logging in debug.
  - `DioHelper`: thin wrapper around GET.
  - `ApiResponse<T>`, `PaginatedList<T>`: generic JSON models with code generation.
  - `ApiResult<T>`: result wrapper with connectivity check and central error mapping via `ErrorHandler`.

- Recipes feature
  - Data: models (DTOs), mappers to entities, remote data source using `DioHelper`.
  - Domain: entities, repository interface, use cases.
  - Presentation: `RecipesCubit`, `CategoriesCubit`, `RecipeDetailsCubit`; screens and widgets.

### Build and codegen

- Run JSON codegen:
  - Build once: `dart run build_runner build --delete-conflicting-outputs`
  - Watch: `dart run build_runner watch --delete-conflicting-outputs`

### Configuration

- API base and endpoints: `core/networking/api_constants.dart`.
- Timeouts: 90s connect/receive in `DioFactory`.
- Logging: PrettyDioLogger active when not in release mode.

### Error handling

- `ErrorHandler` translates Dio errors, HTTP status codes, and generic exceptions to `ApiErrorModel` messages.
- User-facing messages are concise and actionable; unknown cases fallback to a default friendly message.

### Performance considerations

- Sliver-based UI for efficient lists and grids.
- Shimmer placeholders during loading.
- Cached network images (via dependency in pubspec).

### Extensibility

- Add a new feature by replicating the data/domain/presentation pattern.
- Add new endpoints by extending `RecipesRemoteDataSource` and mapping DTOs -> Entities.
- Add additional Cubits for UI states; wire in `AppRouter` and DI.
