## Testing Documentation

### Test strategy

- Unit tests for the repository layer validate mapping and error propagation via `ApiResult`.
- Connectivity is overridden in tests by setting `connectionCheck = () async => true`.
- Remote data sources are mocked with `mocktail`.

### Current coverage (representative)

File: `test/recipes/data/repositories/recipes_repository_impl_test.dart`

- getRecipes
  - Success: maps `PaginatedList<Recipe>` to `List<RecipeEntity>` and returns `SuccessResult`.
  - Failure: when data source throws, returns `FailureResult` with a friendly message.

- getCategories
  - Success: returns `SuccessResult<List<CategoryEntity>>` (length asserted).
  - Failure: exception path returns `FailureResult` with meaningful message.

- getRecipeDetails
  - Success: maps `DetailedRecipe` to `DetailedRecipeEntity` and returns `SuccessResult`.
  - Failure: exception path returns `FailureResult` with meaningful message.

### How to run tests

- Run all tests: `flutter test`
- Run a single file: `flutter test test/recipes/data/repositories/recipes_repository_impl_test.dart`

### Test data patterns

- DTO factories are inlined in tests for clarity (`_getRecipe`, `_getDetailedRecipe`).
- Prefer creating light-weight builders/factories for more complex scenarios.

### Gaps and next steps

- Add tests for Cubits (state transitions for loading, success, error, pagination).
- Add tests for `ErrorHandler` coverage across all DioExceptionType cases.
- Add golden tests for key widgets (grid item, details sections) if snapshot stability is desired.
- Consider integration tests using `flutter_test` with a mocked `Dio` to verify screen flows.
