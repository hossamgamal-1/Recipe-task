import '../../../core/networking/api_result.dart';
import '../entities/product_summary_entity.dart';
import '../repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository _repo;
  const GetProductsUseCase(this._repo);

  Future<ApiResult<List<ProductSummaryEntity>>> call({
    int pageNumber = 1,
    int pageSize = 20,
  }) => _repo.getProducts(pageNumber: pageNumber, pageSize: pageSize);
}
