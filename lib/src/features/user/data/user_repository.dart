import 'package:library_app/src/core/config/app_repository.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/user/data/domain/user_search.dart';
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

  Future<List<UserSearch>> searchUsers([String? query]) async {
    try {
      return await service.get('/user-search', params: {
        "name": query,
      }).then((res) {
        final data = res.data['data'] as List;
        return data.map((user) => UserSearch.fromJson(user)).toList();
      });
    } catch (err) {
      logger.e('UserRepository.searchUsers: $err');
      rethrow;
    }
  }
}
