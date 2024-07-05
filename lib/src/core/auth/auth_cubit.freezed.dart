// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) loading,
    required TResult Function(UserCredential? userCred) signedIn,
    required TResult Function() signedUp,
    required TResult Function() signedOut,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? loading,
    TResult? Function(UserCredential? userCred)? signedIn,
    TResult? Function()? signedUp,
    TResult? Function()? signedOut,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? loading,
    TResult Function(UserCredential? userCred)? signedIn,
    TResult Function()? signedUp,
    TResult Function()? signedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedIn value) signedIn,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_SignedOut value) signedOut,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SignedIn value)? signedIn,
    TResult? Function(_SignedUp value)? signedUp,
    TResult? Function(_SignedOut value)? signedOut,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedIn value)? signedIn,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_SignedOut value)? signedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$LoadingImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState.loading(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) loading,
    required TResult Function(UserCredential? userCred) signedIn,
    required TResult Function() signedUp,
    required TResult Function() signedOut,
    required TResult Function(String message) error,
  }) {
    return loading(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? loading,
    TResult? Function(UserCredential? userCred)? signedIn,
    TResult? Function()? signedUp,
    TResult? Function()? signedOut,
    TResult? Function(String message)? error,
  }) {
    return loading?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? loading,
    TResult Function(UserCredential? userCred)? signedIn,
    TResult Function()? signedUp,
    TResult Function()? signedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedIn value) signedIn,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_SignedOut value) signedOut,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SignedIn value)? signedIn,
    TResult? Function(_SignedUp value)? signedUp,
    TResult? Function(_SignedOut value)? signedOut,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedIn value)? signedIn,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_SignedOut value)? signedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading([final String? message]) = _$LoadingImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedInImplCopyWith<$Res> {
  factory _$$SignedInImplCopyWith(
          _$SignedInImpl value, $Res Function(_$SignedInImpl) then) =
      __$$SignedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCredential? userCred});
}

/// @nodoc
class __$$SignedInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignedInImpl>
    implements _$$SignedInImplCopyWith<$Res> {
  __$$SignedInImplCopyWithImpl(
      _$SignedInImpl _value, $Res Function(_$SignedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCred = freezed,
  }) {
    return _then(_$SignedInImpl(
      userCred: freezed == userCred
          ? _value.userCred
          : userCred // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
    ));
  }
}

/// @nodoc

class _$SignedInImpl implements _SignedIn {
  const _$SignedInImpl({this.userCred});

  @override
  final UserCredential? userCred;

