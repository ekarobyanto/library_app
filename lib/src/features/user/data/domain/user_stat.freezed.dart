// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStat _$UserStatFromJson(Map<String, dynamic> json) {
  return _UserStat.fromJson(json);
}

/// @nodoc
mixin _$UserStat {
  @JsonKey(name: 'book_uploaded')
  int get bookUploaded => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_readed')
  int get bookReaded => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatCopyWith<UserStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatCopyWith<$Res> {
  factory $UserStatCopyWith(UserStat value, $Res Function(UserStat) then) =
      _$UserStatCopyWithImpl<$Res, UserStat>;
  @useResult
  $Res call(
      {@JsonKey(name: 'book_uploaded') int bookUploaded,
      @JsonKey(name: 'book_readed') int bookReaded});
}

/// @nodoc
class _$UserStatCopyWithImpl<$Res, $Val extends UserStat>
    implements $UserStatCopyWith<$Res> {
  _$UserStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookUploaded = null,
    Object? bookReaded = null,
  }) {
    return _then(_value.copyWith(
      bookUploaded: null == bookUploaded
          ? _value.bookUploaded
          : bookUploaded // ignore: cast_nullable_to_non_nullable
              as int,
      bookReaded: null == bookReaded
          ? _value.bookReaded
          : bookReaded // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatImplCopyWith<$Res>
    implements $UserStatCopyWith<$Res> {
  factory _$$UserStatImplCopyWith(
          _$UserStatImpl value, $Res Function(_$UserStatImpl) then) =
      __$$UserStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'book_uploaded') int bookUploaded,
      @JsonKey(name: 'book_readed') int bookReaded});
}

/// @nodoc
class __$$UserStatImplCopyWithImpl<$Res>
    extends _$UserStatCopyWithImpl<$Res, _$UserStatImpl>
    implements _$$UserStatImplCopyWith<$Res> {
  __$$UserStatImplCopyWithImpl(
      _$UserStatImpl _value, $Res Function(_$UserStatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookUploaded = null,
    Object? bookReaded = null,
  }) {
    return _then(_$UserStatImpl(
      bookUploaded: null == bookUploaded
          ? _value.bookUploaded
          : bookUploaded // ignore: cast_nullable_to_non_nullable
              as int,
      bookReaded: null == bookReaded
          ? _value.bookReaded
          : bookReaded // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatImpl implements _UserStat {
  const _$UserStatImpl(
      {@JsonKey(name: 'book_uploaded') required this.bookUploaded,
      @JsonKey(name: 'book_readed') required this.bookReaded});

  factory _$UserStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatImplFromJson(json);

  @override
  @JsonKey(name: 'book_uploaded')
  final int bookUploaded;
  @override
  @JsonKey(name: 'book_readed')
  final int bookReaded;

  @override
  String toString() {
    return 'UserStat(bookUploaded: $bookUploaded, bookReaded: $bookReaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatImpl &&
            (identical(other.bookUploaded, bookUploaded) ||
                other.bookUploaded == bookUploaded) &&
            (identical(other.bookReaded, bookReaded) ||
                other.bookReaded == bookReaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookUploaded, bookReaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatImplCopyWith<_$UserStatImpl> get copyWith =>
      __$$UserStatImplCopyWithImpl<_$UserStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatImplToJson(
      this,
    );
  }
}

abstract class _UserStat implements UserStat {
  const factory _UserStat(
          {@JsonKey(name: 'book_uploaded') required final int bookUploaded,
          @JsonKey(name: 'book_readed') required final int bookReaded}) =
      _$UserStatImpl;

  factory _UserStat.fromJson(Map<String, dynamic> json) =
      _$UserStatImpl.fromJson;

  @override
  @JsonKey(name: 'book_uploaded')
  int get bookUploaded;
  @override
  @JsonKey(name: 'book_readed')
  int get bookReaded;
  @override
  @JsonKey(ignore: true)
  _$$UserStatImplCopyWith<_$UserStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
