import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/domain/category.dart';

class CategoryRepository extends AppRepository {
  CategoryRepository({required super.service});

  Future<List<BookCategory>> getCategories({
    Map<String, dynamic>? params,
  }) async {
    final response = await service.get('/category-preview', params: params);
    logger.i(response);
    final data = response.data['data'] as Map<String, dynamic>;
    final category = data['category'] as List?;
    return (category ?? []).map((e) => BookCategory.fromJson(e)).toList();
  }

  Future<void> addCategory(String categoryName) async {
    try {
      await service.post('/categories', data: {
        'name': categoryName,
        'description': 'category for book themed $categoryName'
      });
    } catch (err) {
      logger.e('Failed to add category repo: $err');
      rethrow;
    }
  }
}
