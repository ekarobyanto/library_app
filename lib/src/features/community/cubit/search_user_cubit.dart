import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/user/data/domain/user_search.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';

part 'search_user_state.dart';
part 'search_user_cubit.freezed.dart';

class SearchUserCubit extends Cubit<SearchUserState> {
  final UserRepository _userRepository;
  SearchUserCubit(this._userRepository)
      : super(const SearchUserState.initial());

  Future<void> searchUser([String? query]) async {
    try {
      emit(const SearchUserState.loading());
      final result = await _userRepository.searchUsers(query);
      emit(SearchUserState.success(result));
    } catch (err) {
      logger.e(err);
      emit(const SearchUserState.failed("Failed to search user"));
    }
  }
}
