part of 'recipe_details_cubit.dart';

sealed class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();

  @override
  List<Object?> get props => [];
}

class RecipeDetailsInitial extends RecipeDetailsState {
  const RecipeDetailsInitial();
}

class RecipeDetailsLoading extends RecipeDetailsState {
  const RecipeDetailsLoading();
}

class RecipeDetailsLoaded extends RecipeDetailsState {
  final DetailedRecipeEntity details;
  const RecipeDetailsLoaded(this.details);

  @override
  List<Object?> get props => [details];
}

class RecipeDetailsError extends RecipeDetailsState {
  final String message;
  const RecipeDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
