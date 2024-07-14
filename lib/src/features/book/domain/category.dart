import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/domain/book.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class BookCategory with _$BookCategory {
  factory BookCategory({
    required String id,
    required String name,
    required String description,
    // @Default([]) List<Book> books,
  }) = _BookCategory;

  factory BookCategory.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryFromJson(json);
}
