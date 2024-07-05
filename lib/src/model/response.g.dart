// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefaultResponseImpl<T> _$$DefaultResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$DefaultResponseImpl<T>(
      message: json['message'] as String,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$$DefaultResponseImplToJson<T>(
  _$DefaultResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': toJsonT(instance.data),
    };
