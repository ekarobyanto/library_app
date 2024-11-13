import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/user/data/domain/user_stat.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';

part 'user_stat_state.dart';
part 'user_stat_cubit.freezed.dart';

class UserStatCubit extends Cubit<UserStatState> {
  final UserRepository userRepository;
  UserStatCubit(this.userRepository) : super(const UserStatState.loading());

  getUserStat() async {
    await userRepository.getUserStat().then((value) {
      emit(UserStatState.success(value));
    }).catchError((err) {
      emit(const UserStatState.failed());
    });
  }
}
