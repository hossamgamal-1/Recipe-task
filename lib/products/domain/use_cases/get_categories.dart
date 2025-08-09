import '../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';
import '../repositories/products_repository.dart';

class GetCategoriesUseCase {
  final ProductsRepository _repo;
  const GetCategoriesUseCase(this._repo);

  Future<ApiResult<List<CategoryEntity>>> call() => _repo.getCategories();
}
