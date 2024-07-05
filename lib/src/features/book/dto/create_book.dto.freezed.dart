// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_book.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateBookDTO _$CreateBookDTOFromJson(Map<String, dynamic> json) {
  return _CreateBookDTO.fromJson(json);
}

/// @nodoc
mixin _$CreateBookDTO {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_url')
  String get docUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBookDTOCopyWith<CreateBookDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookDTOCopyWith<$Res> {
  factory $CreateBookDTOCopyWith(
          CreateBookDTO value, $Res Function(CreateBookDTO) then) =
      _$CreateBookDTOCopyWithImpl<$Res, CreateBookDTO>;
  @useResult
  $Res call(
      {String title,
      String description,
      @JsonKey(name: 'doc_url') String docUrl,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      List<String> categories});
}

/// @nodoc
class _$CreateBookDTOCopyWithImpl<$Res, $Val extends CreateBookDTO>
    implements $CreateBookDTOCopyWith<$Res> {
  _$CreateBookDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? docUrl = null,
    Object? thumbnailUrl = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      docUrl: null == docUrl
          ? _value.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBookDTOImplCopyWith<$Res>
    implements $CreateBookDTOCopyWith<$Res> {
  factory _$$CreateBookDTOImplCopyWith(
          _$CreateBookDTOImpl value, $Res Function(_$CreateBookDTOImpl) then) =
      __$$CreateBookDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      @JsonKey(name: 'doc_url') String docUrl,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      List<String> categories});
}

/// @nodoc
class __$$CreateBookDTOImplCopyWithImpl<$Res>
    extends _$CreateBookDTOCopyWithImpl<$Res, _$CreateBookDTOImpl>
    implements _$$CreateBookDTOImplCopyWith<$Res> {
  __$$CreateBookDTOImplCopyWithImpl(
      _$CreateBookDTOImpl _value, $Res Function(_$CreateBookDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? docUrl = null,
    Object? thumbnailUrl = null,
    Object? categories = null,
  }) {
    return _then(_$CreateBookDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      docUrl: null == docUrl
          ? _value.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBookDTOImpl implements _CreateBookDTO {
  _$CreateBookDTOImpl(
      {required this.title,
      required this.description,
      @JsonKey(name: 'doc_url') required this.docUrl,
      @JsonKey(name: 'thumbnail_url') required this.thumbnailUrl,
      required final List<String> categories})
      : _categories = categories;

  factory _$CreateBookDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBookDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'doc_url')
  final String docUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CreateBookDTO(title: $title, description: $description, docUrl: $docUrl, thumbnailUrl: $thumbnailUrl, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBookDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.docUrl, docUrl) || other.docUrl == docUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, docUrl,
      thumbnailUrl, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBookDTOImplCopyWith<_$CreateBookDTOImpl> get copyWith =>
      __$$CreateBookDTOImplCopyWithImpl<_$CreateBookDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBookDTOImplToJson(
      this,
    );
  }
}

abstract class _CreateBookDTO implements CreateBookDTO {
  factory _CreateBookDTO(
      {required final String title,
      required final String description,
      @JsonKey(name: 'doc_url') required final String docUrl,
      @JsonKey(name: 'thumbnail_url') required final String thumbnailUrl,
      required final List<String> categories}) = _$CreateBookDTOImpl;

  factory _CreateBookDTO.fromJson(Map<String, dynamic> json) =
      _$CreateBookDTOImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'doc_url')
  String get docUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl;
  @override
  List<String> get categories;
  @override
  @JsonKey(ignore: true)
  _$$CreateBookDTOImplCopyWith<_$CreateBookDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
