// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_book.dto.freezed.dart';
part 'create_book.dto.g.dart';

@Freezed(toJson: true)
class CreateBookDTO with _$CreateBookDTO {
  factory CreateBookDTO({
    required String title,
    required String description,
    @JsonKey(name: 'doc_url') required String docUrl,
    @JsonKey(name: 'thumbnail_url') required String thumbnailUrl,
    required List<String> categories,
  }) = _CreateBookDTO;

  factory CreateBookDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateBookDTOFromJson(json);
}
