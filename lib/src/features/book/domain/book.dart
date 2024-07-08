import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/domain/author.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@Freezed()
class Book with _$Book {
  factory Book({
    required String? id,
    @Default('') String? name,
    @Default('') String? description,
    @Default(null) Author? author,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'thumbnail_url') @Default('') String? thumbnailUrl,
    @Default('') String? docUrl,
    @Default([]) List<String>? categories,
    @JsonKey(name: 'read_count') @Default(0) int? readCount,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
