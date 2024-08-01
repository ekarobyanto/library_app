import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stat.freezed.dart';
part 'user_stat.g.dart';

@freezed
class UserStat with _$UserStat {
  const factory UserStat({
    @JsonKey(name: 'book_uploaded') required int bookUploaded,
    @JsonKey(name: 'book_readed') required int bookReaded,
  }) = _UserStat;

  factory UserStat.fromJson(Map<String, dynamic> json) =>
      _$UserStatFromJson(json);
}