  @override
  String toString() {
    return 'AuthState.signedIn(userCred: $userCred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedInImpl &&
            (identical(other.userCred, userCred) ||
                other.userCred == userCred));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCred);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedInImplCopyWith<_$SignedInImpl> get copyWith =>
      __$$SignedInImplCopyWithImpl<_$SignedInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) loading,
    required TResult Function(UserCredential? userCred) signedIn,
    required TResult Function() signedUp,
    required TResult Function() signedOut,
    required TResult Function(String message) error,
  }) {
    return signedIn(userCred);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? loading,
    TResult? Function(UserCredential? userCred)? signedIn,
    TResult? Function()? signedUp,
    TResult? Function()? signedOut,
    TResult? Function(String message)? error,
  }) {
    return signedIn?.call(userCred);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? loading,
    TResult Function(UserCredential? userCred)? signedIn,
    TResult Function()? signedUp,
    TResult Function()? signedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(userCred);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedIn value) signedIn,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_SignedOut value) signedOut,
    required TResult Function(_Error value) error,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SignedIn value)? signedIn,
    TResult? Function(_SignedUp value)? signedUp,
    TResult? Function(_SignedOut value)? signedOut,
    TResult? Function(_Error value)? error,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedIn value)? signedIn,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_SignedOut value)? signedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class _SignedIn implements AuthState {
  const factory _SignedIn({final UserCredential? userCred}) = _$SignedInImpl;

  UserCredential? get userCred;
  @JsonKey(ignore: true)
  _$$SignedInImplCopyWith<_$SignedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedUpImplCopyWith<$Res> {
  factory _$$SignedUpImplCopyWith(
          _$SignedUpImpl value, $Res Function(_$SignedUpImpl) then) =
      __$$SignedUpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedUpImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignedUpImpl>
    implements _$$SignedUpImplCopyWith<$Res> {
  __$$SignedUpImplCopyWithImpl(
      _$SignedUpImpl _value, $Res Function(_$SignedUpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignedUpImpl implements _SignedUp {
  const _$SignedUpImpl();

  @override
  String toString() {
    return 'AuthState.signedUp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedUpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) loading,
    required TResult Function(UserCredential? userCred) signedIn,
    required TResult Function() signedUp,
    required TResult Function() signedOut,
    required TResult Function(String message) error,
  }) {
    return signedUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? loading,
    TResult? Function(UserCredential? userCred)? signedIn,
    TResult? Function()? signedUp,
    TResult? Function()? signedOut,
    TResult? Function(String message)? error,
  }) {
    return signedUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? loading,
    TResult Function(UserCredential? userCred)? signedIn,
    TResult Function()? signedUp,
    TResult Function()? signedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedIn value) signedIn,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_SignedOut value) signedOut,
    required TResult Function(_Error value) error,
  }) {
    return signedUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SignedIn value)? signedIn,
    TResult? Function(_SignedUp value)? signedUp,
    TResult? Function(_SignedOut value)? signedOut,
    TResult? Function(_Error value)? error,
  }) {
    return signedUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedIn value)? signedIn,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_SignedOut value)? signedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp(this);
    }
    return orElse();
  }
}

abstract class _SignedUp implements AuthState {
  const factory _SignedUp() = _$SignedUpImpl;
}

/// @nodoc
abstract class _$$SignedOutImplCopyWith<$Res> {
  factory _$$SignedOutImplCopyWith(
          _$SignedOutImpl value, $Res Function(_$SignedOutImpl) then) =
      __$$SignedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignedOutImpl>
    implements _$$SignedOutImplCopyWith<$Res> {
  __$$SignedOutImplCopyWithImpl(
      _$SignedOutImpl _value, $Res Function(_$SignedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignedOutImpl implements _SignedOut {
  const _$SignedOutImpl();

  @override
  String toString() {
    return 'AuthState.signedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) loading,
    required TResult Function(UserCredential? userCred) signedIn,
    required TResult Function() signedUp,
    required TResult Function() signedOut,
    required TResult Function(String message) error,
  }) {
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? loading,
    TResult? Function(UserCredential? userCred)? signedIn,
    TResult? Function()? signedUp,
    TResult? Function()? signedOut,
    TResult? Function(String message)? error,
  }) {
    return signedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? loading,
    TResult Function(UserCredential? userCred)? signedIn,
    TResult Function()? signedUp,
    TResult Function()? signedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedIn value) signedIn,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_SignedOut value) signedOut,
    required TResult Function(_Error value) error,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SignedIn value)? signedIn,
    TResult? Function(_SignedUp value)? signedUp,
    TResult? Function(_SignedOut value)? signedOut,
    TResult? Function(_Error value)? error,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedIn value)? signedIn,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_SignedOut value)? signedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class _SignedOut implements AuthState {
  const factory _SignedOut() = _$SignedOutImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) loading,
    required TResult Function(UserCredential? userCred) signedIn,
    required TResult Function() signedUp,
    required TResult Function() signedOut,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? loading,
    TResult? Function(UserCredential? userCred)? signedIn,
    TResult? Function()? signedUp,
    TResult? Function()? signedOut,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? loading,
    TResult Function(UserCredential? userCred)? signedIn,
    TResult Function()? signedUp,
    TResult Function()? signedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedIn value) signedIn,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_SignedOut value) signedOut,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SignedIn value)? signedIn,
    TResult? Function(_SignedUp value)? signedUp,
    TResult? Function(_SignedOut value)? signedOut,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedIn value)? signedIn,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_SignedOut value)? signedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
