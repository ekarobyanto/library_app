// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSearch _$UserSearchFromJson(Map<String, dynamic> json) {
  return _UserSearch.fromJson(json);
}

/// @nodoc
mixin _$UserSearch {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSearchCopyWith<UserSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchCopyWith<$Res> {
  factory $UserSearchCopyWith(
          UserSearch value, $Res Function(UserSearch) then) =
      _$UserSearchCopyWithImpl<$Res, UserSearch>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$UserSearchCopyWithImpl<$Res, $Val extends UserSearch>
    implements $UserSearchCopyWith<$Res> {
  _$UserSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSearchImplCopyWith<$Res>
    implements $UserSearchCopyWith<$Res> {
  factory _$$UserSearchImplCopyWith(
          _$UserSearchImpl value, $Res Function(_$UserSearchImpl) then) =
      __$$UserSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$UserSearchImplCopyWithImpl<$Res>
    extends _$UserSearchCopyWithImpl<$Res, _$UserSearchImpl>
    implements _$$UserSearchImplCopyWith<$Res> {
  __$$UserSearchImplCopyWithImpl(
      _$UserSearchImpl _value, $Res Function(_$UserSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$UserSearchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSearchImpl implements _UserSearch {
  const _$UserSearchImpl({required this.id, required this.name});

  factory _$UserSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSearchImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'UserSearch(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchImplCopyWith<_$UserSearchImpl> get copyWith =>
      __$$UserSearchImplCopyWithImpl<_$UserSearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSearchImplToJson(
      this,
    );
  }
}

abstract class _UserSearch implements UserSearch {
  const factory _UserSearch(
      {required final String id,
      required final String name}) = _$UserSearchImpl;

  factory _UserSearch.fromJson(Map<String, dynamic> json) =
      _$UserSearchImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserSearchImplCopyWith<_$UserSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
