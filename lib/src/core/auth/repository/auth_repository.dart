import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';

class AuthRepository extends AppRepository {
  AuthRepository({required super.service});

  Future<void> createUserWithEmailAndPassword(AuthParams params) async {
    try {
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