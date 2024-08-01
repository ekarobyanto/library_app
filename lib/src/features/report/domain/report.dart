import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  const factory Report({
    required String id,
    required String description,
    required BookReport book,
    required UserReport user,
    @JsonKey(name: 'reported_at') required String reportedAt,
    @JsonKey(name: 'is_approved') required bool isApproved,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

@freezed
class BookReport with _$BookReport {
  const factory BookReport({
    required String id,
    required String bookName,
    required String author,
    @Default('') @JsonKey(name: 'thumbnail_url') String thumbnailUrl,
  }) = _BookReport;

  factory BookReport.fromJson(Map<String, dynamic> json) =>
      _$BookReportFromJson(json);
}

@freezed
class UserReport with _$UserReport {
  const factory UserReport({
    required String id,
    required String userName,
  }) = _UserReport;

  factory UserReport.fromJson(Map<String, dynamic> json) =>
      _$UserReportFromJson(json);
}
