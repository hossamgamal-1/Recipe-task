import '../../../core/networking/api_result.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/detailed_recipe_entity.dart';
import '../../domain/entities/recipe_entity.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../data_sources/recipes_remote_data_source.dart';
import '../mappers/category_mapper.dart';
import '../mappers/detailed_recipe_mapper.dart';
import '../mappers/recipe_mapper.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesRemoteDataSource _remote;
  const RecipesRepositoryImpl(this._remote);

  @override
  Future<ApiResult<List<CategoryEntity>>> getCategories() async {
    try {
      final data = await _remote.fetchCategories();

      return SuccessResult(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return FailureResult(e);
    }
  }

  @override
  Future<ApiResult<DetailedRecipeEntity>> getRecipeDetails({
    required int productId,
  }) async {
    try {
      final data = await _remote.fetchRecipeDetails(productId);

      return SuccessResult(data.toEntity());
    } catch (e) {
      return FailureResult(e);
    }
  }

  @override
  Future<ApiResult<List<RecipeEntity>>> getRecipes({
    int pageNumber = 1,
    int pageSize = 20,
  }) async {
    try {
      final data = await _remote.fetchRecipes(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return SuccessResult(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return FailureResult(e);
    }
  }
}
