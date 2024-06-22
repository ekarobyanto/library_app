import 'package:library_app/src/core/config/app_repository.dart';

class DashboardRepository extends AppRepository {
  DashboardRepository({required super.service});

  Future<void> getDashboardData() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }
}
