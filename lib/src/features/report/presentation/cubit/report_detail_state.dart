part of 'report_detail_cubit.dart';

@freezed
class ReportDetailState with _$ReportDetailState {
  const factory ReportDetailState.initial() = _Initial;
  const factory ReportDetailState.loading() = _Loading;
  const factory ReportDetailState.failed(String message) = _Failed;
  const factory ReportDetailState.success(ReportDetail report) = _Success;
}
