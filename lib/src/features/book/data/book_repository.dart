import 'dart:math';

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
      final data = FormData.fromMap({
        "description": createBookDTO.description,
        "name": createBookDTO.title,
        "categories": createBookDTO.categories.join(','),
        "doc_url": await MultipartFile.fromFile(
          createBookDTO.docUrl,
          filename: createBookDTO.docUrl.split(('/')).last,
        ),
        "thumbnail_url": await MultipartFile.fromFile(
          createBookDTO.thumbnailUrl,
          filename: createBookDTO.thumbnailUrl.split(('/')).last,
        )
      });
      logger.d(data.fields);
      logger.d(data.files);
      await service.post(
        '/book',
        data: data,
        option: Options(contentType: 'multipart/form-data'),
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> updateBook(
      String bookId, String name, String description) async {
    try {
      await service.put(
        '/book/$bookId',
        data: {
          "description": description,
          "name": name,
        },
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> updateBookCategories(
      String bookId, List<String> categories) async {
    try {
      await service.put(
        '/book/$bookId/category-edit',
        data: {
          "categories": categories.join(','),
        },
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> updateBookDoc(String docPath, String bookId) async {
    try {
      final data = FormData.fromMap(
        {
          "doc_url": await MultipartFile.fromFile(
            docPath,
            filename: docPath.split('/').last,
          ),
        },
      );
      await service.put(
        '/book/$bookId/doc-edit',
        data: data,
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> updateBookThumbnail(String imagePath, String bookId) async {
    try {
      final data = FormData.fromMap({
        "thumbnail_url": await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        )
      });
      await service.put(
        '/book/$bookId/thumbnail-edit',
        data: data,
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      await service.delete('/book/$id');
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> addBookToFavorite(String bookId) async {
    try {
      await service.post('/favorite/$bookId');
    } catch (err) {
      logger.e(err);
      rethrow;
    }
  }

  Future<void> removeBookFromFavorite(String bookId) async {
    try {
      await service.delete('/favorite/$bookId');
    } catch (err) {
      logger.e(err);
      rethrow;
    }
  }

  Future<void> readBook(String bookId) async {
    try {
      await service.get('/read-book/$bookId');
    } catch (err) {
      logger.e(err);
      rethrow;
    }
  }
}
