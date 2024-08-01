import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/domain/book.dart';

part 'all_book_state.dart';
part 'all_book_cubit.freezed.dart';

class AllBookCubit extends Cubit<AllBookState> {
  AllBookCubit() : super(AllBookState.initial());
}
