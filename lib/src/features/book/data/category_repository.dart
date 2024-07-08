import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/domain/category.dart';

class CategoryRepository extends AppRepository {
  CategoryRepository({required super.service});

  Future<List<BookCategory>> getCategories({
    Map<String, dynamic>? params,
  }) async {
    final response = await service.get('/categories', params: params);
    logger.i(response);
    final categories = response.data['data'] as List;
    return categories.map((e) => BookCategory.fromJson(e)).toList();
  }
}
