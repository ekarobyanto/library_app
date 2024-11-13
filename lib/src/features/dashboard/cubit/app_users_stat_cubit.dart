import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/dashboard/data/app_users_stat.dart';

part 'app_users_stat_state.dart';
part 'app_users_stat_cubit.freezed.dart';

class AppUsersStatCubit extends Cubit<AppUsersStatState> {
  final AppUsersStat _appUsersStatRepository;
  AppUsersStatCubit(this._appUsersStatRepository)
      : super(const AppUsersStatState.initial());

  getAppUsersStat() async {
    try {
      final totalUsersRead = await _appUsersStatRepository.getTotalUsersRead();
      final totalBooksUploaded =
          await _appUsersStatRepository.getTotalBooksUploaded();
      emit(AppUsersStatState.success({
        'totalUsersRead': totalUsersRead,
        'totalBooksUploaded': totalBooksUploaded,
      }));
    } catch (e) {
      emit(const AppUsersStatState.failed());
    }
  }
}
