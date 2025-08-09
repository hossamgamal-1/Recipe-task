import '../../../core/networking/api_result.dart';
import '../entities/product_details_entity.dart';
import '../repositories/products_repository.dart';

class GetProductDetailsUseCase {
  final ProductsRepository _repo;
  const GetProductDetailsUseCase(this._repo);

  Future<ApiResult<ProductDetailsEntity>> call(int productId) =>
      _repo.getProductDetails(productId: productId);
}
