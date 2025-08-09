import '../../../core/networking/api_result.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipes_repository.dart';

class GetRecipesUseCase {
  final RecipesRepository _repo;
  const GetRecipesUseCase(this._repo);

  Future<ApiResult<List<RecipeEntity>>> call({
    int pageNumber = 1,
    int pageSize = 20,
  }) => _repo.getRecipes(pageNumber: pageNumber, pageSize: pageSize);
}
