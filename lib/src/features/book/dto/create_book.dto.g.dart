// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_book.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateBookDTOImpl _$$CreateBookDTOImplFromJson(Map<String, dynamic> json) =>
    _$CreateBookDTOImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      docUrl: json['doc_url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CreateBookDTOImplToJson(_$CreateBookDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'doc_url': instance.docUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'categories': instance.categories,
    };
