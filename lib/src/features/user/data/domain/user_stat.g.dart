// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatImpl _$$UserStatImplFromJson(Map<String, dynamic> json) =>
    _$UserStatImpl(
      bookUploaded: (json['book_uploaded'] as num).toInt(),
      bookReaded: (json['book_readed'] as num).toInt(),
    );

Map<String, dynamic> _$$UserStatImplToJson(_$UserStatImpl instance) =>
    <String, dynamic>{
      'book_uploaded': instance.bookUploaded,
      'book_readed': instance.bookReaded,
    };
