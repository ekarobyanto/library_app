import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/domain/author.dart';
import 'package:library_app/src/features/book/domain/book.dart';

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
class ReportDetail with _$ReportDetail {
  const factory ReportDetail({
    required String id,
    required String description,
    required Book book,
    required UserReportDetail user,
    @JsonKey(name: 'reported_at') required String reportedAt,
  }) = _ReportDetail;

  factory ReportDetail.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailFromJson(json);
}

@freezed
class BookReport with _$BookReport {
  const factory BookReport({
    required String id,
    @JsonKey(name: 'book_name') required String bookName,
    required String author,
  }) = _BookReport;

  factory BookReport.fromJson(Map<String, dynamic> json) =>
      _$BookReportFromJson(json);
}

@freezed
class UserReport with _$UserReport {
  const factory UserReport({
    required String id,
    @JsonKey(name: 'user_name') required String userName,
  }) = _UserReport;

  factory UserReport.fromJson(Map<String, dynamic> json) =>
      _$UserReportFromJson(json);
}

@freezed
class UserReportDetail with _$UserReportDetail {
  const factory UserReportDetail({
    required String id,
    required String name,
  }) = _UserReportDetail;

  factory UserReportDetail.fromJson(Map<String, dynamic> json) =>
      _$UserReportDetailFromJson(json);
}
