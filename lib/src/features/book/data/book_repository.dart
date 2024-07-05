import 'package:dio/dio.dart';
import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/book/dto/create_book.dto.dart';
import 'package:library_app/src/model/response.dart';

class BookParam {
  final String url;
  final String? search;
  final String? filter;

  BookParam({
    required this.url,
    this.search,
    this.filter,
  });
}

class BookRepository extends AppRepository {
  BookRepository({required super.service});

  Future<List<Book>> getBooksFromUrl({
    required String url,
    String? search,
  }) async {
    try {
      return await service.dio.get(
        url,
        queryParameters: {
          'search': (search ?? ''),
        },
      ).then(
        (res) => (res.data as DefaultResponse<List<Map<String, dynamic>>>)
            .data
            .map((res) => Book.fromJson(res))
            .toList(),
      );
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
}
