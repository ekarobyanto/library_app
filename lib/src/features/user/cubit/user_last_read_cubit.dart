import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';

part 'user_last_read_state.dart';
part 'user_last_read_cubit.freezed.dart';

class UserLastReadCubit extends Cubit<UserLastReadState> {
  final UserRepository userRepository;
  UserLastReadCubit(this.userRepository)
      : super(const UserLastReadState.loading());

  getUserLastRead() {
    userRepository.getUserLastRead().then((value) {
      logger.i('UserLastReadCubit.getUserLastRead: $value');
      emit(UserLastReadState.success(value));
    }).catchError((error) {
      logger.e('UserLastReadCubit.getUserLastRead: $error');
      emit(const UserLastReadState.failed());
    });
  }
}
