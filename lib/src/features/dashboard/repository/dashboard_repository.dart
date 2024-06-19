import 'package:library_app/src/core/config/base_repository.dart';

class DashboardRepository extends BaseRepository {
  Future<void> getDashboardData() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }
}
