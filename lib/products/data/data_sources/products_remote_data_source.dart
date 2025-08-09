import '../../../core/models/api_response.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/api_request_model.dart';
import '../../../core/networking/dio_helper.dart';
import '../models/category.dart';
import '../models/detailed_item.dart';
import '../models/item.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Category>> fetchCategories();
  Future<List<Item>> fetchProducts({int pageNumber = 1, int pageSize = 20});
  Future<DetailedItem> fetchProductDetails(int productId);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final DioHelper _dioHelper;
  const ProductsRemoteDataSourceImpl(this._dioHelper);

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
  Future<List<Item>> fetchProducts({
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
      (json) => PaginatedItems.fromJson(json).items,
    );

    return apiResponse.data;
  }

  @override
  Future<DetailedItem> fetchProductDetails(int productId) async {
    final response = await _dioHelper.getData(
      ApiRequestModel(
        endPoint: ApiConstants.getProductDetailsEP,
        queries: {'id': productId},
      ),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => DetailedItem.fromJson(json),
    );

    return apiResponse.data;
  }
}
