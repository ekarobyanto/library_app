import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true)
class DefaultResponse<T> with _$DefaultResponse<T> {
  factory DefaultResponse({
    required String message,
    required T data,
  }) = _DefaultResponse<T>;

  factory DefaultResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$DefaultResponseFromJson<T>(json, fromJsonT);
}
