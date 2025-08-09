import '../../../core/networking/api_error_handler.dart';
import '../../../core/networking/api_result.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_details_entity.dart';
import '../../domain/entities/product_summary_entity.dart';
import '../../domain/repositories/products_repository.dart';
import '../data_sources/products_remote_data_source.dart';
import '../mappers/products_mappers.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _remote;
  const ProductsRepositoryImpl(this._remote);

  @override
  Future<ApiResult<List<CategoryEntity>>> getCategories() async {
    try {
      final data = await _remote.fetchCategories();
      return SuccessResult(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return FailureResult(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<ProductDetailsEntity>> getProductDetails({
    required int productId,
  }) async {
    try {
      final data = await _remote.fetchProductDetails(productId);
      return SuccessResult(data.toEntity());
    } catch (e) {
      return FailureResult(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<ProductSummaryEntity>>> getProducts({
    int pageNumber = 1,
    int pageSize = 20,
  }) async {
    try {
      final data = await _remote.fetchProducts(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return SuccessResult(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return FailureResult(ErrorHandler.handle(e));
    }
  }
}
