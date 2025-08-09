import '../../../core/models/api_response.dart';
import '../../../core/models/paginated_list.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/api_request_model.dart';
import '../../../core/networking/dio_helper.dart';
import '../models/category.dart';
import '../models/detailed_recipe.dart';
import '../models/recipe.dart';

abstract class RecipesRemoteDataSource {
  Future<List<Category>> fetchCategories();
  Future<List<Recipe>> fetchRecipes({int pageNumber = 1, int pageSize = 20});
  Future<DetailedRecipe> fetchRecipeDetails(int productId);
}

class RecipesRemoteDataSourceImpl implements RecipesRemoteDataSource {
  final DioHelper _dioHelper;
  const RecipesRemoteDataSourceImpl(this._dioHelper);

  @override
  Future<List<Category>> fetchCategories() async {
    final response = await _dioHelper.getData(
      const ApiRequestModel(endPoint: ApiConstants.getCategoriesEP),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
      (json) => (json as List).map((e) => Category.fromJson(e)).toList(),
    );

    return apiResponse.data;
  }

  @override
  Future<List<Recipe>> fetchRecipes({
    int pageNumber = 1,
    int pageSize = 20,
  }) async {
    final response = await _dioHelper.getData(
      ApiRequestModel(
        endPoint: ApiConstants.getProductsEP,
        queries: {'pageNumber': pageNumber, 'pageSize': pageSize},
      ),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
      (json) =>
          PaginatedList.fromJson(
            json as Map<String, dynamic>,
            (item) => Recipe.fromJson(item),
          ).items,
    );

    return apiResponse.data;
  }

  @override
  Future<DetailedRecipe> fetchRecipeDetails(int productId) async {
    final response = await _dioHelper.getData(
      ApiRequestModel(
        endPoint: ApiConstants.getProductDetailsEP,
        queries: {'id': productId},
      ),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => DetailedRecipe.fromJson(json),
    );

    return apiResponse.data;
  }
}
