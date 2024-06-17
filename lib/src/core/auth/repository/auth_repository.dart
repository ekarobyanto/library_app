import 'package:library_app/src/core/config/base_repository.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository extends BaseRepository {
  Future<void> createUserWithEmailAndPassword(AuthParams params) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final base = prefs.getString('base_url');
      await service.dio.post('/register', data: {
        "name": params.name,
        "email": params.email,
        "password": params.password,
      });
    } catch (e) {
      rethrow;
    }
  }
}
