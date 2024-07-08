import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class Author with _$Author {
  factory Author({
    required String? id,
    @Default('') String? name,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
