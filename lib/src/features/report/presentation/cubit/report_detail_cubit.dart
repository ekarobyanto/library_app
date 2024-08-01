import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/report/data/report_repository.dart';
import 'package:library_app/src/features/report/domain/report.dart';

part 'report_detail_state.dart';
part 'report_detail_cubit.freezed.dart';

class ReportDetailCubit extends Cubit<ReportDetailState> {
  final ReportRepository reportRepository;
  ReportDetailCubit(this.reportRepository)
      : super(const ReportDetailState.initial());

  getReportDetail(String id) async {
    emit(const ReportDetailState.loading());
    try {
      final res = await reportRepository.getReportDetail(id);
      emit(ReportDetailState.success(res));
    } catch (e) {
      emit(ReportDetailState.failed(e.toString()));
    }
  }
}
