import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';

class AuthRepository extends AppRepository {
  AuthRepository({required super.service});

  signOut() async {
    super.prefs.remove('token');
  }

  Future<void> createUserWithEmailAndPassword(AuthParams params) async {
    try {
      await service.post('/register', data: {
        "name": params.name,
        "email": params.email,
        "password": params.password,
      });
    } catch (e) {
      rethrow;
    }
  }
}
