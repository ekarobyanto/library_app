// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueryParamsImpl<T> _$$QueryParamsImplFromJson<T>(Map<String, dynamic> json) =>
    _$QueryParamsImpl<T>(
      search: json['search'] as String? ?? '',
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QueryParamsImplToJson<T>(
        _$QueryParamsImpl<T> instance) =>
    <String, dynamic>{
      'search': instance.search,
      'filters': instance.filters,
    };
