import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/features/report/domain/report.dart';
import 'package:library_app/src/features/report/dto/create_report_dto.dart';

class ReportRepository extends AppRepository {
  ReportRepository({required super.service});

  Future<List<Report>> getUserReport() async {
    final res = await service.get('/my-report');
    if (res.data["data"] == null) return [];
    return (res.data["data"] as List).map((e) => Report.fromJson(e)).toList();
  }

  Future<List<Report>> getAllReport() async {
    final res = await service.get('/reports');
    if (res.data["data"] == null) return [];
    return (res.data["data"] as List).map((e) => Report.fromJson(e)).toList();
  }

  Future<void> createReport(CreateReportDto report) async {
    try {
      await service.post(
        '/report',
        data: report.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
