// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateReportDto _$CreateReportDtoFromJson(Map<String, dynamic> json) {
  return _CreateReportDto.fromJson(json);
}

/// @nodoc
mixin _$CreateReportDto {
  String get description => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateReportDtoCopyWith<CreateReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReportDtoCopyWith<$Res> {
  factory $CreateReportDtoCopyWith(
          CreateReportDto value, $Res Function(CreateReportDto) then) =
      _$CreateReportDtoCopyWithImpl<$Res, CreateReportDto>;
  @useResult
  $Res call({String description, String bookId});
}

/// @nodoc
class _$CreateReportDtoCopyWithImpl<$Res, $Val extends CreateReportDto>
    implements $CreateReportDtoCopyWith<$Res> {
  _$CreateReportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? bookId = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReportDtoImplCopyWith<$Res>
    implements $CreateReportDtoCopyWith<$Res> {
  factory _$$CreateReportDtoImplCopyWith(_$CreateReportDtoImpl value,
          $Res Function(_$CreateReportDtoImpl) then) =
      __$$CreateReportDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String bookId});
}

/// @nodoc
class __$$CreateReportDtoImplCopyWithImpl<$Res>
    extends _$CreateReportDtoCopyWithImpl<$Res, _$CreateReportDtoImpl>
    implements _$$CreateReportDtoImplCopyWith<$Res> {
  __$$CreateReportDtoImplCopyWithImpl(
      _$CreateReportDtoImpl _value, $Res Function(_$CreateReportDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? bookId = null,
  }) {
    return _then(_$CreateReportDtoImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReportDtoImpl implements _CreateReportDto {
  const _$CreateReportDtoImpl(
      {required this.description, required this.bookId});

  factory _$CreateReportDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReportDtoImplFromJson(json);

  @override
  final String description;
  @override
  final String bookId;

  @override
  String toString() {
    return 'CreateReportDto(description: $description, bookId: $bookId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReportDtoImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookId, bookId) || other.bookId == bookId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, bookId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReportDtoImplCopyWith<_$CreateReportDtoImpl> get copyWith =>
      __$$CreateReportDtoImplCopyWithImpl<_$CreateReportDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReportDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateReportDto implements CreateReportDto {
  const factory _CreateReportDto(
      {required final String description,
      required final String bookId}) = _$CreateReportDtoImpl;

  factory _CreateReportDto.fromJson(Map<String, dynamic> json) =
      _$CreateReportDtoImpl.fromJson;

  @override
  String get description;
  @override
  String get bookId;
  @override
  @JsonKey(ignore: true)
  _$$CreateReportDtoImplCopyWith<_$CreateReportDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
