import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_report_dto.freezed.dart';
part 'create_report_dto.g.dart';

@freezed
class CreateReportDto with _$CreateReportDto {
  const factory CreateReportDto({
    required String description,
    required String bookId,
  }) = _CreateReportDto;

  factory CreateReportDto.fromJson(Map<String, dynamic> json) =>
      _$CreateReportDtoFromJson(json);
}
