part of 'create_report_cubit.dart';

@freezed
class CreateReportState with _$CreateReportState {
  const factory CreateReportState.initial() = _Initial;
  const factory CreateReportState.loading() = _Loading;
  const factory CreateReportState.success() = _Success;
  const factory CreateReportState.failed(String message) = _Failed;
}
