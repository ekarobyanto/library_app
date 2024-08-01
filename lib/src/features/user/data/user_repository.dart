import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/user/data/domain/user_stat.dart';

class UserRepository extends AppRepository {
  UserRepository({required super.service});

  Future<UserStat> getUserStat() async {
    try {
      return await service.get('/book-stats').then((res) {
        logger.i('UserRepository.getUserStat: ${res.data}');
        return UserStat.fromJson(res.data['data']);
      });
    } catch (err) {
      logger.e('UserRepository.getUserStat: $err');
      rethrow;
    }
  }

  Future<BookLastRead> getUserLastRead() async {
    try {
      return await service.get('/book-last-reads').then((res) {
        logger.i('UserRepository.getUserLastRead: ${res.data}');
        return BookLastRead.fromJson(res.data['data']);
      });
    } catch (err) {
      logger.e('UserRepository.getUserLastRead: $err');
      rethrow;
    }
  }
}
