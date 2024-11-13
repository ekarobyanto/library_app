import 'package:library_app/src/core/config/app_repository.dart';

class AppUsersStat extends AppRepository {
  AppUsersStat({required super.service});

  Future<int> getTotalUsersRead() async {
    final response = await service.get('/read-total');
    return response.data['data'] as int;
  }

  Future<int> getTotalBooksUploaded() async {
    final response = await service.get('/book-total');
    return response.data['data'] as int;
  }
}
