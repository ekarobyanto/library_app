// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatList _$ChatListFromJson(Map<String, dynamic> json) {
  return _ChatList.fromJson(json);
}

/// @nodoc
mixin _$ChatList {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get recipientId => throw _privateConstructorUsedError;
  String? get recipientName => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatListCopyWith<ChatList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListCopyWith<$Res> {
  factory $ChatListCopyWith(ChatList value, $Res Function(ChatList) then) =
      _$ChatListCopyWithImpl<$Res, ChatList>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String recipientId,
      String? recipientName,
      String lastMessage,
      String timestamp});
}

/// @nodoc
class _$ChatListCopyWithImpl<$Res, $Val extends ChatList>
    implements $ChatListCopyWith<$Res> {
  _$ChatListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? recipientId = null,
    Object? recipientName = freezed,
    Object? lastMessage = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatListImplCopyWith<$Res>
    implements $ChatListCopyWith<$Res> {
  factory _$$ChatListImplCopyWith(
          _$ChatListImpl value, $Res Function(_$ChatListImpl) then) =
      __$$ChatListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String recipientId,
      String? recipientName,
      String lastMessage,
      String timestamp});
}

/// @nodoc
class __$$ChatListImplCopyWithImpl<$Res>
    extends _$ChatListCopyWithImpl<$Res, _$ChatListImpl>
    implements _$$ChatListImplCopyWith<$Res> {
  __$$ChatListImplCopyWithImpl(
      _$ChatListImpl _value, $Res Function(_$ChatListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? recipientId = null,
    Object? recipientName = freezed,
    Object? lastMessage = null,
    Object? timestamp = null,
  }) {
    return _then(_$ChatListImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatListImpl implements _ChatList {
  _$ChatListImpl(
      {required this.id,
      required this.userId,
      required this.recipientId,
      this.recipientName,
      required this.lastMessage,
      required this.timestamp});

  factory _$ChatListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String recipientId;
  @override
  final String? recipientName;
  @override
  final String lastMessage;
  @override
  final String timestamp;

  @override
  String toString() {
    return 'ChatList(id: $id, userId: $userId, recipientId: $recipientId, recipientName: $recipientName, lastMessage: $lastMessage, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, recipientId,
      recipientName, lastMessage, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListImplCopyWith<_$ChatListImpl> get copyWith =>
      __$$ChatListImplCopyWithImpl<_$ChatListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListImplToJson(
      this,
    );
  }
}

abstract class _ChatList implements ChatList {
  factory _ChatList(
      {required final String id,
      required final String userId,
      required final String recipientId,
      final String? recipientName,
      required final String lastMessage,
      required final String timestamp}) = _$ChatListImpl;

  factory _ChatList.fromJson(Map<String, dynamic> json) =
      _$ChatListImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get recipientId;
  @override
  String? get recipientName;
  @override
  String get lastMessage;
  @override
  String get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ChatListImplCopyWith<_$ChatListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
