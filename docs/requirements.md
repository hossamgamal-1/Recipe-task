## Project Requirements

This document captures what the app does today and what it aims to achieve next. It’s written to be precise, testable, and implementation-aware.

### Scope and goals

- Build a Flutter app that lists recipes and shows details for a selected recipe.
- Fetch data from a public HTTP API (Mocki) using Dio.
- Use BLoC/Cubit for state management and GetIt for dependency injection.
- Provide responsive UI and basic error handling with retry.

Out of scope (for now): authentication, persistence/caching, push notifications, analytics, complex filtering/search, offline-first data storage.

### Functional requirements (current)

1. Home screen
   - Display a pinned sliver app bar with title and logo.
   - Show a horizontal list of recipe categories (read-only visual list for now).
   - Show a grid of recipe cards (2 columns) with skeleton placeholders while loading.
   - On error, show an error message and a Retry button to refetch the first page.

2. Recipe details
   - Navigating to a recipe card opens a details screen using a named route and the recipe id.
   - While loading, show a skeleton view; on success, show details (ingredients, steps, meta info).
   - On error, show an error message and a Retry button that retriggers the fetch for the same id.

3. Networking
   - Read-only GET endpoints to fetch: categories list, paginated recipe list, and detailed recipe by id.
   - Handle common HTTP and connectivity errors and present a user-friendly message.

4. State management
   - Use Cubits for recipes list, categories list, and recipe details.
   - Emit loading/loaded/error states; preserve aggregated pages client-side.

### Functional requirements (near-term backlog)

- Category filtering for the recipes grid (current UI renders chips but doesn’t apply a filter).
- Infinite scroll/load more hooked to scroll end (pagination is supported in Cubit but not wired to scroll).
- Pull-to-refresh.
- Basic search by recipe name.

### Non-functional requirements

- Reliability: timeouts for network requests (90s), graceful error handling, connectivity check before calls.
- Performance: lazy rendering via slivers, lightweight DTO-to-entity mapping, cached network images.
- Responsiveness: adapt sizes via `AppSizer` to various screen dimensions.
- Observability: verbose logging of requests/responses in non-release builds via PrettyDioLogger.
- Code quality: layered architecture (data/domain/presentation), JSON code generation, static analysis with flutter_lints.

### External interfaces

- HTTP Base URL: `https://mocki.io/v1/`
  - Get recipes: `6b2ffb2c-e143-4bf1-94fa-d43da8a33111` with `pageNumber`, `pageSize` queries.
  - Get categories: `00bc95d2-5706-4b08-91b4-5ca00bdb78c7`.
  - Get recipe details: `3ca54879-2bb8-4d35-b2bb-77c95a15012a` with `id` query.

### Constraints and assumptions

- Requires Dart SDK 3.7+ and a Flutter version that supports it.
- No backend authentication; all endpoints are public mocks and may change.
- Pagination “hasMore” is inferred on the client by pageSize equality when missing from the entity model.

### Acceptance criteria (high-level)

- When online and the API responds with success, the home screen shows at least one recipe card and category chip list.
- Tapping a recipe navigates to a details screen that loads and displays recipe details.
- When a network or server error occurs, the user sees a clear message and can tap Retry to try again.
- App adapts visually on different screen sizes using `AppSizer`.
