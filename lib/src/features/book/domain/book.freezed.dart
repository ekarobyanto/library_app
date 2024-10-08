// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Author? get author =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_url')
  String? get docUrl => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_count')
  int? get readCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_count')
  int? get favoriteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      Author? author,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      @JsonKey(name: 'doc_url') String? docUrl,
      List<String>? categories,
      @JsonKey(name: 'read_count') int? readCount,
      @JsonKey(name: 'favorite_count') int? favoriteCount,
      @JsonKey(name: 'is_favorite') bool? isFavorite});

  $AuthorCopyWith<$Res>? get author;
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? thumbnailUrl = freezed,
    Object? docUrl = freezed,
    Object? categories = freezed,
    Object? readCount = freezed,
    Object? favoriteCount = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      docUrl: freezed == docUrl
          ? _value.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
      favoriteCount: freezed == favoriteCount
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $AuthorCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      Author? author,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      @JsonKey(name: 'doc_url') String? docUrl,
      List<String>? categories,
      @JsonKey(name: 'read_count') int? readCount,
      @JsonKey(name: 'favorite_count') int? favoriteCount,
      @JsonKey(name: 'is_favorite') bool? isFavorite});

  @override
  $AuthorCopyWith<$Res>? get author;
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? thumbnailUrl = freezed,
    Object? docUrl = freezed,
    Object? categories = freezed,
    Object? readCount = freezed,
    Object? favoriteCount = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$BookImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      docUrl: freezed == docUrl
          ? _value.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
      favoriteCount: freezed == favoriteCount
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl implements _Book {
  _$BookImpl(
      {required this.id,
      this.name = '',
      this.description = '',
      this.author = null,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl = '',
      @JsonKey(name: 'doc_url') this.docUrl = '',
      final List<String>? categories = const [],
      @JsonKey(name: 'read_count') this.readCount = 0,
      @JsonKey(name: 'favorite_count') this.favoriteCount = 0,
      @JsonKey(name: 'is_favorite') this.isFavorite = false})
      : _categories = categories;

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final Author? author;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  @override
  @JsonKey(name: 'doc_url')
  final String? docUrl;
  final List<String>? _categories;
  @override
  @JsonKey()
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'read_count')
  final int? readCount;
  @override
  @JsonKey(name: 'favorite_count')
  final int? favoriteCount;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @override
  String toString() {
    return 'Book(id: $id, name: $name, description: $description, author: $author, createdAt: $createdAt, thumbnailUrl: $thumbnailUrl, docUrl: $docUrl, categories: $categories, readCount: $readCount, favoriteCount: $favoriteCount, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.docUrl, docUrl) || other.docUrl == docUrl) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.favoriteCount, favoriteCount) ||
                other.favoriteCount == favoriteCount) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      author,
      createdAt,
      thumbnailUrl,
      docUrl,
      const DeepCollectionEquality().hash(_categories),
      readCount,
      favoriteCount,
      isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  factory _Book(
      {required final String? id,
      final String? name,
      final String? description,
      final Author? author,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
      @JsonKey(name: 'doc_url') final String? docUrl,
      final List<String>? categories,
      @JsonKey(name: 'read_count') final int? readCount,
      @JsonKey(name: 'favorite_count') final int? favoriteCount,
      @JsonKey(name: 'is_favorite') final bool? isFavorite}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  Author? get author;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl;
  @override
  @JsonKey(name: 'doc_url')
  String? get docUrl;
  @override
  List<String>? get categories;
  @override
  @JsonKey(name: 'read_count')
  int? get readCount;
  @override
  @JsonKey(name: 'favorite_count')
  int? get favoriteCount;
  @override
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookLastRead _$BookLastReadFromJson(Map<String, dynamic> json) {
  return _BookLastRead.fromJson(json);
}

/// @nodoc
mixin _$BookLastRead {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get author =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_url')
  String? get docUrl => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_count')
  int? get readCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookLastReadCopyWith<BookLastRead> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookLastReadCopyWith<$Res> {
  factory $BookLastReadCopyWith(
          BookLastRead value, $Res Function(BookLastRead) then) =
      _$BookLastReadCopyWithImpl<$Res, BookLastRead>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? author,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      @JsonKey(name: 'doc_url') String? docUrl,
      List<String>? categories,
      @JsonKey(name: 'read_count') int? readCount,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class _$BookLastReadCopyWithImpl<$Res, $Val extends BookLastRead>
    implements $BookLastReadCopyWith<$Res> {
  _$BookLastReadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? thumbnailUrl = freezed,
    Object? docUrl = freezed,
    Object? categories = freezed,
    Object? readCount = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      docUrl: freezed == docUrl
          ? _value.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookLastReadImplCopyWith<$Res>
    implements $BookLastReadCopyWith<$Res> {
  factory _$$BookLastReadImplCopyWith(
          _$BookLastReadImpl value, $Res Function(_$BookLastReadImpl) then) =
      __$$BookLastReadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? author,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      @JsonKey(name: 'doc_url') String? docUrl,
      List<String>? categories,
      @JsonKey(name: 'read_count') int? readCount,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class __$$BookLastReadImplCopyWithImpl<$Res>
    extends _$BookLastReadCopyWithImpl<$Res, _$BookLastReadImpl>
    implements _$$BookLastReadImplCopyWith<$Res> {
  __$$BookLastReadImplCopyWithImpl(
      _$BookLastReadImpl _value, $Res Function(_$BookLastReadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? thumbnailUrl = freezed,
    Object? docUrl = freezed,
    Object? categories = freezed,
    Object? readCount = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$BookLastReadImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      docUrl: freezed == docUrl
          ? _value.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookLastReadImpl implements _BookLastRead {
  _$BookLastReadImpl(
      {required this.id,
      this.name = '',
      this.description = '',
      this.author = null,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl = '',
      @JsonKey(name: 'doc_url') this.docUrl = '',
      final List<String>? categories = const [],
      @JsonKey(name: 'read_count') this.readCount = 0,
      @JsonKey(name: 'is_favorite') this.isFavorite = false})
      : _categories = categories;

  factory _$BookLastReadImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookLastReadImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? author;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  @override
  @JsonKey(name: 'doc_url')
  final String? docUrl;
  final List<String>? _categories;
  @override
  @JsonKey()
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'read_count')
  final int? readCount;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @override
  String toString() {
    return 'BookLastRead(id: $id, name: $name, description: $description, author: $author, createdAt: $createdAt, thumbnailUrl: $thumbnailUrl, docUrl: $docUrl, categories: $categories, readCount: $readCount, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookLastReadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.docUrl, docUrl) || other.docUrl == docUrl) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      author,
      createdAt,
      thumbnailUrl,
      docUrl,
      const DeepCollectionEquality().hash(_categories),
      readCount,
      isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookLastReadImplCopyWith<_$BookLastReadImpl> get copyWith =>
      __$$BookLastReadImplCopyWithImpl<_$BookLastReadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookLastReadImplToJson(
      this,
    );
  }
}

abstract class _BookLastRead implements BookLastRead {
  factory _BookLastRead(
          {required final String? id,
          final String? name,
          final String? description,
          final String? author,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
          @JsonKey(name: 'doc_url') final String? docUrl,
          final List<String>? categories,
          @JsonKey(name: 'read_count') final int? readCount,
          @JsonKey(name: 'is_favorite') final bool? isFavorite}) =
      _$BookLastReadImpl;

  factory _BookLastRead.fromJson(Map<String, dynamic> json) =
      _$BookLastReadImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get author;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl;
  @override
  @JsonKey(name: 'doc_url')
  String? get docUrl;
  @override
  List<String>? get categories;
  @override
  @JsonKey(name: 'read_count')
  int? get readCount;
  @override
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$BookLastReadImplCopyWith<_$BookLastReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
