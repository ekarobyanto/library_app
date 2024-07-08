import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_params.freezed.dart';
part 'query_params.g.dart';

@freezed
class QueryParams<T> with _$QueryParams<T> {
  const factory QueryParams({
    @Default('') String? search,
    @Default([]) List<String>? filters,
  }) = _QueryParams<T>;

  factory QueryParams.fromJson(Map<String, dynamic> json) =>
      _$QueryParamsFromJson<T>(json);
}
