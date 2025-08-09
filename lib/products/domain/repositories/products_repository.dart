import '../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';
import '../entities/product_details_entity.dart';
import '../entities/product_summary_entity.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<CategoryEntity>>> getCategories();

  Future<ApiResult<List<ProductSummaryEntity>>> getProducts({
    int pageNumber = 1,
    int pageSize = 20,
  });

  Future<ApiResult<ProductDetailsEntity>> getProductDetails({
    required int productId,
  });
}
