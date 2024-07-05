// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DefaultResponse<T> _$DefaultResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _DefaultResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DefaultResponse<T> {
  String get message => throw _privateConstructorUsedError;
  T get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultResponseCopyWith<T, DefaultResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultResponseCopyWith<T, $Res> {
  factory $DefaultResponseCopyWith(
          DefaultResponse<T> value, $Res Function(DefaultResponse<T>) then) =
      _$DefaultResponseCopyWithImpl<T, $Res, DefaultResponse<T>>;
  @useResult
  $Res call({String message, T data});
}

/// @nodoc
class _$DefaultResponseCopyWithImpl<T, $Res, $Val extends DefaultResponse<T>>
    implements $DefaultResponseCopyWith<T, $Res> {
  _$DefaultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultResponseImplCopyWith<T, $Res>
    implements $DefaultResponseCopyWith<T, $Res> {
  factory _$$DefaultResponseImplCopyWith(_$DefaultResponseImpl<T> value,
          $Res Function(_$DefaultResponseImpl<T>) then) =
      __$$DefaultResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, T data});
}

/// @nodoc
class __$$DefaultResponseImplCopyWithImpl<T, $Res>
    extends _$DefaultResponseCopyWithImpl<T, $Res, _$DefaultResponseImpl<T>>
    implements _$$DefaultResponseImplCopyWith<T, $Res> {
  __$$DefaultResponseImplCopyWithImpl(_$DefaultResponseImpl<T> _value,
      $Res Function(_$DefaultResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$DefaultResponseImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DefaultResponseImpl<T> implements _DefaultResponse<T> {
  _$DefaultResponseImpl({required this.message, required this.data});

  factory _$DefaultResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$DefaultResponseImplFromJson(json, fromJsonT);

  @override
  final String message;
  @override
  final T data;

  @override
  String toString() {
    return 'DefaultResponse<$T>(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultResponseImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultResponseImplCopyWith<T, _$DefaultResponseImpl<T>> get copyWith =>
      __$$DefaultResponseImplCopyWithImpl<T, _$DefaultResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DefaultResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _DefaultResponse<T> implements DefaultResponse<T> {
  factory _DefaultResponse(
      {required final String message,
      required final T data}) = _$DefaultResponseImpl<T>;

  factory _DefaultResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$DefaultResponseImpl<T>.fromJson;

  @override
  String get message;
  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$DefaultResponseImplCopyWith<T, _$DefaultResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
