import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../../../domain/use_cases/get_recipes.dart';

part 'recipes_state.dart';

//TODO: refactor this
class RecipesCubit extends Cubit<RecipesState> {
  final GetRecipesUseCase _getProducts;
  RecipesCubit(this._getProducts) : super(const RecipesInitial());

  int _page = 1;
  bool _hasMore = true;
  List<RecipeEntity> _items = const [];

  Future<void> load({bool refresh = false}) async {
    if (refresh) {
      _items = [];
      _page = 1;
      _hasMore = true;
    }
    final isLoadMore = _items.isNotEmpty;
    emit(RecipesLoading(isLoadMore: isLoadMore));
    final response = await _getProducts(pageNumber: _page, pageSize: 20);
    switch (response) {
      case SuccessResult(:final data):
        _items = [..._items, ...data];
        // We don't have hasMore from entity; infer by page size
        _hasMore = data.length == 20;
        emit(
          RecipesLoaded(recipes: _items, pageNumber: _page, hasMore: _hasMore),
        );
        _page += 1;
      case FailureResult():
        emit(RecipesError(response.errorMessage));
    }
  }
}
