import 'package:dio/dio.dart';
import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/book/dto/create_book.dto.dart';

class BookRepository extends AppRepository {
  BookRepository({required super.service});

  Future<Book> getBookById(String id) async {
    try {
      final response = await service.get('/book/$id');
      return Book.fromJson(response.data['data']);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<List<Book>> getBooksFromUrl({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await service.get(url, params: params);
      if (response.data["data"] == null) return [];
      return (response.data["data"] as List)
          .map((book) => Book.fromJson(book))
          .toList();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> createBook(CreateBookDTO createBookDTO) async {
    try {
      await service.dio.post(
        '/book',
        data: {
          ...createBookDTO.toJson(),
          "doc_url": MultipartFile.fromString(createBookDTO.docUrl),
          "thumbnail_url": MultipartFile.fromString(createBookDTO.thumbnailUrl)
        },
        options: Options(contentType: 'multipart/form-data'),
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> updateBook(CreateBookDTO createBookDTO) async {
    try {
      await service.dio.post(
        '/book',
        data: {
          ...createBookDTO.toJson(),
          "doc_url": MultipartFile.fromString(createBookDTO.docUrl),
          "thumbnail_url": MultipartFile.fromString(createBookDTO.thumbnailUrl)
        },
        options: Options(contentType: 'multipart/form-data'),
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
