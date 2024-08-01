import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/domain/book.dart';

part 'all_book_state.dart';
part 'all_book_cubit.freezed.dart';

class AllBookCubit extends Cubit<AllBookState> {
  final BookRepository bookRepository;
  AllBookCubit(this.bookRepository) : super(const AllBookState.initial());

  getAllBook() async {
    emit(const AllBookState.loading());
    try {
      final book = await bookRepository.getBooksFromUrl(url: '/book');
      if (book.isEmpty) {
        emit(const AllBookState.failed('No book found'));
      } else {
        emit(AllBookState.succces(book));
      }
    } catch (e) {
      emit(AllBookState.failed(e.toString()));
    }
  }
}
