// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QueryParams<T> _$QueryParamsFromJson<T>(Map<String, dynamic> json) {
  return _QueryParams<T>.fromJson(json);
}

/// @nodoc
mixin _$QueryParams<T> {
  String? get search => throw _privateConstructorUsedError;
  List<String>? get filters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryParamsCopyWith<T, QueryParams<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryParamsCopyWith<T, $Res> {
  factory $QueryParamsCopyWith(
          QueryParams<T> value, $Res Function(QueryParams<T>) then) =
      _$QueryParamsCopyWithImpl<T, $Res, QueryParams<T>>;
  @useResult
  $Res call({String? search, List<String>? filters});
}

/// @nodoc
class _$QueryParamsCopyWithImpl<T, $Res, $Val extends QueryParams<T>>
    implements $QueryParamsCopyWith<T, $Res> {
  _$QueryParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? filters = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryParamsImplCopyWith<T, $Res>
    implements $QueryParamsCopyWith<T, $Res> {
  factory _$$QueryParamsImplCopyWith(_$QueryParamsImpl<T> value,
          $Res Function(_$QueryParamsImpl<T>) then) =
      __$$QueryParamsImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? search, List<String>? filters});
}

/// @nodoc
class __$$QueryParamsImplCopyWithImpl<T, $Res>
    extends _$QueryParamsCopyWithImpl<T, $Res, _$QueryParamsImpl<T>>
    implements _$$QueryParamsImplCopyWith<T, $Res> {
  __$$QueryParamsImplCopyWithImpl(
      _$QueryParamsImpl<T> _value, $Res Function(_$QueryParamsImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? filters = freezed,
  }) {
    return _then(_$QueryParamsImpl<T>(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryParamsImpl<T> implements _QueryParams<T> {
  const _$QueryParamsImpl(
      {this.search = '', final List<String>? filters = const []})
      : _filters = filters;

  factory _$QueryParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryParamsImplFromJson(json);

  @override
  @JsonKey()
  final String? search;
  final List<String>? _filters;
  @override
  @JsonKey()
  List<String>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QueryParams<$T>(search: $search, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryParamsImpl<T> &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, search, const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryParamsImplCopyWith<T, _$QueryParamsImpl<T>> get copyWith =>
      __$$QueryParamsImplCopyWithImpl<T, _$QueryParamsImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryParamsImplToJson<T>(
      this,
    );
  }
}

abstract class _QueryParams<T> implements QueryParams<T> {
  const factory _QueryParams(
      {final String? search,
      final List<String>? filters}) = _$QueryParamsImpl<T>;

  factory _QueryParams.fromJson(Map<String, dynamic> json) =
      _$QueryParamsImpl<T>.fromJson;

  @override
  String? get search;
  @override
  List<String>? get filters;
  @override
  @JsonKey(ignore: true)
  _$$QueryParamsImplCopyWith<T, _$QueryParamsImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
