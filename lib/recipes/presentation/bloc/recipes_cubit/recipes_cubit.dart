import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../../../domain/use_cases/get_recipes.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final GetRecipesUseCase _getRecipes;
  RecipesCubit(this._getRecipes) : super(const RecipesInitial());

  Future<void> load({bool refresh = false}) async {
    emit(RecipesLoading(isLoadMore: _getRecipes.items.isNotEmpty && !refresh));

    final response = await _getRecipes.loadNext(refresh: refresh);

    switch (response) {
      case SuccessResult<List<RecipeEntity>>():
        emit(
          RecipesLoaded(
            recipes: response.data,
            pageNumber: _getRecipes.lastLoadedPage,
            hasMore: _getRecipes.hasMore,
          ),
        );
      case FailureResult():
        emit(RecipesError(response.errorMessage));
    }
  }
}
