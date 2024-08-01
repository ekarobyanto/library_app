// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  BookReport get book => throw _privateConstructorUsedError;
  UserReport get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'reported_at')
  String get reportedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approved')
  bool get isApproved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {String id,
      String description,
      BookReport book,
      UserReport user,
      @JsonKey(name: 'reported_at') String reportedAt,
      @JsonKey(name: 'is_approved') bool isApproved});

  $BookReportCopyWith<$Res> get book;
  $UserReportCopyWith<$Res> get user;
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? book = null,
    Object? user = null,
    Object? reportedAt = null,
    Object? isApproved = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookReport,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserReport,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookReportCopyWith<$Res> get book {
    return $BookReportCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserReportCopyWith<$Res> get user {
    return $UserReportCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
          _$ReportImpl value, $Res Function(_$ReportImpl) then) =
      __$$ReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      BookReport book,
      UserReport user,
      @JsonKey(name: 'reported_at') String reportedAt,
      @JsonKey(name: 'is_approved') bool isApproved});

  @override
  $BookReportCopyWith<$Res> get book;
  @override
  $UserReportCopyWith<$Res> get user;
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
      _$ReportImpl _value, $Res Function(_$ReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? book = null,
    Object? user = null,
    Object? reportedAt = null,
    Object? isApproved = null,
  }) {
    return _then(_$ReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookReport,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserReport,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportImpl implements _Report {
  const _$ReportImpl(
      {required this.id,
      required this.description,
      required this.book,
      required this.user,
      @JsonKey(name: 'reported_at') required this.reportedAt,
      @JsonKey(name: 'is_approved') required this.isApproved});

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final BookReport book;
  @override
  final UserReport user;
  @override
  @JsonKey(name: 'reported_at')
  final String reportedAt;
  @override
  @JsonKey(name: 'is_approved')
  final bool isApproved;

  @override
  String toString() {
    return 'Report(id: $id, description: $description, book: $book, user: $user, reportedAt: $reportedAt, isApproved: $isApproved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.reportedAt, reportedAt) ||
                other.reportedAt == reportedAt) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, description, book, user, reportedAt, isApproved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportImplToJson(
      this,
    );
  }
}

abstract class _Report implements Report {
  const factory _Report(
          {required final String id,
          required final String description,
          required final BookReport book,
          required final UserReport user,
          @JsonKey(name: 'reported_at') required final String reportedAt,
          @JsonKey(name: 'is_approved') required final bool isApproved}) =
      _$ReportImpl;

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  BookReport get book;
  @override
  UserReport get user;
  @override
  @JsonKey(name: 'reported_at')
  String get reportedAt;
  @override
  @JsonKey(name: 'is_approved')
  bool get isApproved;
  @override
  @JsonKey(ignore: true)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookReport _$BookReportFromJson(Map<String, dynamic> json) {
  return _BookReport.fromJson(json);
}

/// @nodoc
mixin _$BookReport {
  String get id => throw _privateConstructorUsedError;
  String get bookName => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookReportCopyWith<BookReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookReportCopyWith<$Res> {
  factory $BookReportCopyWith(
          BookReport value, $Res Function(BookReport) then) =
      _$BookReportCopyWithImpl<$Res, BookReport>;
  @useResult
  $Res call(
      {String id,
      String bookName,
      String author,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl});
}

/// @nodoc
class _$BookReportCopyWithImpl<$Res, $Val extends BookReport>
    implements $BookReportCopyWith<$Res> {
  _$BookReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookName = null,
    Object? author = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookReportImplCopyWith<$Res>
    implements $BookReportCopyWith<$Res> {
  factory _$$BookReportImplCopyWith(
          _$BookReportImpl value, $Res Function(_$BookReportImpl) then) =
      __$$BookReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bookName,
      String author,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl});
}

/// @nodoc
class __$$BookReportImplCopyWithImpl<$Res>
    extends _$BookReportCopyWithImpl<$Res, _$BookReportImpl>
    implements _$$BookReportImplCopyWith<$Res> {
  __$$BookReportImplCopyWithImpl(
      _$BookReportImpl _value, $Res Function(_$BookReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookName = null,
    Object? author = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_$BookReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookReportImpl implements _BookReport {
  const _$BookReportImpl(
      {required this.id,
      required this.bookName,
      required this.author,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl = ''});

  factory _$BookReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookReportImplFromJson(json);

  @override
  final String id;
  @override
  final String bookName;
  @override
  final String author;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;

  @override
  String toString() {
    return 'BookReport(id: $id, bookName: $bookName, author: $author, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, bookName, author, thumbnailUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookReportImplCopyWith<_$BookReportImpl> get copyWith =>
      __$$BookReportImplCopyWithImpl<_$BookReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookReportImplToJson(
      this,
    );
  }
}

abstract class _BookReport implements BookReport {
  const factory _BookReport(
          {required final String id,
          required final String bookName,
          required final String author,
          @JsonKey(name: 'thumbnail_url') final String thumbnailUrl}) =
      _$BookReportImpl;

  factory _BookReport.fromJson(Map<String, dynamic> json) =
      _$BookReportImpl.fromJson;

  @override
  String get id;
  @override
  String get bookName;
  @override
  String get author;
  @override
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl;
  @override
  @JsonKey(ignore: true)
  _$$BookReportImplCopyWith<_$BookReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserReport _$UserReportFromJson(Map<String, dynamic> json) {
  return _UserReport.fromJson(json);
}

/// @nodoc
mixin _$UserReport {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReportCopyWith<UserReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReportCopyWith<$Res> {
  factory $UserReportCopyWith(
          UserReport value, $Res Function(UserReport) then) =
      _$UserReportCopyWithImpl<$Res, UserReport>;
  @useResult
  $Res call({String id, String userName});
}

/// @nodoc
class _$UserReportCopyWithImpl<$Res, $Val extends UserReport>
    implements $UserReportCopyWith<$Res> {
  _$UserReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserReportImplCopyWith<$Res>
    implements $UserReportCopyWith<$Res> {
  factory _$$UserReportImplCopyWith(
          _$UserReportImpl value, $Res Function(_$UserReportImpl) then) =
      __$$UserReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userName});
}

/// @nodoc
class __$$UserReportImplCopyWithImpl<$Res>
    extends _$UserReportCopyWithImpl<$Res, _$UserReportImpl>
    implements _$$UserReportImplCopyWith<$Res> {
  __$$UserReportImplCopyWithImpl(
      _$UserReportImpl _value, $Res Function(_$UserReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
  }) {
    return _then(_$UserReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserReportImpl implements _UserReport {
  const _$UserReportImpl({required this.id, required this.userName});

  factory _$UserReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserReportImplFromJson(json);

  @override
  final String id;
  @override
  final String userName;

  @override
  String toString() {
    return 'UserReport(id: $id, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReportImplCopyWith<_$UserReportImpl> get copyWith =>
      __$$UserReportImplCopyWithImpl<_$UserReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserReportImplToJson(
      this,
    );
  }
}

abstract class _UserReport implements UserReport {
  const factory _UserReport(
      {required final String id,
      required final String userName}) = _$UserReportImpl;

  factory _UserReport.fromJson(Map<String, dynamic> json) =
      _$UserReportImpl.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$UserReportImplCopyWith<_$UserReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
