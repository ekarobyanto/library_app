// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      docUrl: json['doc_url'] as String? ?? '',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      readCount: (json['read_count'] as num?)?.toInt() ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'author': instance.author,
      'created_at': instance.createdAt,
      'thumbnail_url': instance.thumbnailUrl,
      'doc_url': instance.docUrl,
      'categories': instance.categories,
      'read_count': instance.readCount,
      'is_favorite': instance.isFavorite,
    };

_$BookLastReadImpl _$$BookLastReadImplFromJson(Map<String, dynamic> json) =>
    _$BookLastReadImpl(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      author: json['author'] as String? ?? null,
      createdAt: json['created_at'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      docUrl: json['doc_url'] as String? ?? '',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      readCount: (json['read_count'] as num?)?.toInt() ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$BookLastReadImplToJson(_$BookLastReadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'author': instance.author,
      'created_at': instance.createdAt,
      'thumbnail_url': instance.thumbnailUrl,
      'doc_url': instance.docUrl,
      'categories': instance.categories,
      'read_count': instance.readCount,
      'is_favorite': instance.isFavorite,
    };
