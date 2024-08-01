import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/report/data/report_repository.dart';
import 'package:library_app/src/features/report/domain/report.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportRepository reportRepository;
  ReportCubit(this.reportRepository) : super(const ReportState.initial());

  void getUserReport() async {
    emit(const ReportState.loading());
    try {
      final report = await reportRepository.getUserReport();
      if (report.isEmpty) {
        emit(const ReportState.failed('No report found'));
      } else {
        emit(ReportState.success(report));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        emit(const ReportState.failed('Unauthorized'));
      } else {
        emit(ReportState.failed(e.response?.data ?? e.message));
      }
    } catch (e) {
      logger.e(e);
      emit(ReportState.failed(e.toString()));
    }
  }

  void getAllReport() async {
    emit(const ReportState.loading());
    try {
      final report = await reportRepository.getAllReport();
      if (report.isEmpty) {
        emit(const ReportState.failed('No report found'));
      } else {
        emit(ReportState.success(report));
      }
    } catch (e) {
      logger.e(e);
      emit(ReportState.failed(e.toString()));
    }
  }

  getReport(bool isAdmin) {
    if (isAdmin) {
      getAllReport();
    } else {
      getUserReport();
    }
  }
}
