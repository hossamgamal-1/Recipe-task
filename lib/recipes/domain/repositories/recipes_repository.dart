import '../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';
import '../entities/detailed_recipe_entity.dart';
import '../entities/recipe_entity.dart';

abstract class RecipesRepository {
  Future<ApiResult<List<CategoryEntity>>> getCategories();

  Future<ApiResult<List<RecipeEntity>>> getRecipes({
    required int pageNumber,
    required int pageSize,
  });

  Future<ApiResult<DetailedRecipeEntity>> getRecipeDetails({
    required int productId,
  });
}
