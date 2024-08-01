// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      book: BookReport.fromJson(json['book'] as Map<String, dynamic>),
      user: UserReport.fromJson(json['user'] as Map<String, dynamic>),
      reportedAt: json['reported_at'] as String,
      isApproved: json['is_approved'] as bool,
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'book': instance.book,
      'user': instance.user,
      'reported_at': instance.reportedAt,
      'is_approved': instance.isApproved,
    };

_$BookReportImpl _$$BookReportImplFromJson(Map<String, dynamic> json) =>
    _$BookReportImpl(
      id: json['id'] as String,
      bookName: json['bookName'] as String,
      author: json['author'] as String,
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
    );

Map<String, dynamic> _$$BookReportImplToJson(_$BookReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookName': instance.bookName,
      'author': instance.author,
      'thumbnail_url': instance.thumbnailUrl,
    };

_$UserReportImpl _$$UserReportImplFromJson(Map<String, dynamic> json) =>
    _$UserReportImpl(
      id: json['id'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$UserReportImplToJson(_$UserReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
    };
