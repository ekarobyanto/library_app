part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.failed(String message) = _Failed;
  const factory ReportState.success(List<Report> reports) = _Success;
}
