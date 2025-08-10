part of 'recipes_cubit.dart';

sealed class RecipesState {
  const RecipesState();
}

class RecipesInitial extends RecipesState {
  const RecipesInitial();
}

class RecipesLoading extends RecipesState {
  final bool isLoadMore;
  const RecipesLoading({this.isLoadMore = false});
}

class RecipesLoaded extends RecipesState {
  final bool hasMore;
  final int pageNumber;
  final List<RecipeEntity> recipes;
  const RecipesLoaded({
    required this.hasMore,
    required this.recipes,
    required this.pageNumber,
  });
}

class RecipesError extends RecipesState {
  final String errorMessage;
  const RecipesError(this.errorMessage);
}
