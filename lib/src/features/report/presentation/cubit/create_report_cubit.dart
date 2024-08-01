import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/report/data/report_repository.dart';
import 'package:library_app/src/features/report/dto/create_report_dto.dart';

part 'create_report_state.dart';
part 'create_report_cubit.freezed.dart';

class CreateReportCubit extends Cubit<CreateReportState> {
  final ReportRepository reportRepository;
  CreateReportCubit(this.reportRepository)
      : super(const CreateReportState.initial());

  createReport(CreateReportDto report) async {
    emit(const CreateReportState.loading());
    try {
      await reportRepository.createReport(report);
      emit(const CreateReportState.success());
    } catch (e) {
      emit(CreateReportState.failed(e.toString()));
    }
  }
}
