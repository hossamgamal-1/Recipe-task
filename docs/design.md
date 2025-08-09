## Design Documentation

This document explains the architecture, data flow, and UI composition for the project.

### Architecture style

- Layered Clean-ish architecture per feature (recipes):
  - Data layer: DTOs, mappers, remote data sources, repository implementation.
  - Domain layer: entities, repository interfaces, use cases.
  - Presentation layer: Cubits + Widgets.
- Cross-cutting core: networking (Dio, error handling), routing, DI, theming, shared widgets.

### Dependency Injection

- GetIt is used via `setupDependencies()` (`lib/core/di/di.dart`).
- Singletons:
  - `DioHelper(DioFactory.instance)`
  - `RecipesRemoteDataSourceImpl`
  - `RecipesRepositoryImpl`
  - Use cases: `GetRecipesUseCase`, `GetCategoriesUseCase`, `GetRecipeDetailsUseCase`

### Navigation

- Centralized in `AppRouter.onGenerateRoute` with route names in `AppRoutes`.
- Home (`/`) provides `RecipesCubit` and `CategoriesCubit`.
- Details (`/recipeDetails`) expects an `int` id in `settings.arguments` and builds a `RecipeDetailsCubit`.

### Networking and error handling

- `DioFactory` builds a configured Dio instance (timeouts, baseUrl, PrettyDioLogger in debug).
- `DioHelper` wraps simple GET operations using `ApiRequestModel`.
- `ApiResponse<T>` and `PaginatedList<T>` are JSON-serializable models with code generation.
- `ApiResult<T>` encapsulates `SuccessResult`/`FailureResult` and performs:
  1. Connectivity check via `InternetConnectionChecker` (overridable for tests).
  2. Invocation of remote call function producing `ApiResponse<T>`.
  3. Mapping success or generating a user message with `ErrorHandler` for failures/exceptions.
- `ErrorHandler` maps Dio exceptions and server responses to an `ApiErrorModel` with friendly text.

### Data flow per feature

- Recipes List
  - UI triggers `RecipesCubit.load()`.
  - Cubit calls `GetRecipesUseCase -> RecipesRepository -> RemoteDataSource.fetchRecipes`.
  - On success: map DTOs to `RecipeEntity`, accumulate pages, emit `RecipesLoaded`.
  - On failure: emit `RecipesError` with message; UI shows Retry.

- Categories List
  - UI builds chips from `CategoriesCubit` state (`CategoriesLoaded`).

- Recipe Details
  - On navigation, `RecipeDetailsCubit.load(id)` fetches and emits states similarly.

### UI composition and theming

- `AppSizer` scales dimensions and font sizes relative to a 393x852 design size.
- Color palette is defined in `AppColors`. Shared text styles and widgets (shimmer, cards, text wrappers) compose the UI.
- Screens:
  - `RecipesScreen`: CustomScrollView with `RecipesSliverAppBar` and `RecipesGridBlocBuilder`.
  - `RecipeDetailsScreen`: BlocBuilder rendering skeleton/content/error.

### Known design trade-offs

- Category chips are presentational; they don’t filter the grid yet.
- Pagination is manual in `RecipesCubit` and infers `hasMore` by page size; backend support would be more robust.
- No caching layer; every visit fetches fresh data.
