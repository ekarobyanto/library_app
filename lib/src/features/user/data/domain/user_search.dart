import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_search.g.dart';
part 'user_search.freezed.dart';

@freezed
class UserSearch with _$UserSearch {
  const factory UserSearch({
    required String id,
    required String name,
  }) = _UserSearch;

  factory UserSearch.fromJson(Map<String, dynamic> json) =>
      _$UserSearchFromJson(json);
}
