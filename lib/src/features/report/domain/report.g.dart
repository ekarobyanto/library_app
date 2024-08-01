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

_$ReportDetailImpl _$$ReportDetailImplFromJson(Map<String, dynamic> json) =>
    _$ReportDetailImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      user: UserReportDetail.fromJson(json['user'] as Map<String, dynamic>),
      reportedAt: json['reported_at'] as String,
    );

Map<String, dynamic> _$$ReportDetailImplToJson(_$ReportDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'book': instance.book,
      'user': instance.user,
      'reported_at': instance.reportedAt,
    };

_$BookReportImpl _$$BookReportImplFromJson(Map<String, dynamic> json) =>
    _$BookReportImpl(
      id: json['id'] as String,
      bookName: json['book_name'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$$BookReportImplToJson(_$BookReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_name': instance.bookName,
      'author': instance.author,
    };

_$UserReportImpl _$$UserReportImplFromJson(Map<String, dynamic> json) =>
    _$UserReportImpl(
      id: json['id'] as String,
      userName: json['user_name'] as String,
    );

Map<String, dynamic> _$$UserReportImplToJson(_$UserReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
    };

_$UserReportDetailImpl _$$UserReportDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$UserReportDetailImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserReportDetailImplToJson(
        _$UserReportDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
