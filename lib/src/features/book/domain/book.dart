import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@Freezed()
class Book with _$Book {
  factory Book({
    required String id,
    required String name,
    required String description,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'created_at') required String createdAt,
    required String thumbnailUrl,
    required String docUrl,
    required List<String> categories,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}


// id": "db31e497-b77e-4627-ba1a-8ecdf04d758e",
//     "name": "paraboy balabala",
//     "description": "deskripsi ganteng",
//     "created_at": "2024-06-14T17:55:56.158976Z",
//     "author": {
//       "id": "3Fqggdt51iTfsgSPiQa92t5aZ4K3",
//       "name": "babi"
//     },
//     "thumbnail_url": "https://storage.googleapis.com/perpus-app/app/book/db31e497-b77e-4627-ba1a-8ecdf04d758e/thumbnail_url/BPJS.jpeg",
//     "doc_url": "https://storage.googleapis.com/perpus-app/app/book/db31e497-b77e-4627-ba1a-8ecdf04d758e/doc_url/Data Hygiene.pdf",
//     "categories": [
//       "politik",
//       "ekonomi"
//     ]