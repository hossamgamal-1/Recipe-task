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
  Future<ApiResult<List<CategoryEntity>>> getCategories() {
    return ApiResult.handle(
      _remote.fetchCategories,
      (data) => data.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<DetailedRecipeEntity>> getRecipeDetails({
    required int productId,
  }) {
    return ApiResult.handle(
      () => _remote.fetchRecipeDetails(productId),
      (data) => data.toEntity(),
    );
  }

  @override
  Future<ApiResult<List<RecipeEntity>>> getRecipes({
    required int pageNumber,
    required int pageSize,
  }) async {
    return ApiResult.handle(
      () => _remote.fetchRecipes(pageNumber: pageNumber, pageSize: pageSize),
      (data) => data.items.map((e) => e.toEntity()).toList(),
    );
  }
}
